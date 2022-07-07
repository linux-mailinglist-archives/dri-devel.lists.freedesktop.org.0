Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6619569B52
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 09:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047D311354A;
	Thu,  7 Jul 2022 07:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C7811354A;
 Thu,  7 Jul 2022 07:13:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AAE7D220CE;
 Thu,  7 Jul 2022 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657178029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H5Fpj6taXEqqzTlnc3rO+PrVg9z7mrVT7p0njRsBweo=;
 b=daXf8SM/qIB9WxdBBCnUFMbeVXUhn5cW5YGn2DBLmizmzd9SWukQRmC0JPcwfSq8t7tV+q
 2SxQZnIdAMUO4+awg9nUhWiOcKGA8QVCv6yfeUKAtk+MHSeaju0MoxHsU7/cIkLr4GCZVI
 +sIfuiY307NmkqSplY6f8rc0IVmFb0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657178029;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H5Fpj6taXEqqzTlnc3rO+PrVg9z7mrVT7p0njRsBweo=;
 b=wdasBr9HDTHvhRMn3oUcEYviL88h8J0CXkD3W8uqc3RLabD1Rkue7zpjf0agAqR0kwjAyg
 bVISvNiel+1ye/Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E2AB13A33;
 Thu,  7 Jul 2022 07:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id desIGq2HxmK9UQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Jul 2022 07:13:49 +0000
Date: Thu, 7 Jul 2022 09:13:47 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <YsaHq1pvE699NtOM@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi Dave and Daniel,

here's the PR for drm-misc-next.

Best regards
Thomas

drm-misc-next-2022-07-07:
drm-misc-next for v5.20:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

 * crtc: Remove unnessary include statements from drm_crtc.h, plus
   fallout in drivers

 * edid: More use of struct drm_edid; implement HF-EEODB extension

Driver Changes:

 * bridge:
   * anx7625: Implement HDP timeout via callback; Cleanups
   * fsl-ldb: Drop DE flip; Modesetting fixes
   * imx: Depend on ARCH_MXC
   * sil8620: Fix off-by-one
   * ti-sn65dsi86: Convert to atomic modesetting

 * ingenic: Fix display at maximum resolution

 * panel:
   * simple: Add support for HannStar HSD101PWW2, plus DT bindings; Add
     support for ETML0700Y5DHA, plus DT bindings

 * rockchip: Fixes

 * vc4: Cleanups

 * vmwgfx: Cleanups
