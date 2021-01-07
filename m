Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8D82ECCA2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 10:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973596E40B;
	Thu,  7 Jan 2021 09:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD91D6E415
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 09:23:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t30so4933562wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 01:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+e02meJbOEwKLwj6oUSgS6KVWB989AVXKC9B0emrKxg=;
 b=gSo9xyUWtO+QK7ZZIQZaWxJbaY0gEyFixXMm1elErruod5z9vfkc8pB8JHhRunS24T
 KjEIg/3CZ+0IyUByHKgaX81VapXlbL8/8EZX6Oc7EbxTvkLlO1ZxDcaxWBd+iKyDm10i
 SPcP435Nj6RliLoTnc9bBzNdg0C9mb7xG6G2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+e02meJbOEwKLwj6oUSgS6KVWB989AVXKC9B0emrKxg=;
 b=spjFcPfMi5BV1VJVltCZY4Gxbk52P0ZeBnxz7YtsGZwS5x3k4WFRs1dj+qFi77/KnV
 tgM9vlNozTSZHJZlTi9vGM1IYKlZRCvMkuO/+Xo2N+ibMskYab4OiIY5Ots27tYEqcws
 hDuW2WB7iw7FfYmFsYmHb30x5O9ycl6/Ty6BU9lFly89m8pcSTKjK5FtBjyVX6bkxZ3N
 fBxIxJF/HIxn7CUQ5/jmYI0XfILCo97q/qaXezzLxBXQPq7r6jpWcT9J921F85F5ys9I
 M7TljmL8+NLE0At+s5wY5Kp5mPQi4TOkqifF2m+tZl1xAR71TY9V7g7Xdh1b5JiZbWNl
 Zfeg==
X-Gm-Message-State: AOAM532S7s6DHFOJZtQRyujn/ThrJrZbnaMMWyVIAgHCqNLiL6CpMTy1
 SSlbw4qTRLiZGos2M9gJVHkglQ==
X-Google-Smtp-Source: ABdhPJwGNl6b2Hp10dYwob5T8lOgV3uXJN/Ajo/zXVeS8Ipq2JoX59fzUx6eRAY/AjcNqhjSY247RQ==
X-Received: by 2002:adf:ba0c:: with SMTP id o12mr7919474wrg.322.1610011416456; 
 Thu, 07 Jan 2021 01:23:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm12921874wmc.1.2021.01.07.01.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:23:35 -0800 (PST)
Date: Thu, 7 Jan 2021 10:23:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 00/35] Add HMM-based SVM memory manager to KFD
Message-ID: <X/bTFWL3HYVc8LEF@phenom.ffwll.local>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
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
Cc: alex.sierra@amd.com, philip.yang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 06, 2021 at 10:00:52PM -0500, Felix Kuehling wrote:
> This is the first version of our HMM based shared virtual memory manager
> for KFD. There are still a number of known issues that we're working through
> (see below). This will likely lead to some pretty significant changes in
> MMU notifier handling and locking on the migration code paths. So don't
> get hung up on those details yet.
> 
> But I think this is a good time to start getting feedback. We're pretty
> confident about the ioctl API, which is both simple and extensible for the
> future. (see patches 4,16) The user mode side of the API can be found here:
> https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/blob/fxkamd/hmm-wip/src/svm.c
> 
> I'd also like another pair of eyes on how we're interfacing with the GPU VM
> code in amdgpu_vm.c (see patches 12,13), retry page fault handling (24,25),
> and some retry IRQ handling changes (32).
> 
> 
> Known issues:
> * won't work with IOMMU enabled, we need to dma_map all pages properly
> * still working on some race conditions and random bugs
> * performance is not great yet

Still catching up, but I think there's another one for your list:

 * hmm gpu context preempt vs page fault handling. I've had a short
   discussion about this one with Christian before the holidays, and also
   some private chats with Jerome. It's nasty since no easy fix, much less
   a good idea what's the best approach here.

I'll try to look at this more in-depth when I'm catching up on mails.
-Daniel

> 
> Alex Sierra (12):
>   drm/amdgpu: replace per_device_list by array
>   drm/amdkfd: helper to convert gpu id and idx
>   drm/amdkfd: add xnack enabled flag to kfd_process
>   drm/amdkfd: add ioctl to configure and query xnack retries
>   drm/amdkfd: invalidate tables on page retry fault
>   drm/amdkfd: page table restore through svm API
>   drm/amdkfd: SVM API call to restore page tables
>   drm/amdkfd: add svm_bo reference for eviction fence
>   drm/amdgpu: add param bit flag to create SVM BOs
>   drm/amdkfd: add svm_bo eviction mechanism support
>   drm/amdgpu: svm bo enable_signal call condition
>   drm/amdgpu: add svm_bo eviction to enable_signal cb
> 
> Philip Yang (23):
>   drm/amdkfd: select kernel DEVICE_PRIVATE option
>   drm/amdkfd: add svm ioctl API
>   drm/amdkfd: Add SVM API support capability bits
>   drm/amdkfd: register svm range
>   drm/amdkfd: add svm ioctl GET_ATTR op
>   drm/amdgpu: add common HMM get pages function
>   drm/amdkfd: validate svm range system memory
>   drm/amdkfd: register overlap system memory range
>   drm/amdkfd: deregister svm range
>   drm/amdgpu: export vm update mapping interface
>   drm/amdkfd: map svm range to GPUs
>   drm/amdkfd: svm range eviction and restore
>   drm/amdkfd: register HMM device private zone
>   drm/amdkfd: validate vram svm range from TTM
>   drm/amdkfd: support xgmi same hive mapping
>   drm/amdkfd: copy memory through gart table
>   drm/amdkfd: HMM migrate ram to vram
>   drm/amdkfd: HMM migrate vram to ram
>   drm/amdgpu: reserve fence slot to update page table
>   drm/amdgpu: enable retry fault wptr overflow
>   drm/amdkfd: refine migration policy with xnack on
>   drm/amdkfd: add svm range validate timestamp
>   drm/amdkfd: multiple gpu migrate vram to vram
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |    3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    4 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   16 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   13 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |   83 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h        |    7 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |    5 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   90 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   47 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   10 +
>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |   32 +-
>  drivers/gpu/drm/amd/amdgpu/vega20_ih.c        |   32 +-
>  drivers/gpu/drm/amd/amdkfd/Kconfig            |    1 +
>  drivers/gpu/drm/amd/amdkfd/Makefile           |    4 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  170 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |    8 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  866 ++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h      |   59 +
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   52 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  200 +-
>  .../amd/amdkfd/kfd_process_queue_manager.c    |    6 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 2564 +++++++++++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |  135 +
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |    1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h     |   10 +-
>  include/uapi/linux/kfd_ioctl.h                |  169 +-
>  26 files changed, 4296 insertions(+), 291 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> 
> -- 
> 2.29.2
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
