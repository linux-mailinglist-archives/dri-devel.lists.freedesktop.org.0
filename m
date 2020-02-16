Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E0160698
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591716E4E8;
	Sun, 16 Feb 2020 21:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3857D6E4B3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:04:13 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25B571279;
 Sun, 16 Feb 2020 22:04:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887049;
 bh=BKUuddLfAhx463BP/9r1N+q28nlEhEcV0A0v0xL5+5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zb5RzvJvj9e40WWvKuDZPrU/WsCo5eRtRWxoolCkI4rNVQPoln+fsn/kDd76qhuTT
 Tdc11A21EVdf5UbzpZcbf3wfBbMFEoJCFmFYGUUyTG7nqpUEgfJBbSnbzmIOBcQc63
 l56FUQRxDggw5pPQfTen1GmIDIXIKc0OALj1tP3M=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 46/51] drm/omap: sdi: Sort includes alphabetically
Date: Sun, 16 Feb 2020 23:03:03 +0200
Message-Id: <20200216210308.17312-47-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
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
