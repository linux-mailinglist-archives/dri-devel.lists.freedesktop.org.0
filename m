Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC95911B9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A440B433E;
	Fri, 12 Aug 2022 13:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 793 seconds by postgrey-1.36 at gabe;
 Fri, 12 Aug 2022 12:00:18 UTC
Received: from mx2.securetransport.de (mx2.securetransport.de
 [IPv6:2a03:4000:13:6c7::1])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0B11AFC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 12:00:18 +0000 (UTC)
Received: from mail.dh-electronics.com (unknown [77.24.89.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx2.securetransport.de (Postfix) with ESMTPSA id 085775E9CA;
 Fri, 12 Aug 2022 13:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1660305027;
 bh=vQXxrujRbeTWzsckYgsmVPcut+Xj2QVb4WMCFH/p6cw=;
 h=From:To:CC:Subject:Date:From;
 b=BeyZqJFbfn/I3+0NB/x1HqS+WbkyHVmEhBPpMUujjbapPy2TjD2BdPjd1vjQ1QU6f
 Se4GELqaTw2k8rJ8nNEU0lVcxCtqq7nDscix9cx8qqsK0C7XDl9+oo4MlNO/Xz6Gj5
 m/KcHHRodU44w8FUUPCrwEs2HWlPda+IJBKtT3OQ9QQpnNXcy2WFasr7USvPLjtD6d
 CSgzktE0GRn+xSiB90vWN9VIDUz4/2uH8Iy9I3Y77eeVwfUJyvhWfMRBNX3JAA3tdm
 E9f75TL2dYeBEfPvsX70eOI5/lZ3aVLSI50i62Ve+rQy4bdvI3/Mrc3OD+c/vAY532
 wthXRUEh9lmMA==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 12 Aug 2022 13:50:20 +0200
Received: from Stretch-CN.dh-electronics.org (10.64.6.116) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12 via Frontend Transport; Fri, 12 Aug 2022 13:50:20 +0200
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/panel: simple: Add Multi-Inno Technology MI0800FT-9
Date: Fri, 12 Aug 2022 13:48:32 +0200
Message-ID: <20220812114832.4946-1-cniedermaier@dh-electronics.com>
X-Mailer: git-send-email 2.11.0
X-klartext: yes
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 12 Aug 2022 13:52:21 +0000
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Multi-Inno Technology MI0800FT-9 8" 800x600 DPI panel support.

Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ff5e1a44c43a..f5b632989285 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2703,6 +2703,36 @@ static const struct panel_desc multi_inno_mi0700s4t_6 = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct display_timing multi_inno_mi0800ft_9_timing = {
+	.pixelclock = { 32000000, 40000000, 50000000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 16, 210, 354 },
+	.hback_porch = { 6, 26, 45 },
+	.hsync_len = { 1, 20, 40 },
+	.vactive = { 600, 600, 600 },
+	.vfront_porch = { 1, 12, 77 },
+	.vback_porch = { 3, 13, 22 },
+	.vsync_len = { 1, 10, 20 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
+		 DISPLAY_FLAGS_SYNC_POSEDGE,
+};
+
+static const struct panel_desc multi_inno_mi0800ft_9 = {
+	.timings = &multi_inno_mi0800ft_9_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 162,
+		.height = 122,
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
@@ -4104,6 +4134,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "multi-inno,mi0700s4t-6",
 		.data = &multi_inno_mi0700s4t_6,
 	}, {
+		.compatible = "multi-inno,mi0800ft-9",
+		.data = &multi_inno_mi0800ft_9,
+	}, {
 		.compatible = "multi-inno,mi1010ait-1cp",
 		.data = &multi_inno_mi1010ait_1cp,
 	}, {
-- 
2.11.0

