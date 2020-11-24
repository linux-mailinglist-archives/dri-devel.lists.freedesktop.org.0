Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F125E2C3A9E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AC46E839;
	Wed, 25 Nov 2020 08:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from softboy.mntmn.com (softboy.mntmn.com [91.250.115.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD3836E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 17:26:41 +0000 (UTC)
From: "Lukas F. Hartmann" <lukas@mntre.com>
DKIM-Filter: OpenDKIM Filter v2.11.0 softboy.mntmn.com A45C4720EE6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mntre.com;
 s=mntremail; t=1606238800;
 bh=sMffCRC8t+pVcO6WbR04nkC1P/SDITAOk+2n+2D+EGg=;
 h=From:To:Cc:Subject:Date:From;
 b=QAKTCw8n2obR9UHANnvm8VhoMSBiqe+vsHOY0yp785hxcjZ0nCvt9RM9gzYMySAvd
 ynyQp4rNLA1zC+QtibDBOICDCwrsIAqaj5HQCXYkrewU92P9O9E20HjfWbCiLpGkVE
 OUR2bws5hkLvYarRGkqC+voJSu3jOnJC2tq1posC5FssgvxofC9RhWWpA/I8iqJkbs
 3pmPk3wInhwZ8QY6O8BlqB9Zc0yvXyAS8iY+xv4iNEZggMOyi+4OqRrRVsk4PhGeTe
 o8VqON5W9V++UQrdiR4dzzWatrTzhMlCJOlu6H3OonPMUrnQyBJDEXSTHp+QFmeaIJ
 Nh82Im9OTQXWw==
To: lukas@mntre.com
Subject: [PATCH 1/2] panel-simple: add Innolux N125HCE-GN1
Date: Tue, 24 Nov 2020 18:26:04 +0100
Message-Id: <20201124172604.981746-1-lukas@mntre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Innolux N125HCE-GN1 display is used in the MNT Reform 2.0 laptop,
attached via eDP to a SN65DSI86 MIPI-DSI to eDP bridge.

Signed-off-by: Lukas F. Hartmann <lukas@mntre.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2be358fb4..774acab52 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2263,6 +2263,31 @@ static const struct panel_desc innolux_n116bge = {
 	},
 };
 
+static const struct drm_display_mode innolux_n125hce_gn1_mode = {
+	.clock = 162000,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 40,
+	.hsync_end = 1920 + 40 + 40,
+	.htotal = 1920 + 40 + 40 + 80,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 4,
+	.vsync_end = 1080 + 4 + 4,
+	.vtotal = 1080 + 4 + 4 + 24,
+};
+
+static const struct panel_desc innolux_n125hce_gn1 = {
+	.modes = &innolux_n125hce_gn1_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 276,
+		.height = 155,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 static const struct drm_display_mode innolux_n156bge_l21_mode = {
 	.clock = 69300,
 	.hdisplay = 1366,
@@ -4092,6 +4117,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,n116bge",
 		.data = &innolux_n116bge,
+	}, {
+		.compatible = "innolux,n125hce-gn1",
+		.data = &innolux_n125hce_gn1,
 	}, {
 		.compatible = "innolux,n156bge-l21",
 		.data = &innolux_n156bge_l21,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
