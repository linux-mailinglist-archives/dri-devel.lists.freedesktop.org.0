Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB9D3E5933
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 13:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924F389D8E;
	Tue, 10 Aug 2021 11:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9D789BF4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628595522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d324uXSSxDTG6G1eMwWOgUeHgss67Z9GqOiPdpmX7yw=;
 b=ZshFh7O7Ck2wQcTfNxaVtAH7lQkAm09dnDnRQvLH08GVbq44ro1gD2L7W3owK/5+U+E5q/
 NNy5uWIdwdm1SwT+KnqoRYUGFMzHN1V/cm2FNn6h3MZdlYC4BBaU9F2fB4EVMrJc2mkoky
 pDOAAWymigKGRURXwHVFZzpJR2h6r9U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-AR6tOAtdPi2XqfnIOnFu0Q-1; Tue, 10 Aug 2021 07:38:40 -0400
X-MC-Unique: AR6tOAtdPi2XqfnIOnFu0Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 z2-20020adff1c20000b0290154f60e3d2aso1555864wro.23
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 04:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d324uXSSxDTG6G1eMwWOgUeHgss67Z9GqOiPdpmX7yw=;
 b=DnCxXV7YAvdgWaGafsCfJTlQ/kdg/8L0nk031xOb9VQ0VEtgXDOPwpUGOIx7mUgIqT
 A1CNXifcJivEKtZUJq7jbyELGm6hni0dlyqFesV9PR/pTX6zcjMU32mCS87JOqyhfykb
 gff17HgEnGix8ybdrilY8U2m/SNSefbhXpFT++tp6Xv8KRolYahw8rrEr9JDrltx3vTB
 Pptf0J/JhOF2gAu3rm62iTI6DizjyS2IdTZ1STQLwqxp+1n8/vESG6DCohQMdHTWqrXi
 nFhQ55TDIGTpHziOtBm9wRzxZEIbwvwobu8zypnlxS3t8BuDt6ta8zznvt0iVp9D8nJJ
 dLLA==
X-Gm-Message-State: AOAM531INucHT4WmmdaiE1a9649WSOuASHey8tMOAbGgLolmNu09pd9U
 Dyfim8VB5GjI7R5AZCilbij6+jvHlK1dtVCOQ2ps/0nZ95Ov2Wpj136xRXIIzIjlL+5I3eM2Sh2
 oCADGNDL7m5794N0PEfgFgagf2HwHPo/r5sxKeNpV62OO
X-Received: by 2002:adf:a1ca:: with SMTP id v10mr12350900wrv.177.1628595518889; 
 Tue, 10 Aug 2021 04:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybsW3//9cYw03WA1YuFUuq1uhNUX2un4NwoeN/nmvd2F1iLUECga6K144/HIszyaGPyLPkWFxvqJSm2v2SqAU=
X-Received: by 2002:adf:a1ca:: with SMTP id v10mr12350878wrv.177.1628595518595; 
 Tue, 10 Aug 2021 04:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55ttigE42t+gmPvTtZ1QD6a9=5v3Mo9r6CMsOpDYo61Jj-g@mail.gmail.com>
 <YRJQ0ll5O3x+edT1@phenom.ffwll.local>
