Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B9D80B25F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 07:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A4C10EB64;
	Sat,  9 Dec 2023 06:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D4610EB6A
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 06:37:39 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9B93D87185;
 Sat,  9 Dec 2023 07:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1702103858;
 bh=MOTcAFz5O3XHCz6fvyNTnvT4+8NExjHejdjjMnKIH7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KjAcCKW38n+YHU6Uiu2F0GNfXC5sXAEwCn8CkckDSDFIwIYXkl2ixrkoX5kTkZcrH
 tlpReJI7tzU6pKjH07DJR01yLlTUsApYbqTd/0TCmBbdCZDE7+km8+gtoi/eQW2luc
 lKtBO7zqRuSIolAAGwmBOLp1h9riNmy4md83h80ox3FLqCLsJLT/3kS3tOhWIVAr+P
 9wUdwVMsLb1rZR4MjBhI9g1jYhO6Xn0tawL2Go9klfeXXBwtbUT52v8RxvC6MTce/B
 caSSk+Md0gf2/4BDacwXoRCtSoQzPQRUkjNQJB2Oqw12wjO2iW/ohHGZJDMqxJxwUH
 M0usZxeOIILbg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/panel: simple: Add AUO G156HAN04.0 LVDS display
 support
Date: Sat,  9 Dec 2023 07:37:00 +0100
Message-ID: <20231209063714.1381913-2-marex@denx.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231209063714.1381913-1-marex@denx.de>
References: <20231209063714.1381913-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Elmar Albert <ealbert@data-modul.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Elmar Albert <ealbert@data-modul.com>

G156HAN04.0 is a Color Active Matrix Liquid Crystal Display composed of
a TFT LCD panel, a driver circuit, and LED backlight system. The screen
format is intended to support the 16:9 FHD, 1920(H) x 1080(V) screen
and 16.7M colors (RGB 8-bits) with LED backlight driving circuit.
All input signals are LVDS interface compatible.

G156HAN04.0 is designed for a display unit of notebook style
personal computer and industrial machine.

Signed-off-by: Elmar Albert <ealbert@data-modul.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
V2: - Rebase the patch
    - Fix up commit message
    - Tx parameter comments are retained, they refer to datasheet
      timings and are generally useful when checking if the timing
      requirements are properly fulfilled
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6bdd97ee71fec..83039c6b50e05 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1135,6 +1135,37 @@ static const struct panel_desc auo_g133han01 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing auo_g156han04_timings = {
+	.pixelclock = { 137000000, 141000000, 146000000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 60, 60, 60 },
+	.hback_porch = { 90, 92, 111 },
+	.hsync_len =  { 32, 32, 32 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 12, 12, 12 },
+	.vback_porch = { 24, 36, 56 },
+	.vsync_len = { 8, 8, 8 },
+};
+
+static const struct panel_desc auo_g156han04 = {
+	.timings = &auo_g156han04_timings,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 344,
+		.height = 194,
+	},
+	.delay = {
+		.prepare = 50,		/* T2 */
+		.enable = 200,		/* T3 */
+		.disable = 110,		/* T10 */
+		.unprepare = 1000,	/* T13 */
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode auo_g156xtn01_mode = {
 	.clock = 76000,
 	.hdisplay = 1366,
@@ -4289,6 +4320,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,g133han01",
 		.data = &auo_g133han01,
+	}, {
+		.compatible = "auo,g156han04",
+		.data = &auo_g156han04,
 	}, {
 		.compatible = "auo,g156xtn01",
 		.data = &auo_g156xtn01,
-- 
2.42.0

