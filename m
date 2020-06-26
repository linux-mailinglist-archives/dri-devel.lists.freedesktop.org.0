Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9FB20AB58
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 06:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7C16E0CD;
	Fri, 26 Jun 2020 04:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707276E0CD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 04:26:47 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g20so5668312edm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 21:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zsrmlLSLZ01EjG6CZNS/YdRqsMRGObklBz5sXZSd5vs=;
 b=sp0sUeJKxy/zj9xiFz3FY12JnJX882xC2NaIlokjf8y0reAL6X6lmTQkcerHPqrV2E
 wEe3HFHeeAXUfDrtk/9kKzuUJOH+uER2rMU+J7lXDGAqCaQex2V0SaHJY/I9BSfQJ87I
 pBCVR5EWc7IRq+qjfUinLZ4U/TYrDUJZLqsn+9izargMqh6/WNn6jV8yRxeClitmpatA
 SULVZGiuMhjzvWYZ0uCVv1rdTGn6pHWZBAmVQ6g9Ts4B745jTnqD1vx8J2wYcH+Idtog
 +ChuB6YieVrm6kN0qi7jNz3FqBZIdDl9fDHcu9JFtONQOTG1MqrmCPkj8jR5e0GVMgsn
 86qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zsrmlLSLZ01EjG6CZNS/YdRqsMRGObklBz5sXZSd5vs=;
 b=X6EP5r6tF/te2baTA+GJgdhNvEva7QdW0LTDDQR4k+SJ/5PudxMo+A6pbFhwArHTZH
 QVFrWzxuS3sHkLcv9AhW3jZDtpxvOoMpvAA1cayck+58HrMY5odCv0PjyBKQ4tOgsGTh
 UuXzx8q9+Kjtc61KtJxPTs1NUX6pfljFQpYQc6fSsAC10vG9Wrc2M2wiK0N9kk9HorpJ
 Fxl5A7iCD365ilsxg6+bNTmVliDlBcy/gyOz76fIjQzl/yik0YeDZi3C8AZkLWLvOZeV
 N6vtLousqaqjxwibgnyxWwD+w3kgMDUVL99ZdSMmTo1sbaD+Mk47omll7HemekAa/wz+
 nPkw==
X-Gm-Message-State: AOAM531xmBMk1RG8y90t9EgoLtA4RGYDf/XCCIOaDrePYp7A1rwiC2IG
 iaWfCYQ+13mJPljd2+oCXvO8e2G3ThcjqWuXWyE=
X-Google-Smtp-Source: ABdhPJyFTu100whnWzPLTaeldIR6U8kDLTKBN1R+JaHh+0SYBGe2k0r4/edxDmCR0GkjL5Es6FfM8HQBQ/pUBn8rorE=
X-Received: by 2002:a50:e883:: with SMTP id f3mr1528339edn.220.1593145605732; 
 Thu, 25 Jun 2020 21:26:45 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 Jun 2020 14:26:34 +1000
Message-ID: <CAPM=9tyuBF_AmAMxL1U=ofd4=kxN_39-EOW3c3rGNFyb4=ut8Q@mail.gmail.com>
Subject: [git pull] drm fixes for v5.8-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Usual rc3 pickup, lots of little fixes all over, The core VT
registration regression fix is probably the largest, otherwise ttm,
amdgpu and tegra are the bulk, with some minor driver fixes. No i915
pull this week which may or may not mean I get 2x of it next week,
we'll see how it goes.

Regards,
Dave.

drm-fixes-2020-06-26:
drm fixes for v5.8-rc3

core:
- fix VT registration regression

ttm:
- fix two fence leaks

amdgpu:
- Fix missed mutex unlock in DC error path
- Fix firmware leak for sdma5
- DC bpc property fixes

amdkfd:
- Fix memleak in an error path

radeon:
- Fix copy paste typo in NI DPM spll validation

rcar-du:
- build fix

tegra:
- add missing zpos property
- child driver registration fix
- debugfs cleanup fix
- doc fix

mcde:
- reorder fbdev setup

panel:
- fix connector type
- fix orientation for some panels

sun4i:
- fix dma/iommu configuration

uvesafb:
- respect blank flag
The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2020-06-26

for you to fetch changes up to 687a0ed337367be5267652af5f6dbcfc954b8732:

  Merge tag 'drm-misc-fixes-2020-06-25' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2020-06-26
13:49:17 +1000)