In-Reply-To: <YRJQ0ll5O3x+edT1@phenom.ffwll.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 10 Aug 2021 13:38:27 +0200
Message-ID: <CACO55ttECbgrfKYe5g+sVS9yy4ri5YBPA0d_evOMStqejbsOGg@mail.gmail.com>
Subject: Re: Proposal for allowing more Nouveau contributors to merge patches
To: Daniel Vetter <daniel@ffwll.ch>
Cc: nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Aug 10, 2021 at 12:11 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Aug 06, 2021 at 06:53:06PM +0200, Karol Herbst wrote:
> > Hey everybody,
> >
> > so, here is a proposal of what we could change in order to allow
> > patches to land faster, more reliably and to increase the overall bus
> > factor in terms of nouveau kernel maintenance.
>
> Yay!
>
> > But let's start with the current situation:
> >
> > At the moment contributors have to send patches to the nouveau mailing
> > list in order to submit them for inclusion into Bens nouveau tree.
> > Then Ben has to look at them and either respond with a comment on what
> > needs to change or merge it. At some point Ben submits all new changes
> > to nouveau for inclusion into the drm-next tree.
> >
> > Practically there are a few problems here:
> > 1. Not all patch submissions get a response
> > 2. Patch submitters usually don't get to know if their patches are
> > accepted unless they appear in drm-next or linus' tree.
> > 3. A lot of trivial patches never make it into the tree.
> > 4. Depending on how overloaded Ben is, even bigger patch series adding
> > new features never get any responses at all.
> > 5. Patch series might get stale for any other reason and there is no
> > good tool to track open patch submissions (no, patchwork isn't good
> > and it sucks and not even in the mood to explain this to people
> > thinking otherwise as this should just be obvious)
> >
> > This usually ends up discouraging new contributors from making more
> > contributions to nouveau as they see that some or all of their patches
> > never get any reaction and it's even annoying to current contributors
> > if they see their patches being stuck as well.
> >
> > And here I want to stress that none of this is Ben's fault and has his
> > own things to work on and none of this should just depend on one
> > person finding enough time. So the solution shouldn't be a simple
> > "let's find a different tool and everything should be perfect" but the
> > solution should be "how can we change the process so it's less time
> > consuming for Ben to accept patches". And while working on this, I'd
> > also want to tackle the problem that contributing to nouveau shouldn't
> > be frustrating for new contributors and the process should be more
> > lively overall.
> >
> > So for this I want to propose a new workflow, which would also spread
> > some responsibilities around active members of the nouveau community:
> >
> > 1. We should have a public nouveau tree (which could be
> > https://gitlab.freedesktop.org/drm/nouveau or something else) with a
> > nouveau-next branch collecting all patches for the next kernel major
> > kernel release.
> > At the moment the "official" nouveau tree is kind of
> > https://github.com/skeggsb/nouveau but there is
> > https://github.com/skeggsb/linux as well. The main problem is, it's a
> > repository tight to a person. We already have
> > https://gitlab.freedesktop.org/drm/nouveau as a bug tracker, but it
> > also contains a full linux git tree which is updated automatically
> > through a CI job.
> >
> > 2. A chosen group of people should have push rights to this repository
> > in order to accept patches sent in via emails to the nouveau Mailing
> > List or fancy UIs (like gitlabs MRs) or other ways.
> > Trusted contributors should be allowed to review and accept submitted
> > patches in order to reduce the workload on Ben. Those patches will be
> > collected on the nouveau-next branch. Patches from a mailing list
> > could e.g. be submitted through a MR on gitlab or just pushed to the
> > branch directly.
> >
> > 3. We should ensure through CI that submitted patches are at least
> > passing basic quality control (checkpatch, compile testing, sparse,
> > etc...)
> > I already worked on this and one example can be seen here:
> > https://gitlab.freedesktop.org/drm/nouveau/-/merge_requests/3
> > There are more things we could add to it, like checking if sparse is
> > happy or add additional checks. Adding tests against hw is something
> > we want to target for the future as well.
> >
> > 4. patches from nouveau-next should be included into a "higher" git
> > tree (drm-next or drm-misc-next) by authorized people after getting a
> > final review by Ben or somebody else.
> > The idea is to post all collected patches for final review to the
> > mailing list as Ben wanted to have a final possibility to nack it in
> > case something stands out. We could then depend on Ben including those
> > patches, but we could also use commit rights to drm-next or
> > drm-misc-next from other people as well. I have commit access to the
> > drm-misc repository, and I would assume that Lyude would be able to
> > get it as well or already has it.
>
> Hm I'm not sure that double-indirect makes a lot of sense. There's imo two
> reasonable models here:
>
> - commit rights on drm/nouveau, Ben sends out the pull requests to
>   drm-next for those, which gives him a good point to check over and do
>   any last touches
>

yeah, I think this would be a more natural approach. We just need to
discuss who is allowed to merge things. The biggest problem I see with
this is that gitlab makes this approach incompatible with how Ben
currently manages his tree as he uses linux-x.y branches and sends the
pull request out from there afaik. But sure, if Ben is up for changing
to a next/fixes model, so that MRs won't break (so they won't need to
be retargeted) then that's fine as well.

