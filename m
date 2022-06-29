Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D138455FFF0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EF014A066;
	Wed, 29 Jun 2022 12:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25C612BABC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:37 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BA761320094C;
 Wed, 29 Jun 2022 08:35:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506136; x=1656592536; bh=4W
 MBh32pZv+/1n9GyBJq8fc3EOT+tKl27zSVQn43XQs=; b=f83s6GqiYjLCfVrQC7
 pVSFhK4o319N5TC/7KHHWd1AgOgdqS7OHWaX9P9TQT4SyxPdRlaePLWR/plmP6Yj
 BA0BMQomAWdDHjYptmCln/rIviXghV3cQxqtVVEbjibgS2siZ2dnkcGqthQaLlUV
 SuFTp4TQiKd12ynwCuUAMY47E3TkUFxmdMqIEsOtLcCZUviAodHSVEynKxa/rnvj
 YEgVGWIZoRIwBgNxPNmlJaeTuUpx1kldKyjRiO0khLsAdVUFWObpI/VD/jyVzwiT
 xMar2J6pGM1O+r3Yf9rDF97YtiUlf/XaewSLsY+TmpgRXTgmxa+eDOLpVSVF9Iz3
 wxPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506136; x=1656592536; bh=4WMBh32pZv+/1
 n9GyBJq8fc3EOT+tKl27zSVQn43XQs=; b=hC6F2lJOljQn7HhNzgf90IQMUduCc
 a3c+0mFm85+DotfpuMMA0TPlyP08isxaldfoILkD0FEiA4zuyuzyVWUOdZKgrZm5
 ap7RbOf3xPibRijdRy6KDNih+c93Vjlq4khwqGGkcf5ZcKpUHWTfJs+QXpirRnro
 xoQzA+SZlsG219iL6BNFI3MuD6136BbHth9kP7n2KCbv01E99WJTlzZ2Pnm2PjFo
 SsaNbV5DbyNPlsXkqOo6P95kaAWqkFV00HGHKjX4xGq81G4CQQDDfIpmJABagamD
 VrH+uzemuWXoYKEzohTVNHq+y7j0vtQPBmZeVL8+lWBYJzsWz4DXXpa0g==
X-ME-Sender: <xms:GEe8YhLx5mpDLrTtpSP5iuXNmfIrF7nPCPppRkLHZWacodc2Y4ylMA>
 <xme:GEe8YtLseCH_UKnGUGFeksm0P2lEQsonlsH4O_nTAvEuNM59R1Qeh_G7HVN7F41W-
 wk4zXK7adIXayppLzg>
X-ME-Received: <xmr:GEe8YpvZOUpxuS2WXzzff8YNHy5o8BdRt2QH5zmhpZAK36HPHk8ecvo3ugKXbzprprdo37mC7UbNprU7VocTWENdq0n5xRnPzJ2zhrE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GEe8YiZV6t0BAzPilyndpzeUa0mfmpLbQ1oXX9tqoLqTUDhn0N6WKA>
 <xmx:GEe8YoYpkrTK_lDEgY8ITJ0QqFSfHwBRcR8eB_3F-AyHj85-n8t3hQ>
 <xmx:GEe8YmCu-C9_NVYkV8OQy_2B2QUpEohuH1hJd4s44AZdiiO2-xO3EQ>
 <xmx:GEe8YvUFy48OypV4cFbskvx0m4bLPBzH1IE25GEUdTIfzfvqzCIXfw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 07/71] drm/connector: Consolidate Connector Initialization
Date: Wed, 29 Jun 2022 14:34:06 +0200
Message-Id: <20220629123510.1915022-8-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to add a DRM-managed connector initialization function.
Since we'll need both the with and without the DDC pointer, having a
single function that takes an optional pointer is easier to maintain.

Let's create a static function that will back both existing variants,
and will be reused by the DRM-managed variant.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 65 +++++++++++++++++----------------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 327e8cc076ad..d7dab4242290 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -213,27 +213,11 @@ void drm_connector_free_work_fn(struct work_struct *work)
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
@@ -281,6 +265,9 @@ int drm_connector_init(struct drm_device *dev,
 		goto out_put_type_id;
 	}
 
+	/* provide ddc symlink in sysfs */
+	connector->ddc = ddc;
+
 	INIT_LIST_HEAD(&connector->global_connector_list_entry);
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
@@ -337,6 +324,31 @@ int drm_connector_init(struct drm_device *dev,
 
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
@@ -365,16 +377,7 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
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

