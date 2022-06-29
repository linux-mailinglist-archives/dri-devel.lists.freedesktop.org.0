Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB155FFEE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081DC12B06E;
	Wed, 29 Jun 2022 12:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B9D12B06E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:43 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8934A320094C;
 Wed, 29 Jun 2022 08:35:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506142; x=1656592542; bh=wr
 gTqJpwlaP7uznypi/vkcGmk9+x0MYrib1PBScwCSo=; b=QVTHLkw9EKtMMCCJZF
 /PV8oq5TujUVpiZXe63KhS49IUH0R0YyMdJFIl2FQ/2IS7wZRkW/TSE2S5aWEu5Y
 zqyX7WAQ+qyWPm7X9Q4ar8A8B2w5av+UCuC3HD3bNy6nykUb+VgoGWACkZC6KwAL
 BLLjqUcE0GlGtla062OXoeOmvhUmDHKdCw7goNZbq9jLHnhYe8uKUQAk6ZTtNKi0
 4YiRifmpS8fnnxyLaYVKOnW2rjvAtiwg7cM+19VFCYOhoOefV9UpGiLIZw8YQfEj
 dde/bLGxn0gjpWkj2eLqw/nF2oswc4Y6a52zYPELU+egteFviFZvZMjth8h+Adfu
 ZNYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506142; x=1656592542; bh=wrgTqJpwlaP7u
 znypi/vkcGmk9+x0MYrib1PBScwCSo=; b=X91ViNhbHItl2OIKrr8Mpp4yhnRl7
 lra3XLo2GJDBwxHi8aIPPYb8tTa6GEA9LnlpBQI8+DTaZVLysk4hNOkPBqlIbCDU
 RPmXtXSOD5HbsvOgB+dlfhKwd4u8L9Jz7qWoos6x2ZoLyFw+ZXS6MBy8L1BLSiPg
 /1GYZYtIA5wva1WY18c5xEF5OkWmEZikPi0jRjIhpsFhltKZbmix3yZgkXay3j7L
 6f5ZBlK4/daoJHezO4X2KLEDxq97fFPhk5G/cH36dCZVnzP74ttjkj9tlJZJc2TC
 5YQMfDAvChXFSQCyJCFhu7RqND9WgSY/piFLu92MOjBKWb8vF6fM7a5lA==
X-ME-Sender: <xms:HUe8YtQvCgkRg0RqW3xR1KRTS9vDjANBD7cNC0DISaMK47d1hJbjZg>
 <xme:HUe8YmzxtDd0NuzC3cN5nUwu4VoFGqTN8jX6R_3oY_sX-47Vn9KOyl9Ks9gUh3jtm
 JvMD_cNE-XfCDFMmkY>
X-ME-Received: <xmr:HUe8Yi0r4nfNGflehEaMcWWAk1aWi7alVbSe9ykOtdmSZ_6xgz97vdi5M3wnNkCtTTYtEJik6mA5OER-bDGIdy9mkiZfFE_BXquTicI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HUe8YlA8dlZCTtJ_iIze695Az2qxNZqnAyoRMbJT7zVCK0CvMbQTDw>
 <xmx:HUe8YmhSi0A_G5E7Ai75gBV1UpzAaK-6cjnMcSBlkOhvtTeXf0FxWA>
 <xmx:HUe8YpoiIlDo3ll1gEgDsvBxerb8YIjKujjMJOccQSaB9CqpzYu1tA>
 <xmx:Hke8Yob8uUi_Ev0r6b3RMF9XNhAe2rB_N4v4SS0YZe4ihlsM2Bkf7w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 09/71] drm/connector: Introduce drmm_connector_init
Date: Wed, 29 Jun 2022 14:34:08 +0200
Message-Id: <20220629123510.1915022-10-maxime@cerno.tech>
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

Unlike other DRM entities, there's no helper to create a DRM-managed
initialisation of a connector.

Let's create an helper to initialise a connector that would be passed as an
argument, and handle the cleanup through a DRM-managed action.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 60 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  5 +++
 2 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 855267116e68..79bce5a3504b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -26,6 +26,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_consumer.h>
@@ -339,6 +340,10 @@ static int __drm_connector_init(struct drm_device *dev,
  * should call drm_connector_cleanup() and free the connector structure.
  * The connector structure should not be allocated with devm_kzalloc().
  *
+ * Note: consider using drmm_connector_init() instead of
+ * drm_connector_init() to let the DRM managed resource infrastructure
+ * take care of cleanup and deallocation.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -371,6 +376,10 @@ EXPORT_SYMBOL(drm_connector_init);
  *
  * Ensures that the ddc field of the connector is correctly set.
  *
+ * Note: consider using drmm_connector_init() instead of
+ * drm_connector_init_with_ddc() to let the DRM managed resource
+ * infrastructure take care of cleanup and deallocation.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -387,6 +396,57 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_connector_init_with_ddc);
 
+static void drm_connector_cleanup_action(struct drm_device *dev,
+					 void *ptr)
+{
+	struct drm_connector *connector = ptr;
+
+	drm_connector_cleanup(connector);
+}
+
+/**
+ * drmm_connector_init - Init a preallocated connector
+ * @dev: DRM device
+ * @connector: the connector to init
+ * @funcs: callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated connector. Connectors should be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_init(struct drm_device *dev,
+			struct drm_connector *connector,
+			const struct drm_connector_funcs *funcs,
+			int connector_type,
+			struct i2c_adapter *ddc)
+{
+	int ret;
+
+	if (WARN_ON(funcs && funcs->destroy))
+		return -EINVAL;
+
+	ret = __drm_connector_init(dev, connector, funcs, connector_type, NULL);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(dev, drm_connector_cleanup_action,
+				       connector);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drmm_connector_init);
+
 /**
  * drm_connector_attach_edid_property - attach edid property.
  * @connector: the connector
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 94b422b55cc1..7a999e901c7b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1673,6 +1673,11 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 				const struct drm_connector_funcs *funcs,
 				int connector_type,
 				struct i2c_adapter *ddc);
+int drmm_connector_init(struct drm_device *dev,
+			struct drm_connector *connector,
+			const struct drm_connector_funcs *funcs,
+			int connector_type,
+			struct i2c_adapter *ddc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
-- 
2.36.1

