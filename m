Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFAD76FEC3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7C189AAE;
	Fri,  4 Aug 2023 10:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A658710E6D4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:44:50 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FFA81AB3;
 Fri,  4 Aug 2023 12:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691145824;
 bh=NVGv48ZsaW1J2ePUXosAluIgk8qR+1DrF7efAr7lM4w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dGDYFKiRY3ejkAX1kWBtrueu0SEW5lxRwH92ud9Fe8DbjpkvBgjWLhXcumV9/AJfF
 KF19+EBtC0ql19kWEcAO9xd1NdMKirgUIF5Ax3zAbA57x3H0cZ9iKndFzEVAVhzD3f
 +vSaM3Qz6n0tbhbNt7mDycPPs3CPG8wv26aLTXdk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Aug 2023 13:44:16 +0300
Subject: [PATCH 11/11] drm/bridge: tc358768: Add
 DRM_BRIDGE_ATTACH_NO_CONNECTOR support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-tc358768-v1-11-1afd44b7826b@ideasonboard.com>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
In-Reply-To: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3311;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=NVGv48ZsaW1J2ePUXosAluIgk8qR+1DrF7efAr7lM4w=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNaUTL0ctCqlqan7C6QJgIPS0jOOK19pqZh0f
 tnCtHFYzGWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzWlAAKCRD6PaqMvJYe
 9Z3oD/9GvdukB96G4adIbYXsQ7SSiIRzmYQYNiFOUQW55h6eof6UJRwPyXL+5wiOP9/MyFGtsLv
 Uk32KzqAHGJChrf2erw9ZGghKeZG0M/UQ8GJeQ+BjTSMGgOh0ySP/+bSgqvic65dsayZ5Fmg11b
 CVhophTt8Q4uCahRYBjQgc06ueGYQPKj8Qw0p6kJY1D3KhLvHxCDjQj4i+gFd9++hbPBw+wg0zc
 +n4vi3WG/S7vytZLqJvhZV3pKqteZw+SRNYux7kWeLOpQ2QIBOntlPm6KJi7ymcsAYBYFusDwiz
 6Lscmd9PudbiBvPA+8vCcIZUaMuBNkZLYIlUtMtrBZHb9qlzKyRpoKtOeB0hql8j16N0b4DTg4C
 x7MR3m3NjuqvTdloSLRHfydtvDH9MJQhUdkxQRIPO++KLyQX9uVsN4OFnYfockwKfsSGvSxQQX6
 YKAb5vw0FCx00uBHGxjZoFlhCBphTFmen4hmo9qU8+8wfP2dLt6Xj9189q8KSTUueFOX+gGJZGS
 7tC54hRSst9FBUaZYC00YPgXkjAlWMcdNARl2zQXEJU/jJFWHjt22UXsiftwPgdei9SjR8fiamp
 6cci8rii7FfrhOWFYz2a+31j4hZGvVaxW6Dnqxwl5aJPzLMFy7lGfj5Ap/TuxpQiywsljV50Aez
 Yqj74AJoa4QYsSw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 64 +++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index ea19de5509ed..a567f136ddc7 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -131,8 +131,17 @@ static const char * const tc358768_supplies[] = {
 
 struct tc358768_dsi_output {
 	struct mipi_dsi_device *dev;
+
+	/* Legacy field if DRM_BRIDGE_ATTACH_NO_CONNECTOR is not used */
 	struct drm_panel *panel;
-	struct drm_bridge *bridge;
+
+	/*
+	 * If DRM_BRIDGE_ATTACH_NO_CONNECTOR is not used and a panel is attached
+	 * to tc358768, 'next_bridge' contains the bridge the driver created
+	 * with drm_panel_bridge_add_typed(). Otherwise 'next_bridge' contains
+	 * the next bridge the driver found.
+	 */
+	struct drm_bridge *next_bridge;
 };
 
 struct tc358768_priv {
@@ -391,8 +400,6 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 				    struct mipi_dsi_device *dev)
 {
 	struct tc358768_priv *priv = dsi_host_to_tc358768(host);
-	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	struct device_node *ep;
 	int ret;
 
@@ -420,21 +427,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 		return -ENOTSUPP;
 	}
 
-	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel,
-					  &bridge);
-	if (ret)
-		return ret;
-
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
-
 	priv->output.dev = dev;
-	priv->output.bridge = bridge;
-	priv->output.panel = panel;
 
 	priv->dsi_lanes = dev->lanes;
 	priv->dsi_bpp = mipi_dsi_pixel_format_to_bpp(dev->format);
@@ -463,7 +456,7 @@ static int tc358768_dsi_host_detach(struct mipi_dsi_host *host,
 
 	drm_bridge_remove(&priv->bridge);
 	if (priv->output.panel)
-		drm_panel_bridge_remove(priv->output.bridge);
+		drm_panel_bridge_remove(priv->output.next_bridge);
 
 	return 0;
 }
@@ -544,7 +537,40 @@ static int tc358768_bridge_attach(struct drm_bridge *bridge,
 		return -ENOTSUPP;
 	}
 
-	return drm_bridge_attach(bridge->encoder, priv->output.bridge, bridge,
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		struct device_node *node;
+
+		/* Get the next bridge, connected to port@1. */
+		node = of_graph_get_remote_node(priv->dev->of_node, 1, -1);
+		if (!node)
+			return -ENODEV;
+
+		priv->output.next_bridge = of_drm_find_bridge(node);
+		of_node_put(node);
+		if (!priv->output.next_bridge)
+			return -EPROBE_DEFER;
+	} else {
+		struct drm_bridge *bridge;
+		struct drm_panel *panel;
+		int ret;
+
+		ret = drm_of_find_panel_or_bridge(priv->dev->of_node, 1, 0,
+						  &panel, &bridge);
+		if (ret)
+			return ret;
+
+		if (panel) {
+			bridge = drm_panel_bridge_add_typed(panel,
+				DRM_MODE_CONNECTOR_DSI);
+			if (IS_ERR(bridge))
+				return PTR_ERR(bridge);
+		}
+
+		priv->output.next_bridge = bridge;
+		priv->output.panel = panel;
+	}
+
+	return drm_bridge_attach(bridge->encoder, priv->output.next_bridge, bridge,
 				 flags);
 }
 

-- 
2.34.1

