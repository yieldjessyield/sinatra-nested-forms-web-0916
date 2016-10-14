require './environment'

module FormsLab
  class App < Sinatra::Base
set :views, Proc.new { File.join(root, "views/pirates") }

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |ship_details|
        Ship.new(ship_details)

      end
      @all_ships = Ship.all
      erb :'/show'

      #erb :'pirates/show'
    end

  end
end
