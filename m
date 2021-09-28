Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A50FD41B5BD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 20:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AC26E919;
	Tue, 28 Sep 2021 18:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB90B6E919
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 18:13:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4739C5C019C;
 Tue, 28 Sep 2021 14:13:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Sep 2021 14:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=0RIfRRdXa51PobHGtSolMaynj1
 9QFI5zHJxv9k/EYT8=; b=GT20gwYquxyw2XESro48HwrJc9ZISYqNr4gWUiUYs/
 DM3JGGnlhmf9cBEdoWhMw+TAxC/UzNeurfrpJdlxKVRQxrYM4IcN36QT9RJJydtd
 aooNC2nyp19T5X2z+/XEh6AnxKLbzeu7P+9nMCo3dm07mHRtRnHfmccUiOm9iXuN
 DjVi/52ki9R+1Rmk7Pq7yBEB2v1EARljwDDHTCng92t+xnVl/0pIIgJDp8AJfEVL
 r4pjA3hil5o7vOMO9X6NUDjJX/z9z0l3BlszXe/p4HNjWh5To8HsIsDcKeNclu1n
 v5ZGaQ6Y+CJbnrrAYlxWfPt9Ul3umQbDagRCItlsqqvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0RIfRRdXa51PobHGt
 SolMaynj19QFI5zHJxv9k/EYT8=; b=goweI+mbOUek+CVaD+kvkwZGxUqMlubOi
 nenidykqRMlMqTqAaGwQVhaWjsFPWXyCamYTzOlIa1/r4rZdj3B1pa7EQPTW5C35
 VmqsXxjygb6NlXh2lWyu6/0hYzHt4TPrQik5Fs5QRMAoHlKRks2BbPAmMsHng7Yh
 9fmHbSL5KRiFsQV+oGIMYH9wWumQshSGHCIykzX7OrOLFhc3EMicH50Lqo83WpBQ
 DrUBdEazVJQNyrw/qmWttSR3lRGyatDKU3N8EqkeNgZS1q2+wtpMVaWwyplRTrGG
 mbNLKFneL4YyLkhJeiO9j13AyENW1qzrxodRAtm06WIeOx4lvobag==
X-ME-Sender: <xms:UFtTYUrf3WGviJ-26aJqvLR_ljLQpMlcAjveTjkXZJaAHUrEqT9lZQ>
 <xme:UFtTYaqqQk5Zgeo5FWIOOaC1W3LDiA7MZrrz8eA9u3I7yqMB4ZgMUrp5Hc1PcA8Dr
 SwkmO0b-SZhqjc3UQQ>
X-ME-Received: <xmr:UFtTYZO-z-8fgc_5RSFy7jRKbgQqXZfVazwXYOzH_dwxl8ecXxiR2EQwaZ_A9tgaKvdz7WmfyJmTCwcUMSjNqfNOWv2GugREoacMsNVX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeej
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UFtTYb6iEy8HN1nxOKi0KQ0cOPpN-0GmhGZRWMGSzfP8OoMx2SELlQ>
 <xmx:UFtTYT7D_rY9ZYUXaTFjksVPyE6rkTnuuoMyO1M7DEWilaVckmD7kQ>
 <xmx:UFtTYbhx8Q_Qe1oxplM5yD56kcWxDd0Yzy1k8qoSsXg7CTNgoAO_ZQ>
 <xmx:UVtTYZT3Ixo0Y8RC1-7pNE81OvjYYtNVuR8q1ReRKLsViMzt1PZsdA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 14:13:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm/bridge: Add stubs for devm_drm_of_get_bridge when OF is
 disabled
Date: Tue, 28 Sep 2021 20:13:33 +0200
Message-Id: <20210928181333.1176840-1-maxime@cerno.tech>
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

If CONFIG_OF is disabled, devm_drm_of_get_bridge won't be compiled in
and drivers using that function will fail to build.

Add an inline stub so that we can still build-test those cases.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/drm/drm_bridge.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 9cdbd209388e..1648ce265cba 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -911,9 +911,20 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
 						   u32 connector_type);
+struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
+#endif
+
+#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
 struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
 					  u32 port, u32 endpoint);
-struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
+#else
+static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
+							struct device_node *node,
+							u32 port,
+							u32 endpoint)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif
-- 
2.31.1

