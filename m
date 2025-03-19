Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4330DA69131
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4074510E26F;
	Wed, 19 Mar 2025 14:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="koPNB+Cv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D9A10E256;
 Wed, 19 Mar 2025 14:54:48 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-300fefb8e06so8554755a91.0; 
 Wed, 19 Mar 2025 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396087; x=1743000887; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VqnqIl7gzMI6XYAL9+ESVwKY9TAcHFNVEaABvSsYd58=;
 b=koPNB+CvwHYGmRyoVZYIdryosw31C41/Uzlyb+jVZWu7VVyB8m2p+PCfCj6ES83QCs
 jIMkRrbUfYk3TqnPHDaN7NG1OHvAZW7T7UtCoVHxxTyPuHN217S/qxofoCs300J6KY6y
 HaIxNYsxvqxoLYHCTS5WBEX9WvbvAXsfsTzgAnrxVj0zlZm3JsS6BkapxfFxmrin1YSI
 OnsA8q9F0HpcAO+JUBXazc7tw1sfRPm2o+k6CWrfj7+l0ua59HQSzhjj1r/pLZZZ3wP5
 6NfkzmH4BFVJbkTVeIOQg3vaq17kuxsgc2nIXKJdEWs2EyrWmDw9UOGY+TRL5ip6wSnD
 h0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396087; x=1743000887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VqnqIl7gzMI6XYAL9+ESVwKY9TAcHFNVEaABvSsYd58=;
 b=biprvCvHd2y6yS1KFjGzqaP3D7nyvyFhD7OewAj35wJ68QlUhiFAIZpYcNTgxje2ra
 BkWM73BvOqd4LbaF+lXSnmeUm8fpF9MZlflVcv0QoGJXryOm8r+55MOYacUybScRf2Md
 UTh6BQJ7KgRENoUgyyi9HEM+dpVVCuxsS+Xi21YL/gmR8eMrSTqfmE8wjciqDkzqReDA
 ZFCSpkdD/vE7PyXiaj+LlICQOuKWaDErlFM5zFdjXtpjQAXNM814/dEcKGDB9yUoaAHF
 6URlObhMpg9mhU7c4DwwHOR6/+u35ZmxqW+/hTheAbhafn9xz+eA3fIU+wgUfkehMcci
 AKvg==
X-Gm-Message-State: AOJu0YwHdQq/wvO4Z4IAwLKtznFt9W0RCq4rdejrp05fyK2wr/0WjwhK
 MFlmggtyWlthqJcquc01QuNmav3s86+gy4xsatLCBSW5UTV2BHq71STfaA==
X-Gm-Gg: ASbGncu1xteVTTQ7nBXFSUBFvDxq5fDSP4b/eHWmxbybYeJMvaovakFOAYGqWDVsoX4
 NCdkmia+9gWEN5V91j7TpWhw8BwlfC7b386e5ArwTVZuI7wt3yx7HgaXWx6R13mpWW6J6udy/ok
 9svjkJOOuFYPmcp22amkYa00Vp5eVlqTvxtZgzpE2giC1uU+gp7Oc9SAjwncnPUae90va3rfyID
 EqpC4BA9DaDQbrTGQpyF06EAyvsHvfR1Zc9pp18mej8Us3Cf1AlDQjMPdy5h1CFiSGZQwp7v4mc
 VzGLA/RSbk4YM+fYb4eaSMnHjk0WljmYV4ZuINZzEvFDi4VOP1xM54JQ4dBIm6XkYemdr4pWESr
 uMWR5oImlN6DtEcGgMmo=
X-Google-Smtp-Source: AGHT+IEM2Aydh8wQyAb3fV9+udMGx+2FPS+SU7qcCCvi4qn6KMqVbM+eGzMKYXiVBUkhhnlIU/lnAg==
X-Received: by 2002:a05:6a20:12d5:b0:1ee:e2ac:5159 with SMTP id
 adf61e73a8af0-1fbebc87101mr5465045637.19.1742396087191; 
 Wed, 19 Mar 2025 07:54:47 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9fe51asm10978709a12.36.2025.03.19.07.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:54:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Christopher Snowhill <chris@kode54.net>,
 Dmitry Baryshkov <lumag@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH v2 00/34] drm/msm: sparse / "VM_BIND" support
Date: Wed, 19 Mar 2025 07:52:12 -0700
Message-ID: <20250319145425.51935-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
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

