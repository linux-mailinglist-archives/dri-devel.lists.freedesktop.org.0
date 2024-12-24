Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16E9FC2D6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 00:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9D410E33D;
	Tue, 24 Dec 2024 23:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zIBaJrfK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A537010E33D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 23:11:40 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3003943288bso61444511fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 15:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735081839; x=1735686639; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CdewCk/PRTWQN0dylNFNsSEtCEp3tuP1E7w2vIr9TcQ=;
 b=zIBaJrfK+ZqW7/+pbtV7Tn9AvWpPdcFEsWh/7Oqz4+WMcOrB8j2FerveOAR/yTseFi
 dlj3MC/HefQK2sbJkp+Irm5drIixmNA01BdzrK2tvbxXFxL2/EinU6+gr21bc3UQGCFi
 NT6LhhWMHPCL0o1zwWuDouMXeVkIWwZjhBe+l0O9C1HK4q0ksTnp3WZXkxaVloHrQzU9
 gwX0zm/u5Yiry4n1ReuHrX59Dt5YTn33f2gIrranqH/uuIGgC38OrzJ9rlZXV6bXhiCy
 SorvbjlNZvICigVUl2DC06/CjD2LhZZo4wzh4QssRktnw5j1Pk/Z7SccpyKt7y+doevM
 t3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735081839; x=1735686639;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CdewCk/PRTWQN0dylNFNsSEtCEp3tuP1E7w2vIr9TcQ=;
 b=ZRiuCqcaFF9btbFe4It1VWPb+D5EmrDzhNpt8fic4nsruOv3rAR8gUFYuS1DZkIJ5e
 X8CaJKp1Fo/3a3daVMNOGYnZFUOP2753/LkJcLstEYvFOkIOVCwEhHkrwlTJkzRtVz35
 x2C4YmxU6sJE1e/EmxWx1aPEyytGFR6qX12CiEFLe4Q5mZ/i321DsMAk0Oi61/3xfXVJ
 tLR0K5XsooSaySYULxlN+4cCmAwgA+USgLxLPQ1cMVAk7dPwuTvbsWaRGpg2W6KZIGd6
 oim+VVacjYePZl5Sbb38ON/wZz+gxGgAruOD0HUu1SGKAntCbIh1u41zrWGfNO5L46Rk
 I3Qg==
X-Gm-Message-State: AOJu0YySWsfB9RTB9fZrgM+YNojoz8SLJ4y2pRSuLQ5l4UFW46sPpuGS
 ttvjS9ivggpVEZpIsAmdXjx3Pz+D1gMqUV/8o71O3WGFpJHPMnfPkwaPmRJ39L4=
X-Gm-Gg: ASbGncvTyuxSErTJzIVQ3xNwlNn35uu1+Gi0oS5MZ7XjL5ZxB6l4dYMHMOyqzwpBxEW
 X8WH5iaScPrqA94WApOYkC5MWerGYMHqfLi1H3rRoZkkfeyVxUMt2WWOOl3RRAk/AeKXJ25nclx
 sLTCMWtfqOlug7c8hQg5FDsnnkahl0mVZ3fZejLjb2erzZIfGQmSwJDo9MSzPy3aAFejvAjBIuA
 Hwsy88O9noq54+tILJ1K2WWh4w/iBSagvoYgiPcQMS/Aw/gRDu1wIBlJx7UO/Tc
X-Google-Smtp-Source: AGHT+IF7yX8NB3dL2I9oCyrwUW/216+uMBZnO7rofkTlzB1tv6R2FT8+EMKGiGeqgjQOzx4R1mgDeg==
X-Received: by 2002:a05:6512:6512:b0:542:297f:4f69 with SMTP id
 2adb3069b0e04-542297f4fe6mr4383196e87.41.1735081839049; 
 Tue, 24 Dec 2024 15:10:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm1721283e87.43.2024.12.24.15.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 15:10:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Dec 2024 01:10:17 +0200
Subject: [PATCH RFC/RFT 9/9] drm/display: bridge-connector: handle CEC adapters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-drm-hdmi-connector-cec-v1-9-b80380c67221@linaro.org>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
In-Reply-To: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5825;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=X9IwqP014YM7Yqs7I1CTwyxkzFvnciX/pqhUwGCgKmI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaz9WRj8gJm92HaOlOvdvAm82lKlETw5HUFrkp
 Djq2qO2o3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2s/VgAKCRCLPIo+Aiko
 1eEeB/0bxzxQhHj2XJ/dcUJ79F7c1hHbybD9qcBjuaYPrBxbGxm1/PdrpjTFEa7Rpthx3TJZw38
 b90yxkRyc3iAJp1C/XKuCZSLj1k9AjEEd5tzCYth8QJ3M+caNnETQDHQw25twDNxJSR8jyjf8GF
 YVn8EOghnQgd1jU7Yl06fKZv1VApgGfDHy44wZ/ZHyCjaNI7LHG7uDoKAFIkYxnhwRE70TmykB5
 Wm3/8mS7eWm7xFxlvHPOaBm2HOW/MDjX0+M1aF6Ly9z7HbVOHHLz5SIbvnAK8arikIZ1qVIC/js
 D8HV9NAmd4q02rYDJGxmq40Ikvrjgqm3SqpXZA5UUUn3derG
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement necessary glue code to let DRM bridge drivers to implement CEC
adapters support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 95 ++++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 25 +++++++
 2 files changed, 120 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 291abb4bcfefd12e1a57a22ba5ccce21c15196a4..f6d04f5aa261b3d0cec4057d4c9595e494c34264 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -9,6 +9,8 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 
