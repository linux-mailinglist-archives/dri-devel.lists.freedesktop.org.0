Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD79487019
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 03:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBED910EDCF;
	Fri,  7 Jan 2022 02:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAB310EDB2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 02:01:40 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i31so10181974lfv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 18:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=70+PdGpMJ5tp6zQgSExFrwrnDScoxbL2cjSa7HHuNKA=;
 b=kC29Jnv3J6vOrS75vtzgGtTxhPFxpLMUZqjPXx703qjFapTfrawemIt350gnmd0+QV
 RI9Tq3FvAM/lJrCu9KSkV6HzLcnorFDzzyXE2NZ7A4cL2ckeuzfgXGJkKpZz4nm9ziAC
 BTEqtPnYC5MVILQHazugrz68DG6qcZeRhZq4KEg1N6OXxVvzFa9JmDfM5foUqZjDKH0K
 770JiCFg3fVEaJd/2waZIJ3BQSFINMmjeUh3rPox2yi5WUnYXsa82lJcMqauOW2nvN44
 gSQK7X4QNm5Y+MiXv38QGblwp2pIn5+d4n/QxJwwshbn99/2z4/V6Qz+V1eMMS4ghN2e
 znlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=70+PdGpMJ5tp6zQgSExFrwrnDScoxbL2cjSa7HHuNKA=;
 b=EAf6ZJbOROg3scj3Y8UU6gFLttu83OtCY1su6M6hFyto7bQx+82Vzg71Asw247TyeJ
 5FGKNqQwF8rjNpYKR3sCrA2upByS77LPv+AILQJoHs6bvE/nSQD939iW9Ej+eFAyajP0
 NqJPpgqVFCJO2lbsh/un054re3m+39peoQhRqOA71cIprzdoQeum5vQSF01cb+2iYsL5
 DwvtS4YYcHoYWqSqbPLDSkw7TPHrZDLx7dZW1WTM7MNSsOKZApsKWYV5C/VXOcxVzn7N
 qAYU2ScMDeOz8CaYZcpm2fJFqEJ2tsZ6xbMTTNMH5r1PBN8E51hKeRyB05MhD1+8Pusy
 s+6g==
X-Gm-Message-State: AOAM533gAPlVEFKQyl+ucv0nU6l5737FURfDm5bdL4GXneP9K/MWR9Zh
 RCtnQTes5EcWEWy2F/1iix00Ag==
X-Google-Smtp-Source: ABdhPJyoSIZyjt0Mb6nfAUnntkuptKNLLDdPms9HSMCxLYivcyyfQ2D5U4kSK3juwCH7Vv3CfJmOAA==
X-Received: by 2002:a2e:b710:: with SMTP id j16mr49258463ljo.460.1641520899117; 
 Thu, 06 Jan 2022 18:01:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 18:01:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [RFC PATCH 4/7] drm/msm/dp: remove extra wrappers and public functions
Date: Fri,  7 Jan 2022 05:01:29 +0300
Message-Id: <20220107020132.587811-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dp_bridge's functions are thin wrappers around the msm_dp_display_*
family. Squash dp_bridge callbacks into respective msm_dp_display
functions, removing the latter functions from public space.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile        |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 184 +++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.h |   3 -
 drivers/gpu/drm/msm/dp/dp_drm.c     | 220 ----------------------------
 drivers/gpu/drm/msm/msm_drv.h       |  32 +---
 5 files changed, 171 insertions(+), 269 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 03ab55c37beb..354ccf793f4a 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -104,7 +104,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_catalog.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
-	dp/dp_drm.o \
 	dp/dp_hpd.o \
 	dp/dp_link.o \
 	dp/dp_panel.o \
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 539aac117184..7b4f40cb9a58 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -10,7 +10,9 @@
 #include <linux/component.h>
 #include <linux/of_irq.h>
 #include <linux/delay.h>
-#include <drm/drm_panel.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
@@ -30,6 +32,13 @@
 
 #define HPD_STRING_SIZE 30
 
+struct msm_dp_bridge {
+	struct drm_bridge bridge;
+	struct msm_dp *dp_display;
+};
+
+#define to_dp_display(x)     container_of((x), struct msm_dp_bridge, bridge)
+
 enum {
 	ISR_DISCONNECTED,
 	ISR_CONNECT_PENDING,
@@ -924,18 +933,30 @@ int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 	return 0;
 }
 
-int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
+static enum drm_mode_status dp_bridge_mode_valid(
+		struct drm_bridge *bridge,
+		const struct drm_display_info *info,
+		const struct drm_display_mode *mode)
 {
 	const u32 num_components = 3, default_bpp = 24;
 	struct dp_display_private *dp_display;
 	struct dp_link_info *link_info;
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
+	struct msm_dp *dp;
+	int mode_pclk_khz = mode->clock;
+
+	dp = to_dp_display(bridge)->dp_display;
 
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
 		return -EINVAL;
 	}
 
