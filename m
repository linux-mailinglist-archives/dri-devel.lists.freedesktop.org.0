Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E2C75BCAF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 05:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD8710E1CD;
	Fri, 21 Jul 2023 03:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27CF10E1CD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 03:14:18 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51ff0e3d8c1so1936891a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 20:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689909257; x=1690514057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/D+BThGDUdHOFbtbvM3XhwqjZMPaa7oHp6EA2NX41po=;
 b=NSd1ql3GptYjwQilhfMiLi1r4rdow6FSBIye5K60nDdByG+/O4sgPstzAW5Q9aNXPO
 EcR58iez6HjQmdZaoNjhuPlf7Qirqowj3HT4ToYXjaQB1fim7IDzhzsz9ABpWW4FWoWg
 XpG3GSOnx2FvNOOZ1hlarQUI6UlUDQuIkEmbG8dcdDAQxZI7LbzcUpmnHwcuChBudY4E
 p/yg09fy4fgkXH4+3UlrFG0CFnt8YyLJpffv24JTomNs3GtS80A+MRm3KlbDg1tJjYC/
 8ZNEaUGrffWN4qxCA/ooJzOk0XezA43/oiukjtwgxaojn526Yrv3WCw5sX6eL0uLLuBn
 utXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689909257; x=1690514057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/D+BThGDUdHOFbtbvM3XhwqjZMPaa7oHp6EA2NX41po=;
 b=DXmS4n7jI45lXa3NRRK9TKh4DzLEMnRO+aDGYVtneuIJOm/+gvFKt9lfF9B4k8Em17
 CH7eLFp/TBkno4JTWvyVG2UZ7orrR4uRM2pbiX95ewCpQ/uWpSxwUK8j3cdQpdCyUzo0
 NKdWgJrJVmZNIkbrbSaGBQaO6DLXNFqptAzHTJD2m32vz9HR/o4O9N3I7RmooGCU0O5K
 mytUJWol7kv42K0hkrICkSXXkJxzKQ4ybq7CdWMA1qZMF5K1nu06uDbAGwYmewxW1JPH
 KIYdRJLiPhvl2j3rTD27FXVc3A5jOPVIFiy8iPtkfsIB7iwTf/S8nrbdQJPXCxvz3aFg
 CMMg==
X-Gm-Message-State: ABy/qLaxsW9t+X2y2wE9PbZYYybnxUbdmcJVlKd6LmwV5rzSIPbfz3JV
 JsiBUNjuIJ/9P5GjByRHUJlST04HYJDuq7k0akw=
X-Google-Smtp-Source: APBJJlHkpEFdD1hHC9usW4WnC+1vzRc80b5yHgr90e14hYD9CUZkbu2CDcLUG+74/SOQmnpyFVz6bXqHdoCvrzMqNWI=
X-Received: by 2002:a17:906:77dd:b0:994:539d:f983 with SMTP id
 m29-20020a17090677dd00b00994539df983mr482271ejn.23.1689909256800; Thu, 20 Jul
 2023 20:14:16 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 Jul 2023 13:14:05 +1000
Message-ID: <CAPM=9txWYVhy+bM9EMBDy3p=vqCE=E_yHPb6GRC_Zx-EN42RSg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.5-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This week's fixes pull, just realise the tag says for rc2, but it's
meant to be rc3. Mostly amdgpu fixes, a couple of i915 fixes, some
nouveau and then a few misc accel and other fixes.

Dave.

drm-fixes-2023-07-21:
drm fixes for 6.5-rc2

client:
- memory leak fix

dma-buf:
- memory leak fix

qaic:
- bound check fixes
- map_user_pages leak
- int overflow fixes

habanalabs:
- debugfs stub helper

nouveau:
- aux event slot fixes
- anx9805 cards fixes

i915:
- Add sentinel to xehp_oa_b_counters
- Revert "drm/i915: use localized __diag_ignore_all() instead of per file"

amdgpu:
- More PCIe DPM fixes for Intel platforms
- DCN3.0.1 fixes
- Virtual display timer fix
- Async flip fix
- SMU13 clock reporting fixes
- Add missing PSP firmware declaration
- DP MST fix
- DCN3.1.x fixes
- Slab out of bounds fix
The following changes since commit fdf0eaf11452d72945af31804e2a1048ee1b574c=
:

  Linux 6.5-rc2 (2023-07-16 15:10:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-07-21

for you to fetch changes up to 28801cc85906ea62043e62c71def7f9daaf1c168:

  Merge tag 'amd-drm-fixes-6.5-2023-07-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-07-21
12:16:47 +1000)

