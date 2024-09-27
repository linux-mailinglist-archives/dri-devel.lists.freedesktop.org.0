Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6595988D05
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 01:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1334310ED43;
	Fri, 27 Sep 2024 23:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="isgJGDQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF1710ED43
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 23:39:54 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5c88b5c375fso70968a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 16:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727480393; x=1728085193; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7TryZeK2Kos3KKpHAebxMKpIIfHZPCpKrvsN7ghxB5c=;
 b=isgJGDQVdMeolSZPUON54QLcSeLZjMuhOzUmuLaK8P2SInQGWYED0dLvha/1H0VMQr
 mJRZZWYQDJ4sf34HAI1x0YQwx0sF91G+MZHdYhtml1CPOjm3DD4oOTOr2ztAMyZcY3Mz
 T06N6EUBNsv9AfhHEM6J70ZkiXTGIwyMiAzg9I+XjpmhnhMN5hVUg/5IsbuLkdnixdzJ
 sg2+Y5ZRkTLjgAkXG2h3kMlnnPiUrv9K3g1UjChvevtIOaGn/zwkA2Zu5EWU0qMhm0Y+
 +nQPNXzqPXaYjj7H5l0TmpSP88FWIBlZ/A1+XtFXIrUp89w5gjEvwcUmgCQNGOnBwVFX
 5pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727480393; x=1728085193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7TryZeK2Kos3KKpHAebxMKpIIfHZPCpKrvsN7ghxB5c=;
 b=UJ7eFnZfLgm7XOZtU0xAuQPzF7Ur9LPRel0IfWvetT12ePUJkLKMKujGLJoehdlkFd
 R3b3VewbBRRbZKdzruZASV94G4lNkTr4P+4Ib+Q/hGyevSYd7DTUjm/JFpVvOYJScyry
 dJ06lY2hIlfnTO7mKpqH6/D59HzV+Uau8FUTK9cf+O66Sy0+jZCWFwoUVZl7SwYnPAs+
 5Q+il2kLj/YiHEh62mHt+tHeOcqvswdNJ6f2dU+YpsICXgu+b7UaNnQqpeoYP1rx42sH
 bEurwCMiXSKpB5vZYSOPC0x3aIyg2ZDly5iHXvDgmDbWNmDU5CBv2EAHvU8LNxMYWVG/
 tyaA==
X-Gm-Message-State: AOJu0YzCwoTBYY3MHJnvHi9y0zhCk+98FxTHN8udTubSJ2WiMz2YcHsu
 m4s38+kQAJnjCHcteFXbJRaq3xqdUewd2NPdNqpYDxMLcjKeOVlRx5aFDAFxqyR1xpMY0sPlVKo
 I3Tmt+BivUun51Id0LpBCFS8F70GUKvnE
X-Google-Smtp-Source: AGHT+IHkfaOevsltuWcj7+YnivigBZ4Ra1hTSIEB76ApixftmSlbEAniaqu2ShpduxnI3FVZLYiwsLWldyhu/QhV30A=
X-Received: by 2002:a17:907:f74d:b0:a93:d5d3:f860 with SMTP id
 a640c23a62f3a-a93d5d400f1mr121634966b.38.1727480392614; Fri, 27 Sep 2024
 16:39:52 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 28 Sep 2024 09:39:41 +1000
Message-ID: <CAPM=9tyzGT9vTmFUBK51bJAT-fEsKMkfScQZCCEcHCX7Lq553w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.12-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
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

Regular fixes for the week to end the merge window, i915 and xe have a
few each, amdgpu makes up most of it with a bunch of SR-IOV related
fixes amongst others.

Regards,
Dave.

drm-next-2024-09-28:
drm fixes for 6.12-rc1

i915:
- Fix BMG support to UHBR13.5
- Two PSR fixes
- Fix colorimetry detection for DP

xe
- Fix macro for checking minimum GuC version
- Fix CCS offset calculation for some BMG SKUs
- Fix locking on memory usage reporting via fdinfo and BO destroy
- Fix GPU page fault handler on a closed VM
- Fix overflow in oa batch buffer

amdgpu:
- MES 12 fix
- KFD fence sync fix
- SR-IOV fixes
- VCN 4.0.6 fix
- SDMA 7.x fix
- Bump driver version to note cleared VRAM support
- SWSMU fix
- Display fixes

amdgpu:
- CU occupancy logic fix
- SDMA queue fix
The following changes since commit ae2c6d8b3b88c176dff92028941a4023f1b4cb91=
:

  Merge tag 'drm-xe-next-fixes-2024-09-12' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-09-17
14:53:34 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-09-28

for you to fetch changes up to e7268dd9bb9953a9eb0df9948abf5195bf474538:

  Merge tag 'amd-drm-fixes-6.12-2024-09-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-09-28
08:42:53 +1000)

