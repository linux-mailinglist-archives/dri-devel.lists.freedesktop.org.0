Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA62554D21
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F56D1125AE;
	Wed, 22 Jun 2022 14:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18EE1125AE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:48 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A4F983200942;
 Wed, 22 Jun 2022 10:32:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908367; x=1655994767; bh=KA
 ZPd6m+Avy8ONd+AxBEcQuBxV6COH+fIHp80L8Be5w=; b=IdT4Fb8SW5eY5wqpS9
 J6HYtj+ZgKKC5vz6JzRpNELPnTR+PE/uPQiM1Vbgkz9L4Jt7jUqvq+DTdH6I75Cq
 Z2NO2ih9uMzNboOSXdD1vCY+4rw7YtOf4Cg/0SsFOUWrKU0PyYgcvgVBNp1s0y8u
 gj3d7CNo0L3Mz/RyKg9+zZoWBhC/TGquFQI/GEATrZA0UapxHa3OxVdm/IUh29zB
 fl62TPpX+A21Hr7MXs4DJAvB2dbyqK2FMd6QL7Skb96SE23zynNiN+Y4TPMs240J
 tkfrL2mHrOl8VjfSI/3m+E2s68gfBo+ZJ9xcIjb4AcHOwpeYz/ItXnuCSXNO/dLj
 60HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908367; x=1655994767; bh=KAZPd6m+Avy8O
 Nd+AxBEcQuBxV6COH+fIHp80L8Be5w=; b=gokOcI0OQJcIUidMRQbmXxii3wY79
 hSXT233MbG8joElZhsmbwXx/pHYxQzcdjlhCZvzpLCRudUy0VUJSIcEPYSk7FVQS
 hfZmE3fOsJdMNlD6ZhlyCwoy77XPUwFCOp85hchb2DYSYYSAqbRUoyXAbHFj9aVJ
 bmQ4I8NIyWKaOP9VOB7NnsMkxU11hIvtE5V7NvdgNhhU/MxY83VWShoJBIye06UA
 M3tpxs1SwllKMQDb8nhknM9rDGr8sKjIHRKKNHpbkGs5BsypnG+StF6D74dFYbxV
 pP8n8NFuV64BEe3H2qhtrm3xfmka9+tf6IzeQJhZB//KSe5X1iAH3YTqg==
X-ME-Sender: <xms:DyizYozm9ibxscYWPSOqxdxybKaQ6AyUCXojbfW0P2FNvBeU0catKQ>
 <xme:DyizYsQNSKN2zpwtXP2y8d3a_FcRcRHI-HG-NbsZiSNFr2KXpvdQDEK_5UHZhb8DW
 zI7HunT7Nqv2Up89Qg>
X-ME-Received: <xmr:DyizYqVMHOJ5Uhfxw3kuWIr0in190pSPzDlMFRTRpCIFBWJjoMfghEDq_xjkAdYUMX0s2rsrOpB0UzCwjj-5BFm0mhIIWDj-mbzVbOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DyizYmhM6LWCbdP2rSWK2TW1NqT0C3OHwHnc-aFQ8-au7SdYouC9QQ>
 <xmx:DyizYqC8sQQY2wZ7iiNlFp57eo7FtDzLRTqJduXLPfRO1wO1DJtdog>
 <xmx:DyizYnKsi9OY7Kcf9LrB0VfYxebyIxmoSR59ujtkn99Nhi14vPApMw>
 <xmx:DyizYt8qy_k8fLkLAxP0M17NrgFAONkLwrCS8AVlsASld2GHRspf7w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 10/68] drm/bridge: panel: Introduce drmm_of_get_bridge
Date: Wed, 22 Jun 2022 16:31:11 +0200
Message-Id: <20220622143209.600298-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike what can be found for other DRM entities, we don't have a
DRM-managed function equivalent to devm_drm_of_get_bridge().

Let's create it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/panel.c | 35 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 07d720aa38c6..0bf824ca1f25 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -425,4 +425,39 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
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
+ * Returns a pointer to the bridge if successful, or an error pointer
+ * otherwise.
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
index 8100a15dd9c2..ddb92e745b2e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -935,6 +935,8 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
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

