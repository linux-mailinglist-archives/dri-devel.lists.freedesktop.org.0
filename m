Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591F4569C1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 06:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0275C6E9F2;
	Fri, 19 Nov 2021 05:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DE96E9F2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 05:32:51 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w1so37587573edd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 21:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=FV7+rMAoyljvYMTPHC7pNClfY1H+TXN5fmbjkfoYhr8=;
 b=C4hROw/gfKCEP4BGVXOlNBcY3Nj2tGQm1gALbKevPo2qjWKnkl+1QN4ScQXamOtewN
 8cxqv2wCmR1FhDLUGsKXkqoMTo4bW12UQLdXhTd3mSDM3AGeSBsFXUD+vNT78BI5L8om
 TqQZ8Xy9j1FWSuLaGJp9Cm7JtTyCiO7qBPBKhTQIgU65J1jncX4gTnYDr1CIF/HtYl6I
 s5m5z50ZNgQXoH5Q/Zco2Hatd8PehpmmlhuwsvEgbSKrsqr73rNBNJERlFXmzBDSJSMJ
 wgmsiVPUVaSdJN9rV1wCwgI4lQJtOR8oGva/J16wkCjceKHRcoSsQInwTfLEr0IxDnm0
 1juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=FV7+rMAoyljvYMTPHC7pNClfY1H+TXN5fmbjkfoYhr8=;
 b=fyAlY52DToxPLUjKXAmRKt7utxDZjmIFEhfYg82+CNIUvRsMXHscctaxitopZ8x9EX
 xXlsQ399oxYBMrHBdtKBDo7cDuF0fG/sz8CBEVy8nYRLHfWXDByo65E9UCRmVA9e2Y5H
 0lLb4X4gJVEj9mEcqlZ5gSYLCPlqSoXT3bjf1b+ZGlK+10+KRrq4lOOVed74/rQK7RcY
 Kac5xwPuUvBpWo/sBWTMyo0+yhzvaHaYhiWQ+3WP1HnCClOMapVLG4GpI6QfVUZ0LhXp
 wwVBCofZ8kKtl+Dz72/fYDC841Z3CjqZq78oq7s7LRT1JC7tvLVErPWLdez9+YrvSLdT
 sciw==
X-Gm-Message-State: AOAM530UfDLb++GQJXZN5DyPG3HE5vqw9HRgX2ETzgRy7oHjA0q4kNy8
 Tntdbiymh/+0pTEmZAxn7ltRYC59oPdUZupAN+Y=
X-Google-Smtp-Source: ABdhPJxIZEQlWoCFMBLGzHJYPINtNPB0RFZsIKcTaYQwodmmrI8sMifvo1fJ+af0qsXljf+C1BxWcq40T7MM3Ng1zJU=
X-Received: by 2002:a05:6402:50cf:: with SMTP id
 h15mr19968102edb.90.1637299969651; 
 Thu, 18 Nov 2021 21:32:49 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 19 Nov 2021 15:32:38 +1000
Message-ID: <CAPM=9twL3jV37TWqwTUDfCdqMEeQDO6Zrgx+rkWNir8Q8eOqWw@mail.gmail.com>
Subject: [git pull] drm fixes for 5.16-rc2
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

This week's fixes, pretty quiet, about right for rc2. amdgpu is the
bulk of them but the scheduler ones have been reported in a few places
I think.

Otherwise just some minor i915 fixes and a few other scattered around.

Dave.

drm-fixes-2021-11-19:
drm fixes for 5.16-rc2

scheduler:
- two refcounting fixes

cma-helper:
- use correct free path for noncoherent

efifb:
- probing fix

amdgpu:
- Better debugging info for SMU msgs
- Better error reporting when adding IP blocks
- Fix UVD powergating regression on CZ
- Clock reporting fix for navi1x
- OLED panel backlight fix
- Fix scaling on VGA/DVI for non-DC display code
- Fix GLFCLK handling for RGP on some APUs
- fix potential memory leak

amdkfd:
- GPU reset fix

i915:
- return error handling fix
- ADL-P display fix
- TGL DSI display clocks fix

