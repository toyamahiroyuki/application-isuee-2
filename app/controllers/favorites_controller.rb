class FavoritesController < ApplicationController
def create
  book = Book.find(params[:book_id])
  user = current_user
  favorite = Favorite.new(book_id: book.id,user_id: user.id)
  favorite.save
  redirect_back(fallback_location: root_path)
end

def destroy
  book = Book.find(params[:book_id])
  # favorite = Favorite.find(params[:book_id])
  favorite = current_user.favorites.find_by(book_id: book.id)
  favorite.destroy
  redirect_back(fallback_location: root_path)
end

end