----------------------------------------------------------------
drm fixes for v5.8-rc3

core:
- fix VT registration regression

ttm:
- fix two fence leaks

amdgpu:
- Fix missed mutex unlock in DC error path
- Fix firmware leak for sdma5
- DC bpc property fixes

amdkfd:
- Fix memleak in an error path

radeon:
- Fix copy paste typo in NI DPM spll validation

rcar-du:
- build fix

tegra:
- add missing zpos property
- child driver registration fix
- debugfs cleanup fix
- doc fix

mcde:
- reorder fbdev setup

panel:
- fix connector type
- fix orientation for some panels

sun4i:
- fix dma/iommu configuration

uvesafb:
- respect blank flag

----------------------------------------------------------------
Adam Ford (1):
      drm/panel-simple: fix connector type for LogicPD Type28 Display

Bartlomiej Zolnierkiewicz (1):
      video: fbdev: uvesafb: fix "noblank" option handling

Bernard Zhao (1):
      drm/amd: fix potential memleak in err branch

Christophe JAILLET (1):
      gpu: host1x: Clean up debugfs in error handling path

Colton Lewis (1):
      gpu: host1x: Correct trivial kernel-doc inconsistencies

Daniel Gomez (1):
      drm: rcar-du: Fix build error

Daniel Vetter (1):
      drm/fb-helper: Fix vt restore

Dave Airlie (4):
      Merge tag 'du-fixes-20200621' of
git://linuxtv.org/pinchartl/media into drm-fixes
      Merge tag 'drm/tegra/for-5.8-rc3' of
git://anongit.freedesktop.org/tegra/linux into drm-fixes
      Merge tag 'amd-drm-fixes-5.8-2020-06-24' of
git://people.freedesktop.org/~agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2020-06-25' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Denis Efremov (1):
      drm/radeon: fix fb_div check in ni_init_smc_spll_table()

Hans de Goede (2):
      drm: panel-orientation-quirks: Add quirk for Asus T101HA panel
      drm: panel-orientation-quirks: Use generic orientation-data for Acer S1003

John van der Kamp (1):
      drm/amdgpu/display: Unlock mutex on error

Linus Walleij (2):
      drm: mcde: Fix display initialization problem
      drm: mcde: Fix forgotten user of drm->dev_private

Maxime Ripard (1):
      drm/sun4i: mixer: Call of_dma_configure if there's an IOMMU

Nicolin Chen (1):
      drm/tegra: hub: Do not enable orphaned window group

Stylon Wang (2):
      drm/amd/display: Enable output_bpc property on all outputs
      drm/amd/display: Fix ineffective setting of max bpc property

Thierry Reding (4):
      gpu: host1x: Register child devices
      drm/tegra: hub: Register child devices
      gpu: host1x: Detach driver on unregister
      drm/tegra: Add zpos property for cursor planes

Thomas Zimmermann (1):
      Merge v5.8-rc1 into drm-misc-fixes

Tomi Valkeinen (1):
      drm/panel-simple: fix connector type for newhaven_nhd_43_480272ef_atxl

Wenhui Sheng (1):
      drm/amdgpu: add fw release for sdma v5_0

Xiyu Yang (2):
      drm/ttm: Fix dma_fence refcnt leak in ttm_bo_vm_fault_reserved
      drm/ttm: Fix dma_fence refcnt leak when adding move fence

 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  6 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  6 ++-
 drivers/gpu/drm/drm_fb_helper.c                    | 63 +++++++++++++++++-----
 drivers/gpu/drm/drm_panel_orientation_quirks.c     | 14 ++---
 drivers/gpu/drm/mcde/mcde_display.c                |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |  3 +-
 drivers/gpu/drm/panel/panel-simple.c               |  2 +
 drivers/gpu/drm/radeon/ni_dpm.c                    |  2 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |  1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c                | 13 +++++
 drivers/gpu/drm/tegra/dc.c                         |  1 +
 drivers/gpu/drm/tegra/hub.c                        | 17 +++++-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  4 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  2 +
 drivers/gpu/host1x/bus.c                           |  9 ++++
 drivers/gpu/host1x/dev.c                           | 11 +++-
 drivers/video/fbdev/core/fbcon.c                   |  3 +-
 drivers/video/fbdev/uvesafb.c                      |  2 +-
 include/linux/host1x.h                             |  3 ++
 include/uapi/linux/fb.h                            |  1 +
 23 files changed, 137 insertions(+), 36 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