----------------------------------------------------------------
drm fixes for 6.12-rc1

i915:
- Fix BMG support to UHBR13.5
- Two PSR fixes
- Fix colorimetry detection for DP

xe
- Fix macro for checking minimum GuC version
- Fix CCS offset calculation for some BMG SKUs
- Fix locking on memory usage reporting via fdinfo and BO destroy
- Fix GPU page fault handler on a closed VM
- Fix overflow in oa batch buffer

amdgpu:
- MES 12 fix
- KFD fence sync fix
- SR-IOV fixes
- VCN 4.0.6 fix
- SDMA 7.x fix
- Bump driver version to note cleared VRAM support
- SWSMU fix
- Display fixes
- Backlight fixes

amdgpu:
- CU occupancy logic fix
- SDMA queue fix

----------------------------------------------------------------
Alex Deucher (10):
      drm/amdgpu/gfx9.4.3: drop extra wrapper
      drm/amdgpu: fix spelling in amd_shared.h
      drm/amdgpu/gfx9.4.3: set additional bits on MEC halt
      drm/amdgpu/gfx9.4.3: Explicitly halt MEC before init
      drm/amdgpu/bios: split vbios fetching between APU and dGPU
      drm/amdgpu: clean up vbios fetching code
      drm/amdgpu/mes11: reduce timeout
      drm/amdgpu/mes12: reduce timeout
      drm/amdgpu: fix vbios fetching for SR-IOV
      drm/amdgpu: bump driver version for cleared VRAM

Alex Hung (2):
      drm/amd/display: Check null pointer before dereferencing se
      drm/amd/display: Remove always-false branches

Andrew Kreimer (1):
      drm/amdgpu: Fix a typo

Aric Cyr (2):
      drm/amd/display: 3.2.300
      drm/amd/display: 3.2.301

Arun R Murthy (1):
      drm/i915/display: BMG supports UHBR13.5

Asad Kamal (2):
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amdgpu: Fix get each xcp macro

Aurabindo Pillai (1):
      drm/amd/display: Fix underflow when setting underscan on DCN401

Bob Zhou (1):
      drm/amdgpu: Fix missing check pcie_p2p module param

Charlene Liu (2):
      drm/amd/display: Use full update for swizzle mode change
      drm/amd/display: Clear cached watermark after resume

Christian K=C3=B6nig (5):
      drm/amdgpu: nuke the VM PD/PT shadow handling
      drm/amdgpu: explicitely set the AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS fla=
g
      drm/amdgpu: remove amdgpu_pin_restricted()
      drm/amdgpu: use GEM references instead of TTMs v2
      drm/amdgpu: sync to KFD fences before clearing PTEs

Daniel Sa (1):
      drm/amd/display: Emulate Display Hotplug Hang

Dave Airlie (4):
      Merge tag 'drm-intel-next-fixes-2024-09-19' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2024-09-19' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-next-fixes-2024-09-26' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'amd-drm-fixes-6.12-2024-09-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David Belanger (1):
      drm/amdgpu: Fix selfring initialization sequence on soc24

Dillon Varone (1):
      drm/amd/display: Block timing sync for different output formats in pm=
o

Frank Min (2):
      drm/amdgpu: update golden regs for gfx12
      drm/amdgpu: fix PTE copy corruption for sdma 7

Imre Deak (1):
      drm/i915/dp: Fix AUX IO power enabling for eDP PSR

Jack Xiao (2):
      drm/amdgpu/mes12: switch SET_SHADER_DEBUGGER pkt to mes schq pipe
      drm/amdgpu/mes12: set enable_level_process_quantum_check

Jesse Zhang (1):
      drm/amdkfd: clean up code for interrupt v10

Jos=C3=A9 Roberto de Souza (1):
      drm/xe/oa: Fix overflow in oa batch buffer

Jouni H=C3=B6gander (1):
      drm/i915/psr: Do not wait for PSR being idle on on Panel Replay

Kenneth Feng (1):
      drm/amd/pm: update workload mask after the setting

Kent Russell (2):
      drm/amdkfd: Move queue fs deletion after destroy check
      drm/amdgpu: Retry i2c transfer once if it fails on SMU13.0.6

Le Ma (2):
      drm/amdgpu: add psp funcs callback to check if aux fw is needed
      drm/amdgpu: load sos binary properly on the basis of pmfw version

Leo Ma (1):
      drm/amd/display: Add HDMI DSC native YCbCr422 support

Lijo Lazar (1):
      drm/amdgpu: Fix XCP instance mask calculation

Mario Limonciello (2):
      drm/amd/display: Validate backlight caps are sane
      drm/amd/display: Allow backlight to go below
`AMDGPU_DM_DEFAULT_MIN_BACKLIGHT`

Martin Tsai (1):
      drm/amd/display: Clean up dsc blocks in accelerated mode

