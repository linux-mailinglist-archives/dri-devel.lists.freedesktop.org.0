Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BA569B43B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 21:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3005410F0C6;
	Fri, 17 Feb 2023 20:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DEA10F0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 20:51:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 a11-20020a05600c224b00b003e1f6dff952so1780940wmm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 12:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=roaSNJmGD4M/Xt3txkLHvl2JRoVGxzTony3bfz/hrZE=;
 b=gWBRgkkHZ7KwdRuorZKEj1dMB1kSWrLs2oBZhNeMTRfuPStMx1/8OWdLBbClwts5zD
 EW4BdpGvJyQbn2CfHljU3W82O+jasxUzvbClgdnmttcw+DYq9ZdS1LZz61bgKYGp08Iq
 Fw7Mjob5DdWNIiLSIMZ2hE+coVdHo5bpSTOA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=roaSNJmGD4M/Xt3txkLHvl2JRoVGxzTony3bfz/hrZE=;
 b=TyTqXSGo7LFel/kH6Qr9cLvbudg6SQgG+ux+0ZPZR+//+yUFLpxGn75JuPpi5xW73Z
 YLmXMea3yS1l+ypcs8r3WhMNH/WeEM/3+ywdOoeX/os4nOaSiJaoIVfTdb4qNOxSvFtd
 rr7oA1M0ikEFqvdqpMyxgSzMFJ9bZrWIckCErv5E4fzO7x3R+8lBkI49blijEo/5Q+3l
 SFWfc4PKjdtZ3Btm1ZDtKp+RQFlG2yG1VH6Ju88aZWhbtL7Li4UWseYlTuANi5gagA+k
 aHP5d+8CDUSzNnwnWwE6Hd28PAHlWSr7GGrqk76htEpoi9WhTxHYuRMTWlftm+fw9kOn
 vdaA==
X-Gm-Message-State: AO0yUKUARmmgtUkhJD7yNsgq1HpRQvyLh4UDrtr8DcNP/ez5P+mron79
 cHc+B/BOObpdWQZ+ynCRSWJtAA==
X-Google-Smtp-Source: AK7set/PnVH2Ej9nOPwN/l4wCsCzSmyB0HAXmAWjt3k5lVYEO8+DYl7rEAZD+bowxY3If7+wruQPDA==
X-Received: by 2002:a05:600c:4f82:b0:3d2:231a:cb30 with SMTP id
 n2-20020a05600c4f8200b003d2231acb30mr2859722wmq.3.1676667099602; 
 Fri, 17 Feb 2023 12:51:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adfe6cc000000b002c3dc4131f5sm5046614wrm.18.2023.02.17.12.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 12:51:39 -0800 (PST)
Date: Fri, 17 Feb 2023 21:51:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 00/20] Initial Xe driver submission
Message-ID: <Y+/o2a21Eym3ee/a@phenom.ffwll.local>
References: <20221222222127.34560-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
X-Operating-System: Linux phenom 6.0.0-6-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

