Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39090119ED8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203976E9FE;
	Tue, 10 Dec 2019 22:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A166E9FC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:48 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F3A9197C;
 Tue, 10 Dec 2019 23:58:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018723;
 bh=Rr/GOow2nHIO0DjwsBBuOUd0ovKiM8Nt04CBgVs+cfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f5pxtbyuznNTNsf/tGryIdaPggGfjUkHJ6O2uYT/YXoAVYTr0JISEqM9yu5VWXOly
 ZatBgrQpH07ZWeFRSOTbHOoKQty9zAV0s1Lwp7wdTRAug53vqVY9s+ngeDWEHJnkv5
 9OroK8DG1TXmCGrBEm1wo9AR+b7UoV/MHdsROLC8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 46/50] drm/omap: sdi: Sort includes alphabetically
Date: Wed, 11 Dec 2019 00:57:46 +0200
Message-Id: <20191210225750.15709-47-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes it easier to quickly locate duplicate includes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
