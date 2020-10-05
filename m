Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC2284745
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85EF6E417;
	Tue,  6 Oct 2020 07:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513396E092
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:15:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A649258016C;
 Mon,  5 Oct 2020 11:15:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 11:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=yXaf9pFoVUMQ8
 bcQGOAMyZ0KPuYIKx3O2IEnwrXrkos=; b=gYtJGyimoV5J5pq+wbfy5DIItqKW8
 VpObiKt0ZjYTQOyfUIqiv6MSCyRI+LhPOL6YA0UeLpGskF2cc7ml/4OE9X3cxVxe
 1DKu3JvgOmaBKanGJCkzB0gtVdHopLUgt1fxDcEAimPl8JPjusSf5noaKeNtDZTD
 M1EF9aZYcNWC9UY2wB6BAurLYlV0mD3KZFDLG8IbBbUmzJISDk4DvYZGRhEeNoV/
 rTF8LgcwJyhEYIE/uv+p62cNCDFMmR2shyNFzJakL01gRSpeSssS8V677YBwGJzB
 CnrUnyB2JTiwXCs0kL83bntOH3F6P0oOuciAy/Dv/q0ec5b6529mM08Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yXaf9pFoVUMQ8bcQGOAMyZ0KPuYIKx3O2IEnwrXrkos=; b=BJe2RJxO
 pjqbX1iEzT8XA0DpzRqhYJAmJKP+N6qaqIPnfab6C7vH/7+rW0yKW3MkQQhumigp
 DdImXBqDMEJ1sulTDCpTzFN9GXwYLeLBjiV+WGqWeonZACGetQpg+zfK/aIWaHlu
 krj7GFUGbjcHKPpdZHJeIEGoyKQfVHParYI7Cz4c/h63QyhyglujrjeDZSCGxwB+
 B8pdmTbQBbOzpHKHffn3ujyQVgHmWVbIQoamqVeJanntBO5kixMcmABk4uNaxFlK
 lMH7ku1Qi8TUOmiBH9f6piRMcCSOEMiTBP1KMfenLWaBGepmzsK8PjPVIkcpIphP
 RNLAGg6CgbOGxQ==
X-ME-Sender: <xms:pDh7X6-s_1Z0_XNjgPaeCk3wUixZFitK_DEENrtIeRCGTSWvLP3xiw>
 <xme:pDh7X6vcS_uY1RuG3I_IySOWwPDrAXCDAiFETvsxowt1fDvZ_jXnf6tb8hEdg1gai
 cxx1621ZdvL8OvG-n4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pDh7XwDvktZRr8BBrHk6egf9YkXCH-gviJKxc5Q673IwWIP57fDVyg>
 <xmx:pDh7XycvLfgZLQyh-dV05EDUyU9IswXfRi6TB4mcTUBDTbSGg7b8mQ>
 <xmx:pDh7X_Ph0cnrVQNa1sz7p7nOiVyltyXO-Cg4hGa1tEbzRUqoXoZOog>
 <xmx:pjh7XwHXkPS2DlB5ZaT1NWOiIkuuTmxUt45_FzEE8nz5HTR-MjSSUg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 263A53064680;
 Mon,  5 Oct 2020 11:15:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v3 1/6] drm/of: Change the prototype of
 drm_of_lvds_get_dual_link_pixel_order
Date: Mon,  5 Oct 2020 17:15:39 +0200
Message-Id: <6169dd15782627c8415583881fa94ba39c4f5221.1601910923.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
References: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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
 drivers/gpu/drm/drm_of.c            | 98 +++++++++++++++---------------
 drivers/gpu/drm/rcar-du/rcar_lvds.c |  8 +--
 include/drm/drm_of.h                | 16 +++--
 3 files changed, 63 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index b50b44e76279..2dcb49b0401b 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -291,50 +291,34 @@ static int drm_of_lvds_get_port_pixels_type(struct device_node *port_node)
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
-		struct device_node *remote_port;
-		int current_pt;
-
-		if (!of_node_name_eq(endpoint, "endpoint"))
-			continue;
-
-		remote_port = of_graph_get_remote_port(endpoint);
-		if (!remote_port) {
-			of_node_put(remote_port);
-			return -EPIPE;
-		}
-
-		current_pt = drm_of_lvds_get_port_pixels_type(remote_port);
+	remote_port = of_graph_get_remote_port(endpoint);
+	if (!remote_port) {
 		of_node_put(remote_port);
-		if (pixels_type < 0)
-			pixels_type = current_pt;
-
-		/*
-		 * Sanity check, ensure that all remote endpoints have the same
-		 * pixel type. We may lift this restriction later if we need to
-		 * support multiple sinks with different dual-link
-		 * configurations by passing the endpoints explicitly to
-		 * drm_of_lvds_get_dual_link_pixel_order().
-		 */
-		if (!current_pt || pixels_type != current_pt) {
-			of_node_put(remote_port);
-			return -EINVAL;
-		}
+		return -EPIPE;
 	}
 
+	pixels_type = drm_of_lvds_get_port_pixels_type(remote_port);
+	of_node_put(remote_port);
+
+	if (pixels_type < 0)
+		pixels_type = -EPIPE;
+
 	return pixels_type;
 }
 
 /**
  * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order
- * @port1: First DT port node of the Dual-link LVDS source
- * @port2: Second DT port node of the Dual-link LVDS source
+ * @dev1: First DT device node of the Dual-Link LVDS source
+ * @port1_id: ID of the first DT port node of the Dual-Link LVDS source
+ * @endpoint1_id: ID of the first DT port node of the Dual-Link LVDS source
+ * @dev2: First DT device node of the Dual-Link LVDS source
+ * @port2_id: ID of the first DT port node of the Dual-Link LVDS source
+ * @endpoint2_id: ID of the first DT port node of the Dual-Link LVDS source
  *
  * An LVDS dual-link connection is made of two links, with even pixels
  * transitting on one link, and odd pixels on the other link. This function
@@ -348,32 +332,48 @@ static int drm_of_lvds_get_remote_pixels_type(
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
+ * value is going to be ignored.
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
 
-	if (!port1 || !port2)
+	if (!dev1 || !dev2)
+		return -EINVAL;
+
+	endpoint1 = of_graph_get_endpoint_by_regs(dev1, port1_id, endpoint1_id);
+	if (!endpoint1)
+		return -EINVAL;
+
+	endpoint2 = of_graph_get_endpoint_by_regs(dev2, port2_id, endpoint2_id);
+	if (!endpoint2)
 		return -EINVAL;
 
-	remote_p1_pt = drm_of_lvds_get_remote_pixels_type(port1);
+	remote_p1_pt = drm_of_lvds_get_remote_pixels_type(endpoint1);
 	if (remote_p1_pt < 0)
 		return remote_p1_pt;
 
-	remote_p2_pt = drm_of_lvds_get_remote_pixels_type(port2);
+	remote_p2_pt = drm_of_lvds_get_remote_pixels_type(endpoint2);
 	if (remote_p2_pt < 0)
 		return remote_p2_pt;
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index ab0d49618cf9..02d8c4ce820e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -715,7 +715,6 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 {
 	const struct of_device_id *match;
 	struct device_node *companion;
-	struct device_node *port0, *port1;
 	struct rcar_lvds *companion_lvds;
 	struct device *dev = lvds->dev;
 	int dual_link;
@@ -743,11 +742,8 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
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
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
