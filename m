Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B8AB7287
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4187E10E6BA;
	Wed, 14 May 2025 17:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L9XzHt3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E3F10E6D2;
 Wed, 14 May 2025 17:13:37 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-86135ae2a29so663731939f.2; 
 Wed, 14 May 2025 10:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747242816; x=1747847616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YfVONBHVtRTPlHRwr1fa3nrvIurV0bZBwrMg9aBjdsY=;
 b=L9XzHt3ocilHIc5xFBET+FBWoMixbh2hX5ShIcOQ0LYoSDBUKZygxll49kYuvgENFw
 zfHBN1Psvd6cpT189f8nR/WSDOU/OY5r5WPKN8V8hmAy3p2vtKwgq7y2FXyHcJOVIIS2
 igsMe9chzs4HTzI3/rkxfSOkZZbkV7OOhToA8BzJ5iA0bjtK8jjEP6kGTd3X1M9YwR9x
 BEamsRuDWdgFPK9MexbeBSSKl7Ldz2/QeE/fEUrUcmTVu2R8ZnpxWG0c7SqyZQA6Wo5I
 2rPDvb2aaz/p/m2m+hQrH3Ylqw2pUWVzFj8bRHKx6kgGcSuFftTsYSum5xtaXTYH+M3F
 yyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747242816; x=1747847616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YfVONBHVtRTPlHRwr1fa3nrvIurV0bZBwrMg9aBjdsY=;
 b=bq2F/nAkoJtdCKCxQyY+GYWwwcl6azvYUUFq/ocjnT8rrW+D3hwG3GG79uZT6/0mta
 7NNIxCFLopwW0d0+KoflivHhpDFvRG1QGeb4kZMVZ9pBW2S87ZYG9vCPXCuO28OpAonc
 UCgNLAmeGKtzGkzH5yjy6kVuImIVeD7ZhQa3UUeuqbNjKFaSLM+JHjRNrAynDilLql4l
 yek34KXj0HcH3ik/qtAG151lG/zVEgY6D+bzl20aDkK6wm8JjvSW42zRTXkpBT6PZ99i
 EHSss7/FkKlATzQOkdhgZPg3M4ktYOlKDpZaIsXlbIT8k8DGP1TlF7cSmx+h8tmGuCK0
 9ykw==
X-Gm-Message-State: AOJu0YwR+JHIoYbK5YGDuulAMfJDyCkKVXAvRkH6AK0oHThA2ekaoZtt
 XVgqU9hbuTsJjGr0KoQkw7HJPgrusoJsxXPiGVHGWkTwBtrWteXnhjxiGd/e9YlWEw+xZWgg4dB
 nuigSiyC+zh49CFcVu5Ha/qfSBERiQviq
X-Gm-Gg: ASbGncuRyRxZSkAX8hNETCDagYblZTWIQSjVYfP6Khu1MgasEa1xjtg5V0NjIg7F6pI
 zHomcXtkh7GIVAY6OqjfuGYaELYBgnfRLZHHoMSI4/foTLPkE+NErcz0vFEs+uc2mTN4otrS9g5
 DGQBBCn2w0IuLh4gIUNq0k5Z5AFtlcph4u1ILEVvqp9cD3rLSerPdVlKzVc/tJrsw=
X-Google-Smtp-Source: AGHT+IGdnAsVW3kt1rSy4GKPI8bMIOEfIFvsaubQbJQ7eRiduk9GI/aaU1w3nrEUXuN5lOaJKQ2zh99tpo1qR+67hEs=
X-Received: by 2002:a05:6e02:1707:b0:3db:72f7:d7b3 with SMTP id
 e9e14a558f8ab-3db72f7dc1dmr29424625ab.4.1747242815480; Wed, 14 May 2025
 10:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com>
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 14 May 2025 10:13:22 -0700
X-Gm-Features: AX0GCFvpGGezYiytY2MOS6dtC60ihdSd-WE1u91XYjWUz5Y9tDHJIetJpvazfio
Message-ID: <CAF6AEGvEsB9F4=qnSvQkiAGdn=60ae-uGLbZVf2qFwfGof2Nkw@mail.gmail.com>
Subject: Re: [PATCH v4 00/40] drm/msm: sparse / "VM_BIND" support
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Christopher Snowhill <chris@kode54.net>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Joao Martins <joao.m.martins@oracle.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kevin Tian <kevin.tian@intel.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nicolin Chen <nicolinc@nvidia.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>,
 Will Deacon <will@kernel.org>
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

