Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F340A11D53
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E416710E59F;
	Wed, 15 Jan 2025 09:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wpRSSMeK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6B710E5A3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:20:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3977E5C542B;
 Wed, 15 Jan 2025 09:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B648C4CEDF;
 Wed, 15 Jan 2025 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1736932855;
 bh=cWqYGqRDV5mWWl7ey8RTzlhW9gOdlvdVh3zHhel2C7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wpRSSMeKiYJyK4Vj1zBC/ITBz1umDYlfRSNvzm+gyOn7iGtPRuqF07MPgJG9w5Kb3
 HgzUTO9aRmkF+3qyK6sGKitVo0xZ+o/0KD8vKL4du+m27GxxET+r5WyixnBMTDp2CT
 0ZrwZ1pg874GvdR9pPUYsT1Tx9PGhiMfLfb5Adxw=
Date: Wed, 15 Jan 2025 10:20:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <2025011506-gloater-zoning-ad41@gregkh>
References: <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
 <2025011247-spoilage-hamster-28b2@gregkh>
 <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
 <2025011352-fox-wrangle-4d3f@gregkh>
 <CAPM=9tzkJ=dn2gq7GcvtN_C95ZzxwC7XMMXHBrwF6Ez6fYfU=g@mail.gmail.com>
 <Z4Z8rQKR2QEaWNyI@phenom.ffwll.local> <Z4aIGvAmMld_uztJ@lappy>
 <CADnq5_OtYOcf3k1j+xqXpeaRymYZvr8nSX9bnGHQQ6RT24uyFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_OtYOcf3k1j+xqXpeaRymYZvr8nSX9bnGHQQ6RT24uyFA@mail.gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2025 at 11:11:42AM -0500, Alex Deucher wrote:
