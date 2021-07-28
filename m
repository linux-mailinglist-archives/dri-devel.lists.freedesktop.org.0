Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE23D934D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 18:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEDD6E162;
	Wed, 28 Jul 2021 16:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1568B6E162
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 16:36:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 809A33F;
 Wed, 28 Jul 2021 18:36:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627490195;
 bh=vFWdjKhAzYpI+lcOiQweUdWIWTJhMp6gk2toxBC/3Gg=;
 h=Date:From:To:Cc:Subject:From;
 b=RE52fL72JO1iJs5DoUp9kOKgOGY//gpVLY6yFg/IK0x0j3sBUNaQT97CYA3XlUvc9
 u6sQhLimY1vBye1yEdlnKuIdPmWtLXRJ7OiquKSec2+EDkDt1qkri2TltVNiE/BnHJ
 cv7XqnDgomBugk8kYjSYzFz6xGLo9TYFVrM0jjfk=
Date: Wed, 28 Jul 2021 19:36:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.15] R-Car DU fixes and improvements
Message-ID: <YQGHjOSOw2G4+A3x@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

The following changes since commit 15d27b15de965043d6f8e23bc7f34386fcd1a772:

  efi: sysfb_efi: fix build when EFI is not set (2021-07-27 11:52:51 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20210728

for you to fetch changes up to 6571a76af380290dd9a003a3bc90d4779ec4f8f8:

  drm: rcar-du: lvds: Use dev_err_probe() (2021-07-28 16:33:32 +0300)

----------------------------------------------------------------
- R-Car DU shutdown fixes
- R-Car DU conversion to bridge connector helper
- Misc small fixes

----------------------------------------------------------------
Colin Ian King (1):
      drm/bridge: make a const array static, makes object smaller

Laurent Pinchart (10):
      drm: rcar-du: Shutdown the display on system shutdown
      drm: rcar-du: Don't put reference to drm_device in rcar_du_remove()
      drm: rcar-du: Shutdown the display on remove
      drm/bridge: Centralize error message when bridge attach fails
      drm: bridge: dw-hdmi: Attach to next bridge if available
      drm: rcar-du: lvds: Convert to DRM panel bridge helper
      drm: rcar-du: dw-hdmi: Set output port number
      drm: rcar-du: Use drm_bridge_connector_init() helper
      drm: rcar-du: lvds: Don't set bridge driver_private field
      drm: rcar-du: lvds: Use dev_err_probe()

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   9 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   5 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  55 ++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  10 +-
 drivers/gpu/drm/bridge/tc358768.c                  |   2 +-
 drivers/gpu/drm/drm_bridge.c                       |  10 ++
 drivers/gpu/drm/exynos/exynos_dp.c                 |   5 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   5 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |   9 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |   5 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |   4 +-
 drivers/gpu/drm/imx/parallel-display.c             |   5 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   4 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                      |   1 -
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   9 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   5 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  11 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  26 ++++-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c             |   1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 126 +++------------------
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   5 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   5 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |   4 +-
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 |   4 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |   4 +-
 drivers/gpu/drm/tegra/rgb.c                        |   5 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |   4 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           |   4 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   4 +-
 include/drm/bridge/dw_hdmi.h                       |   2 +
 32 files changed, 134 insertions(+), 224 deletions(-)

-- 
Regards,

Laurent Pinchart
