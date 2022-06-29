Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7F55FFF1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F52514A073;
	Wed, 29 Jun 2022 12:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED1E14A3BE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 366FC3200959;
 Wed, 29 Jun 2022 08:35:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506147; x=1656592547; bh=/u
 kVOu1tFlLYdg1FTqTk4g7gURL/FR1tOSMq4q+FPD4=; b=WeUSL2kkonOCXTsRDl
 Lv/+3HlGLBIJMp1hXqD8ci3BLDtX8XVqOrHh7IHuhI3aL6VrDnlRqsj1K4ZtZ3kS
 VmShwdzk5+uGD0zMfFc1/XLBHQI5EQ6HaE+DjL/YhblHTFI+7fk8lcbI/OllIEeU
 U0K68mqs8BdR3w7+v5oJ5EUBA44kU50ViQFITUEgoLYr/PG8WIWkk/Uwu+hnhhXR
 X8jI1bgNk6EC7gmRhsgc3mDdNY52xV1uO/l9p0aFFAB3vx1IWDoWZqeOFlcfDQ+h
 9Bl6qOhIOT7Sk2G1zgAmKT86gQztismnedcvyGBG6JvUW7BFfaaLXCOEvG7t/uvr
 QnbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506147; x=1656592547; bh=/ukVOu1tFlLYd
 g1FTqTk4g7gURL/FR1tOSMq4q+FPD4=; b=qDBISMEcWKdMpgPuNvwoPeU2aDQbB
 e/0zqb5j8bLyCsJ+OVLG+9nygb9ZqbPHwGd9Ildw+htl7pm7Pgfz/f1l7eSK0qbJ
 gkYg4kwMM9t8rKegLAnwRjjcS7PHaiJX0b8XVIDjNXyZPJHlA9Xge6wFqMv8huCo
 E5s7r/n8Ix2M+wAEGxh24eo2iOAExMiyMczJrADw8eyYefpYp8J7VekTmHmhRCvI
 62sh/7TDPHliQPas2W9eAa5CjE3AkYkTLRtEN0i9pfejRmZ5Hd8GlNl6LBjTRCwA
 MIWUamm82IPrfXqseURVywsJXNaTBaNtgh4Ox4y2lx/EiqTxnC27LE08w==
X-ME-Sender: <xms:I0e8Yv_dWQc4-i2jHRjVdtGjilDP7tB9jLiZxigfQMPpJamyKCbksg>
 <xme:I0e8Yru7wO9nKZMDu7IfIlmeKGsHohF64xzQuNcg6xxpWiZVTVfMRCFgbhrF1WTTI
 9malMaCbYL4KNpqWjE>
X-ME-Received: <xmr:I0e8YtBIfm-i1InpOkSOTDLrjgJ5FD8Bgl7jMo1fxzDAE3pyCKfqbdL9_xLuBfB0Zc5ikH-eePxlhMIq0GNqscd8QPZZLAWn31acNsk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:I0e8YrdM07Jgo3D9ZVtWE6RxCF2reql-PUSGOVQl1IzLdRg47XauXg>
 <xmx:I0e8YkPY26H7RtxkbnitR0Mq_PT3LVmdMBZub09Md-GywX8VxtTroQ>
 <xmx:I0e8YtnikWf8vNhNql5_3mDlLlapfloLf-62EVuYou_TMkxGjsgpXA>
 <xmx:I0e8Yj3QZbI07inObBhujcMEZHPVuIKwW_Tc9bI9wyGxJVBRXcmoGQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 11/71] drm/bridge: panel: Introduce drmm_of_get_bridge
Date: Wed, 29 Jun 2022 14:34:10 +0200
Message-Id: <20220629123510.1915022-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

