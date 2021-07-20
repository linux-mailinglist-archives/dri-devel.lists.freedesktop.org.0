Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F23CFAFD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD82B89EA3;
	Tue, 20 Jul 2021 13:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDA86E1BA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:45:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A5FA92B0118B;
 Tue, 20 Jul 2021 09:45:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 20 Jul 2021 09:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Y1PGxBBc2x1J5
 /4e1hDAV1v6mDbdZRmgKeM9hilyyuE=; b=wbcmb/3lQqv9llefCApdMTLmEVEac
 eplPXEqsvE5mqYZG5iNoN41/PKonGuhMiC2zwUDCYHwUeovcX6QGdXVZ3ehn02PJ
 tgHSOc1kvQ4Ea/uD/HMym3gmT07m27/Z7WSvjGdohEFJuyYbjl2CsUtYZCsDCRWf
 X1c+SochqnXC4j6nkzfnyytfgAF24tgIzhyJyZVuKA2gIv9y2aH6/TV+IxkIWB0j
 FPfJEHMeVJ1pUCtntcV9KmYmu1ilOslIFsI+2tc+/7E6NiS9Rzt1fZrRXm8HZMMX
 rFTeMjqj0TVoqTHR1i4SFaLRj/8Vtw6zL0gL7Ir6H4GhSA3OQcxO5p0Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Y1PGxBBc2x1J5/4e1hDAV1v6mDbdZRmgKeM9hilyyuE=; b=sihLDEp2
 BlzCMoObJDmOnuI74E+PLEHjYc50k5PmTTgJq3zk6TV9EmtYHjL++FyFmKX5B77F
 cSdrSJmSpz2kWZX5q0TJ8/i065sUuTCW2CwDUKxvIBm5JFg33Nxl5gV7ZXhNgPYr
 OMtB78f3eYG9ARoM5ZyJs2/eNjTfv+WayDwpVVBSRO5DYsKzDlKsIDR8LE21ALrq
 73uiHuLLBzfOud5MugApAqsrszy63QDiXVBu8oXMwAJl4n5uuWNcjyItLgel5Dyn
 CXONh4RtLsg664S60UU06jnlEOz/MB9BWKqZcTH0A8a9vwmAfiy49qeq9mC71Ibz
 Atef4HOgopTesw==
X-ME-Sender: <xms:g9P2YOgqUGOPbz7s-uuCvfZwTUOKxDBSgfLMxBpTq3Ghms1V4JxAzA>
 <xme:g9P2YPDQhFWALc6F0DlX7mwo4IYgVmWp3IXdqKAxSG_aTlvkhlsJct163OZERNK3y
 y0WF0nlUlIdEXYQTkU>
X-ME-Received: <xmr:g9P2YGHu5HFk8aaDpBW4CV7o6vmYsZSUgcETerg6-ULWSSU0V3C6_Sd0bKfe_XaVPu3lyBmzpP_8U9g4K6KXLwRfyHkoBCUt-lT2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:g9P2YHQR9FDIRej6SlGqN_tXncMcnzMcxMOOTVhdJAc1n_7INWn7JQ>
 <xmx:g9P2YLxqzapvl8-_PFVbPBT0vO0eOFUjkc0ZaKxdNUIc3zT8loYEZA>
 <xmx:g9P2YF72kTUQ8CfANee2K75zg17Cxi-W8wtKOve5AlSLn4KOPowlVA>
 <xmx:g9P2YDgJTxGP6djQv7ofjzu_8JdHYref_wy9ZKlBAvdvX6JVaNLtWTT_YF4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:45:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 02/10] drm/bridge: Add a function to abstract away panels
Date: Tue, 20 Jul 2021 15:45:17 +0200
Message-Id: <20210720134525.563936-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720134525.563936-1-maxime@cerno.tech>
References: <20210720134525.563936-1-maxime@cerno.tech>
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
 drivers/gpu/drm/drm_bridge.c | 62 +++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/drm_of.c     |  3 ++
 include/drm/drm_bridge.h     |  2 ++
 3 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 044acd07c153..aef8c9f4fb9f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -24,10 +24,12 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_graph.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_panel.h>
 
 #include "drm_crtc_internal.h"
 
@@ -50,10 +52,8 @@
  *
  * Display drivers are responsible for linking encoders with the first bridge
  * in the chains. This is done by acquiring the appropriate bridge with
- * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
- * panel with drm_panel_bridge_add_typed() (or the managed version
- * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall be
- * attached to the encoder with a call to drm_bridge_attach().
+ * drm_of_get_next(). Once acquired, the bridge shall be attached to the
+ * encoder with a call to drm_bridge_attach().
  *
  * Bridges are responsible for linking themselves with the next bridge in the
  * chain, if any. This is done the same way as for encoders, with the call to
@@ -1223,6 +1223,60 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 	return NULL;
 }
 EXPORT_SYMBOL(of_drm_find_bridge);
+
+/**
+ * devm_drm_of_get_next - Return next bridge in the chain
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
+struct drm_bridge *devm_drm_of_get_next(struct device *dev,
+					struct device_node *np,
+					unsigned int port,
+					unsigned int endpoint)
+{
+	struct device_node *remote;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return ERR_PTR(-ENODEV);
+
+	remote = of_graph_get_remote_node(np, port, endpoint);
+	if (!remote)
+		return ERR_PTR(-ENODEV);
+
+	bridge = of_drm_find_bridge(remote);
+	if (bridge) {
+		of_node_put(remote);
+		return bridge;
+	}
+
+	panel = of_drm_find_panel(remote);
+	if (IS_ERR(panel)) {
+		of_node_put(remote);
+		return ERR_CAST(panel);
+	}
+
+	of_node_put(remote);
+
+	return devm_drm_panel_bridge_add(dev, panel);
+}
+EXPORT_SYMBOL(devm_drm_of_get_next);
 #endif
 
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 997b8827fed2..bbbdc4d17ac9 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -231,6 +231,9 @@ EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
  * return either the associated struct drm_panel or drm_bridge device. Either
  * @panel or @bridge must not be NULL.
  *
+ * This function is deprecated and should not be used in new drivers. Use
+ * drm_of_get_next() instead.
+ *
  * Returns zero if successful, or one of the standard error codes if it fails.
  */
 int drm_of_find_panel_or_bridge(const struct device_node *np,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 46bdfa48c413..e16fafc6f37d 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -911,6 +911,8 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
 						   u32 connector_type);
+struct drm_bridge *devm_drm_of_get_next(struct device *dev, struct device_node *node,
+					unsigned int port, unsigned int endpoint);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
 #endif
 
-- 
2.31.1

