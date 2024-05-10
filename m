Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0627D8C2BA7
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEC210E1D6;
	Fri, 10 May 2024 21:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SbidmvTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DB710E1D6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:18:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so2598938e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715375904; x=1715980704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bW+gUUp7l8Go1CEjGjrXDMeS/n8FalO7s3mty8efupU=;
 b=SbidmvTcWM9K/FwKA4KoimuSSZa/234xD1EjCUTLggHA+lAodTvdbp3VK1wJAFPUDA
 mzclerv/X4QinF1EjpXD71EGFvGYVBRKm1aMqp42+AU0aVgKD4XlEy8nvCh6m9ETTO0W
 /srHUKW6ySR4L830f9+x3NNjD1RAsbE/AfcQ3D74FYKMrsrp/H1RCRiF25bf+zVHidit
 HYfx67NlrqwAlEnadP27oKbuvujSAPUzLvFxLBZcQMf0XEC8YBL1XsXbLZOnmUEEBlPR
 j3Usuvs4aTz2UfRViyLusYV6kgDYECwfI+F6E8H8cfgI9sbFzDp+uPak32VqANTj0iD1
 +DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715375904; x=1715980704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bW+gUUp7l8Go1CEjGjrXDMeS/n8FalO7s3mty8efupU=;
 b=F3FIJ1myoge96/GOyW8PU9tlCtXgJ/Ajt3WBUenkVSPE27p68kic4RYfx1xgCIiW7N
 KEcFE8m3hWA8gwBXclQVvk4AvWuJFG2a7/mGIbHo+VwekDgne3HqtfiqI3cbIt9Kgg8N
 JNYq3naUdq4t8+BQbS3y8RiqWfeDjEG1yU59M+CvbadtwEW607OfoqXzNAvQuRmaKj9P
 /bl3ejDJQ49ixCyah/O5gNW9Bc2kwCkVThix7zYDPA07oSaUrXTIM6iY1dgaQ+/zGREt
 WZ+zMIGsIY690eJr4o9IlXos+ATQqoIE5UpJJyImAH9bsIo2kvH8rfzSVzS2BkeUUWv5
 V4Xw==
X-Gm-Message-State: AOJu0Yz1uOgcuAgf4LkQnSGWswJK0ZvbNchLF94+IQtDWVTy317PINxg
 nM2kF/jwtBtD/7xLN8/VATdTy2plf9/e7KaS9j5zUVALDJBwRbMzHZrWfZqCSvhfnsJN9kDAPEF
 neJglzYQ2xDU7cW0mDnHvDhzpqNU=
X-Google-Smtp-Source: AGHT+IGPkILCn/IMVULz6wDQe+q9nP4ck7QElKaVUtKeX7kznQ9B34b4fGHKhJyPm9699w9mGDIT8u2ZCO+H1TNmzU4=
X-Received: by 2002:a05:6512:1287:b0:51d:2a27:9574 with SMTP id
 2adb3069b0e04-5220fb698bemr3152547e87.6.1715375903458; Fri, 10 May 2024
 14:18:23 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 11 May 2024 07:18:11 +1000
Message-ID: <CAPM=9tzZ8edq4gpxJpube9EOAVDFXr-n7Hwh9qwZ=_aBP34esA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.9 final
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

This should be the last set of fixes for 6.9, i915, xe and amdgpu are
the bulk here, one of the previous nouveau fixes turned up an issue,
so reverting it, otherwise one core and a couple of meson fixes.

drm-fixes-2024-05-11:
drm fixes for 6.9 final

core:
- fix connector debugging output

i915:
- Automate CCS Mode setting during engine resets
- Fix audio time stamp programming for DP
- Fix parsing backlight BDB data

xe:
- Fix use zero-length element array
- Move more from system wq to ordered private wq
- Do not ignore return for drmm_mutex_init

amdgpu:
- DCN 3.5 fix
- MST DSC fixes
- S0i3 fix
- S4 fix
- HDP MMIO mapping fix
- Fix a regression in visible vram handling