> On Tue, Jan 14, 2025 at 11:02 AM Sasha Levin <sashal@kernel.org> wrote:
> >
> > On Tue, Jan 14, 2025 at 04:03:09PM +0100, Simona Vetter wrote:
> > >On Tue, Jan 14, 2025 at 11:01:34AM +1000, Dave Airlie wrote:
> > >> > > > We create a "web" when we backport commits, and mark things for "Fixes:"
> > >> > > > When we get those ids wrong because you all have duplicate commits for
> > >> > > > the same thing, everything breaks.
> > >> > > >
> > >> > > > > I just don't get what the ABI the tools expect is, and why everyone is
> > >> > > > > writing bespoke tools and getting it wrong, then blaming us for not
> > >> > > > > conforming. Fix the tools or write new ones when you realise the
> > >> > > > > situation is more complex than your initial ideas.
> > >> > > >
> > >> > > > All I want to see and care about is:
> > >> > > >
> > >> > > >  - for a stable commit, the id that the commit is in Linus's tree.
> > >> > > >  - for a Fixes: tag, the id that matches the commit in Linus's tree AND
> > >> > > >    the commit that got backported to stable trees.
> > >> > > >
> > >> > > > That's it, that's the whole "ABI".  The issue is that you all, for any
> > >> > > > number of commits, have 2 unique ids for any single commit and how are
> > >> > > > we supposed to figure that mess out...
> > >> > >
> > >> > > Pretty sure we've explained how a few times now, not sure we can do much more.
> > >> >
> > >> > And the same for me.
> > >> >
> > >> > > If you see a commit with a cherry-pick link in it and don't have any
> > >> > > sight on that commit in Linus's tree, ignore the cherry-pick link in
> > >> > > it, assume it's a future placeholder for that commit id. You could if
> > >> > > you wanted to store that info somewhere, but there shouldn't be a
> > >> > > need.
> > >> >
> > >> > Ok, this is "fine", I can live with it.  BUT that's not the real issue
> > >> > (and your own developers get confused by this, again, look at the
> > >> > original email that started this all, they used an invalid git id to
> > >> > send to us thinking that was the correct id to use.)
> > >>
> > >> I'm going to go back and look at the one you pointed out as I'm
> > >> missing the issue with it, I thought it was due to a future ID being
> > >> used.
> > >
> > >I think the issue is that with the cherry-picking we do, we don't update
> > >the Fixes: or Reverts: lines, so those still point at the og commit in
> > >-next, while the cherry-picked commit is in -fixes.
> > >
> > >The fix for that (which our own cherry-pick scripts implement iirc) is to
> > >keep track of the cherry-picks (which is why we add that line) and treat
> > >them as aliases.
> > >
> > >So if you have a Fixes: $sha1 pointing at -next, then if you do a
> > >full-text commit message search for (cherry picked from $sha1), you should
> > >be able to find it.
> > >
> > >We could try to do that lookup with the cherry-pick scripts, but a lot of
> > >folks hand-roll these, so it's lossy at best. Plus you already have to
> > >keep track of aliases anyway since you're cherry-picking to stable, so I
> > >was assuming that this shouldn't cause additional issues.
> > >
> > >The other part is that if you already have a cherry picked from $sha1 in
> > >your history, even if it wasn't done with stable cherry-pick, then you
> > >don't have to cherry-pick again. These should be easy to filter out.
> > >
> > >But maybe I'm also not understanding what the issue is, I guess would need
> > >to look at a specific example.
> > >
> > >> > > When future tools are analysing things, they will see the patch from
> > >> > > the merge window, the cherry-picked patches in the fixes tree, and
> > >> > > stable will reference the fixes, and the fixes patch will reference
> > >> > > the merge window one?
> > >> >
> > >> >
> > >> > > but I think when we cherry-pick patches from -next that fix
> > >> > > other patches from -next maybe the fixes lines should be reworked to
> > >> > > reference the previous Linus tree timeline not the future one. not
> > >> > > 100% sure this happens? Sima might know more.
> > >> >
> > >> > Please fix this up, if you all can.  That is the issue here.  And again,
> > >> > same for reverts.
> > >> >
> > >> > I think between the two, this is causing many fixes and reverts to go
> > >> > unresolved in the stable trees.
> > >> >
> > >> > > Now previously I think we'd be requested to remove the cherry-picks
> > >> > > from the -fixes commits as they were referencing things not in Linus'
> > >> > > tree, we said it was a bad idea, I think we did it anyways, we got
> > >> > > shouted at, we put it back, we get shouted that we are referencing
> > >> > > commits that aren't in Linus tree. Either the link is useful
> > >> > > information and we just assume cherry-picks of something we can't see
> > >> > > are a future placeholder and ignore it until it shows up in our
> > >> > > timeline.
> > >> >
> > >> > I still think it's lunacy to have a "cherry pick" commit refer to a
> > >> > commit that is NOT IN THE TREE YET and shows up in history as "IN THE
> > >> > FUTURE".  But hey, that's just me.
> > >> >
> > >> > Why do you have these markings at all?  Who are they helping?  Me?
> > >> > Someone else?
> > >>
> > >> They are for helping you. Again if the commit that goes into -next is immutable,
> > >> there is no way for it to reference the commit that goes into -fixes
> > >> ahead of it.
> > >>
> > >> The commit in -fixes needs to add the link to the future commit in
> > >> -next, that link is the cherry-pick statement.
> > >>
> > >> When you get the future commit into the stable queue, you look for the
> > >> commit id in stable history as a cherry-pick and drop it if it's
> > >> already there.
> > >>
> > >> I can't see any other way to do this, the future commit id is a
> > >> placeholder in Linus/stable tree, the commit is immutable and 99.99%
> > >> of the time it will arrive at some future point in time.
> > >>
> > >> I'm open to how you would make this work that isn't lunacy, but I
> > >> can't really see a way since git commits are immutable.
> > >
> > >Yeah the (cherry picked from $sha1) with a sha1 that's in -next and almost
> > >always shows up in Linus' tree in the future shouldn't be an issue. That
> > >part really is required for driver teams to manage their flows.
> > >
> > >> > > I think we could ask to not merge things into -next with stable cc'ed
> > >> > > but I think that will result in a loss of valuable fixes esp for
> > >> > > backporters.
> > >> >
> > >> > Again, it's the Fixes and Reverts id referencing that is all messed up
> > >> > here.  That needs to be resolved.  If it takes you all the effort to
> > >> > make up a special "stable tree only" branch/series/whatever, I'm all for
> > >> > it, but as it is now, what you all are doing is NOT working for me at
> > >> > all.
> > >>
> > >> I'll have to see if anyone is willing to consider pulling this sort of
> > >> feat off, it's not a small task, and it would have to be 99% automated
> > >> I think to be not too burdensome.
> > >
> > >It's not that hard to script, dim cherry-pick already does it. It's the
> > >part where we need to guarantee that we never ever let one slip through
> > >didn't get this treatment of replacing the sha1.
> > >
> > >The even more insideous one is when people rebase their -next or -fixes
> > >trees, since then the sha1 will really never ever show up. Which is why
> > >we're telling people to not mess with git history at all and instead
> > >cherry-pick. It's the lesser pain.
> >
> > But this does happen with cherry picks... A few examples from what I saw
> > with drivers/gpu/drm/ and -stable:
> >
> > 5a507b7d2be1 ("drm/mst: Fix NULL pointer dereference at
> > drm_dp_add_payload_part2") which landed as 8a0a7b98d4b6 ("drm/mst: Fix
> > NULL pointer dereference at drm_dp_add_payload_part2") rather than
> > 4545614c1d8da.
> >
> > e89afb51f97a ("drm/vmwgfx: Fix a 64bit regression on svga3") which
> > landed as c2aaa37dc18f ("drm/vmwgfx: Fix a 64bit regression on svga3")
> > rather than 873601687598.
> >
> > a829f033e966 ("drm/i915: Wedge the GPU if command parser setup fails")
> > which indicates it's a cherry-pick, but I couldn't find the equivalent
> > commit landing at any point later on.
> >
> >
> > Or the following 3 commits:
> >
> > 0811b9e4530d ("drm/amd/display: Add HUBP surface flip interrupt
> > handler") which has a stable tag, and no cherry-pick line.
> >
> > 4ded1ec8d1b3 ("drm/amd/display: Add HUBP surface flip interrupt
> > handler") which is a different code change than the previous commit, and
> > a completely different commit message, no stable tag, and no cherry-pick
> > line.
> >
> > 7af87fc1ba13 ("drm/amd/display: Add HUBP surface flip interrupt
> > handler") which has the same code change as above, and it has the same
> > commit message as 4ded1ec8d1b3 but with an added stable tag, and again -
> > no cherry-pick line.
> 
> In fairness, these pre-dated the amdgpu tree using cherry-pick -x.  I
> had stopped doing that for a while because I kept getting yelled at
> for referencing commits that were only in -next.  I've since started
> using -x when I need to cherry-pick a fix to -fixes.

Ok, here's the most recent one that I tripped over, and the CVE
community hit as well (a CVE consumer reported the problem to me):
	a6dd15981c03 ("drm/amdgpu: prevent NULL pointer dereference if ATIF is not supported")
which showed up in the 6.12 release (6.12-rc6 to be specific), but yet
has the line:
	Fixes: c9b7c809b89f ("drm/amd: Guard against bad data for ATIF ACPI method")
while that commit was NOT in Linus's tree and did not get there until
6.13-rc1.

So here we have a commit that claims it fixes a commit that is not yet
in the tree.  This of course caused havoc with tools that assumed that
if a commit says it fixes something, that fix is in the tree already
(i.e. the CVE assignment scripts.)  After much digging around, it turns
out that the _REAL_ fixes commit id was:
	bf58f03931fd ("drm/amd: Guard against bad data for ATIF ACPI method")
which really showed up in 6.12-rc5 (and was backported to stable commits
as it too claimed to solve a problem in those kernels.)

So this is a real problem, and shows up and we have to then explain to
external people, "no, what that commit says really isn't true, it's
really fixing this other commit over there which is why we applied it
and why we had to manually mark this CVE as THAT commit being the
offending one, not this other one over there...)

So again, if you all wish to keep your current workflow, wonderful, but
realize it has consequences.  Those consequences are stable maintainers
that are loath to touch these patches, CVE maintainers who cringe every
time they see a DRM patch being assigned a CVE and hope that the tags
are correct and they don't have to manually research it to determine if
it is right or not (remember, we assign 8 CVEs a day, that workload does
not lend itself to hand-holding at all) and also there are confused
users when they try to determine where a fix should be applied to
because they want to not follow the stable kernels and do their own
thing (RHEL, SLES, ChromeOS, cloud-monstrosities, etc.)

I'm trying to point out "your workflow is causing problems."  If you
want to ignore that statement, fine.  But that doesn't mean it's not a
valid statement.

greg k-h
