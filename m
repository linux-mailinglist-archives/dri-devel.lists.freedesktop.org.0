Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E2909409
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 00:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DDC10E2B1;
	Fri, 14 Jun 2024 22:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e2JkE15L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8704610E2B1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 22:05:58 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57c923e03caso2968748a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 15:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718402756; x=1719007556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9NKpnQ84zxi9g2DKsrp6paIKuEaCxz0JVSsufLK/lNo=;
 b=e2JkE15LOvLbKBZJQE+dhkE+zjlFGbBHTQ8zhEgbLM0u/WtKrSAcUX8jPWmhxHmb2G
 PB6Kb35CtCnAEzODp99Hk+r6vDjl2TlcbZHL1tX3p0qNM8ZYdVp5Vb6Ssquz6zIE3QKc
 VkkPTIpEu7PpH5D1C/RDRePHSWSUrOwTXGywJHT/7zMNBMD1zRXCxKLpM7gaDuMN9JeK
 bcxi7OtDdKuULZS5FySPwmUzD4VW9T1frPm0okgn42pi7/V096nDFoRNmy1UJplyHZgy
 ylB6p+aTiBJ4ttBCXPaWeRjZ2rsruHsU8ZVoL/gg1YFZEOSLmphxpCz9/4oAyRTljxDa
 yVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718402756; x=1719007556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9NKpnQ84zxi9g2DKsrp6paIKuEaCxz0JVSsufLK/lNo=;
 b=puEAMdTTWfWIf7/ap31oVO0S0h2N1KNv7Rg7QyG5Qopf2sx1i2HhzxMvXpNV/9wbX8
 LR8skL3OI8fl+H5bHVnoEU3v8ZLU3601dXOYa91I6v1NBPc2ABtNDg+NjIoPjY7243C9
 1WmdXLNt+ndwVyEhcE/83YEcBCpxVLZs4qu+eu6Gvnn4fqR3P3hGjfC0t7oqS97d5rhk
 ZuM5FKVXa6NEmLy0f8A1190rMA/A9H1rhWAHH1s8Ps756dlcxxmGE8jTBCsihIH9Y/92
 ViGPmBMauBB3vaZngfxjQaRlGfbFNkX1DIBuF3zNXu1RWx5tx0sYKJqVMFHfwQePQqRo
 LDYA==
X-Gm-Message-State: AOJu0YzS+VuwHdEJjJkEwsiFGBKaRRqivJTqpI5lUGc0JtiYARPmxJyC
 dTECL6NaJitGPjb8hRb0Qr3TGlauZv97XAaLGW4IEWyfu3K9Jmbakk8Mq8hZpRFYOW8VW1tMtnX
 DhFeELBZN2HHLPr+3ZoRkW+qIXwPnl+5y
X-Google-Smtp-Source: AGHT+IE+b6gM0omkmI2wHLa+MByqftBT92VyZN7nayii8T/REdVaTUWrLOvSqVsXzjNF0/QTWDMl4C/8m+idjGvgN50=
X-Received: by 2002:a17:906:c29a:b0:a6f:5698:ab61 with SMTP id
 a640c23a62f3a-a6f60cef734mr249722066b.11.1718402756064; Fri, 14 Jun 2024
 15:05:56 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 15 Jun 2024 08:05:44 +1000
Message-ID: <CAPM=9tw_3xzMPo46mPYfkPpnxy8jgeBy1Q5Ep1pH8Ws2BdA87g@mail.gmail.com>
Subject: [git pull] drm fixes for 6.10-rc4
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

Hey Linus,

Weekly fixes pull, seems a little quieter than usual, but still a
bunch of stuff across the board. Mostly xe, some exynos and nouveau
fixes. There is the fixup for the WERROR that you pointed out
previously, hopefully it does what you expect now.

Dave.

drm-fixes-2024-06-15:
drm fixes for 6.10-rc4

core:
- Werror Kconfig fix

panel:
- add orientation quirk for Aya Neo KUN
- fix runtime warning on panel/bridge release

nouveau:
- remove unused struct
- fix wq crash on cards with no display

amdgpu:
- fix bo release clear page warning

xe:
- update MAINTAINERS
- Use correct forcewake assertions.
- Assert that VRAM provisioning is only done on DGFX.
- Flush render caches before user-fence signalling on all engines.
- Move the disable_c6 call since it was sometimes never called.

exynos:
- fix regression with fallback mode
- fix EDID related memory leak
- remove redundant code

