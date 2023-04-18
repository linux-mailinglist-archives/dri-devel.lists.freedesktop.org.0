Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519EC6E5BE1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A1210E10A;
	Tue, 18 Apr 2023 08:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DED410E10A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:19:30 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f05f61adbeso9114685e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681805967; x=1684397967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r5lLAP+iO3yZE3FSNZl0V8z+KvVulAZJeii9duiH7kI=;
 b=cvDD/rLcz7954AaCI6LF7pXwN+aW6tOcdS+XMskfIF4pZihEQgCqB/UdM5WnPZyXH6
 75GscbGjFzGrpgR5/bFisHjn8/EfaRj5vff7bn3yNNsu0RMWZYIyY0eoPRgeNHWdZxWm
 WUY70WClRRjMIjzV1r9PmLQzpaJIaqOmUXjnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681805967; x=1684397967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5lLAP+iO3yZE3FSNZl0V8z+KvVulAZJeii9duiH7kI=;
 b=IvbwUyvh8PHtMVkCzcKiqX+P+wDOXRb+cc+8KHVISbfdmJdibWnA5jISDHZTLrfUGG
 l/FAZtUxkVkuaGmeaZ0bl1+fhF6USUzk6ZyjvLcrbfBDz5U8CKt9Nnxnn9pj7EkrRrjh
 L0R38tRKSbFPoA3KQRS9eQxOCgYzTQ0QKNymiLeAhNpIS+JHDGtdc1Mo02HZaIxBiTEC
 rnayTwKfhri8Qrb+aZ4FQviYdZvpHIA8ti9+Z/ngnqFgnr2lzBOajRAzukLtOzwWz8Oe
 Pjhhf+lpTe0t09NCFWf/X/lmzxxO8tU6l1gEYBkqqzhhQm9YMlmy3XTE8jE+4XVOoCkc
 KAWg==
X-Gm-Message-State: AAQBX9ffwKebtgSYVOP2KZ2WCQDqQxIonennNjn6pPmcMZ4Obl229q3W
 wgq0SBWzVOr/MII/E8Y7dTZGYw==
X-Google-Smtp-Source: AKy350ZFvLcB8L5dT9IMBNRpovOGKttnDFty1IIKDphysJIozj4ZZ8eH5Bhi8dKn6whJyXElvEaMtw==
X-Received: by 2002:a05:600c:5115:b0:3f1:7a10:f2f2 with SMTP id
 o21-20020a05600c511500b003f17a10f2f2mr968188wms.1.1681805967366; 
 Tue, 18 Apr 2023 01:19:27 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b003f17b96793dsm85250wmo.37.2023.04.18.01.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 01:19:26 -0700 (PDT)
Date: Tue, 18 Apr 2023 10:19:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [RFC PATCH v2 0/2] Imagination Technologies PowerVR DRM driver
Message-ID: <ZD5SjEHs3/y/rSwK@phenom.ffwll.local>
References: <20230413103419.293493-1-sarah.walker@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413103419.293493-1-sarah.walker@imgtec.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64
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
Cc: gfx-opensource@list.ti.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, afd@ti.com, detheridge@ti.com,
 boris.brezillon@collabora.com, rs@ti.com, donald.robson@imgtec.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 11:34:17AM +0100, Sarah Walker wrote:
> This patch adds the initial DRM driver for Imagination Technologies PowerVR
> GPUs, starting with those based on our Rogue architecture. It's worth pointing
> out that this is a new driver, written from the ground up, rather than a
> refactored version of our existing downstream driver (pvrsrvkm).
> 
> This new DRM driver supports:
> - GEM shmem allocations
> - dma-buf / PRIME
> - Per-context (device node open) userspace managed virtual address space
> - DRM sync objects (binary and timeline)
> - Power management suspend / resume
> - GPU job submission (geometry, fragment, compute, transfer)
> - META firmware processor
> - MIPS firmware processor
> - Basic GPU hang recovery
> 
> Still to do:
> - Document format of job streams and static context state
> - GPU hang detection

Please use drm/sched for this. There's a few reasons:

- linux dma_fence rules are extremely strict, there's pretty much zero
  wiggle room in semantics. Depending upon how your hardware works it
  should still be possible to at least resolve some of the dma_fence cpu
  waits into fw waits if you want that (maybe just within a vkDevice,
  maybe even across processes), but I really don't want 6 different
  versions of "how to convert fw semaphores into dma_fence and get it
  subtle wrong" in upstream.