amdkfd:
- Spatial partition fix

meson:
- dw-hdmi: power-up fixes
- dw-hdmi: add badngap setting for g12

nouveau:
- revert SG_DEBUG fix that has a side effect
The following changes since commit dd5a440a31fae6e459c0d6271dddd62825505361=
:

  Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-05-11

for you to fetch changes up to a222a6470d7eea91193946e8162066fa88da64c2:

  Revert "drm/nouveau/firmware: Fix SG_DEBUG error with
nvkm_firmware_ctor()" (2024-05-11 07:04:10 +1000)

----------------------------------------------------------------
drm fixes for 6.9 final

core:
- fix connector debugging output

i915:
- Automate CCS Mode setting during engine resets
- Fix audio time stamp programming for DP
- Fix parsing backlight BDB data

xe:
- Fix use zero-length element array
- Move more from system wq to ordered private wq
- Do not ignore return for drmm_mutex_init

amdgpu:
- DCN 3.5 fix
- MST DSC fixes
- S0i3 fix
- S4 fix
- HDP MMIO mapping fix
- Fix a regression in visible vram handling

amdkfd:
- Spatial partition fix

meson:
- dw-hdmi: power-up fixes
- dw-hdmi: add badngap setting for g12

nouveau:
- revert SG_DEBUG fix that has a side effect

----------------------------------------------------------------
Agustin Gutierrez (2):
      drm/amd/display: Fix DSC-re-computing
      drm/amd/display: MST DSC check for older devices

Alex Deucher (1):
      drm/amdkfd: don't allow mapping the MMIO HDP page with large pages

Andi Shyti (1):
      drm/i915/gt: Automate CCS Mode setting during engine resets

Chaitanya Kumar Borah (1):
      drm/i915/audio: Fix audio time stamp programming for DP

Daniele Ceraolo Spurio (1):
      drm/xe/guc: Check error code when initializing the CT mutex

Dave Airlie (5):
      Merge tag 'drm-intel-fixes-2024-05-08' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-fixes
      Merge tag 'drm-xe-fixes-2024-05-09' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.9-2024-05-10' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2024-05-10' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Revert "drm/nouveau/firmware: Fix SG_DEBUG error with
nvkm_firmware_ctor()"

Douglas Anderson (1):
      drm/connector: Add \n to message about demoting connector force-probe=
s

Jerome Brunet (2):
      drm/meson: dw-hdmi: power up phy on device init
      drm/meson: dw-hdmi: add bandgap setting for g12

Karthikeyan Ramasubramanian (1):
      drm/i915/bios: Fix parsing backlight BDB data

Lijo Lazar (1):
      Revert "drm/amdkfd: Add partition id field to location_id"

Lucas De Marchi (1):
      drm/xe/ads: Use flexible-array

Mario Limonciello (1):
      dm/amd/pm: Fix problems with reboot/shutdown for some SMU
13.0.4/13.0.11 users

Matthew Brost (1):
      drm/xe: Use ordered WQ for G2H handler

Michel D=C3=A4nzer (1):
      drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible

Nicholas Kazlauskas (1):
      drm/amd/display: Fix idle optimization checks for multi-display
and dual eDP

Nicholas Susanto (1):
      drm/amd/display: Enable urgent latency adjustments for DCN35

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  16 ++-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  33 ++++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |   2 +-
 drivers/gpu/drm/drm_connector.c                    |   2 +-
 drivers/gpu/drm/i915/display/intel_audio.c         | 113 ++---------------=
----
 drivers/gpu/drm/i915/display/intel_bios.c          |  19 +---
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   5 -
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c        |   6 +-
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h        |   2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   4 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  70 ++++++-------
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c       |  19 ++--
 drivers/gpu/drm/xe/xe_guc_ads.c                    |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  10 +-
 drivers/gpu/drm/xe/xe_guc_ct.h                     |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |   2 +
 20 files changed, 122 insertions(+), 203 deletions(-)
