Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FAB3446DF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439DC6E49C;
	Mon, 22 Mar 2021 14:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2CD6E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:15:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v4so17084952wrp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mlbaWNl6myQL4ImK9SxnSclyhhjtiwHsTJaXNS1CGMs=;
 b=SPFiljPxo/9jrNXxZR8GuL5pSIdB1h8rcNUIYO1aAsawIhnVXfFYG4sOI/i5d1aPUr
 pSKtIBGMhN28y+oKw7vDmRaz8gSj7aaL4SVNnSoT6EJlecbym4PyaT0SqnYYeT4BAJZX
 z37evZPzBPQMYWqR2Yy3Ee2HNtt93nxKmrEtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mlbaWNl6myQL4ImK9SxnSclyhhjtiwHsTJaXNS1CGMs=;
 b=lzrukIBzvLGJcgTY9YCn+XoOWpfn421XF8OZATiKahnCXOTLvonNynoHU/akgSiVkC
 nvcTrJ9zIxxLYyn+Sx+cFgjeN6YdDVambecvIj7qtkAJQq4eI710gyjp4fRyz+Dnacx9
 FBIK6ZrXwy/jf3GA3wlNk2mFA5MrJu3D367iRdEZN2uuh732YEEqV0uoGZYxH8DkNJCm
 +xj6IYbOuO8JTkbWYw1mtgf4hpthvYJmImuH4Ojbd2DwgcV/SZCDofsm203Wb2AQ5qzl
 GjllaeKTuFIB9c0h+NrFtvDBdW227Ahxj33EgbjULocMjQ7to5AtVor83eRgDrnpnshG
 7i9A==
X-Gm-Message-State: AOAM5321sAPZe58M8TOvBVwT+WrilnMVDrZfHHZnDy+yi2ClrkBZyk1W
 E+9jkLwjEew9gif4jFG8KKvjSg==
X-Google-Smtp-Source: ABdhPJyP9QwYoJm4k6BZ4GLEkLn9av6cueNy2rsbQ8RmMCBBGcIRjpNOsMpV1mGaAGL/Dh2GcvO1Qg==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr5558196wrp.264.1616422529533; 
 Mon, 22 Mar 2021 07:15:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l15sm16961426wme.43.2021.03.22.07.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:15:28 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:15:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 00/44] Add HMM-based SVM memory manager to KFD v2
Message-ID: <YFimfx6CFAWIou2t@phenom.ffwll.local>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 06:58:16AM -0400, Felix Kuehling wrote:
> Since the last patch series I sent on Jan 6 a lot has changed. Patches 1-33
> are the cleaned up, rebased on amd-staging-drm-next 5.11 version from about
> a week ago. The remaining 11 patches are current work-in-progress with
> further cleanup and fixes.
> 
> MMU notifiers and CPU page faults now can split ranges and update our range
> data structures without taking heavy locks by doing some of the critical
> work in a deferred work handler. This includes updating MMU notifiers and
> the SVM range interval tree. In the mean time, new ranges can live as
> children of their parent ranges until the deferred work handler consolidates
> them in the main interval tree.

I'm totally swammped with intel stuff unfortunately, so not really time to
dig in. Can you give me the spoiler on how the (gfx10+ iirc) page fault
inversion is planned to be handled now? Or that still tbd?

Other thing I noticed is that amdkfd still uses the mmu_notifier directly,
and not the mmu_interval_notifier. But you're talking a lot about managing
intervals here, and so I'm wondering whether we shouldn't do this in core
code? Everyone will have the same painful locking problems here (well atm
everyone = you&nouveau only I think), sharing this imo would make a ton of
sense.

I think the other one is moving over more generic pasid code, but I think
that's going to be less useful here and maybe more a long term project.

Cheers, Daniel

> 
> We also added proper DMA mapping of system memory pages.
> 
> Current work in progress is cleaning up all the locking, simplifying our
> code and data structures and resolving a few known bugs.
> 
> This series and the corresponding ROCm Thunk and KFDTest changes are also
> available on gitub:
>   https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/tree/fxkamd/hmm-wip
>   https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/tree/fxkamd/hmm-wip
> 
> An updated Thunk
> 
> Alex Sierra (10):
>   drm/amdgpu: replace per_device_list by array
>   drm/amdkfd: helper to convert gpu id and idx
>   drm/amdkfd: add xnack enabled flag to kfd_process
>   drm/amdkfd: add ioctl to configure and query xnack retries
>   drm/amdgpu: enable 48-bit IH timestamp counter
>   drm/amdkfd: SVM API call to restore page tables
>   drm/amdkfd: add svm_bo reference for eviction fence
>   drm/amdgpu: add param bit flag to create SVM BOs
>   drm/amdgpu: svm bo enable_signal call condition
>   drm/amdgpu: add svm_bo eviction to enable_signal cb
> 
> Felix Kuehling (22):
>   drm/amdkfd: map svm range to GPUs
>   drm/amdkfd: svm range eviction and restore
>   drm/amdkfd: validate vram svm range from TTM
>   drm/amdkfd: HMM migrate ram to vram
>   drm/amdkfd: HMM migrate vram to ram
>   drm/amdkfd: invalidate tables on page retry fault
>   drm/amdkfd: page table restore through svm API
>   drm/amdkfd: add svm_bo eviction mechanism support
>   drm/amdkfd: refine migration policy with xnack on
>   drm/amdkfd: add svm range validate timestamp
>   drm/amdkfd: multiple gpu migrate vram to vram
>   drm/amdkfd: Fix dma unmapping
>   drm/amdkfd: Call mutex_destroy
>   drm/amdkfd: Fix spurious restore failures
>   drm/amdkfd: Fix svm_bo_list locking in eviction worker
>   drm/amdkfd: Simplify split_by_granularity
>   drm/amdkfd: Point out several race conditions
>   drm/amdkfd: Return pdd from kfd_process_device_from_gduid
>   drm/amdkfd: Remove broken deferred mapping
>   drm/amdkfd: Allow invalid pages in migration.src
>   drm/amdkfd: Correct locking during migration and mapping
>   drm/amdkfd: Nested locking and invalidation of child ranges
> 
> Philip Yang (12):
>   drm/amdkfd: add svm ioctl API
>   drm/amdkfd: register svm range
>   drm/amdkfd: add svm ioctl GET_ATTR op
>   drm/amdgpu: add common HMM get pages function
>   drm/amdkfd: validate svm range system memory
>   drm/amdkfd: deregister svm range
>   drm/amdgpu: export vm update mapping interface
>   drm/amdkfd: register HMM device private zone
>   drm/amdkfd: support xgmi same hive mapping
>   drm/amdkfd: copy memory through gart table
>   drm/amdgpu: reserve fence slot to update page table
>   drm/amdkfd: Add SVM API support capability bits
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |    4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    4 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   16 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   13 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   83 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |    7 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |    4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   90 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   48 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   11 +
>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |    1 +
>  drivers/gpu/drm/amd/amdkfd/Kconfig            |    1 +
>  drivers/gpu/drm/amd/amdkfd/Makefile           |    4 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  173 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c  |    4 +
>  drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |    8 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  922 ++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h      |   59 +
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   54 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  191 +-
>  .../amd/amdkfd/kfd_process_queue_manager.c    |    6 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 2865 +++++++++++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |  175 +
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |    6 +
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h     |   10 +-
>  include/uapi/linux/kfd_ioctl.h                |  171 +-
>  26 files changed, 4681 insertions(+), 249 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> 
> -- 
> 2.31.0
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
