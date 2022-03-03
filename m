Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5503B4CBA2D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 10:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D05C10EBD2;
	Thu,  3 Mar 2022 09:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2F510EBD2;
 Thu,  3 Mar 2022 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646299714; x=1677835714;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=O6WsRZr2GyMu3wgt5/RvryWKIuOxg4xdSh9hQqs3lPY=;
 b=HstlfHFc0i/x8zidRUMn59CumSkqqyXpXDP4l2vkEoR3uApLwJeH5QZn
 7DgP/eAkJvO6DypvOgPJ9h/shdDBgl0Torpn4fwTqRExsLyyQaWkG/pLA
 7SVRxOVtUuv9d9CUccd2LNInnlPEt1JPOAwa5aTX4L3LQD/62PaFQ6XT/
 pF6ywn1BffjvKNckCadh42QrS6+qF02lgPTB5TwEMa8xYyp71iu8X0rNF
 TdSdDA4y3WlO/+0XCBFG8dim0/cfY0EDdEP1S/PvvbgxD47j3tOHAbJF1
 FIAcFDU3BFo0W+VM+PiUb2Gk+SSaHZifVQ7xDkbIvCNt+1HY8ZpPepLTy w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="251201886"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="251201886"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:28:33 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="709856285"
Received: from mgheorgh-mobl1.ger.corp.intel.com (HELO [10.252.53.16])
 ([10.252.53.16])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:28:31 -0800
Message-ID: <48fabd78-ade9-f80b-c724-13726c7be69e@linux.intel.com>
Date: Thu, 3 Mar 2022 10:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-2022-03-03:
drm-misc-next for v5.18:

UAPI Changes:

Cross-subsystem Changes:
- Improve performance of some fbdev ops, in some cases up to 6x faster.

Core Changes:
- Some small DP fixes.
- Find panels in subnodes of OF devices, and add of_get_drm_panel_display_mode
  to retrieve mode.
- Add drm_object_property_get_default_value and use it for resetting
  zpos in plane state reset, removing the need for individual drivers
  to do it.
- Same for color encoding and color range props.
- Update panic handling todo doc.
- Add todo that format conversion helpers should be sped up similarly to fbdev ops.

