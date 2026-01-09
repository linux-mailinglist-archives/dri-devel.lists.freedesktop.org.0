Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61516D073DD
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 06:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A49E10E147;
	Fri,  9 Jan 2026 05:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FFNIsLpv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B684610E147
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 05:50:29 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-8c2c36c10dbso353849785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 21:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767937828; x=1768542628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fuVcNwMp26T0gsrs9jXPkCC7SAykspWnq141bfd81oY=;
 b=FFNIsLpv4X5gaf4+pZADLTNlq4cmMjPYRma/LgZjhCMbqn9BByKeNoj/gtM0xhjFuV
 UnvV+rQokF0FmTpoOodwtdB+JkojnkFbTR9IzTLsqfCDtu31T8Dwblffz56D2ne4aqRu
 CZAzUm4o+9f6P9LrhneKPfhCdaZN4KaIZYXl5JYCHmkXnTT1e3sirQR5yRAdBFEQCrwa
 zZqEeSj+qdi0ezvfGHunguyRodqWX7C2dnW1AcNqYS9JL7iR7jvTgotkgwVb+rpE9Kep
 msTdvncY0nO/NwNyRCgMFXrLeRw4Pojyq+7HQYWnvM0k0iuxVLJMhPxKZauq0Qw1IuJl
 X5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767937828; x=1768542628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fuVcNwMp26T0gsrs9jXPkCC7SAykspWnq141bfd81oY=;
 b=gVTt5C9gRzeHZTg33TJr0S4lcxHFE31Y5ryiTSaXo89YnVTQim+opKgZzoRczsFO3L
 LJszc9QKex+Cj1kek9sayC67jDo4JA25EB5TTyJiSq5dUa9EZBx8Rda79InwQJ1Rls5Y
 Fk3P5czTqp6RA++eVPukW1ytzkWeWJHsA/OQOcXXdliZGj+WG64DRkuoZC+Nq5PlmpoT
 PO7MNqhecr0upYxIsn7spkrPKGcwllCGx/TorfQJLc7bxmEo1Lj0IMv9JgdesWmbipjM
 K8bdoVDp7j9H7IpukIm0C8tEMXE67weg1Meth3shLmyxtHhsnYA+PKHjnkSovFpPxDMz
 FC3Q==
X-Gm-Message-State: AOJu0YyAqxZCW96SHyzMtJAspUMILwDPwSWZgYJ+D4SxenxSq4LhvgpX
 XHBgCKHaAFqQMO2Tmzjks739Yhozhh0xI2TWmvoeyjVKTANwS1eeYLpOBUnOk22kghw7D4kI1/L
 tpTixRR8VElOJWqeG5bkTSj2UZxZwvDM=
X-Gm-Gg: AY/fxX6RPJaRBAyrxNITfj+oKx2lqOgrq2BXkvVPJSiD9mZWm527D/Fk3kJ14WIZqcc
 q3XC9m22Vh9l86sHhNd0xyzRhk0A2iHHEJDBoKH8pDNaxbIlJZTiWzjm+xgsGu7TOQ6X/SamqnN
 wSc1MEvBCrVV/2SO6Iah+z7WhFjjOF7OkBTeLZsC4mZ1wsL+NwDv3vSe/Z1fDZJ7dpSfUqgY+Dx
 UWL9AiFd5ufTuqCN/J1xNruJ6erkoPFI/xr8ENwW+c332OOClcfBpskALNOSVJ9wnx40Q==
X-Google-Smtp-Source: AGHT+IFaE1Jvm0HUyOYIyjn3eIRaeeTOMledTS/hL8RWdCGod6TuOfVXT2NHTX+Xt6gu3zEPE80PJqPIEjKmCbSYLVU=
X-Received: by 2002:a05:620a:2550:b0:8b1:5f62:a5d5 with SMTP id
 af79cd13be357-8c3893f8740mr1206932785a.62.1767937828390; Thu, 08 Jan 2026
 21:50:28 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 9 Jan 2026 15:50:17 +1000
