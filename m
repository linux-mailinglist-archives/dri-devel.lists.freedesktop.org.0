Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB557090D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35F3902FF;
	Mon, 11 Jul 2022 17:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79A490211
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A76125C014E;
 Mon, 11 Jul 2022 13:40:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561202; x=1657647602; bh=h4
 gz0dQSChoNNWzqswRjTsZRDeUTtJdxHcKX0F4p31A=; b=k1dH7/6QchGFBSFHn2
 eWY/MDYOCkskJ7MriAL1L9CKn6Rq7m8Tf9XNhlRKX9wRrJh8lpjGuuDQ8AmPA7GI
 QFCyypdQtEIluXH8hhHTLBVXBO4sU0RTlqDsIYrx00PuABswaKJitB3Rii0MhzVo
 By5m4XTxgMYxtIGEPTQr5iZs2NejHM1hTcyUJ6qC1gWcvdgtduqs3XF2RcN33UUB
 rLt+bGw3xjJAefuECqORGr6v5tWMf7M2Cc1CyFZeSlNu1sjk5cpYlEThy66UKib7
 /8TUWEqUlUx2Bb0XILUgG7WHWFxI4qkkJPDHHJDhA8H+Ftkv1Vn2ZuhSKxJdX7CO
 XuMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561202; x=1657647602; bh=h4gz0dQSChoNN
 WzqswRjTsZRDeUTtJdxHcKX0F4p31A=; b=Nd58V8Jg9HoheLhLlaUpI2wQHJJTD
 e/l0t8O2/BKPNmHJpuL31h72AY55ZmQeIdTqAtwnURXssjpXmc9bUkxq70OK/9Bl
 3Nh9SgWnhi+oLsdUQESHf4mIlwf59DgvaiRJyCBul5IrKyuI0v9ZLAFQ8JIqhTsA
 jnNPgsDbaenSYpzvnlxhDIndg3KEDw4LzV+B6fR4u4Wax1gfDRQTLPiZzMNa8cLm
 C0SvJ8JTy8P2wool6GKMshZZf15rQQ0Mt6TeD/rqXZ6Yv+EYv7oIDm7OyH6vIt9f
 4AUfTWmQK+c1R0U8LqyoYV7J/cEYBAMVUdsXada/Ej/lPUG7FEHMyLGuw==
X-ME-Sender: <xms:cmDMYmShIvQPi8yu2rRHFgElc6v6Id-uVB5CgXUs2c5zM2vaB22F_A>
 <xme:cmDMYryr5NdrDB4DlH17toTz002ll2_ZjdFivTrGFsFiAAO0EnqYB6xRAEnMBZaDs
 7c3XCxVRxYFSUaZnOg>
X-ME-Received: <xmr:cmDMYj1fWK89j1Mw0RMTVgk3wsDBX3G9HuoA58T6ugqxyZcPXgoYQQN6DIWDyhwcixNCC_yHErtTk5Es88rTzevxoSmUTCGuCx2swOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cmDMYiDHUAUS1h10FDd7HzkUVMSJIfecHboJkf31xRJbjwJWJYBV7A>
 <xmx:cmDMYvhMD2TFJWgJ2YK8brNBUqJeijlMjfqvlwWKK8Osy0sq2bSkjw>
 <xmx:cmDMYuoxMd--3TS1Vc-5GMTLy9OEjZ-GZWXVxpjngUQEmCm9MP9f2w>
 <xmx:cmDMYlaO1y5QNJ3O3i_qHGoSLOpjXIXQybPLIHSFhA4WkbcMDZsgqA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 11/69] drm/bridge: panel: Introduce drmm_of_get_bridge
Date: Mon, 11 Jul 2022 19:38:41 +0200
Message-Id: <20220711173939.1132294-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike what can be found for other DRM entities, we don't have a
DRM-managed function equivalent to devm_drm_of_get_bridge().

Let's create it.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/panel.c | 35 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 7d34ebfe611d..216af76d0042 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -459,4 +459,39 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	return bridge;
 }
 EXPORT_SYMBOL(devm_drm_of_get_bridge);
+
+/**
+ * drmm_of_get_bridge - Return next bridge in the chain
+ * @drm: device to tie the bridge lifetime to
+ * @np: device tree node containing encoder output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ *
+ * Given a DT node's port and endpoint number, finds the connected node
+ * and returns the associated bridge if any, or creates and returns a
+ * drm panel bridge instance if a panel is connected.
+ *
+ * Returns a drmm managed pointer to the bridge if successful, or an error
+ * pointer otherwise.
+ */
+struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
+				      struct device_node *np,
+				      u32 port, u32 endpoint)
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
+		bridge = drmm_panel_bridge_add(drm, panel);
+
+	return bridge;
+}
+EXPORT_SYMBOL(drmm_of_get_bridge);
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e37a419ac2b4..dba5d81e3b4a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -949,6 +949,8 @@ static inline int drm_panel_bridge_set_orientation(struct drm_connector *connect
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
 struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
 					  u32 port, u32 endpoint);
+struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
+					  u32 port, u32 endpoint);
 #else
 static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 							struct device_node *node,
-- 
2.36.1

