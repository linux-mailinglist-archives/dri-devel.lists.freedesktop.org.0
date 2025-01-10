Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78CBA08F67
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A6E10F076;
	Fri, 10 Jan 2025 11:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vegPVVSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22AC10F07F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:30:07 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30167f4c1deso15555321fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 03:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736508546; x=1737113346; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/UIU8+/OFGECrtOiHmDAlFRm29snZGdSGyeHEE4qcYk=;
 b=vegPVVSfMXV7L5VlyWBw4nzslYkAcpcg/holkZBC7Ryrtvv9I7VkUeHpcISNzgpGi3
 PzeDxC7lIoiXe+tFuGUS1j/vmcAy46/RO/Lm5rvKYlO/KZ/ohVUQ+Yo46N9k2HyzGLPL
 teLI/jAtXHby7WGl6Cvij6ugFNjaSVchiAsbuwS7XtKQr+/P63zhQoFCnrCjqwDxCerd
 y4xhPx/Ioj18boQMUgNZBUgJTMzvLx8rQLFQPEQD+ZGCMCJXYS0Q2D9FFfmfKdxbjaks
 hO8tkZopIj7MAdbBgVa/gkxfdMtS1YU1VQDAvmz24Fy6dml3RBa0GyS6AGqox4KP1vOe
 9JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736508546; x=1737113346;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/UIU8+/OFGECrtOiHmDAlFRm29snZGdSGyeHEE4qcYk=;
 b=G6W7zSxGRNJAxuzOcuemFCZEnj39RZ9wmf/btLxO93ZKaM4d0vARJ3lXZcsLOtiic0
 3XA63W/DLeLZPfeOqPzWbG7laje49+FE6pFECZ1btNKB5/E4XN0gbzTBwm3HQzEb6Ceo
 23h5LYdr+Bxlagv2uqC9fTWMAcUM2eBVGD0MjFHvZ4Gmxhl3yIf+l2SFyNlZ0iQSLsja
 uMyE4L2fmUr+36u458y1/gqSMaoJv8lFquTpG6ZPuL6hQ1DPT/vrnMIvLDa+YBlQ78Pb
 2h3tvjenSJOoia13mN0FKWSyPS/4G4ZBDsCPl0SX3fUmJsw3Xj6MUD372LNrDiqcGI8Z
 qBEw==
X-Gm-Message-State: AOJu0Yz18fPEOin3F9mfIrvYrmKpgWLnKMGNsgkexDgqYoz57h5Ar5xq
 4qUvTEhGOEE53oDZFKu4PKaiwDyRMYj4B6/oOcHlu8a6hv094f1Bvw8o7BLsbN4=
X-Gm-Gg: ASbGncvLWxAPJWALGvOF2gti6KDC/ho+pLS4KC3ByWO7VZqJUrHsC548O0d7ds5mcom
 Kd+JodEfWBPrTTNEC9hpzkaj7elGrCQoX195OofF+E5sP0u8CQBmerPmuOAnVE62tOrTEu5L/7c
 Oo8Vn29VanMWLWAkIWgqdrdBds6CJOayWTe6LoxHviq8nkGh8Tq5RwXrlP9DVM1C68WeYtcCKRm
 YmKcIryP0x9FuC+UzvbBB0NTTkH5d3N7+zvpvhReQd9nR/VmUtQZPRizsRF1Tmn
X-Google-Smtp-Source: AGHT+IH4tmBunOAbZD3tkCTayg2Su5G96QZkPq0CESPADlHHvyj2u9kTJYKconf8AwE9q4O/CPJTZw==
X-Received: by 2002:a05:651c:1415:b0:302:3356:3a98 with SMTP id
 38308e7fff4ca-305f45fc6c9mr24401721fa.37.1736508546260; 
 Fri, 10 Jan 2025 03:29:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c78e8sm4711081fa.86.2025.01.10.03.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 03:29:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 13:28:50 +0200
