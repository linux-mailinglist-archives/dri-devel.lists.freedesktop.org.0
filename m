Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D84E209B49
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 10:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F70F6E83F;
	Thu, 25 Jun 2020 08:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CF76E5C6;
 Thu, 25 Jun 2020 08:27:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00B73AEFC;
 Thu, 25 Jun 2020 08:27:19 +0000 (UTC)
Date: Thu, 25 Jun 2020 10:27:17 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200625082717.GA14856@linux-uq9g>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

there's the PR for the current patches in drm-misc-fixes. Besides the fixes
there's also a merge of v.5.8-rc1.

Best regards
Thomas

drm-misc-fixes-2020-06-25:
Short summary of fixes pull (less than what git shortlog provides):

 * In mcde, set up fbdev after device registration and removde the last access
to dev->dev_private. Fixes an error message and a segmentation fault.

 * Set the connector type for LogicPT Type 28 and newhaven_nhd_43_480272ef_atxl
panels.

 * In uvesafb, fix the handling of the noblank option.

 * Fix panel orientation for Asus T101HA and Acer S1003.

 * Fix DMA configuration for sun4i if IOMMU is present.

 * Fix regression in VT restoration. Unbreaks userspace (i.e., Xorg) VT handling.
The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-06-25

for you to fetch changes up to dc5bdb68b5b369d5bc7d1de96fa64cc1737a6320:

  drm/fb-helper: Fix vt restore (2020-06-24 21:34:11 +0200)

----------------------------------------------------------------
Short summary of fixes pull (less than what git shortlog provides):

 * In mcde, set up fbdev after device registration and removde the last access
to dev->dev_private. Fixes an error message and a segmentation fault.

 * Set the connector type for LogicPT Type 28 and newhaven_nhd_43_480272ef_atxl
panels.

 * In uvesafb, fix the handling of the noblank option.

 * Fix panel orientation for Asus T101HA and Acer S1003.

 * Fix DMA configuration for sun4i if IOMMU is present.

 * Fix regression in VT restoration. Unbreaks userspace (i.e., Xorg) VT handling.

----------------------------------------------------------------
Adam Ford (1):
      drm/panel-simple: fix connector type for LogicPD Type28 Display

Bartlomiej Zolnierkiewicz (1):
      video: fbdev: uvesafb: fix "noblank" option handling

Daniel Vetter (1):
      drm/fb-helper: Fix vt restore

Hans de Goede (2):
      drm: panel-orientation-quirks: Add quirk for Asus T101HA panel
      drm: panel-orientation-quirks: Use generic orientation-data for Acer S1003

Linus Walleij (2):
      drm: mcde: Fix display initialization problem
      drm: mcde: Fix forgotten user of drm->dev_private

Maxime Ripard (1):
      drm/sun4i: mixer: Call of_dma_configure if there's an IOMMU

Thomas Zimmermann (1):
      Merge v5.8-rc1 into drm-misc-fixes

Tomi Valkeinen (1):
      drm/panel-simple: fix connector type for newhaven_nhd_43_480272ef_atxl

Xiyu Yang (2):
      drm/ttm: Fix dma_fence refcnt leak in ttm_bo_vm_fault_reserved
      drm/ttm: Fix dma_fence refcnt leak when adding move fence

 drivers/gpu/drm/drm_fb_helper.c                | 63 ++++++++++++++++++++------
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 14 +++---
 drivers/gpu/drm/mcde/mcde_display.c            |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c                |  3 +-
 drivers/gpu/drm/panel/panel-simple.c           |  2 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c            | 13 ++++++
 drivers/gpu/drm/ttm/ttm_bo.c                   |  4 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                |  2 +
 drivers/video/fbdev/core/fbcon.c               |  3 +-
 drivers/video/fbdev/uvesafb.c                  |  2 +-
 include/uapi/linux/fb.h                        |  1 +
 11 files changed, 83 insertions(+), 26 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
