Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0713762E1
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 11:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B436EE08;
	Fri,  7 May 2021 09:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB506EE08
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 09:32:17 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l13so8461539wru.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9eDOlp4ivrXGyGxFrC5mT+pHrXcxm+0PNX0zIIhi6K8=;
 b=iIdjBwFh7ykGwTBR/ifGxFpJQ5O84rBlGmmGyn4J7QDRM9WKqQBpnkBC/rYYfBJXYv
 leUAJwGk53Ht1tNEFnz/9CZqpFSiHtfR8jxEsPEQlNKQO9gwyVCkc/tCEwBhmswbcV9o
 I7f7fh5Qfmr+s3b+foTWYCf4EHX5k9idcRYh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9eDOlp4ivrXGyGxFrC5mT+pHrXcxm+0PNX0zIIhi6K8=;
 b=nx1X371aVrEi7BOWjR/WDFXkweLaY83K54XKQbuzl15oJ9VsxSdZH8H9H7rv114Q5x
 MhegDH7KQ5apRrlfU71B6efuKe/ds8ceXQMWDlDYAhgIHtgoK0y+jlExO/oVk/nWig4I
 mBCtbWKK8zvuqZ/kizxMaVPNB9nIW0+GJlduQuC4yqimI2L/eENO09hepp4aHSkmVxPQ
 aEN53jnFetD90I3KMusGfq1CEL9FtHr14vh6gFWhEKgJS/hyYUMU5QO8NpZLpU8tv6KU
 tj+k20JyI8XC78eIAZROrVSlX7WReRWa/zzkHUM33PzzcpCNiGGmO8jOdvSmdFK3YKFK
 Hh5Q==
X-Gm-Message-State: AOAM5334fcSe//cDMDcz/bctJ6LwPhHpazUnb8lqJmXC51tSPBbKWab/
 zErbzf/Qd0PKsnAPwc7EFo1UeA==
X-Google-Smtp-Source: ABdhPJz7ZbZh/wUR4GNn6eXJGljExlNZorNdyaS/WriG5RVPvLhY1K08ufGg5w6+wM34mckvVZVyAg==
X-Received: by 2002:adf:eec4:: with SMTP id a4mr11255879wrp.159.1620379935789; 
 Fri, 07 May 2021 02:32:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t2sm13314788wmg.38.2021.05.07.02.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 02:32:15 -0700 (PDT)
Date: Fri, 7 May 2021 11:32:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [RFC] CRIU support for ROCm
Message-ID: <YJUJHaP29N94NhXl@phenom.ffwll.local>
References: <9245171d-ecc9-1bdf-3ecd-cf776dc17855@amd.com>
 <CAKMK7uGc6hqY0AasiE=rtF2EitGF7MaMxv7FYJ41O9aj8=__Vg@mail.gmail.com>
 <232d301f-cf57-85b1-6bbf-11bddc634189@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <232d301f-cf57-85b1-6bbf-11bddc634189@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
 Jason Ekstrand <jason@jlekstrand.net>, Adrian Reber <adrian@lisas.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:10:15PM -0400, Felix Kuehling wrote:
