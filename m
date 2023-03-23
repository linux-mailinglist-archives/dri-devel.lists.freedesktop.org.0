Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7465B6C662C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 12:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244B110E17C;
	Thu, 23 Mar 2023 11:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F64210EA70;
 Thu, 23 Mar 2023 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679569757; x=1711105757;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=H0GMtVObT5wqYaIH+IaGOeSsCEd7g5M5OlFXtnXJCAo=;
 b=NsmRvUlhTOK3sawzU+hQZotG8Gv/RrqeYVrv1qlZ1ys+b80YocN3K1yq
 tEhDQOWEa2jfN8l4prxQ8c5hJEdZt8xiqhZeoaXZmLP5LU3fjHPNN6Tee
 w2fGQbZYZdNrAVC190Sbfw3cR227Zvc/lmNBfNEZLvEWdW7Adt31sqawG
 Mg9IzhSEm5UqiqY1jf9rMYaj9wyFl0PFCGvkOJCrCdQaDjmtMLtE9QR99
 du7iaxVsjBUXeHIP5QEqbHG318sOk4pD4d5joEC+jSOqmmvMGv50L673f
 LgLx0Po5nh0w/+Yem8bMosx3n09qX1r7tj3k6GMhe+XfONnSWwK7jJ1Ms w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340996343"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
 d="scan'208,217";a="340996343"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="1011751953"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
 d="scan'208,217";a="1011751953"
Received: from ymekhani-mobl2.amr.corp.intel.com (HELO [10.251.222.144])
 ([10.251.222.144])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:08:59 -0700
Content-Type: multipart/alternative;
 boundary="------------8fABZRzj7DVMKbgn5hr0He0R"
Message-ID: <5a4c438e-7047-c044-fc77-5a3597000264@linux.intel.com>
Date: Thu, 23 Mar 2023 12:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------8fABZRzj7DVMKbgn5hr0He0R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dave, Daniel,

Lots of small commits with cleanup and fixes this time around, nothing major otherwise.

Cheers,
~Maarten

drm-misc-next-2023-03-23:
drm-misc-next for v6.4-rc1:

Core Changes:
- Add unit test for xrgb8888 to mono.
- Assorted small fixes to format helper selftests.
- Assorted documentation updates.
- Drop drm_dev_set_unique.
- Always use shadow buffer in generic fbdev emulation helpers, and
   improve error handling.

Driver Changes:
- Assorted small fixes to malidp, hdlcd, gma500, lima, bridge, rockchip.
- Move fbdev in gma500 to use drm_client.
- Convert bridge platform callbacks to void return.
- Drop leftover from vgem to shmem helper conversion.

The following changes since commit b24343eaceedb902c1625854f85a193b0549d85f:

   drm/nouveau/nvfw/acr: set wpr_generic_header_dump storage-class-specifier to static (2023-03-16 14:53:15 +0100)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-03-23

for you to fetch changes up to 4ab9157c7e02019fa8d8ab98d4f9e67e6a7cfad1:

   drm/rockchip: vop2: Add error check to devm_regmap_init_mmio (2023-03-23 00:18:58 +0100)

----------------------------------------------------------------
drm-misc-next for v6.4-rc1:

Core Changes:
- Add unit test for xrgb8888 to mono.
- Assorted small fixes to format helper selftests.
- Assorted documentation updates.
- Drop drm_dev_set_unique.
- Always use shadow buffer in generic fbdev emulation helpers, and
   improve error handling.

Driver Changes:
- Assorted small fixes to malidp, hdlcd, gma500, lima, bridge, rockchip.
- Move fbdev in gma500 to use drm_client.
- Convert bridge platform callbacks to void return.
- Drop leftover from vgem to shmem helper conversion.

----------------------------------------------------------------
Adam Ford (1):
       drm/bridge: adv7533: Fix adv7533_mode_valid for adv7533 and adv7535

Alfredo Cruz (1):
       drm/rockchip: vop2: Add error check to devm_regmap_init_mmio

Arthur Grillo (2):
       drm/format-helper: Add Kunit tests for drm_fb_xrgb8888_to_mono()
       drm/format-helper: Make "destination_pitch" test usable for mono

Christian König (1):
       drm: remove drm_dev_set_unique

Javier Martinez Canillas (1):
       drm/format-helper: Use drm_format_info_min_pitch() in tests helper

Lee Jones (1):
       drm/ttm/ttm_bo: Provide a missing 'bulk' description and correct misnaming of 'placement'

Maíra Canal (2):
       drm/vgem: Drop struct drm_vgem_gem_object
       drm/lima: Use drm_sched_job_add_syncobj_dependency()

Petr Tesarik (1):
       drm/prime: Fix documentation of drm_gem_prime_fd_to_handle()

