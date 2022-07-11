Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA457090A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536DD902FD;
	Mon, 11 Jul 2022 17:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF79C8FA7F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:39:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2CE9A5C014E;
 Mon, 11 Jul 2022 13:39:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 11 Jul 2022 13:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561196; x=1657647596; bh=U7
 NEw4fKfQpaS8Nm76b4qX03LMHV0YyZnleLjvOL6Nw=; b=gFvqA2HKtGCoK44Xb3
 tSQ+cz7gTh6ST4v5Tmp/RFu5nWY5M63FA9TU7HUQ/lk510Ku/6V6AvLZJBFdt9oI
 W/vbr4bsf1ad+3Dmzb2pdlp8iKNupfZK9k+WQTDeaj3wIqEnN5LK4FXncbaCUzpL
 4t5u52CyzrtjUUbJV6GsZfB6k2SKHqhTnXWqdXiGF9HPylqtDJTyTFm+VuB98eWh
 AKU5pRvHqI8fwi+0iwxkC8y9WB35KHloWfRUHDxzU+EzfnCItFinnPaQgglWJL+y
 9O7l4l9xu26IZRnBWcsiK8ALHv3kplPV9CYSurzJbXUAmE0cVj3Umbv42j2in+Du
 zGcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561196; x=1657647596; bh=U7NEw4fKfQpaS
 8Nm76b4qX03LMHV0YyZnleLjvOL6Nw=; b=NYqwGPecyKx3+Gok0uVW1JdZbg65D
 qIXqbj64Hg38jWXDBcjff4xvcY1vYPZ5ip18lYCYwjy2BGkLUiJUtfb2jvhTcwYM
 Vra8IAJFFRAtjpe+CbX7lwCwoU17hKn6xhAZm/wmfk6yceqGBuE+qeTI29WgIC1t
 uNHA/pGt+4d19QtY2KlkSnkTTiFo6051CWNnNoKI8PtHXosBQZ1JNA87FNyvXNAp
 j7uZ/KzHGr5qh522bHkbbQ/SxRK+0vG9PnIFenAsWmqh9nt+h5MMoyzQTtclW61a
 hHfXcuZMeMEDNKY+xGfMAYYyKjiprZraWXaJ4/HTelDgPOXbF1Eptrbaw==
X-ME-Sender: <xms:a2DMYmxFB9qW4AHFnjomLzBYMLBMov7Ro9kTEGNUMLiZhACxA9vQQA>
 <xme:a2DMYiSz_Uxv5SyDIPz4YiSlg5qU521lLIifa2zUn7XbvTFh2ilvn39vcsmm5B47Z
 X73AgVNEdgfW6NDTZk>
X-ME-Received: <xmr:a2DMYoX2hwubR4mG6jy-KqkpTYoE1ToMeOM95ooJXzV2Mv662ioyc9iBMed3z06XGF8ifIW9nSdHELNax2YBIlqVOmI1S6LjzzmJs3c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:a2DMYsjg3u1eyXG5TUDK6WUggWCa4StC0_igAZgonPUxgtQh-3Dz7A>
 <xmx:a2DMYoApfWqlYRiEb9xrAiBSe-NA_5IoOx_uNwSKn3rdZQsvGzaMkA>
 <xmx:a2DMYtJHeo2r4kzoboGqQVe8wW0YWBhm3KSEe0FtH-m_0gwnMI1mVg>
 <xmx:bGDMYr-ubIpSW2H588GjNvwfmyI7LqR2S_2si-WA4HmFD_k43GKWmA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:39:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 07/69] drm/connector: Consolidate Connector Initialization
Date: Mon, 11 Jul 2022 19:38:37 +0200
Message-Id: <20220711173939.1132294-8-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to add a DRM-managed connector initialization function.
Since we'll need both the with and without the DDC pointer, having a
single function that takes an optional pointer is easier to maintain.

Let's create a static function that will back both existing variants,
and will be reused by the DRM-managed variant.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 65 +++++++++++++++++----------------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8818fd8fba88..bbdac23bc5c5 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -214,27 +214,11 @@ void drm_connector_free_work_fn(struct work_struct *work)
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
+				int connector_type,
+				struct i2c_adapter *ddc)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	int ret;
@@ -282,6 +266,9 @@ int drm_connector_init(struct drm_device *dev,
 		goto out_put_type_id;
 	}
 
+	/* provide ddc symlink in sysfs */
+	connector->ddc = ddc;
+
 	INIT_LIST_HEAD(&connector->global_connector_list_entry);
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
@@ -338,6 +325,31 @@ int drm_connector_init(struct drm_device *dev,
 
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
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_init(struct drm_device *dev,
+		       struct drm_connector *connector,
+		       const struct drm_connector_funcs *funcs,
+		       int connector_type)
+{
+	return __drm_connector_init(dev, connector, funcs, connector_type, NULL);
+}
 EXPORT_SYMBOL(drm_connector_init);
 
 /**
@@ -366,16 +378,7 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 				int connector_type,
 				struct i2c_adapter *ddc)
 {
-	int ret;
-
-	ret = drm_connector_init(dev, connector, funcs, connector_type);
-	if (ret)
-		return ret;
-
-	/* provide ddc symlink in sysfs */
-	connector->ddc = ddc;
-
-	return ret;
+	return __drm_connector_init(dev, connector, funcs, connector_type, ddc);
 }
 EXPORT_SYMBOL(drm_connector_init_with_ddc);
 
-- 
2.36.1

