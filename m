Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A99E808F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA9410E0E8;
	Sat,  7 Dec 2024 16:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f04Au365";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718F210E0E8;
 Sat,  7 Dec 2024 16:17:16 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7fd377ff3c5so543762a12.0; 
 Sat, 07 Dec 2024 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588235; x=1734193035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nQVo/h69eP7W7+1c9cYInjm18ZQ/NruUHHKzUMPfb2g=;
 b=f04Au365Rb+lAeJA/IEMiE/HFv4SK8pb3+O5aWoIQgN22cFSy0WILwy1GEsvqiKHMx
 vC96vERncAHqNYqFYcDX0gNAvLXwAH2HYCstQlp5rRyy+Z8E8WA5zyFUNagzuF69YxGB
 mqrjUWomikd4U4vwwEjSwYHTIjoG8EgiIRjTQn1a8R0tKJEeDvHWaDrB0CKi7kw14D4m
 tvU7NT3d3XLhytAvO8ZfpuSIEDzqur0fBQaL/gfaJxo40bg9cCucNFgn1nDCYMXuLDZK
 /thS5v/9k/6WObuKrRsU/drOUxAMceMH7vUUAp+eL/N8Mqcz6AiHGfuj5+toV9HPnjs2
 QSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588235; x=1734193035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQVo/h69eP7W7+1c9cYInjm18ZQ/NruUHHKzUMPfb2g=;
 b=NON4sMd30AzwYEs/tRrkk1aDQnyWofUo2XQ0P2DN8QZyovDbm0EyVsBuw1KeuuFE4S
 cWxmsek5hXiDV59yb6Pj9HTvtX5EHVPxvoccP09NanRgRMIBvKvEQuAtyITs5UQvQn9W
 Curx/Y31E/Do/V6VoKsQwSIzyZhP5CIteOyfjqlj8MCphSNk34oXYOZGWB6U1XcCmHTf
 Zf2wqCJ7LZRPJPcweG/F9k7D7JK9VAS2Z2IKUGp0/ZxWeheI0V1H5mo7/JTT734/iNv0
 glVZjTEg7rdkUzEu6P53VoXjOy1DsgT59NjgfYzpMvp8SUZd72VQAp2Klfe1g+/4fjA0
 in1A==
X-Gm-Message-State: AOJu0Yx2uOO7MxeFZSQPEA1+SsU7SYDrmkvyDc+3jo6BH4WwSJ1gyam9
 bh+FDA81VN8n6tcONwx8P8HRMWkwnwRO9NcEtaXfJlWUnwLKrv3h+XOEAA==
X-Gm-Gg: ASbGncuwnKvWOkpRahtwy5c+Y3KTeVSCih2g8DMxvEAuIBvvrrD0wfMB+pq+brSUw2E
 5qimjhpE01R5bSmk7YLGb8y7tcIkR++QTmhubhbA/JZg57Azj7hAQEG7HIt5aY6KZs0TWrRp2o1
 skX6zIU70oF1EQ94MZ9ZNuBgdKySK3teshsGZoth8zjFdV6I3AuAMAQTOgelVPM8E22zAa5jFt/
 DJlTxicZYiihiUpKxekdH/IjLqN9Mv7JscL5pkvDzhrS57Bxt9QCMKcDPJM5iFuPZcu+jtWChPj
 8Pl+yxYw
X-Google-Smtp-Source: AGHT+IEmvFnBaDTFAw3iJraQEGMF/iUDVX5tXZvZVfuIO2OYpZL0lZpXEUIfhOJmviPs0qS6KOnT/w==
X-Received: by 2002:a17:90b:2015:b0:2ef:6ef4:817d with SMTP id
 98e67ed59e1d1-2ef6ef486ebmr9437262a91.6.1733588235412; 
 Sat, 07 Dec 2024 08:17:15 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef8610ee98sm1426630a91.5.2024.12.07.08.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:17:14 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Jonathan Marek <jonathan@marek.ca>,
 Jun Nie <jun.nie@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linux-pm@vger.kernel.org (open list:SUSPEND TO RAM),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <swboyd@chromium.org>
