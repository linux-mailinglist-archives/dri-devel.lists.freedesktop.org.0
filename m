Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906448CEACE
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 22:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B977610EF56;
	Fri, 24 May 2024 20:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XpY3bCB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B33710F287
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 20:23:39 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-529682e013dso1303980e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 13:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716582217; x=1717187017; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wJu/pVRboFbiKJMa5J2Vf5uGNhPMTOM1fhENv4rUh4M=;
 b=XpY3bCB2gtAfoeDLpkJ+HcBCyPQ6fnOA5FeZ+64Msw6tsLC1+E8LHw1i33g6YE52C1
 u5aourJ2oIWx+Z87z10FqHB2ylvNAB3J2xzbmrhujWe3/VwAOgJWfhG3JfebVSvQ2Wfz
 ognMAGdm0uNiqZ/7SBKiXpl/YINd20bdazc8fgNFWNOGVvCfhSMvIK9bdqf0Rf5bjsrd
 jsRwKgKJ2wFOlhpqEbkjB1xq7Ri7meDpnk7C+GClleNC3OSxdy5UHAxKddot4sSXvcZP
 4Fb8/pNm+O3DwqlO9y5Vfo6rbRLC47Hk5cpQtQNXr5C8no6HxLckOxVs7K1J8DJzLdyh
 AP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716582217; x=1717187017;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wJu/pVRboFbiKJMa5J2Vf5uGNhPMTOM1fhENv4rUh4M=;
 b=ag2jVl578J4ggkdcj2fy6WzLvlAWBQabmLxoS+bDdv/0bPiF97Cs4spX6YXNT6H2Xy
 VO1+AqZ2bxj/SYHVJSrwNia0dPA3tn7FVtKmU/UTilfs967rad8UdH9ms2HJ02uOH9Ft
 /8NdtLjjS8zl0Pqs8SE8pTRgO8pxxKHxiNC3/FkuQ67kI/vczCXf+qPZSdgbEAJ6YNU1
 iZeS4aGAU5xo0vC7lKHfyTgAedytH9SMN12VWcmzN3LFvuHDTlNaG/S9vETajDSsRryN
 wvex4OJNFERxoydfGx/I/NzwG1tG7FanYTU4nKK7o7L39Ahx2Q1DfhMxo0irkWu+jaoc
 qFLA==
X-Gm-Message-State: AOJu0YzFKAaM9MGg2rhe4IJAQAn7Zlx5MHflEUPUwVrE6FB5Ioe7aU2H
 ZRZv8wpod39k3wCx3tM1Ve7VDgvZKepcHYRRXwjQOjJ0oQFWYZVMJquL72ZduqS2nio3MVciiK3
 IpFxCEeh3gMsEDfhOHrHkmEJ+Kcw=
X-Google-Smtp-Source: AGHT+IGwmsPs4HGTBqKhtiV4QlaLPzfF1wSev4VipuhbjSozto/Lo1KdNV3EosRe1k+njY8t88ynRvq85kmOC499ALE=
X-Received: by 2002:a05:6512:15a2:b0:523:8858:db81 with SMTP id
 2adb3069b0e04-529649c5e7fmr2540839e87.22.1716582217251; Fri, 24 May 2024
 13:23:37 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 25 May 2024 06:23:25 +1000
Message-ID: <CAPM=9txzvSpHASKuse2VFjbdVKftTfWNtPP8Jibck6jC_n_c1Q@mail.gmail.com>
Subject: [git pull] drm fixes for 6.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

Some fixes for the end of the merge window, mostly amdgpu and panthor,
with one nouveau uAPI change that fixes a bad decision we made a few
months back.

Regards,
Dave.

drm-next-2024-05-25:
drm fixes for 6.10-rc1

nouveau:
- fix bo metadata uAPI for vm bind

panthor:
- Fixes for panthor's heap logical block.
- Reset on unrecoverable fault
- Fix VM references.
- Reset fix.

xlnx:
- xlnx compile and doc fixes.

amdgpu:
- Handle vbios table integrated info v2.3

amdkfd:
- Handle duplicate BOs in reserve_bo_and_cond_vms
- Handle memory limitations on small APUs