+	if ((dp->max_pclk_khz <= 0) ||
+			(dp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
+			(mode->clock > dp->max_pclk_khz))
+		return MODE_BAD;
+
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	link_info = &dp_display->panel->link_info;
 
@@ -1456,6 +1477,23 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	}
 }
 
+/* connector initialization */
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
+{
+	struct drm_connector *connector = NULL;
+
+	connector = drm_bridge_connector_init(dp_display->drm_dev,  dp_display->encoder);
+	if (IS_ERR(connector))
+		return connector;
+
+	drm_connector_attach_encoder(connector, dp_display->encoder);
+
+	return connector;
+}
+
+static struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+			struct drm_encoder *encoder);
+
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
@@ -1501,8 +1539,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	return 0;
 }
 
-int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
+static void dp_bridge_enable(struct drm_bridge *drm_bridge)
 {
+	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
 	int rc = 0;
 	struct dp_display_private *dp_display;
 	u32 state;
@@ -1510,7 +1550,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	if (!dp_display->dp_mode.drm_mode.clock) {
 		DRM_ERROR("invalid params\n");
-		return -EINVAL;
+		return;
 	}
 
 	mutex_lock(&dp_display->event_mutex);
@@ -1522,14 +1562,14 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		mutex_unlock(&dp_display->event_mutex);
-		return rc;
+		return;
 	}
 
 	rc = dp_display_prepare(dp);
 	if (rc) {
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
 		mutex_unlock(&dp_display->event_mutex);
-		return rc;
+		return;
 	}
 
 	state =  dp_display->hpd_state;
@@ -1554,23 +1594,23 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	dp_display->hpd_state = ST_CONNECTED;
 
 	mutex_unlock(&dp_display->event_mutex);
-
-	return rc;
 }
 
-int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
+static void dp_bridge_disable(struct drm_bridge *drm_bridge)
 {
+	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
 	struct dp_display_private *dp_display;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
 	dp_ctrl_push_idle(dp_display->ctrl);
-
-	return 0;
 }
 
-int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
+static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 {
+	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
 	int rc = 0;
 	u32 state;
 	struct dp_display_private *dp_display;
@@ -1597,13 +1637,14 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 	}
 
 	mutex_unlock(&dp_display->event_mutex);
-	return rc;
 }
 
