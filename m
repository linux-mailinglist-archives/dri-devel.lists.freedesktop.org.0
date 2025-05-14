Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5168AB7217
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57003899A3;
	Wed, 14 May 2025 17:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FXt86ZLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383F910E6A4;
 Wed, 14 May 2025 17:03:11 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-30c3a038acfso100832a91.3; 
 Wed, 14 May 2025 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747242190; x=1747846990; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tTRZYELUxikHuZrnr6hjy5+oWoL6AQWZaZWVaCTTMUs=;
 b=FXt86ZLzh8ER3Pi7Mv98nr6FCRqNNUhYlWg3dQFqi56ldYQH5vpTEGqFs3LaraDSi5
 xhk7rs3aa2rR7Dv5DAqx48RUnkmvGX3YvDj70gQLtn72C8KVRcyP9732aQ800adLKEHs
 ZNde8LuenGPdmjgDdrUxww7kIxeVAKPR8qoJfkqlzkfVXKj/8YSJjglS+nAyqN+PP011
 b5sTvb1HgIHFgT7zh/O3uvBzzTA3vGBJlmLhSnusODGq4E7CeQ2PNuLeZa1GgP2pvLbW
 YWK/OMthAA7fmlI9OQ80GJoz+hJGumU/s3H9vomo7rZXdJZy6K/4/KGyaEm+rLtedpE+
 YbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747242190; x=1747846990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tTRZYELUxikHuZrnr6hjy5+oWoL6AQWZaZWVaCTTMUs=;
 b=MdBBlDG+oRIZ2ZLLjuLHX31Br2ivvs0XTb7uqPHQHDoJ0LPNk9qGLOQzDEMjA4tLxt
 +5YsQqyunoE38ywEOOGK+QBx4cGXWzWwsPBiYSGFfKN9Wl1ZvGw6mI+/hYRI1r+9j1yX
 2fp7m8tUzNYj//R/x4/bgC+wVnDWAfQBqsl1023JAs5y7yuZHO+yxe55A36PLXkML5yw
 Gnlr09+IJLe7/XR/AlGCYqEAW9/xejuPfXpUzSUglm+2ZhK2ZbWW0XmyTuJMegwGE0aV
 eZFASOvmf5KfWfywXicRqFk1gTwAwGZuQTkX+UlP1d8rYibidfXfhOMFEzNuUCMcQs8I
 sFqQ==
X-Gm-Message-State: AOJu0Yx7DIFOIdUilutA1wZG61SpGEsB4BDupPucbMf00ExAzYhmqwX7
 JKLuvVC2g9RY6HQFWGKIJBew4LW9yWDwkoDie1SGImvjJD+P90N4rOIFzcAj
X-Gm-Gg: ASbGncv7ZbFYUqshCI2ypHcaWvFbAlSCn+mF/b7GF1jHvqbpQcNfqAZhivvu1bRZHCm
 pIRuTdJW0Bv2InOtAYW4E9007TPVuGNx0HbkFwKbHVKFxd4gX/JcqRC9pvWixrTtA16UhZkKFwf
 8IdOU+FPTjTNuBxxgJBbHqPjKCZ+wVoojDe22Ob3cMCqK6Sm+fl/NKwOpP0FL7P/tp01/sQxMup
 UldcUO/MKU4/2JTT1qPTVoXRYFo2dSagZwBEvklXDaBsNwQDRVfCfa4lB0UYZ1W3BWQsrWzEwZp
 vzqaoOgm1dUtLVU8ohbcfFaVPjtcRMRirFH1cSTapxvzulHf8vy4Q7OYthUJ3zGZ3KQp70kxkF3
 5d/aSsLmwDSLKY84KCB55CamjNA==
X-Google-Smtp-Source: AGHT+IG+/kVgSThsJVSjiF3uCAxUrBjb1zbLg+VbmolSv8I7lQK3Z+fmpPdwjzXJNN06J8fdXZzhsg==
X-Received: by 2002:a17:90b:51c5:b0:2fe:a79e:f56f with SMTP id
 98e67ed59e1d1-30e2e5bb68cmr7472695a91.13.1747242190032; 
 Wed, 14 May 2025 10:03:10 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2350ddbafdsm7966273a12.53.2025.05.14.10.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:03:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Christopher Snowhill <chris@kode54.net>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
 iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
 Jason Gunthorpe <jgg@ziepe.ca>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Jonathan Marek <jonathan@marek.ca>, Kevin Tian <kevin.tian@intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Sean Paul <sean@poorly.run>, Will Deacon <will@kernel.org>
Subject: [PATCH v4 00/40] drm/msm: sparse / "VM_BIND" support
Date: Wed, 14 May 2025 09:58:59 -0700
Message-ID: <20250514170118.40555-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Rob Clark <robdclark@chromium.org>

Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
Memory[2] in the form of:

1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
   MAP_NULL/UNMAP commands

2. A new VM_BIND ioctl to allow submitting batches of one or more
   MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue

I did not implement support for synchronous VM_BIND commands.  Since
userspace could just immediately wait for the `SUBMIT` to complete, I don't
think we need this extra complexity in the kernel.  Synchronous/immediate
VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.

The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533

Changes in v4:
- Various locking/etc fixes
- Optimize the pgtable preallocation.  If userspace sorts the VM_BIND ops
  then the kernel detects ops that fall into the same 2MB last level PTD
  to avoid duplicate page preallocation.
- Add way to throttle pushing jobs to the scheduler, to cap the amount of
  potentially temporary prealloc'd pgtable pages.