The following changes since commit 6fb5ee7cec06266a29f25ecc01a23b9d107f64e1:

  iosys-map: Add per-word write (2022-06-29 17:42:28 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-07-07

for you to fetch changes up to 3915f8bddefda1c914d5c3149d329819a988761f:

  drm: xlnx: add <linux/io.h> for readl/writel (2022-07-06 22:54:51 +0300)

----------------------------------------------------------------
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

 * crtc: Remove unnessary include statements from drm_crtc.h, plus
   fallout in drivers

 * edid: More use of struct drm_edid; implement HF-EEODB extension

Driver Changes:

 * bridge:
   * anx7625: Implement HDP timeout via callback; Cleanups
   * fsl-ldb: Drop DE flip; Modesetting fixes
   * imx: Depend on ARCH_MXC
   * sil8620: Fix off-by-one
   * ti-sn65dsi86: Convert to atomic modesetting

 * ingenic: Fix display at maximum resolution

 * panel:
   * simple: Add support for HannStar HSD101PWW2, plus DT bindings; Add
     support for ETML0700Y5DHA, plus DT bindings

 * rockchip: Fixes

 * vc4: Cleanups

 * vmwgfx: Cleanups

----------------------------------------------------------------
Anton Bambura (1):
      dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03

Brian Norris (1):
      drm/rockchip: vop: Don't crash for invalid duplicate_state()

Christophe JAILLET (1):
      drm/rockchip: Fix an error handling path rockchip_dp_probe()

Geert Uytterhoeven (1):
      drm/bridge: imx: i.MX8 bridge drivers should depend on ARCH_MXC

Hangyu Hua (1):
      drm: bridge: sii8620: fix possible off-by-one

Hsin-Yi Wang (4):
      drm/bridge: anx7625: Convert to devm_i2c_new_dummy_device()
      drm/bridge: anx7625: use pm_runtime_force_suspend(resume)
      drm/bridge: anx7625: Fix NULL pointer crash when using edp-panel
      drm/bridge: anx7625: Add wait_hpd_asserted() callback

Jani Nikula (10):
      drm/edid: move drm_connector_update_edid_property() to drm_edid.c
      drm/edid: convert drm_connector_update_edid_property() to struct drm_edid
      drm/edid: clean up connector update error handling and debug logging
      drm/edid: abstract debugfs override EDID set/reset
      drm/edid: add drm_edid_connector_update()
      drm/probe-helper: add drm_connector_helper_get_modes()
      drm/edid: add drm_edid_raw() to access the raw EDID data
      drm/edid: do invalid block filtering in-place
      drm/edid: add HF-EEODB support to EDID read and allocation
      drm/edid: take HF-EEODB extension count into account

Liu Ying (2):
      drm/bridge: fsl-ldb: Fix mode clock rate validation
      drm/bridge: fsl-ldb: Enable split mode for LVDS dual link

Marco Felsch (2):
      dt-bindings: display: simple: add EDT ETML0700Y5DHA panel
      drm/panel: simple: add ETML0700Y5DHA panel

Marek Vasut (1):
      drm: bridge: ldb: Drop DE flip from Freescale i.MX8MP LDB bridge

Paul Cercueil (1):
      drm/ingenic: Use the highest possible DMA burst size

Randy Dunlap (1):
      drm: xlnx: add <linux/io.h> for readl/writel

Sam Ravnborg (1):
      drm/bridge: ti-sn65dsi86: Use atomic variants of drm_bridge_funcs

Svyatoslav Ryhel (2):
      dt-bindings: display: simple: Add HannStar HSD101PWW2
      drm/panel: simple: Add support for HannStar HSD101PWW2 panel

Tom Rix (1):
      drm/vc4: change vc4_dma_range_matches from a global to static

Ville Syrjälä (5):
      drm: Remove unnecessary junk from drm_crtc.h
      drm/vmwgfx: Stop using 'TRUE'
      drm: Remove linux/fb.h from drm_crtc.h
      drm: Remove linux/media-bus-format.h from drm_crtc.h
      drm: Remove linux/i2c.h from drm_crtc.h

 .../bindings/display/panel/panel-simple.yaml       |   4 +
 .../bindings/display/panel/sharp,lq101r1sx01.yaml  |   7 +-
 .../gpu/drm/arm/display/komeda/komeda_pipeline.c   |   2 +
 drivers/gpu/drm/armada/armada_510.c                |   1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |   1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 179 ++++------
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |   1 +
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |   1 +
 drivers/gpu/drm/bridge/display-connector.c         |   1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  22 +-
 drivers/gpu/drm/bridge/imx/Kconfig                 |   4 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |   1 +
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c        |   1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c       |   1 +
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   2 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |   1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |   1 +
 drivers/gpu/drm/bridge/ite-it66121.c               |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   1 +
 drivers/gpu/drm/bridge/lontium-lt9211.c            |   1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   2 +
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   1 +
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   1 +
 drivers/gpu/drm/bridge/sii902x.c                   |   1 +
 drivers/gpu/drm/bridge/sil-sii8620.c               |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   1 +
 drivers/gpu/drm/bridge/tc358764.c                  |   1 +
 drivers/gpu/drm/bridge/tc358767.c                  |   1 +
 drivers/gpu/drm/bridge/tc358775.c                  |   1 +
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  23 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   1 +
 drivers/gpu/drm/display/drm_dp_helper.c            |   1 +
 drivers/gpu/drm/drm_bridge.c                       |   1 +
 drivers/gpu/drm/drm_connector.c                    |  75 +---
 drivers/gpu/drm/drm_crtc_internal.h                |   5 +-
 drivers/gpu/drm/drm_debugfs.c                      |  21 +-
 drivers/gpu/drm/drm_edid.c                         | 376 ++++++++++++++++++---
 drivers/gpu/drm/drm_mipi_dbi.c                     |   1 +
 drivers/gpu/drm/drm_modes.c                        |   1 +
 drivers/gpu/drm/drm_of.c                           |   2 +
 drivers/gpu/drm/drm_probe_helper.c                 |  34 ++
 drivers/gpu/drm/exynos/exynos_dp.c                 |   1 +
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |   1 +
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |   1 +
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   1 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |   1 +
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |   1 +
 drivers/gpu/drm/imx/imx-ldb.c                      |   1 +
 drivers/gpu/drm/imx/parallel-display.c             |   1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  11 +-
 drivers/gpu/drm/ingenic/ingenic-drm.h              |   3 +
 drivers/gpu/drm/kmb/kmb_dsi.c                      |   1 +
 drivers/gpu/drm/mcde/mcde_clk_div.c                |   1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |   1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   1 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |   1 +
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |   1 +
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |   1 +
 drivers/gpu/drm/panel/panel-simple.c               |  59 ++++
 drivers/gpu/drm/pl111/pl111_display.c              |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |   1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  10 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   3 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   1 +
 drivers/gpu/drm/sti/sti_compositor.c               |   1 +
 drivers/gpu/drm/sti/sti_gdp.c                      |   1 +
 drivers/gpu/drm/sti/sti_hda.c                      |   1 +
 drivers/gpu/drm/sti/sti_hdmi.c                     |   1 +
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   1 +
 drivers/gpu/drm/stm/ltdc.c                         |   1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.h                 |   1 +
 drivers/gpu/drm/tidss/tidss_dispc.c                |   1 +
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |   1 +
 drivers/gpu/drm/vc4/vc4_dpi.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_drv.c                      |   2 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   1 +
 include/drm/drm_connector.h                        |   6 +-
 include/drm/drm_crtc.h                             |  11 -
 include/drm/drm_edid.h                             |   3 +
 include/drm/drm_encoder_slave.h                    |   2 +
 include/drm/drm_fb_helper.h                        |   1 +
 include/drm/drm_probe_helper.h                     |   1 +
 95 files changed, 643 insertions(+), 299 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