Subject: [PATCH RFC/RFT v2 7/8] drm/display: hdmi-cec-helper: add
 bridge-related functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-hdmi-connector-cec-v2-7-9067c8f34663@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5536;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZlamDX7RUQmt18Od9tY7nbhEE651D+BmJ29Xlgw91xs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3ojS37Qv+kBE7ht5x1+b3i15FNlapnbSbX0e8v59Y5wf
 w7fX8rcyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJlF1l/58Q5r/23lzDLVZL
 Th1gyK1wEj4uWahz3qaxp6qt7P0EzunKTZtCeoX2qEmuvFPgWWaYv1cwbKYEJ0umxfcFFY22Rkm
 3Qk4aXI/Rsf9UGD43TeWpzc+K+Q+WeEvudZz96XHR/XafPbuS1j4Tq+bSTdZ9rfJ9ztdFp7NXOu
 jY3gyIUuj8mzq9z8jQ7yfbnqx9KhWcV/+bHl00obgk9g33v/9nvAqSv8o5ZW1oCFaZxKZcYXtjK
 WPztM/iLxK2/Ix9kirl0lAdYnzv/qbZO2sMT8d5FtnoVf2OXFzCbdm/jjlzmqzTI8adQu5PvWKO
 HD7uJG2ZcGznJed6oYn6CzKXNsnGsJ63WxW97fuNk4JzAA==
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
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 37 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c                  | 16 ++++++++++++
 include/drm/display/drm_hdmi_cec_helper.h     |  9 +++++++
 include/drm/drm_bridge.h                      | 13 ++++++++++
 4 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
index 8f6d66d813ca1981d827147d951aafe596151d97..6f60f092a9ad1369824170e6bd996849f4060cc8 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -207,3 +207,40 @@ void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector)
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
+	if (bridge->cec_adapter)
+		cec_transmit_done(bridge->cec_adapter, status, arb_lost_cnt,
+				  nack_cnt, low_drive_cnt, error_cnt);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_transmit_done);
+
+void drm_bridge_cec_transmit_attempt_done(struct drm_bridge *bridge, u8 status)
+{
+	mutex_lock(&bridge->cec_mutex);
+
+	if (bridge->cec_adapter)
+		cec_transmit_attempt_done(bridge->cec_adapter, status);
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
+	if (bridge->cec_adapter)
+		cec_received_msg(bridge->cec_adapter, msg);
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_received_msg);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c6af46dd02bfa9e15b59e4c460debdd7fd84be44..c7522e20009977632d9fcd0327d856b9d60893d0 100644
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
 
@@ -1302,6 +1304,20 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
+void drm_bridge_cec_adapter_set(struct drm_bridge *bridge,
+				struct cec_adapter *cec_adapter)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_HDMI))
+		return;
+
+	mutex_lock(&bridge->cec_mutex);
+
+	bridge->cec_adapter = cec_adapter;
+
+	mutex_unlock(&bridge->cec_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_cec_adapter_set);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
index b4d76b605017e4824ba2050018c05c7138bee258..b8a820d5d774e3fb9c7f982cb7dee588e3292f42 100644
--- a/include/drm/display/drm_hdmi_cec_helper.h
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 
+struct drm_bridge;
 struct drm_connector;
 
 struct cec_msg;
@@ -58,4 +59,12 @@ static inline void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connec
 static inline void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector) {}
 #endif
 
+void drm_bridge_cec_transmit_done(struct drm_bridge *bridge, u8 status,
+				  u8 arb_lost_cnt, u8 nack_cnt,
+				  u8 low_drive_cnt, u8 error_cnt);
+void drm_bridge_cec_transmit_attempt_done(struct drm_bridge *bridge, u8 status);
+
+void drm_bridge_cec_received_msg(struct drm_bridge *bridge,
+				 struct cec_msg *msg);
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 348778f233b06265a6ae577762c6558e69cdb396..a848ab63cc8e9c917e7ca3fe4e279bcf2a83cbb2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -32,6 +32,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
 
+struct cec_adapter;
 struct device_node;
 
 struct drm_bridge;
@@ -939,6 +940,15 @@ struct drm_bridge {
 	 * @hpd_cb.
 	 */
 	void *hpd_data;
+
+	/**
+	 * @cec_mutex: Protects the @cec_adapter field.
+	 */
+	struct mutex cec_mutex;
+	/**
+	 * @cec_adapter: Private data to be used by the CEC callbacks.
+	 */
+	struct cec_adapter *cec_adapter;
 };
 
 static inline struct drm_bridge *
@@ -1062,6 +1072,9 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 			   enum drm_connector_status status);
 
+void drm_bridge_cec_adapter_set(struct drm_bridge *bridge,
+				struct cec_adapter *cec_adapter);
+
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);

-- 
2.39.5