hmm, looks like git-send-email died with a TLS error a quarter of the
way thru this series.. I'll try to resend later

BR,
-R

On Wed, May 14, 2025 at 10:03=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
> Memory[2] in the form of:
>
> 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
>    MAP_NULL/UNMAP commands
>
> 2. A new VM_BIND ioctl to allow submitting batches of one or more
>    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
>
> I did not implement support for synchronous VM_BIND commands.  Since
> userspace could just immediately wait for the `SUBMIT` to complete, I don=
't
> think we need this extra complexity in the kernel.  Synchronous/immediate
> VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.
>
> The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/mer=
ge_requests/32533
>
> Changes in v4:
> - Various locking/etc fixes
> - Optimize the pgtable preallocation.  If userspace sorts the VM_BIND ops
>   then the kernel detects ops that fall into the same 2MB last level PTD
>   to avoid duplicate page preallocation.
> - Add way to throttle pushing jobs to the scheduler, to cap the amount of
>   potentially temporary prealloc'd pgtable pages.
> - Add vm_log to devcoredump for debugging.  If the vm_log_shift module
>   param is set, keep a log of the last 1<<vm_log_shift VM updates for
>   easier debugging of faults/crashes.
> - Link to v3: https://lore.kernel.org/all/20250428205619.227835-1-robdcla=
rk@gmail.com/
>
> Changes in v3:
> - Switched to seperate VM_BIND ioctl.  This makes the UABI a bit
>   cleaner, but OTOH the userspace code was cleaner when the end result
>   of either type of VkQueue lead to the same ioctl.  So I'm a bit on
>   the fence.
> - Switched to doing the gpuvm bookkeeping synchronously, and only
>   deferring the pgtable updates.  This avoids needing to hold any resv
>   locks in the fence signaling path, resolving the last shrinker related
>   lockdep complaints.  OTOH it means userspace can trigger invalid
>   pgtable updates with multiple VM_BIND queues.  In this case, we ensure
>   that unmaps happen completely (to prevent userspace from using this to
>   access free'd pages), mark the context as unusable, and move on with
>   life.
> - Link to v2: https://lore.kernel.org/all/20250319145425.51935-1-robdclar=
k@gmail.com/
>
> Changes in v2:
> - Dropped Bibek Kumar Patro's arm-smmu patches[3], which have since been
>   merged.
> - Pre-allocate all the things, and drop HACK patch which disabled shrinke=
r.
>   This includes ensuring that vm_bo objects are allocated up front, pre-
>   allocating VMA objects, and pre-allocating pages used for pgtable updat=
es.
>   The latter utilizes io_pgtable_cfg callbacks for pgtable alloc/free, th=
at
>   were initially added for panthor.
> - Add back support for BO dumping for devcoredump.
> - Link to v1 (RFC): https://lore.kernel.org/dri-devel/20241207161651.4105=
56-1-robdclark@gmail.com/T/#t
>
> [1] https://www.kernel.org/doc/html/next/gpu/drm-mm.html#drm-gpuvm
> [2] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html
> [3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D=
909700
>
> Rob Clark (40):
>   drm/gpuvm: Don't require obj lock in destructor path
>   drm/gpuvm: Allow VAs to hold soft reference to BOs
>   drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
>   drm/sched: Add enqueue credit limit
>   iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
>   drm/msm: Rename msm_file_private -> msm_context
>   drm/msm: Improve msm_context comments
>   drm/msm: Rename msm_gem_address_space -> msm_gem_vm
>   drm/msm: Remove vram carveout support
>   drm/msm: Collapse vma allocation and initialization
>   drm/msm: Collapse vma close and delete
>   drm/msm: Don't close VMAs on purge
>   drm/msm: drm_gpuvm conversion
>   drm/msm: Convert vm locking
>   drm/msm: Use drm_gpuvm types more
>   drm/msm: Split out helper to get iommu prot flags
>   drm/msm: Add mmu support for non-zero offset
>   drm/msm: Add PRR support
>   drm/msm: Rename msm_gem_vma_purge() -> _unmap()
>   drm/msm: Drop queued submits on lastclose()
>   drm/msm: Lazily create context VM
>   drm/msm: Add opt-in for VM_BIND
>   drm/msm: Mark VM as unusable on GPU hangs
>   drm/msm: Add _NO_SHARE flag
>   drm/msm: Crashdump prep for sparse mappings
>   drm/msm: rd dumping prep for sparse mappings
>   drm/msm: Crashdec support for sparse
>   drm/msm: rd dumping support for sparse
>   drm/msm: Extract out syncobj helpers
>   drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
>   drm/msm: Add VM_BIND submitqueue
>   drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
>   drm/msm: Support pgtable preallocation
>   drm/msm: Split out map/unmap ops
>   drm/msm: Add VM_BIND ioctl
>   drm/msm: Add VM logging for VM_BIND updates
>   drm/msm: Add VMA unmap reason
>   drm/msm: Add mmu prealloc tracepoint
>   drm/msm: use trylock for debugfs
>   drm/msm: Bump UAPI version
>
>  drivers/gpu/drm/drm_gem.c                     |   14 +-
>  drivers/gpu/drm/drm_gpuvm.c                   |   15 +-
>  drivers/gpu/drm/msm/Kconfig                   |    1 +
>  drivers/gpu/drm/msm/Makefile                  |    1 +
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   25 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |    5 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   17 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   17 +-
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |    4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   22 +-
>  drivers/gpu/drm/msm/adreno/a5xx_power.c       |    2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |   10 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   32 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   49 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   10 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |    4 -
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   99 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   23 +-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   18 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |    2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   18 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |    4 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |    6 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   28 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   12 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |    4 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   19 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   12 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
>  drivers/gpu/drm/msm/msm_drv.c                 |  184 +--
>  drivers/gpu/drm/msm/msm_drv.h                 |   35 +-
>  drivers/gpu/drm/msm/msm_fb.c                  |   18 +-
>  drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
>  drivers/gpu/drm/msm/msm_gem.c                 |  494 +++---
>  drivers/gpu/drm/msm/msm_gem.h                 |  247 ++-
>  drivers/gpu/drm/msm/msm_gem_prime.c           |   15 +
>  drivers/gpu/drm/msm/msm_gem_shrinker.c        |  104 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c          |  295 ++--
>  drivers/gpu/drm/msm/msm_gem_vma.c             | 1471 ++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.c                 |  214 ++-
>  drivers/gpu/drm/msm/msm_gpu.h                 |  144 +-
>  drivers/gpu/drm/msm/msm_gpu_trace.h           |   14 +
>  drivers/gpu/drm/msm/msm_iommu.c               |  302 +++-
>  drivers/gpu/drm/msm/msm_kms.c                 |   18 +-
>  drivers/gpu/drm/msm/msm_kms.h                 |    2 +-
>  drivers/gpu/drm/msm/msm_mmu.h                 |   38 +-
>  drivers/gpu/drm/msm/msm_rd.c                  |   62 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c          |   10 +-
>  drivers/gpu/drm/msm/msm_submitqueue.c         |   96 +-
>  drivers/gpu/drm/msm/msm_syncobj.c             |  172 ++
>  drivers/gpu/drm/msm/msm_syncobj.h             |   37 +
>  drivers/gpu/drm/scheduler/sched_entity.c      |   16 +-
>  drivers/gpu/drm/scheduler/sched_main.c        |    3 +
>  drivers/iommu/io-pgtable-arm.c                |   27 +-
>  include/drm/drm_gem.h                         |   10 +-
>  include/drm/drm_gpuvm.h                       |   12 +-
>  include/drm/gpu_scheduler.h                   |   13 +-
>  include/linux/io-pgtable.h                    |    8 +
>  include/uapi/drm/msm_drm.h                    |  149 +-
>  63 files changed, 3484 insertions(+), 1251 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
>  create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h
>
> --
> 2.49.0
>
