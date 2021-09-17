Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0891740FF09
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 20:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4C06EDDB;
	Fri, 17 Sep 2021 18:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F576EDDB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 18:09:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id B6FA9320093B;
 Fri, 17 Sep 2021 14:09:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 17 Sep 2021 14:09:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=Tdh/kk6yu6JUp6CPLQW9HVhMQS
 oNx/fvZlZfIj3uYlk=; b=1E6eqhq+0zvxbt+D8jeA1fvKgh5x+Ws0rXDXBzrBxN
 8gCQQre/o0MDoyDiN/6BFYSyspnE1p7gsJbWfJuMa4MfyL+SIQLlAnTdWt3w00II
 BmC2vTPCzKbOcmAkIcp0TMG9TY0Cwq2vf8MQ1G0rInam8kH+T04gJKk3kr54+6Mv
 ipnm6MOXBhIeeKidloYC5hlOZoWAhAd/0+Wuist1GgMKPS/e5/CR9ufG+Nu3xKyZ
 qTyMcBTgeHASOIy+a9OrKOE9Nbg4XkgMoyqJuXL2hs6/xyX/LLx3at30PwxZVoWy
 r1DzRjmaO2yIkcXFNfIt/TZvqzN+UcnC42OhIrNUa5Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Tdh/kk6yu6JUp6CPL
 QW9HVhMQSoNx/fvZlZfIj3uYlk=; b=ecQzj+ZpM/bl47J+iYKoqJzeleehzWSfe
 mfX2LIe+VlxZf6y2XCHZpUfOFOCLOpzB1+/4z/wpgwLfBfIR4sE4dFLdRZUpwWP+
 An5yDWpeL4g9tzsrp1t6cRDiTMjgwwLEHWqUglI0TTGOZ3IxauCqT0UEdZ1ZrbyA
 2Iri4QooX/vLKDN2m1+2HMwPEwAHrS1Yq7Q6nxSIn3BVG4Hv3OlbHEu5GlVcm0fo
 78MUM6ZMaG5iE7D3hR/o8rfpTaX+eC/wIJP8AsL8X6nTuZ2nSsw0RBzbKpY+tHG7
 UqNMXKfQAw0Qk0ubFK5jyVTlAluoaVs9gOjhe8HazDCfvoGr+LC4A==
X-ME-Sender: <xms:19lEYZx8KoRQ_K772sxfUCeoYjNgwHGJ7D_AEH8omPfopeE9JZzm4g>
 <xme:19lEYZRS0eH_OWj0oMuMHvlXHYEgNbJHA1j6Ml_9f_EfAvVZrV3qQOltGBqNg-kSg
 Ywo8rGu7KMEQpXKTB8>
X-ME-Received: <xmr:19lEYTV5IaalNK7o2OXUCt7R164MbEWIxs6AMlD-c1xUVqf8SQ68S8KcLB-LF3RVwwtmOMLFXqKnNxeKJsvLH2e9Xi_j4MkgkWNi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehiedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeej
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:19lEYbil5cZBCWmf0uFIlEL0BaL2lgYifDZndsl1_5ZkYx5MoX8yOA>
 <xmx:19lEYbCjjpQmOowC1uYy0YJ6S619ZGAPakhWDLjFb3ChuI_vsM8EsA>
 <xmx:19lEYUJu8m6NmVSzNZpbAEVHY7xjkbZsqPFQOMS_v-jKiyc8rH_sDw>
 <xmx:2tlEYW6pcSI7ydbXtdDJd3cWOe8xli16lKolFNKthfSxXGW1WkGAtg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Sep 2021 14:09:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/bridge: Move devm_drm_of_get_bridge to bridge/panel.c
Date: Fri, 17 Sep 2021 20:09:25 +0200
Message-Id: <20210917180925.2602266-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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

By depending on devm_drm_panel_bridge_add(), devm_drm_of_get_bridge()
introduces a circular dependency between the modules drm (where
devm_drm_of_get_bridge() ends up) and drm_kms_helper (where
devm_drm_panel_bridge_add() is).

Fix this by moving devm_drm_of_get_bridge() to bridge/panel.c and thus
drm_kms_helper.

Fixes: 87ea95808d53 ("drm/bridge: Add a function to abstract away panels")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Hi Stephen,

I think it fixes the issue, but couldn't reproduce it here with my
config for some reason.

Let me know if it works for you.

Maxime
---
 drivers/gpu/drm/bridge/panel.c | 36 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge.c   | 34 --------------------------------
 2 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index c916f4b8907e..285a079cdef5 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -332,3 +332,39 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
 	return &panel_bridge->connector;
 }
 EXPORT_SYMBOL(drm_panel_bridge_connector);
+
+#ifdef CONFIG_OF
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
+					  u32 port, u32 endpoint)
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
+#endif
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 4c68733fa660..7ee29f073857 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1232,40 +1232,6 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 	return NULL;
 }
 EXPORT_SYMBOL(of_drm_find_bridge);
-
-/**
- * devm_drm_of_get_bridge - Return next bridge in the chain
- * @dev: device to tie the bridge lifetime to
- * @np: device tree node containing encoder output ports
- * @port: port in the device tree node
- * @endpoint: endpoint in the device tree node
- *
- * Given a DT node's port and endpoint number, finds the connected node
- * and returns the associated bridge if any, or creates and returns a
- * drm panel bridge instance if a panel is connected.
- *
- * Returns a pointer to the bridge if successful, or an error pointer
- * otherwise.
- */
-struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
-					  struct device_node *np,
-					  u32 port, u32 endpoint)
-{
-	struct drm_bridge *bridge;
-	struct drm_panel *panel;
-	int ret;
-
-	ret = drm_of_find_panel_or_bridge(np, port, endpoint,
-					  &panel, &bridge);
-	if (ret)
-		return ERR_PTR(ret);
-
-	if (panel)
-		bridge = devm_drm_panel_bridge_add(dev, panel);
-
-	return bridge;
-}
-EXPORT_SYMBOL(devm_drm_of_get_bridge);
 #endif
 
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
-- 
2.31.1

