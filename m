Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BF9778F0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 08:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEAE10EB6F;
	Fri, 13 Sep 2024 06:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SqlmQJfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7734B10EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 06:46:43 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so63483366b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 23:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726210002; x=1726814802; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=smMa8B5bRHDRz1/lPizULbe3C4Z8KUeTa44Yd/ZIa8I=;
 b=SqlmQJfg5QkjIwtV+iJhmAy7h6UemeD5jhcfZKfqSmH0ZpmQoHT7E2f8OkDscdFEW7
 C21RQDFmsAIdZSLrJvvb46kiYzMeF4Tnc5qJkj2nP5KsT1Ffj7/vlVnge++oCHpXgygQ
 zgQa0RnuId99mw2OAiPWAjxDfb3lLYMYQcXx9omystwywnYVaaEhFZKbDZKSD3wltC31
 +FQwOe6qLoh+XUSu/rB5x5WsThQdPFiAkibPBbve0rYpQqMd2VGoVhQLqK5zFvhXVSjC
 Ey2+dLa+kOAfM+OdMIgmnVgQkkw4lrycyX7JtuFLuzXvn5Iz0E85qhxLjrKxG2yopgSz
 ickA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726210002; x=1726814802;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=smMa8B5bRHDRz1/lPizULbe3C4Z8KUeTa44Yd/ZIa8I=;
 b=pTwMDz+uD08UkBCLx3694fZUfVCXBPeDWnS157yc2TWKipBQzrvzWIDgaDqS3jpP/2
 5i365GE5NRRgM+tA9sPSUlVS8ActmT67dm5HzKjJFi8FAbCqlR2SoAWMPQxs3mXo4MP/
 SJGEnoKDeDFK5Ta9pFw+qluqV8YAo4L1wWu23my6q3EHQS2UuAtMcEqZpGpBXnhkc4/t
 eQEtxlR/XwNxXqY/OnQjNsEIkKIiarS+bAAN08qDiEyPi3eLjr8Yuf89NJQQ9MIUfEp2
 Cf+ZDFDk9fSLG1L9cJaEGZdWP5dP3Z8CIgi0TKcArRxE0orICb3tEtPI79fGnYfkMpwm
 13vQ==
X-Gm-Message-State: AOJu0YzP8gjNrDg1bV99MpwOjQS6miCbnUKo8WeF8PjbIhiACNRdT8B3
 aMGtnkuSOtTHis+ZVq5nuIic73nMHjm+jgpNGulIrQMhMZ1TyhcL//payRsU3PEb18EXATonNCw
 kV6p0O8qMeD6farzNhCgjS36dZBjhIZ+e
X-Google-Smtp-Source: AGHT+IGFIE0/ZOcDEPolMk8IJA9VxyAyQezzhh2vLOuPFzpZ1w7BptM9JEBsFT44Ziy9ZBA1a7hV6xiokysK/EVCuaA=
X-Received: by 2002:a17:907:86a3:b0:a7a:9f0f:ab18 with SMTP id
 a640c23a62f3a-a9047ca87aemr109485866b.20.1726210001470; Thu, 12 Sep 2024
 23:46:41 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 13 Sep 2024 16:46:14 +1000
Message-ID: <CAPM=9tyi5A8t9bfCC3gtbG18Ai9cPS0bLrFVL_eJ1N1UyT4uBg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.11-rc8
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Linus,

Regular fixes pull, the amdgpu JPEG engine fixes are probably the
biggest, they look to block some register accessing, otherwise there
are just minor fixes and regression fixes all over. nouveau had a
regression report going back a few kernels that finally got fixed, Not
entirely happy with so many changes so late, but they all seem quite
benign apart from the jpeg one.

I should be fine for the merge window next week, see you in Vienna.

Dave.

drm-fixes-2024-09-13:
drm fixes for 6.11-rc8

dma-buf/heaps:
- fix off by one in CMA heap fault handler

syncobj:
- fix syncobj leak in drm_syncobj_eventfd_ioctl

amdgpu:
- Avoid races between set_drr() functions and dc_state_destruct()
- Fix regression related to zpos
- Fix regression related to overlay cursor
- SMU 14.x updates
- JPEG fixes
- Silence an UBSAN warning

amdkfd:
- Fetch cacheline size from IP discovery

i915:
- Prevent a possible int overflow in wq offsets

xe:
- Remove a double include
- Fix null checks and UAF
- Fix access_ok check in user_fence_create
- Fix compat IS_DISPLAY_STEP() range
- OA fix
- Fixes in show_meminfo

nouveau:
- fix GP10x regression on boot

stm:
- add COMMON_CLK dep

rockchip:
- iommu api change

