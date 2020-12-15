Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFB52DAB41
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151AD6E249;
	Tue, 15 Dec 2020 10:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C916E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAltFa124185
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029275;
 bh=RXumSVK2ydUJ/hD4yK6d5SC9xAlMR37CbpewK9/8Jcg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=rV5vyiyFTJ+FKVe60G5lXJ0OkNtN+rcGXKAdYijr/nwy6VqJf+ZaSmaastbNPKfva
 j4fjs5qAp/BpJYt0MHPMcQe9kGCfVnKwm3mv4tVxlW3IGw/UG+S0mhcFOgIfBYjvfU
 n2ROugeVLUAuTkMoE6O/8EkIEvsCiKW+VfoCSggM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAltUr000993
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:55 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:55 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwae046467;
 Tue, 15 Dec 2020 04:47:54 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 54/84] drm/omap: remove dss_mgr_ops
Date: Tue, 15 Dec 2020 12:46:27 +0200
Message-ID: <20201215104657.802264-55-tomi.valkeinen@ti.com>
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

dss_mgr_ops was needed with the multi-module architecture, but is no
longer needed. We can thus remove it and use direct calls.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dss.h     |  1 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 42 +++++++++++----------------
 drivers/gpu/drm/omapdrm/dss/output.c  | 33 +++++----------------
 drivers/gpu/drm/omapdrm/omap_crtc.c   | 38 +++++-------------------
 drivers/gpu/drm/omapdrm/omap_crtc.h   |  2 --
 drivers/gpu/drm/omapdrm/omap_drv.c    |  4 +--
 6 files changed, 33 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
index 96f702314c8c..a547527bb2f3 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.h
+++ b/drivers/gpu/drm/omapdrm/dss/dss.h
@@ -257,7 +257,6 @@ struct dss_device {
 	struct dss_pll	*video2_pll;
 
 	struct dispc_device *dispc;
-	const struct dss_mgr_ops *mgr_ops;
 	struct omap_drm_private *mgr_ops_priv;
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index fee6e1dd474c..58a7e763fbe3 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -338,31 +338,23 @@ enum dss_writeback_channel {
 	DSS_WB_LCD3_MGR =	7,
 };
 
-struct dss_mgr_ops {
-	void (*start_update)(struct omap_drm_private *priv,
-			     enum omap_channel channel);
-	int (*enable)(struct omap_drm_private *priv,
-		      enum omap_channel channel);
-	void (*disable)(struct omap_drm_private *priv,
-			enum omap_channel channel);
-	void (*set_timings)(struct omap_drm_private *priv,
-			    enum omap_channel channel,
-			    const struct videomode *vm);
-	void (*set_lcd_config)(struct omap_drm_private *priv,
-			       enum omap_channel channel,
-			       const struct dss_lcd_mgr_config *config);
-	int (*register_framedone_handler)(struct omap_drm_private *priv,
-			enum omap_channel channel,
-			void (*handler)(void *), void *data);
-	void (*unregister_framedone_handler)(struct omap_drm_private *priv,
-			enum omap_channel channel,
-			void (*handler)(void *), void *data);
-};
-
-int dss_install_mgr_ops(struct dss_device *dss,
-			const struct dss_mgr_ops *mgr_ops,
-			struct omap_drm_private *priv);
-void dss_uninstall_mgr_ops(struct dss_device *dss);
+void omap_crtc_dss_start_update(struct omap_drm_private *priv,
+				       enum omap_channel channel);
+void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable);
+int omap_crtc_dss_enable(struct omap_drm_private *priv, enum omap_channel channel);
+void omap_crtc_dss_disable(struct omap_drm_private *priv, enum omap_channel channel);
+void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
+		enum omap_channel channel,
+		const struct videomode *vm);
+void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
+		enum omap_channel channel,
+		const struct dss_lcd_mgr_config *config);
+int omap_crtc_dss_register_framedone(
+		struct omap_drm_private *priv, enum omap_channel channel,
+		void (*handler)(void *), void *data);
+void omap_crtc_dss_unregister_framedone(
+		struct omap_drm_private *priv, enum omap_channel channel,
+		void (*handler)(void *), void *data);
 
 void dss_mgr_set_timings(struct omap_dss_device *dssdev,
 		const struct videomode *vm);
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index cd1cfcb2abd0..7378e855c278 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -81,54 +81,35 @@ void omapdss_device_cleanup_output(struct omap_dss_device *out)
 					out->next_bridge : out->bridge);
 }
 
