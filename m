Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51FD56B616
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7249C113807;
	Fri,  8 Jul 2022 09:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED8E113824
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B25AF3200980;
 Fri,  8 Jul 2022 05:57:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274263; x=1657360663; bh=ro
 ZqS6lKNcRr5RULcFI+wUM0+3zQSu8ZtGdXNMP/znw=; b=oNOKcw82pa+bZgzVXP
 0gX+IosAuoNeeuitXcR8kP1/c8VjS5XGEaWazwCJ/6pD6uT5u34oIzAQ7FsI7K16
 y3/qk2B/v5vk6xSTR5LoROrRU51A0fkXgeDTWDGqIijPjz8ECDWoXvEgnLdXlhcy
 HMhv+CxwEYpGOQ/3POn0jUV+0N++XTxa2/VWp54a6mESdNm3hE/5bEqJBWY5PgKX
 s5sLkewgNRwVqdolXnvLyhlgUvKcwGVk/zoMAOahug/rP0z0dTnQcp/9gXxhPCU7
 JoSBE7LN/MFzltYXj1mdv//U6oZ7AZqFoMEFUcJ6JPqAcCQVVsXhjsKo9cPRyRwx
 I7Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274263; x=1657360663; bh=roZqS6lKNcRr5
 RULcFI+wUM0+3zQSu8ZtGdXNMP/znw=; b=hAufJmf7qw6IVNQ5yi8exHGT+5u++
 69ZAwPKuDRGBizjtVww7KsCf+nVSKuhx/XI0IpS+00Kbm+6nD0n6EcwW9dSAVU3y
 M44ERw8bwngDByKWFG2NtkJgB0UwzEu8z0va9OJZ/NTmvdXpbR3pUGRkyaYRKKSr
 AGCuxsThxScU1yp0RyZVR54sHbr4qZzqv6bMWCvK8EPrT0WJLqd24SYJpYGVFB5X
 YkvWgBjWD7gOpadpve5fWSp+blK+8H75ZZzccXS5TehJ6ID5ReD5VfiaTWYuLYCR
 DImPUh4DLr8kOqvqx5A51EenG/I1aBCYgbyVeEWi7s5ajVTI/Yj//qTJg==
X-ME-Sender: <xms:l__HYqJMZzSLvVzj8zs8D2X4HkxSVQAOJGcF9pczb8eh4CuYLhoe0g>
 <xme:l__HYiJJI4gqFiay5IvbB_oE152Oqr-gxXa7gEqMwaOSSCkK3J5pmvKnGPoO1bT1E
 2p2aXYpfQntUC_58ng>
X-ME-Received: <xmr:l__HYqsHc4kOCLMAedMMsqK2XWzuzxohb8UY0WD_pWDUYJkOA7K5iPaySiStwwpJoZyVCqEH8FXL9OeTiSKmNZSMI_8N07GuPRCvVE0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:l__HYvZRZX-s71CUSWNg43ykMuYd--fC32xkrrsilbuGGEgrHkvD2w>
 <xmx:l__HYhau0mSUge2gy2RiNADBAStNFYsHluGUoq6ynt6BaA8Kz6uGJg>
 <xmx:l__HYrB_SkePV3ezXSq1qh1gN9OFP6glpvMGpUZxvKNg3-HF4bk7uQ>
 <xmx:l__HYkwBZGyuOvNhqalwpucvu7GWahiiCES_wy-rXsnIbVUgb4dMlA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 11/69] drm/bridge: panel: Introduce drmm_of_get_bridge
Date: Fri,  8 Jul 2022 11:56:09 +0200
Message-Id: <20220708095707.257937-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
index 56ac51b257b9..ec5304e9fb17 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -459,4 +459,39 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	return bridge;
 }
 EXPORT_SYMBOL(devm_drm_of_get_bridge);
+
+/**
+ * drmm_of_get_bridge - Return next bridge in the chain
+ * @dev: device to tie the bridge lifetime to
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

