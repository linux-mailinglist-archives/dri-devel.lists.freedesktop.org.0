Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE345FC52
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 04:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2120D6EE03;
	Sat, 27 Nov 2021 03:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DE96EDFE
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 03:19:33 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9E53D80FCE;
 Sat, 27 Nov 2021 04:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1637983171;
 bh=f082JpocRapTkdLZuZwZOwcLoYrXQuABrSwdqqRkc1o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CSQ4soV9K2oE3p81LuclwVh0dXz90VZQ6q8PeCGed7Ue4TgkRaJMR2NwGiLU/GY7q
 WZNAlrQfM3niXqF3inor5/YIqMZGM1HQCNqGzb9NoRkwG92ijT5vZEmvvDv6rWyldE
 88MXsXGKz/uR4/BOra1Wlv4g6ZF0kc0uOsf1qYGX8rd32R1sxOFoww5/V2bYtOz88w
 GwLI1sfYskQX8PgwIsgTQhX2CXwDKxJwYxa+QJnjkwEnKIDsA3hhGIGmLyyEdi0VYY
 9EII5gyGKeN9Olut8oMwDwGn2F8iuQDUwFMMha8I7SsFfimu+/ZKmqoHNO06UGiYVR
 f0JHMbZOkDFgA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/panel: simple: Add Team Source Display TST043015CMHX
 panel
Date: Sat, 27 Nov 2021 04:19:09 +0100
Message-Id: <20211127031909.283383-3-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211127031909.283383-1-marex@denx.de>
References: <20211127031909.283383-1-marex@denx.de>
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

Add Team Source Display TST043015CMHX 4.3" 480x272 DPI panel support.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index dde033066f3d..9e46db5e359c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3252,6 +3252,33 @@ static const struct panel_desc starry_kr070pe2t = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct display_timing tsd_tst043015cmhx_timing = {
+	.pixelclock = { 5000000, 9000000, 12000000 },
+	.hactive = { 480, 480, 480 },
+	.hfront_porch = { 4, 5, 65 },
+	.hback_porch = { 36, 40, 255 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 272, 272, 272 },
+	.vfront_porch = { 2, 8, 97 },
+	.vback_porch = { 3, 8, 31 },
+	.vsync_len = { 1, 1, 1 },
+
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
+};
+
+static const struct panel_desc tsd_tst043015cmhx = {
+	.timings = &tsd_tst043015cmhx_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 105,
+		.height = 67,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+};
+
 static const struct drm_display_mode tfc_s9700rtwv43tr_01b_mode = {
 	.clock = 30000,
 	.hdisplay = 800,
@@ -3928,6 +3955,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "starry,kr070pe2t",
 		.data = &starry_kr070pe2t,
+	}, {
+		.compatible = "team-source-display,tst043015cmhx",
+		.data = &tsd_tst043015cmhx,
 	}, {
 		.compatible = "tfc,s9700rtwv43tr-01b",
 		.data = &tfc_s9700rtwv43tr_01b,
-- 
2.33.0

