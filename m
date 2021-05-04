Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D9372A8F
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9056EAD3;
	Tue,  4 May 2021 13:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E594E6EAD3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:00:36 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 c36-20020a05683034a4b02902a5b84b1d12so7719899otu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e08hAJ6bdI2gXW2f978xthch9Y1e0U6MDJjD0AVqsuY=;
 b=aIhp2H6fCPLTSh8Zss/AzHFBPfPG7rgNAPi0J3qnYtLcLqj/CxLaWcVI6MC9eNsPhc
 SmvYsTqiNU4+HeJaDq0Hltg4ImOas7go77ZJ2lK5qVDlsuQ70XZkcuaMAUIppey7DqMW
 x8HqJZ5/2hQILMUX8+RIs0XP5Z7dVgYXhER9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e08hAJ6bdI2gXW2f978xthch9Y1e0U6MDJjD0AVqsuY=;
 b=IyYEeHjJ1FDSFhhdHZKvP8/cIRrXnbaBO7Bl4t0DxDjQN3GB0iRHvMhzT9DMNEofPg
 tLVzWLzsEExWCQ/2AvBnl+5r3RDgIHm0qeSLiCRdd2QbXHcx9ubqmq/UA07DFOGHvLb2
 f4jDhf3Qo2j7pQnzH2FcRWIdIKOuCx8T89lM6vbVQNGFSpPaInEDYpzHDCjq9m8cMGty
 H3rXrZSOq5wgI9RYUIYjEg9iiV8Z0W/KITxWt0ZgGtdAdJyf/fR/ezK/lumF26ReDyKw
 LHC7f7AHZ9cThjJNKxsR56z7w7DzPaGLFosv5nsVPbwijMvg6UWtMfBA6iLHLWO9o4PZ
 ZH6g==
X-Gm-Message-State: AOAM5330C53AMfhk/WP+wQkzngMHzIm4ZwxSzLksohMtlbGZ5XzIOMbu
 9W0TH+F8I2teOfyj3q1U0Vs5FrwKhO6sUJLcvmzcJA==
X-Google-Smtp-Source: ABdhPJwvQcZsXcenghmF3/5PPwh0Ll1C9oHzzzduL8oMCzqQj1cb52AkMWz95rcX9RaEQ6NCZU5G6rr/AczY4A943o8=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr19425482otq.281.1620133236081; 
 Tue, 04 May 2021 06:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <9245171d-ecc9-1bdf-3ecd-cf776dc17855@amd.com>
In-Reply-To: <9245171d-ecc9-1bdf-3ecd-cf776dc17855@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 May 2021 15:00:24 +0200
Message-ID: <CAKMK7uGc6hqY0AasiE=rtF2EitGF7MaMxv7FYJ41O9aj8=__Vg@mail.gmail.com>
Subject: Re: [RFC] CRIU support for ROCm
To: Felix Kuehling <felix.kuehling@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Alexander Mihalicyn <alexander@mihalicyn.com>,
 Pavel Emelyanov <ovzxemul@gmail.com>, "Bhardwaj,
 Rajneesh" <Rajneesh.Bhardwaj@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pavel Tikhomirov <snorcht@gmail.com>, criu@openvz.org, "Yat Sin,
 David" <David.YatSin@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Adrian Reber <adrian@lisas.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 09:57:45PM -0400, Felix Kuehling wrote:
> We have been working on a prototype supporting CRIU (Checkpoint/Restore
> In Userspace) for accelerated compute applications running on AMD GPUs
> using ROCm (Radeon Open Compute Platform). We're happy to finally share
> this work publicly to solicit feedback and advice. The end-goal is to
> get this work included upstream in Linux and CRIU. A short whitepaper
> describing our design and intention can be found on Github:
> https://github.com/RadeonOpenCompute/criu/tree/criu-dev/test/others/ext-kfd/README.md.
>
> We have RFC patch series for the kernel (based on Alex Deucher's
> amd-staging-drm-next branch) and for CRIU including a new plugin and a
> few core CRIU changes. I will send those to the respective mailing lists
> separately in a minute. They can also be found on Github.
>
>     CRIU+plugin: https://github.com/RadeonOpenCompute/criu/commits/criu-dev
>     Kernel (KFD):
>     https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/commits/fxkamd/criu-wip
>
> At this point this is very much a work in progress and not ready for
> upstream inclusion. There are still several missing features, known
> issues, and open questions that we would like to start addressing with
> your feedback.

Since the thread is a bit split I'm dumping the big thoughts here on this
RFC.