komeda:
- fix debugfs conditional compilations
- check pointer error value

renesas:
- atomic shutdown fix

mediatek:
- atomic shutdown fix
The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670=
:

  Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-06-15

for you to fetch changes up to 9f0a86492ac4de4d1db718986a91833fdc914a54:

  Merge tag 'drm-misc-fixes-2024-06-14' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2024-06-15 06:52:56 +1000)

----------------------------------------------------------------
drm fixes for 6.10-rc4

core:
- Werror Kconfig fix

panel:
- add orientation quirk for Aya Neo KUN
- fix runtime warning on panel/bridge release

nouveau:
- remove unused struct
- fix wq crash on cards with no display

amdgpu:
- fix bo release clear page warning

xe:
- update MAINTAINERS
- Use correct forcewake assertions.
- Assert that VRAM provisioning is only done on DGFX.
- Flush render caches before user-fence signalling on all engines.
- Move the disable_c6 call since it was sometimes never called.

exynos:
- fix regression with fallback mode
- fix EDID related memory leak
- remove redundant code

komeda:
- fix debugfs conditional compilations
- check pointer error value

renesas:
- atomic shutdown fix

mediatek:
- atomic shutdown fix

----------------------------------------------------------------
Adam Miotk (1):
      drm/bridge/panel: Fix runtime warning on panel bridge release

Amjad Ouled-Ameur (1):
      drm/komeda: check for error-valued pointer

Andrzej Hajda (1):
      drm/xe: flush engine buffers before signalling user fence on all engi=
nes

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix the BO release clear memory warning

Dave Airlie (3):
      Merge tag 'exynos-drm-fixes-for-v6.10-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-fixes
      Merge tag 'drm-xe-fixes-2024-06-13' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2024-06-14' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Douglas Anderson (2):
      drm: renesas: shmobile: Call drm_atomic_helper_shutdown() at shutdown=
 time
      drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time

Dr. David Alan Gilbert (1):
      drm/nouveau: remove unused struct 'init_exec'

Jani Nikula (2):
      drm: have config DRM_WERROR depend on !WERROR
      drm/exynos/vidi: fix memory leak in .get_modes()

Krzysztof Kozlowski (1):
      drm/exynos: dp: drop driver owner initialization

Marek Szyprowski (1):
      drm/exynos: hdmi: report safe 640x480 mode as a fallback when no
EDID found

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Michal Wajdeczko (1):
      drm/xe/pf: Assert LMEM provisioning is done only on DGFX

Oded Gabbay (1):
      MAINTAINERS: update Xe driver maintainers

Riana Tauro (2):
      drm/xe/xe_gt_idle: use GT forcewake domain assertion
      drm/xe: move disable_c6 call

Thomas Hellstr=C3=B6m (1):
      MAINTAINERS: Update Xe driver maintainers

Tobias Jakobi (1):
      drm: panel-orientation-quirks: Add quirk for Aya Neo KUN

Vasily Khoruzhick (1):
      drm/nouveau: don't attempt to schedule hpd_work on headless cards

pengfuyuan (1):
      arm/komeda: Remove all CONFIG_DEBUG_FS conditional compilations

 MAINTAINERS                                            |  2 +-
 drivers/gpu/drm/Kconfig                                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c             |  2 --
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c        |  8 --------
 .../gpu/drm/arm/display/komeda/komeda_pipeline_state.c |  2 +-
 drivers/gpu/drm/bridge/panel.c                         |  7 +++++--
 drivers/gpu/drm/drm_panel_orientation_quirks.c         |  6 ++++++
 drivers/gpu/drm/exynos/exynos_dp.c                     |  1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c               |  7 ++++++-
 drivers/gpu/drm/exynos/exynos_hdmi.c                   |  7 +++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                 |  8 ++++++++
 drivers/gpu/drm/nouveau/dispnv04/disp.c                |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c                |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c                 |  5 -----
 drivers/gpu/drm/nouveau/nouveau_display.c              |  6 +++++-
 drivers/gpu/drm/nouveau/nouveau_drv.h                  |  1 +
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c       |  8 ++++++++
 drivers/gpu/drm/xe/xe_gt_idle.c                        |  9 ++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c             | 15 +++++++++++++-=
-
 drivers/gpu/drm/xe/xe_guc_pc.c                         |  6 ------
 drivers/gpu/drm/xe/xe_ring_ops.c                       | 18 ++++++++++++++=
++--
 22 files changed, 87 insertions(+), 37 deletions(-)