Simon Ser (1):
       drm: fix typo in margin connector properties docs

Thomas Zimmermann (15):
       drm/gma500: Remove unnecessary include statements
       drm/gma500: Move fbdev code into separate source file
       drm/gma500: Remove fbdev vma open and close callbacks
       drm/gma500: Fix naming in fb_ops
       drm/gma500: Inline psbfb_create() into psbfb_probe()
       drm/gma500: Implement client-based fbdev emulation
       drm/gma500: Pass fb_info to psb_fbdev_vm_fault()
       drm/fbdev-generic: Always use shadow buffering
       drm/fbdev-generic: Remove unused prefer_shadow_fbdev flag
       drm/fb-helper: Export drm_fb_helper_release_info()
       drm/fb-helper: Support smem_len in deferred I/O
       drm/fbdev-generic: Set screen size to size of GEM buffer
       drm/fbdev-generic: Clean up after failed probing
       drm/fb-helper: Consolidate CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
       drm/fbdev-generic: Rename symbols

Toby Chen (1):
       drm/rockchip: dw_hdmi: cleanup drm encoder during unbind

Tom Rix (3):
       gpu: drm: bridge: sii9234: remove unused bridge_to_sii9234 function
       drm/gma500: remove unused gma_pipe_event function
       drm/rockchip: vop2: fix uninitialized variable possible_crtcs

Uwe Kleine-König (17):
       drm/bridge: cdns-dsi: Convert to platform remove callback returning void
       drm/bridge: display-connector: Convert to platform remove callback returning void
       drm/bridge: fsl-ldb: Convert to platform remove callback returning void
       drm/bridge: imx8qm-ldb: Convert to platform remove callback returning void
       drm/bridge: imx8qxp-ldb: Convert to platform remove callback returning void
       drm/bridge: imx8qxp-pixel-combiner: Convert to platform remove callback returning void
       drm/bridge: imx8qxp-pixel-link: Convert to platform remove callback returning void
       drm/bridge: imx8qxp-pxl2dpi: Convert to platform remove callback returning void
       drm/bridge: lvds-codec: Convert to platform remove callback returning void
       drm/bridge: nwl-dsi: Convert to platform remove callback returning void
       drm/bridge: simple-bridg: Convert to platform remove callback returning void
       drm/bridge: dw-hdmi-ahb-audio: Convert to platform remove callback returning void
       drm/bridge: dw-hdmi-cec: Convert to platform remove callback returning void
       drm/bridge: dw-hdmi-gp-audio: Convert to platform remove callback returning void
       drm/bridge: dw-hdmi-i2s-audio: Convert to platform remove callback returning void
       drm/bridge: thc63lvd1024: Convert to platform remove callback returning void
       drm/bridge: ti-tfp410: Convert to platform remove callback returning void

Yang Li (2):
       drm/arm/malidp: Use devm_platform_get_and_ioremap_resource()
       drm/arm/hdlcd: Use devm_platform_ioremap_resource()

Ye Xingchen (2):
       drm/bridge: display-connector: Use dev_err_probe()
       drm: bridge: simple-bridge: Use dev_err_probe()

  drivers/gpu/drm/arm/hdlcd_drv.c                    |   4 +-
  drivers/gpu/drm/arm/malidp_drv.c                   |   3 +-
  drivers/gpu/drm/bridge/adv7511/adv7533.c           |  25 +-
  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |   6 +-
  drivers/gpu/drm/bridge/display-connector.c         |  15 +-
  drivers/gpu/drm/bridge/fsl-ldb.c                   |   6 +-
  drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c        |   6 +-
  drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c       |   6 +-
  .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   6 +-
  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |   6 +-
  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |   6 +-
  drivers/gpu/drm/bridge/lvds-codec.c                |   6 +-
  drivers/gpu/drm/bridge/nwl-dsi.c                   |   5 +-
  drivers/gpu/drm/bridge/sii9234.c                   |   5 -
  drivers/gpu/drm/bridge/simple-bridge.c             |  14 +-
  .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    |   6 +-
  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |   6 +-
  drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |   6 +-
  .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   6 +-
  drivers/gpu/drm/bridge/thc63lvd1024.c              |   6 +-
  drivers/gpu/drm/bridge/ti-tfp410.c                 |   6 +-
  drivers/gpu/drm/drm_connector.c                    |   2 +-
  drivers/gpu/drm/drm_drv.c                          |  26 +-
  drivers/gpu/drm/drm_fb_helper.c                    |  63 ++--
  drivers/gpu/drm/drm_fbdev_dma.c                    |   9 +-
  drivers/gpu/drm/drm_fbdev_generic.c                | 279 ++++++-----------
  drivers/gpu/drm/drm_prime.c                        |   4 +-
  drivers/gpu/drm/gma500/Makefile                    |   1 +
  drivers/gpu/drm/gma500/fbdev.c                     | 344 +++++++++++++++++++++
  drivers/gpu/drm/gma500/framebuffer.c               | 341 +-------------------
  drivers/gpu/drm/gma500/psb_drv.c                   |   5 +-
  drivers/gpu/drm/gma500/psb_drv.h                   |  19 +-
  drivers/gpu/drm/gma500/psb_irq.c                   |  11 -
  drivers/gpu/drm/lima/lima_gem.c                    |  12 +-
  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |   1 +
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  11 +-
  drivers/gpu/drm/tests/drm_format_helper_test.c     | 141 ++++++---
  drivers/gpu/drm/tiny/bochs.c                       |   1 -
  drivers/gpu/drm/ttm/ttm_bo.c                       |   3 +-
  drivers/gpu/drm/vgem/vgem_drv.h                    |  11 -
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   1 -
  include/drm/drm_drv.h                              |   2 -
  include/drm/drm_fb_helper.h                        |  14 +-
  include/drm/drm_mode_config.h                      |   7 -
  44 files changed, 664 insertions(+), 799 deletions(-)
  create mode 100644 drivers/gpu/drm/gma500/fbdev.c

