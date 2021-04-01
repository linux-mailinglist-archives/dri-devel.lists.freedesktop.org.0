Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5102352376
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 01:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46366EDBF;
	Thu,  1 Apr 2021 23:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by gabe.freedesktop.org (Postfix) with ESMTP id 490AD6E15D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 23:24:25 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.220])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S6YzlD4W1HTbyS6Z2lYTej; Fri, 02 Apr 2021 01:17:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1617319044; bh=bbs0eGpCqn47dK8aOtFOvDuMEcrO6Tn/0pjo+mewfy0=;
 h=From:To:Subject:Date:MIME-Version;
 b=K7s8VYBkr2MX/qZNHWgPGiV/j7OskIVU83ItJpirl7aFf9POYzk5yugXE+27HZp4Q
 J/6Upc/prnZl6E+39QLYVsw1eguD9MpYBMej8BhE4kqc5L/WUOmWIgphffrGXEKLZq
 PEuPxtHBPuzmUiCwQtWEJn5kqVUcVkXrqC+mL/PCnmggu6N4rar9y3PlKLe5YPtzhU
 4X3Wg+rcl90B/IYOHT4RYDWUQdUCAESrKVEX76S9/iehl6GyF12dQQdP4mkkQ2jvmx
 vCc4C7LhT0gazIW3THxo1b05lpaYsLPj0GNmrdqTLcT1zW8JakYkLoEr9fiTdHzZCW
 83ot2QlXXv/Og==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 8/9] drm/panel: simple: add Jenson JT60249-01
Date: Fri,  2 Apr 2021 01:17:19 +0200
Message-Id: <20210401231720.2470869-9-giulio.benetti@benettiengineering.com>
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

This patch adds support for Jenson JT60249-01 800x480 5" panel to DRM
simple panel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f96f820a890b..1966ace764c3 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2580,6 +2580,30 @@ static const struct panel_desc jenson_jt60248_01 = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
+static const struct drm_display_mode jenson_jt60249_01_mode = {
+	.clock = 25000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 8,
+	.hsync_end = 800 + 8 + 4,
+	.htotal = 800 + 8 + 4 + 8,
+	.vdisplay = 480,
+	.vsync_start = 480 + 8,
+	.vsync_end = 480 + 8 + 4,
+	.vtotal = 480 + 8 + 4 + 8,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc jenson_jt60249_01 = {
+	.modes = &jenson_jt60249_01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 108,
+		.height = 65,
+	},
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+};
+
 static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
 	.clock = 81000,
 	.hdisplay = 1366,
@@ -4355,6 +4379,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "jenson,jt60248-01",
 		.data = &jenson_jt60248_01,
+	}, {
+		.compatible = "jenson,jt60249-01",
+		.data = &jenson_jt60249_01,
 	}, {
 		.compatible = "kingdisplay,kd116n21-30nv-a010",
 		.data = &kingdisplay_kd116n21_30nv_a010,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
