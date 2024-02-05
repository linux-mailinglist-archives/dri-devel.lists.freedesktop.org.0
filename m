Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB18493D9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 07:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D801010FA4F;
	Mon,  5 Feb 2024 06:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="x3dH7FJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0418610FA4F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 06:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=OUKdFm+15peBkbofPBi/XRisRCX0jcO1A2H6q2dDwwo=; b=x3dH7FJvdx/opKptaY8+EdxqBW
 rD2DV4pyr76BNVLlHQB6fR9QQEwQswepEPfymOW5klZly7gtFN5RsxLj1koRdVth7jtf2Vop+MIIA
 LUP83aXHTjl9sGsG620iBrZq7uW908gkw6+jDXW50rspdL+j4hx8DWz40gBArQ8XeLxJf6PJUJ297
 /lMBOVrUi+M1nn8yzh1+6QpZ3d9UJNsYNtQM0++cgI6p/mXyA0F4naBrIgSyAtGcLj/CSQQ8R04dO
 RZZybiIqVCfpeLOYWr2Nsqth2Bg47AO3sKVkbgswVF9r7B21Xj91aHXSpKJMyIlhdIfhxzYmwLnHY
 6vL2PVtQ==;
Received: from [50.53.50.0] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rWsRk-00000002AS9-1vFf; Mon, 05 Feb 2024 06:27:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v2] drm/panel: re-alphabetize the menu list
Date: Sun,  4 Feb 2024 22:27:08 -0800
Message-ID: <20240205062711.3513-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few of the DRM_PANEL entries have become out of alphabetical order,
so move them around a bit to restore alpha order.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Aradhya Bhatia <a-bhatia1@ti.com>
---
v2: rebase, move more driver entries around

Aradhya Bhatia <a-bhatia1@ti.com> had responded with Reviewed-by:
for v1, but I mode quite a few additions in v2 so I didn't include
that R-B: here.

 drivers/gpu/drm/panel/Kconfig |  202 ++++++++++++++++----------------
 1 file changed, 101 insertions(+), 101 deletions(-)

diff -- a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -76,53 +76,6 @@ config DRM_PANEL_BOE_TV101WUM_NL6
 	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
 	  45NA WUXGA PANEL DSI Video Mode panel
 
-config DRM_PANEL_DSI_CM
-	tristate "Generic DSI command mode panels"
-	depends on OF
-	depends on DRM_MIPI_DSI
-	depends on BACKLIGHT_CLASS_DEVICE
-	help
-	  DRM panel driver for DSI command mode panels with support for
-	  embedded and external backlights.
-
-config DRM_PANEL_LVDS
-	tristate "Generic LVDS panel driver"
-	depends on OF
-	depends on BACKLIGHT_CLASS_DEVICE
-	select VIDEOMODE_HELPERS
-	help
-	  This driver supports LVDS panels that don't require device-specific
-	  handling of power supplies or control signals. It implements automatic
-	  backlight handling if the panel is attached to a backlight controller.
-
-config DRM_PANEL_SIMPLE
-	tristate "support for simple panels (other than eDP ones)"
-	depends on OF
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on PM
-	select VIDEOMODE_HELPERS
-	help
-	  DRM panel driver for dumb non-eDP panels that need at most a regulator
-	  and a GPIO to be powered up. Optionally a backlight can be attached so
-	  that it can be automatically turned off when the panel goes into a
-	  low power state.
-
-config DRM_PANEL_EDP
-	tristate "support for simple Embedded DisplayPort panels"
-	depends on OF
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on PM
-	select VIDEOMODE_HELPERS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_DP_AUX_BUS
-	select DRM_KMS_HELPER
-	help
-	  DRM panel driver for dumb eDP panels that need at most a regulator and
-	  a GPIO to be powered up. Optionally a backlight can be attached so
-	  that it can be automatically turned off when the panel goes into a
-	  low power state.
-
 config DRM_PANEL_EBBG_FT8719
 	tristate "EBBG FT8719 panel driver"
 	depends on OF
@@ -162,6 +115,25 @@ config DRM_PANEL_FEIYANG_FY07024DI26A30D
 	  Say Y if you want to enable support for panels based on the
 	  Feiyang FY07024DI26A30-D MIPI-DSI interface.
 
+config DRM_PANEL_DSI_CM
+	tristate "Generic DSI command mode panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM panel driver for DSI command mode panels with support for
+	  embedded and external backlights.
+
+config DRM_PANEL_LVDS
+	tristate "Generic LVDS panel driver"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	help
+	  This driver supports LVDS panels that don't require device-specific
+	  handling of power supplies or control signals. It implements automatic
+	  backlight handling if the panel is attached to a backlight controller.
+
 config DRM_PANEL_HIMAX_HX8394
 	tristate "HIMAX HX8394 MIPI-DSI LCD panels"
 	depends on OF
