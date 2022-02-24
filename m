Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 665524C3972
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 00:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC48910E924;
	Thu, 24 Feb 2022 23:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD9410E926
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 23:01:43 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id q17so4994810edd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 15:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=X3EtjfKbehA9fHwRWa8Y/OMrArkCeB4aGDlGlg7yqZE=;
 b=EGGqn11IUoyPVh7ZX1J8KqIGXWqgP7ARc8OdnJp+yNG7aExkjOIfpv60wE5TdCK6J4
 2w4kzsZ3/Us3jfzoPonBoqnWqXO241j7d5Tz4Ys2fa59Ri9j1SyLf6upmuIoXmlAcZhI
 ZQdEfS3Yk9sJWED8XDL5i3J8JZjo6nS9A6mWLLPc/bvaF7JIk7fxjV2eY++vKrc8KtWH
 pMhnRVnObTFaC2kCu6T2Zwul7y54cTcbbQRyhd9XMmzKtVApM3mhnZtiKv+yvjo1a6OL
 lPUbVfB95VXyXmBEEK6enG4rh+/OTZ3E8oGWIrX06c5SSo/KpHZCUASLyxQodnprymMZ
 6EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=X3EtjfKbehA9fHwRWa8Y/OMrArkCeB4aGDlGlg7yqZE=;
 b=w25n6/Rs0D6LUGvf1cslnb1t7NJL4xxq2aimk+oivfPbvL3E4kIF+IveXnl1X2Khtd
 nzUcZyzYW7DLcp5wDL3WbIp4eLjbiUUQozgtLJe01tRyey5ceFAkL00PzPvqZfFRMsmp
 hfxdQLc0Nlb+gt44KC+Y1R7KHK4zIeKmjG+TU7wEDzbn0CU42fzBO+UVaPKOWPwRogZg
 jDpU4mGpJfRN0UfHaWHo9UhfBBThbJ6eKBgpx0mo/3RBzGOVdCqF0SDuZ+UKA8tP5rJt
 slgAKjqjIgrXgKi2eZ014bVqUCY8YdqdlPG7CA9nPKhw0CFlSJF9ewd65cyuocAuiQiJ
 oUuw==
X-Gm-Message-State: AOAM530Pz/7Fy/6W8AWoiOWFCxzO7TlnP0jtFj8/qoa5kVdzlU66YlOJ
 ajW3XmQTTd8d8OSp5qF90xoOjImBdv3o6eIPv67RfIJJ6jE=
X-Google-Smtp-Source: ABdhPJycirbyAqbZ13XeIBPPBICl1WRVjb08/FUcXd+gGs+PAjuKX/EybFir/ArHyRHz7Se4xE8DUFqGSMvDZgPQNI8=
X-Received: by 2002:aa7:d2c8:0:b0:410:e248:48eb with SMTP id
 k8-20020aa7d2c8000000b00410e24848ebmr4471404edr.325.1645743702061; Thu, 24
 Feb 2022 15:01:42 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 25 Feb 2022 09:01:30 +1000
Message-ID: <CAPM=9twsapa3kN3wkRfpqT7dZPDbFePicHm8TT8yVnwqH6aZyA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.17-rc6
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

Hey,

Regular drm fixes pull, i915, amdgpu and tegra mostly, all pretty small.

I'm in quarantine at home for next 7 days, shouldn't interrupt things,
but might be erratic if anyone is looking for me.

Dave.

drm-fixes-2022-02-25:
drm fixes for 5.17-rc6

core:
- edid: Always set RGB444

tegra:
- tegra186 suspend/resume fixes
- syncpoint wait fix
- build warning fix
- eDP on older devices fix

amdgpu:
- Display FP fix
- PCO powergating fix
- RDNA2 OEM SKU stability fixes
- Display PSR fix
- PCI ASPM fix
- Display link encoder fix for TEST_COMMIT
- Raven2 suspend/resume fix
- Fix a regression in virtual display support
- GPUVM eviction fix

i915:
- Fix QGV handling on ADL-P+
- Fix bw atomic check when switching between SAGV vs. no SAGV
- Disconnect PHYs left connected by BIOS on disabled ports
- Fix SAVG to no SAGV transitions on TGL+
- Print PHY name properly on calibration error (DG2)

imx:
- dcss: Select GEM CMA helpers

radeon:
- Fix some variables's type

vc4:
- Fix codec cleanup
- Fix PM reference counting
The following changes since commit cfb92440ee71adcc2105b0890bb01ac3cddb8507=
:

  Linux 5.17-rc5 (2022-02-20 13:07:20 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-02-25

for you to fetch changes up to ecf8a99f4807c17fa310a83067a95964cedd9ac1:

  Merge tag 'drm-intel-fixes-2022-02-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-02-25
05:51:04 +1000)

