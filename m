Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C843E5806
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4F3894D4;
	Tue, 10 Aug 2021 10:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99634894D4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 10:11:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id f5so9708348wrm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 03:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Sp29JzT+GKDKRnyCDK4QS3B3tx93s6YBezXh1eXnjCk=;
 b=KN/o8Rnb5mrkcbzAQliYqMRaJ5IbOuO5rnRRZXUprGri1tNLXb9mmWvE2MPSePu4O6
 SG5EnfBPLd7uDu1MKFSTLYXqoMX82CS7y2rqhsEhdM9zfLmzfcBsQhzc8dKxy+6QjWV9
 UlxNs2GSBAKfgVbS1oWfh5kjS+XV761dVyq1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sp29JzT+GKDKRnyCDK4QS3B3tx93s6YBezXh1eXnjCk=;
 b=DpCShLDtiVsBWAM1VN7NE9dIFcBKkLAaG7xHsVtQtyW8N6r3QfI6SsbdbUeF7Yy72l
 fIquBm4dEWQWUuoZPXV4UM8Tsf58qVVNIyXVScBySA7EEqtK2WQypsbJyXdiAbje1zOE
 be4pwmsbesKYU65fBoaK9V37JRcUlZNT/FP+dsB3ytTWH97TFstGrp86Ccuo7SsU1SLP
 CicGk9gBWXkrpNW35CKz/znu5SR3P94PZlXsg22WTV9MC4e7MRRKRYpAHO7sjrM3UDsM
 4Nic1Jge/QHMnQEHspsRBn9TLdh70LM9smRWOUph5O6dm+qGDgFlp/b1VXuNP35DUGKo
 BBXg==
X-Gm-Message-State: AOAM533hinl+a791aFofsom9ACbHcWmp9dsgGsAEjP/c3qrWYvpsLbxl
 /5MqM/VjYylaZXlppjSkP7IOJQ==
X-Google-Smtp-Source: ABdhPJziWy+a07cLMssOTaRQQ5Kp0mCk/diZGxq4Myj06mkn//331sD0fUtYkLC3NC2nqrYZ6pSwpw==
X-Received: by 2002:adf:9c8b:: with SMTP id d11mr17013687wre.43.1628590293064; 
 Tue, 10 Aug 2021 03:11:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o22sm2051768wmq.3.2021.08.10.03.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:11:32 -0700 (PDT)
Date: Tue, 10 Aug 2021 12:11:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Karol Herbst <kherbst@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@redhat.com>
Subject: Re: Proposal for allowing more Nouveau contributors to merge patches
Message-ID: <YRJQ0ll5O3x+edT1@phenom.ffwll.local>
References: <CACO55ttigE42t+gmPvTtZ1QD6a9=5v3Mo9r6CMsOpDYo61Jj-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACO55ttigE42t+gmPvTtZ1QD6a9=5v3Mo9r6CMsOpDYo61Jj-g@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Fri, Aug 06, 2021 at 06:53:06PM +0200, Karol Herbst wrote:
> Hey everybody,
> 
> so, here is a proposal of what we could change in order to allow
> patches to land faster, more reliably and to increase the overall bus
> factor in terms of nouveau kernel maintenance.

Yay!

