Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B44B30EB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C507210EBB8;
	Fri, 11 Feb 2022 22:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6136810EBAD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 22:40:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id o2so19275451lfd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 14:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SBUYoGN6o4Dyxbi6sA/h7qKj6NEx5YhCR4BssGplT28=;
 b=afFOmyEXvgJZcDXWgSX+Y2jf62X9o6x/8F+IcpChySQ11pwH33JrfVkS7Fy40LVWOm
 5Gb1rLUoQb9166elS3WQvb9yRdn4Vp+5aCHWb9DDHko4WLPGxSPosIQiCLPaeQreEwXa
 t/FB3k8wJEKVCUX1gNxiYfsszkdiKKEV476+PlUM1pQq8fEu7MZbmHMmkLuhlLOJz5N7
 S+GDMmeHtVsJbFehFdra3DMrqxX8CYmo9jcwku8j1xOobkQrh6r0J73EUBxsAY2+e+GX
 9MKli1AqewqwZbSKkoJemkq69TgJ9ZOALfITCGdXGPGSLpI9+SqgE+mQxZWtYFn69NLR
 2olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SBUYoGN6o4Dyxbi6sA/h7qKj6NEx5YhCR4BssGplT28=;
 b=sTPGnZU4F9CVeK75S9ir/GDg+zGqSOoHO/a3w0/KX9JkV3qkYKl9+4+RnejuLV0rSj
 jiXwi3J71tnKfuhUwI+1h2oenbBpiK3JjqZ2MCjQ19g0n9sDZF3WZ4v7nwlNUZncQZ7i
 8qSPPPwYvilQU/DCcCdlR1tGK2kl2XXkOdxFJJkvUr7n8Ii1jEsVFQYjPqDJR/1az/VC
 ES8DPXNJmCW+scUYTbZp9+QGX+8gYbHd889ZyU9dCnrOhVn1sN66k5R+KWfaoJS+jHBi
 zLVfscOWMP1cFwyLFKDv+TRCZ8Z/0/OsngVpe0z7EyygajJ0/qKx28ZhLv4iT8x+tc7M
 fY5Q==
X-Gm-Message-State: AOAM531YSB4Wgztu+SZNwvVZFrvv6daX0pVXVWM+W4pbSX51lpNLD+XX
 SLIljphx30u0MFDoCI6HFjVfIA==
X-Google-Smtp-Source: ABdhPJx+yksoVf1BYs+eq1gvUYebiHfWyzuziNR8u/rc3thJz8XIPF/6WygOjDBNAwZQxqw9qaN1iQ==
X-Received: by 2002:a05:6512:128f:: with SMTP id
 u15mr2743104lfs.359.1644619211687; 
 Fri, 11 Feb 2022 14:40:11 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a6sm3319983ljb.93.2022.02.11.14.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:40:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [RFC PATCH v2 5/5] drm/msm/dp: remove extra wrappers and public
 functions
Date: Sat, 12 Feb 2022 01:40:06 +0300
Message-Id: <20220211224006.1797846-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/dp/dp_display.c | 54 +++++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 -
 drivers/gpu/drm/msm/dp/dp_drm.c     | 72 ++---------------------------
 drivers/gpu/drm/msm/dp/dp_drm.h     | 22 ++++++++-
 drivers/gpu/drm/msm/msm_drv.h       | 31 -------------
 5 files changed, 60 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 59e5e5b8e5b4..a9b641a68bff 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -10,7 +10,6 @@
 #include <linux/component.h>
 #include <linux/of_irq.h>
 #include <linux/delay.h>
-#include <drm/drm_panel.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
@@ -945,18 +944,36 @@ int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 	return 0;
 }
 
