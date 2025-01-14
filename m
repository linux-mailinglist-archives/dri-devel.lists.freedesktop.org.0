Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6815A10BA1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E3710E3C9;
	Tue, 14 Jan 2025 16:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SA9NbONk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B085E10E3C5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:00:53 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso1005400766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736870392; x=1737475192; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3LN88pxLDnwbjT3m2G4YMNi+ssGjWGe+GQjyPcAy3i0=;
 b=SA9NbONkiYrsqPPkZ9kpcuk5NuGjr8Fc+knHkFXNkL5Ad3El3VzphvchTihREzp6zv
 1NuZbuJkqgJLNhMi9+bobXdtWzklZ+vRX7Y7HmR05lgnA4Bis6AohUuJE0GHtxT4ikvl
 LDKiarJcEZhFawZAPZECp6KOFYI3dZnlT0U0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736870392; x=1737475192;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3LN88pxLDnwbjT3m2G4YMNi+ssGjWGe+GQjyPcAy3i0=;
 b=d2sd95zPxu4q9yz6MMYHoQlUqXiUbiYSA1yn+J9d1K9GtxOFju7Nunlzc3FwqD6lZq
 8nul8+SJkv0KvJ4v9zZUb6DodKkIjRBqugmAeN8HC4saQp0csY0r28Onqi1bRjeJE4zM
 ilkY6c0ddvj/ZPKvUHFJu2Br+2PF08iNIQxJVySVtifi9TiNxPQe0EKG8RiAT1x/RpLk
 CyPE4iFJencsp/G+qkGw88jrI7WDOCfpGxc3pyM4wn9zKjBDOeP+zQNeNU2UCH8vsRzJ
 jloOEIvc+lJT/X6AQ1/4sxBkOwa3zaye5yUVKPKlVe+IK8rGAXBbpV4IEZrhO6GgpUpl
 JAcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7qDIHZW/fk2PqRPtE4TLvHD7wvnN8fPBgt5TKTEgjYU5NCr7G1lnqq/WzBjvHR6weP1uoqm4kqjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjdA74yr7OcyTkbybZyizVVtYXhNadp9dFittVDD86qB6M/lG1
 A616KjmzIDq0wfI7nWCDw43xo4C/SUPOzlHV81VrMidDQR3+KmAAlDp5rfMCG8X3wwiLNeExKps
 1
X-Gm-Gg: ASbGnctTWWnCOQIp7eqHK2qZZSWW1eQWpPcYtdXBKIkXJkVF2FcNLMLko/txA5j2Ezq
 HaHct/RYWNlWyMfy7vyEripz74e4TBU2Z54nl2HCZjkYkH2HFLyhC8pyswmxCFoM2VLZsa3Qn8B
 gqAcyXEcQYtXitrDuOah+XANN4CD70WoFXOTQ7nkNlpM/kWyjod4uc0LpZVnObUBnICTxeUmwTN
 CfMHOjJYmSKKD1L7+otFUHUlPKd2K0fK40iWkJ1wDxqqdQUEMaqvB+XojmVsAzdgJNZ
X-Google-Smtp-Source: AGHT+IGBoPv57h1fbnXWQK967BMpkMwHFUVUy2kO6wn8EwPwuFiRVJFdl/tcIycf3apoA1HXfZiAEw==
X-Received: by 2002:a17:907:2da6:b0:aac:2297:377d with SMTP id
 a640c23a62f3a-ab2abdc09eemr2456229866b.52.1736870392001; 
 Tue, 14 Jan 2025 07:59:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9647711sm649988966b.173.2025.01.14.07.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 07:59:51 -0800 (PST)
Date: Tue, 14 Jan 2025 16:59:49 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <Z4aJ9XU7y8-Sl36j@phenom.ffwll.local>
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
 <2025011247-spoilage-hamster-28b2@gregkh>
 <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
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

