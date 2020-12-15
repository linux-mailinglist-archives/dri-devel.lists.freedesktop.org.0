Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD22DAB0B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DDE6E19B;
	Tue, 15 Dec 2020 10:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383436E19B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAl0Av123778
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029220;
 bh=qpe1rrkthAdUWPkOCcnR+FDS3TTt7lsiBgCd7JPERHs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=UoMVmGxrbZlgKlcNsBB812bww2yC+IrK34toecMdmXh+CHKoUrP7+cMRjhBtc5Z/P
 3YQyriLIpoepphKx+Hu+H/Ke4fB7vwrsexFXUk31cx6HMVewAF/gdMquTZ3XUspJOp
 nW4IMDsjI4g4ttLKcSVgha6K6LJyPyT/3b5B1qf0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAl0Ih022136
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:00 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:00 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwZl046467;
 Tue, 15 Dec 2020 04:46:59 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 01/84] Revert "drm/omap: dss: Remove unused omap_dss_device
 operations"
Date: Tue, 15 Dec 2020 12:45:34 +0200
Message-ID: <20201215104657.802264-2-tomi.valkeinen@ti.com>
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

This reverts commit e086558ae923 ("drm/omap: dss: Remove unused
omap_dss_device operations")

This is still needed by DSI. E.g. unloading modules without this will
cause a crash.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c     | 26 +++++++++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h  |  6 ++++
 drivers/gpu/drm/omapdrm/omap_encoder.c | 44 +++++++++++++++++++++++---
 3 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index cf50430e6363..3d2aa9d4ab6b 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -234,6 +234,18 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
 }
 EXPORT_SYMBOL_GPL(omapdss_device_disconnect);
 
+void omapdss_device_pre_enable(struct omap_dss_device *dssdev)
+{
+	if (!dssdev)
+		return;
+
+	omapdss_device_pre_enable(dssdev->next);
+
+	if (dssdev->ops && dssdev->ops->pre_enable)
+		dssdev->ops->pre_enable(dssdev);
+}
+EXPORT_SYMBOL_GPL(omapdss_device_pre_enable);
+
 void omapdss_device_enable(struct omap_dss_device *dssdev)
 {
 	if (!dssdev)
@@ -260,6 +272,20 @@ void omapdss_device_disable(struct omap_dss_device *dssdev)
 }
 EXPORT_SYMBOL_GPL(omapdss_device_disable);
 
+void omapdss_device_post_disable(struct omap_dss_device *dssdev)
+{
+	if (!dssdev)
+		return;
+
+	if (dssdev->ops && dssdev->ops->post_disable)
+		dssdev->ops->post_disable(dssdev);
+
+	omapdss_device_post_disable(dssdev->next);
+
+	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
+}
+EXPORT_SYMBOL_GPL(omapdss_device_post_disable);
+
 /* -----------------------------------------------------------------------------
  * Components Handling
  */
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index a48a9a254e33..28c2cffc362e 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -342,11 +342,15 @@ struct omap_dss_device_ops {
 	void (*disconnect)(struct omap_dss_device *dssdev,
 			struct omap_dss_device *dst);
 
+	void (*pre_enable)(struct omap_dss_device *dssdev);
 	void (*enable)(struct omap_dss_device *dssdev);
 	void (*disable)(struct omap_dss_device *dssdev);
+	void (*post_disable)(struct omap_dss_device *dssdev);
 
 	int (*check_timings)(struct omap_dss_device *dssdev,
 			     struct drm_display_mode *mode);
+	void (*set_timings)(struct omap_dss_device *dssdev,
+			    const struct drm_display_mode *mode);
 
 	int (*get_modes)(struct omap_dss_device *dssdev,
 			 struct drm_connector *connector);
@@ -445,8 +449,10 @@ int omapdss_device_connect(struct dss_device *dss,
 			   struct omap_dss_device *dst);
 void omapdss_device_disconnect(struct omap_dss_device *src,
 			       struct omap_dss_device *dst);
+void omapdss_device_pre_enable(struct omap_dss_device *dssdev);
 void omapdss_device_enable(struct omap_dss_device *dssdev);
 void omapdss_device_disable(struct omap_dss_device *dssdev);
+void omapdss_device_post_disable(struct omap_dss_device *dssdev);
 
 int omap_dss_get_num_overlay_managers(void);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 57e92a4d5937..a2b08d32baad 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -113,8 +113,13 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	bus_flags = connector->display_info.bus_flags;
 	omap_encoder_update_videomode_flags(&vm, bus_flags);
 
-	/* Set timings for the dss manager. */
+	/* Set timings for all devices in the display pipeline. */
 	dss_mgr_set_timings(output, &vm);
+
+	for (dssdev = output; dssdev; dssdev = dssdev->next) {
+		if (dssdev->ops && dssdev->ops->set_timings)
+			dssdev->ops->set_timings(dssdev, adjusted_mode);
+	}
 }
 
 static void omap_encoder_disable(struct drm_encoder *encoder)
@@ -127,10 +132,26 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
 
 	/*
 	 * Disable the chain of external devices, starting at the one at the
-	 * internal encoder's output. This is used for DSI outputs only, as
-	 * dssdev->next is NULL for all other outputs.
+	 * internal encoder's output.
 	 */
 	omapdss_device_disable(dssdev->next);
+
+	/*
+	 * Disable the internal encoder. This will disable the DSS output. The
+	 * DSI is treated as an exception as DSI pipelines still use the legacy
+	 * flow where the pipeline output controls the encoder.
+	 */
+	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
+		if (dssdev->ops && dssdev->ops->disable)
+			dssdev->ops->disable(dssdev);
+		dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
+	}
+
+	/*
+	 * Perform the post-disable operations on the chain of external devices
+	 * to complete the display pipeline disable.
+	 */
+	omapdss_device_post_disable(dssdev->next);
 }
 
 static void omap_encoder_enable(struct drm_encoder *encoder)
@@ -141,10 +162,23 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
 
 	dev_dbg(dev->dev, "enable(%s)\n", dssdev->name);
 
+	/* Prepare the chain of external devices for pipeline enable. */
+	omapdss_device_pre_enable(dssdev->next);
+
+	/*
+	 * Enable the internal encoder. This will enable the DSS output. The
+	 * DSI is treated as an exception as DSI pipelines still use the legacy
+	 * flow where the pipeline output controls the encoder.
+	 */
+	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
+		if (dssdev->ops && dssdev->ops->enable)
+			dssdev->ops->enable(dssdev);
+		dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
+	}
+
 	/*
 	 * Enable the chain of external devices, starting at the one at the
-	 * internal encoder's output. This is used for DSI outputs only, as
-	 * dssdev->next is NULL for all other outputs.
+	 * internal encoder's output.
 	 */
 	omapdss_device_enable(dssdev->next);
 }
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