- linux dma_fence is very much a linux desktop (includes cros) concept
  only. Windows doesn't need this, android doesn't, server hpc (not sure
  that'll be a thing for pvr?) doesn't need this. Hard-worn experience is
  that linux desktop absolutely needs to look like windows/android to the
  gpu or things wont work well enough. If we handle the dma_fence rules in
  shared software (because it really is just a software construct), then
  we get dma_fence compat while driving the gpu 100% like anything else
  would. I haven't checked pvr but some driver teams have been floating
  insteresting secure fw semaphore plans where you'd kinda get something
  that looks like a dma_fence, but in the details it's not.

Also the other reason for drm/sched is shared naming and structures. We
have a lot of "fw-sched, aimed for vk" drivers in the queue for
upstreaming, and if they all invent their complete vendor-specific inhouse
concepts, then drivers defacto become unreadable for anyone else. So they
need to be infused with at least the shared concepts so that I can git
grep drm_sched and find the pieces I want to look at, and not be forced to
read the entire driver.

Related to this I think all vk-first drivers should also adopt the
under-discussion gpuva/vm_bind/whatever you call it shared concepts. What
exactly that looks like is still tbd I think, but again some minimal
shared structs/concepts in this space, while retaining all the flexibility
drivers need, is called for.

I think aside from these two areas going full hw specific is all fine.

Uapi review is all up to mesa folks imo (and the consensus
reached&documented around vm_bind or whatever it's going to be called).

For the driver itself just a few comments:
- you use devm_ already, also using drmm_ is probably a good idea.

- the hand-rolled pvr_gem.c does not look good, I think we're way past the
  point where drivers hand-rolling entire gem from nothing is ready for
  upstream.

- I think it would be really good to use the dma_fence signalling critical
  section annotations (I plan to resend the ones I have for drm/sched so
  that they're opt-out for current drivers, but not for new ones). From
  experience you can savely assume you got things wrong without these :-)

Cheers, Daniel


> - Handling for running out of parameter buffer space (this has made progress
>   since RFC v1, but is still incomplete)
> 
> Currently our main focus is on our GX6250, AXE-1-16M and BXS-4-64 GPUs. Testing
> so far has been done using an Acer Chromebook R13 (GX6250 GPU) and a TI SK-AM62
> board (AXE-1-16M GPU). An example SK-AM62 development board can be obtained
> here: https://beagleboard.org/play
> 
> Firmware for the GX6250 and AXE-1-16M can be found here:
> https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr
> 
> A Vulkan driver that works with our downstream kernel driver has already been
> merged into Mesa [1][2]. Support for this new DRM driver is being maintained in
> a draft merge request [3], with the branch located here:
> https://gitlab.freedesktop.org/frankbinns/mesa/-/tree/powervr-winsys
> 
> The Vulkan driver is progressing towards Vulkan 1.0. We're code complete, and
> are working towards passing conformance. This is a work in progress, so we're
> not sharing numbers just yet.
> 
> We are still looking at whether any functionality can be replaced with DRM
> common code. We are still considering drm_sched and the GPU VA manager.
> 
> The code in this patch, along with some of its history, can also be found here:
> https://gitlab.freedesktop.org/frankbinns/powervr/-/tree/powervr-next
> 
> Sending this out now as it felt like a good point to get some feedback.
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15243
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulkan
> [3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15507
> 
> v2:
> * Redesigned and simplified UAPI based on RFC feedback from XDC 2022
> * Support for transfer and partial render jobs
> * Support for timeline sync objects
> 
> RFC v1: https://lists.freedesktop.org/archives/dri-devel/2022-August/367814.html
> 
> Sarah Walker (2):
>   drm/imagination: Add initial Imagination Technologies PowerVR driver
>   dt-bindings: gpu: Add Imagination Technologies PowerVR GPU
> 
>  .../devicetree/bindings/gpu/img,powervr.yaml  |  105 +
>  drivers/gpu/drm/imagination/Kconfig           |   11 +
>  drivers/gpu/drm/imagination/Makefile          |   36 +
>  drivers/gpu/drm/imagination/pvr_ccb.c         |  380 +
>  drivers/gpu/drm/imagination/pvr_ccb.h         |   51 +
>  drivers/gpu/drm/imagination/pvr_cccb.c        |  390 ++
>  drivers/gpu/drm/imagination/pvr_cccb.h        |  112 +
>  drivers/gpu/drm/imagination/pvr_context.c     | 1428 ++++
>  drivers/gpu/drm/imagination/pvr_context.h     |  412 ++
>  drivers/gpu/drm/imagination/pvr_debugfs.c     |   53 +
>  drivers/gpu/drm/imagination/pvr_debugfs.h     |   29 +
>  drivers/gpu/drm/imagination/pvr_device.c      |  762 ++
>  drivers/gpu/drm/imagination/pvr_device.h      |  760 ++
>  drivers/gpu/drm/imagination/pvr_device_info.c |  223 +
>  drivers/gpu/drm/imagination/pvr_device_info.h |  133 +
>  drivers/gpu/drm/imagination/pvr_drv.c         | 1634 +++++
>  drivers/gpu/drm/imagination/pvr_drv.h         |   89 +
>  drivers/gpu/drm/imagination/pvr_dump.c        |  353 +
>  drivers/gpu/drm/imagination/pvr_dump.h        |   17 +
>  drivers/gpu/drm/imagination/pvr_free_list.c   |  559 ++
>  drivers/gpu/drm/imagination/pvr_free_list.h   |  185 +
>  drivers/gpu/drm/imagination/pvr_fw.c          | 1107 +++
>  drivers/gpu/drm/imagination/pvr_fw.h          |  345 +
>  drivers/gpu/drm/imagination/pvr_fw_info.h     |  115 +
>  drivers/gpu/drm/imagination/pvr_fw_meta.c     |  598 ++
>  drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
>  drivers/gpu/drm/imagination/pvr_fw_mips.c     |  276 +
>  drivers/gpu/drm/imagination/pvr_fw_mips.h     |   38 +
>  .../gpu/drm/imagination/pvr_fw_startstop.c    |  279 +
>  .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
>  drivers/gpu/drm/imagination/pvr_fw_trace.c    |  505 ++
>  drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
>  drivers/gpu/drm/imagination/pvr_gem.c         | 1122 +++
>  drivers/gpu/drm/imagination/pvr_gem.h         |  386 +
>  drivers/gpu/drm/imagination/pvr_hwrt.c        |  551 ++
>  drivers/gpu/drm/imagination/pvr_hwrt.h        |  163 +
>  drivers/gpu/drm/imagination/pvr_job.c         | 1096 +++
>  drivers/gpu/drm/imagination/pvr_job.h         |  116 +
>  drivers/gpu/drm/imagination/pvr_params.c      |  147 +
>  drivers/gpu/drm/imagination/pvr_params.h      |   72 +
>  drivers/gpu/drm/imagination/pvr_power.c       |  196 +
>  drivers/gpu/drm/imagination/pvr_power.h       |   37 +
>  .../gpu/drm/imagination/pvr_rogue_cr_defs.h   | 6193 +++++++++++++++++
>  .../imagination/pvr_rogue_cr_defs_client.h    |  160 +
>  drivers/gpu/drm/imagination/pvr_rogue_defs.h  |  179 +
>  drivers/gpu/drm/imagination/pvr_rogue_fwif.h  | 2271 ++++++
>  .../drm/imagination/pvr_rogue_fwif_check.h    |  491 ++
>  .../drm/imagination/pvr_rogue_fwif_client.h   |  369 +
>  .../imagination/pvr_rogue_fwif_client_check.h |  133 +
>  .../drm/imagination/pvr_rogue_fwif_common.h   |   60 +
>  .../pvr_rogue_fwif_resetframework.h           |   29 +
>  .../gpu/drm/imagination/pvr_rogue_fwif_sf.h   |  890 +++
>  .../drm/imagination/pvr_rogue_fwif_shared.h   |  258 +
>  .../imagination/pvr_rogue_fwif_shared_check.h |  107 +
>  .../drm/imagination/pvr_rogue_fwif_stream.h   |   78 +
>  .../drm/imagination/pvr_rogue_heap_config.h   |  113 +
>  drivers/gpu/drm/imagination/pvr_rogue_meta.h  |  356 +
>  drivers/gpu/drm/imagination/pvr_rogue_mips.h  |  335 +
>  .../drm/imagination/pvr_rogue_mips_check.h    |   56 +
>  .../gpu/drm/imagination/pvr_rogue_mmu_defs.h  |  136 +
>  drivers/gpu/drm/imagination/pvr_stream.c      |  321 +
>  drivers/gpu/drm/imagination/pvr_stream.h      |   74 +
>  drivers/gpu/drm/imagination/pvr_stream_defs.c |  270 +
>  drivers/gpu/drm/imagination/pvr_stream_defs.h |   14 +
>  drivers/gpu/drm/imagination/pvr_vendor.h      |   77 +
>  drivers/gpu/drm/imagination/pvr_vm.c          | 3811 ++++++++++
>  drivers/gpu/drm/imagination/pvr_vm.h          |   99 +
>  drivers/gpu/drm/imagination/pvr_vm_mips.c     |  223 +
>  drivers/gpu/drm/imagination/pvr_vm_mips.h     |   22 +
>  .../gpu/drm/imagination/vendor/pvr_mt8173.c   |  121 +
>  include/uapi/drm/pvr_drm.h                    | 1502 ++++
>  71 files changed, 33724 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
>  create mode 100644 drivers/gpu/drm/imagination/Kconfig
>  create mode 100644 drivers/gpu/drm/imagination/Makefile
>  create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_context.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_context.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_drv.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_drv.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_dump.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_dump.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_info.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_gem.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_gem.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_job.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_job.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_params.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_power.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs_client.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_common.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_resetframework.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared_check.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_stream.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_meta.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vendor.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
>  create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
>  create mode 100644 drivers/gpu/drm/imagination/vendor/pvr_mt8173.c
>  create mode 100644 include/uapi/drm/pvr_drm.h
> 
> -- 
> 2.40.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
