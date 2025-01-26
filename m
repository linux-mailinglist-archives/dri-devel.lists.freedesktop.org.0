Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3BA1C7FE
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 14:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34A110E1E4;
	Sun, 26 Jan 2025 13:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oWwLfWNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993E010E1DB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:29:27 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so3780016e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 05:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737898166; x=1738502966; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eaHMvUQVVEqao58qO6A/gTtUiQNtzJSNB/5ccpaHYJU=;
 b=oWwLfWNwZH0zvCq8HJqCpNoeBdjilSlOgYEGqKtYaX0LnH+ir7RX1egkiKKUsXcmr9
 pjg5Kj50oOe3DpKdWfX4yRua5Je8w6BRLJOVSll1gdgV2LUzHHFOIlbmgmVoP7UPVkBQ
 /jwoVRtwvkmk3WPRUfetSEY1vVMhC0uvqllrQKmDbDrLsdl5aNP7FDhb1C7goB3ICyFc
 qqwT6bS3j3S7wwd4yWh1gXauEm8ku94BokpHZ3a+ZE7ZIKiPQQn2dGylFbs52FdsttW8
 XoJrMaYmEDWuMiZrV3Z626aVYmR56taM23MqLKMK2mqH+IeTKvHS9/wjpDFrgaoOaFkJ
 iQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737898166; x=1738502966;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eaHMvUQVVEqao58qO6A/gTtUiQNtzJSNB/5ccpaHYJU=;
 b=QMbIoes6ZeWdikTPG4yYl5BBHgVswhFEWPRc3eekkUap754llLtDm2KtGFEHlA0zgE
 dIOZjDfqpuu5xCJfNry04JOikjzJNDcTcCBbVfDBBzeTuukDt6bTBe5Lr1zthMUz7SxK
 OJvmPhXG9c62J3T8YoWzNcQPvd9OCS1T4NYJFfij7hUWr5tzkeF1FwL9MrzVu8b8/Gf/
 tMVjnOvAoPGBBQaRQjOlU0xz3Lf6PJ18Z652OgGLbYOXy6TzZOTyu3dijI4qb1iut9gi
 9oHo9e1lFdzn4rwd26WkIozbKRhe5DIR4hB/NsmQ9GkMzIYxwQSs9L2IPGBtE+x0NHZl
 Hh+g==
X-Gm-Message-State: AOJu0YwzaLfI8jrQM8DNfQad5SkzIVxWm4YdtCo0zuc/t8MF4F2J5fLx
 JquvqfXf5Dg2i4ylv7ebbkJ0p+yWW2IFo+MVOuC0qyFaVMXzS03jBuCKgKMd7+Q=
X-Gm-Gg: ASbGncs774dY68C4XskZUrVPk5DeaouaIQQdlAkyOn1EIgg1Zxoz3nGL1wlC+0liVbg
 5faIC96LxvJfVciEqC0Vs9FIxqdy72AVTi8PdOh2mjpDeRrv15Cj/afcqisDq6rulOh8dgRhtMu
 NzU2Q4u6YAG9165ePJgsSXkAXrxLMCPsf/4RPPjOpt0MzdCLOOX3Lo2yoGpZnl93pPiFQ9/dDEJ
 FD/XtMx7nmOzZs5DVHj080HLbXZl8iS8S06I/iDYX5W6C1aGEENlagrTcQnTW+QtcA6nBhxEwrh
 6xTUX/FdF+qM
X-Google-Smtp-Source: AGHT+IEKdtN0/flyrp4R1BEmnLgqwRjLmXPNVu/6Q4EzCFgKVRbVHrqTCJ1zpGOk1ZBWJIEDf3PA0g==
X-Received: by 2002:a19:700a:0:b0:540:1d37:e6c with SMTP id
 2adb3069b0e04-5439c245c87mr11786754e87.30.1737898165904; 
 Sun, 26 Jan 2025 05:29:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543cbbd4cf8sm770488e87.201.2025.01.26.05.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 05:29:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 26 Jan 2025 15:29:12 +0200
Subject: [PATCH v3 07/10] drm/display: hdmi-cec-helper: add bridge-related
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250126-drm-hdmi-connector-cec-v3-7-5b5b2d4956da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5348;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8KmVPM6GAMlsBDAHnGMu9T0kXZRp9qdL3hAnikOOhow=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/o0iyXp3JapNftqjZ/+0Od0bX1j83S5rsCiq32Se5fbS
 m8TNY3qZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEPvuz/48t323tfcjmgnzI
 TMntPVkS/+7+Flj1QLRfXF/EgWue1IftodlftTht/58vaTHa9r1f84z52ndfuopzZSOzD0s32N6
 ZohP25uhLN6mn2/b01dcJ/WCQWHHnbqnJJEW7td/mcZfN35DHWvzn5y9xtpLuPa6Hs9P8Cg/cU7
 y9LeUAa0BOUaUe5x+Wx5UJgsI/HR6+Nb0y4eskh6R75ZHG73U958vHfdTKDDiQdLi7MTu1JJjf7
 JfjvLky31mXW9bPf9klXGHQc1nq1MUtn352sV1584I1gkGL0ct1cruLS05Iq/aC2nippgYLzzvb
 9k5kllCfFV59k4tDT66xsuC8zqmOWyf7L+yxmnDYd+F7AA==
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