-void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
+static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 				const struct drm_display_mode *mode,
 				const struct drm_display_mode *adjusted_mode)
 {
+	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
 	struct dp_display_private *dp_display;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
@@ -1626,3 +1667,118 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 	dp_display->dp_mode.h_active_low =
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 }
+
+static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
+{
+	struct msm_dp *dp;
+
+	dp = to_dp_display(bridge)->dp_display;
+
+	DRM_DEBUG_DP("is_connected = %s\n",
+		(dp->is_connected) ? "true" : "false");
+
+	return (dp->is_connected) ? connector_status_connected :
+					connector_status_disconnected;
+}
+
+static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
+{
+	int rc = 0;
+	struct msm_dp *dp;
+	struct dp_display_mode *dp_mode = NULL;
+	struct drm_display_mode *m, drm_mode;
+
+	if (!connector)
+		return 0;
+
+	dp = to_dp_display(bridge)->dp_display;
+
+	dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
+	if (!dp_mode)
+		return 0;
+
+	/* pluggable case assumes EDID is read when HPD */
+	if (dp->is_connected) {
+		/*
+		 *The get_modes() function might return one mode that is stored
+		 * in dp_mode when compliance test is in progress. If not, the
+		 * return value is equal to the total number of modes supported
+		 * by the sink
+		 */
+		rc = dp_display_get_modes(dp, dp_mode);
+		if (rc <= 0) {
+			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
+			kfree(dp_mode);
+			return rc;
+		}
+		if (dp_mode->drm_mode.clock) { /* valid DP mode */
+			memset(&drm_mode, 0x0, sizeof(drm_mode));
+			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
+			m = drm_mode_duplicate(connector->dev, &drm_mode);
+			if (!m) {
+				DRM_ERROR("failed to add mode %ux%u\n",
+				       drm_mode.hdisplay,
+				       drm_mode.vdisplay);
+				kfree(dp_mode);
+				return 0;
+			}
+			drm_mode_probed_add(connector, m);
+		}
+	} else {
+		DRM_DEBUG_DP("No sink connected\n");
+	}
+	kfree(dp_mode);
+	return rc;
+}
+
+static const struct drm_bridge_funcs dp_bridge_ops = {
+	.enable       = dp_bridge_enable,
+	.disable      = dp_bridge_disable,
+	.post_disable = dp_bridge_post_disable,
+	.mode_set     = dp_bridge_mode_set,
+	.mode_valid   = dp_bridge_mode_valid,
+	.get_modes    = dp_bridge_get_modes,
+	.detect       = dp_bridge_detect,
+};
+
+static struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+			struct drm_encoder *encoder)
+{
+	int rc;
+	struct msm_dp_bridge *dp_bridge;
+	struct drm_bridge *bridge;
+
+	dp_bridge = devm_kzalloc(dev->dev, sizeof(*dp_bridge), GFP_KERNEL);
+	if (!dp_bridge)
+		return ERR_PTR(-ENOMEM);
+
+	dp_bridge->dp_display = dp_display;
+
+	bridge = &dp_bridge->bridge;
+	bridge->funcs = &dp_bridge_ops;
+	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+
+	bridge->ops =
+		DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_HPD |
+		DRM_BRIDGE_OP_MODES;
+
+	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (rc) {
+		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
+		return ERR_PTR(rc);
+	}
+
+	if (dp_display->next_bridge) {
+		rc = drm_bridge_attach(dp_display->encoder,
+					dp_display->next_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (rc < 0) {
+			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
+			drm_bridge_remove(bridge);
+			return ERR_PTR(rc);
+		}
+	}
+
+	return bridge;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 7af2b186d2d9..cabf439af9ee 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -32,9 +32,6 @@ struct msm_dp {
 
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev);
-int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
-int dp_display_get_modes(struct msm_dp *dp_display,
-		struct dp_display_mode *dp_mode);
 int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
deleted file mode 100644
index 5f093d90d227..000000000000
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ /dev/null
@@ -1,220 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
- */
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_atomic.h>
-#include <drm/drm_bridge.h>
-#include <drm/drm_bridge_connector.h>
-#include <drm/drm_crtc.h>
-
-#include "msm_drv.h"
-#include "msm_kms.h"
-#include "dp_drm.h"
-
-
-struct msm_dp_bridge {
-	struct drm_bridge bridge;
-	struct msm_dp *dp_display;
-};
-
-#define to_dp_display(x)     container_of((x), struct msm_dp_bridge, bridge)
-
-/**
- * dp_bridge_detect - callback to determine if connector is connected
- * @bridge: Pointer to drm bridge structure
- * Returns: Bridge's 'is connected' status
- */
-static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
-{
-	struct msm_dp *dp;
-
-	dp = to_dp_display(bridge)->dp_display;
-
-	DRM_DEBUG_DP("is_connected = %s\n",
-		(dp->is_connected) ? "true" : "false");
-
-	return (dp->is_connected) ? connector_status_connected :
-					connector_status_disconnected;
-}
-
-/**
- * dp_connector_get_modes - callback to add drm modes via drm_mode_probed_add()
- * @bridge: Poiner to drm bridge
- * @connector: Pointer to drm connector structure
- * Returns: Number of modes added
- */
-static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
-{
-	int rc = 0;
-	struct msm_dp *dp;
-	struct dp_display_mode *dp_mode = NULL;
-	struct drm_display_mode *m, drm_mode;
-
-	if (!connector)
-		return 0;
-
-	dp = to_dp_display(bridge)->dp_display;
-
-	dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
-	if (!dp_mode)
-		return 0;
-
-	/* pluggable case assumes EDID is read when HPD */
-	if (dp->is_connected) {
-		/*
-		 *The get_modes() function might return one mode that is stored
-		 * in dp_mode when compliance test is in progress. If not, the
-		 * return value is equal to the total number of modes supported
-		 * by the sink
-		 */
-		rc = dp_display_get_modes(dp, dp_mode);
-		if (rc <= 0) {
-			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
-			kfree(dp_mode);
-			return rc;
-		}
-		if (dp_mode->drm_mode.clock) { /* valid DP mode */
-			memset(&drm_mode, 0x0, sizeof(drm_mode));
-			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
-			m = drm_mode_duplicate(connector->dev, &drm_mode);
-			if (!m) {
-				DRM_ERROR("failed to add mode %ux%u\n",
-				       drm_mode.hdisplay,
-				       drm_mode.vdisplay);
-				kfree(dp_mode);
-				return 0;
-			}
-			drm_mode_probed_add(connector, m);
-		}
-	} else {
-		DRM_DEBUG_DP("No sink connected\n");
-	}
-	kfree(dp_mode);
-	return rc;
-}
-
-/**
- * dp_bridge_mode_valid - callback to determine if specified mode is valid
- * @bridge: Pointer to drm bridge structure
- * @info: display info
- * @mode: Pointer to drm mode structure
- * Returns: Validity status for specified mode
- */
-static enum drm_mode_status dp_bridge_mode_valid(
-		struct drm_bridge *bridge,
-		const struct drm_display_info *info,
-		const struct drm_display_mode *mode)
-{
-	struct msm_dp *dp_disp;
-
-	dp_disp = to_dp_display(bridge)->dp_display;
-
-	if ((dp_disp->max_pclk_khz <= 0) ||
-			(dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
-			(mode->clock > dp_disp->max_pclk_khz))
-		return MODE_BAD;
-
-	return dp_display_validate_mode(dp_disp, mode->clock);
-}
-
-static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-				const struct drm_display_mode *mode,
-				const struct drm_display_mode *adjusted_mode)
-{
-	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
-	struct msm_dp *dp_display = dp_bridge->dp_display;
-
-	msm_dp_display_mode_set(dp_display, drm_bridge->encoder, mode, adjusted_mode);
-}
-
-static void dp_bridge_enable(struct drm_bridge *drm_bridge)
-{
-	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
-	struct msm_dp *dp_display = dp_bridge->dp_display;
-
-	msm_dp_display_enable(dp_display, drm_bridge->encoder);
-}
-
-static void dp_bridge_disable(struct drm_bridge *drm_bridge)
-{
-	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
-	struct msm_dp *dp_display = dp_bridge->dp_display;
-
-	msm_dp_display_pre_disable(dp_display, drm_bridge->encoder);
-}
-
-static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
-{
-	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
-	struct msm_dp *dp_display = dp_bridge->dp_display;
-
-	msm_dp_display_disable(dp_display, drm_bridge->encoder);
-}
-
-static const struct drm_bridge_funcs dp_bridge_ops = {
-	.enable       = dp_bridge_enable,
-	.disable      = dp_bridge_disable,
-	.post_disable = dp_bridge_post_disable,
-	.mode_set     = dp_bridge_mode_set,
-	.mode_valid   = dp_bridge_mode_valid,
-	.get_modes    = dp_bridge_get_modes,
-	.detect       = dp_bridge_detect,
-};
-
-struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
-			struct drm_encoder *encoder)
-{
-	int rc;
-	struct msm_dp_bridge *dp_bridge;
-	struct drm_bridge *bridge;
-
-	dp_bridge = devm_kzalloc(dev->dev, sizeof(*dp_bridge), GFP_KERNEL);
-	if (!dp_bridge)
-		return ERR_PTR(-ENOMEM);
-
-	dp_bridge->dp_display = dp_display;
-
-	bridge = &dp_bridge->bridge;
-	bridge->funcs = &dp_bridge_ops;
-	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
-
-	bridge->ops =
-		DRM_BRIDGE_OP_DETECT |
-		DRM_BRIDGE_OP_HPD |
-		DRM_BRIDGE_OP_MODES;
-
-	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (rc) {
-		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
-		return ERR_PTR(rc);
-	}
-
-	if (dp_display->next_bridge) {
-		rc = drm_bridge_attach(dp_display->encoder,
-					dp_display->next_bridge, bridge,
-					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-		if (rc < 0) {
-			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
-			drm_bridge_remove(bridge);
-			return ERR_PTR(rc);
-		}
-	}
-
-	return bridge;
-}
-
-/* connector initialization */
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
-{
-	struct drm_connector *connector = NULL;
-
-	connector = drm_bridge_connector_init(dp_display->drm_dev,  dp_display->encoder);
-	if (IS_ERR(connector))
-		return connector;
-
-	drm_connector_attach_encoder(connector, dp_display->encoder);
-
-	return connector;
-}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d7574e6bd4e4..a48e0737692c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -385,16 +385,7 @@ int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			 struct drm_encoder *encoder);
-int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
-int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
-int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
-void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
-				const struct drm_display_mode *mode,
-				const struct drm_display_mode *adjusted_mode);
-
-struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display,
-					struct drm_device *dev,
-					struct drm_encoder *encoder);
+
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
@@ -414,27 +405,6 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 {
 	return -EINVAL;
 }
-static inline int msm_dp_display_enable(struct msm_dp *dp,
-					struct drm_encoder *encoder)
-{
-	return -EINVAL;
-}
-static inline int msm_dp_display_disable(struct msm_dp *dp,
-					struct drm_encoder *encoder)
-{
-	return -EINVAL;
-}
-static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
-					struct drm_encoder *encoder)
-{
-	return -EINVAL;
-}
-static inline void msm_dp_display_mode_set(struct msm_dp *dp,
-				struct drm_encoder *encoder,
-				const struct drm_display_mode *mode,
-				const struct drm_display_mode *adjusted_mode)
-{
-}
 
 static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 {
-- 
2.34.1

