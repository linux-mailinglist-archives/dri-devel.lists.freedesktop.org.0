Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC741C0DA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 10:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0B96EA05;
	Wed, 29 Sep 2021 08:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3F36EA05
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:42:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 26C823201C3B;
 Wed, 29 Sep 2021 04:42:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 29 Sep 2021 04:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=xoWGDMqkYJxoo
 jhfxxwBIkYd3ZVsrUiJz6HEomEUlu0=; b=Ef3A6uRCB7IpyBl4Xwabf/quDs3hR
 Z4NnLx1fEk6XpQ04QrXY4OXYKOCA9ZOF6sDaWqR/7fST/y/NlVm/dUAQYIfhVLSz
 XJgEBtGN/0FYODjWum5RxL67gNj5NRmRe34WHnXAOCPVUrbMnBWLXachWLtMyYyC
 I4EGhEUFMpmWOHdcL4DOzaugFy8natmh95jigyoZDxIR6I/77qnAL5T9lzSeNtX5
 Q0jxAc9iUUSWEuF5Gj3msx8coaU6mpq1EEonE3EGNkMq08sDeCCQh9nnudbSOHv/
 AuKoceHXTZeg9PwvReV4+KyPOW6qJmpbh0wWWFMf+sgCWRoDBitqn4cJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xoWGDMqkYJxoojhfxxwBIkYd3ZVsrUiJz6HEomEUlu0=; b=eNa93cK/
 TphC4VnMZXwzlyHBlkZo09S5ATL5QKSd/KC3cpJlqisb4IpkpZl6YH6QCB7KMXSY
 Rp3mzEpBuKOlIyu16tU+fXloS12hCzCq7AGy6dZTd07T79/Bd/bVewwt1Q+ljUOu
 6XdUmDGSudHv4PrTrXLxh34B0VPgngxdHYDFP0kpgzzsdJ3ZL4pFPFOqPC+TY8Bx
 +GBVF6M25zy2sYvHe7SctQjyClJMDbfZBsIKWACds2nTdOCtzeC83+lfgq66N1/h
 9TT+g6uOgA1ooXAu2zjgcxxTItTILpwAl5FgvonhdiJrQPtuRXIsZKo9wyFxHmUd
 a6WV0iL1FuNLjw==
X-ME-Sender: <xms:BydUYbqbsq48z4QAOAnr9gM6k-EIwK0YP6SUohDpnULRv-KvagmtAQ>
 <xme:BydUYVqGY_0cVpH0xyhQM_BfTgT8YnK8cigyri9vBGnQb-xejTz3Nij0ECTryr6Ng
 ugpQXNicv7SWVbSWGI>
X-ME-Received: <xmr:BydUYYNobSwAdwbw6vJyBYJKEC72bs261b34AtEJx4IiGztaBhwws_pmuyUnsmf4WAm1wMyMJXxBIJWfp2iJ2YxlcUpsEjxdC7WJSdsp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BydUYe6dIm4K35Zs73XIkcNJcdIt7H922bUQczzg5-AEaCM_XH03wA>
 <xmx:BydUYa7WTDZbrds682n6nmNHpO5Jc5eKB3teQu6Eta0zXfB8n2zlMA>
 <xmx:BydUYWhY5nRv4sRO12adl1Bmw3zhfcIY4RrtkvM4kBNNbE4Himq6sg>
 <xmx:BydUYct3o9UIfn1WKOqiMxnDyA3wTASKpvGhL9CLT1FDJNBBq4-07w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 04:42:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/7] drm/of: Change the prototype of
 drm_of_lvds_get_dual_link_pixel_order
Date: Wed, 29 Sep 2021 10:42:29 +0200
Message-Id: <20210929084234.1271915-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929084234.1271915-1-maxime@cerno.tech>
References: <20210929084234.1271915-1-maxime@cerno.tech>
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

The drm_of_lvds_get_dual_link_pixel_order() function took so far the
device_node of the two ports used together to make up a dual-link LVDS
output.

This assumes that a binding would use an entire port for the LVDS output.
However, some bindings have used endpoints instead and thus we need to
operate at the endpoint level. Change slightly the arguments to allow that.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_of.c            | 138 +++++++++++++++++++++-------
 drivers/gpu/drm/rcar-du/rcar_lvds.c |   8 +-
 include/drm/drm_of.h                |  16 +++-
 3 files changed, 121 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 997b8827fed2..681664a8875f 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -300,13 +300,35 @@ static int drm_of_lvds_get_port_pixels_type(struct device_node *port_node)
 	       (odd_pixels ? DRM_OF_LVDS_ODD : 0);
 }
 
