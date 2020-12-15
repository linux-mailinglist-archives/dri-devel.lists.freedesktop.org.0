Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE9C2DAB3A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8419B6E235;
	Tue, 15 Dec 2020 10:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8E76E21A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:43 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlhdh010624
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029263;
 bh=Ce+LTcjft18r/lPZT2u+y+j9c9npn5UdpHLXOoOabAU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=mHIfgVOSNsH+5WVLTIxhkTIsm3bzNNaQlZRVZmQKNpk1AMC7EfAWycx4yQwSyOzRg
 QSPI4Xz703YfYAydKlodXzGKbz13T8LdKQ7QAHvBAOpxABavaBGrxoyoc38ojFTZfA
 WyoYwV8NVmPnkpq4Hj54vN/07o2SgpKJ2XWgqKtw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlhQv023359
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:43 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:42 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:42 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaS046467;
 Tue, 15 Dec 2020 04:47:42 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 42/84] drm/omap: remove unused omap_connector
Date: Tue, 15 Dec 2020 12:46:15 +0200
Message-ID: <20201215104657.802264-43-tomi.valkeinen@ti.com>
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

Remove unused code. Connectors are now created via drm_bridge_connector_init()
and no longer OMAP specific.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/Makefile         |   1 -
 drivers/gpu/drm/omapdrm/omap_connector.c | 128 -----------------------
 drivers/gpu/drm/omapdrm/omap_connector.h |  28 -----
 drivers/gpu/drm/omapdrm/omap_drv.c       |  19 ++--
 drivers/gpu/drm/omapdrm/omap_drv.h       |   1 -
 drivers/gpu/drm/omapdrm/omap_encoder.c   |  19 ----
 6 files changed, 6 insertions(+), 190 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.c
 delete mode 100644 drivers/gpu/drm/omapdrm/omap_connector.h

diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
index 66a73eae6f7c..2a404e045b78 100644
--- a/drivers/gpu/drm/omapdrm/Makefile
+++ b/drivers/gpu/drm/omapdrm/Makefile
@@ -12,7 +12,6 @@ omapdrm-y := omap_drv.o \
 	omap_crtc.o \
 	omap_plane.o \
 	omap_encoder.o \
