Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E781892549
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 21:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C713010F837;
	Fri, 29 Mar 2024 20:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b6xCybn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007BA10F837
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 20:30:20 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a45f257b81fso252145566b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 13:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711744156; x=1712348956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dCWlSotjvCGlRdJzAtkZV2YGveK7qqoLd01P5YRtAdk=;
 b=b6xCybn70n7jF8BCq+cCe+cO2je6UFEuqP/mvDd8fTNGj1d6pLO/+h+FKnj0TJm4/V
 S5LAruIP5OQ7tOVgn6NDDElqbmz2932ektaobZvYuwlZnJMKZEcQnpIwVYP5UQEamgHL
 aFNaZUPoTwsQS4myBAFv08f6TzojpnQo5V5puiTBA4+mGJk3BGeJNziotnGiIxPd04N3
 KdDQFy6xFRIJ93phA/I7c6KvLnI5AZkaX4yGYr/0C45vfJY5koIxYODWDSvMUzQdoy5c
 2bN+s0DCtJTL02e6MkEWOl+fbvo6ml5oBmmvOHyySUZ8McA6fTFDmxvKmTZq2Bthq01E
 L7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711744156; x=1712348956;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dCWlSotjvCGlRdJzAtkZV2YGveK7qqoLd01P5YRtAdk=;
 b=Poir7Q44NA0DNC2frRRyO5SZWqi5hvWYBNNEsNEUqrLIh6ay6qJvwMv9HyRY6pgb2G
 iGy7k/vwfotJcg4j9C5UPt0wdrRtlq9rE3CFLsULpPbN8EHxcS1uJRHNclAUuWzRCF5o
 hUtgENXlmhsn1QTG/WmBsZleyRXfV0T2/upnXSWrm0QbdYrYdNDhELnyHIxo2n3DT76g
 9gNsKdHXeUjZexSofubsdzL48ObFUBiq/Yz8DDSdv15R0SGXk6cs7434i2QNaCWn+PgO
 M1aHnNYQc7vatpSWUY+CTYcWxmBSeG4URVdcr4ztvn5K4lQihWYSyJkyM4o8SpCF1kfT
 9x3w==
X-Gm-Message-State: AOJu0YybQkQbS1wDoWK/QAbvLb4dQOUyyr7MfagZiv7iBFAh31U5sg/b
 P4S12rW8SKesszemILF5WLpbaj2JPX9JqKDDinlE/QjTGsCNlDgAqT3szh8npdtasgbb6mAfvMn
 ISz981m7JwWSgn9HoSZEPu2sEteg=
X-Google-Smtp-Source: AGHT+IG9knaQtIRqfn4ZHCwMfQvYe8puPmTuerbrkxt1+4O7bN51WTFbnfOqGAYAD0O+trK2dNbyNLhrGBCMETeQvao=
X-Received: by 2002:a17:906:b104:b0:a4e:1154:fa46 with SMTP id
 u4-20020a170906b10400b00a4e1154fa46mr2313605ejy.70.1711744156041; Fri, 29 Mar
 2024 13:29:16 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 30 Mar 2024 06:29:04 +1000
Message-ID: <CAPM=9tyTKh_qXRW8MaTrRnjN=Da_hLLm66dj2_WcwFQ3e3O+kg@mail.gmail.com>
Subject: [git pull] drm fixes for 6.9-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi Linus,

Regular fixes for rc2, quite a few i915/amdgpu as usual, some xe, and
then mostly scattered around. rc3 might be quieter with the holidays
but we shall see.

Regards.
Dave.

drm-fixes-2024-03-30:
drm fixes for 6.9-rc2

bridge:
- select DRM_KMS_HELPER

dma-buf:
- fix NULL-pointer deref

dp:
- fix div-by-zero in DP MST unplug code

fbdev:
- select FB_IOMEM_FOPS for SBus

sched:
- fix NULL-pointer deref

xe:
- Fix build on mips
- Fix wrong bound checks
- Fix use of msec rather than jiffies
- Remove dead code

amdgpu:
- SMU 14.0.1 updates
- DCN 3.5.x updates
- VPE fix
- eDP panel flickering fix
- Suspend fix
- PSR fix
- DCN 3.0+ fix
- VCN 4.0.6 updates
- debugfs fix

amdkfd:
- DMA-Buf fix
- GFX 9.4.2 TLB flush fix
- CP interrupt fix

i915:
- Fix for BUG_ON/BUILD_BUG_ON IN I915_memcpy.c
- Update a MTL workaround
- Fix locking inversion in hwmon's sysfs
- Remove a bogus error message around PXP
- Fix UAF on VMA
- Reset queue_priority_hint on parking
- Display Fixes:
- Remove duplicated audio enable/disable on SDVO and DP
- Disable AuxCCS for Xe driver
- Revert init order of MIPI DSI
- DRRS debugfs fix with an extra refactor patch
- VRR related fixes
- Fix a JSL eDP corruption
 - Fix the cursor physical dma address
- BIOS VBT related fix

