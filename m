Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A61427579D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 13:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CBD6E997;
	Wed, 23 Sep 2020 11:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A636E995
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 11:58:35 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwVXr029792;
 Wed, 23 Sep 2020 06:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600862311;
 bh=vaxX/tMCpqSuScYl5Te8pRXG2+wH6sm73BF+2HP6qs8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=jDLbxyVwECdi76t2PzUzMvLbO0kMiAlFOrBjST9paNxtvZvrpws5XyLe2ZGobbZfb
 cKGqCuMTnez+qL0FTSF8AD+mtScR1nwstlhFsJSNIPPwiyInKPkOJtvl9dY9OWUH/8
 svmIyxTPi4gVoGg7byCRTkTmrcbLoi4a4nErDmUA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08NBwV9k062211
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 06:58:31 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 06:58:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 06:58:31 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwJi0038765;
 Wed, 23 Sep 2020 06:58:29 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jyri Sarha <jsarha@ti.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 4/5] drm/omap: rearrange includes in omapdss.h
Date: Wed, 23 Sep 2020 14:57:26 +0300
Message-ID: <20200923115727.248705-5-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200923115727.248705-1-tomi.valkeinen@ti.com>
References: <20200923115727.248705-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop "uapi/" and rearrange alphabetically.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index ab19d4af8de7..8e9a2019f173 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -7,13 +7,13 @@
 #ifndef __OMAP_DRM_DSS_H
 #define __OMAP_DRM_DSS_H
 
-#include <linux/list.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_mode.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
-#include <video/videomode.h>
+#include <linux/list.h>
 #include <linux/platform_data/omapdss.h>
-#include <uapi/drm/drm_mode.h>
-#include <drm/drm_crtc.h>
+#include <video/videomode.h>
 
 #define DISPC_IRQ_FRAMEDONE		(1 << 0)
 #define DISPC_IRQ_VSYNC			(1 << 1)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
