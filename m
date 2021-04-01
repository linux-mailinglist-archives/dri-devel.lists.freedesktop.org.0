Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E36352373
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 01:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884DD6EDC1;
	Thu,  1 Apr 2021 23:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by gabe.freedesktop.org (Postfix) with ESMTP id 484706E13A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 23:24:25 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.220])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S6YzlD4W1HTbyS6Z2lYTeU; Fri, 02 Apr 2021 01:17:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1617319044; bh=2h+2Jbj1IsJmrQebFz8xkbtkJejWOKlZOxXk5Sc0w5o=;
 h=From:To:Subject:Date:MIME-Version;
 b=esmveXkVCuz1GloAhl/9HZGXZTu8AFTfM80aOuF0XDtKuZcktajnqUK9qIjj5xx18
 W22qJdanDlUYiouRZvFpjP2CgmcNPu9+BK8uNFpyc+fTcl0gizqOtRdQ6RmigQkQna
 LI6EmZAt/IxUza7X4T1ihsAmuHEsbZeaz0LKZmTZetkykht9b5zYYlNwImPLrLxTP1
 jZeyk8qhLSVRkhSNgCrQ/0tSSaPSnjpqxpX/mO40YBEC0tZXRaT7mrBsZDulCHNniy
 qTcfLdBYVQ2aukYjXyBGLyDTWcBh96Bd4ilTbkl/0nKm7RbMIg4e/aU1aoXtWq1/+9
 mj4bQIf0bZGWw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 7/9] drm/panel: simple: add Jenson JT60248-01
Date: Fri,  2 Apr 2021 01:17:18 +0200
Message-Id: <20210401231720.2470869-8-giulio.benetti@benettiengineering.com>
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

This patch adds support for Jenson JT60248-01 480x272 4.3" panel to DRM
simple panel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f63fa75ae4ef..f96f820a890b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2556,6 +2556,30 @@ static const struct panel_desc jenson_jt60245_01 = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
+static const struct drm_display_mode jenson_jt60248_01_mode = {
+	.clock = 9000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 8,
+	.hsync_end = 480 + 8 + 4,
+	.htotal = 480 + 8 + 4 + 43,
+	.vdisplay = 272,
+	.vsync_start = 272 + 8,
+	.vsync_end = 272 + 8 + 4,
+	.vtotal = 272 + 8 + 4 + 12,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc jenson_jt60248_01 = {
+	.modes = &jenson_jt60248_01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 95,
+		.height = 54,
+	},
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+};
+
 static const struct drm_display_mode kingdisplay_kd116n21_30nv_a010_mode = {
 	.clock = 81000,
 	.hdisplay = 1366,
@@ -4328,6 +4352,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "jenson,jt60245-01",
 		.data = &jenson_jt60245_01,
+	}, {
+		.compatible = "jenson,jt60248-01",
+		.data = &jenson_jt60248_01,
 	}, {
 		.compatible = "kingdisplay,kd116n21-30nv-a010",
 		.data = &kingdisplay_kd116n21_30nv_a010,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
