Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACACA24DC1
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227FE10E322;
	Sun,  2 Feb 2025 12:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jP2K/INY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E72610E322
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:41 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-543e47e93a3so3658234e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498060; x=1739102860; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RLHm3bhxZ2eEkV8ibPSP711qjdIHEc+NFBEKYoktv98=;
 b=jP2K/INYj1TtpvLzN92aKwnXVHOnxWQ2e2piCFLJgWTbP4Cd+0DOQ4rFF3FqmGdEIT
 /1tBafxxqDsrcfnWGOmBmzdNHvV6q7+INgX2jHkMzJcZ0KVHBDJ90IsGLaoa3S76un4t
 FE3FgKf4aynkI1GdF2EOXXvCwlNfa0NcXT8k6qJhfjikQ4PUW/yYaASP/mLxceWe0fCa
 6daF95mvPKavmRmelVFANfVFuZz8MeKPZccOxaWwEakiBvsy4LNU0cLcSAqYd6vZ1AL9
 KroN03s5JmgkiUYN/DkJRJqUgclYi+JOtwNHjdZg/heqkG4N7DXD4ZCTnh37wAyyuYVL
 LXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498060; x=1739102860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RLHm3bhxZ2eEkV8ibPSP711qjdIHEc+NFBEKYoktv98=;
 b=UqX3aw1qO2I+3njKsyhurvc8WBkzN90S5Qy7EqiC3Qa+X9ZOTmUnwwWh0VGQKerdXl
 Na4wmsga5510OFDuvvmyFzH/N+AQ7KbsAGxfwOksD6idlHwD5H2EX3JjZT21HVZKPtg8
 oH3GSaZM9UbPUDng/VLdtrcZw65AJQL0BuCwM6PRpV39fvNNDplqKa3gPItNmcWuFalj
 HW7iePZ+Yl3LG6AFUx7CatJrBITefNDHF9+9KXGAjd9MaOEzEF7Q5OsVmdN+Z5bOi3dJ
 RDFk7qK19sm2GmljcwisBN8d8o+oc+LF+/7PiAZ/QdbGFUSwklq21mDK33UY7m75ZwKF
 LjKA==
X-Gm-Message-State: AOJu0YxWlMDzWJN4FicLJb+E4vbax/X0o7JH8ZA5Vz/bNUBqaSWN4Tt6
 KrBJPejAVh3ao9VLBgX71jygXC+NeHbJLGYRB4hYG4d9j2KKJ/jV+lD9QKuIkx3GUzwUsiVarOe
 7D40SmfVB
X-Gm-Gg: ASbGnct7sMS+m9Is2qXGwkwCB30h+cR+//IxOeD8uhb28mhhGdl300xCKP/IJoj/m4V
 cZnUCnya/TXZBTlsYQ2YqrjwJVIoKKvquvyxuMA9QzkFW8elUhOk0XY/C9nx7cEjibefTMPW7q4
 UN3pbTo1g+pTB1nyVm+ehpsNWOcl/H25aWGu7cDuX1LJQAvKBs1fpHql9XNHKc+AA14svSPOBXQ
 AY/ahG/Wjp5b45/eKO8c6/ZB7aDrDAb/9/76T9koPVLQMBTjNQWk5SHZJ8zaRO+sNu5NcU9Kz6z
 /VYlHo8AieCxyKzCcd2+22A=
X-Google-Smtp-Source: AGHT+IHl6Juy16UapZRrVEz0ow3vlGeH9cEUDfxCBbzvk2jva6MFi/0w8KegrO8cbZD1ar970A8W/g==
X-Received: by 2002:a19:7501:0:b0:543:e409:1ff9 with SMTP id
 2adb3069b0e04-543e4c3fcd7mr5502711e87.45.1738498059704; 
 Sun, 02 Feb 2025 04:07:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:17 +0200
Subject: [PATCH v4 10/12] drm/display: bridge-connector: handle CEC
 adapters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-10-a71620a54d50@linaro.org>
References: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
In-Reply-To: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/wfFeNKR9HpOseH3T/CD9wYWtVlkJ8lUjdy
 s9RyWPJUxaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f8AAKCRCLPIo+Aiko
 1X2AB/0SVy4DyopVw0b+xWrutXdBBkch9Iif/NmsivL4qQ2XNcULYty7QsSWuuS9chP6ZtPb+Kp
 yHT3+u//Fdgo1wzKzLLLV1RdC0tMLMN56O2+2cyRY0h4lZE259MTQdedCpzNlxfN46XEmAMDJiF
 9GOI+JE3iLWHIDSygrHeFXQICC7Y/h02jOMKIJIsdrQshwm/3Yx80pY7PnQNz8AIfp0hFH2GwGq
 aH10pd3Wr1qxj0BnPlo6os5gjZUplbA+G+e/SA5b9A8Oe4uu7MMMB8irsJAcXhmbQJFqyGJwaIl
 dvswfLh1EUtbbKfQEjKyagsC3GfgiHvKgMPlURVt0ZYNCiGH
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