dp/mst:
- MST null deref fix.

bridge:
- Don't let next bridge create connector in adv7511 to make probe work.
The following changes since commit 431c590c3ab0469dfedad3a832fe73556396ee52:

  drm/tests: Add a unit test for range bias allocation (2024-05-16
12:50:14 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-05-25

for you to fetch changes up to 32a0bb7ef217aa37e6b67ca7950f5e504312ed72:

  Merge tag 'drm-misc-next-fixes-2024-05-23' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
(2024-05-23 16:01:39 +1000)

----------------------------------------------------------------
drm fixes for 6.10-rc1

nouveau:
- fix bo metadata uAPI for vm bind

panthor:
- Fixes for panthor's heap logical block.
- Reset on unrecoverable fault
- Fix VM references.
- Reset fix.

xlnx:
- xlnx compile and doc fixes.

amdgpu:
- Handle vbios table integrated info v2.3

amdkfd:
- Handle duplicate BOs in reserve_bo_and_cond_vms
- Handle memory limitations on small APUs

dp/mst:
- MST null deref fix.

bridge:
- Don't let next bridge create connector in adv7511 to make probe work.

----------------------------------------------------------------
Anatoliy Klymenko (2):
      drm: xlnx: zynqmp_dpsub: Fix few function comments
      drm: xlnx: zynqmp_dpsub: Fix compilation error

Antonino Maniscalco (1):
      drm/panthor: Fix tiler OOM handling to allow incremental rendering

Arunpravin Paneer Selvam (1):
      drm/buddy: Fix the warn on's during force merge

Boris Brezillon (8):
      drm/panthor: Make sure the tiler initial/max chunks are consistent
      drm/panthor: Relax the constraints on the tiler chunk size
      drm/panthor: Fix an off-by-one in the heap context retrieval logic
      drm/panthor: Document drm_panthor_tiler_heap_destroy::handle
validity constraints
      drm/panthor: Force an immediate reset on unrecoverable faults
      drm/panthor: Keep a ref to the VM at the panthor_kernel_bo level
      drm/panthor: Reset the FW VM to NULL on unplug
      drm/panthor: Call panthor_sched_post_reset() even if the reset failed

Dave Airlie (3):
      Merge tag 'drm-misc-next-fixes-2024-05-16' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-fixes-6.10-2024-05-22' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2024-05-23' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next

Lang Yu (2):
      drm/amdkfd: handle duplicate BOs in reserve_bo_and_cond_vms
      drm/amdkfd: Let VRAM allocations go to GTT domain on small APUs

Li Ma (1):
      drm/amdgpu/atomfirmware: add intergrated info v2.3 table

Liu Ying (1):
      drm/bridge: adv7511: Attach next bridge without creating connector

Mohamed Ahmed (1):
      drm/nouveau: use tile_mode and pte_kind for VM_BIND bo allocations

Wayne Lin (1):
      drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  5 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 23 ++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   | 15 +++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  6 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |  3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         | 43 +++++++++++++++++++
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  3 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  4 +-
 drivers/gpu/drm/drm_buddy.c                        |  6 +--
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |  3 ++
 drivers/gpu/drm/nouveau/nouveau_bo.c               | 44 +++++++++-----------
 drivers/gpu/drm/panthor/panthor_device.c           |  8 +---
 drivers/gpu/drm/panthor/panthor_device.h           |  1 +
 drivers/gpu/drm/panthor/panthor_fw.c               |  5 ++-
 drivers/gpu/drm/panthor/panthor_gem.c              |  8 ++--
 drivers/gpu/drm/panthor/panthor_gem.h              |  8 +++-
 drivers/gpu/drm/panthor/panthor_heap.c             | 36 +++++++++-------
 drivers/gpu/drm/panthor/panthor_sched.c            | 48 ++++++++++++++++------
 drivers/gpu/drm/panthor/panthor_sched.h            |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |  6 +--
 include/drm/display/drm_dp_mst_helper.h            |  1 -
 include/uapi/drm/nouveau_drm.h                     |  7 ++++
 include/uapi/drm/panthor_drm.h                     | 20 +++++++--
 27 files changed, 215 insertions(+), 98 deletions(-)
