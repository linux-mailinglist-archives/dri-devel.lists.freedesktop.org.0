Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967BCA24DC0
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 13:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F3210E2DE;
	Sun,  2 Feb 2025 12:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wrg912Rw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2210D10E322
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 12:07:39 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso3653615e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 04:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738498057; x=1739102857; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UsARv7wcMY/4sKWAI5XqD/IVXti9mEWhbs9ICskYpok=;
 b=wrg912RwNYkxXhVDSaNUu1VFfrZZlxXCC9JLeyZWO1wFVEkEgAkEcq/lVduo/nKHbT
 kO7yb/Vk/E77zPudzKFk82auH7aA566b9Dj3ZdoMpX5jaT6ZAXSHntrE4AWSW7PeldTW
 yblS4xTnsf1IbSjy8TUlaHZ8tpY4a6V1FkOOd9+L/s35AS4WZt7Tk9SpXnE73tOBmy8n
 ZnJUdlgSHzWPjHNDIS3igRNHurWFsLEjxWwLq/vt+C6nA0pcn/h3SL6N0/R++KQYXpcj
 mL0lfTU+evNBuuqwsKsRvk5O1vWZzXtcV/a1IjjU8NuviOTvG6jUnIKEj+DZsmULMOux
 0WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738498057; x=1739102857;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UsARv7wcMY/4sKWAI5XqD/IVXti9mEWhbs9ICskYpok=;
 b=dudOGq7JfKIN4PThpWPOnuRI4TeO3SMzYkkM+Ap8zkE4/o54gqFqXXKAKism4DDCx4
 Un6G/lRkI6kTFxyPzk2UvVizMphgi3NropCkPItmbEXmZ1EK47GTDvmWe8Q9scVa3np4
 T8faZbvcjUJ2JgvdnThdQMIGAc//Gj1bx4cExjeS+e34SzXN/cWoXtNJckgk3MICgOXD
 fk28KwcYrC7ak7fL1Ltrb2YZ7JO/h38QfKPjjjlJoFFjVx3/LMual6cEgkcPpiYiWgqp
 HXrQFkUifUCXfxh7dnD6OvyL8868LOcnW/JveaBfiuB56UwCMXiW6/kRI83b17QEd9Bf
 ShpA==
X-Gm-Message-State: AOJu0YyWVVLapYrTWAyyy5tS3pr+/MUHd2X8KC+sW4RSRjqN4NdiodJu
 6yj2VvmU+Xy3nE43fPkZJl38ZySdf9dB6YXa2saVhW3BAEQwfWGv4WH9ADkQc/A=
X-Gm-Gg: ASbGncuQU9Vtt3Yt9Nf+q0QxsMdYYAIJwM3NWk5wm/sW+DsAyX5w5c1wUg5zxTcxXPO
 0eHPxbCw4qg2eTWkAT4fYhtDlLmLwAMNgArROSFaTBhS9P7RbX9Ef9yngrd4bNaRlD65IVz4fjJ
 AmSZMqp6MHcJQU0RdMy0HI+O3tYrlir2YX1met60NBBtDpdfmXyM/EJXm+/tfRuRg9ZawxmL2JO
 XednqVc3I6U2pHl6mjRNqzSpkbYnLZJHcsY6591kHMUrBVv+BiGSXNdUXwz15lWjW16EJ9jzR65
 PufRaPXxxbxYKQ2MHE75dwY=
X-Google-Smtp-Source: AGHT+IEzVX4mBQceR92uq3wNyRMur2BgWMNBH3IzLTIb0LGUgelE7xewaM7tpM1lFFY6Kfcq/Rlr+w==
X-Received: by 2002:ac2:4c26:0:b0:540:353a:df90 with SMTP id
 2adb3069b0e04-543e4c3cacfmr5250298e87.43.1738498057287; 
 Sun, 02 Feb 2025 04:07:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 04:07:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:16 +0200
Subject: [PATCH v4 09/12] drm/display: hdmi-cec-helper: add bridge-related
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-9-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5348;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yi9kuP8xj+IWgEzU7otZJmiGvJToi8ayWBLm49/BFfY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/wpKlvuZlEwtRG+RVJAXmLqvNbMvM9Ne90W
 6ortRDmatKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f8AAKCRCLPIo+Aiko
 1cmUB/4wEMF/P5m4Fjpogau7HjnEZL7eRltDOTGgz9zKMkOuPk7rh1nIMyOPgUOveHg6IK+Wm3N
 zAqAPjDcNFCOf2vG57ZX9gsexEPCAq6VcEEuyjzq9TDFTLUSiMs2/JOzUgUwW7epDG4DdXHT/F+
 I6rSwwgzUXMRQFJ+RabeOzxX8Lq1ibqwekzSmiln1ddyAK3MW+YwCCskIZt31Xcnh1goSy4KaGR
 uCOoczFSmideGJ4uXUS6a3TUgfsAWoGYLZU1UYUQqDQMyyAzqCTMQDMxYp/dKA7iW4IQ6hxdm+p
 8lLhJYH24HLkpnzVHVLeKX2u1gU1HwUHkLR4aQ0UZ3P6xd4C
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
index a9d38835c69a2939ca21a4fc921136a2a022248c..04c0ac482e977423ebbf803fc5856321a6b0a523 100644
--- a/include/drm/display/drm_hdmi_cec_helper.h
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 
+struct drm_bridge;
 struct drm_connector;
 
 struct cec_msg;
@@ -83,4 +84,11 @@ static inline void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connec
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