X-Gm-Features: AQt7F2p5TmC3YTwgcnoz64_283TFDOkUFSFdgDUGbE3aKVBrk9dpqmkyHDTqFVA
Message-ID: <CAPM=9txCYhhEQYMtR-Wborgso86tnPpBv-M=6+v8QVO3Sx197g@mail.gmail.com>
Subject: [git pull] drm fixes for 6.19-rc5
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

Hi Linus,

I missed the drm-rust fixes tree for last week, so this catches up on
that, along with amdgpu, and then some misc fixes across a few
drivers. I hadn't got an xe pull by the time I sent this, I suspect
one will arrive 10 mins after, but I don't think there is anything
that can't wait for next week.

Things seem to have picked up a little with people coming back from holiday=
s,

Dave.

drm-fixes-2026-01-09:
drm fixes for 6.19-rc5

MAINTAINERS:
- Fix Nova GPU driver git links.
- Fix typo in TYR driver entry preventing correct behavior of
  scripts/get_maintainer.pl.
- Exclude TYR driver from DRM MISC.

nova-core:
- Correctly select RUST_FW_LOADER_ABSTRACTIONS to prevent build
  errors.
- Regenerate nova-core bindgen bindings with '--explicit-padding' to
  avoid uninitialized bytes.
- Fix length of received GSP messages, due to miscalculated message
  payload size.
- Regenerate bindings to derive MaybeZeroable.
- Use a bindings alias to derive the firmware version.

exynos:
- hdmi: replace system_wq with system_percpu_wq

pl111:
- Fix error handling in probe

mediatek/atomic/tidss:
- Fix tidss in another way and revert reordering of pre-enable and
post-disable operations,
  as it breaks other bridge drivers.

nouveau:
- Fix regression from fwsec s/r fix.

pci/vga:
- Fix multiple gpu's being reported a 'boot_display'

fb-helper:
- Fix vblank timeout during suspend/reset

amdgpu:
- Clang fixes
- Navi1x PCIe DPM fixes
- Ring reset fixes
- ISP suspend fix
- Analog DC fixes
- VPE fixes
- Mode1 reset fix

radeon:
- Variable sized array fix
The following changes since commit 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb=
:

  Linux 6.19-rc4 (2026-01-04 14:41:55 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-01-09

for you to fetch changes up to f6eac56d6bf2026437b606a69aff903941282f9a:

  Merge tag 'amd-drm-fixes-6.19-2026-01-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2026-01-08
10:34:27 +1000)

----------------------------------------------------------------
drm fixes for 6.19-rc5

MAINTAINERS:
- Fix Nova GPU driver git links.
- Fix typo in TYR driver entry preventing correct behavior of
  scripts/get_maintainer.pl.
- Exclude TYR driver from DRM MISC.

nova-core:
- Correctly select RUST_FW_LOADER_ABSTRACTIONS to prevent build
  errors.
- Regenerate nova-core bindgen bindings with '--explicit-padding' to
  avoid uninitialized bytes.
- Fix length of received GSP messages, due to miscalculated message
  payload size.
- Regenerate bindings to derive MaybeZeroable.
- Use a bindings alias to derive the firmware version.

exynos:
- hdmi: replace system_wq with system_percpu_wq

pl111:
- Fix error handling in probe

mediatek/atomic/tidss:
- Fix tidss in another way and revert reordering of pre-enable and
post-disable operations,
  as it breaks other bridge drivers.

nouveau:
- Fix regression from fwsec s/r fix.

pci/vga:
- Fix multiple gpu's being reported a 'boot_display'

fb-helper:
- Fix vblank timeout during suspend/reset

amdgpu:
- Clang fixes
- Navi1x PCIe DPM fixes
- Ring reset fixes
- ISP suspend fix
- Analog DC fixes
- VPE fixes
- Mode1 reset fix

radeon:
- Variable sized array fix

----------------------------------------------------------------
Alan Liu (1):
      drm/amdgpu: Fix query for VPE block_type and ip_count

Alex Deucher (3):
      drm/radeon: Remove __counted_by from ClockInfoArray.clockInfo[]
      drm/amdgpu: don't reemit ring contents more than once
      drm/amdgpu: always backup and reemit fences