-int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
+/**
+ * dp_bridge_mode_valid - callback to determine if specified mode is valid
+ * @bridge: Pointer to drm bridge structure
+ * @info: display info
+ * @mode: Pointer to drm mode structure
+ * Returns: Validity status for specified mode
+ */
+enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
+					  const struct drm_display_info *info,
+					  const struct drm_display_mode *mode)
 {
 	const u32 num_components = 3, default_bpp = 24;
 	struct dp_display_private *dp_display;
 	struct dp_link_info *link_info;
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
+	struct msm_dp *dp;
+	int mode_pclk_khz = mode->clock;
+
+	dp = to_dp_bridge(bridge)->dp_display;
 
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
 
@@ -1501,7 +1518,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_display->encoder = encoder;
 
-	dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
+	dp_display->bridge = dp_bridge_init(dp_display, dev, encoder);
 	if (IS_ERR(dp_display->bridge)) {
 		ret = PTR_ERR(dp_display->bridge);
 		DRM_DEV_ERROR(dev->dev,
@@ -1528,8 +1545,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	return 0;
 }
 
-int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
+void dp_bridge_enable(struct drm_bridge *drm_bridge)
 {
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
 	int rc = 0;
 	struct dp_display_private *dp_display;
 	u32 state;
@@ -1537,7 +1556,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	if (!dp_display->dp_mode.drm_mode.clock) {
 		DRM_ERROR("invalid params\n");
-		return -EINVAL;
+		return;
 	}
 
 	mutex_lock(&dp_display->event_mutex);
@@ -1549,14 +1568,14 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
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
@@ -1581,23 +1600,23 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	dp_display->hpd_state = ST_CONNECTED;
 
 	mutex_unlock(&dp_display->event_mutex);
-
-	return rc;
 }
 
-int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
+void dp_bridge_disable(struct drm_bridge *drm_bridge)
 {
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
 	struct dp_display_private *dp_display;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
 	dp_ctrl_push_idle(dp_display->ctrl);
-
-	return 0;
 }
 
-int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
+void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 {
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
 	int rc = 0;
 	u32 state;
 	struct dp_display_private *dp_display;
@@ -1624,13 +1643,14 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 	}
 
 	mutex_unlock(&dp_display->event_mutex);
-	return rc;
 }
 
-void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
-				const struct drm_display_mode *mode,
-				const struct drm_display_mode *adjusted_mode)
+void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
+			const struct drm_display_mode *mode,
+			const struct drm_display_mode *adjusted_mode)
 {
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
 	struct dp_display_private *dp_display;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 7af2b186d2d9..49a1d89681ac 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -32,7 +32,6 @@ struct msm_dp {
 
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev);
-int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
 int dp_display_get_modes(struct msm_dp *dp_display,
 		struct dp_display_mode *dp_mode);
 int dp_display_request_irq(struct msm_dp *dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 57800b865fe6..7ce1aca48687 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -13,14 +13,6 @@
 #include "msm_kms.h"
 #include "dp_drm.h"
 
-
-struct msm_dp_bridge {
-	struct drm_bridge bridge;
-	struct msm_dp *dp_display;
-};
-
-#define to_dp_display(x)     container_of((x), struct msm_dp_bridge, bridge)
-
 /**
  * dp_bridge_detect - callback to determine if connector is connected
  * @bridge: Pointer to drm bridge structure
@@ -30,7 +22,7 @@ static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
 {
 	struct msm_dp *dp;
 
-	dp = to_dp_display(bridge)->dp_display;
+	dp = to_dp_bridge(bridge)->dp_display;
 
 	DRM_DEBUG_DP("is_connected = %s\n",
 		(dp->is_connected) ? "true" : "false");
@@ -55,7 +47,7 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 	if (!connector)
 		return 0;
 
-	dp = to_dp_display(bridge)->dp_display;
+	dp = to_dp_bridge(bridge)->dp_display;
 
 	dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
 	if (!dp_mode)
@@ -95,64 +87,6 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 	return rc;
 }
 
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
 static const struct drm_bridge_funcs dp_bridge_ops = {
 	.enable       = dp_bridge_enable,
 	.disable      = dp_bridge_disable,
@@ -163,7 +97,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.detect       = dp_bridge_detect,
 };
 
-struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
 	int rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index c27bfceefdf0..f4b1ed1e24f7 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -7,12 +7,30 @@
 #define _DP_DRM_H_
 
 #include <linux/types.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
+#include <drm/drm_bridge.h>
 
 #include "msm_drv.h"
 #include "dp_display.h"
 
+struct msm_dp_bridge {
+	struct drm_bridge bridge;
+	struct msm_dp *dp_display;
+};
+
+#define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
+
 struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display);
+struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+			struct drm_encoder *encoder);
+
+void dp_bridge_enable(struct drm_bridge *drm_bridge);
+void dp_bridge_disable(struct drm_bridge *drm_bridge);
+void dp_bridge_post_disable(struct drm_bridge *drm_bridge);
+enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
+					  const struct drm_display_info *info,
+					  const struct drm_display_mode *mode);
+void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
+			const struct drm_display_mode *mode,
+			const struct drm_display_mode *adjusted_mode);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d7574e6bd4e4..b698a3be6072 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -385,16 +385,6 @@ int __init msm_dp_register(void);
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
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
@@ -414,27 +404,6 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
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