We've discussed this in the past, but I'm once more (insert meme here)
asking whether continuing to walk down the amdgpu vs amdkfd split is
really the right choice. It starts to feel a bit much like sunk cost
fallacy ...

- From the big thread we're having right now on dri-devel it's clear that
  3d will also move towards more and more a userspace submit model. But
  due to backwards compat issues it will be a mixed model, and in some
  cases we need to pick at runtime which model we're picking. A hard split
  between the amdgpu and the amdkfd world gets in the way here.

- There's use-cases for doing compute in vulkan (that was a discussion
  from Feb that I kicked again in private, since I think still
  unresolved). So you need a vulkan stack that runs on both amdgpu and
  amdvlk.

- Maybe not yet on amd's radar, but there's a lot of cloud computing. And
  maybe they also want CRIU for migrating their containers around. So that
  means CRIU for amdgpu too, not just amdkf.

- What's much worse, and I don't think anyone in amd has realized this yet
  (at least not in a public thread I've seen). In vulkan you need to be
  able to switch from compute mode to dma-fence mode after
  pipelines/devices have been created already. This is because winsys are
  only initialized in a second step, until that's done you have to
  pessimistically assume that the user does pure compute. What's worse for
  buffer sharing you don't even have a clear signal on this stuff. So
  either

  - you figure out how to migrate all the buffers and state from amdkfd to
    amdgpu at runtime, and duplicate all the features. Which is rather
    pointless.

  - or you duplicate all the compute features to amdgpu so that vk can use
    them, and still reasonably easy migrate to winsys/dma-fence mode,
    which makes amdkfd rather redundant.

  I've discussed this problem extensively with Jason Ekstrand, and it's
  really nasty.

So purely from a technical pov, only looking at the AMD perspective here,
this doesn't make much sense to me. The only reason to keep doubling down
on amdkfd I'm seeing is that you've built your compute rocm stack on top
of it, and because of that the only option is to keep doing that. Which
stops making sense eventually, and we're getting to that point for sure.

The other side is a bit the upstream side, but that's a lot smaller:

- vulkan compute is one of the more reasonable ways to get cross vendor
  compute ecosystem off the ground. At least from what I know from
  background chatter, which you guys probably haven't all heard. amdkfd
  being the single very odd driver here requiring entirely different uapi
  for compute mode is not going to be great.

- CRIU will need new access rights handling (for the save/restore/resume
  stuff you're adding). Generally we standardize access rights checks
  across drivers, and leave everything else to render drivers (command
  submission, memory management, ...). By adding CRIU support to amdkfd
  we pretty much guarantee that we wont be able to standardize CRIU access
  rights across drivers. Which just plains sucks from an
  upstream/cross-vendor ecosystem pov.

And yes we'd still need a per-driver criu plugin in userspace, but the
same is true for amdvlk/radv/anv/ and all the other drivers we have:
Driver is different, access right management is still the same.

And secondly, just because nvidia refuses to collaborate in any
standards around gpu compute doesn't mean that's a good reason for us to
do the same in upstream.

Thirdly, it sounds like this is the first device-driver CRIU support, so I
think we need a solid agreement/standard here to set as an example for
everyone else. There's all the AI accel chips and fpga-for-compute stuff
that I expect will eventually also gain CRIU support.

So I'm asking once more, is this _really_ the right path forward? Both for
amd (at least long term), but also somewhat for upstream.

Cheers, Daniel


> What's working and tested at this point:
>
>   * Checkpoint and restore accelerated machine learning apps: PyTorch
>     running Bert on systems with 1 or 2 GPUs (MI50 or MI100), 100%
>     unmodified user mode stack
>   * Checkpoint on one system, restore on a different system
>   * Checkpoint on one GPU, restore on a different GPU
>
> Major Known issues:
>
>   * The KFD ioctl API is not final: Needs a complete redesign to allow
>     future extension without breaking the ABI
>   * Very slow: Need to implement DMA to dump VRAM contents
>
> Missing or incomplete features:
>
>   * Support for the new KFD SVM API
>   * Check device topology during restore
>   * Checkpoint and restore multiple processes
>   * Support for applications using Mesa for video decode/encode
>   * Testing with more different GPUs and workloads
>
> Big Open questions:
>
>   * What's the preferred way to publish our CRIU plugin? In-tree or
>     out-of-tree?
>   * What's the preferred way to distribute our CRIU plugin? Source?
>     Binary .so? Whole CRIU? Just in-box support?
>   * If our plugin can be upstreamed in the CRIU tree, what would be the
>     right directory?
>
> Best regards,
>   Felix
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
