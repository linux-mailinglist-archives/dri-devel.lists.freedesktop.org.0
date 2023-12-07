Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9C0808098
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 07:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E4D10E699;
	Thu,  7 Dec 2023 06:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EC710E699
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 06:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=R8Tz0ZbEyy0DXpBkW+ZOOwAaU3VEmU//8yJBfcZnfeY=; b=Z0x538Ac0beUwpb7agdXsSGE9H
 mQHIG+4sbqDr2UFVsfrZzrYnLtY2NuizN23dxyOIB7tIaEayNDJFbR3xlTLSFJsR2pJHPsyLSir8B
 uQSeordsmskXYviR+hJWOqOMDnvsLTeZViTF/QWGdv/rIba205v15aylS2+yO2eI8rrRHMS4JDw+Q
 zBvDIcCMc0rvrhcxFGlcvYu2SAw8S1F8HyBreq8DGEAg5qsg1+66+zTm/Zph+wy6fBG0CT8xpuCfD
 W++dNyCUk6E5GWW91tKbGzOQRaYcDaH3DZGjXhbSTh2olTLItazGA2ByAebPrf7hsfa5z7h78hvwx
 0vq47uIw==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rB7mM-00ByRT-28; Thu, 07 Dec 2023 06:22:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: re-alphabetize the menu list
Date: Wed,  6 Dec 2023 22:22:33 -0800
Message-ID: <20231207062233.5318-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
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
---
 drivers/gpu/drm/panel/Kconfig |   90 ++++++++++++++++----------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff -- a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -95,34 +95,6 @@ config DRM_PANEL_LVDS
 	  handling of power supplies or control signals. It implements automatic
 	  backlight handling if the panel is attached to a backlight controller.
 
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
@@ -317,12 +289,6 @@ config DRM_PANEL_LEADTEK_LTK500HD1829
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
@@ -350,6 +316,17 @@ config DRM_PANEL_MAGNACHIP_D53E6EA8966
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
@@ -438,17 +415,6 @@ config DRM_PANEL_NOVATEK_NT39016
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
@@ -566,6 +532,12 @@ config DRM_PANEL_SAMSUNG_DB7430
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
@@ -774,6 +746,34 @@ config DRM_PANEL_STARTEK_KD070FHFID015
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
 config DRM_PANEL_TDO_TL070WSH30
 	tristate "TDO TL070WSH30 DSI panel"
 	depends on OF
