class UsersController < ApplicationController

  def index
    @book = Book.new
    @user_current = current_user
     @user = User.new
    @users = User.all
  end

  def show
     @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) if @user != current_user
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path
   else
    render :edit
   end
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end


end


