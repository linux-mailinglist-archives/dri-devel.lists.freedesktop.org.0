Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C35F7746
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 13:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E81510E3F3;
	Fri,  7 Oct 2022 11:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1780010E3ED
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 11:16:04 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MkQjH57yRzDs0B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1665141363; bh=zIWt3ZBSc+bV3Dn+srHiqJcjJphD9net3cqhSzXY4aI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UaYDPwaX47suEuEEOedexglItVJjS0nn+81B4FOiqhO6msYm9qVxSJowPUCgug7Rc
 Sm8+C5QNKhk1iaYBXSIXWrb2fEamURu3brr/JYlJBl+zSFb3jOCkmpU2G0PQArf/ul
 +mvMZFLA7SRCUkcNCciT7MuosaeeLUqtHRvCZg2U=
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MkQjG6nkKz9sBk;
 Fri,  7 Oct 2022 11:16:02 +0000 (UTC)
X-Riseup-User-ID: BB06A70AB150F67769D058BB21ED960A0426733427FF28DEBC2691D78F1D0B25
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MkQjD6G5wz5vRK;
 Fri,  7 Oct 2022 11:16:00 +0000 (UTC)
From: Nia Espera <a5b6@riseup.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drivers: gpu: drm: remove support for sofef00 driver
 on s6e3fc2x01 panel
Date: Fri,  7 Oct 2022 13:14:45 +0200
Message-Id: <20221007111442.51481-3-a5b6@riseup.net>
In-Reply-To: <20221007111442.51481-1-a5b6@riseup.net>
References: <20221007111442.51481-1-a5b6@riseup.net>
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
Cc: linux-arm-msm@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Nia Espera <a5b6@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removes functionality from sofef00 panel driver which allowed it to
drive the s6e3fc2x01 panel

Signed-off-by: Nia Espera <a5b6@riseup.net>
Reviewed-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/gpu/drm/panel/Kconfig                 |  6 +++---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 18 ------------------
 2 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ee62d5d8828a..62b9cb6acd05 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -547,16 +547,16 @@ config DRM_PANEL_SAMSUNG_S6E8AA0
 	select VIDEOMODE_HELPERS
 
 config DRM_PANEL_SAMSUNG_SOFEF00
-	tristate "Samsung sofef00/s6e3fc2x01 OnePlus 6/6T DSI cmd mode panels"
+	tristate "Samsung sofef00 OnePlus 6 DSI cmd mode panel"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 	help
 	  Say Y or M here if you want to enable support for the Samsung AMOLED
-	  command mode panels found in the OnePlus 6/6T smartphones.
+	  command mode panel found in the OnePlus 6 smartphone.
 
-	  The panels are 2280x1080@60Hz and 2340x1080@60Hz respectively
+	  The panel is 2280x1080@60Hz
 
 config DRM_PANEL_SAMSUNG_S6E3FC2X01
 	tristate "Samsung s6e3fc2x01 OnePlus 6T DSI cmd mode panel"
diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index bd02af81a4fe..68e58b9b8c5c 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -181,20 +181,6 @@ static const struct drm_display_mode enchilada_panel_mode = {
 	.height_mm = 145,
 };
 
-static const struct drm_display_mode fajita_panel_mode = {
-	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
-	.hdisplay = 1080,
-	.hsync_start = 1080 + 72,
-	.hsync_end = 1080 + 72 + 16,
-	.htotal = 1080 + 72 + 16 + 36,
-	.vdisplay = 2340,
-	.vsync_start = 2340 + 32,
-	.vsync_end = 2340 + 32 + 4,
-	.vtotal = 2340 + 32 + 4 + 18,
-	.width_mm = 68,
-	.height_mm = 145,
-};
-
 static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
@@ -327,10 +313,6 @@ static const struct of_device_id sofef00_panel_of_match[] = {
 		.compatible = "samsung,sofef00",
 		.data = &enchilada_panel_mode,
 	},
-	{ // OnePlus 6T / fajita
-		.compatible = "samsung,s6e3fc2x01",
-		.data = &fajita_panel_mode,
-	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sofef00_panel_of_match);
-- 
2.38.0

