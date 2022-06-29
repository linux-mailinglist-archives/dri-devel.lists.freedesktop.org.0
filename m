Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77355FFEF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407E312BC83;
	Wed, 29 Jun 2022 12:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA3512BC83
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 09DA25C04C4;
 Wed, 29 Jun 2022 08:35:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506146; x=1656592546; bh=hW
 QVOu8iVNrg9wcR/QoNI87zA1lr16Dki0RT5PQ7dek=; b=fBom2q/yFn5cRY2auE
 SRSF+4vTGPpk+uvkTptdiDHLUpmWeW5ugzHVHMV27Ho02ajXQ3jn3QSwCtsxCr74
 g5DIJrv2+PvH6aO0/V4tkgoUYQHbmoM6FZi14M/jo/QLiEmOYnsvIclrNspr/dpx
 507qL9YY8ueGHVANvv0GAETx6LgBGEsrlCMR8bQyZfhhrlDL5X5F1F3Qx8zzjYJi
 JVEhP/VUKk9RBuqw3BBeh4sL/w/VKumVLWEVHKec93PyfC8kohLDlW5NKrdaVTyU
 his69CBllrxh56z1MUWtd3xnkZO+VG7RcPBXT66gDQHQTJlaNSn9+EaUKUaxGiJL
 dIDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506146; x=1656592546; bh=hWQVOu8iVNrg9
 wcR/QoNI87zA1lr16Dki0RT5PQ7dek=; b=iWM8nqDnfwCMhPSFgc/2uQwZvUROd
 UccSr3SM/X5aXt4/pUL+PPhtc/v9hBA9a1t6DMucs6+XMKkQwug+lXRO8OEOfn/+
 zvSPD0f8vl6jefHd9UBOzEq5GLFqgwtv3UVZ+RNyHR8PWvMk3Wowsm4mh68MUqGC
 6dflaCCH/fWAGsyIibrXe1qF1WP7dNxaUDvUNYTyovDCw9sp06Z/+l+giiMt0HCp
 RyOxnTYqg9s5kmXCEXJE8IiKSKp6r8YKyX9eYR7Z3YX0tj31cSmQtjn6Q5D0m0gW
 wxuMofw7KHR5L/eq4LL/r2IoJxHw0uc6hZA7tHTm+rYrJMi51iXvuwYpg==
X-ME-Sender: <xms:IEe8YkhZAN5UZtaacZFY9a-NKF-kXMx0L_aZj4nj81E0VhLFeYwDsQ>
 <xme:IEe8YtDPstxYwga0Ipl9mXJxMWBy9mX8ekZGrWBRNzTTbZOBL6EetUDqA-e_CF-kF
 cInFlQOWDtmaElixYY>
X-ME-Received: <xmr:IEe8YsGz94nK-Hmbx-Qt3pwZWg4AQntH7aAOEuvxCyhzv6sICYof7TBI1ON-gT2qwCKlKvzyaEDd8sQ5joP1XjkKm88F33U_RGQx4WY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IEe8YlRbxqIdx_VDI_Z4xyE6A5TPC6Z3QhjZvu4jKrKZMtq4ZykuVA>
 <xmx:IEe8YhwfNsrWoZHphTH3UKj-FOsf-fIo-BEPrxEbzHsIIQ5G1wWoWQ>
 <xmx:IEe8Yj4DtS8Y6A1YsjtHhSOHk6NeA6VVuGCI-ajKEHjKPY6HT6F3gw>
 <xmx:Ike8YkosI6YSOnMDwgQxvgkdwvZeNF4xcI5Xr_AQgR_JS4Xth86tvg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 10/71] drm/bridge: panel: Introduce drmm_panel_bridge_add
Date: Wed, 29 Jun 2022 14:34:09 +0200
Message-Id: <20220629123510.1915022-11-maxime@cerno.tech>
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

Unlike what can be found for other entities, there's no DRM-managed
function to create a panel_bridge instance from a panel.

Let's introduce one.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
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

