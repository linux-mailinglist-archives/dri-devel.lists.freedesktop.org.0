Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EC5125FBC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D376A6EB2D;
	Thu, 19 Dec 2019 10:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CC96EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:15 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93BFF1817;
 Thu, 19 Dec 2019 11:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752372;
 bh=idsSFeevrx6ema++z30n773keqgemqouO6gTJQOrC4w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SnSx0gH+1HavUZv/0EAQWHrt6Bq8mm6x1nctaiD1zAKXGEm0laCowwu//b8vqPkRC
 1YHpo2bJ9ojsbsSV0ar0GUTQ9xPtJOHcj/4ZZ0vZlu3UeNOvb/S4U1yyeBS4jCQTTl
 0AeGYP/hZ/E/z2TRhvfG0B3SJAGGBXr1FLRiKCMk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 42/51] drm/omap: dpi: Sort includes alphabetically
Date: Thu, 19 Dec 2019 12:45:13 +0200
Message-Id: <20191219104522.9379-43-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes it easier to quickly locate duplicate includes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