+#include <media/cec.h>
+
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
@@ -497,6 +499,80 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
 	.mute_stream = drm_bridge_connector_audio_mute_stream,
 };
 
+static int drm_bridge_connector_cec_adap_enable(struct cec_adapter *adap, bool enable)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	return bridge->funcs->hdmi_cec_adap_enable(bridge, enable);
+}
+
+static int drm_bridge_connector_cec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	return bridge->funcs->hdmi_cec_adap_log_addr(bridge, logical_addr);
+}
+
+static int drm_bridge_connector_cec_adap_transmit(struct cec_adapter *adap,
+						  u8 attempts,
+						  u32 signal_free_time,
+						  struct cec_msg *msg)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	return bridge->funcs->hdmi_cec_adap_transmit(bridge, attempts,
+						     signal_free_time,
+						     msg);
+}
+
+static const struct cec_adap_ops drm_bridge_connector_cec_adap_ops = {
+	.adap_enable = drm_bridge_connector_cec_adap_enable,
+	.adap_log_addr = drm_bridge_connector_cec_adap_log_addr,
+	.adap_transmit = drm_bridge_connector_cec_adap_transmit,
+};
+
+static int drm_bridge_connector_hdmi_cec_init(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	drm_bridge_cec_adapter_set(bridge, connector->cec.adapter);
+
+	if (!bridge->funcs->hdmi_cec_adap_init)
+		return 0;
+
+	return bridge->funcs->hdmi_cec_adap_init(connector, bridge);
+}
+
+static void drm_bridge_connector_hdmi_cec_uninit(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	drm_bridge_cec_adapter_set(bridge, NULL);
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -633,6 +709,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			if (ret)
 				return ERR_PTR(ret);
 		}
+
+		if (bridge->hdmi_cec_adapter_name) {
+			u8 num_las = bridge->hdmi_cec_available_las ? : CEC_MAX_LOG_ADDRS;
+
+			if (!bridge->funcs->hdmi_cec_adap_enable ||
+			    !bridge->funcs->hdmi_cec_adap_log_addr ||
+			    !bridge->funcs->hdmi_cec_adap_transmit)
+				return ERR_PTR(-EINVAL);
+
+			ret = drm_connector_hdmi_cec_adapter_register(connector,
+								      &drm_bridge_connector_cec_adap_ops,
+								      bridge->hdmi_cec_adapter_name,
+								      num_las,
+								      drm_bridge_connector_hdmi_cec_init,
+								      drm_bridge_connector_hdmi_cec_uninit,
+								      bridge->hdmi_dev);
+			if (ret)
+				return ERR_PTR(ret);
+		}
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index a848ab63cc8e9c917e7ca3fe4e279bcf2a83cbb2..65545f9b94cc942e21a2394197faf8219f5d69b2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -33,6 +33,7 @@
 #include <drm/drm_modes.h>
 
 struct cec_adapter;
+struct cec_msg;
 struct device_node;
 
 struct drm_bridge;
@@ -730,6 +731,20 @@ struct drm_bridge_funcs {
 				      struct drm_bridge *bridge,
 				      bool enable, int direction);
 
+	int (*hdmi_cec_adap_init)(struct drm_connector *connector,
+				  struct drm_bridge *bridge);
+
+	int (*hdmi_cec_adap_enable)(struct drm_bridge *bridge,
+				    bool enable);
+
+	int (*hdmi_cec_adap_log_addr)(struct drm_bridge *bridge,
+				      u8 logical_addr);
+
+	int (*hdmi_cec_adap_transmit)(struct drm_bridge *bridge,
+				      u8 attempts,
+				      u32 signal_free_time,
+				      struct cec_msg *msg);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -925,6 +940,16 @@ struct drm_bridge {
 	 */
 	bool hdmi_cec_notifier;
 
+	/**
+	 * @hdmi_cec_adapter_name: the name of the adapter to register
+	 */
+	const char *hdmi_cec_adapter_name;
+
+	/**
+	 * @hdmi_cec_available_las: number of logical addresses, CEC_MAX_LOG_ADDRS if unset
+	 */
+	u8 hdmi_cec_available_las;
+
 	/** private: */
 	/**
 	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.

-- 
2.39.5

