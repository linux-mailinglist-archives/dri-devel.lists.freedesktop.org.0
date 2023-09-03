Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A7790E8D
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937C210E21A;
	Sun,  3 Sep 2023 21:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E76510E21A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:49:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-500bb392ab7so1462618e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777775; x=1694382575; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RH2u3GK5yqrU5VNyFF2xDepXs0ge4/C129Kp+nmuvLg=;
 b=YwrhToQjLZ75X7k3wwXeiLY++iDsH5kTQEvBQ8Kjg7VHwhPz7ek3HgY29PuZ4VlsVd
 whcFaFCDDhK1pQXtq0Z8/jUwPcAS5qtgiYdjL8z82bgMIE+uzYKkNiJ7sfS36eVsVR0y
 r/6plJaNw/IY54Wh94cYJ3fuFbdlSA7O4AQSLhOoJ4Al7WJaHnZMJnAIl2kb7CUxcrma
 urHx++/lAMAXV39dGgw0px8H+o/srJLkZsw1sDah9jNRIrIPMQPjKyZcUGV2irZg75B4
 2UkbU1WJ4DUiPQPvp1IVGmR0GkH9OjsrQaVW1dRKmUKc8HEQq+T6ufwPfZBKBxCZ0PzD
 LxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777775; x=1694382575;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RH2u3GK5yqrU5VNyFF2xDepXs0ge4/C129Kp+nmuvLg=;
 b=GLmrDPky5exXO8Nx5bwvZiQD01F8QXJcTJpA3rkH6ipVhFO2nhM03zj8Ig/r5k1/XN
 qIWoxNa4ot01U4R0NuunnYNU+yLi0sQzBkSY2cU+DKhdz+KxsEE2wL2LBKQ6KS3yuZrk
 gyk+gYtKWpDuORfxpBn9ELs7MhVOjVegSp65HrNSlE/KJk1UJyVsnPf/XdvD7RqhSwLi
 B8ebNxQTfj+1CR76gBv0sPMJwuLp+spqtRfpUbOkxQfuFxasQUSjBjrLt0t6kJQhSQqI
 +bQ7sao8aaiaYY6gqnqRW14A7qoNmGjA5HUHYwVsQGW9IAAAghrZEuqroO4oxN2ZvaZC
 EpbQ==
X-Gm-Message-State: AOJu0YzURgK6C5tXbCs9vsUuq/7GGLH0cWeYznemxJddiVID1GgPs1eM
 U29nIsR1/zJ0qss4X7tP8IakXA==
X-Google-Smtp-Source: AGHT+IFmucroqyzq+FST07tiKTP1u29Ja4cLxaBFTJ2mXP1fQUr4CaH0OYR8G1W472Qv6F9lJvcnFw==
X-Received: by 2002:a19:6402:0:b0:4f8:770f:1b01 with SMTP id
 y2-20020a196402000000b004f8770f1b01mr4395254lfb.19.1693777775426; 
 Sun, 03 Sep 2023 14:49:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a19f607000000b004fe4833ca5csm1405609lfe.237.2023.09.03.14.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:49:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2] drm/bridge-connector: handle subconnector types
Date: Mon,  4 Sep 2023 00:49:34 +0300
Message-Id: <20230903214934.2877259-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the created connector type supports subconnector type property,
create and attach corresponding it. The default subtype value is 0,
which maps to the DRM_MODE_SUBCONNECTOR_Unknown type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

This is a leftover of my previous attempt to implement USB-C DisplayPort
uABI. The idea was dropped, but I consider this part still to be useful,
as it allows one to register corresponding subconnector properties and
also to export the subconnector type.

Changes since v1:
 - Dropped all DP and USB-related patches
 - Dropped the patch adding default subtype to
   drm_connector_attach_dp_subconnector_property()
 - Replaced creation of TV subconnector property with the check that it
   was created beforehand (Neil, Laurent)

---
 drivers/gpu/drm/drm_bridge_connector.c | 29 +++++++++++++++++++++++++-
 include/drm/drm_bridge.h               |  4 ++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index ca255609fb08..74a3164825dd 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -332,6 +332,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
 	const char *path = NULL;
+	enum drm_mode_subconnector subconnector;
 	int connector_type;
 	int ret;
 
@@ -369,8 +370,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (bridge->ops & DRM_BRIDGE_OP_MODES)
 			bridge_connector->bridge_modes = bridge;
 
-		if (!drm_bridge_get_next_bridge(bridge))
+		if (!drm_bridge_get_next_bridge(bridge)) {
 			connector_type = bridge->type;
+			subconnector = bridge->subtype;
+		}
 
 		if (!drm_bridge_get_next_bridge(bridge) &&
 		    bridge->of_node)
@@ -418,6 +421,30 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		drm_connector_attach_dp_subconnector_property(connector);
+	} else if (connector_type == DRM_MODE_CONNECTOR_DVII) {
+		ret = drm_mode_create_dvi_i_properties(drm);
+		if (ret)
+			return ERR_PTR(ret);
+
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.dvi_i_subconnector_property,
+					   subconnector);
+	} else if (connector_type == DRM_MODE_CONNECTOR_TV &&
+		   subconnector) {
+		/*
+		 * We do not know which modes are supported by the HW, so the
+		 * property should be created in advance.
+		 */
+		if (!drm->mode_config.tv_subconnector_property)
+			return ERR_PTR(-EINVAL);
+
+		drm_object_attach_property(&connector->base,
+					   drm->mode_config.tv_subconnector_property,
+					   subconnector);
+	}
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index afa1de791075..440a8aa91e65 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -738,6 +738,10 @@ struct drm_bridge {
 	 * identifies the type of connected display.
 	 */
 	int type;
+	/**
+	 * @subtype: the subtype of the connector for the DP/TV/DVI-I cases.
+	 */
+	enum drm_mode_subconnector subtype;
 	/**
 	 * @interlace_allowed: Indicate that the bridge can handle interlaced
 	 * modes.
-- 
2.39.2

