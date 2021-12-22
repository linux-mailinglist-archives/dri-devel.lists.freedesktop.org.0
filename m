Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2947D30E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 14:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E015410E97B;
	Wed, 22 Dec 2021 13:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B635E10E97B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:33:03 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E59938069C;
 Wed, 22 Dec 2021 14:33:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1640179982;
 bh=fOberlpl3Mk75/dFAGgyphabcsBfNRgMfx1BLe++JvM=;
 h=From:To:Cc:Subject:Date:From;
 b=f7q+Wqk0472aKYn1LuYLhMrSx1xNQmrdHDMmU+L4Zfl7jApWn1ucRsEf5hHJnNWzb
 fmGfILeS0UWrXcpNyJZ3EyaNfshs7J9k8luKEkxV+tkB/fOPY3/0wWLHfwihK1NyU2
 wzGv2fiP/whAziSB1D7e1YCAxQU8pMDFYSOmFlPm/7iFuvrIyIuaXODRYdBvVFzd9H
 QQm3fMijYT2X3Q+BJVhdzLhoyG3fImJXg83GIpeg7YS3pbDDaypjv8oGdIwzy+fT8D
 kmztUBSKtX+2cYD2sC8JcV4Y06U5zjVs/1Hna4BkjU/j1F7FjzkZJXDGBJ4tP+ddYG
 cEFyyBq8GbFvg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: add Multi-Inno Technology MI0700S4T-6
Date: Wed, 22 Dec 2021 14:32:50 +0100
Message-Id: <20211222133250.6628-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Multi-Inno Technology MI0700S4T-6 7" 800x480 DPI panel support.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e46db5e359c..0c8786ebffd1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2525,6 +2525,36 @@ static const struct panel_desc mitsubishi_aa070mc01 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 };
 
+static const struct display_timing multi_inno_mi0700s4t_6_timing = {
+	.pixelclock = { 29000000, 33000000, 38000000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 180, 210, 240 },
+	.hback_porch = { 16, 16, 16 },
+	.hsync_len = { 30, 30, 30 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 12, 22, 32 },
+	.vback_porch = { 10, 10, 10 },
+	.vsync_len = { 13, 13, 13 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
+		 DISPLAY_FLAGS_SYNC_POSEDGE,
+};
+
+static const struct panel_desc multi_inno_mi0700s4t_6 = {
+	.timings = &multi_inno_mi0700s4t_6_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing multi_inno_mi1010ait_1cp_timing = {
 	.pixelclock = { 68900000, 70000000, 73400000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -3871,6 +3901,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "mitsubishi,aa070mc01-ca1",
 		.data = &mitsubishi_aa070mc01,
+	}, {
+		.compatible = "multi-inno,mi0700s4t-6",
+		.data = &multi_inno_mi0700s4t_6,
 	}, {
 		.compatible = "multi-inno,mi1010ait-1cp",
 		.data = &multi_inno_mi1010ait_1cp,
-- 
2.34.1

