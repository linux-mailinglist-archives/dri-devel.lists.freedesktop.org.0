Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA7DD3AA9C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E0910E464;
	Mon, 19 Jan 2026 13:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A901E10E112
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:44:52 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.felsch@pengutronix.de>)
 id 1vhpYk-0006Dl-Hq; Mon, 19 Jan 2026 14:44:46 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 19 Jan 2026 14:44:43 +0100
Subject: [PATCH v2 2/2] drm/panel: simple: add EDT ET057023UDBA panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-v6-18-topic-panel-simple-et057023udba-v2-2-3c73f0c9d87a@pengutronix.de>
References: <20260119-v6-18-topic-panel-simple-et057023udba-v2-0-3c73f0c9d87a@pengutronix.de>
In-Reply-To: <20260119-v6-18-topic-panel-simple-et057023udba-v2-0-3c73f0c9d87a@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Add support for the EDT ET057023UDBA 5.7" 24-bit 640x480 DPI panel.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0019de93be1b663f55b04160606363cd043ab38b..953c1969a74e9880c7fccfe308ff016c7a941c91 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2096,6 +2096,35 @@ static const struct panel_desc edt_et057090dhu = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct display_timing edt_et057023udba_timing = {
+	.pixelclock = { 23200000, 24190000, 39640000 },
+	.hactive = { 640, 640, 640 },
+	.hfront_porch = { 20, 40, 200 },
+	.hback_porch = { 87, 40, 1 },
+	.hsync_len = { 1, 48, 87 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 5, 13, 200 },
+	.vback_porch = { 31, 31, 29 },
+	.vsync_len = { 1, 1, 3 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
+		 DISPLAY_FLAGS_SYNC_POSEDGE,
+};
+
+static const struct panel_desc edt_et057023udba = {
+	.timings = &edt_et057023udba_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 115,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
+		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode edt_etm0700g0dh6_mode = {
 	.clock = 33260,
 	.hdisplay = 800,
@@ -5109,6 +5138,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,etm0430g0dh6",
 		.data = &edt_etm0430g0dh6,
+	}, {
+		.compatible = "edt,et057023udba",
+		.data = &edt_et057023udba,
 	}, {
 		.compatible = "edt,et057090dhu",
 		.data = &edt_et057090dhu,

-- 
2.47.3

