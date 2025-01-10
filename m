Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AB1A08F68
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D90210F080;
	Fri, 10 Jan 2025 11:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HLDIIwX3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F85010F080
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:30:10 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so16725841fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 03:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736508549; x=1737113349; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8+YIB52U4I0egsUniMdB1l3nr9fwGImyIeykNsvRPmg=;
 b=HLDIIwX30kBdjJ7kqyPJW2uuWli+5agEMTdgR/LAynvg1G/qjsJlzcoyAI9jSqpxo0
 4YYxG3Jk4EOGYSdYFxNsRJIAnwSMxs7NahHeklJF1m13X0uGHH76IWIX0zxjO1D2Hj7q
 Q6tsIW/WJ4vBl5mvUpZWlwsX/UkodUh6uWYfIpcHC3uwW/FzAbpsVJzqj/WYmrbg/NdP
 uuVVOX/Bf5be6s020rqkdXC3Xm0F37dM2yFXn0xh5vRVdduowhMZgOd+epJCfU7YczV4
 cYP3NJmBXXfsxVhBzWcqTji0ILGwFiq7ADeYs75b1Q+8zEsrDiuEUYtsju5QrGxkCAGP
 9IKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736508549; x=1737113349;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8+YIB52U4I0egsUniMdB1l3nr9fwGImyIeykNsvRPmg=;
 b=D4rxFSfv6DgZ2AGLG+Yy8LkaUonzWttZ9FvQrBubIyFP4/GgTjVpwZiH2hgTOq7SMC
 BRKR7ayzJgq1280YR8l7NxilE6CxSk30yPp+3VqJrJpi+GDgQZ7qfu6cEofir7kwG0fY
 JasGbHvPPTMK2TXcH/k7hIOiqnaXOsSTLIkBpjTcs0oE8mIAwIlUWtUyBpAlesZmDwC4
 s9l8ecmz+00NjlFjT06mmAO3yqn5iNaqv6HXUoKu54LBG9EMguYU6P1mGv999YJeyVvp
 UiPX+QMfGAKR1wv4DbrUvitV9z2YddljnrT0Z2e2eaLOLl2CFBq7CZ4jkb+2lH1Ntmhi
 6DzA==
X-Gm-Message-State: AOJu0YxyBxGq8aa7jd6rHUbgw9XRyuXkomCZKW+T+qBU66UKoZydWP71
 pLfnEay++TgQlaxcBzaDCc3URDGE+uaMI5pBwSAkoj8rU56AmziuDQ1KimJRFhs=
X-Gm-Gg: ASbGncvhPf//IGOmBUJ1MG4SF9VT1GoMylQ944/yFEwd+FvxmQHDtts8xVt5YQe9U/O
 L/m0xrykRG2AE0NSuM8+PoJ1x4qf7geVpqUEOQoqbNT8cSIcebOdIEqbj0a6MJSw+XdoMQ5PJDr
 6ETxMk71WCyptl3Es66YFeLjnbtrRyDV9iiLhZ7El1txrbQhqRMGRd3+AfAwDfYNhHKhQDcvhMW
 eCtykls+yJrUSYHvEYijjKWBukZaKkaJpMbdRyAOW+NK7DZEybi1YvWIoV8H8NF
X-Google-Smtp-Source: AGHT+IGGO0hV7d+zOhOaSbmlFHHH9MeNC5ZrAqEpzlzaPMm6YljCQcX1Sz/YlUFHdHm3aOjtVorpBA==
X-Received: by 2002:a05:651c:2222:b0:300:38ff:f8e2 with SMTP id
 38308e7fff4ca-305f453f9d5mr31201951fa.10.1736508548618; 
 Fri, 10 Jan 2025 03:29:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c78e8sm4711081fa.86.2025.01.10.03.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 03:29:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 13:28:51 +0200
Subject: [PATCH RFC/RFT v2 8/8] drm/display: bridge-connector: handle CEC
 adapters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-hdmi-connector-cec-v2-8-9067c8f34663@linaro.org>
References: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
In-Reply-To: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5677;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BwAZN8edy4A87oLbta1XuTrc0RKbA56lgaUrctITA/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngQRv/bgC+zrUD+iX8UWyTXDUsJSZHnTGhXuTR
 +34osXvuliJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4EEbwAKCRCLPIo+Aiko
 1aeZB/9h3I/U9zJZbqCmtLmblFpi07dcQwlq9LQ0/65WSXneGkmf/DE5B0X+oGArfKCFRN5excx
 8JxnXC5QeM3/RJ1o5m1xp/mQ+aGMybyLTC58KUEfVf037NxdQb3hs5jARGV0DxOFSy65uvivF8S
 HgdfOvfLxrLVk/tY3V4/xAcWIKp8Ud4oXQ9WGyt95YXrak28Vfxp1XIKepXu/V3RXoPSCSQZ1RP
 iiBDPfisexIUFPrIhzcEmk5fOZ4otunhl1DnOyZQVPxdiAjqYJi4i3xBEgfvAev06T3Vg3gag8B
 HNKviR3lWuUJ0uHGOGd3C8CoxuzuflYKJzMfqa5l11ffFwE7
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
index 5f11243dea9c889e90a5074955f5a56208f8d622..42d670f9781a47688c9620660078dc8f5ae49fa5 100644
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
+						     signal_free_time,
+						     msg);
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
+	drm_bridge_cec_adapter_set(bridge, connector->cec.adapter);
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
+	drm_bridge_cec_adapter_set(bridge, NULL);
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
@@ -633,6 +711,23 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			if (ret)
 				return ERR_PTR(ret);
 		}
+
+		if (bridge->hdmi_cec_adapter_name) {
+			u8 num_las = bridge->hdmi_cec_available_las ? : CEC_MAX_LOG_ADDRS;
+
+			if (!bridge->funcs->hdmi_cec_enable ||
+			    !bridge->funcs->hdmi_cec_log_addr ||
+			    !bridge->funcs->hdmi_cec_transmit)
+				return ERR_PTR(-EINVAL);
+
+			ret = drm_connector_hdmi_cec_adapter_register(connector,
+								      &drm_bridge_connector_hdmi_cec_ops,
+								      bridge->hdmi_cec_adapter_name,
+								      num_las,
+								      bridge->hdmi_dev);
+			if (ret)
+				return ERR_PTR(ret);
+		}
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index a848ab63cc8e9c917e7ca3fe4e279bcf2a83cbb2..bbfbb50fddf9b12f6e573ba79d1f13641515bd47 100644
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
 
+	int (*hdmi_cec_init)(struct drm_connector *connector,
+				  struct drm_bridge *bridge);
+
+	int (*hdmi_cec_enable)(struct drm_bridge *bridge,
+				    bool enable);
+
+	int (*hdmi_cec_log_addr)(struct drm_bridge *bridge,
+				      u8 logical_addr);
+
+	int (*hdmi_cec_transmit)(struct drm_bridge *bridge,
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