--------------8fABZRzj7DVMKbgn5hr0He0R
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Dave, Daniel,

Lots of small commits with cleanup and fixes this time around, nothing major otherwise.

Cheers,
~Maarten

drm-misc-next-2023-03-23:
drm-misc-next for v6.4-rc1:

Core Changes:
- Add unit test for xrgb8888 to mono.
- Assorted small fixes to format helper selftests.
- Assorted documentation updates.
- Drop drm_dev_set_unique.
- Always use shadow buffer in generic fbdev emulation helpers, and
  improve error handling.

Driver Changes:
- Assorted small fixes to malidp, hdlcd, gma500, lima, bridge, rockchip.
- Move fbdev in gma500 to use drm_client.
- Convert bridge platform callbacks to void return.
- Drop leftover from vgem to shmem helper conversion.

The following changes since commit b24343eaceedb902c1625854f85a193b0549d85f:

  drm/nouveau/nvfw/acr: set wpr_generic_header_dump storage-class-specifier to static (2023-03-16 14:53:15 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-03-23

for you to fetch changes up to 4ab9157c7e02019fa8d8ab98d4f9e67e6a7cfad1:

  drm/rockchip: vop2: Add error check to devm_regmap_init_mmio (2023-03-23 00:18:58 +0100)

----------------------------------------------------------------
drm-misc-next for v6.4-rc1:

Core Changes:
- Add unit test for xrgb8888 to mono.
- Assorted small fixes to format helper selftests.
- Assorted documentation updates.
- Drop drm_dev_set_unique.
- Always use shadow buffer in generic fbdev emulation helpers, and
  improve error handling.

Driver Changes:
- Assorted small fixes to malidp, hdlcd, gma500, lima, bridge, rockchip.
- Move fbdev in gma500 to use drm_client.
- Convert bridge platform callbacks to void return.
- Drop leftover from vgem to shmem helper conversion.

----------------------------------------------------------------
Adam Ford (1):
      drm/bridge: adv7533: Fix adv7533_mode_valid for adv7533 and adv7535

Alfredo Cruz (1):
      drm/rockchip: vop2: Add error check to devm_regmap_init_mmio

Arthur Grillo (2):
      drm/format-helper: Add Kunit tests for drm_fb_xrgb8888_to_mono()
      drm/format-helper: Make "destination_pitch" test usable for mono

Christian König (1):
      drm: remove drm_dev_set_unique

Javier Martinez Canillas (1):
      drm/format-helper: Use drm_format_info_min_pitch() in tests helper

Lee Jones (1):
      drm/ttm/ttm_bo: Provide a missing 'bulk' description and correct misnaming of 'placement'

Maíra Canal (2):
      drm/vgem: Drop struct drm_vgem_gem_object
      drm/lima: Use drm_sched_job_add_syncobj_dependency()

Petr Tesarik (1):
      drm/prime: Fix documentation of drm_gem_prime_fd_to_handle()

Simon Ser (1):
      drm: fix typo in margin connector properties docs

Thomas Zimmermann (15):
      drm/gma500: Remove unnecessary include statements
      drm/gma500: Move fbdev code into separate source file
      drm/gma500: Remove fbdev vma open and close callbacks
      drm/gma500: Fix naming in fb_ops
      drm/gma500: Inline psbfb_create() into psbfb_probe()
      drm/gma500: Implement client-based fbdev emulation
      drm/gma500: Pass fb_info to psb_fbdev_vm_fault()
      drm/fbdev-generic: Always use shadow buffering
      drm/fbdev-generic: Remove unused prefer_shadow_fbdev flag
      drm/fb-helper: Export drm_fb_helper_release_info()
      drm/fb-helper: Support smem_len in deferred I/O
      drm/fbdev-generic: Set screen size to size of GEM buffer
      drm/fbdev-generic: Clean up after failed probing
      drm/fb-helper: Consolidate CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
      drm/fbdev-generic: Rename symbols

Toby Chen (1):
      drm/rockchip: dw_hdmi: cleanup drm encoder during unbind

Tom Rix (3):
      gpu: drm: bridge: sii9234: remove unused bridge_to_sii9234 function
      drm/gma500: remove unused gma_pipe_event function
      drm/rockchip: vop2: fix uninitialized variable possible_crtcs

Uwe Kleine-König (17):
      drm/bridge: cdns-dsi: Convert to platform remove callback returning void
      drm/bridge: display-connector: Convert to platform remove callback returning void
      drm/bridge: fsl-ldb: Convert to platform remove callback returning void
      drm/bridge: imx8qm-ldb: Convert to platform remove callback returning void
      drm/bridge: imx8qxp-ldb: Convert to platform remove callback returning void
      drm/bridge: imx8qxp-pixel-combiner: Convert to platform remove callback returning void
      drm/bridge: imx8qxp-pixel-link: Convert to platform remove callback returning void
      drm/bridge: imx8qxp-pxl2dpi: Convert to platform remove callback returning void
      drm/bridge: lvds-codec: Convert to platform remove callback returning void
      drm/bridge: nwl-dsi: Convert to platform remove callback returning void
      drm/bridge: simple-bridg: Convert to platform remove callback returning void
      drm/bridge: dw-hdmi-ahb-audio: Convert to platform remove callback returning void
      drm/bridge: dw-hdmi-cec: Convert to platform remove callback returning void
      drm/bridge: dw-hdmi-gp-audio: Convert to platform remove callback returning void
      drm/bridge: dw-hdmi-i2s-audio: Convert to platform remove callback returning void
      drm/bridge: thc63lvd1024: Convert to platform remove callback returning void
      drm/bridge: ti-tfp410: Convert to platform remove callback returning void

Yang Li (2):
      drm/arm/malidp: Use devm_platform_get_and_ioremap_resource()
      drm/arm/hdlcd: Use devm_platform_ioremap_resource()

Ye Xingchen (2):
      drm/bridge: display-connector: Use dev_err_probe()
      drm: bridge: simple-bridge: Use dev_err_probe()

 drivers/gpu/drm/arm/hdlcd_drv.c                    |   4 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |   3 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |  25 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |   6 +-
 drivers/gpu/drm/bridge/display-connector.c         |  15 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |   6 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c        |   6 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c       |   6 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   6 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |   6 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |   6 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |   6 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   5 +-
 drivers/gpu/drm/bridge/sii9234.c                   |   5 -
 drivers/gpu/drm/bridge/simple-bridge.c             |  14 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    |   6 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |   6 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |   6 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   6 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |   6 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   6 +-
 drivers/gpu/drm/drm_connector.c                    |   2 +-
 drivers/gpu/drm/drm_drv.c                          |  26 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  63 ++--
 drivers/gpu/drm/drm_fbdev_dma.c                    |   9 +-
 drivers/gpu/drm/drm_fbdev_generic.c                | 279 ++++++-----------
 drivers/gpu/drm/drm_prime.c                        |   4 +-
 drivers/gpu/drm/gma500/Makefile                    |   1 +
 drivers/gpu/drm/gma500/fbdev.c                     | 344 +++++++++++++++++++++
 drivers/gpu/drm/gma500/framebuffer.c               | 341 +-------------------
 drivers/gpu/drm/gma500/psb_drv.c                   |   5 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |  19 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |  11 -
 drivers/gpu/drm/lima/lima_gem.c                    |  12 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  11 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     | 141 ++++++---
 drivers/gpu/drm/tiny/bochs.c                       |   1 -
 drivers/gpu/drm/ttm/ttm_bo.c                       |   3 +-
 drivers/gpu/drm/vgem/vgem_drv.h                    |  11 -
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   1 -
 include/drm/drm_drv.h                              |   2 -
 include/drm/drm_fb_helper.h                        |  14 +-
 include/drm/drm_mode_config.h                      |   7 -
 44 files changed, 664 insertions(+), 799 deletions(-)
 create mode 100644 drivers/gpu/drm/gma500/fbdev.c

</pre>
  </body>
</html>

--------------8fABZRzj7DVMKbgn5hr0He0R--
