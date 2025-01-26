Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BBEA1C802
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 14:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E22410E1EB;
	Sun, 26 Jan 2025 13:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NXyHcifG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1651310E1DB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:29:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so3999177e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 05:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737898168; x=1738502968; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RLHm3bhxZ2eEkV8ibPSP711qjdIHEc+NFBEKYoktv98=;
 b=NXyHcifGfd2nASeRkgRcJ1Hv+wZ869Px4ne5zD9njNrf8lbAfJ88OqkZxVsYpW6I9H
 QsHfEm4i3OeiYyRx2oerFAewafc1cfPllSeJTMtzhALk+wJiniyLb8hUCB5XPLwWpVxH
 5QYLASar6975F3YKLNU7ndc4bgGqpGquHPcI4Mupa/3wrR/EsifJL8WgzdntO/2i624x
 JNILYAxfRDQfzazsYbUeDlTFL1cjNpduqgIJEqOWGPMxZjX+40oqS/7FlLgChGJ1Qdrx
 vUvgcqGcOLvbdAPe2FvP5oI77TZvFoGpSupMP20jDQRz8yXm8X5prlHeSovZgSzgJgok
 dGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737898168; x=1738502968;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RLHm3bhxZ2eEkV8ibPSP711qjdIHEc+NFBEKYoktv98=;
 b=df3SaA17Zqer3oJJTMBHUiGjQnKOakgOULPrXc0rd1k7ykeF7q0fhg0imiFUzK5Syy
 l6ReLttaBsNiweBEVHufvyRY2vNRRJd6pA39VDDabqmeZOew/Bt7AgTUWYQJWsnTdrY5
 5OVR5U+0V6+7zQsD3QDgPN9tw5etvqETEy27Xl/LugrAhmmq9Z5qZOuujxw3zoKhuDAu
 7HKqK0jEC/S+ewsboG9iXsRCItRfusYdaH9PIPQwJuaxS+DZCGgWERpjXZaqAcsUyeKC
 vjy8FP8H9olcKZnWig9zaVXmaWByi/dlefbgA4Vq7F9XLrYVP/sXcDZlgnL3Yx3OGFqq
 IWmw==
X-Gm-Message-State: AOJu0YxNjuPV1ZKB0XPN2KnXEqcPOEoD0vgs07TZ1PsJ/mjPqJtHXEzB
 SyoS3v4GC1rxOIehggbQv4KuEB2k0EhNuPsQl4+r3oV8EZ+C74MdztIyIC+jkH4=
X-Gm-Gg: ASbGncv6QtCx2kMd0vL0P4aOjZ/Rv0j1UTTfdpuwkqcGZ3Rq3ns/HZ+wKb09Fv0akF8
 IjoJ2QxtPPKcVIRA4HOacJpFiDb/mv8vwi8/U1VYUm8HWfxcuHw8g41wHMyQ5kNPt6wGopFOAMX
 bqi2uhSUg6KoOycr6F8JrsbadSHzsJBZPOaDPLvkkDGGHbM5gYcldtp41EKRHJwy6o6zCIgAdBh
 WbnB1CINkY4VS2u4gnXN7BqxluIs81UAKW/gGmZfBgMekLfr5rNtUSQrU4Rd139LNnEBVEFtIxZ
 LUtBCh3YldJ3
X-Google-Smtp-Source: AGHT+IEq+gayuNxKbei7gfDdJiacLK5NTTkfna34HaecSR3ynySMD5P2FUlG4fPT43/RYl0gY9/XnA==
X-Received: by 2002:ac2:48a1:0:b0:540:1d6c:f1af with SMTP id
 2adb3069b0e04-5439c27d0d8mr11014963e87.44.1737898168295; 
 Sun, 26 Jan 2025 05:29:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543cbbd4cf8sm770488e87.201.2025.01.26.05.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 05:29:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 26 Jan 2025 15:29:13 +0200