Let drm_bridge drivers handle CEC adapters in a generic way. Add a set
of helper functions to be called by DRM bridge drivers to report CEC
message-related events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 38 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c                  | 15 +++++++++++
 include/drm/display/drm_hdmi_cec_helper.h     |  8 ++++++
 include/drm/drm_bridge.h                      | 11 ++++++++
 4 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index a6ed5f0fc3835b013a83308f5285ea0819c5702c..8cb3bd35febd55211f7088b9f47dfc6a00c06109 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -207,3 +207,41 @@ void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector)
 	mutex_unlock(&connector->cec.mutex);
 }
 EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_set);
+
+void drm_bridge_cec_transmit_done(struct drm_bridge *bridge, u8 status,
+				  u8 arb_lost_cnt, u8 nack_cnt,
+				  u8 low_drive_cnt, u8 error_cnt)
+{
+	mutex_lock(&bridge->cec_mutex);
+
+	if (bridge->cec_data)
+		drm_connector_hdmi_cec_transmit_done(bridge->cec_data,
+						     status, arb_lost_cnt,
+						     nack_cnt, low_drive_cnt, error_cnt);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_transmit_done);
+
+void drm_bridge_cec_transmit_attempt_done(struct drm_bridge *bridge, u8 status)
+{
+	mutex_lock(&bridge->cec_mutex);
+
+	if (bridge->cec_data)
+		drm_connector_hdmi_cec_transmit_attempt_done(bridge->cec_data, status);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_transmit_attempt_done);
+
+void drm_bridge_cec_received_msg(struct drm_bridge *bridge,
+				 struct cec_msg *msg)
+{
+	mutex_lock(&bridge->cec_mutex);
+
+	if (bridge->cec_data)
+		drm_connector_hdmi_cec_received_msg(bridge->cec_data, msg);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_received_msg);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c6af46dd02bfa9e15b59e4c460debdd7fd84be44..7ee791aa8f962fb13467464cebb8f53ab06991f0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -206,6 +206,7 @@ static LIST_HEAD(bridge_list);
 void drm_bridge_add(struct drm_bridge *bridge)
 {
 	mutex_init(&bridge->hpd_mutex);
+	mutex_init(&bridge->cec_mutex);
 
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
@@ -248,6 +249,7 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 	mutex_unlock(&bridge_lock);
 
 	mutex_destroy(&bridge->hpd_mutex);
+	mutex_destroy(&bridge->cec_mutex);
 }
 EXPORT_SYMBOL(drm_bridge_remove);
 
@@ -1302,6 +1304,19 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
+void drm_bridge_cec_data_set(struct drm_bridge *bridge, void *cec_data)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_HDMI))
+		return;
+
+	mutex_lock(&bridge->cec_mutex);
+
+	bridge->cec_data = cec_data;
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_data_set);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
index cd6274e4ee9b3e41a2d85289c4a420b854340e19..4d435192cba5a16255c7856c89686024521f51d2 100644
--- a/include/drm/display/drm_hdmi_cec_helper.h
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 
+struct drm_bridge;
 struct drm_connector;
 
 struct cec_msg;
@@ -58,4 +59,11 @@ static inline void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connec
 static inline void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector) {}
 #endif
 
+void drm_bridge_cec_transmit_done(struct drm_bridge *bridge, u8 status,
+				  u8 arb_lost_cnt, u8 nack_cnt,
+				  u8 low_drive_cnt, u8 error_cnt);
+void drm_bridge_cec_transmit_attempt_done(struct drm_bridge *bridge, u8 status);
+void drm_bridge_cec_received_msg(struct drm_bridge *bridge,
+				 struct cec_msg *msg);
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 348778f233b06265a6ae577762c6558e69cdb396..df1d72c7e176c75585283684acc2ef2ffb2f8bff 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -939,6 +939,15 @@ struct drm_bridge {
 	 * @hpd_cb.
 	 */
 	void *hpd_data;
+
+	/**
+	 * @cec_mutex: Protects the @cec_data field.
+	 */
+	struct mutex cec_mutex;
+	/**
+	 * @cec_data: Private data to be used by the CEC callbacks.
+	 */
+	void *cec_data;
 };
 
 static inline struct drm_bridge *
@@ -1062,6 +1071,8 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 			   enum drm_connector_status status);
 
+void drm_bridge_cec_data_set(struct drm_bridge *bridge, void *cec_data);
+
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);

-- 
2.39.5