> Am 2021-05-04 um 9:00 a.m. schrieb Daniel Vetter:
> > On Fri, Apr 30, 2021 at 09:57:45PM -0400, Felix Kuehling wrote:
> >> We have been working on a prototype supporting CRIU (Checkpoint/Restore
> >> In Userspace) for accelerated compute applications running on AMD GPUs
> >> using ROCm (Radeon Open Compute Platform). We're happy to finally share
> >> this work publicly to solicit feedback and advice. The end-goal is to
> >> get this work included upstream in Linux and CRIU. A short whitepaper
> >> describing our design and intention can be found on Github:
> >> https://github.com/RadeonOpenCompute/criu/tree/criu-dev/test/others/ext-kfd/README.md
> >>
> >> We have RFC patch series for the kernel (based on Alex Deucher's
> >> amd-staging-drm-next branch) and for CRIU including a new plugin and a
> >> few core CRIU changes. I will send those to the respective mailing lists
> >> separately in a minute. They can also be found on Github.
> >>
> >>     CRIU+plugin: https://github.com/RadeonOpenCompute/criu/commits/criu-dev
> >>     Kernel (KFD):
> >>     https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/commits/fxkamd/criu-wip
> >>
> >> At this point this is very much a work in progress and not ready for
> >> upstream inclusion. There are still several missing features, known
> >> issues, and open questions that we would like to start addressing with
> >> your feedback.
> > Since the thread is a bit split I'm dumping the big thoughts here on this
> > RFC.
> >
> > We've discussed this in the past, but I'm once more (insert meme here)
> > asking whether continuing to walk down the amdgpu vs amdkfd split is
> > really the right choice. It starts to feel a bit much like sunk cost
> > fallacy ...
> 
> Hi Daniel,
> 
> Thanks for the feedback. I have some comments to your specific points
> below. This is my own opinion at this point and may not reflect AMDs
> position. I'm starting some internal discussions about unifying the KFD
> and graphics APIs in the long run. But IMO this is going to take years
> and won't be supported on our current compute GPUs, including Aldebaran
> which isn't even released yet.

Well yeah that's why I'm bringing this up early (and I think we're at
round 2 or 3 on this discussion by now). I know how many years this takes
to roll out.

> > - From the big thread we're having right now on dri-devel it's clear that
> >   3d will also move towards more and more a userspace submit model.
> 
> I'll need to start following dri-devel more closely and take a more
> active role in those discussions. If there is an opportunity for a
> unified memory management and command submission model for graphics and
> compute on future hardware, I want to be sure that our compute
> requirements are understood early on.
> 
> 
> >  But
> >   due to backwards compat issues it will be a mixed model, and in some
> >   cases we need to pick at runtime which model we're picking. A hard split
> >   between the amdgpu and the amdkfd world gets in the way here.
> 
> Backwards compatibility will force us to maintain KFD at least for GFXv9
> and older AMD GPUs. As I understand it, the new user mode command
> submission model will only be viable on GFXv10 or even newer GPUs. GFXv9
> is our architecture for current compute GPUs (including Aldebaran which
> is still in development), so this is going to be important for us for
> years to come.

Yeah this is definitely a 5 year plus plan.

> > - There's use-cases for doing compute in vulkan (that was a discussion
> >   from Feb that I kicked again in private, since I think still
> >   unresolved). So you need a vulkan stack that runs on both amdgpu and
> >   amdvlk.
> 
> By amdvlk, do you mean AMD's "pro" driver that supports our non-RADV
> Vulcan driver?

Yeah that's what I heard at least from Alex (If I recall correctly).
People seem to be using vulkan for cloud compute. This came up when we
talked about enforcing a default timeout for compute engines on the amdgpu
side (kernel can hang if you dont), and I think John Bridgman mentioned
the proper fix was to move at least opencl over to use amdkfd by default.