> But let's start with the current situation:
> 
> At the moment contributors have to send patches to the nouveau mailing
> list in order to submit them for inclusion into Bens nouveau tree.
> Then Ben has to look at them and either respond with a comment on what
> needs to change or merge it. At some point Ben submits all new changes
> to nouveau for inclusion into the drm-next tree.
> 
> Practically there are a few problems here:
> 1. Not all patch submissions get a response
> 2. Patch submitters usually don't get to know if their patches are
> accepted unless they appear in drm-next or linus' tree.
> 3. A lot of trivial patches never make it into the tree.
> 4. Depending on how overloaded Ben is, even bigger patch series adding
> new features never get any responses at all.
> 5. Patch series might get stale for any other reason and there is no
> good tool to track open patch submissions (no, patchwork isn't good
> and it sucks and not even in the mood to explain this to people
> thinking otherwise as this should just be obvious)
> 
> This usually ends up discouraging new contributors from making more
> contributions to nouveau as they see that some or all of their patches
> never get any reaction and it's even annoying to current contributors
> if they see their patches being stuck as well.
> 
> And here I want to stress that none of this is Ben's fault and has his
> own things to work on and none of this should just depend on one
> person finding enough time. So the solution shouldn't be a simple
> "let's find a different tool and everything should be perfect" but the
> solution should be "how can we change the process so it's less time
> consuming for Ben to accept patches". And while working on this, I'd
> also want to tackle the problem that contributing to nouveau shouldn't
> be frustrating for new contributors and the process should be more
> lively overall.
> 
> So for this I want to propose a new workflow, which would also spread
> some responsibilities around active members of the nouveau community:
> 
> 1. We should have a public nouveau tree (which could be
> https://gitlab.freedesktop.org/drm/nouveau or something else) with a
> nouveau-next branch collecting all patches for the next kernel major
> kernel release.
> At the moment the "official" nouveau tree is kind of
> https://github.com/skeggsb/nouveau but there is
> https://github.com/skeggsb/linux as well. The main problem is, it's a
> repository tight to a person. We already have
> https://gitlab.freedesktop.org/drm/nouveau as a bug tracker, but it
> also contains a full linux git tree which is updated automatically
> through a CI job.
> 
> 2. A chosen group of people should have push rights to this repository
> in order to accept patches sent in via emails to the nouveau Mailing
> List or fancy UIs (like gitlabs MRs) or other ways.
> Trusted contributors should be allowed to review and accept submitted
> patches in order to reduce the workload on Ben. Those patches will be
> collected on the nouveau-next branch. Patches from a mailing list
> could e.g. be submitted through a MR on gitlab or just pushed to the
> branch directly.
> 
> 3. We should ensure through CI that submitted patches are at least
> passing basic quality control (checkpatch, compile testing, sparse,
> etc...)
> I already worked on this and one example can be seen here:
> https://gitlab.freedesktop.org/drm/nouveau/-/merge_requests/3
> There are more things we could add to it, like checking if sparse is
> happy or add additional checks. Adding tests against hw is something
> we want to target for the future as well.
> 
> 4. patches from nouveau-next should be included into a "higher" git
> tree (drm-next or drm-misc-next) by authorized people after getting a
> final review by Ben or somebody else.
> The idea is to post all collected patches for final review to the
> mailing list as Ben wanted to have a final possibility to nack it in
> case something stands out. We could then depend on Ben including those
> patches, but we could also use commit rights to drm-next or
> drm-misc-next from other people as well. I have commit access to the
> drm-misc repository, and I would assume that Lyude would be able to
> get it as well or already has it.

Hm I'm not sure that double-indirect makes a lot of sense. There's imo two
reasonable models here:

- commit rights on drm/nouveau, Ben sends out the pull requests to
  drm-next for those, which gives him a good point to check over and do
  any last touches

- directly push to drm-misc-next, defacto having a group commit right
  thing going on there directly

Doing first commit rights and then resending the entire pile is way too
much beaurocracy and wont solve much in my experience.

This does mean that there's a lot of trust required for committers, since
if the "drop/revert a patch" part becomes a regularity none of this works
out. Otoh it also doesn't work out if committers aren't trusted, because
then you're stuck in the "not really my problem" space.

This is both from plenty of experience from other kernel teams trying to
do something like this. If you don't have upfront trust, then commit
rights/group maintainership model will simply not work, or at least be
very painful. And yes this means occasionally things go wrong and need to
be fixed up, and more importantly, a discussion about tooling, testing and
review standards is likely required.

For drm-misc/intel we handle those by asking for improvements to the dim
tooling/docs anytime something goes wrong. This way hopefully the entire
team learns.

> 5. Urgent fixes should land via drm-fixes or drm-misc-fixes.
> We kind of already do this already though. We could spin up a
> nouveau-fixes branch in the future, but the amount of such fixes is so
> low it's not really worth the effort at the moment. And we have access
> to drm-misc.

drm.git trees pretty much only take pull requests because Dave&me are
lazy. We do push the occasionally hotfix if someone managed to set the
tree on fire, but that's it (usually because we still suck at CI).

Imo for fixes just make drm-misc the official place.

> Once we decide to start and agree to some process, we should try it
> out with trivial patches, we already get enough of. Like Typo fixes,
> patches adding docs or removing dead code and can expand this to more
> "serious" work once we agree that it actually works and does have
> benefits to nouveau overall.
> 
> Any thoughts on this?

Imo start out with fixes in drm-misc-fixes, and leave feature work and
anything substantial to the current skeggsb/nouveau process. Then reasses
how that's going and what needs to be improved (like get the CI infra up
and running meanwhile, maybe move the repo to drm/nouveau if you feel
like, that kind of stuff).

At least a get a bit a feeling for big stuff nouveau aint ready yet for
group maintainership, judging from what you're proposing here. This also
allows you to experiment around more with gitlab CI and maybe MR, perhaps
nouveau will got directly to that for group maintainership (with Ben and
Marge bot as sole committers)?

Plus I think offloading and speeding up the simple fixes should help a lot
already in making nouveau more alive and perhaps attracting new
contributors.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
