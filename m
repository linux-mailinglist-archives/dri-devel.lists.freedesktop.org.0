Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F673546228
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F80611A270;
	Fri, 10 Jun 2022 09:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291BA113FC8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 816E85C01AF;
 Fri, 10 Jun 2022 05:29:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853386; x=1654939786; bh=ME
 UDePc5mFhOAGSc6D/NRuVeJqxVUq1GK/V5Anwi4sY=; b=CtYs27HQ6si2zYpQ/s
 LDGRtEHRSSevYxiDwTK/pxCSc6jO+ORE6Znhr3NSHcdblRqPrq+6X52BKJ43HW/t
 JXPJJnsqbbNGoFZz+kcGXk6i6fVMJItz8Rf97KaJL91LVJEmdDrv63lWpRjHE38p
 juMbUQhacgoMlDh4PDEJaBHvugR2N7W4qDg93L8R+TUry1gzDCLcGOwqWKlwH4zd
 jqjuZtApZxRC/nshti9zhbghZ3foFZ1EcRIfb+U29WhqtB6VdEVgyAd3qG7Vgt8g
 oe0qyoX0PuOrCuRCQMDyi9P8K5FNSjZ8gtFjDzuuP08LNH5zBR8QRqm7mnfuyslJ
 TZcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853386; x=1654939786; bh=MEUDePc5mFhOA
 GSc6D/NRuVeJqxVUq1GK/V5Anwi4sY=; b=PZmNrl7yw0fsl+4Pu8CTcsCDzg+p/
 cNh+3ZNJsM5EiD8m75DV514pZmtnty6Rv+KxIdYOJ8ZMBEz0lHoUnNYjdx6PbcHn
 Gv0dlrCrTEbfeujBGnqI55eIpLAQFbimYZ9rF9FxtKk+NAEWBcoKPPBY/0njmzau
 lH4+CqOTVs6XFeQ5rp2UFXSKUf9KlAz8qcqnhzrNUo7SMQ1/3ez5xIJHlUb6pW8H
 SLDvToyGO/dku8GpB2fEIEQLIlbFswodU//pvDQtDc6096tnI72qU4eW2EO3OTGi
 Yxe8brEXCyl7bMfavUIm0Vi+7v7J76oi801LVyrbfb29V1i0W6QRWJrKg==
X-ME-Sender: <xms:Cg-jYg6bJp6TztWblIIHLNnYjQhnTImbd5YGvyiFrwNvMf7s6UDD6w>
 <xme:Cg-jYh61nGJPNVcX1NifIdBVptYdstQ2RVXGElYxE--l5BSjs8kgBQuoOYvst4V3G
 07ss_RxPV0rcfY6490>
X-ME-Received: <xmr:Cg-jYvdperq3WHMN5KVFh34e-1tzH6qdxeEL0rJiAIyVZe-m8WVutFCKg-RY11V-AZK0pa-pOLRgw_gjfCCeNsbawYMV72iPAFZ8hCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Cg-jYlJ06ofG6O_itxs73jSeM9s7atk5pZBRDXcd97QKIP2RyPt84Q>
 <xmx:Cg-jYkL3MBfCbUQUsKzQOCg_lOYDnZGqhWJRGqY6CFZbkEMxmzNEvQ>
 <xmx:Cg-jYmwvvYsJJH8ZkiwKC7_czi8CH9bpo5Ydovo5bGr3gDdlWN531w>
 <xmx:Cg-jYpFnkTUx0MHASvABBeIRPl96lfAip5RWe8oxelDAbnVDxvrk-A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 10/64] drm/bridge: panel: Introduce drmm_panel_bridge_add
Date: Fri, 10 Jun 2022 11:28:30 +0200
Message-Id: <20220610092924.754942-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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

