Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AA356B615
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA79113801;
	Fri,  8 Jul 2022 09:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C090C113801
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 98D8B320031A;
 Fri,  8 Jul 2022 05:57:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274251; x=1657360651; bh=U7
 NEw4fKfQpaS8Nm76b4qX03LMHV0YyZnleLjvOL6Nw=; b=RxaUbwRTnzUh/ylSx0
 n0NarjgT8+NmXVks92qxsZx9TUZZNeE5O13UHBN5LPbDXGE+IV9RGiro3L/8CBo/
 1cxkhBXldFZJFf8ltamw8Ep5q9s++spwg36uw3MJZv4drByayvdky9qI0KnqLlD3
 7FceYUxmL+528hfN0Abxs+Uny4bqh12T/GEBD1pPneX6xoczWvoE0KzAxXQ4y5Jh
 5DtvE4ocW4xVuk35BnbaT5yNCQ2YMjoxJ+FVJY04C7nZGM9Fi1GvfN0fmtTJBZrb
 6R78vtOlTLQD8/WuacotSTIXU/3ezZhtrE+av9jMQIZYzA/mKREECRKAkgzpHNug
 jgWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274251; x=1657360651; bh=U7NEw4fKfQpaS
 8Nm76b4qX03LMHV0YyZnleLjvOL6Nw=; b=2PIomaxxAnUDzkK0cSQSeQ3P2b4tP
 6PrYicGurh4dYc849DlYTP/LOal1B/lPg6Br6De0Q7FsDDdBP87V4C0CDweF8HDQ
 i60OP3aq8uv+48W9tvbnRjS717LLH9Ic+nZYM645xaF+CLlbbAFp/0QruaioRUk5
 bPXbmjsnSW37kBNh9GmL0LlRC1WiFyqJupQFjEEAL9BTlft6s6sXngUA/M0Bp0mn
 +OxH+8ttA3mbiYV0xNGJbDggdsGimI5vL5QYLShzQW7uxR5ziUeoCDs4Jka2Xkwn
 ZgZ3oy8t62rjSf4wXiYTFQnm4QsFjLXfwWBxhIs2m8s7SjvoYckXJw39Q==
X-ME-Sender: <xms:iv_HYoaqECCOE3B52kyFfVIvCB7QnR4EdL3IjWiMrFi-ubZSI35UNQ>
 <xme:iv_HYjYby0--D30XGtLZ1XnDb1Fo299kMw0O7VOwgkND8Snuj6biNu01ogOsWSrNh
 9osPfX85GF1kjUtbwc>
X-ME-Received: <xmr:iv_HYi9yFVWpnSFn-T9evNFqw_DImG0PKXsxFU_Tp1n3cnYO-PeqT-13DvKdCxpyBwrcVRaO2G-aqRR_ge-j1gFgJGPsT8O32Osg6N0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iv_HYipE78is_HX9iFE2kQgsyKAh2lshODDNJGKVlU3A1kcIc6rktg>
 <xmx:iv_HYjqGGQQiZoXSBBRmHRFhsYvq_tli7YbsElx5OFahc32DuHvUOQ>
 <xmx:iv_HYgTf1DeQqEWkr4u5fKCF6mUA0XPoFngX9qZo75jDZ4UtSaJDRQ>
 <xmx:i__HYkl6K9C6N8GYlkGPK9jkHYDBVrWsVuSWgKSUQrG5m6A0UFwLIw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 07/69] drm/connector: Consolidate Connector Initialization
Date: Fri,  8 Jul 2022 11:56:05 +0200
Message-Id: <20220708095707.257937-8-maxime@cerno.tech>
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

