Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E0125FC2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9476EB32;
	Thu, 19 Dec 2019 10:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7F06EB1C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:18 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A4DD134B;
 Thu, 19 Dec 2019 11:46:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752375;
 bh=BKUuddLfAhx463BP/9r1N+q28nlEhEcV0A0v0xL5+5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iGkCncHlaoc49E/KFBPo0QrYXD+7cP4cOD4p/GREl3U2aYzudNlqQ7vnl7kOoBPBi
 cDZ1dy/ttWuI/WD/i2zb56JQrLGgPgHk1EmxGmP/sAyoCWOnM/UPpCs3MnpoZQl6Qz
 p+7k+D0Ix2F8aj73K5ap74NRDrtheGjUJwBdSwRw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 46/51] drm/omap: sdi: Sort includes alphabetically
Date: Thu, 19 Dec 2019 12:45:17 +0200
Message-Id: <20191219104522.9379-47-laurent.pinchart@ideasonboard.com>
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
 drivers/gpu/drm/omapdrm/dss/sdi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 11aa2f712ff4..7dedfcc86922 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -6,17 +6,17 @@
 
 #define DSS_SUBSYS_NAME "SDI"
 
-#include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/regulator/consumer.h>
 #include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/string.h>
-#include <linux/of.h>
 
-#include "omapdss.h"
 #include "dss.h"
+#include "omapdss.h"
 
 struct sdi_device {
 	struct platform_device *pdev;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
