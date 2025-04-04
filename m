Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A1A7C52B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 22:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D841A10E055;
	Fri,  4 Apr 2025 20:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EwPIR7aN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CB810E055
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 20:46:49 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5e6ff035e9aso4760346a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 13:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743799608; x=1744404408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6hRsnXtdDToRwE5VkYur5EcjHw55DqS5b6vMN9pCfr4=;
 b=EwPIR7aNcwQwiQTPkqgRVU+mTh6PkZbxH9wqBKlNZ4hB+79Ud8SrQdzTR1A5jkb8LB
 AljAi9vQnbUt1ePU41L97PWL79w+XSO0Wl9KzH3XHu6x4wHltxmQ5NGFGS6+VGWq250u
 6FVp2NCQ8c2/Is3JkvK4+6vvesCSgDtoQfPn1jKIpNBN9JKb7RPRI65NB+W2THORpX4H
 JcC8cw3oHe4MztXhKRW2IdMTmF5awiGz1kZAd3h55VuN5zwcur4bH0TgVsbTwyd62cia
 WrqLmktJvmijTcTS7obUsPSZgRXnWyBX9TEODeMpEjMdqUEvros1+WcTgk0ysn0B+1Ls
 UjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743799608; x=1744404408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6hRsnXtdDToRwE5VkYur5EcjHw55DqS5b6vMN9pCfr4=;
 b=AlPULU1bL/cOYFeJgGcbjAXkqGTY2cliisiksCD5yKVZW1DYDdanVPaASUMFTixDKj
 6Ym0+NMNEd/ZSv6lN9wJqyZGQ3KBYiXFFJkNC+3n3Df4RLhkncxbhX9FDMxzPTJefnFq
 ZcSpUWQkOkKELAcAkBCpfJXI8tZmp7VA3KGwgpnQXA6XkODDyqeo7G4wYYJM7h+JoJ7l
 1rLt607JUgUcsley+FWNfiaUMgFGw95M+D6NxRvgbS3BsNvdycZYi8MRZE++wm0x2Oaq
 KhZomBQNl365tKW7e1MAypibgS8HNSqf0iJvSIn2yqu+FG9YZRGXHmiL9jXLfMycGJFZ
 X5Ww==
X-Gm-Message-State: AOJu0Yz0QNYydULZXbGRACwvffDkOov2zFxqVmWOHw+QW1hNeoavTb0n
 9HSlCWisIYilHW7zy8GgWaZQD0m6FiYFgOVWV3FRjOCFVOYBVg8fSZwVGFpglLO6vjKdPmnIQ96
 QaL4mfLJnHA2e8ws4q+jTeLR1+lEh5RFR
X-Gm-Gg: ASbGnctSzKwL593Z3axoBBCEO+dgXAbhzXWHciS6QcRovC3W1HcWA/SP/Js322QDtnQ
 qN2/kQ5Ktp0hvHPfDQeLBhjGb5aYnr8aaftnbLg+Rd+CudCK+7jH9DtURHgJV1eFWLVby9MXgc+
 aG4wmINt1jwANB+gnFgMoTPxyC
X-Google-Smtp-Source: AGHT+IFpL3ZnB9lDuEP5Av7ZBTbINZTCZ+03xATDynYVrD77yLKvElf+pz1L127nTfVIsgeaoJcjyI5OKPc8QPFbEVo=
X-Received: by 2002:a17:907:2cc6:b0:ac6:b815:83ee with SMTP id
 a640c23a62f3a-ac7d1c35d38mr431590866b.43.1743799607507; Fri, 04 Apr 2025
 13:46:47 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 5 Apr 2025 06:46:35 +1000
X-Gm-Features: ATxdqUFQISWzBjVBOYCGg4eHEbpmZwyJMVRccY99sBggwBrSZbuwMv98o6CKmk0
Message-ID: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.15-rc1
To: LKML <linux-kernel@vger.kernel.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
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

Weekly fixes, mostly from the end of last week, this week was very
quiet, maybe you scared everyone away. I probably should have
highlighted Jani's work more closely, but it never occured that anyone
would willingingly build a kernel without O=3D../toilet-builddir. This
doesn't contain any fixes for that stuff, Jani is working on it, and
hopefully you can help that make forward progress.

As for this, it's mostly amdgpu, and xe, with some i915, adp and
bridge bits, since I think this is overly quiet I'd expect rc2 to be a
bit more lively.

Regards,
Dave.

drm-next-2025-04-05:
drm fixes for 6.15-rc1

bridge:
- tda998x: Select CONFIG_DRM_KMS_HELPER

amdgpu:
- Guard against potential division by 0 in fan code
- Zero RPM support for SMU 14.0.2
- Properly handle SI and CIK support being disabled
- PSR fixes
- DML2 fixes
- DP Link training fix
- Vblank fixes
- RAS fixes
- Partitioning fix
- SDMA fix
- SMU 13.0.x fixes
- Rom fetching fix
- MES fixes
- Queue reset fix

xe:
- Fix NULL pointer dereference on error path
- Add missing HW workaround for BMG
- Fix survivability mode not triggering
- Fix build warning when DRM_FBDEV_EMULATION is not set

i915:
- Bounds check for scalers in DSC prefill latency computation
- Fix build by adding a missing include

adp:
- Fix error handling in plane setup
The following changes since commit cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c=
:

  Merge tag 'drm-intel-gt-next-2025-03-12' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