Subject: [RFC 00/24] drm/msm: sparse / "VM_BIND" support
Date: Sat,  7 Dec 2024 08:15:00 -0800
Message-ID: <20241207161651.410556-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
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
2. Extending the SUBMIT` ioctl to allow submitting batches of one or more
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
think we need this extra complexity in the kernel.

The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533

### Notes/TODOs/Open Questions:
1. The first handful of patches are from Bibek Kumar Patro's series, 
   "iommu/arm-smmu: introduction of ACTLR implementation for Qualcomm SoCs[3],
   which introduces PRR (Partially-Resident-Region) support, needed to
   implement MAP_NULL (for Vulkan Sparse Residency[4]
2. Why do VM_BIND commands need fence fd support, instead of just syncobjs?
   Mainly for the benefit of virtgpu drm native context guest<->host fence
   passing[5], where the host VMM is operating in terms of fence fd's
   (syncobs are just a convenience wrapper above a dma_fence, and don't
   exist below the guest kernel).
3. Currently shrinker support is disabled (hence this being in Draft/RFC
   state).  To properly support the shrinker, we need to pre-allocate
   various objects and pages needed for the pagetables themselves, to
   move memory allocations out of the fence signaling path.  This short-
   cut was taken to unblock userspace implementation of sparse buffer/
   image support.
4. Could/should we do all the vm/vma updates synchronously and defer _only_
   the io-pgtable updates to the VM_BIND scheduler queue?  This would
   simplify the previous point, in that we'd only have to pre-allocate
   pages for the io-pgtable updates.
5. Currently we lose support for BO dumping for devcoredump.  Ideally we'd
   plumb `MSM_SUBMIT_BO_DUMP` flag in a `MAP` commands thru to the resulting
   drm_gpuva's.  To do this, I think we need to extend drm_gpuva with a
   flags field.. the flags can be driver defined, but drm_gpuvm needs to
   know not to merge drm_gpuva's with different flags.

This series can be found in MR form, if you prefer:
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/144

[1] https://www.kernel.org/doc/html/next/gpu/drm-mm.html#drm-gpuvm
[2] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html
[3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=909700
[4] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html#sparsememory-partially-resident-buffers
[5] https://patchew.org/linux/20231007194747.788934-1-dmitry.osipenko@collabora.com/

Rob Clark (24):
  HACK: drm/msm: Disable shrinker
  drm/gpuvm: Don't require obj lock in destructor path
  drm/gpuvm: Remove bogus lock assert
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
  drm/msm: Wire up gpuvm ops
  drm/msm: Bump UAPI version

 drivers/gpu/drm/drm_gpuvm.c                   |  10 +-
 drivers/gpu/drm/msm/Kconfig                   |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |  19 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |   5 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   4 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  24 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |  10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  51 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |  10 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  78 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  22 +-
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
 drivers/gpu/drm/msm/msm_drv.c                 | 175 ++----
 drivers/gpu/drm/msm/msm_drv.h                 |  31 +-
 drivers/gpu/drm/msm/msm_fb.c                  |  18 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |   2 +-
 drivers/gpu/drm/msm/msm_gem.c                 | 403 ++++++-------
 drivers/gpu/drm/msm/msm_gem.h                 | 193 +++++--
 drivers/gpu/drm/msm/msm_gem_prime.c           |  15 +
 drivers/gpu/drm/msm/msm_gem_submit.c          | 223 +++++--
 drivers/gpu/drm/msm/msm_gem_vma.c             | 543 +++++++++++++++---
 drivers/gpu/drm/msm/msm_gpu.c                 |  66 ++-
 drivers/gpu/drm/msm/msm_gpu.h                 | 132 +++--
 drivers/gpu/drm/msm/msm_iommu.c               |  84 ++-
 drivers/gpu/drm/msm/msm_kms.c                 |  14 +-
 drivers/gpu/drm/msm/msm_kms.h                 |   2 +-
 drivers/gpu/drm/msm/msm_mmu.h                 |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  86 ++-
 include/uapi/drm/msm_drm.h                    |  98 +++-
 48 files changed, 1637 insertions(+), 903 deletions(-)

-- 
2.47.1

