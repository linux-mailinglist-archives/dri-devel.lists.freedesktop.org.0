Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB1F2A7E41
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A626EB73;
	Thu,  5 Nov 2020 12:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DD86EB74
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:06:13 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C67jS057285;
 Thu, 5 Nov 2020 06:06:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604577967;
 bh=S/Mcu2/z6fBkKr3w069C1iiJb9zZLtb3DbYFwqL7Ay8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=C/+8tYA5TlHMFNHz6FhJbBuPHP7igccd/qP+s0vmPykHkXCEkXWZQ75xAgVG4p0T3
 kI4XVhAAxpDterwl76j8l7NpiAkEP0j6WEx9iiobbqkpJHuBJKqZxTJcR5lnNS70/f
 jTkQHMddmXX1k/1ruXrxWfZZJcllmO8MpDphPM/I=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C67nD074937
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 06:06:07 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:06:07 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:06:07 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfq039111;
 Thu, 5 Nov 2020 06:06:05 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 54/56] drm/omap: drop unused owner field
Date: Thu, 5 Nov 2020 14:03:31 +0200
Message-ID: <20201105120333.947408-55-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dssdev->owner is set, but never used. We can drop the field.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c     | 1 -
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 1 -
 drivers/gpu/drm/omapdrm/dss/hdmi4.c   | 1 -
 drivers/gpu/drm/omapdrm/dss/hdmi5.c   | 1 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 2 --
 drivers/gpu/drm/omapdrm/dss/sdi.c     | 1 -
 drivers/gpu/drm/omapdrm/dss/venc.c    | 1 -
 7 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 1d2992daef40..030f997eccd0 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -641,7 +641,6 @@ static int dpi_init_output_port(struct dpi_data *dpi, struct device_node *port)
 	out->type = OMAP_DISPLAY_TYPE_DPI;
 	out->dispc_channel = dpi_get_channel(dpi);
 	out->of_port = port_num;
-	out->owner = THIS_MODULE;
 
 	r = omapdss_device_init_output(out, &dpi->bridge);
 	if (r < 0) {
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 76e4f607d8cf..22718a771d6d 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5443,7 +5443,6 @@ static int dsi_init_output(struct dsi_data *dsi)
 	out->name = dsi->module_id == 0 ? "dsi.0" : "dsi.1";
 	out->dispc_channel = dsi_get_channel(dsi);
 	out->dsi_ops = &dsi_ops;
-	out->owner = THIS_MODULE;
 	out->of_port = 0;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
 		       | DRM_BUS_FLAG_DE_HIGH
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index a14fbf06cb30..13701571d59b 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -707,7 +707,6 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
 	out->type = OMAP_DISPLAY_TYPE_HDMI;
 	out->name = "hdmi.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
-	out->owner = THIS_MODULE;
 	out->of_port = 0;
 
 	r = omapdss_device_init_output(out, &hdmi->bridge);
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index b738d9750686..5d627caf90f2 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -681,7 +681,6 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
 	out->type = OMAP_DISPLAY_TYPE_HDMI;
 	out->name = "hdmi.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
-	out->owner = THIS_MODULE;
 	out->of_port = 0;
 
 	r = omapdss_device_init_output(out, &hdmi->bridge);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 90e41c635e45..4442e49ffc5c 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -263,8 +263,6 @@ struct omapdss_dsi_ops {
 struct omap_dss_device {
 	struct device *dev;
 
-	struct module *owner;
-
 	struct dss_device *dss;
 	struct drm_bridge *bridge;
 	struct drm_bridge *next_bridge;
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 033fd30074b0..35827b4487bd 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -314,7 +314,6 @@ static int sdi_init_output(struct sdi_device *sdi)
 	out->dispc_channel = OMAP_DSS_CHANNEL_LCD;
 	/* We have SDI only on OMAP3, where it's on port 1 */
 	out->of_port = 1;
-	out->owner = THIS_MODULE;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE	/* 15.5.9.1.2 */
 		       | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 6e418a0f7572..8ecffe5bbd29 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -730,7 +730,6 @@ static int venc_init_output(struct venc_device *venc)
 	out->type = OMAP_DISPLAY_TYPE_VENC;
 	out->name = "venc.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
-	out->owner = THIS_MODULE;
 	out->of_port = 0;
 
 	r = omapdss_device_init_output(out, &venc->bridge);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
