Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61007406CB2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 15:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DE16E9F3;
	Fri, 10 Sep 2021 13:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCF16E9F4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 13:09:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id D5B892B012ED;
 Fri, 10 Sep 2021 09:09:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Sep 2021 09:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=6Nxr9/+ZCZUfG
 Xy+EbDqwys5pctjmhM4M1OIA6FMtd8=; b=RuR/76DyPpiLdkzhSXTsXX/YYGbFi
 99ZHyyRscZ/wk+ph5SYygc47fFNyU/kjKEWsgYB4CxinRCHqHZ5pbRyiGhsYEy5v
 /jMop96QgRGBlmgAAokOr+bTQc6EHmrHmOx6WsJMZqyflZyK6DaW70T3n0GMbzIO
 ItPNLhdcuh3fVUrxizDFih66DlqafOc8OyLZOZYbvLVftoxV/nlVnqEZ4kwaFiAo
 7e8OfLTUu4I8Z+MzKjKS26WgU+7OKFymUgo7x3tYlY0m8bB3nULcy8nReS0hHdbB
 kL9OCJJmg3A2BV7cr1Ta4Yadhn7pp3kOr2ryuA6JMdiNhNm4NyijTWDEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=6Nxr9/+ZCZUfGXy+EbDqwys5pctjmhM4M1OIA6FMtd8=; b=aXygIlAK
 /Rem3wIa3pCVVxv7KT1vrkPfVOU/GWcFBX5IZ2lOjww2yg3lujFiMUkFpN95mKZY
 Saz8FXIKuRel/W6k/o4rpEOkggZ2sY5CplttvbMrglkkujDVn9jKoNWlrQX5vvk5
 K5DChmsnic+fNqqp3zNsO3EjMBNzMvcyKr4Nq+isywc8uwUNsik1TclOJw+xfyHC
 ifePJsBvrEy3FhPrbFYg8Ka0fsS41C6oklopY0VTnM85kLgEvovsBFN+0XD6sf/K
 FAv2IeRi8xh+U32Fsy0JE6PDIQe7SfKfZUeTe6wCTiVJeTHPnLpSyretRSucEZt5
 f58BI5RKIMFtKw==
X-ME-Sender: <xms:HVk7YbzdhijKo7wgEcaCSMdZrlAcJkcKkTDMoKoTzn59HHTDBpuP5w>
 <xme:HVk7YTRt6SXQ2vy30n1_4fQXN3ZsZwDpf0Y6rydTp2eM3AxAXatR4RRxuC5AgEzZv
 3pPnldi1xPeOARL1mQ>
X-ME-Received: <xmr:HVk7YVWP0JeynLEtUkLsBZmtEFSJo2FfAN66NNc4I9Lc0s7i60kWwtLK7zzYpUK_p1UnYV5wiOghXgIGZyrS4d7eYrsNMnwsRZsF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HVk7YVjR0iHLwGhNwZgRuvy_wcaWN5E6nwYI-2U8uaCnoJ1gUccNbA>
 <xmx:HVk7YdD2O1iLAduv47CfT3M3VDg-pWYgy2Yiw8ookXqgw9XgzKF9Rw>
 <xmx:HVk7YeKS7dmwdpS0kSjVdzpJ8otnRb9KBx4aOjhTpigq3vaW2CYPqw>
 <xmx:H1k7YR7dzUUtAj9oHUPvHV2KYudj6a3hCPFwr91BGqvrpL5It2ybTUKeWig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 09:09:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/bridge: Add a function to abstract away panels
Date: Fri, 10 Sep 2021 15:09:39 +0200
Message-Id: <20210910130941.1740182-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910130941.1740182-1-maxime@cerno.tech>
References: <20210910130941.1740182-1-maxime@cerno.tech>
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
index a8ed66751c2d..10ddca4638b0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -28,6 +28,7 @@
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
@@ -51,10 +52,8 @@
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
@@ -1233,6 +1232,41 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
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

