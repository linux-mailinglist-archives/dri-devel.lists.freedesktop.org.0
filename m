Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB64616FDAC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 12:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A832D6E8B2;
	Wed, 26 Feb 2020 11:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1D46E85B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:26:15 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C111037FE;
 Wed, 26 Feb 2020 12:26:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582716365;
 bh=5e9pjtoOZw1B//faz/aVIO8wQ2C0/h+O9tgcG/7Qx+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jR8azQE/gODi2x7LK+FUN53FywAmEEvuywkihdZ6crf3BxaNFVpgr9RZs4uurJDeP
 fOGAcR6WS6o3bZ1fQWCGP4XaDJ0gZ4AsL5JPE6WBMMzxobDz11kYMjXBwNHU2WhaUH
 us38QCAyOhnWBGj9UaWvzwZlL4bz1q2978Hz8xzk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 45/54] drm/omap: dpi: Sort includes alphabetically
Date: Wed, 26 Feb 2020 13:25:05 +0200
Message-Id: <20200226112514.12455-46-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
References: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes it easier to quickly locate duplicate includes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 2d0eb5fcbb5b..f8354271ce6f 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -9,20 +9,20 @@
 
 #define DSS_SUBSYS_NAME "DPI"
 
-#include <linux/kernel.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/export.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
-#include <linux/of.h>
-#include <linux/clk.h>
 #include <linux/sys_soc.h>
 
-#include "omapdss.h"
 #include "dss.h"
+#include "omapdss.h"
 
 struct dpi_data {
 	struct platform_device *pdev;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
