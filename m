Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B2D56237E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C02212AED6;
	Thu, 30 Jun 2022 19:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C43C12AED4;
 Thu, 30 Jun 2022 19:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656618678; x=1688154678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ebsbeet/qKPS0N7STHc4YMHVxGKSn1rQW2wO2CLxaEU=;
 b=c0CXU7Mb2muAZF0mFodx5sZvyj5isR6NmU8KBYS23SCjguTIzbT8yIr6
 WxELuPo1i2wX5P5B2wSw86rpPMBT/dZ7dCH0J6Mc+4ZQEWRA9OlJLBKsm
 oJPyqkH33Htghx+j+OBaszEZWJ8Ti2vcXJ5OY6Szmg/tM6qb4KlZhQl/L
 eG32WeHTZV/j1NwlKxcvTCsuql6kbMIfyroGmi5lSupk4recamgVjzcH9
 urX80dxB/lqlEiihi3xCumZor3AcwdBLDZolQgmgpKbsGN6gog7zbu3ev
 DGEI7x17XA4iThLaUzWOMYYX8YyjJ8hv3X2pDS8YX3K7ZDmr3m1uyzzUV Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="271221769"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="271221769"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 12:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="618093643"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.161])
 by orsmga008.jf.intel.com with SMTP; 30 Jun 2022 12:51:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 30 Jun 2022 22:51:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm: Clean up drm_crtc.h
Date: Thu, 30 Jun 2022 22:51:10 +0300
Message-Id: <20220630195114.17407-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Eliminate unnecessary includes from drm_crtc.h to avoid
pointless rebuilds of the entire universe when touching
some random header.

v2: Half the series already merged
    Fix up a few allmodconfig fails not spotted earlier
    Split the vmwgfx change into its own patch to make it
    more prominent

Ville Syrjälä (4):
  drm/vmwgfx: Stop using 'TRUE'
  drm: Remove linux/fb.h from drm_crtc.h
  drm: Remove linux/media-bus-format.h from drm_crtc.h
  drm: Remove linux/i2c.h from drm_crtc.h

 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c  | 2 ++
 drivers/gpu/drm/armada/armada_510.c                   | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c        | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c      | 1 +
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c   | 1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c              | 1 +
 drivers/gpu/drm/bridge/chrontel-ch7033.c              | 1 +
 drivers/gpu/drm/bridge/display-connector.c            | 1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                      | 1 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c           | 1 +
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c           | 1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c          | 1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c   | 2 ++
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c       | 1 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c          | 1 +
 drivers/gpu/drm/bridge/ite-it66121.c                  | 1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c              | 1 +
 drivers/gpu/drm/bridge/lontium-lt9211.c               | 1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c               | 2 ++
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c            | 1 +
 drivers/gpu/drm/bridge/nwl-dsi.c                      | 1 +
 drivers/gpu/drm/bridge/sii902x.c                      | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c             | 1 +
 drivers/gpu/drm/bridge/tc358764.c                     | 1 +
 drivers/gpu/drm/bridge/tc358767.c                     | 1 +
 drivers/gpu/drm/bridge/tc358775.c                     | 1 +
 drivers/gpu/drm/bridge/ti-dlpc3433.c                  | 1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c                 | 1 +
 drivers/gpu/drm/bridge/ti-tfp410.c                    | 1 +
 drivers/gpu/drm/display/drm_dp_helper.c               | 1 +
 drivers/gpu/drm/drm_bridge.c                          | 1 +
 drivers/gpu/drm/drm_connector.c                       | 1 +
 drivers/gpu/drm/drm_mipi_dbi.c                        | 1 +
 drivers/gpu/drm/drm_modes.c                           | 1 +
 drivers/gpu/drm/drm_of.c                              | 2 ++
 drivers/gpu/drm/exynos/exynos_dp.c                    | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dpi.c               | 1 +
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c          | 1 +
 drivers/gpu/drm/i2c/tda998x_drv.c                     | 1 +
 drivers/gpu/drm/i915/display/intel_backlight.c        | 1 +
 drivers/gpu/drm/imx/dcss/dcss-drv.c                   | 1 +
 drivers/gpu/drm/imx/imx-ldb.c                         | 1 +
 drivers/gpu/drm/imx/parallel-display.c                | 1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c             | 1 +
 drivers/gpu/drm/kmb/kmb_dsi.c                         | 1 +
 drivers/gpu/drm/mcde/mcde_clk_div.c                   | 1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                    | 1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c                     | 1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                     | 1 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c              | 1 +
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 +
 drivers/gpu/drm/panel/panel-raydium-rm67191.c         | 1 +
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c           | 1 +
 drivers/gpu/drm/panel/panel-simple.c                  | 2 ++
 drivers/gpu/drm/pl111/pl111_display.c                 | 1 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c             | 1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                   | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c          | 1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c               | 1 +
 drivers/gpu/drm/sti/sti_compositor.c                  | 1 +
 drivers/gpu/drm/sti/sti_gdp.c                         | 1 +
 drivers/gpu/drm/sti/sti_hda.c                         | 1 +
 drivers/gpu/drm/sti/sti_hdmi.c                        | 1 +
 drivers/gpu/drm/sti/sti_hqvdp.c                       | 1 +
 drivers/gpu/drm/stm/ltdc.c                            | 1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c                | 1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c                    | 1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.h                    | 1 +
 drivers/gpu/drm/tidss/tidss_dispc.c                   | 1 +
 drivers/gpu/drm/tilcdc/tilcdc_panel.c                 | 1 +
 drivers/gpu/drm/vc4/vc4_dpi.c                         | 1 +
 drivers/gpu/drm/vc4/vc4_drv.h                         | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                    | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                   | 2 +-
 include/drm/drm_crtc.h                                | 3 ---
 include/drm/drm_encoder_slave.h                       | 2 ++
 include/drm/drm_fb_helper.h                           | 1 +
 77 files changed, 82 insertions(+), 4 deletions(-)

-- 
2.35.1