On Mon, Jan 13, 2025 at 10:44:41AM +1000, Dave Airlie wrote:
> On Mon, 13 Jan 2025 at 07:09, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jan 13, 2025 at 06:01:51AM +1000, Dave Airlie wrote:
> > > On Mon, 13 Jan 2025 at 05:51, Dave Airlie <airlied@gmail.com> wrote:
> > > >
> > > > On Sun, 12 Jan 2025 at 22:19, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, Jan 10, 2025 at 12:53:41PM -0800, Umesh Nerlige Ramappa wrote:
> > > > > > commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream
> > > > >
> > > > > <snip>
> > > > >
> > > > > > Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")
> > > > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
> > > > > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > > Cc: stable@vger.kernel.org # 6.12+
> > > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > > Link: https://patchwork.freedesktop.org/patch/msgid/20241220171919.571528-2-umesh.nerlige.ramappa@intel.com
> > > > > > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
> > > > > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > (cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)
> > > > >
> > > > > Oh I see what you all did here.
> > > > >
> > > > > I give up.  You all need to stop it with the duplicated git commit ids
> > > > > all over the place.  It's a major pain and hassle all the time and is
> > > > > something that NO OTHER subsystem does.
> > > > >
> > > > > Yes, I know that DRM is special and unique and running at a zillion
> > > > > times faster with more maintainers than any other subsystem and really,
> > > > > it's bigger than the rest of the kernel combined, but hey, we ALL are a
> > > > > common project here.  If each different subsystem decided to have their
> > > > > own crazy workflows like this, we'd be in a world of hurt.  Right now
> > > > > it's just you all that is causing this world of hurt, no one else, so
> > > > > I'll complain to you.
> > > >
> > > > All subsystems that grow to having large teams (more than 2-4 people)
> > > > working on a single driver will eventually hit the scaling problem,
> > > > just be glad we find things first so everyone else knows how to deal
> > > > with it later.
> > > >
> > > > >
> > > > > We have commits that end up looking like they go back in time that are
> > > > > backported to stable releases BEFORE they end up in Linus's tree and
> > > > > future releases.  This causes major havoc and I get complaints from
> > > > > external people when they see this as obviously, it makes no sense at
> > > > > all.
> > > >
> > > > None of what you are saying makes any sense here. Explain how patches
> > > > are backported to stable releases before they end up in Linus's tree
> > > > to me like I'm 5, because there should be no possible workflow where
> > > > that can happen, stable pulls from patches in Linus' tree, not from my
> > > > tree or drm-next or anywhere else. Now it might appear that way
> > > > because tooling isn't prepared or people don't know what they are
> > > > looking at, but I still don't see the actual problem.
> > > >
> > > > >
> > > > > And it easily breaks tools that tries to track where backports went and
> > > > > if they are needed elsewhere, which ends up missing things because of
> > > > > this crazy workflow.  So in the end, it's really only hurting YOUR
> > > > > subsystem because of this.
> > > >
> > > > Fix the tools.
> > > >
> > > > >
> > > > > And yes, there is a simple way to fix this, DO NOT TAG COMMITS THAT ARE
> > > > > DUPLICATES AS FOR STABLE.  Don't know why you all don't do that, would
> > > > > save a world of hurt.
> > > >
> > > > How do you recommend we do that, edit the immutable git history to
> > > > remove the stable
> > > > tag from the original commit?
> > > >
> > > > >
> > > > > I'm tired of it, please, just stop.  I am _this_ close to just ignoring
> > > > > ALL DRM patches for stable trees...
> > > >
> > > > If you have to do, go do it. The thing is the workflow is there for a
> > > > reason, once you have a large enough team, having every single team
> > > > member intimately aware of the rc schedule to decide where they need
> > > > to land patches doesn't scale. If you can't land patches to a central
> > > > -next tree and then pick those patches out to a -fixes tree after a
> > > > maintainer realises they need to be backported to stable. Now I
> > > > suppose we could just ban stable tags on the next tree and only put
> > > > them on the cherry-picks but then how does it deal with the case where
> > > > something needs to be fixes in -next but not really urgent enough for
> > > > -fixes immediately. Would that be good enough, no stable tags in -next
> > > > trees, like we could make the tooling block it? But it seems like
> > > > overkill, to avoid fixing some shitty scripts someone is probably
> > > > selling as a security application.
> > >
> > > If you were to ignore stable tags on drm, could we then write a tool
> > > that creates a new for-stable tree that just strips out all the
> > > fixes/backports/commits and recreates it based on Linus commits to
> > > you, or would future duplicate commits then break tools?
> >
> > That would be great, just pick which commit id to reference (i.e. the
> > one that shows up in Linus's tree first.)
> >
> > But then, be careful with the "Fixes:" tags as well, those need to line
> > up and match the correct ones.
> >
> > We create a "web" when we backport commits, and mark things for "Fixes:"
> > When we get those ids wrong because you all have duplicate commits for
> > the same thing, everything breaks.
> >
> > > I just don't get what the ABI the tools expect is, and why everyone is
> > > writing bespoke tools and getting it wrong, then blaming us for not
> > > conforming. Fix the tools or write new ones when you realise the
> > > situation is more complex than your initial ideas.
> >
> > All I want to see and care about is:
> >
> >  - for a stable commit, the id that the commit is in Linus's tree.
> >  - for a Fixes: tag, the id that matches the commit in Linus's tree AND
> >    the commit that got backported to stable trees.
> >
> > That's it, that's the whole "ABI".  The issue is that you all, for any
> > number of commits, have 2 unique ids for any single commit and how are
> > we supposed to figure that mess out...
> 
> Pretty sure we've explained how a few times now, not sure we can do much more.
> 
> If you see a commit with a cherry-pick link in it and don't have any
> sight on that commit in Linus's tree, ignore the cherry-pick link in
> it, assume it's a future placeholder for that commit id. You could if
> you wanted to store that info somewhere, but there shouldn't be a
> need.
> 
> When the initial commit enters during the next merge window, you look
> for that subject or commit id in the stable tree already, if it
> exists, dump the latest Linus patch on the floor, it's already in
> stable your job is done.
> 
> When future tools are analysing things, they will see the patch from
> the merge window, the cherry-picked patches in the fixes tree, and
> stable will reference the fixes, and the fixes patch will reference
> the merge window one?
> 
> I'm just not seeing what I'm missing here, fixes tags should work
> fine, but I think when we cherry-pick patches from -next that fix
> other patches from -next maybe the fixes lines should be reworked to
> reference the previous Linus tree timeline not the future one. not
> 100% sure this happens? Sima might know more.

The issue with trying to fix up the Fixes/Reverts citations is that if you
miss one, you're tooling is still broken. So what we do instead is track
all the aliases of commits we've cherry-picked, because that's actually
reliable.

And you need to do that already anyway for stable processing, because you
want to automatically filter out commits that you've cherry picked
already. The only difference is that aside from the actual commit sha1,
you also add all the cherry-pick aliases that are listed in the commit
messages. Which is why we add those, because our tooling uses them, so you
don't have to guess by patch title or something imprecise like that.

So example: You cherry-pick commit A1 to stable, it now has commit sha1 A2
in stable. But it also has a cherry-picked form A0 note, so you also add
A0 as a commit alias.

When you then check whether you've already cherry-picked a commit because
of a Fixes or Reverts line, instead of only checking against A1 like you
currently do in stable processing, you also check against A0. If the
Fixes/Reverts line matches either, you know that you need that bugfix in
your stable tree too.

And if you cherry-pick a commit, you also check against both A1 and A0,
and if either matches, you've already cherry-picked that commit (or one of
its duplicated cherry-picks) and can drop it.

And if someone has gone completely silly and cherry picked multiple times,
you just add all the cherry-picked from sha1 as aliases to your "do I have
this commit already" database/query.

Our script just launches a git grep over the history looking for all
cherry-pick lines, not caring one bit whether there's more than one per
commit. That's the entire magic we do.
-Sima

> Now previously I think we'd be requested to remove the cherry-picks
> from the -fixes commits as they were referencing things not in Linus'
> tree, we said it was a bad idea, I think we did it anyways, we got
> shouted at, we put it back, we get shouted that we are referencing
> commits that aren't in Linus tree. Either the link is useful
> information and we just assume cherry-picks of something we can't see
> are a future placeholder and ignore it until it shows up in our
> timeline.
> 
> I think we could ask to not merge things into -next with stable cc'ed
> but I think that will result in a loss of valuable fixes esp for
> backporters.
> 
> Dave.

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