2. Extending the SUBMIT ioctl to allow submitting batches of one or more
   MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue

The UABI takes a slightly different approach from what other drivers have
done, and what would make sense if starting from a clean sheet, ie separate
VM_BIND and EXEC ioctls.  But since we have to maintain support for the
existing SUBMIT ioctl, and because the fence, syncobj, and BO pinning is
largely the same between legacy "BO-table" style SUBMIT ioctls, and new-
style VM updates submitted to a VM_BIND submitqueue, I chose to go the
route of extending the existing `SUBMIT` ioctl rather than adding a new
ioctl.

I also did not implement support for synchronous VM_BIND commands.  Since
userspace could just immediately wait for the `SUBMIT` to complete, I don't
think we need this extra complexity in the kernel.  Synchronous/immediate
VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.

The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533

This series can be found in MR form, if you prefer:
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/144

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

Rob Clark (34):
  drm/gpuvm: Don't require obj lock in destructor path
  drm/gpuvm: Remove bogus lock assert
  drm/gpuvm: Allow VAs to hold soft reference to BOs
  drm/gpuvm: Add drm_gpuvm_sm_unmap_va()
  drm/msm: Rename msm_file_private -> msm_context
  drm/msm: Improve msm_context comments
  drm/msm: Rename msm_gem_address_space -> msm_gem_vm
  drm/msm: Remove vram carveout support
  drm/msm: Collapse vma allocation and initialization
  drm/msm: Collapse vma close and delete
  drm/msm: drm_gpuvm conversion
  drm/msm: Use drm_gpuvm types more
  drm/msm: Split submit_pin_objects()
  drm/msm: Lazily create context VM
  drm/msm: Add opt-in for VM_BIND
  drm/msm: Mark VM as unusable on faults
  drm/msm: Extend SUBMIT ioctl for VM_BIND
  drm/msm: Add VM_BIND submitqueue
  drm/msm: Add _NO_SHARE flag
  drm/msm: Split out helper to get iommu prot flags
  drm/msm: Add mmu support for non-zero offset
  drm/msm: Add PRR support
  drm/msm: Rename msm_gem_vma_purge() -> _unmap()
  drm/msm: Split msm_gem_vma_new()
  drm/msm: Pre-allocate VMAs
  drm/msm: Pre-allocate vm_bo objects
  drm/msm: Pre-allocate pages for pgtable entries
  drm/msm: Wire up gpuvm ops
  drm/msm: Wire up drm_gpuvm debugfs
  drm/msm: Crashdump prep for sparse mappings
  drm/msm: rd dumping prep for sparse mappings
  drm/msm: Crashdec support for sparse
  drm/msm: rd dumping support for sparse
  drm/msm: Bump UAPI version

 drivers/gpu/drm/drm_gpuvm.c                   | 141 ++--
 drivers/gpu/drm/msm/Kconfig                   |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |  25 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |   5 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |  17 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |  17 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  24 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  51 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |  10 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   4 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  84 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  23 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  28 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |  12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  14 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |  20 +
 drivers/gpu/drm/msm/msm_drv.c                 | 176 ++---
 drivers/gpu/drm/msm/msm_drv.h                 |  35 +-
 drivers/gpu/drm/msm/msm_fb.c                  |  18 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |   2 +-
 drivers/gpu/drm/msm/msm_gem.c                 | 437 +++++-----
 drivers/gpu/drm/msm/msm_gem.h                 | 226 ++++--
 drivers/gpu/drm/msm/msm_gem_prime.c           |  15 +
 drivers/gpu/drm/msm/msm_gem_submit.c          | 234 +++++-
 drivers/gpu/drm/msm/msm_gem_vma.c             | 748 ++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c                 | 146 ++--
 drivers/gpu/drm/msm/msm_gpu.h                 | 132 +++-
 drivers/gpu/drm/msm/msm_iommu.c               | 285 ++++++-
 drivers/gpu/drm/msm/msm_kms.c                 |  18 +-
 drivers/gpu/drm/msm/msm_kms.h                 |   2 +-
 drivers/gpu/drm/msm/msm_mmu.h                 |  38 +-
 drivers/gpu/drm/msm/msm_rd.c                  |  62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  86 +-
 include/drm/drm_gpuvm.h                       |  14 +-
 include/uapi/drm/msm_drm.h                    |  98 ++-
 52 files changed, 2359 insertions(+), 1060 deletions(-)

-- 
2.48.1