----------------------------------------------------------------
drm fixes for 6.5-rc2

client:
- memory leak fix

dma-buf:
- memory leak fix

qaic:
- bound check fixes
- map_user_pages leak
- int overflow fixes

habanalabs:
- debugfs stub helper

nouveau:
- aux event slot fixes
- anx9805 cards fixes

i915:
- Add sentinel to xehp_oa_b_counters
- Revert "drm/i915: use localized __diag_ignore_all() instead of per file"

amdgpu:
- More PCIe DPM fixes for Intel platforms
- DCN3.0.1 fixes
- Virtual display timer fix
- Async flip fix
- SMU13 clock reporting fixes
- Add missing PSP firmware declaration
- DP MST fix
- DCN3.1.x fixes
- Slab out of bounds fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/pm: make gfxclock consistent for sienna cichlid
      drm/amdgpu/pm: make mclk consistent for smu 13.0.7

Andrzej Hajda (1):
      drm/i915/perf: add sentinel to xehp_oa_b_counters

Arnd Bergmann (1):
      accel/habanalabs: add more debugfs stub helpers

Aurabindo Pillai (2):
      drm/amd/display: export some optc function for reuse
      drm/amd/display: add DCN301 specific logic for OTG programming

Ben Skeggs (3):
      drm/nouveau/i2c: fix number of aux event slots
      drm/nouveau/disp: PIOR DP uses GPIO for HPD, not PMGR AUX interrupts
      drm/nouveau/kms/nv50-: init hpd_irq_lock for PIOR DP

Candice Li (1):
      drm/amdgpu: Allow the initramfs generator to include psp_13_0_6_ta

Dan Carpenter (4):
      accel/qaic: tighten bounds checking in encode_message()
      accel/qaic: tighten bounds checking in decode_message()
      accel/qaic: Add consistent integer overflow checks
      accel/qaic: Fix a leak in map_user_pages()

Daniel Miess (1):
      drm/amd/display: Prevent vtotal from being set to 0

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2023-07-20' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-07-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.5-2023-07-20' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Guchun Chen (5):
      drm/amdgpu/vkms: relax timer deactivation by hrtimer_try_to_cancel
      drm/amdgpu: Allocate root PD on correct partition
      drm/amdgpu: fix slab-out-of-bounds issue in amdgpu_vm_pt_create
      drm/amdgpu/vm: use the same xcp_id from root PD
      drm/amdgpu: use a macro to define no xcp partition case

Jani Nikula (1):
      Revert "drm/i915: use localized __diag_ignore_all() instead of per fi=
le"

Jocelyn Falempe (2):
      drm/client: Fix memory leak in drm_client_target_cloned
      drm/client: Fix memory leak in drm_client_modeset_probe

Mario Limonciello (1):
      drm/amd: Use amdgpu_device_pcie_dynamic_switching_supported() for SMU=
7

Nicholas Kazlauskas (1):
      drm/amd/display: Keep PHY active for DP displays on DCN31

Simon Ser (1):
      drm/amd/display: only accept async flips for fast updates

Srinivasan Shanmugam (1):
      drm/amd/display: Clean up errors & warnings in amdgpu_dm.c

Taimur Hassan (1):
      drm/amd/display: check TG is non-null before checking if enabled

Ville Syrj=C3=A4l=C3=A4 (1):
      dma-buf/dma-resv: Stop leaking on krealloc() failure

Wayne Lin (1):
      drm/amd/display: Add polling method to handle MST reply packet

Zhikai Zhai (1):
      drm/amd/display: Disable MPC split by default on special asic

 drivers/accel/habanalabs/common/habanalabs.h       |   9 +
 drivers/accel/qaic/qaic_control.c                  |  39 ++--
 drivers/dma-buf/dma-resv.c                         |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   2 +
 .../gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 256 +++++++++--------=
----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   7 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  12 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 110 +++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  11 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   5 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |   3 +
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |   3 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_optc.c    | 185 +++++++++++++++
 .../gpu/drm/amd/display/dc/dcn301/dcn301_optc.h    |  36 +++
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   4 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  14 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   2 +-
 drivers/gpu/drm/drm_client_modeset.c               |   6 +
 drivers/gpu/drm/i915/Makefile                      |   5 +
 .../gpu/drm/i915/display/intel_display_device.c    |   5 -
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   5 -
 drivers/gpu/drm/i915/i915_pci.c                    |   5 -
 drivers/gpu/drm/i915/i915_perf.c                   |   1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   4 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h  |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c   |  27 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c     |  11 +-
 42 files changed, 612 insertions(+), 242 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_optc.h