- Add vm_log to devcoredump for debugging.  If the vm_log_shift module
  param is set, keep a log of the last 1<<vm_log_shift VM updates for
  easier debugging of faults/crashes.
- Link to v3: https://lore.kernel.org/all/20250428205619.227835-1-robdclark@gmail.com/

Changes in v3:
- Switched to seperate VM_BIND ioctl.  This makes the UABI a bit
  cleaner, but OTOH the userspace code was cleaner when the end result
  of either type of VkQueue lead to the same ioctl.  So I'm a bit on
  the fence.
- Switched to doing the gpuvm bookkeeping synchronously, and only
  deferring the pgtable updates.  This avoids needing to hold any resv
  locks in the fence signaling path, resolving the last shrinker related
  lockdep complaints.  OTOH it means userspace can trigger invalid
  pgtable updates with multiple VM_BIND queues.  In this case, we ensure
  that unmaps happen completely (to prevent userspace from using this to
  access free'd pages), mark the context as unusable, and move on with
  life.
- Link to v2: https://lore.kernel.org/all/20250319145425.51935-1-robdclark@gmail.com/

Changes in v2:
- Dropped Bibek Kumar Patro's arm-smmu patches[3], which have since been
  merged.
- Pre-allocate all the things, and drop HACK patch which disabled shrinker.
  This includes ensuring that vm_bo objects are allocated up front, pre-
  allocating VMA objects, and pre-allocating pages used for pgtable updates.
  The latter utilizes io_pgtable_cfg callbacks for pgtable alloc/free, that
  were initially added for panthor. 
- Add back support for BO dumping for devcoredump.
- Link to v1 (RFC): https://lore.kernel.org/dri-devel/20241207161651.410556-1-robdclark@gmail.com/T/#t

[1] https://www.kernel.org/doc/html/next/gpu/drm-mm.html#drm-gpuvm
[2] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html
[3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=909700

Rob Clark (40):
  drm/gpuvm: Don't require obj lock in destructor path
  drm/gpuvm: Allow VAs to hold soft reference to BOs
  drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
  drm/sched: Add enqueue credit limit
  iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
  drm/msm: Rename msm_file_private -> msm_context
  drm/msm: Improve msm_context comments
  drm/msm: Rename msm_gem_address_space -> msm_gem_vm
  drm/msm: Remove vram carveout support
  drm/msm: Collapse vma allocation and initialization
  drm/msm: Collapse vma close and delete
  drm/msm: Don't close VMAs on purge
  drm/msm: drm_gpuvm conversion
  drm/msm: Convert vm locking
  drm/msm: Use drm_gpuvm types more
  drm/msm: Split out helper to get iommu prot flags
  drm/msm: Add mmu support for non-zero offset
  drm/msm: Add PRR support
  drm/msm: Rename msm_gem_vma_purge() -> _unmap()
  drm/msm: Drop queued submits on lastclose()
  drm/msm: Lazily create context VM
  drm/msm: Add opt-in for VM_BIND
  drm/msm: Mark VM as unusable on GPU hangs
  drm/msm: Add _NO_SHARE flag
  drm/msm: Crashdump prep for sparse mappings
  drm/msm: rd dumping prep for sparse mappings
  drm/msm: Crashdec support for sparse
  drm/msm: rd dumping support for sparse
  drm/msm: Extract out syncobj helpers
  drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
  drm/msm: Add VM_BIND submitqueue
  drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
  drm/msm: Support pgtable preallocation
  drm/msm: Split out map/unmap ops
  drm/msm: Add VM_BIND ioctl
  drm/msm: Add VM logging for VM_BIND updates
  drm/msm: Add VMA unmap reason
  drm/msm: Add mmu prealloc tracepoint
  drm/msm: use trylock for debugfs
  drm/msm: Bump UAPI version

 drivers/gpu/drm/drm_gem.c                     |   14 +-
 drivers/gpu/drm/drm_gpuvm.c                   |   15 +-
 drivers/gpu/drm/msm/Kconfig                   |    1 +
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   25 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |    5 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   22 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   49 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    6 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    4 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   99 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   23 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |    4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |    6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   28 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   12 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  184 +--
 drivers/gpu/drm/msm/msm_drv.h                 |   35 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   18 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  494 +++---
 drivers/gpu/drm/msm/msm_gem.h                 |  247 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   15 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |  104 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |  295 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c             | 1471 ++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c                 |  214 ++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  144 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h           |   14 +
 drivers/gpu/drm/msm/msm_iommu.c               |  302 +++-
 drivers/gpu/drm/msm/msm_kms.c                 |   18 +-
 drivers/gpu/drm/msm/msm_kms.h                 |    2 +-
 drivers/gpu/drm/msm/msm_mmu.h                 |   38 +-
 drivers/gpu/drm/msm/msm_rd.c                  |   62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   10 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |   96 +-
 drivers/gpu/drm/msm/msm_syncobj.c             |  172 ++
 drivers/gpu/drm/msm/msm_syncobj.h             |   37 +
 drivers/gpu/drm/scheduler/sched_entity.c      |   16 +-
 drivers/gpu/drm/scheduler/sched_main.c        |    3 +
 drivers/iommu/io-pgtable-arm.c                |   27 +-
 include/drm/drm_gem.h                         |   10 +-
 include/drm/drm_gpuvm.h                       |   12 +-
 include/drm/gpu_scheduler.h                   |   13 +-
 include/linux/io-pgtable.h                    |    8 +
 include/uapi/drm/msm_drm.h                    |  149 +-
 63 files changed, 3484 insertions(+), 1251 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

-- 
2.49.0

