Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F8B56B614
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30849113814;
	Fri,  8 Jul 2022 09:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1541F11380E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C9A373200980;
 Fri,  8 Jul 2022 05:57:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274260; x=1657360660; bh=nJ
 cVBIUxCVVRz8HJfK2MQu7YEnMkTiNyG0OD9u5nbT8=; b=gIHLWjSSOLdtGAG7DB
 vKB/IIrCARJvQWzSZo5AxV6wg40R1CrpFpoS2cuvPcUakXSewyiszHADMNbclSzz
 UmIlQn514Bge2Q20j4RftqJR6BTM3DkIbuxOVZfjaWK9fyk9CM3nIBzL3XeZw34g
 lEdoaYa2RF9qRE0JIx4cR85kkvlj+K2QZgIjOk2JrID2Q+t0N+v/PL0ehp+LM43I
 LWwTnngRPwRkUz8ZUhtc9YPYdv+qTenArsFevESSt829QhJyaj0gPIHiyjkNTq4F
 AVU/9sPqKDYpieGGfD86eM6DClVwYMH1SLwrTOwj0iHNKyrqQFx+n6MYMXiHf1S7
 R/Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274260; x=1657360660; bh=nJcVBIUxCVVRz
 8HJfK2MQu7YEnMkTiNyG0OD9u5nbT8=; b=M16Sm7Zx3khhwWRo10ZueIKK0Lbkx
 Q1L5IPrpTsBKb+j1rrhvzcogluqHkfAeUz7/yYK4qMBJVDrVAHvvrfBA8x9HrXlp
 fMAlGMXt6CKHnqCEkkTORDNkXSA/AalSAC8YA7QZ9Wg2gpl5t2wsb2TmDxA+6QMI
 8rYVdh7znXiUNsNbxMrpNlE7HbQHxtGqh8H1eOsYb/yrOYtZ8JQDBI62Tm8n86qX
 AaF8ccJ4wz8D7peyBEXO2JUeFNgfYrV9hcti3vIR4cDQLm5cpG46hXhiD12VosVw
 hZ+TNfTuaH1C0Fgeh42wELB6+014lIXrV0gMEwcDufzgVgv6waLG3o04Q==
X-ME-Sender: <xms:k__HYgAA1aBnuU8XoTcKnP_Tmibpb1B5OrLGFXtfiuL6zEXrdjy91A>
 <xme:k__HYigcpyBujFOis_gENB0lHVQyYX44a9q8JU5TQ71cDg_-SMNod43YJNLoBhx2r
 549XbCmUk5E4NfsTU4>
X-ME-Received: <xmr:k__HYjlFs6bIp6uZQKPS5BB4GjLsmBjOy3spjpK2x1XFPw1IDaWwVZmfeB7s6bSAryClBlT6v7Sb3b2JqTR1x1CAqRlDJn9OHTf8ig8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k__HYmwb9Y30LtTjmPdHHDC60oM3ReMEW8YiMZZ15ijMi32_2GriIA>
 <xmx:k__HYlR509P3-YtA1oYRpzcr33f_fQk7Fz0zecfDsbxhYeSAjT_xPg>
 <xmx:k__HYha9YmILJyKVNEbGciTto6o5Ruy9hxnjOd3hMC06DXccRU7bUA>
 <xmx:lP_HYuJwaesZxGJsVtZF6G6erfOUvapZ9TCdBBgLAsSBkYz00y1Ijw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 10/69] drm/bridge: panel: Introduce drmm_panel_bridge_add
Date: Fri,  8 Jul 2022 11:56:08 +0200
Message-Id: <20220708095707.257937-11-maxime@cerno.tech>
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

Unlike what can be found for other entities, there's no DRM-managed
function to create a panel_bridge instance from a panel.

Let's introduce one.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/panel.c | 39 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 4277bf4f032b..56ac51b257b9 100644
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
@@ -367,6 +368,44 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
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
index d434ab416ad4..e37a419ac2b4 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -930,6 +930,8 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
 						   u32 connector_type);
+struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
+					     struct drm_panel *panel);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
 #else
 static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
-- 
2.36.1

