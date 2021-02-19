Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F531FA32
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 15:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DAA6EB38;
	Fri, 19 Feb 2021 13:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4706D6EB31
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 13:59:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 50A27949;
 Fri, 19 Feb 2021 08:59:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 19 Feb 2021 08:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=zFfAl0OUdJ0kt
 QEG5LwyHz0/1pzCRYu9uLFz0WiF+y8=; b=QnrNti8zH1GfjfqP5yG6qqR9meaSZ
 pDPTujbHMweTMwHppz4lRudWkdkcqogGFvg+1qAMqhO0W/m3HhpLorjgS4e/rcWa
 PC4GC8RiCrC7c9GmXBcn/46L232RH/GjF+U2Ua1Ih+5mhboWr9dVcFul0Y9HCEG6
 gF+AubFCqM8XLX6iJqSnjtp5NzMixN4A367GDxHi4T51v37I0rLIvpS1cqqIt4QB
 JFaO7nqRqfutAK3bpcA85XEZZWdZd8kIHRBs1XGYtjYI64hcHAIKwsFGUGCL+ryp
 7y4wHtIqUtYiUU3b0ClFiT/uM9OyJbnjLK3CBuwvM1A68aFuWKjvEkz3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zFfAl0OUdJ0ktQEG5LwyHz0/1pzCRYu9uLFz0WiF+y8=; b=k1gY94xv
 WIMX0a3El57DYIN0+BJxhNlf/FZ0Eh2SkZURgpXyFHFV9sV4p2o9Ts0ItHA/5M2Q
 5WXAab1RkZrFUSwdPFy0Wwg7mkEADQbvjuhYepRFi4UiZ4fWiwiLdVZJuqpHpP8m
 HlZbN9YE6dV3pbQFo93YhttzGCtETVEZgvDrERBAA4xTMHJI1d5higkRYSnwp92h
 8onYTS7LZlwJXYSajbn+ZwdvPAFnqx/KijsPuNrbv2NpFPOuLw6ADlePi4iZCwa0
 9TDo+NCSJy4pvUpkOeU1F94x4KgHUrZ8gJhbgTbfjqORKnBTa0qqPo9RhWhrUU3w
 8IHiqpSSH9nTig==
X-ME-Sender: <xms:TcQvYAm5K-wlONQT0WbbotMoV2PeG7DCGhMkf0izfs355bJ_L9O_7w>
 <xme:TcQvYP36HYGNFNSG_2x6Kw-KvSs1o4Y-9lKr2_qcipGHxSca8tTFLdtVpj9CVuxab
 YWL4HUeIJmBNW73ZMU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TcQvYOqD36dykQmi3HAwimfyPN61grilrsT5aAqEUrlHn_F0sEXLxw>
 <xmx:TcQvYMnSShdcrlEWshrBpgNKJxo0GLcunfSv5DdygexDrLkz_DSNYQ>
 <xmx:TcQvYO0ZzP-aqP8_AHhgVCg0a5YDov9w2LutST-LJpO6TEBgyt-PHQ>
 <xmx:TcQvYHk-oJGYyZjOv0oUlvB8jhP3EomkGaaMVoJ9rp9_N-3o2M1VwA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 725A324005B;
 Fri, 19 Feb 2021 08:59:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 2/7] drm/of: Change the prototype of
 drm_of_lvds_get_dual_link_pixel_order
Date: Fri, 19 Feb 2021 14:59:29 +0100
Message-Id: <20210219135934.618684-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219135934.618684-1-maxime@cerno.tech>
References: <20210219135934.618684-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
 drivers/gpu/drm/drm_of.c            | 138 ++++++++++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_lvds.c |   8 +-
 include/drm/drm_of.h                |  16 +++-
 3 files changed, 122 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index ca04c34e8251..681664a8875f 100644
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
-			of_node_put(remote_port);
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
@@ -331,17 +358,26 @@ static int drm_of_lvds_get_remote_pixels_type(
 		 * configurations by passing the endpoints explicitly to
 		 * drm_of_lvds_get_dual_link_pixel_order().
 		 */
-		if (!current_pt || pixels_type != current_pt)
+		if (previous_pt != current_pt) {
+			of_node_put(port);
 			return -EINVAL;
+		}
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
@@ -355,43 +391,85 @@ static int drm_of_lvds_get_remote_pixels_type(
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
index 70dbbe44bb23..5e844156f753 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -711,7 +711,6 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 {
 	const struct of_device_id *match;
 	struct device_node *companion;
-	struct device_node *port0, *port1;
 	struct rcar_lvds *companion_lvds;
 	struct device *dev = lvds->dev;
 	int dual_link;
@@ -739,11 +738,8 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
