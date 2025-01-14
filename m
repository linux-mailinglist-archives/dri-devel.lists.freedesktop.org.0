Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F9A10DD5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F6110E40D;
	Tue, 14 Jan 2025 17:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GNrp05jh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B46110E40D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:32:30 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so1216296066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 09:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736875889; x=1737480689; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l+t+O4kXNvzNulYskbcr1Hqf6WMft5z4Yng45ms/3No=;
 b=GNrp05jhCquK3RYHno/vmkW46OB8d3BvW/NF3l0I16Q1U6HFQ2mjOZh+kmomn+PhZN
 FnJhKzDvTRSZ9bWRvhslmWTISZIhjAJs8fPC0dBYY4SSwhJ1vJ7S1WogXDZvKUZfBWa+
 YrsaCv6S79DjR11IQxYXsJJlz/Cwo6eOukgHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736875889; x=1737480689;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+t+O4kXNvzNulYskbcr1Hqf6WMft5z4Yng45ms/3No=;
 b=by2h+pCNayN3XRvuLZQIgIuwfuvKhVxzCmRSOtAO1Io/FHii0xjuF8yQkSV8WlsWTB
 vxp4842AMS/Pc30dyCLdNWWosv58RvA7fovMPv2k1Zxkr36Fzq1dlDUpgvyfeadQU6KI
 ZMjD582qpSkBBVah1mX0q0DCRktt0n165gokRZxhAkk1nIRBFkOkHSeV7EKc4FkoSyqB
 EJrFX5NJe+Q9swLI98ZoHFOxiNaHG5YSq05ttdqTsWuEkioGnVokK5PSamQpNgrvjQgw
 TdnVtBtP4L8BqnwtgHabMAuZ3v4Co1K/aY0lONcE0TBevd4fqQwjvL7mlLd6O++sfNJY
 2klA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDVCiMkjxdv5oDLisOm2rGXOA0XgJ3kR8rmY0iypku4mHCoGH6B0I1BEfx79affwPaCdhZFxinnD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMHhOcUUbt+3zonQAh+KzqtvcR9PrMDOZ3eMIJKTSjGAAQ5+00
 Yg1jUwWZxVfcHayVNnMahkiZ+3Y2ZXwi4Px6citJZEzsD9QfOg7aaYMJgQQj7qI=
X-Gm-Gg: ASbGncu86cpubx7PF/rlroUGs51/jM/IjVBPHWz1J7I8iznWAZ3MwqfaC31mY7rTocq
 t49tKHV+KZCcxkGZKNxhrcDks5H3zLzxF3GUUVuzMSe/890KLCQQ0Xy3RDEM7b7EzG7o7Alpy4S
 8iiKm3TFUYtrKSRjp+hicm+oS9m1KBtE3RU2vppHvbIw++aucGE+8acsJ/RaQh+ckJcNPKLFsow
 1AW31baeWmhZNfWlwhbuc9q2r6GIFVZiEyFSTHF/K4mro3dP0vxZne9EIUWuQKp5f2g
X-Google-Smtp-Source: AGHT+IEGoBDIAgYJBWrIFzFgdgMonC8p8M2XuZgFYsuIxX1JE2o2qpu4KNnmUX+avPDlgC6gqCFjhg==
X-Received: by 2002:a17:907:6093:b0:ab3:47ca:2ece with SMTP id
 a640c23a62f3a-ab347ca9c1cmr86818366b.8.1736875888913; 
 Tue, 14 Jan 2025 09:31:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b1d53sm649888466b.152.2025.01.14.09.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 09:31:28 -0800 (PST)
Date: Tue, 14 Jan 2025 18:31:26 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Sasha Levin <sashal@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <Z4afbuFN1uc3zhOt@phenom.ffwll.local>
References: <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
 <2025011247-spoilage-hamster-28b2@gregkh>
 <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
 <2025011352-fox-wrangle-4d3f@gregkh>
 <CAPM=9tzkJ=dn2gq7GcvtN_C95ZzxwC7XMMXHBrwF6Ez6fYfU=g@mail.gmail.com>
 <Z4Z8rQKR2QEaWNyI@phenom.ffwll.local> <Z4aIGvAmMld_uztJ@lappy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4aIGvAmMld_uztJ@lappy>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Tue, Jan 14, 2025 at 10:51:54AM -0500, Sasha Levin wrote:
> On Tue, Jan 14, 2025 at 04:03:09PM +0100, Simona Vetter wrote:
> > On Tue, Jan 14, 2025 at 11:01:34AM +1000, Dave Airlie wrote:
> > > > > > We create a "web" when we backport commits, and mark things for "Fixes:"
> > > > > > When we get those ids wrong because you all have duplicate commits for
> > > > > > the same thing, everything breaks.
> > > > > >
> > > > > > > I just don't get what the ABI the tools expect is, and why everyone is
> > > > > > > writing bespoke tools and getting it wrong, then blaming us for not
> > > > > > > conforming. Fix the tools or write new ones when you realise the
> > > > > > > situation is more complex than your initial ideas.
> > > > > >
> > > > > > All I want to see and care about is:
> > > > > >
> > > > > >  - for a stable commit, the id that the commit is in Linus's tree.
> > > > > >  - for a Fixes: tag, the id that matches the commit in Linus's tree AND
> > > > > >    the commit that got backported to stable trees.
> > > > > >
> > > > > > That's it, that's the whole "ABI".  The issue is that you all, for any
> > > > > > number of commits, have 2 unique ids for any single commit and how are
> > > > > > we supposed to figure that mess out...
> > > > >
> > > > > Pretty sure we've explained how a few times now, not sure we can do much more.
> > > >
> > > > And the same for me.
> > > >
> > > > > If you see a commit with a cherry-pick link in it and don't have any
> > > > > sight on that commit in Linus's tree, ignore the cherry-pick link in
> > > > > it, assume it's a future placeholder for that commit id. You could if
> > > > > you wanted to store that info somewhere, but there shouldn't be a
> > > > > need.
> > > >
> > > > Ok, this is "fine", I can live with it.  BUT that's not the real issue
> > > > (and your own developers get confused by this, again, look at the
> > > > original email that started this all, they used an invalid git id to
> > > > send to us thinking that was the correct id to use.)
> > > 
> > > I'm going to go back and look at the one you pointed out as I'm
> > > missing the issue with it, I thought it was due to a future ID being
> > > used.
> > 
> > I think the issue is that with the cherry-picking we do, we don't update
> > the Fixes: or Reverts: lines, so those still point at the og commit in
> > -next, while the cherry-picked commit is in -fixes.
> > 
> > The fix for that (which our own cherry-pick scripts implement iirc) is to
> > keep track of the cherry-picks (which is why we add that line) and treat
> > them as aliases.
> > 
> > So if you have a Fixes: $sha1 pointing at -next, then if you do a
> > full-text commit message search for (cherry picked from $sha1), you should
> > be able to find it.
> > 
> > We could try to do that lookup with the cherry-pick scripts, but a lot of
> > folks hand-roll these, so it's lossy at best. Plus you already have to
> > keep track of aliases anyway since you're cherry-picking to stable, so I
> > was assuming that this shouldn't cause additional issues.
> > 
> > The other part is that if you already have a cherry picked from $sha1 in
> > your history, even if it wasn't done with stable cherry-pick, then you
> > don't have to cherry-pick again. These should be easy to filter out.
> > 
> > But maybe I'm also not understanding what the issue is, I guess would need
> > to look at a specific example.
> > 
> > > > > When future tools are analysing things, they will see the patch from
> > > > > the merge window, the cherry-picked patches in the fixes tree, and
> > > > > stable will reference the fixes, and the fixes patch will reference
> > > > > the merge window one?
> > > >
> > > >
> > > > > but I think when we cherry-pick patches from -next that fix
> > > > > other patches from -next maybe the fixes lines should be reworked to
> > > > > reference the previous Linus tree timeline not the future one. not
> > > > > 100% sure this happens? Sima might know more.
> > > >
> > > > Please fix this up, if you all can.  That is the issue here.  And again,
> > > > same for reverts.
> > > >
> > > > I think between the two, this is causing many fixes and reverts to go
> > > > unresolved in the stable trees.
> > > >
> > > > > Now previously I think we'd be requested to remove the cherry-picks
> > > > > from the -fixes commits as they were referencing things not in Linus'
> > > > > tree, we said it was a bad idea, I think we did it anyways, we got
> > > > > shouted at, we put it back, we get shouted that we are referencing
> > > > > commits that aren't in Linus tree. Either the link is useful
> > > > > information and we just assume cherry-picks of something we can't see
> > > > > are a future placeholder and ignore it until it shows up in our
> > > > > timeline.
> > > >
> > > > I still think it's lunacy to have a "cherry pick" commit refer to a
> > > > commit that is NOT IN THE TREE YET and shows up in history as "IN THE
> > > > FUTURE".  But hey, that's just me.
> > > >
> > > > Why do you have these markings at all?  Who are they helping?  Me?
> > > > Someone else?
> > > 
> > > They are for helping you. Again if the commit that goes into -next is immutable,
> > > there is no way for it to reference the commit that goes into -fixes
> > > ahead of it.
> > > 
> > > The commit in -fixes needs to add the link to the future commit in
> > > -next, that link is the cherry-pick statement.
> > > 
> > > When you get the future commit into the stable queue, you look for the
> > > commit id in stable history as a cherry-pick and drop it if it's
> > > already there.
> > > 
> > > I can't see any other way to do this, the future commit id is a
> > > placeholder in Linus/stable tree, the commit is immutable and 99.99%
> > > of the time it will arrive at some future point in time.
> > > 
> > > I'm open to how you would make this work that isn't lunacy, but I
> > > can't really see a way since git commits are immutable.
> > 
> > Yeah the (cherry picked from $sha1) with a sha1 that's in -next and almost
> > always shows up in Linus' tree in the future shouldn't be an issue. That
> > part really is required for driver teams to manage their flows.
> > 
> > > > > I think we could ask to not merge things into -next with stable cc'ed
> > > > > but I think that will result in a loss of valuable fixes esp for
> > > > > backporters.
> > > >
> > > > Again, it's the Fixes and Reverts id referencing that is all messed up
> > > > here.  That needs to be resolved.  If it takes you all the effort to
> > > > make up a special "stable tree only" branch/series/whatever, I'm all for
> > > > it, but as it is now, what you all are doing is NOT working for me at
> > > > all.
> > > 
> > > I'll have to see if anyone is willing to consider pulling this sort of
> > > feat off, it's not a small task, and it would have to be 99% automated
> > > I think to be not too burdensome.
> > 
> > It's not that hard to script, dim cherry-pick already does it. It's the
> > part where we need to guarantee that we never ever let one slip through
> > didn't get this treatment of replacing the sha1.
> > 
> > The even more insideous one is when people rebase their -next or -fixes
> > trees, since then the sha1 will really never ever show up. Which is why
> > we're telling people to not mess with git history at all and instead
> > cherry-pick. It's the lesser pain.
> 
> But this does happen with cherry picks... A few examples from what I saw
> with drivers/gpu/drm/ and -stable:
> 
> 5a507b7d2be1 ("drm/mst: Fix NULL pointer dereference at
> drm_dp_add_payload_part2") which landed as 8a0a7b98d4b6 ("drm/mst: Fix
> NULL pointer dereference at drm_dp_add_payload_part2") rather than
> 4545614c1d8da.

This one also landed through Alex' tree, and before he switched over to
cherry-pick -x and not trying to fix things up with rebasing. Because in
theory rebasing bugfixes out of -next into -fixes avoids all that trouble,
in practice it just causes a reliably even bigger mess.

> e89afb51f97a ("drm/vmwgfx: Fix a 64bit regression on svga3") which
> landed as c2aaa37dc18f ("drm/vmwgfx: Fix a 64bit regression on svga3")
> rather than 873601687598.

This one is from 2021. Iirc it's the case that motivated us to improve the
commiter documentation and make it clear that only maintainers should do
cherry-picks. Occasionally people don't know and screw up.

> a829f033e966 ("drm/i915: Wedge the GPU if command parser setup fails")
> which indicates it's a cherry-pick, but I couldn't find the equivalent
> commit landing at any point later on.

This one was a maintainer action by Dave and me, where we went in and
rebased an entire -next tree. Also from 2021, even more exceptional than
the "committer cherry-picked themselves and screwed up".

I'm not saying that the cherry-pick model with committers is error free.
Not at all. It's just in my experience substantially less error prone than
anything else, it's simply the less shit option.

Roughly the options are:

- rebase trees to not have duplicated commits. Breaks the committer model,
  pretty much guarantees that you have commit references to absolutely
  nowhere at all in practice because people butcher rebases all the time.
  Also pisses off Linus with unecessary rebases that don't reflect actual
  development history.

  Plus we'd insta run out of maintainers in drm if we do this.

  I think this is also what Alex tried to do until very recently.

- cherry-pick, but pretend it didn't happen. This means either people
  perfectly fix up all tags (see above, doesn't happen in practice) or you
  need to do title based guessing games. Plus you need to do title-based
  guessing games with the duplicates anyway.

- cherry-pick -x. You can actually handle this one with scripts and no
  human shouting. Unless people forgot to use -x or screwed up something
  else (which is why we have a script and docs). Which does happene, but
  the two examples you've found for that flow are from 2021. There should
  also be some that are more recent.

- we give up on stable for drm.

Cheers, Sima

> Or the following 3 commits:
> 
> 0811b9e4530d ("drm/amd/display: Add HUBP surface flip interrupt
> handler") which has a stable tag, and no cherry-pick line.
> 
> 4ded1ec8d1b3 ("drm/amd/display: Add HUBP surface flip interrupt
> handler") which is a different code change than the previous commit, and
> a completely different commit message, no stable tag, and no cherry-pick
> line.
> 
> 7af87fc1ba13 ("drm/amd/display: Add HUBP surface flip interrupt
> handler") which has the same code change as above, and it has the same
> commit message as 4ded1ec8d1b3 but with an added stable tag, and again -
> no cherry-pick line.
> 
> -- 
> Thanks,
> Sasha

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
