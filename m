Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E994FA089D8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 09:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26C510F008;
	Fri, 10 Jan 2025 08:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B0A10ED66
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 11:37:55 +0000 (UTC)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <jre@pengutronix.de>)
 id 1tVqpC-0008AS-CY; Thu, 09 Jan 2025 12:35:42 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Thu, 09 Jan 2025 12:34:58 +0100
Subject: [PATCH 2/2] drm/panel: simple: Add DataImage FG080016DNCWAG03
 driver support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-panel-dataimage_fg080016dncwag-v1-2-0465603f6669@pengutronix.de>
References: <20250109-panel-dataimage_fg080016dncwag-v1-0-0465603f6669@pengutronix.de>
In-Reply-To: <20250109-panel-dataimage_fg080016dncwag-v1-0-0465603f6669@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1976; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=3Aez86cbjhGTtXIZGn5vb/utdup9rCrsQjzbEJi7Dro=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkiv39Kz2uf6joDvX/mKnnxMf73k9e2us7VnOJjt9okl5
 m+y3r1he0cpC4MYB4OsmCJLrJqcgpCx/3WzSrtYmDmsTCBDGLg4BWAiDQ8ZGR7r720pafs/a+fR
 yReeReQW7I9O5OS1X2VgInAsvEX9EA/Df+9ZVxhTnp2tML3Wcs9oiTdr+rTy5fUiu/YKbVv2zE+
 imRsA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 10 Jan 2025 08:22:58 +0000
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

Add DataImage FG080016DNCWAG03 8" 640x480 TFT LCD panel support.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 222c170dde8be261e98ff41168ef8a3a42c167c8..14d4cf235036cfd662bf16cb794ea2454d6fd2b2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1734,6 +1734,31 @@ static const struct panel_desc dataimage_fg040346dsswbg04 = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct display_timing dataimage_fg080016dncwag03_timing = {
+	.pixelclock = { 24000000, 25000000, 32500000 },
+	.hactive = { 640, 640, 640 },
+	.hfront_porch = { 64, 70, 115 },
+	.hback_porch =  { 64, 70, 115 },
+	.hsync_len = { 20, 20, 20 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 8, 12, 30 },
+	.vback_porch =  { 8, 13, 31 },
+	.vsync_len = { 20, 20, 20 },
+};
+
+static const struct panel_desc dataimage_fg080016dncwag03 = {
+	.timings = &dataimage_fg080016dncwag03_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing dataimage_fg1001l0dsswmg01_timing = {
 	.pixelclock = { 68900000, 71110000, 73400000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -4731,6 +4756,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "dataimage,fg040346dsswbg04",
 		.data = &dataimage_fg040346dsswbg04,
+	}, {
+		.compatible = "dataimage,fg080016dncwag03",
+		.data = &dataimage_fg080016dncwag03,
 	}, {
 		.compatible = "dataimage,fg1001l0dsswmg01",
 		.data = &dataimage_fg1001l0dsswmg01,

-- 
2.39.5