tegra:
- iommu api change
The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b63:

  Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-09-13

for you to fetch changes up to 135be1dc46c64c454f2828dbb7f239d035f47180:

  Merge tag 'drm-xe-fixes-2024-09-12' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-09-13 15:18:18 +1000)

----------------------------------------------------------------
drm fixes for 6.11-rc8

dma-buf/heaps:
- fix off by one in CMA heap fault handler

syncobj:
- fix syncobj leak in drm_syncobj_eventfd_ioctl

amdgpu:
- Avoid races between set_drr() functions and dc_state_destruct()
- Fix regerssion related to zpos
- Fix regression related to overlay cursor
- SMU 14.x updates
- JPEG fixes
- Silence an UBSAN warning

amdkfd:
- Fetch cacheline size from IP discovery

i915:
- Prevent a possible int overflow in wq offsets

xe:
- Remove a double include
- Fix null checks and UAF
- Fix access_ok check in user_fence_create
- Fix compat IS_DISPLAY_STEP() range
- OA fix
- Fixes in show_meminfo

nouveau:
- fix GP10x regression on boot

stm:
- add COMMON_CLK dep

rockchip:
- iommu api change

tegra:
- iommu api change

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/atomfirmware: Silence UBSAN warning

Arnd Bergmann (1):
      drm/stm: add COMMON_CLK dependency

Ashutosh Dixit (1):
      drm/xe/oa: Enable Xe2+ PES disaggregation

Ben Skeggs (1):
      drm/nouveau/fb: restore init() for ramgp102

Dave Airlie (4):
      Merge tag 'amd-drm-fixes-6.11-2024-09-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2024-09-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-09-12' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-09-12' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

David (Ming Qiang) Wu (2):
      drm/amd/amdgpu: apply command submission parser for JPEG v2+
      drm/amd/amdgpu: apply command submission parser for JPEG v1

David Belanger (1):
      drm/amdkfd: Add cache line size info

Jani Nikula (1):
      drm/xe/display: fix compat IS_DISPLAY_STEP() range end

Kenneth Feng (2):
      drm/amd/pm: update the features set on smu v14.0.2/3
      drm/amd/pm: fix the pp_dpm_pcie issue on smu v14.0.2/3

Leo Li (2):
      drm/amd/display: Do not reset planes based on crtc zpos_changed
      drm/amd/display: Add all planes on CRTC to state for overlay cursor

Lu Baolu (2):
      drm/rockchip: Use iommu_paging_domain_alloc()
      drm/tegra: Use iommu_paging_domain_alloc()

Lucas De Marchi (1):
      drm/xe/gt: Remove double include

Matthew Auld (2):
      drm/xe/client: fix deadlock in show_meminfo()
      drm/xe/client: add missing bo locking in show_meminfo()

Matthew Brost (2):
      drm/xe: Remove fence check from send_tlb_invalidation
      drm/xe: Fix possible UAF in guc_exec_queue_process_msg

Nikita Zhandarovich (1):
      drm/i915/guc: prevent a possible int overflow in wq offsets

Nirmoy Das (1):
      drm/xe: Fix access_ok check in user_fence_create

T.J. Mercier (2):
      dma-buf: heaps: Fix off-by-one in CMA heap fault handler
      drm/syncobj: Fix syncobj leak in drm_syncobj_eventfd_ioctl

Tobias Jakobi (2):
      drm/amd/display: Avoid race between dcn10_set_drr() and
dc_state_destruct()
      drm/amd/display: Avoid race between dcn35_set_drr() and
dc_state_destruct()

 drivers/dma-buf/heaps/cma_heap.c                   |  2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             | 76 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h             | 11 ++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             | 63 +++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |  6 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |  2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.h             |  1 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           | 57 +---------------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |  7 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |  1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  8 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 13 +++-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    | 20 +++---
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 20 +++---
 drivers/gpu/drm/amd/include/atomfirmware.h         |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       | 11 +++-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 12 ++++
 drivers/gpu/drm/drm_syncobj.c                      | 17 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h       |  2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c  |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        | 10 ++-
 drivers/gpu/drm/stm/Kconfig                        |  1 +
 drivers/gpu/drm/tegra/drm.c                        |  5 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  2 +-
 drivers/gpu/drm/xe/regs/xe_oa_regs.h               |  1 +
 drivers/gpu/drm/xe/xe_drm_client.c                 | 45 +++++++++++--
 drivers/gpu/drm/xe/xe_gt.c                         |  1 -
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  4 +-
 drivers/gpu/drm/xe/xe_oa.c                         |  4 ++
 drivers/gpu/drm/xe/xe_sync.c                       |  2 +-
 36 files changed, 315 insertions(+), 109 deletions(-)
