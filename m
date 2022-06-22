Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0672D554D1E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20C91123CE;
	Wed, 22 Jun 2022 14:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E011123CE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A89C4320095B;
 Wed, 22 Jun 2022 10:32:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908358; x=1655994758; bh=JZ
 4W0YFAYNO2xDTh0+7INXbf3UdevhuzFXR8RNla0RU=; b=ZJq+Y6rHZ8UwfN2XrF
 XPoQj2JTiZEZJw1WNfx1p4H/UIc5kmrZfQ9dKdoNaFfB04qWyZC+fjv8KDRDP6vA
 obYxpv3T1iLE/XeM1RB596yiPe/rWF6phTzmbLKnRtQTs6YdSgHL/u0tUGsZU7MG
 Go4y1iaNo9cF+0eEdtlMH0HF4oIiQBSbzbGMEOKIP7HmULATm1nFbNxonnI4Cdv8
 NQFfHstwDy0dWOvO13sdjr9dr5EkhH91NvJJdyOlfC3RqPTlYvJ3MPrnP+/HsUBy
 AH57u4qO0CSRDlOtoEW6kGkgeLrNwPT9z9ASICYui1gMnN8zgJnbxFtz3WYOFb6I
 wvWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908358; x=1655994758; bh=JZ4W0YFAYNO2x
 DTh0+7INXbf3UdevhuzFXR8RNla0RU=; b=LyVmi58oueqVXdYo/yL0TyV0Z7i+i
 jhkvSVNSLCawfML6ogdWm0JYtpsFheUnMRDax3sKfCAb248bxNhHmZPw9+seSmav
 urGVLDXNNcLQP52kFPeaUxas3xvWmsT5Wz/MBCq8E839NTb0NWDukN7IGKEF4zes
 lr1r59pRm8DXfMddtQpqjkz5L9Rv6FwriKXMIt5LU+S3BtRsEnWz9A+mghqlc7JL
 tO9QRbE2xt7HjzM4YSgjnJQTy3HIb+KZ3PqHEitjZhXG4ognVpbBUdkhKDOSUt7G
 Ym2CwKKQHdOKYYE09li8Rco1Jnhkeea08k/r0GpRIj6rBNpeSGqdbgxvQ==
X-ME-Sender: <xms:BSizYoURgzWSBeFJxKx98muuOQ_bGpIS2XcolxWLVuXFdC9dMMZBTA>
 <xme:BSizYskPHk8FL53o93QiHAORxo5d0ePf7i9r3yerN3oZAafZaJmJibTPSbUiCR2se
 VT3R1VZ_xyNEPJeFvU>
X-ME-Received: <xmr:BSizYsamp4TM5694O5Mb9EPb_42i-lXzMfXcLpmgIVy_-IkSBYj8eRIQaFi_liV6O9aFJ-Q-lD6cE5RO4IIAdzLNm6uvuBwm9xAqeiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BSizYnVSo9Js9c-Hw5a2wv4htvubCEkbp21lxqowkWvaZrJvlx5Ekg>
 <xmx:BSizYin-viH0F83sILBX9aMlICksg5lvxvky_WtIQGhEeY7YtZP4qg>
 <xmx:BSizYsepXVM9IU5-H1vs9jnH-Xqqio2WpXrMt6xmziug9fUyLwlusA>
 <xmx:BiizYjA76j7VVSDwKk5afMcDjdscd6IQHnmQSiEtDJxahN4ivfiPhQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 07/68] drm/connector: Introduce drmm_connector_init
Date: Wed, 22 Jun 2022 16:31:08 +0200
Message-Id: <20220622143209.600298-8-maxime@cerno.tech>
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

Unlike other DRM entities, there's no helper to create a DRM-managed
initialisation of a connector.

Let's create an helper to initialise a connector that would be passed as an
argument, and handle the cleanup through a DRM-managed action.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 108 +++++++++++++++++++++++++-------
 include/drm/drm_connector.h     |   4 ++
 2 files changed, 91 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b9f22cc4ee67..0fec2d87178f 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -26,6 +26,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_sysfs.h>
@@ -212,27 +213,10 @@ void drm_connector_free_work_fn(struct work_struct *work)
 	}
 }
 
-/**
- * drm_connector_init - Init a preallocated connector
- * @dev: DRM device
- * @connector: the connector to init
- * @funcs: callbacks for this connector
- * @connector_type: user visible type of the connector
- *
- * Initialises a preallocated connector. Connectors should be
- * subclassed as part of driver connector objects.
- *
- * At driver unload time the driver's &drm_connector_funcs.destroy hook
- * should call drm_connector_cleanup() and free the connector structure.
- * The connector structure should not be allocated with devm_kzalloc().
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drm_connector_init(struct drm_device *dev,
-		       struct drm_connector *connector,
-		       const struct drm_connector_funcs *funcs,
-		       int connector_type)
+static int __drm_connector_init(struct drm_device *dev,
+				struct drm_connector *connector,
+				const struct drm_connector_funcs *funcs,
+				int connector_type)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	int ret;
@@ -336,6 +320,38 @@ int drm_connector_init(struct drm_device *dev,
 
 	return ret;
 }
+
+/**
+ * drm_connector_init - Init a preallocated connector
+ * @dev: DRM device
+ * @connector: the connector to init
+ * @funcs: callbacks for this connector
+ * @connector_type: user visible type of the connector
+ *
+ * Initialises a preallocated connector. Connectors should be
+ * subclassed as part of driver connector objects.
+ *
+ * At driver unload time the driver's &drm_connector_funcs.destroy hook
+ * should call drm_connector_cleanup() and free the connector structure.
+ * The connector structure should not be allocated with devm_kzalloc().
+ *
+ * Note: consider using drmm_connector_init() instead of
+ * drm_connector_init() to let the DRM managed resource infrastructure
+ * take care of cleanup and deallocation.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_init(struct drm_device *dev,
+		       struct drm_connector *connector,
+		       const struct drm_connector_funcs *funcs,
+		       int connector_type)
+{
+	if (WARN_ON(!(funcs && funcs->destroy)))
+		return -EINVAL;
+
+	return __drm_connector_init(dev, connector, funcs, connector_type);
+}
 EXPORT_SYMBOL(drm_connector_init);
 
 /**
@@ -377,6 +393,56 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
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
+ *
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
+			int connector_type)
+{
+	int ret;
+
+	if (WARN_ON(funcs && funcs->destroy))
+		return -EINVAL;
+
+	ret = __drm_connector_init(dev, connector, funcs, connector_type);
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
index 3ac4bf87f257..35a6b6e944b7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1672,6 +1672,10 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 				const struct drm_connector_funcs *funcs,
 				int connector_type,
 				struct i2c_adapter *ddc);
+int drmm_connector_init(struct drm_device *dev,
+			struct drm_connector *connector,
+			const struct drm_connector_funcs *funcs,
+			int connector_type);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
-- 
2.36.1

