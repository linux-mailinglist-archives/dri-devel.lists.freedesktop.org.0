Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE4A10BED
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A6A10E3D7;
	Tue, 14 Jan 2025 16:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aML89YaF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568AC10E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:12:55 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2ef6ee55225so1164917a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736871115; x=1737475915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pz3hJGLpVtn3ExT5B74YfD7nTNcFEOW838BhFB4Y9F8=;
 b=aML89YaF7kCrNhD1Mg/LQo6H2ymSFqsvyw5aIlMJvSGEKSwvjYQiJgdBkwzS23/JiR
 hzAAtq9IA6CCmw5qnEiSUV134yhqmr5f5qqo92k9h4JPPAGcxpggR380uAnG5TMjuqLl
 Z+ZLl/NV+in+KkW5GsCjZjtFaWn7Lod4Ttinx9lRYoYXEFCSevBsnJob0JcXV6EV7qq4
 klI6NnlSs2wfyzLytfwOdOtn663iG2M8SDqqV8UDZz60weJgEGbesKxuT0Jk0LGYbPSB
 xKjnL26YYf4FHqgvPrlTvKj/5rsGpu1qbm+Xs4kLL434W/LmykrdLfpWWQO0sBQ6GRRS
 gNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736871115; x=1737475915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pz3hJGLpVtn3ExT5B74YfD7nTNcFEOW838BhFB4Y9F8=;
 b=s0tp1Ea//5y7TxSivxdoAvs4Eb5GIqfh7pseGK08I9AWFRR6t+PyHk5Xuqtb++p4dc
 h4vN+6j4bk0e+wwBh6jZ9KR075HGtIweOX4H9v3JUSyxQWjJACBWG9tscNdSnnjui/P0
 co8RAqOmLz5LhxKUssOQlQH4EUrh4j4BXnDyyLSvn/Ve5jl3xxxrlYgN0DLzGJApZjuR
 ANFPX+ASzYsL61T7UMv/kOSIdlzrUWTZ1nSA6yoNMP5g61d1W++HP1kuMtEchQmFAVs5
 cJzseNl53jZrhB3besPzJDbft/0Bxf3MTxJJojBgt27sRrqquQC2NyF3iOSTvP1hC8+J
 EIMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNFJDeIAFdeOL8JdoZe/dk3jLZaS1v6lyGVKCLPf0ThaStkupVjih1is21BDh0nEsVitIBeykntMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy46dLiDMU/2d04z329U4DCD4nZGuCW+aAB5e9Tx2tm9HclW+M2
 +aw8UeqyMaDNAHSVifgexmBYMgS17W3udjI4ymlQ9QELmfCeY5dJmdIwPKSiKTETFjoEupv95Wo
 nZO1PqWq5n65XwZgvkFP65e1EfVjNdQ==
X-Gm-Gg: ASbGncsvxCsn4m1Of3lENrjHlHvcsFSccdWaLPlDHFeGFFJmxB1xZc7nahIYkEAGuk6
 kN6dbljq5K3e3S5l1sFzMFnILx/M+59T+09Jf8g==
X-Google-Smtp-Source: AGHT+IHuASxa/gmUEgcrS5e3cMgLihKmGq0NYsgfUpDNBJTVfthtY7Urltj1P/B6ZAaVL7odbZ0Te3Efk98TTFktrZs=
X-Received: by 2002:a17:90b:2f07:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-2f548e55126mr14447469a91.0.1736871114656; Tue, 14 Jan 2025
 08:11:54 -0800 (PST)
MIME-Version: 1.0
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
 <2025011247-spoilage-hamster-28b2@gregkh>
 <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
 <2025011352-fox-wrangle-4d3f@gregkh>
 <CAPM=9tzkJ=dn2gq7GcvtN_C95ZzxwC7XMMXHBrwF6Ez6fYfU=g@mail.gmail.com>
 <Z4Z8rQKR2QEaWNyI@phenom.ffwll.local> <Z4aIGvAmMld_uztJ@lappy>
In-Reply-To: <Z4aIGvAmMld_uztJ@lappy>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Jan 2025 11:11:42 -0500
X-Gm-Features: AbW1kvZsEZGbtdcJu-MfEZ61_eveDbZ9HxZDGbiERJHPBqBf1Hr2uLWGOVEXeJU
Message-ID: <CADnq5_OtYOcf3k1j+xqXpeaRymYZvr8nSX9bnGHQQ6RT24uyFA@mail.gmail.com>
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode of
 operation for OAR/OAC)