nouveau:
- dmem: handle kcalloc() allocation failures

qxl:
- remove unused variables

rockchip:
- vop2: remove support for AR30 and AB30 formats

vmwgfx:
- debugfs: create ttm_resource_manager entry only if needed
The following changes since commit 4cece764965020c22cff7665b18a012006359095=
:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-03-30

for you to fetch changes up to b01f596ab1dd027ce937358007dc1fa3e5a25917:

  Merge tag 'drm-intel-fixes-2024-03-28' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-fixes
(2024-03-30 05:34:06 +1000)

----------------------------------------------------------------
drm fixes for 6.9-rc2

bridge:
- select DRM_KMS_HELPER

dma-buf:
- fix NULL-pointer deref

dp:
- fix div-by-zero in DP MST unplug code

fbdev:
- select FB_IOMEM_FOPS for SBus

sched:
- fix NULL-pointer deref

xe:
- Fix build on mips
- Fix wrong bound checks
- Fix use of msec rather than jiffies
- Remove dead code

amdgpu:
- SMU 14.0.1 updates
- DCN 3.5.x updates
- VPE fix
- eDP panel flickering fix
- Suspend fix
- PSR fix
- DCN 3.0+ fix
- VCN 4.0.6 updates
- debugfs fix

amdkfd:
- DMA-Buf fix
- GFX 9.4.2 TLB flush fix
- CP interrupt fix

i915:
- Fix for BUG_ON/BUILD_BUG_ON IN I915_memcpy.c
- Update a MTL workaround
- Fix locking inversion in hwmon's sysfs
- Remove a bogus error message around PXP
- Fix UAF on VMA
- Reset queue_priority_hint on parking
- Display Fixes:
- Remove duplicated audio enable/disable on SDVO and DP
- Disable AuxCCS for Xe driver
- Revert init order of MIPI DSI
- DRRS debugfs fix with an extra refactor patch
- VRR related fixes
- Fix a JSL eDP corruption
 - Fix the cursor physical dma address
- BIOS VBT related fix

nouveau:
- dmem: handle kcalloc() allocation failures

qxl:
- remove unused variables

rockchip:
- vop2: remove support for AR30 and AB30 formats

vmwgfx:
- debugfs: create ttm_resource_manager entry only if needed

----------------------------------------------------------------
Andy Yan (1):
      drm/rockchip: vop2: Remove AR30 and AB30 format support

Bhanuprakash Modem (2):
      drm/i915/drrs: Refactor CPU transcoder DRRS check
      drm/i915/display/debugfs: Fix duplicate checks in i915_drrs_status

Chris Bainbridge (1):
      drm/dp: Fix divide-by-zero regression on DP MST unplug with nouveau

Chris Park (1):
      drm/amd/display: Prevent crash when disable stream

Chris Wilson (1):
      drm/i915/gt: Reset queue_priority_hint on parking

Dave Airlie (5):
      Merge tag 'drm-xe-fixes-2024-03-26' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.9-2024-03-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      drm/i915: add bug.h include to i915_memcpy.c
      Merge tag 'drm-misc-fixes-2024-03-28' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2024-03-28' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-fixes

Duoming Zhou (1):
      nouveau/dmem: handle kcalloc() allocation failure

Eric Huang (1):
      drm/amdkfd: fix TLB flush after unmap for GFX9.4.2

George Shen (1):
      drm/amd/display: Remove MPC rate control logic from DCN30 and above

Hamza Mahfooz (1):
      drm/amd/display: fix IPX enablement

Harry Wentland (1):
      Revert "drm/amd/display: Fix sending VSC (+ colorimetry) packets
for DP/eDP displays without PSR"

Janusz Krzysztofik (2):
      drm/i915/hwmon: Fix locking inversion in sysfs getter
      drm/i915/vma: Fix UAF on destroy against retire race

Jocelyn Falempe (1):
      drm/vmwgfx: Create debugfs ttm_resource_manager entry only if needed

Johannes Weiner (1):
      drm/amdgpu: fix deadlock while reading mqd from debugfs

Jonathan Kim (1):
      drm/amdkfd: range check cp bad op exception interrupts

Jonathon Hall (1):
      drm/i915: Do not match JSL in ehl_combo_pll_div_frac_wa_needed()

Joonas Lahtinen (1):
      drm/i915: Add includes for BUG_ON/BUILD_BUG_ON in i915_memcpy.c

Jos=C3=A9 Roberto de Souza (1):
      drm/i915: Do not print 'pxp init failed with 0' when it succeed

Juha-Pekka Heikkila (1):
      drm/i915/display: Disable AuxCCS framebuffers if built for Xe

Lang Yu (2):
      drm/amdgpu/umsch: update UMSCH 4.0 FW interface
      drm/amdgpu: enable UMSCH 4.0.6

Luca Weiss (1):
      drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE

Lucas De Marchi (1):
      drm/xe: Fix END redefinition

Mario Limonciello (1):
      drm/amd: Flush GFXOFF requests in prepare stage

