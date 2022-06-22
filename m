Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB53554D20
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2130112480;
	Wed, 22 Jun 2022 14:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8B01125AE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AE31E3200942;
 Wed, 22 Jun 2022 10:32:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 10:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908364; x=1655994764; bh=ME
 UDePc5mFhOAGSc6D/NRuVeJqxVUq1GK/V5Anwi4sY=; b=udmvridsxMRn/xn6Jb
 +uRhyfRWQBnAoql4XUqG0a9fiKKjziSFLQEV8y3hnWT440RX8laOUm+KrFO+LMDi
 HCIA/tJaryQQgayJ4FNhhcBpV7+EtQbVbTM4p7Qvj04MgTAmaRvrXl4ePtlc16sU
 JfMqCOM1Qs/pxdcnxPBoGNpex6zTaUpk0YEb0IXXncVoFurjObSGwEAyV+Uprj/L
 DbwQ1oy6/dQH6VD9SP6N/RByCQN/xCF+4IgtQuOHh7T2jcDr35WLHVmWqsHCtMHr
 xMOTKoCB1Gtf7NItQEQ6YKeUMUKNmgvO/RD9F0lAkQaXDrMVQUxreaDbL1YmUujw
 HUvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908364; x=1655994764; bh=MEUDePc5mFhOA
 GSc6D/NRuVeJqxVUq1GK/V5Anwi4sY=; b=Y2SkxHG4kKZXkqfqHKCmWYqceTcar
 Xvs7xd3n4dn+L+cAlaCAJGAiGVFWG75PutrcPnw+jEf0pAwAzACCzxQ8AJ6x6/LA
 WPNukhKw16fySba4UOdcVDL78n1P1546szIvJ48OJ/pmvCf8M6pwLnFbFzoo331N
 yx6Pv9hR06EkINBFz7mN1d5r3WizV2s3y8R1C/Pj6p3dtZlnG00UCbS4wf/hxYja
 d6vIhZ+K7O0XKio2lxkb9U66rIW7m2VnfkpDTcCPECzdn4zCR7jacb1aHlR43W3/
 XXhO33fu/1XHGhejjJpFCo6XNxOfj4bZz+11EvtgJD5ghO00XIkzhb1yA==
X-ME-Sender: <xms:DCizYsLrRQoLD9ymTiaJFrKxWfgwYK-lc-68wtrkBj1pL4kI7LZw-Q>
 <xme:DCizYsLJYwzxF_5QtI_rRuCceRIUp6VSV8BM_I1861X1hnXkFi67dAgCjecgHBNra
 JHyb2R50wUIkSTd2CQ>
X-ME-Received: <xmr:DCizYsuL-R8iNekHpLW-1WbH4Eo8x0r80W89VEmnCVev1HBIB2E5dPFuWL06JaztyoSTCBLduY1rMqchAsyvBNiD6LiLrUtPxrn2bHc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DCizYpZT4P5snVyj2gc3Buj1ZoWMKopqhCD1J9p-3qbDeqt8_CCCLg>
 <xmx:DCizYjYfKG8673pQ5DhPhUlXTZ0iEYKUMp4c6QLlqOHKIaXLW-BO_w>
 <xmx:DCizYlBqznrBbfo_UjExo9ROQJK0dt_uYa2cSl7B_n25jbulZMuhOw>
 <xmx:DCizYiUhw7QBoZuQRkbuSiOBmCjWQ3ljeLgPMh3GjXLUfxY_PJzc0g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 09/68] drm/bridge: panel: Introduce drmm_panel_bridge_add
Date: Wed, 22 Jun 2022 16:31:10 +0200
Message-Id: <20220622143209.600298-10-maxime@cerno.tech>
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

Unlike what can be found for other entities, there's no DRM-managed
function to create a panel_bridge instance from a panel.

Let's introduce one.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/panel.c | 39 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 0ee563eb2b6f..07d720aa38c6 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -8,6 +8,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -333,6 +334,44 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 }
 EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
 
+static void drmm_drm_panel_bridge_release(struct drm_device *drm, void *ptr)
+{
+	struct drm_bridge *bridge = ptr;
+
+	drm_panel_bridge_remove(bridge);
+}
+
+/**
+ * drmm_panel_bridge_add - Creates a DRM-managed &drm_bridge and
+ *                         &drm_connector that just calls the
+ *                         appropriate functions from &drm_panel.
+ *
+ * @dev: DRM device to tie the bridge lifetime to
+ * @panel: The drm_panel being wrapped.  Must be non-NULL.
+ *
+ * This is the DRM-managed version of drm_panel_bridge_add() which
+ * automatically calls drm_panel_bridge_remove() when @dev is cleaned
+ * up.
+ */
+struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
+					 struct drm_panel *panel)
+{
+	struct drm_bridge *bridge;
+	int ret;
+
+	bridge = drm_panel_bridge_add_typed(panel, panel->connector_type);
+	if (IS_ERR(bridge))
+		return bridge;
+
+	ret = drmm_add_action_or_reset(drm, drmm_drm_panel_bridge_release,
+				       bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return bridge;
+}
+EXPORT_SYMBOL(drmm_panel_bridge_add);
+
 /**
  * drm_panel_bridge_connector - return the connector for the panel bridge
  * @bridge: The drm_bridge.
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 42aec8612f37..8100a15dd9c2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -927,6 +927,8 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
 						   u32 connector_type);
+struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
+					     struct drm_panel *panel);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
 #endif
 
-- 
2.36.1