Alex Hung (1):
      drm/amd/display: Check NULL before calling dac_load_detection

Alexandre Courbot (5):
      gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
      gpu: nova-core: bindings: add missing explicit padding
      gpu: nova-core: gsp: fix length of received messages
      gpu: nova-core: bindings: derive `MaybeZeroable`
      gpu: nova-core: gsp: replace firmware version with "bindings" alias

Chengjun Yao (1):
      drm/fb-helper: Fix vblank timeout during suspend/reset

Danilo Krummrich (2):
      MAINTAINERS: fix typo in TYR DRM driver entry
      MAINTAINERS: exclude the tyr driver from DRM MISC

Dave Airlie (5):
      nouveau: don't attempt fwsec on sb on newer platforms.
      Merge tag 'drm-rust-fixes-2025-12-29' of
https://gitlab.freedesktop.org/drm/rust/kernel into drm-fixes
      Merge tag 'exynos-drm-fixes-v6.19-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'drm-misc-fixes-2026-01-07' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-6.19-2026-01-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Linus Walleij (1):
      drm/atomic-helper: Export and namespace some functions

Marco Crivellari (1):
      drm/exynos: hdmi: replace use of system_wq with system_percpu_wq

Mario Limonciello (AMD) (2):
      PCI/VGA: Don't assume the only VGA device on a system is `boot_vga`
      Reapply "Revert "drm/amd: Skip power ungate during suspend for VPE""

Miaoqian Lin (1):
      drm/pl111: Fix error handling in pl111_amba_probe

Nathan Chancellor (3):
      drm/amd/display: Apply e4479aecf658 to dml
      drm/amd/display: Reduce number of arguments of dcn30's
CalculatePrefetchSchedule()
      drm/amd/display: Reduce number of arguments of dcn30's
CalculateWatermarksAndDRAMSpeedChangeSupport()

Perry Yuan (1):
      drm/amd/pm: Disable MMIO access during SMU Mode 1 reset

Philipp Stanner (1):
      MAINTAINERS: Update Nova GPU driver git link

Pratap Nirujogi (1):
      drm/amd/amdgpu: Fix SMU warning during isp suspend-resume

Timur Krist=C3=B3f (2):
      drm/amd/display: Correct color depth for SelectCRTC_Source
      drm/amd/display: Add missing encoder setup to DACnEncoderControl

Tomi Valkeinen (3):
      Revert "drm/atomic-helper: Re-order bridge chain pre-enable and
post-disable"
      Revert "drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable o=
rder"
      drm/tidss: Fix enable/disable order

Yang Wang (2):
      drm/amd/pm: fix wrong pcie parameter on navi1x
      drm/amd/pm: force send pcie parmater on navi1x

 MAINTAINERS                                        |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |  24 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   7 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |  41 ++
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |   4 +-
 .../gpu/drm/amd/display/dc/bios/command_table.c    |  44 +-
 .../gpu/drm/amd/display/dc/bios/command_table.h    |   4 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   6 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c | 545 ++++++-----------=
----
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  28 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   6 +-
 .../drm/amd/display/include/bios_parser_types.h    |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  33 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   7 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   9 +-
 drivers/gpu/drm/drm_atomic_helper.c                | 122 ++++-
 drivers/gpu/drm/drm_fb_helper.c                    |  10 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   6 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c    |   3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c    |   8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c    |   3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c    |   3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |  23 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    |  15 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c    |   3 +
 drivers/gpu/drm/pl111/pl111_drv.c                  |   2 +-
 drivers/gpu/drm/radeon/pptable.h                   |   2 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |  30 +-
 drivers/gpu/nova-core/Kconfig                      |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |  14 +-
 drivers/gpu/nova-core/gsp/fw.rs                    |  78 ++-
 drivers/gpu/nova-core/gsp/fw/r570_144.rs           |  11 +-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs  | 105 ++--
 drivers/pci/vgaarb.c                               |   7 -
 include/drm/drm_atomic_helper.h                    |  22 +
 include/drm/drm_bridge.h                           | 249 +++-------
 41 files changed, 724 insertions(+), 813 deletions(-)