Driver Changes:
- Add panel orientation property to simpledrm for quirked panels.
- Assorted small fixes to tiny/repaper, nouveau, stm, omap, ssd130x.
- Add crc support to stm/ltdc.
- Add MIPI DBI compatible SPI driver
- Assorted small fixes to tiny panels and bridge drivers.
- Add AST2600 support to aspeed.
The following changes since commit f915686bd97a9c234602426e6d132b74a112a8d6:

  drm/selftests: add drm buddy pathological testcase (2022-02-23 10:46:32 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-03-03

for you to fetch changes up to 701920ca9822eb63b420b3bcb627f2c1ec759903:

  drm/ssd130x: remove redundant initialization of pointer mode (2022-03-03 09:28:55 +0100)

----------------------------------------------------------------
drm-misc-next for v5.18:

UAPI Changes:

Cross-subsystem Changes:
- Improve performance of some fbdev ops, in some cases up to 6x faster.

Core Changes:
- Some small DP fixes.
- Find panels in subnodes of OF devices, and add of_get_drm_panel_display_mode
  to retrieve mode.
- Add drm_object_property_get_default_value and use it for resetting
  zpos in plane state reset, removing the need for individual drivers
  to do it.
- Same for color encoding and color range props.
- Update panic handling todo doc.
- Add todo that format conversion helpers should be sped up similarly to fbdev ops.

Driver Changes:
- Add panel orientation property to simpledrm for quirked panels.
- Assorted small fixes to tiny/repaper, nouveau, stm, omap, ssd130x.
- Add crc support to stm/ltdc.
- Add MIPI DBI compatible SPI driver
- Assorted small fixes to tiny panels and bridge drivers.
- Add AST2600 support to aspeed.

----------------------------------------------------------------
Cai Huoqing (1):
      drm/nouveau: Remove the unused header file nvif/list.h

Colin Ian King (1):
      drm/ssd130x: remove redundant initialization of pointer mode

Daniel Vetter (1):
      drm/todo: Update panic handling todo

Dave Stevenson (3):
      drm/object: Add drm_object_property_get_default_value() function
      drm/object: Add default zpos value at reset
      drm/object: Add default color encoding and range value at reset

Hans de Goede (1):
      drm/simpledrm: Add "panel orientation" property on non-upright mounted LCD panels

Hsin-Yi Wang (2):
      drm/bridge: it6505: Fix the read buffer array bound
      drm/bridge: Clear the DP_AUX_I2C_MOT bit passed in aux read command.

Jagan Teki (1):
      drm: of: Lookup if child node has panel or bridge

Javier Martinez Canillas (1):
      drm/repaper: Use format helper for xrgb8888 to monochrome conversion

José Expósito (1):
      drm/bridge: chipone-icn6211: switch to devm_drm_of_get_bridge

Kees Cook (2):
      drm/dp: Fix off-by-one in register cache size
      drm/dp: Fix OOB read when handling Post Cursor2 register

Liu Ying (1):
      drm/bridge: nwl-dsi: Remove superfluous write to NWL_DSI_IRQ_MASK register

Maxime Ripard (8):
      drm/omap: plane: Fix zpos initial value mismatch
      drm/msm/mdp5: Remove redundant zpos initialisation
      drm/nouveau/kms: Remove redundant zpos initialisation
      drm/omap: plane: Remove redundant zpos initialisation
      drm/rcar: plane: Remove redundant zpos initialisation
      drm/sti: plane: Remove redundant zpos initialisation
      drm/sun4i: layer: Remove redundant zpos initialisation
      drm/omap: plane: Remove redundant color encoding and range initialisation

Melissa Wen (1):
      drm/v3d: centralize error handling when init scheduler fails

Nathan Chancellor (1):
      drm/stm: Avoid using val uninitialized in ltdc_set_ycbcr_config()

Nishanth Menon (1):
      drm/bridge: cdns-dsi: Make sure to to create proper aliases for dt

Noralf Trønnes (5):
      dt-bindings: display: add bindings for MIPI DBI compatible SPI panels
      drm/modes: Remove trailing whitespace
      drm/modes: Add of_get_drm_panel_display_mode()
      drm/mipi-dbi: Add driver_private member to struct mipi_dbi_dev
      drm/tiny: Add MIPI DBI compatible SPI driver

Rahul T R (1):
      drm/panel: simple: Initialize bpc in RK101II01D-CT panel descriptor

Raphael Gallais-Pou (1):
      drm/stm: ltdc: add support for CRC hashing feature

Thomas Zimmermann (5):
      fbdev: Improve performance of sys_fillrect()
      fbdev: Improve performance of sys_imageblit()
      fbdev: Remove trailing whitespaces from cfbimgblt.c
      fbdev: Improve performance of cfb_imageblit()
      drm: Add TODO item for optimizing format helpers

Tom Rix (1):
      drm/panfrost: cleanup comments

Tommy Haung (2):
      drm/aspeed: Update INTR_STS handling
      drm/aspeed: Add AST2600 chip support

Xin Ji (1):
      drm/bridge: anx7625: Fix release wrong workqueue

 .../bindings/display/panel/panel-mipi-dbi-spi.yaml | 126 +++++++
 Documentation/gpu/todo.rst                         |  47 ++-
 MAINTAINERS                                        |   8 +
 drivers/gpu/drm/aspeed/aspeed_gfx.h                |   1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |  15 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   6 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                  |   1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |   7 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   4 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |  14 +-
 drivers/gpu/drm/dp/drm_dp.c                        |  10 -
 drivers/gpu/drm/drm_atomic_state_helper.c          |  25 ++
 drivers/gpu/drm/drm_mode_object.c                  |  53 ++-
 drivers/gpu/drm/drm_modes.c                        |  51 ++-
 drivers/gpu/drm/drm_of.c                           |  17 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  16 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |   2 -
 drivers/gpu/drm/nouveau/include/nvif/list.h        | 353 ------------------
 drivers/gpu/drm/omapdrm/omap_plane.c               |  22 +-
 drivers/gpu/drm/panel/panel-simple.c               |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   2 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |   2 +-
 drivers/gpu/drm/panfrost/panfrost_issues.h         |   2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   2 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |   1 -
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |   1 -
 drivers/gpu/drm/solomon/ssd130x.c                  |   2 +-
 drivers/gpu/drm/sti/sti_cursor.c                   |   2 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |   2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   2 +-
 drivers/gpu/drm/sti/sti_plane.c                    |   6 -
 drivers/gpu/drm/sti/sti_plane.h                    |   1 -
 drivers/gpu/drm/stm/ltdc.c                         | 107 +++++-
 drivers/gpu/drm/stm/ltdc.h                         |   3 +
 drivers/gpu/drm/sun4i/sun4i_layer.c                |  16 +-
 drivers/gpu/drm/tegra/dp.c                         |  11 +-
 drivers/gpu/drm/tiny/Kconfig                       |  15 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              | 398 +++++++++++++++++++++
 drivers/gpu/drm/tiny/repaper.c                     |  24 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |   3 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |  40 +--
 drivers/video/fbdev/core/cfbimgblt.c               | 107 ++++--
 drivers/video/fbdev/core/sysfillrect.c             |  16 +-
 drivers/video/fbdev/core/sysimgblt.c               |  49 ++-
 include/drm/dp/drm_dp_helper.h                     |   4 +-
 include/drm/drm_mipi_dbi.h                         |   8 +
 include/drm/drm_mode_object.h                      |   7 +
 include/drm/drm_modes.h                            |   8 +
 50 files changed, 1051 insertions(+), 572 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/list.h
 create mode 100644 drivers/gpu/drm/tiny/panel-mipi-dbi.c
