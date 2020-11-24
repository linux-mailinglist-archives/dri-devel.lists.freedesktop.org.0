Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C052C25E7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4D86E22B;
	Tue, 24 Nov 2020 12:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2272F6E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:46:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjs0o031898;
 Tue, 24 Nov 2020 06:45:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606221954;
 bh=+V46AngP/KxYbmcmkiZ6sU85pXUsE1rLEFS5I18kh4Q=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=OSJWKb2fwpJ0izO/asnBWffWWBbtLWN2LeOTywwxOIidMMS6rvTFUVpIdnnqzuNEV
 XcJX3MbNACtDnaSO6LVdTmdZTFyZUw7opISD8YCT5Gxv7M0A2BOOvl55mTOFMaDgnX
 p2LAt0+GYbo4WqHK7behMTeyVYztYHdVy8HyyoQ4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCjs61040677
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:45:54 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:45:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:45:53 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmoo040922;
 Tue, 24 Nov 2020 06:45:51 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 01/80] Revert "drm/omap: dss: Remove unused omap_dss_device
 operations"
Date: Tue, 24 Nov 2020 14:44:19 +0200
Message-ID: <20201124124538.660710-2-tomi.valkeinen@ti.com>
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
index c7650a7c155d..455b410f7401 100644
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
index ab19d4af8de7..cbbe10b2b60d 100644
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
index ae4b867a67a3..18a79dde6815 100644
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
