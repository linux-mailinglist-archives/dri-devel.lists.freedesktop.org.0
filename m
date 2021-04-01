Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B073F352372
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 01:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C65B6EDC0;
	Thu,  1 Apr 2021 23:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48A5C6E147
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 23:24:25 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.220])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S6YzlD4W1HTbyS6Z1lYTeL; Fri, 02 Apr 2021 01:17:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1617319044; bh=WXIw10Cjv4y1UORKkyyjNnkREYcZB3Aos47av/D06j4=;
 h=From:To:Subject:Date:MIME-Version;
 b=PpQ3RELT3bbPD2wfdyjhT8m/XKR8bXjm2PIQPQMDV+47W4V5glek7mYTb/v2KmNje
 6RG5DwUQiJJOflsVh/T18qw+KeBFsxIbKP4+Rw2BHV8jCxsnoaoltmQGyunIWijga8
 qKIcRTKGXmYqasEZvVYym4b3FvvfsHsPAIYM9SDUPJ7TLWYjFcwu/5JU6/0vzHkL5L
 2pov1WlMNlpTwOIZTwgOSg1+9kOFwPV45/uOBkE/TsoDt2wzdKCQ+EAT7m+wYORmRf
 yMtSW0WrwKT2tBlLXjZ19q/ApmecI9l+D3GW8aj61OUxIV/hNOQ/mSu6o6WbMWd4kc
 zHo2kdx9wji6A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 6/9] drm/panel: simple: add Jenson JT60245-01
Date: Fri,  2 Apr 2021 01:17:17 +0200
Message-Id: <20210401231720.2470869-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
References: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
 <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEZS3VVTb/oBuNqsOngSC5uenBTfoZ7FiTtzCt4o74v5RpycA+LV4eQiMgpd+8C8YcXRzU2JXwCWzTcRN0J9ig3wWmUPgh0E5NHxBNdY/IOt11u9N83U
 TJWNPwaM6iMOrWdyhnkKyOqiFd61EF+yxEFUecQc7C4qQ3V2TWrOa8B0yklHimww+8PAb3RqbeCKZ0j2Ads6/0EkBSd1k6WOXAiW1qZIDgCOYxYRbSPys8IW
 1sYvfeBLDVYL7G2ovVWCGtfZgFp7X0O1wR6SAgvczWEPXEoXVpQgdQkT7T9AqTXplUQUL0Rw0o65wDdeP+aKgz4HZ8l5Y/cPe5RPFr9aqgj5vB1Dccqh3SZT
 KY4E0WrYYwX9Q6Yw1XzryZ4sNRxMvtQyv+yvyOy89BPjbxQ34GJk6oRObwJUATW+uTvctX9KLQl7aB2IjFK+WV3vFGbnDz6iVfOMWypsSrMgxnOvaZM=
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
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for Jenson JT60245-01 800x480 7" panel to DRM
simple panel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..f63fa75ae4ef 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2532,6 +2532,30 @@ static const struct panel_desc ivo_m133nwf4_r0 = {
 	.connector_type = DRM_MODE_CONNECTOR_eDP,
 };
 
+static const struct drm_display_mode jenson_jt60245_01_mode = {
+	.clock = 35000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 210,
+	.hsync_end = 800 + 210 + 20,
+	.htotal = 800 + 210 + 20 + 46,
+	.vdisplay = 480,
+	.vsync_start = 480 + 22,
+	.vsync_end = 480 + 22 + 10,
+	.vtotal = 480 + 22 + 10 + 23,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc jenson_jt60245_01 = {
+	.modes = &jenson_jt60245_01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+};
+
 static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
 	.clock = 81000,
 	.hdisplay = 1366,
@@ -4301,6 +4325,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "ivo,m133nwf4-r0",
 		.data = &ivo_m133nwf4_r0,
+	}, {
+		.compatible = "jenson,jt60245-01",
+		.data = &jenson_jt60245_01,
 	}, {
 		.compatible = "kingdisplay,kd116n21-30nv-a010",
 		.data = &kingdisplay_kd116n21_30nv_a010,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