(2025-03-25 08:21:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-04-05

for you to fetch changes up to e2cb28ea3e01cb25095d1a341459901363dc39e9:

  Merge tag 'drm-misc-next-fixes-2025-04-04' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
(2025-04-05 06:28:03 +1000)

----------------------------------------------------------------
drm fixes for 6.15-rc1

bridge:
- tda998x: Select CONFIG_DRM_KMS_HELPER

amdgpu:
- Guard against potential division by 0 in fan code
- Zero RPM support for SMU 14.0.2
- Properly handle SI and CIK support being disabled
- PSR fixes
- DML2 fixes
- DP Link training fix
- Vblank fixes
- RAS fixes
- Partitioning fix
- SDMA fix
- SMU 13.0.x fixes
- Rom fetching fix
- MES fixes
- Queue reset fix

xe:
- Fix NULL pointer dereference on error path
- Add missing HW workaround for BMG
- Fix survivability mode not triggering
- Fix build warning when DRM_FBDEV_EMULATION is not set

i915:
- Bounds check for scalers in DSC prefill latency computation
- Fix build by adding a missing include

adp:
- Fix error handling in plane setup

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/gfx11: fix num_mec
      drm/amdgpu/gfx12: fix num_mec

Ankit Nautiyal (1):
      drm/i915/watermark: Check bounds for scaler_users for dsc prefill lat=
ency

Arnd Bergmann (1):
      drm/i2c: tda998x: select CONFIG_DRM_KMS_HELPER

Asad Kamal (3):
      drm/amd/pm: Remove host limit metrics support
      drm/amd/pm: Update smu metrics table for smu_v13_0_6
      drm/amd/pm: Add gpu_metrics_v1_8

Brendan Tam (1):
      drm/amd/display: prevent hang on link training fail

Candice Li (1):
      Remove unnecessary firmware version check for gc v9_4_2

Charlene Liu (1):
      Revert "drm/amd/display: dml2 soc dscclk use DPM table clk setting"

Christian K=C3=B6nig (1):
      drm/amdgpu: stop unmapping MQD for kernel queues v3

Dan Carpenter (1):
      drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new()

Dave Airlie (5):
      Merge tag 'drm-misc-next-fixes-2025-03-27' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-next-fixes-2025-03-25' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2025-03-27' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-next-6.15-2025-03-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2025-04-04' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next

Denis Arefev (5):
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero
      drm/amd/pm: Prevent division by zero

Harish Chegondi (1):
      drm/xe/eustall: Fix a possible pointer dereference after free

Jesse.zhang@amd.com (1):
      Revert "drm/amdgpu/sdma_v4_4_2: update VM flush implementation for SD=
MA"

Leo Li (2):
      drm/amd/display: Increase vblank offdelay for PSR panels
      drm/amd/display: Actually do immediate vblank disable

Lijo Lazar (2):
      drm/amdgpu: Add NPS2 to DPX compatible mode
      drm/amdgpu: Prefer shadow rom when available

Lucas De Marchi (2):
      drm/xe: Move survivability back to xe
      drm/xe: Set survivability mode before heci init

Mario Limonciello (1):
      drm/amd: Handle being compiled without SI or CIK support better

Michal Wajdeczko (1):
      drm/xe/vf: Don't check CTC_MODE[0] if VF

Stanley.Yang (1):
      drm/amdgpu: Update ta ras block

Tomasz Paku=C5=82a (1):
      drm/amd/pm: Add zero RPM enabled OD setting support for SMU14.0.2

Vinay Belgaumkar (1):
      drm/xe: Apply Wa_16023105232

Xiang Liu (2):
      drm/amdgpu: Use correct gfx deferred error count
      drm/amdgpu: Parse all deferred errors with UMC aca handle

Yue Haibing (2):
      drm/i915/display: Fix build error without DRM_FBDEV_EMULATION
      drm/xe: Fix unmet direct dependencies warning

 drivers/gpu/drm/adp/adp_drv.c                      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |   8 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |  34 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  44 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  58 ++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  88 ++--------------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  90 ++--------------
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             | 104 +++--------------=
--
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  45 +-------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  58 ++---------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  66 +++---------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  79 +++-----------
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |   3 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/vega10_sdma_pkt_open.h  |  70 -------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  41 ++++++--
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   7 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     | 114 +++++++++++++++++=
++++
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c  |   4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |   4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_thermal.c    |   2 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   3 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  15 ---
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  55 +++++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 drivers/gpu/drm/bridge/Kconfig                     |  13 +--
 drivers/gpu/drm/i915/display/intel_fbdev.h         |   2 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |   5 +-
 drivers/gpu/drm/xe/Kconfig                         |   2 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |   4 +
 drivers/gpu/drm/xe/xe_device.c                     |  17 ++-
 drivers/gpu/drm/xe/xe_eu_stall.c                   |   8 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |  54 +++++++---
 drivers/gpu/drm/xe/xe_gt_types.h                   |   2 +
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  33 ++++++
 drivers/gpu/drm/xe/xe_pci.c                        |  16 ++-
 drivers/gpu/drm/xe/xe_survivability_mode.c         |  31 ++++--
 drivers/gpu/drm/xe/xe_survivability_mode.h         |   1 -
 drivers/gpu/drm/xe/xe_wa.c                         |   6 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   2 +
 52 files changed, 537 insertions(+), 701 deletions(-)