> - directly push to drm-misc-next, defacto having a group commit right
>   thing going on there directly
>
> Doing first commit rights and then resending the entire pile is way too
> much beaurocracy and wont solve much in my experience.
>

yeah, I talked with Ben about this and I think this is weaker than it
sounds like. Ben told me that he would like to have at least a chance
to nack things before we merge it into something like drm-misc-next.
But maybe then it makes sense to go through Bens tree anyway. In the
end the main idea is just to spread around responsibilities to merge
in random patches from the ML, so that Ben doesn't have to catch all
those patches himself.

> This does mean that there's a lot of trust required for committers, since
> if the "drop/revert a patch" part becomes a regularity none of this works
> out. Otoh it also doesn't work out if committers aren't trusted, because
> then you're stuck in the "not really my problem" space.
>

I feel like we are in that place already. I would like to pick up all
those random patches, but I can't. I can leave a r-by tag and hope Ben
picks it up, but ultimately there is often no point in even doing
that. It's really frustrating. In the end the "smartest" thing to do
is to just ignore those patches, because that means less work for me
and not change in the outcome.

> This is both from plenty of experience from other kernel teams trying to
> do something like this. If you don't have upfront trust, then commit
> rights/group maintainership model will simply not work, or at least be
> very painful. And yes this means occasionally things go wrong and need to
> be fixed up, and more importantly, a discussion about tooling, testing and
> review standards is likely required.
>

well, that's kind of the reason I wrote this email :) I mean.. we
discussed things internally and Ben sounded like he is willing to
allow others to directly merge/push into the main nouveau tree. I
simply wanted to have a public discussion about this to make it more
official and to push things forward. Also do be more open in how all
of that should look like in the end. And I would like to end up with
something which would work for Ben and everybody else, because I think
the current process doesn't really work out well for anybody.

> For drm-misc/intel we handle those by asking for improvements to the dim
> tooling/docs anytime something goes wrong. This way hopefully the entire
> team learns.
>
> > 5. Urgent fixes should land via drm-fixes or drm-misc-fixes.
> > We kind of already do this already though. We could spin up a
> > nouveau-fixes branch in the future, but the amount of such fixes is so
> > low it's not really worth the effort at the moment. And we have access
> > to drm-misc.
>
> drm.git trees pretty much only take pull requests because Dave&me are
> lazy. We do push the occasionally hotfix if someone managed to set the
> tree on fire, but that's it (usually because we still suck at CI).
>
> Imo for fixes just make drm-misc the official place.
>

yeah, that's my preference as well.

> > Once we decide to start and agree to some process, we should try it
> > out with trivial patches, we already get enough of. Like Typo fixes,
> > patches adding docs or removing dead code and can expand this to more
> > "serious" work once we agree that it actually works and does have
> > benefits to nouveau overall.
> >
> > Any thoughts on this?
>
> Imo start out with fixes in drm-misc-fixes, and leave feature work and
> anything substantial to the current skeggsb/nouveau process. Then reasses
> how that's going and what needs to be improved (like get the CI infra up
> and running meanwhile, maybe move the repo to drm/nouveau if you feel
> like, that kind of stuff).
>

The thing is, we have tons of those "fix typo" or "remove this dead
variable" type of fixes which often just get ignored. Fixes are
important for sure, but we already have a path for that as we can just
use drm-misc-fixes. So this is less of an issue. Heck we even have
"trivial" features lying around. I seriously don't think that "fixes"
are the problem here at all. If we start with fixes, then we
essentially just went from "uhhh, this really breaks everything,
dave/daniel please merge" to "uhh, this beaks stuff, let's push to
drm-misc-fixes", which is an improvement, but such a small one I don't
think it would fundamentally change anything.

But sure, we could start with fixes, but I would really include
"fixing typos", "add documentation" and other trivial things as well
from the start as this is where I see the main problem.

> At least a get a bit a feeling for big stuff nouveau aint ready yet for
> group maintainership, judging from what you're proposing here. This also
> allows you to experiment around more with gitlab CI and maybe MR, perhaps
> nouveau will got directly to that for group maintainership (with Ben and
> Marge bot as sole committers)?
>
> Plus I think offloading and speeding up the simple fixes should help a lot
> already in making nouveau more alive and perhaps attracting new
> contributors.
>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