To: Sasha Levin <sashal@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, 
 Greg KH <gregkh@linuxfoundation.org>, 
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, stable@vger.kernel.org,
 ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jan 14, 2025 at 11:02=E2=80=AFAM Sasha Levin <sashal@kernel.org> wr=
ote:
>
> On Tue, Jan 14, 2025 at 04:03:09PM +0100, Simona Vetter wrote:
> >On Tue, Jan 14, 2025 at 11:01:34AM +1000, Dave Airlie wrote:
> >> > > > We create a "web" when we backport commits, and mark things for =
"Fixes:"
> >> > > > When we get those ids wrong because you all have duplicate commi=
ts for
> >> > > > the same thing, everything breaks.
> >> > > >
> >> > > > > I just don't get what the ABI the tools expect is, and why eve=
ryone is
> >> > > > > writing bespoke tools and getting it wrong, then blaming us fo=
r not
> >> > > > > conforming. Fix the tools or write new ones when you realise t=
he
> >> > > > > situation is more complex than your initial ideas.
> >> > > >
> >> > > > All I want to see and care about is:
> >> > > >
> >> > > >  - for a stable commit, the id that the commit is in Linus's tre=
e.
> >> > > >  - for a Fixes: tag, the id that matches the commit in Linus's t=
ree AND
> >> > > >    the commit that got backported to stable trees.
> >> > > >
> >> > > > That's it, that's the whole "ABI".  The issue is that you all, f=
or any
> >> > > > number of commits, have 2 unique ids for any single commit and h=
ow are
> >> > > > we supposed to figure that mess out...
> >> > >
> >> > > Pretty sure we've explained how a few times now, not sure we can d=
o much more.
> >> >
> >> > And the same for me.
> >> >
> >> > > If you see a commit with a cherry-pick link in it and don't have a=
ny
> >> > > sight on that commit in Linus's tree, ignore the cherry-pick link =
in
> >> > > it, assume it's a future placeholder for that commit id. You could=
 if
