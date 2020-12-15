Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A052DAB30
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C526E209;
	Tue, 15 Dec 2020 10:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9996E1CE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlHf9123888
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029237;
 bh=6PoJSHwnYzHESDASiI+EUArPxrLqyZAVHxXyJJwlDm8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=IDxFMZ/eOZG4sX2Q+//0Tiv2+sscken7/0JLOR3rIq1sbUvhctWuUuWht/jpEuu4I
 s2HG3il7niF7iSvDQNvEZyZVDwbFc6ubtEdrPLILveWcPuPt3WhAGeaxbSTyLebnze
 sMUr9HT4ZcVQicyLcny6/ooE3oR7/NyuybLTkdOU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlHOa101170
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:17 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:17 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwa3046467;
 Tue, 15 Dec 2020 04:47:16 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 17/84] drm/omap: dsi: drop unused memory_read()
Date: Tue, 15 Dec 2020 12:45:50 +0200
Message-ID: <20201215104657.802264-18-tomi.valkeinen@ti.com>
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

memory_read is not used, so we can drop the code.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 93 -------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 -
 2 files changed, 97 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index e4e86e70e333..870271fc0498 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -930,97 +930,6 @@ static int dsicm_get_te(struct omap_dss_device *dssdev)
 	return r;
 }
 
-static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
-					u16 size)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct mipi_dsi_device *dsi = ddata->dsi;
-
-	return mipi_dsi_set_maximum_return_packet_size(dsi, size);
-}
-
-static int dsicm_memory_read(struct omap_dss_device *dssdev,
-		void *buf, size_t size,
-		u16 x, u16 y, u16 w, u16 h)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct mipi_dsi_device *dsi = ddata->dsi;
-	struct omap_dss_device *src = ddata->src;
-	int r;
-	int first = 1;
-	int plen;
-	unsigned int buf_used = 0;
-
-	if (size < w * h * 3)
-		return -ENOMEM;
-
-	mutex_lock(&ddata->lock);
-
-	if (!ddata->enabled) {
-		r = -ENODEV;
-		goto err1;
-	}
-
-	size = min((u32)w * h * 3,
-		   ddata->vm.hactive * ddata->vm.vactive * 3);
-
-	src->ops->dsi.bus_lock(src);
-
-	r = dsicm_wake_up(ddata);
-	if (r)
-		goto err2;
-
-	/* plen 1 or 2 goes into short packet. until checksum error is fixed,
-	 * use short packets. plen 32 works, but bigger packets seem to cause
-	 * an error. */
-	if (size % 2)
-		plen = 1;
-	else
-		plen = 2;
-
-	dsicm_set_update_window(ddata, x, y, w, h);
-
-	r = dsicm_set_max_rx_packet_size(dssdev, plen);
-	if (r)
-		goto err2;
-
-	while (buf_used < size) {
-		u8 dcs_cmd = first ? 0x2e : 0x3e;
-		first = 0;
-
-		r = mipi_dsi_dcs_read(dsi, dcs_cmd,
-				      buf + buf_used, size - buf_used);
-		if (r < 0) {
-			dev_err(dssdev->dev, "read error\n");
-			goto err3;
-		}
-
-		buf_used += r;
-
-		if (r < plen) {
-			dev_err(&ddata->dsi->dev, "short read\n");
-			break;
-		}
-
-		if (signal_pending(current)) {
-			dev_err(&ddata->dsi->dev, "signal pending, "
-					"aborting memory read\n");
-			r = -ERESTARTSYS;
-			goto err3;
-		}
-	}
-
-	r = buf_used;
-
-err3:
-	dsicm_set_max_rx_packet_size(dssdev, 1);
-err2:
-	src->ops->dsi.bus_unlock(src);
-err1:
-	mutex_unlock(&ddata->lock);
-	return r;
-}
-
 static void dsicm_ulps_work(struct work_struct *work)
 {
 	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
@@ -1093,8 +1002,6 @@ static const struct omap_dss_driver dsicm_dss_driver = {
 
 	.enable_te	= dsicm_enable_te,
 	.get_te		= dsicm_get_te,
-
-	.memory_read	= dsicm_memory_read,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index f77fa2d6a1dc..856110481e95 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -389,10 +389,6 @@ struct omap_dss_driver {
 
 	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
 	int (*get_te)(struct omap_dss_device *dssdev);
-
-	int (*memory_read)(struct omap_dss_device *dssdev,
-			void *buf, size_t size,
-			u16 x, u16 y, u16 w, u16 h);
 };
 
 struct dss_device *omapdss_get_dss(void);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