> > - Maybe not yet on amd's radar, but there's a lot of cloud computing. And
> >   maybe they also want CRIU for migrating their containers around. So that
> >   means CRIU for amdgpu too, not just amdkf.
> 
> Our strategy for compute support (OpenCL, HIP, OpenMP and mayby future
> C++ standards) is to use ROCm on all current and future GPUs starting
> with GFXv9. As long as ROCm is based on KFD, that means our compute
> stack runs on KFD. We don't see KFD as something mutually exclusive with
> graphics. They are different ioctl APIs, but they're sharing the
> hardware and memory and are meant to work together.
> 
> We are already planning to add CRIU support to our render node API
> because video acceleration on our compute stack still relies on Mesa and
> the render node CS API.
> 
> I admit, that we are not currently considering Vulcan as part of our
> compute stack. I don't think it makes sense to build Vulcan on top of
> ROCm because we have no plans to add graphics support to ROCm. What
> commonality there is between Vulcan and other compute APIs will need to
> be addressed at a lower level. If graphics is moving to user mode
> command submission and a shared virtual memory model, I see an
> opportunity to move ROCm to a common ioctl API on those future hardware
> generations.
> 
> 
> >
> > - What's much worse, and I don't think anyone in amd has realized this yet
> >   (at least not in a public thread I've seen). In vulkan you need to be
> >   able to switch from compute mode to dma-fence mode after
> >   pipelines/devices have been created already. This is because winsys are
> >   only initialized in a second step, until that's done you have to
> >   pessimistically assume that the user does pure compute. What's worse for
> >   buffer sharing you don't even have a clear signal on this stuff. So
> >   either
> >
> >   - you figure out how to migrate all the buffers and state from amdkfd to
> >     amdgpu at runtime, and duplicate all the features. Which is rather
> >     pointless.
> >
> >   - or you duplicate all the compute features to amdgpu so that vk can use
> >     them, and still reasonably easy migrate to winsys/dma-fence mode,
> >     which makes amdkfd rather redundant.
> 
> The basic "compute features" that ROCm depends on are a
> shared-virtual-memory model and user mode command submission. If those
> become part of the graphics ioctl API, I see no problem with
> implementing proper Vulcan compute on top of it.
> 
> For more consistent support for tools such as debugger, profilers, CRIU,
> etc. it would make sense to have a common ioctl API for ROCm and Vulcan,
> which would effectively deprecate the KFD API. And I'm definitely open
> to working on that for future HW generations that can support it.
> 
> We'll probably have to pick a target GPU where we make such a switch,
> and use the time until then to get things ready, prototyping in current
> GFXv10 or newer GPUs. This feels to me a bit like the transition from
> radeon to amdgpu, where GFXv7 was supported by both for some time.
> 
>  
> 
> >
> >   I've discussed this problem extensively with Jason Ekstrand, and it's
> >   really nasty.
> >
> > So purely from a technical pov, only looking at the AMD perspective here,
> > this doesn't make much sense to me. The only reason to keep doubling down
> > on amdkfd I'm seeing is that you've built your compute rocm stack on top
> > of it, and because of that the only option is to keep doing that. Which
> > stops making sense eventually, and we're getting to that point for sure.
> 
> As long as our compute GPUs are based on the GFXv9 architecture, I think
> we don't really have an alternative than to double down on KFD. We can't
> just stop work on KFD and tell our customers that they'll not get any
> new features for the next 2 or 3 years that it takes to build a common
> upstream memory management and scheduling API and the HW that can
> support it.
> 
> 
> >
> > The other side is a bit the upstream side, but that's a lot smaller:
> >
> > - vulkan compute is one of the more reasonable ways to get cross vendor
> >   compute ecosystem off the ground. At least from what I know from
> >   background chatter, which you guys probably haven't all heard. amdkfd
> >   being the single very odd driver here requiring entirely different uapi
> >   for compute mode is not going to be great.
> 
> Like I said, KFD is not exclusive with anything else.
> 
> Vulcan may be a good option for desktops. For HPC uses or general
> portable non-graphics compute code, I think something like OpenMP or
> future C++ standards would be a better way forward. There is no
> technical reason why both cannot coexist in the same application.
> 
> 
> >
> > - CRIU will need new access rights handling (for the save/restore/resume
> >   stuff you're adding). Generally we standardize access rights checks
> >   across drivers, and leave everything else to render drivers (command
> >   submission, memory management, ...). By adding CRIU support to amdkfd
> >   we pretty much guarantee that we wont be able to standardize CRIU access
> >   rights across drivers. Which just plains sucks from an
> >   upstream/cross-vendor ecosystem pov.
> 
> By access rights, do you mean requiring root for some ioctls, or being
> ptrace-attached for others? These are driven by how CRIU works and
> interacts with its target processes. I think they will apply equally to
> any driver implementing CRIU support. I don't see how graphics drivers
> specifically drive standardization of CRIU access rights.

Ah ok if that's all already 100% defined by CRIU I guess should be all
fine.

> > And yes we'd still need a per-driver criu plugin in userspace, but the
> > same is true for amdvlk/radv/anv/ and all the other drivers we have:
> > Driver is different, access right management is still the same.
> >
> > And secondly, just because nvidia refuses to collaborate in any
> > standards around gpu compute doesn't mean that's a good reason for us to
> > do the same in upstream.
> >
> > Thirdly, it sounds like this is the first device-driver CRIU support, so I
> > think we need a solid agreement/standard here to set as an example for
> > everyone else. There's all the AI accel chips and fpga-for-compute stuff
> > that I expect will eventually also gain CRIU support.
> 
> Sure. My experience with CRIU so far is, that CRIU requires root (even
> without our plugin). Regardless of that, CRIU attaches to the target
> process with ptrace. The kernel's security policy for allowing ptrace
> access is influenced by many factors. We chose not to duplicate this in
> the driver. Therefore we check whether the caller of our CRIU dump ioctl
> is ptrace attached. If it is, it means it has passed all the kernel's
> security checks. We deliberately do not want to implement our own
> security policy in the driver.
> 
> There would be ways to remove the root requirement from our CRIU
> restore-ioctl, if that becomes a requirement for CRIU. It would mean
> some sanity checking of the HW state that's getting restored.

Hm so how does this work for fd passing? Like if an fd is passed among
multiple processes, do you need ptrace for all of them? Or do you check in
amdkfd that you have ptrace rights for the process it's attached too?

Maybe more relevant questions for the amdgpu side of CRIU.

> > So I'm asking once more, is this _really_ the right path forward? Both for
> > amd (at least long term), but also somewhat for upstream.
> 
> I think long-term it makes sense to plan for a unified API. For current
> hardware I don't see a way to get there for multiple reasons:
> 
>  1. Maintaining backwards compatibility with existing user mode
>  2. Lacking HW capabilities for graphics user mode command submission
>     and HW scheduling

An aside, but from kernel pov that's not what "compute mode" means. It's
just about not using dma_fence for tracking command submission, but
instead userspace fences and only having a preempt-ctx fence. So all you
need is some kind of preempt support on your engine, not userspace
submission. Afaiui windows has been using userspace fences since 10 years
now, so pretty sure your hw can do that.

Also I'm pretty sure the vk compute stuff doesn't use the 3d engine, that
would be mildly silly :-)

> Therefore KFD will be important for AMD's compute GPU strategy and our
> customers for years to come. Not being able to continue developing it
> upstream would be a major impediment for AMD. Again, this is my personal
> opinion.

So answer all the others in a wash-up, I think there's two items:

- We're not ditching existing hw support for anything.

- I think AMD needs to talk a bit more across the kfd/gpu split and figure
  out what to actually do here. If you guys only start this by the time
  the code shows up on dri-devel your a few years too late, and will be
  eventually some big disappointment.

Looking at all the various compute efforts going on the split between
compute and 3d really isn't that big. And I don't expect there'll be any
other driver stack doing it, so amdkfd is quite the odd one out.
-Daniel

> 
> Regards,
>   Felix
> 
> 
> >
> > Cheers, Daniel
> >
> >
> >> What's working and tested at this point:
> >>
> >>   * Checkpoint and restore accelerated machine learning apps: PyTorch
> >>     running Bert on systems with 1 or 2 GPUs (MI50 or MI100), 100%
> >>     unmodified user mode stack
> >>   * Checkpoint on one system, restore on a different system
> >>   * Checkpoint on one GPU, restore on a different GPU
> >>
> >> Major Known issues:
> >>
> >>   * The KFD ioctl API is not final: Needs a complete redesign to allow
> >>     future extension without breaking the ABI
> >>   * Very slow: Need to implement DMA to dump VRAM contents
> >>
> >> Missing or incomplete features:
> >>
> >>   * Support for the new KFD SVM API
> >>   * Check device topology during restore
> >>   * Checkpoint and restore multiple processes
> >>   * Support for applications using Mesa for video decode/encode
> >>   * Testing with more different GPUs and workloads
> >>
> >> Big Open questions:
> >>
> >>   * What's the preferred way to publish our CRIU plugin? In-tree or
> >>     out-of-tree?
> >>   * What's the preferred way to distribute our CRIU plugin? Source?
> >>     Binary .so? Whole CRIU? Just in-box support?
> >>   * If our plugin can be upstreamed in the CRIU tree, what would be the
> >>     right directory?
> >>
> >> Best regards,
> >>   Felix
> >>
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch/

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
