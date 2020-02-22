Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C41B168FA0
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713846E95F;
	Sat, 22 Feb 2020 15:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B056E931
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:02:19 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58B11AE6;
 Sat, 22 Feb 2020 16:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383735;
 bh=wDckX81KuoLIzCANeeYY7CbBvCMZLCa2aQo9ob02EbM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jZoFZTErUmyMbb+Tk7+y0CtmYOGuHpMOTWUmrIrfGqDwOEtylyEZP6oLvK2r9PlWI
 bsz5dnEHVGMbENj1nuFoDOplvk7JrT8oIuRF2O7j6mHqW58PQURHa3j9FQWCSV6pqK
 fSLTSKbq1UHLzfEC7foy9AQIFrd89EZyb+RXsWvY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 53/54] drm/omap: dss: Remove unused
 omapdss_of_find_connected_device() function
Date: Sat, 22 Feb 2020 17:01:05 +0200
Message-Id: <20200222150106.22919-54-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The omapdss_of_find_connected_device() function isn't used anymore,
remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/Makefile  |  2 +-
 drivers/gpu/drm/omapdrm/dss/dss-of.c  | 28 ---------------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  3 ---
 3 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/dss/dss-of.c

diff --git a/drivers/gpu/drm/omapdrm/dss/Makefile b/drivers/gpu/drm/omapdrm/dss/Makefile
index 5950c3f52c2e..f967e6948f2e 100644
--- a/drivers/gpu/drm/omapdrm/dss/Makefile
+++ b/drivers/gpu/drm/omapdrm/dss/Makefile
@@ -2,7 +2,7 @@
 obj-$(CONFIG_OMAP2_DSS_INIT) += omapdss-boot-init.o
 
 obj-$(CONFIG_OMAP_DSS_BASE) += omapdss-base.o
-omapdss-base-y := base.o display.o dss-of.o output.o
+omapdss-base-y := base.o display.o output.o
 
 obj-$(CONFIG_OMAP2_DSS) += omapdss.o
 # Core DSS files
diff --git a/drivers/gpu/drm/omapdrm/dss/dss-of.c b/drivers/gpu/drm/omapdrm/dss/dss-of.c
deleted file mode 100644
index b7981f3b80ad..000000000000
--- a/drivers/gpu/drm/omapdrm/dss/dss-of.c
+++ /dev/null
@@ -1,28 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- */
-
-#include <linux/err.h>
-#include <linux/of.h>
-#include <linux/of_graph.h>
-
-#include "omapdss.h"
-
-struct omap_dss_device *
-omapdss_of_find_connected_device(struct device_node *node, unsigned int port)
-{
-	struct device_node *remote_node;
-	struct omap_dss_device *dssdev;
-
-	remote_node = of_graph_get_remote_node(node, port, 0);
-	if (!remote_node)
-		return NULL;
-
-	dssdev = omapdss_find_device_by_node(remote_node);
-	of_node_put(remote_node);
-
-	return dssdev ? dssdev : ERR_PTR(-EPROBE_DEFER);
-}
-EXPORT_SYMBOL_GPL(omapdss_of_find_connected_device);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 315a356fa0c0..cbbe10b2b60d 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -477,9 +477,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct omap_dss_device *
-omapdss_of_find_connected_device(struct device_node *node, unsigned int port);
-
 enum dss_writeback_channel {
 	DSS_WB_LCD1_MGR =	0,
 	DSS_WB_LCD2_MGR =	1,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