----------------------------------------------------------------
drm fixes for 5.17-rc6

core:
- edid: Always set RGB444

tegra:
- tegra186 suspend/resume fixes
- syncpoint wait fix
- build warning fix
- eDP on older devices fix

amdgpu:
- Display FP fix
- PCO powergating fix
- RDNA2 OEM SKU stability fixes
- Display PSR fix
- PCI ASPM fix
- Display link encoder fix for TEST_COMMIT
- Raven2 suspend/resume fix
- Fix a regression in virtual display support
- GPUVM eviction fix

i915:
- Fix QGV handling on ADL-P+
- Fix bw atomic check when switching between SAGV vs. no SAGV
- Disconnect PHYs left connected by BIOS on disabled ports
- Fix SAVG to no SAGV transitions on TGL+
- Print PHY name properly on calibration error (DG2)

imx:
- dcss: Select GEM CMA helpers

radeon:
- Fix some variables's type

vc4:
- Fix codec cleanup
- Fix PM reference counting

----------------------------------------------------------------
Bas Nieuwenhuizen (1):
      drm/amd/display: Protect update_bw_bounding_box FPU code.

Chen Gong (1):
      drm/amdgpu: do not enable asic reset for raven2

Christian K=C3=B6nig (1):
      drm/radeon: fix variable type

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2022-02-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm/tegra/for-5.17-rc6' of
https://gitlab.freedesktop.org/drm/tegra into drm-fixes
      Merge tag 'amd-drm-fixes-5.17-2022-02-23' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2022-02-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Dmitry Osipenko (1):
      gpu: host1x: Fix hang on Tegra186+

Evan Quan (2):
      drm/amdgpu: disable MMHUB PG for Picasso
      drm/amd/pm: fix some OEM SKU specific stability issues

Guchun Chen (2):
      Revert "drm/amdgpu: add modifiers in amdgpu_vkms_plane_init()"
      drm/amdgpu: bypass tiling flag check in virtual display case (v2)

Imre Deak (1):
      drm/i915: Disconnect PHYs left connected by BIOS on disabled ports

Jon Hunter (1):
      drm/tegra: Fix cast to restricted __le32

Mario Limonciello (1):
      drm/amd: Check if ASPM is enabled from PCIe subsystem

Matt Roper (1):
      drm/i915/dg2: Print PHY name properly on calibration error

Maxime Ripard (3):
      drm/vc4: hdmi: Unregister codec device on unbind
      drm/vc4: crtc: Fix runtime_pm reference counting
      drm/edid: Always set RGB444

Michel D=C3=A4nzer (1):
      drm/amd/display: For vblank_disable_immediate, check PSR is really us=
ed

Mikko Perttunen (1):
      gpu: host1x: Always return syncpoint value when waiting

Nicholas Kazlauskas (1):
      drm/amd/display: Fix stream->link_enc unassigned during stream remova=
l

Qiang Yu (1):
      drm/amdgpu: check vm ready by amdgpu_vm->evicting flag

Rudi Heitbaum (1):
      drm/imx/dcss: i.MX8MQ DCSS select DRM_GEM_CMA_HELPER

Thierry Reding (1):
      drm/tegra: dpaux: Populate AUX bus

Ville Syrj=C3=A4l=C3=A4 (3):
      drm/i915: Widen the QGV point mask
      drm/i915: Correctly populate use_sagv_wm for all pipes
      drm/i915: Fix bw atomic check when switching between SAGV vs. no SAGV

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  9 ++++--
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  9 ++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 17 ++++++-----
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |  2 ++
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  7 +++--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  4 ---
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 32 ++++++++++++++++++=
+-
 drivers/gpu/drm/drm_edid.c                         |  2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            | 18 +++++++++--
 drivers/gpu/drm/i915/display/intel_bw.h            |  8 ++---
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_tc.c            | 26 ++++++++++++----
 drivers/gpu/drm/i915/intel_pm.c                    | 22 +++++++-------
 drivers/gpu/drm/imx/dcss/Kconfig                   |  1 +
 drivers/gpu/drm/radeon/radeon_uvd.c                |  8 ++---
 drivers/gpu/drm/tegra/Kconfig                      |  1 +
 drivers/gpu/drm/tegra/dpaux.c                      |  7 +++++
 drivers/gpu/drm/tegra/falcon.c                     |  2 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  8 +++--
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  8 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  1 +
 drivers/gpu/host1x/syncpt.c                        | 35 +++++++-----------=
----
 25 files changed, 156 insertions(+), 81 deletions(-)
