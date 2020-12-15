Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63D2DAB3F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F476E223;
	Tue, 15 Dec 2020 10:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00D36E23F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAljwT124093
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029265;
 bh=OwjsH5oVVeojb3hUnMjSp/a7Q8Cdnr1C3/aahShoWmA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=efC/Cvwso5T8aO4/e3felARFtTKG48Sb+Hi/1ZGhGaLOTjIGEm6qRA9MT6E5b3Kx4
 NjvcT3neyehO0aNTOROYLN8VYGxUwN9DbBl5pEglRU9WCYv+0GzspyLp6YmYNf2vMs
 2UQj66rn/RxVwfaVU390wDuMYngnvqP7HtFYA4qw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAljmo023382
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:45 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:44 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaU046467;
 Tue, 15 Dec 2020 04:47:44 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 44/84] drm/omap: drop unused DSS next pointer
Date: Tue, 15 Dec 2020 12:46:17 +0200
Message-ID: <20201215104657.802264-45-tomi.valkeinen@ti.com>
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

Since all encoders and panels are using the bridge API now,
we next pointer is no longer useful and can be dropped.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c     |  2 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h  |  1 -
 drivers/gpu/drm/omapdrm/dss/output.c   | 13 +------------
 drivers/gpu/drm/omapdrm/omap_encoder.c |  4 ----
 4 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index fb8b6a6dca1c..332eb0d02c6d 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -135,7 +135,7 @@ struct omap_dss_device *omapdss_device_next_output(struct omap_dss_device *from)
 			goto done;
 		}
 
-		if (dssdev->id && (dssdev->next || dssdev->bridge))
+		if (dssdev->id && dssdev->bridge)
 			goto done;
 	}
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index c74b3c6164f5..0547c69a2c1b 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -293,7 +293,6 @@ struct omap_dss_device {
 	struct module *owner;
 
 	struct dss_device *dss;
-	struct omap_dss_device *next;
 	struct drm_bridge *bridge;
 	struct drm_bridge *next_bridge;
 	struct drm_panel *panel;
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index 5affdf078134..374a4ce6d931 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -30,7 +30,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		return 0;
 	}
 
-	out->next = omapdss_find_device_by_node(remote_node);
 	out->bridge = of_drm_find_bridge(remote_node);
 	out->panel = of_drm_find_panel(remote_node);
 	if (IS_ERR(out->panel))
@@ -38,12 +37,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 
 	of_node_put(remote_node);
 
-	if (out->next && out->type != out->next->type) {
-		dev_err(out->dev, "output type and display type don't match\n");
-		ret = -EINVAL;
-		goto error;
-	}
-
 	if (out->panel) {
 		struct drm_bridge *bridge;
 
@@ -69,7 +62,7 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		out->bridge = local_bridge;
 	}
 
-	if (!out->next && !out->bridge) {
+	if (!out->bridge) {
 		ret = -EPROBE_DEFER;
 		goto error;
 	}
@@ -78,7 +71,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 
 error:
 	omapdss_device_cleanup_output(out);
-	out->next = NULL;
 	return ret;
 }
 EXPORT_SYMBOL(omapdss_device_init_output);
@@ -88,9 +80,6 @@ void omapdss_device_cleanup_output(struct omap_dss_device *out)
 	if (out->bridge && out->panel)
 		drm_panel_bridge_remove(out->next_bridge ?
 					out->next_bridge : out->bridge);
-
-	if (out->next)
-		omapdss_device_put(out->next);
 }
 EXPORT_SYMBOL(omapdss_device_cleanup_output);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 943348912be8..4dd05bc732da 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -75,7 +75,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 {
 	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
 	struct omap_dss_device *output = omap_encoder->output;
-	struct omap_dss_device *dssdev;
 	struct drm_device *dev = encoder->dev;
 	struct drm_connector *connector;
 	struct drm_bridge *bridge;
@@ -98,9 +97,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	 *
 	 * A better solution is to use DRM's bus-flags through the whole driver.
 	 */
-	for (dssdev = output; dssdev; dssdev = dssdev->next)
-		omap_encoder_update_videomode_flags(&vm, dssdev->bus_flags);
-
 	for (bridge = output->bridge; bridge;
 	     bridge = drm_bridge_get_next_bridge(bridge)) {
 		if (!bridge->timings)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
