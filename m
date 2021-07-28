Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1EB3D8F23
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B6F6EA1C;
	Wed, 28 Jul 2021 13:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED656EA1C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:32:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id CC730580B89;
 Wed, 28 Jul 2021 09:32:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 28 Jul 2021 09:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=I5+dNCfxn/tqf
 5HmxMjvJPr+kWU7D9vVbvwGazRUVJo=; b=gIE7mwjbwCPWm9DH56tvB7MMY9FKY
 LFPXdqW0XM6DThc8Q2jupggkYGaaTOhhw+9/r/WYHqwuRNXaveBKAwSBWgOYJpKi
 jAmBVS7vFv+RUO0MbbLYpC6fV+QQqQcRaI6lQgz7XKZ5iq9soL1aESlWDDo9J470
 N4D5bMXKD6pG5OaGD05PJRPw0o8FewjIYYa4SNkr4X0Z/xlO3ik0hwR0iXEEcyfu
 Ul5cEvnCagHYI7B9X7WRWO2AJ48f3CIVJp4D5BOxXY5UHrBNuJwbQzVVa3bYQ8pt
 3lbtQ5W+bfrzow7a5eMoBT/BI8l7OX39eDhPPANB9rSrMVyJHh0+QFxTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=I5+dNCfxn/tqf5HmxMjvJPr+kWU7D9vVbvwGazRUVJo=; b=gFL4XecR
 i7OVlhluVFThd9/r/N3pPfL2w/ProTbdhGLJHGb/jzitAMrbIVRr+eKkYnJx4oVn
 ywCklzz4Sed7ni6OnDQbUzokpJCwCfCoUb6RMQVqpap1fDDprl9PV0w8OyR12Z/i
 8ErpPS/MG3aEU74D9734acasV7eyyVYTCEkuFHLosoSPeiXWjVCvE8HExyQtG7MC
 5/1r9LC9uiuqKMmduf+zvPvhG2X94HSWs2MRUQ9aI53lg9WntijTOYjk9NIzyohZ
 lM3J3ETQqK4we1Ln7QrBHAvJpKGwxyjkS03x6UVOMmnc/GsH1jFydsIhQD4oFeeD
 C8F4NoC96CmHzw==
X-ME-Sender: <xms:eVwBYZIIsiCcW51dYy7ke4ribx1QOeaqHe_RvYtArGRY49nR5lVl2A>
 <xme:eVwBYVLuDqryr4oKuCJqQo6iuRS6LGf3bizDUqHtCk-F7YQQ93mqSN0oZS3oONPhd
 q76rpUUW-i5PJ540VI>
X-ME-Received: <xmr:eVwBYRt9cZnBjzbKd9oxVoIfU0ozr_dsY-swlRlXq5S3LjZ1-kGBoFjEpFHXHt1ED5Ef_Wh1JpalGZjRhSrEQRhJiT3yFvoXpazC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eVwBYabyf0--Peoa0Fk_dkNPVU4pWw0h9hlWD5zaRiAY9GPJmFHIwQ>
 <xmx:eVwBYQY5x654-j0ThB9oG5GjhvbwZDwf6YOyQwMQEKGdoi4BeNdsIA>
 <xmx:eVwBYeBHfa5nXUgerjhkTGZj2Bh6DzTexwqUB1d7CWovxoN3kOlh6g>
 <xmx:eVwBYQrEzyT3Dn2BVD70sx35su4eg97MPAtTiaiO83_WirEEA4nT7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 09:32:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 2/8] drm/bridge: Add a function to abstract away panels
Date: Wed, 28 Jul 2021 15:32:23 +0200
Message-Id: <20210728133229.2247965-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728133229.2247965-1-maxime@cerno.tech>
References: <20210728133229.2247965-1-maxime@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display drivers so far need to have a lot of boilerplate to first
retrieve either the panel or bridge that they are connected to using
drm_of_find_panel_or_bridge(), and then either deal with each with ad-hoc
functions or create a drm panel bridge through drm_panel_bridge_add.

In order to reduce the boilerplate and hopefully create a path of least
resistance towards using the DRM panel bridge layer, let's create the
function devm_drm_of_get_next to reduce that boilerplate.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_bridge.c | 42 ++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/drm_of.c     |  3 +++
 include/drm/drm_bridge.h     |  2 ++
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 044acd07c153..426ce7442c86 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -28,6 +28,7 @@
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_of.h>
 
 #include "drm_crtc_internal.h"
 
@@ -50,10 +51,8 @@
  *
  * Display drivers are responsible for linking encoders with the first bridge
  * in the chains. This is done by acquiring the appropriate bridge with
- * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
- * panel with drm_panel_bridge_add_typed() (or the managed version
- * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall be
- * attached to the encoder with a call to drm_bridge_attach().
+ * devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to the
+ * encoder with a call to drm_bridge_attach().
  *
  * Bridges are responsible for linking themselves with the next bridge in the
  * chain, if any. This is done the same way as for encoders, with the call to
@@ -1223,6 +1222,41 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 	return NULL;
 }
 EXPORT_SYMBOL(of_drm_find_bridge);
+
+/**
+ * devm_drm_of_get_bridge - Return next bridge in the chain
+ * @dev: device to tie the bridge lifetime to
+ * @np: device tree node containing encoder output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ *
+ * Given a DT node's port and endpoint number, finds the connected node
+ * and returns the associated bridge if any, or creates and returns a
+ * drm panel bridge instance if a panel is connected.
+ *
+ * Returns a pointer to the bridge if successful, or an error pointer
+ * otherwise.
+ */
+struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
+					  struct device_node *np,
+					  unsigned int port,
+					  unsigned int endpoint)
+{
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(np, port, endpoint,
+					  &panel, &bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (panel)
+		bridge = devm_drm_panel_bridge_add(dev, panel);
+
+	return bridge;
+}
+EXPORT_SYMBOL(devm_drm_of_get_bridge);
 #endif
 
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 997b8827fed2..37c34146eea8 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -231,6 +231,9 @@ EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
  * return either the associated struct drm_panel or drm_bridge device. Either
  * @panel or @bridge must not be NULL.
  *
+ * This function is deprecated and should not be used in new drivers. Use
+ * devm_drm_of_get_bridge() instead.
+ *
  * Returns zero if successful, or one of the standard error codes if it fails.
  */
 int drm_of_find_panel_or_bridge(const struct device_node *np,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 46bdfa48c413..f70c88ca96ef 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -911,6 +911,8 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
 						   u32 connector_type);
+struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
+					unsigned int port, unsigned int endpoint);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
 #endif
 
-- 
2.31.1

