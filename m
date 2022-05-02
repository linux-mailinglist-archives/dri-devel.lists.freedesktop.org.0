Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D3C5174FA
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0D210F167;
	Mon,  2 May 2022 16:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0FF10F167
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:51:37 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id l16so8506508oil.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQqGy9/cAtVs0rYLMmKAdIwpOUTHX81bUyFE+Uvv2gE=;
 b=NcXfUDSWHsIAofMX/GKhg1VN4gKrGgzzc/Kb/ahx4U1bLirmQsRQkwYr9kPzv9BrUI
 XyokdoAYCCDvYD1v+EHnatssF+T8x8GdlO1M+uq+j0Qgsej/GuduhNlhQHgXqevnRBDT
 fOCWLNBmTJpm3VfQlSzhf/m8/BI1H4ry+oczo5XCLDWu5YcXjeEOIV8Vlvs1BSUk+rlr
 gF2rmTZKI9EsC+45WyhPEsqtmgcSNb8vQOGshtfU/FSxHRTfiQYv3tvbz9wuRalASvZR
 T28f5WI3egA6226XuKPIdX+8we5ZyVhXngq/+FRYFTn4Onkwi/RgBGsOVXB1HrGbFvLy
 6yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQqGy9/cAtVs0rYLMmKAdIwpOUTHX81bUyFE+Uvv2gE=;
 b=p7JZga6Bux01rQb6oPXDgnj58M9ZoExQfWnIKSU9sWcC6oqSLJsjZUXMX279NzPk7l
 U+u0yezrcMsJniRZWAcg8WA6ng5LscVNWKbldOb3jqzDBykJVgPtb2JK9r3iFY3/BZgm
 41X6cEG7Nu6Hj/S6yth5mQtf+UBohyp1V9k/jdEqMW30DbDrDa2KSf3xk5Kcvd+fj4GB
 LKlSElgSDGRHlen2dyHNFct5updo+QVbmIQGF5Qr0rJsfOYlYNzZ9LlPm6rF1AoNYAS1
 8Tbn83FKZN8kD+pQ9sWb76rU68p2q0h5qPeGhxBWcBk6o8EWzQ6l3YhdPdRI6d8wer5i
 EDgw==
X-Gm-Message-State: AOAM531YxGzFRuFVrArf5CG2K6kwyGeGuOGDhJThro3y9636R/G1AEyp
 EadgE5ww4U16FYoRgLv+NXtm1A==
X-Google-Smtp-Source: ABdhPJxGUGnYgijgOuwgEEEHawCtTKNkif8bNgtzd1O6MMWsWF1x8UKYWT5NJqYOoLdQVxWq53KdlQ==
X-Received: by 2002:a05:6808:2396:b0:325:b6e:6cf0 with SMTP id
 bp22-20020a056808239600b003250b6e6cf0mr22930oib.288.1651510297242; 
 Mon, 02 May 2022 09:51:37 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 h11-20020a4add8b000000b0035eb4e5a6ccsm4029422oov.34.2022.05.02.09.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:51:36 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v4 5/5] drm/msm/dp: Implement hpd_notify()
Date: Mon,  2 May 2022 09:53:16 -0700
Message-Id: <20220502165316.4167199-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
References: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Qualcomm DisplayPort driver contains traces of the necessary
plumbing to hook up USB HPD, in the form of the dp_hpd module and the
dp_usbpd_cb struct. Use this as basis for implementing the
hpd_notify() callback, by amending the dp_hpd module with the
missing logic.

Overall the solution is similar to what's done downstream, but upstream
all the code to disect the HPD notification lives on the calling side of
drm_connector_oob_hotplug_event().

drm_connector_oob_hotplug_event() performs the lookup of the
drm_connector based on fwnode, hence the need to assign the fwnode in
dp_drm_connector_init().

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Implements hpd_notify instead of oob_hotplug_event
- Rebased on new cleanup patch from Dmitry
- Set hpd_state to ST_MAINLINK_READY when dp_display_usbpd_configure() succeeds

 drivers/gpu/drm/msm/dp/dp_display.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  3 +++
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 4 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b447446d75e9..080294ac6144 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -83,6 +83,8 @@ struct dp_display_private {
 	bool hpd_irq_on;
 	bool audio_supported;
 
+	bool connected;
+
 	struct drm_device *drm_dev;
 	struct platform_device *pdev;
 	struct dentry *root;
@@ -1271,6 +1273,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
+	dp->dp_display.dev = &pdev->dev;
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 	dp->dp_display.connector_type = desc->connector_type;
@@ -1760,3 +1763,26 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	dp_display->dp_mode.h_active_low =
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 }
+
+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			  enum drm_connector_status status)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
+	struct dp_display_private *dp_display = container_of(dp, struct dp_display_private, dp_display);
+	int ret;
+
+	drm_dbg_dp(dp_display->drm_dev, "status: %d connected: %d\n", status, dp_display->connected);
+
+	if (!dp_display->connected && status == connector_status_connected) {
+		dp_display->connected = true;
+		ret = dp_display_usbpd_configure(dp_display);
+		if (!ret)
+			dp_display->hpd_state = ST_MAINLINK_READY;
+	} else if (status != connector_status_connected) {
+		dp_display->connected = false;
+		dp_display_notify_disconnect(dp_display);
+	} else {
+		dp_display_usbpd_attention(dp_display);
+	}
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 4f9fe4d7610b..2d2614bc5a14 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -11,6 +11,7 @@
 #include "disp/msm_disp_snapshot.h"
 
 struct msm_dp {
+	struct device *dev;
 	struct drm_device *drm_dev;
 	struct device *codec_dev;
 	struct drm_bridge *bridge;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 62d58b9c4647..821cfd37b1fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -68,6 +68,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.mode_valid   = dp_bridge_mode_valid,
 	.get_modes    = dp_bridge_get_modes,
 	.detect       = dp_bridge_detect,
+	.hpd_notify   = dp_bridge_hpd_notify,
 };
 
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
@@ -138,6 +139,8 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 	if (IS_ERR(connector))
 		return connector;
 
+	connector->fwnode = fwnode_handle_get(dev_fwnode(dp_display->dev));
+
 	drm_connector_attach_encoder(connector, dp_display->encoder);
 
 	return connector;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index f4b1ed1e24f7..3b7480a86844 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -32,5 +32,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 			const struct drm_display_mode *mode,
 			const struct drm_display_mode *adjusted_mode);
+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			  enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
-- 
2.35.1