Matthew Auld (5):
      drm/xe/guc_submit: use jiffies for job timeout
      drm/xe/queue: fix engine_class bounds check
      drm/xe/device: fix XE_MAX_GT_PER_TILE check
      drm/xe/device: fix XE_MAX_TILES_PER_DEVICE check
      drm/xe/query: fix gt_id bounds check

Miguel Ojeda (2):
      drm/qxl: remove unused `count` variable from `qxl_surface_id_alloc()`
      drm/qxl: remove unused variable from `qxl_process_single_command()`

Mukul Joshi (1):
      drm/amdkfd: Check cgroup when returning DMABuf info

Natanel Roizenman (1):
      drm/amd/display: Increase Z8 watermark times.

Neil Armstrong (1):
      Revert "drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE"

Nirmoy Das (1):
      drm/xe: Remove unused xe_bo->props struct

Pavel Sakharov (1):
      dma-buf: Fix NULL pointer dereference in sanitycheck()

Peyton Lee (1):
      drm/amdgpu/vpe: power on vpe when hw_init

Roman Li (1):
      drm/amd/display: Fix bounds check for dcn35 DcfClocks

Sung Joon Kim (1):
      drm/amd/display: Update dcn351 to latest dcn35 config

Taimur Hassan (1):
      drm/amd/display: Send DTBCLK disable message on first commit

Tejas Upadhyay (1):
      drm/i915/mtl: Update workaround 14018575942

Thomas Zimmermann (3):
      Merge drm/drm-fixes into drm-misc-fixes
      Merge drm/drm-fixes into drm-misc-fixes
      fbdev: Select I/O-memory framebuffer ops for SBus

Ville Syrj=C3=A4l=C3=A4 (6):
      drm/i915: Stop doing double audio enable/disable on SDVO and g4x+ DP
      drm/i915/dsi: Go back to the previous INIT_OTP/DISPLAY_ON order, most=
ly
      drm/i915/vrr: Generate VRR "safe window" for DSB
      drm/i915/dsb: Fix DSB vblank waits when using VRR
      drm/i915: Pre-populate the cursor physical dma address
      drm/i915/bios: Tolerate devdata=3D=3DNULL in
intel_bios_encoder_supports_dp_dual_mode()

Vitaly Prosyak (1):
      drm/sched: fix null-ptr-deref in init entity

Wenjing Liu (1):
      drm/amd/display: fix a dereference of a NULL pointer

Xi Liu (2):
      drm/amd/display: increase bb clock for DCN351
      drm/amd/display: Set DCN351 BB and IP the same as DCN35

lima1002 (1):
      drm/amd/swsmu: add smu 14.0.1 vcn and jpeg msg

 drivers/dma-buf/st-dma-fence-chain.c               |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  46 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |  12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h       |  20 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   6 ++
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c         |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |   2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   7 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |  54 ++++++-----
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |  14 +--
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |   5 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c | 103 +++++++++++++++++=
----
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   6 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   3 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |  41 --------
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  41 --------
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  41 --------
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |   2 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |  11 ++-
 .../amd/display/modules/info_packet/info_packet.c  |  13 +--
 drivers/gpu/drm/amd/include/umsch_mm_4_0_api_def.h |  13 ++-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h   |  28 +++---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |  10 ++
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  50 ++++++++--
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  21 +++--
 drivers/gpu/drm/display/drm_dp_helper.c            |   7 ++
 drivers/gpu/drm/i915/display/g4x_dp.c              |   2 -
 drivers/gpu/drm/i915/display/icl_dsi.c             |   3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  46 +++++++--
 drivers/gpu/drm/i915/display/intel_cursor.c        |   4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  12 +--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |  14 ++-
 drivers/gpu/drm/i915/display/intel_drrs.h          |   3 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |  14 +++
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |  10 ++
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   4 -
 drivers/gpu/drm/i915/display/intel_vrr.c           |   7 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   3 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   3 -
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   3 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   1 +
 drivers/gpu/drm/i915/i915_driver.c                 |   2 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |  37 ++++----
 drivers/gpu/drm/i915/i915_memcpy.c                 |   2 +
 drivers/gpu/drm/i915/i915_reg.h                    |   2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  50 ++++++++--
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |  12 +--
 drivers/gpu/drm/qxl/qxl_cmd.c                      |   2 -
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |   4 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |   2 -
 drivers/gpu/drm/scheduler/sched_entity.c           |  12 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  15 +--
 drivers/gpu/drm/xe/xe_bo.c                         |  59 ++----------
 drivers/gpu/drm/xe/xe_bo_types.h                   |  19 ----
 drivers/gpu/drm/xe/xe_device.h                     |   4 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   2 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |  20 ++--
 drivers/gpu/drm/xe/xe_query.c                      |   2 +-
 drivers/video/fbdev/Kconfig                        |   3 +
 include/uapi/linux/kfd_ioctl.h                     |  17 +++-
 74 files changed, 565 insertions(+), 448 deletions(-)