nouveau:
- infoframe corruption fix

sun4i:
- Kconfig fix
The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf=
:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-11-19

for you to fetch changes up to 7d51040a695b53d4060349c7a895ef4a763887ef:

  Merge tag 'amd-drm-fixes-5.16-2021-11-17' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-11-19
14:23:14 +1000)

----------------------------------------------------------------
drm fixes for 5.16-rc2

scheduler:
- two refcounting fixes

cma-helper:
- use correct free path for noncoherent

efifb:
- probing fix

amdgpu:
- Better debugging info for SMU msgs
- Better error reporting when adding IP blocks
- Fix UVD powergating regression on CZ
- Clock reporting fix for navi1x
- OLED panel backlight fix
- Fix scaling on VGA/DVI for non-DC display code
- Fix GLFCLK handling for RGP on some APUs
- fix potential memory leak

amdkfd:
- GPU reset fix

i915:
- return error handling fix
- ADL-P display fix
- TGL DSI display clocks fix

nouveau:
- infoframe corruption fix

sun4i:
- Kconfig fix

----------------------------------------------------------------
Bernard Zhao (1):
      drm/amd/amdgpu: fix potential memleak

Christian K=C3=B6nig (1):
      drm/scheduler: fix drm_sched_job_add_implicit_dependencies

Dan Carpenter (1):
      drm/i915/guc: fix NULL vs IS_ERR() checking

Dave Airlie (3):
      Merge tag 'drm-misc-fixes-2021-11-18' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-11-18' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.16-2021-11-17' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Evan Quan (1):
      drm/amd/pm: avoid duplicate powergate/ungate setting

Guchun Chen (1):
      drm/amdgpu: add error print when failing to add IP block(v2)

Hans Verkuil (1):
      drm/nouveau: hdmigv100.c: fix corrupted HDMI Vendor InfoFrame

Javier Martinez Canillas (1):
      fbdev: Prevent probing generic drivers if a FB is already registered

Julian Braha (1):
      drm/sun4i: fix unmet dependency on RESET_CONTROLLER for
PHY_SUN6I_MIPI_DPHY

Lijo Lazar (1):
      drm/amd/pm: Remove artificial freq level on Navi1x

Luben Tuikov (1):
      drm/amd/pm: Enhanced reporting also for a stuck command

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Perry Yuan (1):
      drm/amd/pm: add GFXCLK/SCLK clocks level print support for APUs

Rob Clark (1):
      drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder

Roman Li (1):
      drm/amd/display: Fix OLED brightness control on eDP

Thomas Zimmermann (1):
      drm/cma-helper: Release non-coherent memory with dma_free_noncoherent=
()

Vandita Kulkarni (2):
      Revert "drm/i915/tgl/dsi: Gate the ddi clocks after pll mapping"
      drm/i915/dsi/xelpd: Fix the bit mask for wakeup GB

hongao (1):
      drm/amdgpu: fix set scaling mode Full/Full aspect/Center not
works on vga and dvi connectors

shaoyunl (1):
      drm/amd/amdkfd: Fix kernel panic when reset failed and been
triggered again

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 36 ++++++++++++++++++=
++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  1 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  5 +++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  3 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |  3 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 10 ++++++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |  8 +++++
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    | 22 +++++++++++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 13 +++++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   | 26 ++++++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   | 27 ++++++++++++++++
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.h   |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  8 +++--
 drivers/gpu/drm/drm_gem_cma_helper.c               |  9 ++++--
 drivers/gpu/drm/i915/display/icl_dsi.c             | 13 +++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  4 +--
 drivers/gpu/drm/i915/i915_reg.h                    |  4 ++-
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c   |  1 -
 drivers/gpu/drm/scheduler/sched_main.c             |  6 +++-
 drivers/gpu/drm/sun4i/Kconfig                      |  1 +
 drivers/video/fbdev/efifb.c                        | 11 +++++++
 drivers/video/fbdev/simplefb.c                     | 11 +++++++
 24 files changed, 200 insertions(+), 27 deletions(-)
