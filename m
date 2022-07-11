Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE7E570906
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E97902EF;
	Mon, 11 Jul 2022 17:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BE98FA7F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:01 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2DB585C014E;
 Mon, 11 Jul 2022 13:40:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561201; x=1657647601; bh=V7
 hw/JriNY0I7br+nBvRYvMhRiR4ktQAk9oO6B3S/0k=; b=mLZt+xudJJvOkFNEnr
 I6FY8pfZuH+LOUHIFEJf6p9iYLShkVUFIR/kFbd046KtZRiZfDFJ/HsaLRULdjqz
 l8OQsh6NFvvUOfPVSd5hZXpnmgJ+Ae3YvXZCVSp++HxzzAvxMzuNa5NGtm4tXLD5
 1zX/4qyuRBHRm5F7KffeoxG8Jeyml4DSKDJiWp4xjCrLm5cW+3IIWtXvOGLOSYtm
 DAgiae0HbX7cgyfM4IS/UEaiu0y2o5qox/TxDI/+i7m8EXn7kLkz3fFFfV999J7q
 PjEBSiuvBO5e6tTDbQqP7TkzPqLbJocERYkRq1bds+UM5ZPiefFe13rXTG92Btli
 TuuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561201; x=1657647601; bh=V7hw/JriNY0I7
 br+nBvRYvMhRiR4ktQAk9oO6B3S/0k=; b=SmVetVGBPRPi/QlhLRSK841ebNJUY
 F/L2QO80RGrTikBKK27KTPo+hiwD8wsQjTLZgwkxpLUAVGyyiFmd2rxCQUHWUD1s
 Mm1f/TKK1BQD66h7/RlLCrS/jSXNAAVOwTX1EwbYD3eUTv7nVHONnylg+76uNKCN
 m0RB8CuifVstIMn+JTIbweti6JFudauFsu24BXImCm4MyuR+XtQmazCPnnIPtM/2
 6tt1SJi+Bgr+/XE1wZGDCUJqopsO6DW+l6t6t4hGL1hnMch5X4rOAheoiBJrnQKO
 +lZNGKqzoBUlLjJjuh5O4Wg0xi+BbLVr+BI/6Alrkc1TlhXUqK+l4TtpA==
X-ME-Sender: <xms:cGDMYqAZZccNmYCzHQkDMOORznsStdeduitvhtoc_KuPpbpocWVwDg>
 <xme:cGDMYkjFh2KbWquzR58ae8QN1NDF2yT3VAP7OBLhfjtnmXOmqDCy3Sa2XJQaET-6h
 l1fpaB3BFogifx9X8w>
X-ME-Received: <xmr:cGDMYtkHzjSe60nBJEDmI6sm3sQm1JEN4VGS4L1CRzac_1iQH0jC-LOdGd_cZK9_WBbeDCrqy4V2JI-cUcl-FG78BadweGKdbfInr7E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cWDMYoy5tUXeSwzgoJif_SI7WD7tZvnhR4VehdqJyBNGuKCKYAz76w>
 <xmx:cWDMYvSMZ6RDOFwr4QTe5iwYGk0IaJ8uI2Jk5zSLSHWlH6xISKvKSA>
 <xmx:cWDMYjbYkBLnQ9oMy3M16g6wtCmD7aE74Oq70EkQeW_eN5goUMkdLQ>
 <xmx:cWDMYgK1wS4XDnNujTTpm_8RJs_dLrYR44N1xS0yLTSyqJAk5mPwCg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 10/69] drm/bridge: panel: Introduce drmm_panel_bridge_add
Date: Mon, 11 Jul 2022 19:38:40 +0200
Message-Id: <20220711173939.1132294-11-maxime@cerno.tech>
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
index 4277bf4f032b..7d34ebfe611d 100644
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
+ * @drm: DRM device to tie the bridge lifetime to
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

