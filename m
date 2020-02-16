Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A337C160673
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3536E2A3;
	Sun, 16 Feb 2020 21:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF1A6E288
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:03:41 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 965F52AF;
 Sun, 16 Feb 2020 22:03:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887019;
 bh=rU3SbdDMEjuujg6LbTmWM4OCg3B/YquZSfYw0bYDBkE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BfYfN7sBlJm+rtOC5qigH9IgL7CqpFZsKKI6h7xcCKALZmJJLj6afFbBoesC9oetH
 2vusUH6CWxiAL2HCf8O9zGfFxkRh5DRkuroaoCULWPDM1prMMRF7OrVs6SRpYSa+QC
 /LIV2AYNO8QBPeHDhSgaiqcXFn1xOe1f5g2wKfmo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 08/51] drm/bridge: dumb-vga-dac: Rename driver to
 simple-bridge
Date: Sun, 16 Feb 2020 23:02:25 +0200
Message-Id: <20200216210308.17312-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dumb-vga-dac driver can support simple DRM bridges without being
limited to VGA DACs. Rename it to simple-bridge.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/arm/configs/davinci_all_defconfig           |  2 +-
 arch/arm/configs/integrator_defconfig            |  2 +-
 arch/arm/configs/multi_v7_defconfig              |  2 +-
 arch/arm/configs/shmobile_defconfig              |  2 +-
 arch/arm/configs/sunxi_defconfig                 |  2 +-
 arch/arm/configs/versatile_defconfig             |  2 +-
 drivers/gpu/drm/bridge/Kconfig                   | 16 ++++++++--------
 drivers/gpu/drm/bridge/Makefile                  |  2 +-
 .../bridge/{dumb-vga-dac.c => simple-bridge.c}   |  2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)
 rename drivers/gpu/drm/bridge/{dumb-vga-dac.c => simple-bridge.c} (99%)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index 231f8973bbb2..b370958b0579 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -160,7 +160,7 @@ CONFIG_VIDEO_TVP514X=m
 CONFIG_VIDEO_ADV7343=m
 CONFIG_DRM=m
 CONFIG_DRM_TILCDC=m
-CONFIG_DRM_DUMB_VGA_DAC=m
+CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_TINYDRM=m
 CONFIG_TINYDRM_ST7586=m
 CONFIG_FB=y
diff --git a/arch/arm/configs/integrator_defconfig b/arch/arm/configs/integrator_defconfig
index 2f0a762dc3a0..a9755c501bec 100644
--- a/arch/arm/configs/integrator_defconfig
+++ b/arch/arm/configs/integrator_defconfig
@@ -55,7 +55,7 @@ CONFIG_SMC91X=y
 # CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_DRM=y
-CONFIG_DRM_DUMB_VGA_DAC=y
+CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_MATROX=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3f1b96dc7faa..59321917d035 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -667,11 +667,11 @@ CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
 CONFIG_DRM_PANEL_RAYDIUM_RM68200=m
 CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
 CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
-CONFIG_DRM_DUMB_VGA_DAC=m
 CONFIG_DRM_NXP_PTN3460=m
 CONFIG_DRM_PARADE_PS8622=m
 CONFIG_DRM_SII902X=m
 CONFIG_DRM_SII9234=m
+CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_TOSHIBA_TC358764=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index bda57cafa2bc..3d7e9a6ca85d 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -123,8 +123,8 @@ CONFIG_VIDEO_ADV7604=y
 CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
 CONFIG_DRM_RCAR_DU=y
-CONFIG_DRM_DUMB_VGA_DAC=y
 CONFIG_DRM_SII902X=y
+CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_FB_SH_MOBILE_LCDC=y
diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
index 3f5d727efc41..17958ff4a2e2 100644
--- a/arch/arm/configs/sunxi_defconfig
+++ b/arch/arm/configs/sunxi_defconfig
@@ -100,7 +100,7 @@ CONFIG_RC_DEVICES=y
 CONFIG_IR_SUNXI=y
 CONFIG_DRM=y
 CONFIG_DRM_SUN4I=y
-CONFIG_DRM_DUMB_VGA_DAC=y
+CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_FB_SIMPLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
index fe4d4b596585..767935337413 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -59,7 +59,7 @@ CONFIG_GPIO_PL061=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_ARM_VERSATILE=y
 CONFIG_DRM_PANEL_SIMPLE=y
-CONFIG_DRM_DUMB_VGA_DAC=y
+CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 20a439199cb8..10073ad88283 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -27,14 +27,6 @@ config DRM_CDNS_DSI
 	  Support Cadence DPI to DSI bridge. This is an internal
 	  bridge and is meant to be directly embedded in a SoC.
 
-config DRM_DUMB_VGA_DAC
-	tristate "Dumb VGA DAC Bridge support"
-	depends on OF
-	select DRM_KMS_HELPER
-	help
-	  Support for non-programmable RGB to VGA DAC bridges, such as ADI
-	  ADV7123, TI THS8134 and THS8135 or passive resistor ladder DACs.
-
 config DRM_LVDS_CODEC
 	tristate "Transparent LVDS encoders and decoders support"
 	depends on OF
@@ -110,6 +102,14 @@ config DRM_SII9234
 	  It is an I2C driver, that detects connection of MHL bridge
 	  and starts encapsulation of HDMI signal.
 
+config DRM_SIMPLE_BRIDGE
+	tristate "Simple DRM bridge support"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Support for non-programmable DRM bridges, such as ADI ADV7123, TI
+	  THS8134 and THS8135 or passive resistor ladder DACs.
+
 config DRM_THINE_THC63LVD1024
 	tristate "Thine THC63LVD1024 LVDS decoder bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index b0d5c3af0b5a..b6b2e7029a78 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
-obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
 obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
@@ -9,6 +8,7 @@ obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
 obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
 obj-$(CONFIG_DRM_SII902X) += sii902x.o
 obj-$(CONFIG_DRM_SII9234) += sii9234.o
+obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
 obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
 obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/simple-bridge.c
similarity index 99%
rename from drivers/gpu/drm/bridge/dumb-vga-dac.c
rename to drivers/gpu/drm/bridge/simple-bridge.c
index 7287be2d3220..00d810c99193 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -295,7 +295,7 @@ static struct platform_driver simple_bridge_driver = {
 	.probe	= simple_bridge_probe,
 	.remove	= simple_bridge_remove,
 	.driver		= {
-		.name		= "dumb-vga-dac",
+		.name		= "simple-bridge",
 		.of_match_table	= simple_bridge_match,
 	},
 };
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