Matthew Auld (5):
      drm/xe/vram: fix ccs offset calculation
      drm/xe/client: fix deadlock in show_meminfo()
      drm/xe/client: add missing bo locking in show_meminfo()
      drm/xe/client: use mem_type from the current resource
      drm/xe/bo: add some annotations in bo_put()

Matthew Brost (1):
      drm/xe: Do not run GPU page fault handler on a closed VM

Michal Wajdeczko (1):
      drm/xe/guc: Fix GUC_{SUBMIT,FIRMWARE}_VER helper macros

Mukul Joshi (2):
      drm/amdkfd: Update logic for CU occupancy calculations
      drm/amdkfd: Fix CU occupancy for GFX 9.4.3

Nicholas Kazlauskas (1):
      drm/amd/display: Block dynamic IPS2 on DCN35 for incompatible FW vers=
ions

Peichen Huang (1):
      drm/amd/display: Restructure dpia link training

Relja Vojvodic (1):
      drm/amd/display: Add fullscreen only sharpening policy

Robin Chen (1):
      drm/amd/display: Round calculated vtotal

Roman Li (2):
      drm/amd/display: Add dmub hpd sense callback
      drm/amd/display: Update IPS default mode for DCN35/DCN351

Ryan Seto (1):
      drm/amd/display: Implement new DPCD register handling

Saleemkhan Jamadar (1):
      drm/amdgpu/vcn: enable AV1 on both instances

Samson Tam (2):
      drm/amd/display: Use SDR white level to calculate matrix coefficients
      drm/amd/display: Add debug options to change sharpen policies

Sreekant Somasekharan (1):
      drm/amdkfd: Add SDMA queue quantum support for GFX12

Srinivasan Shanmugam (1):
      drm/amd/display: Fix kdoc entry for 'tps' in
'dc_process_dmub_dpia_set_tps_notification'

Sung Joon Kim (1):
      drm/amd/display: Disable SYMCLK32_LE root clock gating

Tao Zhou (1):
      drm/amdgpu: disable GPU RAS bad page feature for specific ASIC

Tim Huang (1):
      drm/amdgpu: ensure the connector is not null before using it

Tobias Jakobi (1):
      drm/amd/display: handle nulled pipe context in DCE110's set_drr()

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/dp: Fix colorimetry detection

Yan Zhen (2):
      drm/amdgpu: fix typo in the comment
      drm/amd/display: fix typo in the comment

Yihan Zhu (1):
      drm/amd/display: Enable DML2 override_det_buffer_size_kbytes

ZhenGuo Yin (1):
      drm/amdgpu: skip coredump after job timeout in SRIOV

Zhikai Zhai (1):
      drm/amd/display: Skip to enable dsc if it has been off

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  | 104 ++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |  64 ++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  89 +----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         | 132 ++---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |  23 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  31 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |  30 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  23 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  56 +------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |  19 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  32 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  20 ++-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  14 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  17 +++
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |  23 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            | 165 -----------------=
----
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  24 +++
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |  15 --
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  30 +++-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  86 ++++++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |   1 +
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   9 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   6 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  41 ++++-
 drivers/gpu/drm/amd/display/dc/dc.h                |  14 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |  12 ++
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |  14 +-
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |   3 -
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |   3 -
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   9 --
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   6 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |   4 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |   8 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  15 +-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |   1 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  69 ++++++++-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  14 ++
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  13 ++
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.c  |  31 +++-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |   7 +
 .../display/dc/link/protocols/link_dp_capability.c |   5 +
 .../display/dc/link/protocols/link_dp_training.c   |  80 ++++++++--
 .../display/dc/link/protocols/link_dp_training.h   |  16 +-
 .../dc/link/protocols/link_dp_training_8b_10b.c    |  21 +--
 .../dc/link/protocols/link_dp_training_dpia.c      |  64 ++++----
 .../dc/link/protocols/link_dp_training_dpia.h      |  19 +++
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   1 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |   3 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |  54 +++++--
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.c |  85 ++++++++++-
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.h |   9 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |  15 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  25 +++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   1 +
 .../drm/amd/display/modules/freesync/freesync.c    |   2 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   2 +-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |  10 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   3 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  22 ++-
 drivers/gpu/drm/i915/display/intel_psr.c           |  32 ++--
 drivers/gpu/drm/i915/display/intel_psr.h           |   2 +
 drivers/gpu/drm/xe/xe_bb.c                         |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  14 ++
 drivers/gpu/drm/xe/xe_bo.h                         |   6 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |  50 +++++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |   6 +
 drivers/gpu/drm/xe/xe_guc.h                        |   6 +-
 drivers/gpu/drm/xe/xe_vram.c                       |   1 +
 111 files changed, 1134 insertions(+), 862 deletions(-)