-static int drm_of_lvds_get_remote_pixels_type(
-			const struct device_node *port_node)
+static int drm_of_lvds_get_remote_pixels_type(const struct device_node *endpoint)
 {
-	struct device_node *endpoint = NULL;
-	int pixels_type = -EPIPE;
+	struct device_node *remote_port;
+	int pixels_type;
 
-	for_each_child_of_node(port_node, endpoint) {
+	remote_port = of_graph_get_remote_port(endpoint);
+	if (!remote_port)
+		return -EPIPE;
+
+	pixels_type = drm_of_lvds_get_port_pixels_type(remote_port);
+	of_node_put(remote_port);
+
+	if (pixels_type < 0)
+		return -EPIPE;
+
+	return pixels_type;
+}
+
+static int drm_of_lvds_check_remote_port(const struct device_node *dev, int id)
+{
+	struct device_node *endpoint;
+	struct device_node *port;
+	int previous_pt = -EPIPE;
+
+	port = of_graph_get_port_by_id(dev, id);
+	if (!port)
+		return -EINVAL;
+
+	for_each_child_of_node(port, endpoint) {
 		struct device_node *remote_port;
 		int current_pt;
 
@@ -315,14 +337,19 @@ static int drm_of_lvds_get_remote_pixels_type(
 
 		remote_port = of_graph_get_remote_port(endpoint);
 		if (!remote_port) {
-			of_node_put(endpoint);
+			of_node_put(port);
 			return -EPIPE;
 		}
 
 		current_pt = drm_of_lvds_get_port_pixels_type(remote_port);
 		of_node_put(remote_port);
-		if (pixels_type < 0)
-			pixels_type = current_pt;
+		if (!current_pt) {
+			of_node_put(port);
+			return -EINVAL;
+		}
+
+		if (previous_pt < 0)
+			previous_pt = current_pt;
 
 		/*
 		 * Sanity check, ensure that all remote endpoints have the same
@@ -331,19 +358,26 @@ static int drm_of_lvds_get_remote_pixels_type(
 		 * configurations by passing the endpoints explicitly to
 		 * drm_of_lvds_get_dual_link_pixel_order().
 		 */
-		if (!current_pt || pixels_type != current_pt) {
-			of_node_put(endpoint);
+		if (previous_pt != current_pt) {
+			of_node_put(port);
 			return -EINVAL;
 		}
+
+		previous_pt = current_pt;
 	}
 
-	return pixels_type;
+	of_node_put(port);
+	return previous_pt < 0 ? previous_pt : 0;
 }
 
 /**
  * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order
- * @port1: First DT port node of the Dual-link LVDS source
- * @port2: Second DT port node of the Dual-link LVDS source
+ * @dev1: First DT device node of the Dual-Link LVDS source
+ * @port1_id: ID of the first DT port node of the Dual-Link LVDS source
+ * @endpoint1_id: ID of the first DT port node of the Dual-Link LVDS source
+ * @dev2: Second DT device node of the Dual-Link LVDS source
+ * @port2_id: ID of the second DT port node of the Dual-Link LVDS source
+ * @endpoint2_id: ID of the second DT port node of the Dual-Link LVDS source
  *
  * An LVDS dual-link connection is made of two links, with even pixels
  * transitting on one link, and odd pixels on the other link. This function
@@ -357,43 +391,85 @@ static int drm_of_lvds_get_remote_pixels_type(
  *
  * If either port is not connected, this function returns -EPIPE.
  *
- * @port1 and @port2 are typically DT sibling nodes, but may have different
- * parents when, for instance, two separate LVDS encoders carry the even and odd
- * pixels.
+ * @port1_id and @port2_id are typically DT sibling nodes, but may have
+ * different parents when, for instance, two separate LVDS encoders carry the
+ * even and odd pixels.
+ *
+ * If @port1_id, @port2_id, @endpoint1_id or @endpoint2_id are set to -1, their
+ * value is going to be ignored and the first port or endpoint will be used.
  *
  * Return:
- * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 carries even pixels and @port2
- *   carries odd pixels
- * * DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS - @port1 carries odd pixels and @port2
- *   carries even pixels
- * * -EINVAL - @port1 and @port2 are not connected to a dual-link LVDS sink, or
- *   the sink configuration is invalid
- * * -EPIPE - when @port1 or @port2 are not connected
+ * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @endpoint1_id carries even pixels and
+ *   @endpoint2_id carries odd pixels
+ * * DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS - @endpoint1_id carries odd pixels and
+ *   @endpoint2_id carries even pixels
+ * * -EINVAL - @endpoint1_id and @endpoint2_id are not connected to a dual-link
+ *   LVDS sink, or the sink configuration is invalid
+ * * -EPIPE - when @endpoint1_id or @endpoint2_id are not connected
  */
-int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
-					  const struct device_node *port2)
+int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *dev1,
+					  int port1_id,
+					  int endpoint1_id,
+					  const struct device_node *dev2,
+					  int port2_id,
+					  int endpoint2_id)
 {
+	struct device_node *endpoint1, *endpoint2;
 	int remote_p1_pt, remote_p2_pt;
+	int ret;
 
-	if (!port1 || !port2)
+	if (!dev1 || !dev2)
 		return -EINVAL;
 
-	remote_p1_pt = drm_of_lvds_get_remote_pixels_type(port1);
-	if (remote_p1_pt < 0)
+	if (endpoint1_id == -1) {
+		ret = drm_of_lvds_check_remote_port(dev1, port1_id);
+		if (ret)
+			return ret;
+	}
+
+	if (endpoint2_id == -1) {
+		ret = drm_of_lvds_check_remote_port(dev2, port2_id);
+		if (ret)
+			return ret;
+	}
+
+	endpoint1 = of_graph_get_endpoint_by_regs(dev1, port1_id, endpoint1_id);
+	if (!endpoint1)
+		return -EINVAL;
+
+	endpoint2 = of_graph_get_endpoint_by_regs(dev2, port2_id, endpoint2_id);
+	if (!endpoint2) {
+		of_node_put(endpoint1);
+		return -EINVAL;
+	}
+
+	remote_p1_pt = drm_of_lvds_get_remote_pixels_type(endpoint1);
+	if (remote_p1_pt < 0) {
+		of_node_put(endpoint2);
+		of_node_put(endpoint1);
 		return remote_p1_pt;
+	}
 
-	remote_p2_pt = drm_of_lvds_get_remote_pixels_type(port2);
-	if (remote_p2_pt < 0)
+	remote_p2_pt = drm_of_lvds_get_remote_pixels_type(endpoint2);
+	if (remote_p2_pt < 0) {
+		of_node_put(endpoint2);
+		of_node_put(endpoint1);
 		return remote_p2_pt;
+	}
 
 	/*
 	 * A valid dual-lVDS bus is found when one remote port is marked with
 	 * "dual-lvds-even-pixels", and the other remote port is marked with
 	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
 	 */
-	if (remote_p1_pt + remote_p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
+	if (remote_p1_pt + remote_p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD) {
+		of_node_put(endpoint2);
+		of_node_put(endpoint1);
 		return -EINVAL;
+	}
 
+	of_node_put(endpoint2);
+	of_node_put(endpoint1);
 	return remote_p1_pt == DRM_OF_LVDS_EVEN ?
 		DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS :
 		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index d061b8de748f..40389e76e04b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -606,7 +606,6 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 {
 	const struct of_device_id *match;
 	struct device_node *companion;
-	struct device_node *port0, *port1;
 	struct rcar_lvds *companion_lvds;
 	struct device *dev = lvds->dev;
 	int dual_link;
@@ -634,11 +633,8 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 	 * connected to, if they are marked as expecting even pixels and
 	 * odd pixels than we need to enable vertical stripe output.
 	 */
-	port0 = of_graph_get_port_by_id(dev->of_node, 1);
-	port1 = of_graph_get_port_by_id(companion, 1);
-	dual_link = drm_of_lvds_get_dual_link_pixel_order(port0, port1);
-	of_node_put(port0);
-	of_node_put(port1);
+	dual_link = drm_of_lvds_get_dual_link_pixel_order(dev->of_node, 1, -1,
+							  companion, 1, -1);
 
 	switch (dual_link) {
 	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index b9b093add92e..7bb1f6603beb 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -47,8 +47,12 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				int port, int endpoint,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge);
-int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
-					  const struct device_node *port2);
+int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *dev1,
+					  int port1_id,
+					  int endpoint1_id,
+					  const struct device_node *dev2,
+					  int port2_id,
+					  int endpoint2_id);
 #else
 static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 					  struct device_node *port)
@@ -93,8 +97,12 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
 }
 
 static inline int
-drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
-				      const struct device_node *port2)
+drm_of_lvds_get_dual_link_pixel_order(const struct device_node *dev1,
+				      int port1_id,
+				      int endpoint1_id,
+				      const struct device_node *dev2,
+				      int port2_id,
+				      int endpoint2_id)
 {
 	return -EINVAL;
 }
-- 
2.31.1

