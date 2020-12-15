Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F0E2DAB1E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6AC6E1CE;
	Tue, 15 Dec 2020 10:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2682C6E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:16 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlGTk010476
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029236;
 bh=5ow+8iV6Uk4V//guaxCmElY1PF8RVZbVJZblxfLkNwo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=TXkq0j4fLTt/x9XV0hrFNKWiFKkqMltPmIF47Jc43FxDz9loipJxzsCxHcHvcIDUg
 9LKHvE1+y+SPodzJw3KdQk7wVuDGn1YssBw7Fy1JC6Kk3VZP+T6+J6lglmP1/3fjpT
 CNLsbnefURLI1XwRv6pr9BSXC4q/bITXqlmvRfV4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlGC8022839
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:16 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:16 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:16 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwa2046467;
 Tue, 15 Dec 2020 04:47:15 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 16/84] drm/omap: panel-dsi-cm: use common MIPI DCS 1.3
 defines
Date: Tue, 15 Dec 2020 12:45:49 +0200
Message-ID: <20201215104657.802264-17-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215104657.802264-1-tomi.valkeinen@ti.com>
References: <20201215104657.802264-1-tomi.valkeinen@ti.com>
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Drop local definition of common MIPI DCS 1.3 defines.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 4e5d4450c155..e4e86e70e333 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -28,8 +28,6 @@
 #include "../dss/omapdss.h"
 
 #define DCS_READ_NUM_ERRORS	0x05
-#define DCS_BRIGHTNESS		0x51
-#define DCS_CTRL_DISPLAY	0x53
 #define DCS_GET_ID1		0xda
 #define DCS_GET_ID2		0xdb
 #define DCS_GET_ID3		0xdc
@@ -334,7 +332,8 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 
 		r = dsicm_wake_up(ddata);
 		if (!r)
-			r = dsicm_dcs_write_1(ddata, DCS_BRIGHTNESS, level);
+			r = dsicm_dcs_write_1(
+				ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
 
 		src->ops->dsi.bus_unlock(src);
 	}
@@ -597,11 +596,11 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = dsicm_dcs_write_1(ddata, DCS_BRIGHTNESS, 0xff);
+	r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
 	if (r)
 		goto err;
 
-	r = dsicm_dcs_write_1(ddata, DCS_CTRL_DISPLAY,
+	r = dsicm_dcs_write_1(ddata, MIPI_DCS_WRITE_CONTROL_DISPLAY,
 			(1<<2) | (1<<5));	/* BL | BCTRL */
 	if (r)
 		goto err;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
