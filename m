Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBCC2DAB12
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABA36E1B5;
	Tue, 15 Dec 2020 10:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5537D6E1B5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAl6ds123823
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029226;
 bh=mG0jfJX6IxWWZSsRkmM1mpTW5kJp8oduDWV7kcjkCXM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=wOqg/OdjhDiXe3umT9Gapg+hf+tL6vpAmynzMPjTcl18iNutbr7mgSn99IfqZIzVE
 BaTyQADxHcRvt05fDKfXaCA4z7KrXyOJL1Z+yfmyRgNuQH/FNAdvIxN/4FNcs0MSjh
 2/oJkw0QSjdesDZMclz0cmIajQW4psHw/7locKp4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAl6hG130655
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:06 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:06 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwZr046467;
 Tue, 15 Dec 2020 04:47:05 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 07/84] drm/omap: dsi: unexport specific data transfer
 functions
Date: Tue, 15 Dec 2020 12:45:40 +0200
Message-ID: <20201215104657.802264-8-tomi.valkeinen@ti.com>
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

After converting all DSI drivers, unexport the specific transfer
functions.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 12 ------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 20 --------------------
 2 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 1e73fb175bfe..d2566992d065 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4947,18 +4947,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.release_vc = dsi_release_vc,
 
 		.transfer = omap_dsi_transfer,
-
-		.dcs_write = dsi_vc_dcs_write,
-		.dcs_write_nosync = dsi_vc_dcs_write_nosync,
-		.dcs_read = dsi_vc_dcs_read,
-
-		.gen_write = dsi_vc_generic_write,
-		.gen_write_nosync = dsi_vc_generic_write_nosync,
-		.gen_read = dsi_vc_generic_read,
-
-		.bta_sync = dsi_vc_send_bta_sync,
-
-		.set_max_rx_packet_size = dsi_vc_set_max_rx_packet_size,
 	},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 4e1988f05a27..88b73188203e 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -310,26 +310,6 @@ struct omapdss_dsi_ops {
 	/* data transfer */
 	ssize_t (*transfer)(struct omap_dss_device *dssdev,
 			    const struct mipi_dsi_msg *msg);
-
-	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
-			const u8 *data, int len);
-	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
-			const u8 *data, int len);
-	int (*dcs_read)(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
-			u8 *data, int len);
-
-	int (*gen_write)(struct omap_dss_device *dssdev, int channel,
-			const u8 *data, int len);
-	int (*gen_write_nosync)(struct omap_dss_device *dssdev, int channel,
-			const u8 *data, int len);
-	int (*gen_read)(struct omap_dss_device *dssdev, int channel,
-			const u8 *reqdata, int reqlen,
-			u8 *data, int len);
-
-	int (*bta_sync)(struct omap_dss_device *dssdev, int channel);
-
-	int (*set_max_rx_packet_size)(struct omap_dss_device *dssdev,
-			int channel, u16 plen);
 };
 
 struct omap_dss_device_ops {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
