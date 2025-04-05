Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A59AA7CBED
	for <lists+dri-devel@lfdr.de>; Sat,  5 Apr 2025 23:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37D710E03D;
	Sat,  5 Apr 2025 21:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MFkHUTd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C804510E03D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Apr 2025 21:51:17 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5e6194e9d2cso5996353a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Apr 2025 14:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743889876; x=1744494676; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ud/ewkyrMmecxCAoYghhiOwHotHzqr4g+GeslqjCe6c=;
 b=MFkHUTd8R1w5x6hAXZPx7nAubj8Nkmb7te96JQvPbE9FLX7gCN3qvcaGXtC4HHzs13
 Gu8E8M1H/kWtGwCIIsEmwuYd4S+DBx7UJ+TQIvm9I59zpqi7iIGehbbpxOy2H8ns+u/0
 fh9E7hRx9BcIo87WLDip2eOMhqkZiuzFJBiLpCWimPKibjc1wK8kl+QABnr4PnsjCJ6h
 eRmX0PQo/1HAcrsHCLK9J17dC8cVO2oL/XeygMxpRC68kPT4FRXw/wkRT9LouNFB0Q7U
 baj3WrjeRB7MlpiXOIvfyFo0LUv5O/uzdd8q/ezI1fmZXHjM/jNlLLTmnH5/K1+Hn2KY
 oDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743889876; x=1744494676;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ud/ewkyrMmecxCAoYghhiOwHotHzqr4g+GeslqjCe6c=;
 b=MdhejCV0L8+80/06UXvAgjPOLJQ+w6V8Usza474/qU38Z8c/PxcVlcK8ydE4wfx8Fu
 D5kWYPKoqa0Vp5qTz6lopZXw9pQzVWeIyDWVQF3d8fYyxroebhSVJPQ1fVdUqEgrnZY+
 A+emWP47oW7aqVY7rkxKY3uALPEIxAI8U7l5GNscY43i67QIQ2083NL/g/nnRE8mCKOE
 nxC7DTldGwTa+53pJBT0hLJL6FpyRC9lbV2Ow4fDlqHCxRxoG9EQwlnZ2LmuuSYvnbKV
 R2bLP6dVr4uqNRaK9cQQG/xE2rLCVU9KqY6sMxRnNqF+rDFyZT+sFUzIdXQDLk7jght1
 IRbg==
X-Gm-Message-State: AOJu0Yz6ATtT6j/8cTNcBy1r0XMQYCZb6kjMT3Vz7jQneKVOYut8GxHP
 VJsMDwOECNNENrjrqBcZUmrP8kHUWEgsGJS3229kdpFKUZeeRD8p0c7ZqgbzrDRhvgJ0IKQf082
 28nDRbYoaMpVTdemn4KlFxb5EpWo=
X-Gm-Gg: ASbGncsrhiU7LJG38k1b4V4/tjUcvXEKtNy4p4+/R3Pp9QOiHU1lRM+WtRXP+2QGWvZ
 /IYRny28gDiTqTxf4eGFw7gfPo2Ws8o8WNrnqhF3Sv0HsgrFoYFZMxJXnWZgEpuQrlTrOkfRo8S
 YrHnoR38Vr1Ectxp6e67mg4kQJ
X-Google-Smtp-Source: AGHT+IFAxhkDCFaJYi76qMBfOVKfjwDqSmg52QSiii9D3+n5VtMsTZujiMhS77XfBrD2y9NbKG6S5rcj6BGl5aWIm2Y=
X-Received: by 2002:a17:907:9728:b0:ac6:b853:d07f with SMTP id
 a640c23a62f3a-ac7d185e3c9mr623776766b.2.1743889875776; Sat, 05 Apr 2025
 14:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
In-Reply-To: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 6 Apr 2025 07:51:03 +1000
X-Gm-Features: ATxdqUF9yBPE7wBNvjm6ewMZPMXF5vH9OnQtUrcGioOiPWZxiCWpEwcZdeL2T_Y
Message-ID: <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
Subject: Fwd: [git pull] drm fixes for 6.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
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

(resend including Linus this time, autocomplete picked the mailing list)

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
