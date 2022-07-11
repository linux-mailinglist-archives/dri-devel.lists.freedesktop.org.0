Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C0570908
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22705902F7;
	Mon, 11 Jul 2022 17:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205B18FF59
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7EB265C015E;
 Mon, 11 Jul 2022 13:39:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561199; x=1657647599; bh=ua
 S0XZsCG3qedAVjXruTJjURV7bIyOdbyhb8SqormTY=; b=EWhC8B/kscEvH+OJrt
 JfSkfiSWmcbCbRMvBsjYxqOI3e0w0srZFXTxV2g2fsjxVEYYUGShJ0/tKMTmZVem
 GttujvA8aUP/edKVeJNMaAY02LUDBwrRlri5BJ/kpKezV6KxCME3laALpjtHaRHF
 FDj0dWKB6JbHD9sFbl3MJ+RWHJJfrVHNPv5E+7e1q/dRaXGz5mYwJRaBlqNoNBy4
 mIa9wRQb/54uAv7mSo5xWTYxGA5HujLTFYh+eCUHtN0jCQnUHPq5IYhA+RSQNm4m
 tzQYCXhytKuyROH4pFR8aH3LW1UNHhrBggMgqZgE3L0TiF7OTwg8r6tKochsfx/i
 tIyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561199; x=1657647599; bh=uaS0XZsCG3qed
 AVjXruTJjURV7bIyOdbyhb8SqormTY=; b=tW7O+znjSdPrSEhZHWM6rytm3uUGn
 PKFrOXNAfRWCxF5Qc0KblIP96/OUMBcbVb/98i27Gb33LpvLGRd+VKj1mjS1sBmz
 w3PRbbOrry9YRrSullHq1naazJOU3C66+BSuP4NGvmiL1GUJif9oO1axpnNkxTfG
 jizjiBh4Ddi/7zBx7XH5c7jcR9SL0jqOcTBH9s2NJDJBpk++HNJwBc3iXn74UiAG
 kEJdN9K2bJ1xq7x2I60i36hh4rxyRQbE3/RvbyhLOUdY/T0ZA/QxwPfkJ+kImi6c
 tQYTDArr55NioGu0MJNc0075Wx8ERm3XJQmD+n0of8aA7Y1PVJXj5qZUA==
X-ME-Sender: <xms:b2DMYpG_Z391a58CS_5k2Vjs6Qos5lwhmf5zvxNzieF9l4ct61oMEQ>
 <xme:b2DMYuXy6hSk68KoDvlT57e6VAqX5UvgqPPJ8zrSsbhDnslvtvOydIrkFVMqRMK8Y
 mGj80UpvfxML3P-OgQ>
X-ME-Received: <xmr:b2DMYrKBv3bDnev_JJsSjAhEqS69Ww7EgeW2LYNGeF41kFEaXT5QQwelSREheBq9VqRY5Z0e742yXwdWbiM8HOeNPyVlO3CAENjaSGc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:b2DMYvGQC8-lHgOQBMfhUQsiqqZ0OBePWkFf6fE0BWhuc-OyO3WT2A>
 <xmx:b2DMYvUAlWReoD7bqOKv6dklolDIOoqdU5mIWO808LmbQLKirjjyFQ>
 <xmx:b2DMYqMiEIsJzCRlatB1wkb2i9g9DpRIhlbazXJ0TlcVNhJFmG0naQ>
 <xmx:b2DMYlf_SW1Z_ylJ3TR6807IWX8HtoNeje7XrO_X6Z4894zKvCyvZQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:39:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 09/69] drm/connector: Introduce drmm_connector_init
Date: Mon, 11 Jul 2022 19:38:39 +0200
Message-Id: <20220711173939.1132294-10-maxime@cerno.tech>
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
index dfd170273f5c..e3142c8142b3 100644
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
@@ -340,6 +341,10 @@ static int __drm_connector_init(struct drm_device *dev,
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
@@ -372,6 +377,10 @@ EXPORT_SYMBOL(drm_connector_init);
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
@@ -388,6 +397,57 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
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
+	if (drm_WARN_ON(dev, funcs && funcs->destroy))
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
index a1705d6b3fba..2c6fa746efac 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1677,6 +1677,11 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
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