-int dss_install_mgr_ops(struct dss_device *dss,
-			const struct dss_mgr_ops *mgr_ops,
-			struct omap_drm_private *priv)
-{
-	if (dss->mgr_ops)
-		return -EBUSY;
-
-	dss->mgr_ops = mgr_ops;
-	dss->mgr_ops_priv = priv;
-
-	return 0;
-}
-
-void dss_uninstall_mgr_ops(struct dss_device *dss)
-{
-	dss->mgr_ops = NULL;
-	dss->mgr_ops_priv = NULL;
-}
-
 void dss_mgr_set_timings(struct omap_dss_device *dssdev,
 			 const struct videomode *vm)
 {
-	dssdev->dss->mgr_ops->set_timings(dssdev->dss->mgr_ops_priv,
+	omap_crtc_dss_set_timings(dssdev->dss->mgr_ops_priv,
 					  dssdev->dispc_channel, vm);
 }
 
 void dss_mgr_set_lcd_config(struct omap_dss_device *dssdev,
 		const struct dss_lcd_mgr_config *config)
 {
-	dssdev->dss->mgr_ops->set_lcd_config(dssdev->dss->mgr_ops_priv,
+	omap_crtc_dss_set_lcd_config(dssdev->dss->mgr_ops_priv,
 					     dssdev->dispc_channel, config);
 }
 
 int dss_mgr_enable(struct omap_dss_device *dssdev)
 {
-	return dssdev->dss->mgr_ops->enable(dssdev->dss->mgr_ops_priv,
+	return omap_crtc_dss_enable(dssdev->dss->mgr_ops_priv,
 					    dssdev->dispc_channel);
 }
 
 void dss_mgr_disable(struct omap_dss_device *dssdev)
 {
-	dssdev->dss->mgr_ops->disable(dssdev->dss->mgr_ops_priv,
+	omap_crtc_dss_disable(dssdev->dss->mgr_ops_priv,
 				      dssdev->dispc_channel);
 }
 
 void dss_mgr_start_update(struct omap_dss_device *dssdev)
 {
-	dssdev->dss->mgr_ops->start_update(dssdev->dss->mgr_ops_priv,
+	omap_crtc_dss_start_update(dssdev->dss->mgr_ops_priv,
 					   dssdev->dispc_channel);
 }
 
@@ -137,7 +118,7 @@ int dss_mgr_register_framedone_handler(struct omap_dss_device *dssdev,
 {
 	struct dss_device *dss = dssdev->dss;
 
-	return dss->mgr_ops->register_framedone_handler(dss->mgr_ops_priv,
+	return omap_crtc_dss_register_framedone(dss->mgr_ops_priv,
 							dssdev->dispc_channel,
 							handler, data);
 }
@@ -147,7 +128,7 @@ void dss_mgr_unregister_framedone_handler(struct omap_dss_device *dssdev,
 {
 	struct dss_device *dss = dssdev->dss;
 
-	dss->mgr_ops->unregister_framedone_handler(dss->mgr_ops_priv,
+	omap_crtc_dss_unregister_framedone(dss->mgr_ops_priv,
 						   dssdev->dispc_channel,
 						   handler, data);
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 053450a10ece..4aa44f2cac4e 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -100,14 +100,14 @@ int omap_crtc_wait_pending(struct drm_crtc *crtc)
  * the upstream part of the video pipe.
  */
 
-static void omap_crtc_dss_start_update(struct omap_drm_private *priv,
+void omap_crtc_dss_start_update(struct omap_drm_private *priv,
 				       enum omap_channel channel)
 {
 	dispc_mgr_enable(priv->dispc, channel, true);
 }
 
 /* Called only from the encoder enable/disable and suspend/resume handlers. */
-static void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
+void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 {
 	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
 	struct drm_device *dev = crtc->dev;
@@ -180,8 +180,7 @@ static void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 }
 
 
-static int omap_crtc_dss_enable(struct omap_drm_private *priv,
-				enum omap_channel channel)
+int omap_crtc_dss_enable(struct omap_drm_private *priv, enum omap_channel channel)
 {
 	struct drm_crtc *crtc = priv->channels[channel]->crtc;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
@@ -193,8 +192,7 @@ static int omap_crtc_dss_enable(struct omap_drm_private *priv,
 	return 0;
 }
 
-static void omap_crtc_dss_disable(struct omap_drm_private *priv,
-				  enum omap_channel channel)
+void omap_crtc_dss_disable(struct omap_drm_private *priv, enum omap_channel channel)
 {
 	struct drm_crtc *crtc = priv->channels[channel]->crtc;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
@@ -202,7 +200,7 @@ static void omap_crtc_dss_disable(struct omap_drm_private *priv,
 	omap_crtc_set_enabled(&omap_crtc->base, false);
 }
 
-static void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
+void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
 		enum omap_channel channel,
 		const struct videomode *vm)
 {
@@ -213,7 +211,7 @@ static void omap_crtc_dss_set_timings(struct omap_drm_private *priv,
 	omap_crtc->vm = *vm;
 }
 
-static void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
+void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
 		enum omap_channel channel,
 		const struct dss_lcd_mgr_config *config)
 {
@@ -225,7 +223,7 @@ static void omap_crtc_dss_set_lcd_config(struct omap_drm_private *priv,
 					    config);
 }
 
-static int omap_crtc_dss_register_framedone(
+int omap_crtc_dss_register_framedone(
 		struct omap_drm_private *priv, enum omap_channel channel,
 		void (*handler)(void *), void *data)
 {
@@ -244,7 +242,7 @@ static int omap_crtc_dss_register_framedone(
 	return 0;
 }
 
-static void omap_crtc_dss_unregister_framedone(
+void omap_crtc_dss_unregister_framedone(
 		struct omap_drm_private *priv, enum omap_channel channel,
 		void (*handler)(void *), void *data)
 {
@@ -261,16 +259,6 @@ static void omap_crtc_dss_unregister_framedone(
 	omap_crtc->framedone_handler_data = NULL;
 }
 
-static const struct dss_mgr_ops mgr_ops = {
-	.start_update = omap_crtc_dss_start_update,
-	.enable = omap_crtc_dss_enable,
-	.disable = omap_crtc_dss_disable,
-	.set_timings = omap_crtc_dss_set_timings,
-	.set_lcd_config = omap_crtc_dss_set_lcd_config,
-	.register_framedone_handler = omap_crtc_dss_register_framedone,
-	.unregister_framedone_handler = omap_crtc_dss_unregister_framedone,
-};
-
 /* -----------------------------------------------------------------------------
  * Setup, Flush and Page Flip
  */
@@ -756,16 +744,6 @@ static const char *channel_names[] = {
 	[OMAP_DSS_CHANNEL_LCD3] = "lcd3",
 };
 
-void omap_crtc_pre_init(struct omap_drm_private *priv)
-{
-	dss_install_mgr_ops(priv->dss, &mgr_ops, priv);
-}
-
-void omap_crtc_pre_uninit(struct omap_drm_private *priv)
-{
-	dss_uninstall_mgr_ops(priv->dss);
-}
-
 /* initialize crtc */
 struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 				struct omap_drm_pipeline *pipe,
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.h b/drivers/gpu/drm/omapdrm/omap_crtc.h
index 2fd57751ae2b..a8b9cbee86e0 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.h
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.h
@@ -22,8 +22,6 @@ struct videomode;
 
 struct videomode *omap_crtc_timings(struct drm_crtc *crtc);
 enum omap_channel omap_crtc_channel(struct drm_crtc *crtc);
-void omap_crtc_pre_init(struct omap_drm_private *priv);
-void omap_crtc_pre_uninit(struct omap_drm_private *priv);
 struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 				struct omap_drm_pipeline *pipe,
 				struct drm_plane *plane);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 2f2ead897427..28bbad1353ee 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -572,7 +572,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	priv->dss = pdata->dss;
 	priv->dispc = dispc_get_dispc(priv->dss);
 
-	omap_crtc_pre_init(priv);
+	priv->dss->mgr_ops_priv = priv;
 
 	soc = soc_device_match(omapdrm_soc_devices);
 	priv->omaprev = soc ? (unsigned int)soc->data : 0;
@@ -625,7 +625,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	omap_gem_deinit(ddev);
 	destroy_workqueue(priv->wq);
 	omap_disconnect_pipelines(ddev);
-	omap_crtc_pre_uninit(priv);
 	drm_dev_put(ddev);
 	return ret;
 }
@@ -651,7 +650,6 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 	destroy_workqueue(priv->wq);
 
 	omap_disconnect_pipelines(ddev);
-	omap_crtc_pre_uninit(priv);
 
 	drm_dev_put(ddev);
 }
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