> >> > > you wanted to store that info somewhere, but there shouldn't be a
> >> > > need.
> >> >
> >> > Ok, this is "fine", I can live with it.  BUT that's not the real iss=
ue
> >> > (and your own developers get confused by this, again, look at the
> >> > original email that started this all, they used an invalid git id to
> >> > send to us thinking that was the correct id to use.)
> >>
> >> I'm going to go back and look at the one you pointed out as I'm
> >> missing the issue with it, I thought it was due to a future ID being
> >> used.
> >
> >I think the issue is that with the cherry-picking we do, we don't update
> >the Fixes: or Reverts: lines, so those still point at the og commit in
> >-next, while the cherry-picked commit is in -fixes.
> >
> >The fix for that (which our own cherry-pick scripts implement iirc) is t=
o
> >keep track of the cherry-picks (which is why we add that line) and treat
> >them as aliases.
> >
> >So if you have a Fixes: $sha1 pointing at -next, then if you do a
> >full-text commit message search for (cherry picked from $sha1), you shou=
ld
> >be able to find it.
> >
> >We could try to do that lookup with the cherry-pick scripts, but a lot o=
f
> >folks hand-roll these, so it's lossy at best. Plus you already have to
> >keep track of aliases anyway since you're cherry-picking to stable, so I
> >was assuming that this shouldn't cause additional issues.
> >
> >The other part is that if you already have a cherry picked from $sha1 in
> >your history, even if it wasn't done with stable cherry-pick, then you
> >don't have to cherry-pick again. These should be easy to filter out.
> >
> >But maybe I'm also not understanding what the issue is, I guess would ne=
ed
> >to look at a specific example.
> >
> >> > > When future tools are analysing things, they will see the patch fr=
om
> >> > > the merge window, the cherry-picked patches in the fixes tree, and
> >> > > stable will reference the fixes, and the fixes patch will referenc=
e
> >> > > the merge window one?
> >> >
> >> >
> >> > > but I think when we cherry-pick patches from -next that fix
> >> > > other patches from -next maybe the fixes lines should be reworked =
to
> >> > > reference the previous Linus tree timeline not the future one. not
> >> > > 100% sure this happens? Sima might know more.
> >> >
> >> > Please fix this up, if you all can.  That is the issue here.  And ag=
ain,
> >> > same for reverts.
> >> >
> >> > I think between the two, this is causing many fixes and reverts to g=
o
> >> > unresolved in the stable trees.
> >> >
> >> > > Now previously I think we'd be requested to remove the cherry-pick=
s
> >> > > from the -fixes commits as they were referencing things not in Lin=
us'
> >> > > tree, we said it was a bad idea, I think we did it anyways, we got
> >> > > shouted at, we put it back, we get shouted that we are referencing
> >> > > commits that aren't in Linus tree. Either the link is useful
> >> > > information and we just assume cherry-picks of something we can't =
see
> >> > > are a future placeholder and ignore it until it shows up in our
> >> > > timeline.
> >> >
> >> > I still think it's lunacy to have a "cherry pick" commit refer to a
> >> > commit that is NOT IN THE TREE YET and shows up in history as "IN TH=
E
> >> > FUTURE".  But hey, that's just me.
> >> >
> >> > Why do you have these markings at all?  Who are they helping?  Me?
> >> > Someone else?
> >>
> >> They are for helping you. Again if the commit that goes into -next is =
immutable,
> >> there is no way for it to reference the commit that goes into -fixes
> >> ahead of it.
> >>
> >> The commit in -fixes needs to add the link to the future commit in
> >> -next, that link is the cherry-pick statement.
> >>
> >> When you get the future commit into the stable queue, you look for the
> >> commit id in stable history as a cherry-pick and drop it if it's
> >> already there.
> >>
> >> I can't see any other way to do this, the future commit id is a
> >> placeholder in Linus/stable tree, the commit is immutable and 99.99%
> >> of the time it will arrive at some future point in time.
> >>
> >> I'm open to how you would make this work that isn't lunacy, but I
> >> can't really see a way since git commits are immutable.
> >
> >Yeah the (cherry picked from $sha1) with a sha1 that's in -next and almo=
st
> >always shows up in Linus' tree in the future shouldn't be an issue. That
> >part really is required for driver teams to manage their flows.
> >
> >> > > I think we could ask to not merge things into -next with stable cc=
'ed
> >> > > but I think that will result in a loss of valuable fixes esp for
> >> > > backporters.
> >> >
> >> > Again, it's the Fixes and Reverts id referencing that is all messed =
up
> >> > here.  That needs to be resolved.  If it takes you all the effort to
> >> > make up a special "stable tree only" branch/series/whatever, I'm all=
 for
> >> > it, but as it is now, what you all are doing is NOT working for me a=
t
> >> > all.
> >>
> >> I'll have to see if anyone is willing to consider pulling this sort of
> >> feat off, it's not a small task, and it would have to be 99% automated
> >> I think to be not too burdensome.
> >
> >It's not that hard to script, dim cherry-pick already does it. It's the
> >part where we need to guarantee that we never ever let one slip through
> >didn't get this treatment of replacing the sha1.
> >
> >The even more insideous one is when people rebase their -next or -fixes
> >trees, since then the sha1 will really never ever show up. Which is why
> >we're telling people to not mess with git history at all and instead
> >cherry-pick. It's the lesser pain.
>
> But this does happen with cherry picks... A few examples from what I saw
> with drivers/gpu/drm/ and -stable:
>
> 5a507b7d2be1 ("drm/mst: Fix NULL pointer dereference at
> drm_dp_add_payload_part2") which landed as 8a0a7b98d4b6 ("drm/mst: Fix
> NULL pointer dereference at drm_dp_add_payload_part2") rather than
> 4545614c1d8da.
>
> e89afb51f97a ("drm/vmwgfx: Fix a 64bit regression on svga3") which
> landed as c2aaa37dc18f ("drm/vmwgfx: Fix a 64bit regression on svga3")
> rather than 873601687598.
>
> a829f033e966 ("drm/i915: Wedge the GPU if command parser setup fails")
> which indicates it's a cherry-pick, but I couldn't find the equivalent
> commit landing at any point later on.
>
>
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

In fairness, these pre-dated the amdgpu tree using cherry-pick -x.  I
had stopped doing that for a while because I kept getting yelled at
for referencing commits that were only in -next.  I've since started
using -x when I need to cherry-pick a fix to -fixes.

Alex
