Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD422C25EB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25CB6E32A;
	Tue, 24 Nov 2020 12:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56486E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:46:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCk83p122779;
 Tue, 24 Nov 2020 06:46:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606221968;
 bh=de31vQZ6UNPn9SrMfrQ34p80sJBrY5pTUmj2dh23L/0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fHfsqxeN9wGq3sxroSnIRS4lCCYGjyyQbbVSB3rSaA3gRcUu+kJTzVchOYIqIEvJX
 1hRo/9wl6ZkjNEs+uMKnHF9Efbi65T1EWxw2oM9agVPHDs4GHYyuFRtTBNle6fO+BH
 i5uViWENzIVXBOUetTLqggGTE8JZuWnWd/eh/2l4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCk8B5044730
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:46:08 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:08 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmou040922;
 Tue, 24 Nov 2020 06:46:06 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 07/80] drm/omap: dsi: unexport specific data transfer
 functions
Date: Tue, 24 Nov 2020 14:44:25 +0200
Message-ID: <20201124124538.660710-8-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
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
index 9babe813a303..7391b499848f 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4949,18 +4949,6 @@ static const struct omap_dss_device_ops dsi_ops = {
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
index 654618e5a4e5..9ead877cb24c 100644
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