Subject: [PATCH v3 08/10] drm/display: bridge-connector: handle CEC
 adapters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250126-drm-hdmi-connector-cec-v3-8-5b5b2d4956da@linaro.org>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vbGZOMc+V4BW3oRtVXZ0aC7nodmuYNbj76HULcIcwv0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnljikFORT3AoWnSm+wWOCdVJyIUd/NbTQO2aml
 pdyeBru1YiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5Y4pAAKCRCLPIo+Aiko
 1WFAB/4zCkOWf2w7pf0OllVEjSqoX7oLw9NNsfABGKIRInVOn/ZGroFB2x3X3teG3rtDOwIGcVO
 VSmGo/hyyCawXffM/sPE29F6FSTaJcEwdcZpXOS54CFSe1oKDux8fItMg+mPxRzAL5b38mW8WPF
 +htGXBnF7ImG7BTLKAAuwdciMzP91k802mY2NUDzSgTBpWv7ap40xzeqGsoFtPun4GPr3Q50Nwn
 EFT4+L276w2dg65NgyZ5wXnPNnPM83K6X9BT7N1oCbzBvqsqulNrGWFdRZ+mPkhqE29A+9rba4w
 Wb10muZwgGRit99VGbQvRD1eaYjKmsOfIQowQbwlSxFNhHyh
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
 drivers/gpu/drm/display/drm_bridge_connector.c | 93 ++++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 21 ++++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 9f234bc647d5c0880d4c42aea130074b7fa54573..5b77fd59d79abddd419e611a7868b001857ccb37 100644
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
@@ -497,6 +499,82 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
 	.mute_stream = drm_bridge_connector_audio_mute_stream,
 };
 
+static int drm_bridge_connector_hdmi_cec_enable(struct drm_connector *connector, bool enable)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	return bridge->funcs->hdmi_cec_enable(bridge, enable);
+}
+
+static int drm_bridge_connector_hdmi_cec_log_addr(struct drm_connector *connector, u8 logical_addr)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	return bridge->funcs->hdmi_cec_log_addr(bridge, logical_addr);
+}
+
+static int drm_bridge_connector_hdmi_cec_transmit(struct drm_connector *connector,
+						  u8 attempts,
+						  u32 signal_free_time,
+						  struct cec_msg *msg)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	return bridge->funcs->hdmi_cec_transmit(bridge, attempts,
+						signal_free_time,
+						msg);
+}
+
+static int drm_bridge_connector_hdmi_cec_init(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	drm_bridge_cec_data_set(bridge, connector);
+
+	if (!bridge->funcs->hdmi_cec_init)
+		return 0;
+
+	return bridge->funcs->hdmi_cec_init(connector, bridge);
+}
+
+static void drm_bridge_connector_hdmi_cec_unregister(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+
+	drm_bridge_cec_data_set(bridge, NULL);
+
+	drm_connector_hdmi_cec_unregister(connector);
+}
+
+static const struct drm_connector_hdmi_cec_adapter_ops drm_bridge_connector_hdmi_cec_ops = {
+	.base.unregister = drm_bridge_connector_hdmi_cec_unregister,
+	.init = drm_bridge_connector_hdmi_cec_init,
+	.enable = drm_bridge_connector_hdmi_cec_enable,
+	.log_addr = drm_bridge_connector_hdmi_cec_log_addr,
+	.transmit = drm_bridge_connector_hdmi_cec_transmit,
+};
+
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -633,6 +711,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			if (ret)
 				return ERR_PTR(ret);
 		}
+
+		if (bridge->hdmi_cec_adapter_name) {
+			if (!bridge->funcs->hdmi_cec_enable ||
+			    !bridge->funcs->hdmi_cec_log_addr ||
+			    !bridge->funcs->hdmi_cec_transmit)
+				return ERR_PTR(-EINVAL);
+
+			ret = drm_connector_hdmi_cec_register(connector,
+							      &drm_bridge_connector_hdmi_cec_ops,
+							      bridge->hdmi_cec_adapter_name,
+							      bridge->hdmi_cec_available_las,
+							      bridge->hdmi_dev);
+			if (ret)
+				return ERR_PTR(ret);
+		}
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index df1d72c7e176c75585283684acc2ef2ffb2f8bff..b55e80a57758e8b652eac0cd01cb245a04e221f5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -32,6 +32,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
 
+struct cec_msg;
 struct device_node;
 
 struct drm_bridge;
@@ -729,6 +730,16 @@ struct drm_bridge_funcs {
 				      struct drm_bridge *bridge,
 				      bool enable, int direction);
 
+	int (*hdmi_cec_init)(struct drm_connector *connector,
+			     struct drm_bridge *bridge);
+
+	int (*hdmi_cec_enable)(struct drm_bridge *bridge, bool enable);
+
+	int (*hdmi_cec_log_addr)(struct drm_bridge *bridge, u8 logical_addr);
+
+	int (*hdmi_cec_transmit)(struct drm_bridge *bridge, u8 attempts,
+				 u32 signal_free_time, struct cec_msg *msg);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -924,6 +935,16 @@ struct drm_bridge {
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