@@ -251,17 +223,6 @@ config DRM_PANEL_JADARD_JD9365DA_H3
 	  WXGA MIPI DSI panel. The panel support TFT dot matrix LCD with
 	  800RGBx1280 dots at maximum.
 
-config DRM_PANEL_JDI_LT070ME05000
-	tristate "JDI LT070ME05000 WUXGA DSI panel"
-	depends on OF
-	depends on DRM_MIPI_DSI
-	depends on BACKLIGHT_CLASS_DEVICE
-	help
-	  Say Y here if you want to enable support for JDI DSI video mode
-	  panel as found in Google Nexus 7 (2013) devices.
-	  The panel has a 1200(RGB)×1920 (WUXGA) resolution and uses
-	  24 bit per pixel.
-
 config DRM_PANEL_JDI_LPM102A188A
 	tristate "JDI LPM102A188A DSI panel"
 	depends on OF && GPIOLIB
@@ -273,6 +234,17 @@ config DRM_PANEL_JDI_LPM102A188A
 	  The panel has a 2560×1800 resolution. It provides a MIPI DSI interface
 	  to the host.
 
+config DRM_PANEL_JDI_LT070ME05000
+	tristate "JDI LT070ME05000 WUXGA DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for JDI DSI video mode
+	  panel as found in Google Nexus 7 (2013) devices.
+	  The panel has a 1200(RGB)×1920 (WUXGA) resolution and uses
+	  24 bit per pixel.
+
 config DRM_PANEL_JDI_R63452
 	tristate "JDI R63452 Full HD DSI panel"
 	depends on OF
@@ -326,12 +298,6 @@ config DRM_PANEL_LEADTEK_LTK500HD1829
 	  24 bit RGB per pixel. It provides a MIPI DSI interface to
 	  the host and has a built-in LED backlight.
 
-config DRM_PANEL_SAMSUNG_LD9040
-	tristate "Samsung LD9040 RGB/SPI panel"
-	depends on OF && SPI
-	depends on BACKLIGHT_CLASS_DEVICE
-	select VIDEOMODE_HELPERS
-
 config DRM_PANEL_LG_LB035Q02
 	tristate "LG LB035Q024573 RGB panel"
 	depends on GPIOLIB && OF && SPI
@@ -359,6 +325,17 @@ config DRM_PANEL_MAGNACHIP_D53E6EA8966
 	  with the Magnachip D53E6EA8966 panel IC. This panel receives
 	  video data via DSI but commands via 9-bit SPI using DBI.
 
+config DRM_PANEL_MANTIX_MLAF057WE51
+	tristate "Mantix MLAF057WE51-X MIPI-DSI LCD panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Mantix
+	  MLAF057WE51-X MIPI DSI panel as e.g. used in the Librem 5. It
+	  has a resolution of 720x1440 pixels, a built in backlight and touch
+	  controller.
+
 config DRM_PANEL_NEC_NL8048HL11
 	tristate "NEC NL8048HL11 RGB panel"
 	depends on GPIOLIB && OF && SPI
@@ -447,17 +424,6 @@ config DRM_PANEL_NOVATEK_NT39016
 	  Say Y here if you want to enable support for the panels built
 	  around the Novatek NT39016 display controller.
 
-config DRM_PANEL_MANTIX_MLAF057WE51
-	tristate "Mantix MLAF057WE51-X MIPI-DSI LCD panel"
-	depends on OF
-	depends on DRM_MIPI_DSI
-	depends on BACKLIGHT_CLASS_DEVICE
-	help
-	  Say Y here if you want to enable support for the Mantix
-	  MLAF057WE51-X MIPI DSI panel as e.g. used in the Librem 5. It
-	  has a resolution of 720x1440 pixels, a built in backlight and touch
-	  controller.
-
 config DRM_PANEL_OLIMEX_LCD_OLINUXINO
 	tristate "Olimex LCD-OLinuXino panel"
 	depends on OF
@@ -554,6 +520,12 @@ config DRM_PANEL_RONBO_RB070D30
 	  Say Y here if you want to enable support for Ronbo Electronics
 	  RB070D30 1024x600 DSI panel.
 
+config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
+	tristate "Samsung AMS452EF01 panel with S6E88A0 DSI video mode controller"
+	depends on OF
+	select DRM_MIPI_DSI
+	select VIDEOMODE_HELPERS
+
 config DRM_PANEL_SAMSUNG_ATNA33XC20
 	tristate "Samsung ATNA33XC20 eDP panel"
 	depends on OF
