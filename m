Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9428354F37C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 10:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291AC11AAFB;
	Fri, 17 Jun 2022 08:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A2E11AB17
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 08:48:16 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <bst@pengutronix.de>) id 1o27eI-0003Lu-Li
 for dri-devel@lists.freedesktop.org; Fri, 17 Jun 2022 10:48:15 +0200
Resent-From: Bastian Krause <bst@pengutronix.de>
Resent-To: dri-devel@lists.freedesktop.org
Resent-Date: Fri, 17 Jun 2022 10:48:14 +0200
Resent-Message-ID: <30f95d1d-edc8-0e0c-7df0-846fa26986c9@pengutronix.de>
Received: from localhost ([127.0.0.1] helo=metis.ext.pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <kernel-bounces@pengutronix.de>)
 id 1nzcbt-00040x-9u; Fri, 10 Jun 2022 13:15:25 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <bst@pengutronix.de>)
 id 1nzcbr-0003x2-2y; Fri, 10 Jun 2022 13:15:23 +0200
From: Bastian Krause <bst@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel: simple: add AM-800600P5TMQW-TB8H
Date: Fri, 10 Jun 2022 13:15:11 +0200
Message-Id: <20220610111511.1421067-2-bst@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220610111511.1421067-1-bst@pengutronix.de>
References: <20220610111511.1421067-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PTX-Original-Recipient: kernel@pengutronix.de
X-BeenThere: kernel@pengutronix.de
X-Mailman-Version: 2.1.29
Precedence: list
X-PTX-Original-Recipient: bst@pengutronix.de
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Yannick Fertre <yannick.fertre@st.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Bastian Krause <bst@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the Ampire AM-800600P5TMQW-TB8H 800x600 panel. Data
sheet is currently not publicly available, unfortunately.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4a2e580a2f7b7..3a61873dd887c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -778,6 +778,36 @@ static const struct panel_desc ampire_am800480r3tmqwa1h = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct display_timing ampire_am800600p5tmqw_tb8h_timing = {
+	.pixelclock = { 34500000, 39600000, 50400000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 12, 112, 312 },
+	.hback_porch = { 87, 87, 48 },
+	.hsync_len = { 1, 1, 40 },
+	.vactive = { 600, 600, 600 },
+	.vfront_porch = { 1, 21, 61 },
+	.vback_porch = { 38, 38, 19 },
+	.vsync_len = { 1, 1, 20 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
+		DISPLAY_FLAGS_SYNC_POSEDGE,
+};
+
+static const struct panel_desc ampire_am800600p5tmqwtb8h = {
+	.timings = &ampire_am800600p5tmqw_tb8h_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 162,
+		.height = 122,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+		DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing santek_st0700i5y_rbslw_f_timing = {
 	.pixelclock = { 26400000, 33300000, 46800000 },
 	.hactive = { 800, 800, 800 },
@@ -3754,6 +3784,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "ampire,am800480r3tmqwa1h",
 		.data = &ampire_am800480r3tmqwa1h,
+	}, {
+		.compatible = "ampire,am800600p5tmqwtb8h",
+		.data = &ampire_am800600p5tmqwtb8h,
 	}, {
 		.compatible = "arm,rtsm-display",
 		.data = &arm_rtsm,
-- 
2.30.2