[I thought I've sent this out earlier this week, but alas got stuck, kinda
bad timing now since I'm out next week but oh well]

So xe is a quite substantial thing, and I think we need a clear plan how to land
this or it will take forever, and managers will panic. Also I'm not a big fan of
"Dave/me reviews everything", we defacto had that for amd's dc/dal and it was
not fun. The idea here is how to get everything reviewed without having two
people end up somewhat arbitrary as deciders.

I've compiled a bunch of topics on what I think the important areas are, first
code that should be consistent about new-style render drivers that are aimed for
vk/compute userspace as the primary feature driver:

- figure out consensus solution for fw scheduler and drm/sched frontend among
  interested driver parties (probably xe, amdgpu, nouveau, new panfrost)

- for the interface itself it might be good to have the drm_gpu_scheduler as the
  single per-hw-engine driver api object (but internally a new structure), while
  renaming the current drm_gpu_scheduler to drm_gpu_sched_internal. That way I
  think we can address the main critique of the current xe scheduler plan
  - keep the drm_gpu_sched_internal : drm_sched_entity 1:1 relationship for fw
    scheduler
  - keep the driver api relationship of drm_gpu_scheduler : drm_sched_entity
    1:n, the api functions simply iterate over a mutex protect list of internal
    schedulers. this should also help drivers with locking mistakes around
    setup/teardown and gpu reset.
  - drivers select with a flag or something between the current mode (where the
    drm_gpu_sched_internal is attached to the drm_gpu_scheduler api object) or
    the new fw scheduler mode (where drm_gpu_sched_internal is attached to the
    drm_sched_entity)
  - overall still no fundamental changes (like the current patches) to drm/sched
    data structures and algorithms. But unlike the current patches we keep the
    possibility open for eventual refactoring without having to again refactor
    all the drivers. Even better, we can delay such refactoring until we have a
    handful of real-word drivers test-driving this all so we know we actually do
    the right thing. This should allow us to address all the
    fairness/efficiency/whatever concerns that have been floating around without
    having to fix them all up upfront, before we actually know what needs to be
    fixed.

- the generic scheduler code should also including the handling of endless
  compute contexts, with the minimal scaffolding for preempt-ctx fences
  (probably on the drm_sched_entity) and making sure drm/sched can cope with the
  lack of job completion fence. This is very minimal amounts of code, but it
  helps a lot for cross-driver review if this works the same (with the same
  locking and all that) for everyone. Ideally this gets extracted from amdkfd,
  but as long as it's going to be used by all drivers supporting
  endless/compute context going forward it's good enough.

- I'm assuming this also means Matt Brost will include a patch to add himself as
  drm/sched reviewer in MAINTAINERS, or at least something like that

- adopt the gem_exec/vma helpers. again we probably want consensus here among
  the same driver projects. I don't care whether these helpers specify the ioctl
  structs or not, but they absolutely need to enforce the overall locking scheme
  for all major structs and list (so vm and vma).

- we also should have cross-driver consensus on async vm_bind support. I think
  everyone added in-syncobj support, the real fun is probably more in/out
  userspace memory fences (and personally I'm still not sure that's a good idea
  but ... *eh*). I think cross driver consensus on how this should work (ideally
  with helper support so people don't get it wrong in all the possible ways)
  would be best.

- this also means some userptr integration and some consensus how userptr should
  work for vm_bind across drivers. I don't think allowing drivers to reinvent
  that wheel is a bright idea, there's just a bit too much to get wrong here.

- for some of these the consensus might land on more/less shared code than what
  I sketched out above, the important part really is that we have consensus on
  these. Kinda similar to how the atomic kms infrastructure move a _lot_ more of
  the code back into drivers, because they really just needed the flexibility to
  program the hw correctly. Right now we definitely don't have enough shared
  code, for sure with i915-gem, but we also need to make sure we're not
  overcorrecting too badly (a bit of overcorrecting generally doesn't hurt).

All the above will make sure that the driver overall is in concepts and design
aligned with the overall community direction, but I think it'd still be good if
someone outside of the intel gpu group reviews the driver code itself. Last time
we had a huge driver submission (amd's DC/DAL) this fell on Dave&me, but this
time around I think we have a perfect candidate with Oded:

- Oded needs/wants to spend some time on ramping up on how drm render drivers
  work anyway, and xe is probably the best example of a driver that's both
  supposed to be full-featured, but also doesn't contain an entire display
  driver on the side.

- Oded is in Habana, which is legally part of Intel. Bean counter budget
  shuffling to make this happen should be possible.

- Habana is still fairly distinct entity within Intel, so that is probably the
  best approach for some independent review, without making the xe team
  beholden to some non-Intel people.

The above should yield some pretty clear road towards landing xe, without any
big review fights with Dave/me like we had with amd's DC/DAL, which took a
rather long time to land unfortunately :-(

These are just my thoughts, let the bikeshed commence!

Ideally we put them all into a TODO like we've done for DC/DAL, once we have
some consensus.

Cheers, Daniel

On Thu, Dec 22, 2022 at 02:21:07PM -0800, Matthew Brost wrote:
> Hello,
> 
> This is a submission for Xe, a new driver for Intel GPUs that supports both
> integrated and discrete platforms starting with Tiger Lake (first platform with
> Intel Xe Architecture). The intention of this new driver is to have a fresh base
> to work from that is unencumbered by older platforms, whilst also taking the
> opportunity to rearchitect our driver to increase sharing across the drm
> subsystem, both leveraging and allowing us to contribute more towards other
> shared components like TTM and drm/scheduler. The memory model is based on VM
> bind which is similar to the i915 implementation. Likewise the execbuf
> implementation for Xe is very similar to execbuf3 in the i915 [1].
> 
> The code is at a stage where it is already functional and has experimental
> support for multiple platforms starting from Tiger Lake, with initial support
> implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well
> as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO
> implementation will be released publicly early next year. We also have a suite
> of IGTs for XE that will appear on the IGT list shortly.
> 
> It has been built with the assumption of supporting multiple architectures from
> the get-go, right now with tests running both on X86 and ARM hosts. And we
> intend to continue working on it and improving on it as part of the kernel
> community upstream.
> 
> The new Xe driver leverages a lot from i915 and work on i915 continues as we
> ready Xe for production throughout 2023.
> 
> As for display, the intent is to share the display code with the i915 driver so
> that there is maximum reuse there. Currently this is being done by compiling the
> display code twice, but alternatives to that are under consideration and we want
> to have more discussion on what the best final solution will look like over the
> next few months. Right now, work is ongoing in refactoring the display codebase
> to remove as much as possible any unnecessary dependencies on i915 specific data
> structures there..
> 
> We currently have 2 submission backends, execlists and GuC. The execlist is
> meant mostly for testing and is not fully functional while GuC backend is fully
> functional. As with the i915 and GuC submission, in Xe the GuC firmware is
> required and should be placed in /lib/firmware/xe.
> 
> The GuC firmware can be found in the below location:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915
> 
> The easiest way to setup firmware is:
> cp -r /lib/firmware/i915 /lib/firmware/xe
> 
> The code has been organized such that we have all patches that touch areas
> outside of drm/xe first for review, and then the actual new driver in a separate
> commit. The code which is outside of drm/xe is included in this RFC while
> drm/xe is not due to the size of the commit. The drm/xe is code is available in
> a public repo listed below.
> 
> Xe driver commit:
> https://cgit.freedesktop.org/drm/drm-xe/commit/?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7
> 
> Xe kernel repo:
> https://cgit.freedesktop.org/drm/drm-xe/
> 
> There's a lot of work still to happen on Xe but we're very excited about it and
> wanted to share it early and welcome feedback and discussion.
> 
> Cheers,
> Matthew Brost
> 
> [1] https://patchwork.freedesktop.org/series/105879/
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20418
> 
> Maarten Lankhorst (12):
>   drm/amd: Convert amdgpu to use suballocation helper.
>   drm/radeon: Use the drm suballocation manager implementation.
>   drm/i915: Remove gem and overlay frontbuffer tracking
>   drm/i915/display: Neuter frontbuffer tracking harder
>   drm/i915/display: Add more macros to remove all direct calls to uncore
>   drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
>   drm/i915: Rename find_section to find_bdb_section
>   drm/i915/regs: Set DISPLAY_MMIO_BASE to 0 for xe
>   drm/i915/display: Fix a use-after-free when intel_edp_init_connector
>     fails
>   drm/i915/display: Remaining changes to make xe compile
>   sound/hda: Allow XE as i915 replacement for sound
>   mei/hdcp: Also enable for XE
> 
> Matthew Brost (5):
>   drm/sched: Convert drm scheduler to use a work queue rather than
>     kthread
>   drm/sched: Add generic scheduler message interface
>   drm/sched: Start run wq before TDR in drm_sched_start
>   drm/sched: Submit job before starting TDR
>   drm/sched: Add helper to set TDR timeout
> 
> Thomas Hellström (3):
>   drm/suballoc: Introduce a generic suballocation manager
>   drm: Add a gpu page-table walker helper
>   drm/ttm: Don't print error message if eviction was interrupted
> 
>  drivers/gpu/drm/Kconfig                       |   5 +
>  drivers/gpu/drm/Makefile                      |   4 +
>  drivers/gpu/drm/amd/amdgpu/Kconfig            |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  26 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  14 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  23 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c        | 320 +-----------------
>  drivers/gpu/drm/drm_pt_walk.c                 | 159 +++++++++
>  drivers/gpu/drm/drm_suballoc.c                | 301 ++++++++++++++++
>  drivers/gpu/drm/i915/Makefile                 |   2 +-
>  drivers/gpu/drm/i915/display/hsw_ips.c        |   7 +-
>  drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 +
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +
>  .../gpu/drm/i915/display/intel_atomic_plane.c |  25 +-
>  .../gpu/drm/i915/display/intel_backlight.c    |   2 +-
>  drivers/gpu/drm/i915/display/intel_bios.c     |  71 ++--
>  drivers/gpu/drm/i915/display/intel_bw.c       |  36 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c    |  68 ++--
>  drivers/gpu/drm/i915/display/intel_color.c    |   1 +
>  drivers/gpu/drm/i915/display/intel_crtc.c     |  14 +-
>  drivers/gpu/drm/i915/display/intel_cursor.c   |  14 +-
>  drivers/gpu/drm/i915/display/intel_de.h       |  38 +++
>  drivers/gpu/drm/i915/display/intel_display.c  | 155 +++++++--
>  drivers/gpu/drm/i915/display/intel_display.h  |   9 +-
>  .../gpu/drm/i915/display/intel_display_core.h |   5 +-
>  .../drm/i915/display/intel_display_debugfs.c  |   8 +
>  .../drm/i915/display/intel_display_power.c    |  40 ++-
>  .../drm/i915/display/intel_display_power.h    |   6 +
>  .../i915/display/intel_display_power_map.c    |   7 +
>  .../i915/display/intel_display_power_well.c   |  24 +-
>  .../drm/i915/display/intel_display_reg_defs.h |   4 +
>  .../drm/i915/display/intel_display_trace.h    |   6 +
>  .../drm/i915/display/intel_display_types.h    |  32 +-
>  drivers/gpu/drm/i915/display/intel_dmc.c      |  17 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       |  11 +-
>  drivers/gpu/drm/i915/display/intel_dp_aux.c   |   6 +
>  drivers/gpu/drm/i915/display/intel_dpio_phy.c |   9 +-
>  drivers/gpu/drm/i915/display/intel_dpio_phy.h |  15 +
>  drivers/gpu/drm/i915/display/intel_dpll.c     |   8 +-
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   4 +
>  drivers/gpu/drm/i915/display/intel_drrs.c     |   1 +
>  drivers/gpu/drm/i915/display/intel_dsb.c      | 124 +++++--
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  26 +-
>  drivers/gpu/drm/i915/display/intel_fb.c       | 108 ++++--
>  drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 -
>  drivers/gpu/drm/i915/display/intel_fbc.c      |  49 ++-
>  drivers/gpu/drm/i915/display/intel_fbdev.c    | 108 +++++-
>  .../gpu/drm/i915/display/intel_frontbuffer.c  | 103 +-----
>  .../gpu/drm/i915/display/intel_frontbuffer.h  |  67 +---
>  drivers/gpu/drm/i915/display/intel_gmbus.c    |   2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |   9 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |   1 -
>  .../gpu/drm/i915/display/intel_lpe_audio.h    |   8 +
>  .../drm/i915/display/intel_modeset_setup.c    |  11 +-
>  drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
>  drivers/gpu/drm/i915/display/intel_overlay.c  |  14 -
>  .../gpu/drm/i915/display/intel_pch_display.h  |  16 +
>  .../gpu/drm/i915/display/intel_pch_refclk.h   |   8 +
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c |   1 +
>  .../drm/i915/display/intel_plane_initial.c    |   3 +-
>  drivers/gpu/drm/i915/display/intel_psr.c      |   1 +
>  drivers/gpu/drm/i915/display/intel_sprite.c   |  21 ++
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |   2 +-
>  drivers/gpu/drm/i915/display/intel_vga.c      |   5 +
>  drivers/gpu/drm/i915/display/skl_scaler.c     |   2 +
>  .../drm/i915/display/skl_universal_plane.c    |  52 ++-
>  drivers/gpu/drm/i915/display/skl_watermark.c  |  25 +-
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 -
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   7 -
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 -
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  25 --
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 --
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 -
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +-
>  drivers/gpu/drm/i915/i915_driver.c            |   1 +
>  drivers/gpu/drm/i915/i915_gem.c               |   8 -
>  drivers/gpu/drm/i915/i915_gem_gtt.c           |   1 -
>  drivers/gpu/drm/i915/i915_reg_defs.h          |   8 +
>  drivers/gpu/drm/i915/i915_vma.c               |  12 -
>  drivers/gpu/drm/radeon/radeon.h               |  55 +--
>  drivers/gpu/drm/radeon/radeon_ib.c            |  12 +-
>  drivers/gpu/drm/radeon/radeon_object.h        |  25 +-
>  drivers/gpu/drm/radeon/radeon_sa.c            | 314 ++---------------
>  drivers/gpu/drm/radeon/radeon_semaphore.c     |   6 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 182 +++++++---
>  drivers/gpu/drm/ttm/ttm_bo.c                  |   3 +-
>  drivers/misc/mei/hdcp/Kconfig                 |   2 +-
>  drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
>  include/drm/drm_pt_walk.h                     | 161 +++++++++
>  include/drm/drm_suballoc.h                    | 112 ++++++
>  include/drm/gpu_scheduler.h                   |  41 ++-
>  sound/hda/hdac_i915.c                         |  17 +-
>  sound/pci/hda/hda_intel.c                     |  56 +--
>  sound/soc/intel/avs/core.c                    |  13 +-
>  sound/soc/sof/intel/hda.c                     |   7 +-
>  98 files changed, 2076 insertions(+), 1325 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pt_walk.c
>  create mode 100644 drivers/gpu/drm/drm_suballoc.c
>  create mode 100644 include/drm/drm_pt_walk.h
>  create mode 100644 include/drm/drm_suballoc.h
> 
> -- 
> 2.37.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