@@ -577,6 +549,12 @@ config DRM_PANEL_SAMSUNG_DB7430
 	  DB7430 DPI display controller used in such devices as the
 	  LMS397KF04 480x800 DPI panel.
 
+config DRM_PANEL_SAMSUNG_LD9040
+	tristate "Samsung LD9040 RGB/SPI panel"
+	depends on OF && SPI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+
 config DRM_PANEL_SAMSUNG_S6D16D0
 	tristate "Samsung S6D16D0 DSI video mode panel"
 	depends on OF
@@ -642,12 +620,6 @@ config DRM_PANEL_SAMSUNG_S6E63M0_DSI
 	  Say Y here if you want to be able to access the Samsung
 	  S6E63M0 panel using DSI.
 
-config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
-	tristate "Samsung AMS452EF01 panel with S6E88A0 DSI video mode controller"
-	depends on OF
-	select DRM_MIPI_DSI
-	select VIDEOMODE_HELPERS
-
 config DRM_PANEL_SAMSUNG_S6E8AA0
 	tristate "Samsung S6E8AA0 DSI video mode panel"
 	depends on OF
@@ -746,15 +718,6 @@ config DRM_PANEL_SITRONIX_ST7789V
 	  Say Y here if you want to enable support for the Sitronix
 	  ST7789V controller for 240x320 LCD panels
 
-config DRM_PANEL_SYNAPTICS_R63353
-	tristate "Synaptics R63353-based panels"
-	depends on OF
-	depends on DRM_MIPI_DSI
-	depends on BACKLIGHT_CLASS_DEVICE
-	help
-	  Say Y if you want to enable support for panels based on the
-	  Synaptics R63353 controller.
-
 config DRM_PANEL_SONY_ACX565AKM
 	tristate "Sony ACX565AKM panel"
 	depends on GPIOLIB && OF && SPI
@@ -794,6 +757,43 @@ config DRM_PANEL_STARTEK_KD070FHFID015
 	  with a resolution of 1024 x 600 pixels. It provides a MIPI DSI interface to
 	  the host, a built-in LED backlight and touch controller.
 
+config DRM_PANEL_EDP
+	tristate "support for simple Embedded DisplayPort panels"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on PM
+	select VIDEOMODE_HELPERS
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_DP_AUX_BUS
+	select DRM_KMS_HELPER
+	help
+	  DRM panel driver for dumb eDP panels that need at most a regulator and
+	  a GPIO to be powered up. Optionally a backlight can be attached so
+	  that it can be automatically turned off when the panel goes into a
+	  low power state.
+
+config DRM_PANEL_SIMPLE
+	tristate "support for simple panels (other than eDP ones)"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on PM
+	select VIDEOMODE_HELPERS
+	help
+	  DRM panel driver for dumb non-eDP panels that need at most a regulator
+	  and a GPIO to be powered up. Optionally a backlight can be attached so
+	  that it can be automatically turned off when the panel goes into a
+	  low power state.
+
+config DRM_PANEL_SYNAPTICS_R63353
+	tristate "Synaptics R63353-based panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y if you want to enable support for panels based on the
+	  Synaptics R63353 controller.
+
 config DRM_PANEL_TDO_TL070WSH30
 	tristate "TDO TL070WSH30 DSI panel"
 	depends on OF
@@ -837,6 +837,17 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
 	  Video Mode panel
 
+config DRM_PANEL_VISIONOX_R66451
+	tristate "Visionox R66451"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
+	help
+	  Say Y here if you want to enable support for Visionox
+	  R66451 1080x2340 AMOLED DSI panel.
+
 config DRM_PANEL_VISIONOX_RM69299
 	tristate "Visionox RM69299"
 	depends on OF
@@ -854,17 +865,6 @@ config DRM_PANEL_VISIONOX_VTDR6130
 	  Say Y here if you want to enable support for Visionox
 	  VTDR6130 1080x2400 AMOLED DSI panel.
 
-config DRM_PANEL_VISIONOX_R66451
-	tristate "Visionox R66451"
-	depends on OF
-	depends on DRM_MIPI_DSI
-	depends on BACKLIGHT_CLASS_DEVICE
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	help
-	  Say Y here if you want to enable support for Visionox
-	  R66451 1080x2340 AMOLED DSI panel.
-
 config DRM_PANEL_WIDECHIPS_WS2401
 	tristate "Widechips WS2401 DPI panel driver"
 	depends on SPI && GPIOLIB