-	omap_connector.o \
 	omap_fb.o \
 	omap_gem.o \
 	omap_gem_dmabuf.o \
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
deleted file mode 100644
index 9d14a314e564..000000000000
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ /dev/null
@@ -1,128 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
- * Author: Rob Clark <rob@ti.com>
- */
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_probe_helper.h>
-
-#include "omap_drv.h"
-
-/*
- * connector funcs
- */
-
-#define to_omap_connector(x) container_of(x, struct omap_connector, base)
-
-struct omap_connector {
-	struct drm_connector base;
-	struct omap_dss_device *output;
-};
-
-static enum drm_connector_status omap_connector_detect(
-		struct drm_connector *connector, bool force)
-{
-	return connector_status_connected;
-}
-
-static void omap_connector_destroy(struct drm_connector *connector)
-{
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-
-	DBG("%s", connector->name);
-
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-
-	omapdss_device_put(omap_connector->output);
-
-	kfree(omap_connector);
-}
-
-static int omap_connector_get_modes(struct drm_connector *connector)
-{
-	DBG("%s", connector->name);
-
-	/* We can't retrieve modes. The KMS core will add the default modes. */
-	return 0;
-}
-
-enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
-					const struct drm_display_mode *mode,
-					struct drm_display_mode *adjusted_mode)
-{
-	return MODE_OK;
-}
-
-static enum drm_mode_status omap_connector_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
-{
-	struct omap_connector *omap_connector = to_omap_connector(connector);
-	struct drm_display_mode new_mode = {};
-	enum drm_mode_status status;
-
-	status = omap_connector_mode_fixup(omap_connector->output, mode,
-					   &new_mode);
-	if (status != MODE_OK)
-		goto done;
-
-	/* Check if vrefresh is still valid. */
-	if (drm_mode_vrefresh(mode) != drm_mode_vrefresh(&new_mode))
-		status = MODE_NOCLOCK;
-
-done:
-	DBG("connector: mode %s: " DRM_MODE_FMT,
-			(status == MODE_OK) ? "valid" : "invalid",
-			DRM_MODE_ARG(mode));
-
-	return status;
-}
-
-static const struct drm_connector_funcs omap_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.detect = omap_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = omap_connector_destroy,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs omap_connector_helper_funcs = {
-	.get_modes = omap_connector_get_modes,
-	.mode_valid = omap_connector_mode_valid,
-};
-
-/* initialize connector */
-struct drm_connector *omap_connector_init(struct drm_device *dev,
-					  struct omap_dss_device *output,
-					  struct drm_encoder *encoder)
-{
-	struct drm_connector *connector = NULL;
-	struct omap_connector *omap_connector;
-
-	DBG("%s", output->name);
-
-	omap_connector = kzalloc(sizeof(*omap_connector), GFP_KERNEL);
-	if (!omap_connector)
-		goto fail;
-
-	omap_connector->output = omapdss_device_get(output);
-
-	connector = &omap_connector->base;
-	connector->interlace_allowed = 1;
-	connector->doublescan_allowed = 0;
-
-	drm_connector_init(dev, connector, &omap_connector_funcs,
-			   DRM_MODE_CONNECTOR_DSI);
-	drm_connector_helper_add(connector, &omap_connector_helper_funcs);
-
-	return connector;
-
-fail:
-	if (connector)
-		omap_connector_destroy(connector);
-
-	return NULL;
-}
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.h b/drivers/gpu/drm/omapdrm/omap_connector.h
deleted file mode 100644
index 0ecd4f1655b7..000000000000
--- a/drivers/gpu/drm/omapdrm/omap_connector.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * omap_connector.h -- OMAP DRM Connector
- *
- * Copyright (C) 2011 Texas Instruments
- * Author: Rob Clark <rob@ti.com>
- */
-
-#ifndef __OMAPDRM_CONNECTOR_H__
-#define __OMAPDRM_CONNECTOR_H__
-
-#include <linux/types.h>
-
-enum drm_mode_status;
-
-struct drm_connector;
-struct drm_device;
-struct drm_encoder;
-struct omap_dss_device;
-
-struct drm_connector *omap_connector_init(struct drm_device *dev,
-					  struct omap_dss_device *output,
-					  struct drm_encoder *encoder);
-enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
-					const struct drm_display_mode *mode,
-					struct drm_display_mode *adjusted_mode);
-
-#endif /* __OMAPDRM_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 825478c01968..81e0972c07cc 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -332,19 +332,12 @@ static int omap_modeset_init(struct drm_device *dev)
 		struct drm_encoder *encoder = pipe->encoder;
 		struct drm_crtc *crtc;
 
-		if (pipe->output->next) {
-			pipe->connector = omap_connector_init(dev, pipe->output,
-							      encoder);
-			if (!pipe->connector)
-				return -ENOMEM;
-		} else {
-			pipe->connector = drm_bridge_connector_init(dev, encoder);
-			if (IS_ERR(pipe->connector)) {
-				dev_err(priv->dev,
-					"unable to create bridge connector for %s\n",
-					pipe->output->name);
-				return PTR_ERR(pipe->connector);
-			}
+		pipe->connector = drm_bridge_connector_init(dev, encoder);
+		if (IS_ERR(pipe->connector)) {
+			dev_err(priv->dev,
+				"unable to create bridge connector for %s\n",
+				pipe->output->name);
+			return PTR_ERR(pipe->connector);
 		}
 
 		drm_connector_attach_encoder(pipe->connector, encoder);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index ae57e7ada876..38e15962c980 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -16,7 +16,6 @@
 #include <drm/drm_gem.h>
 #include <drm/omap_drm.h>
 
-#include "omap_connector.h"
 #include "omap_crtc.h"
 #include "omap_encoder.h"
 #include "omap_fb.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index e378c8751e11..943348912be8 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -117,27 +117,8 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	dss_mgr_set_timings(output, &vm);
 }
 
-static int omap_encoder_atomic_check(struct drm_encoder *encoder,
-				     struct drm_crtc_state *crtc_state,
-				     struct drm_connector_state *conn_state)
-{
-	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
-	enum drm_mode_status status;
-
-	status = omap_connector_mode_fixup(omap_encoder->output,
-					   &crtc_state->mode,
-					   &crtc_state->adjusted_mode);
-	if (status != MODE_OK) {
-		dev_err(encoder->dev->dev, "invalid timings: %d\n", status);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static const struct drm_encoder_helper_funcs omap_encoder_helper_funcs = {
 	.mode_set = omap_encoder_mode_set,
-	.atomic_check = omap_encoder_atomic_check,
 };
 
 /* initialize encoder */
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
