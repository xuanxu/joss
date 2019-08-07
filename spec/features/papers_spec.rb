require "rails_helper"

describe "Papers" do

    scenario "Index" do
        papers = [create(:accepted_paper), create(:accepted_paper), create(:accepted_paper)]

        visit papers_path

        expect(page).to have_selector(".paper-list .paper-card", count: 3)
        papers.each do |paper|
          within(".paper-list") do
            expect(page).to have_content paper.title
            expect(page).to have_css("a[href='#{paper_path(paper)}']", text: paper.title)
            expect(page).to have_content paper.submitting_author.pretty_github_username
          end
        end
    end

end