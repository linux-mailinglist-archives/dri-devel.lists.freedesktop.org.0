Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F2546222
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED4E1124FA;
	Fri, 10 Jun 2022 09:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2301122C2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7ADB05C012A;
 Fri, 10 Jun 2022 05:29:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853379; x=1654939779; bh=FO
 HNmDhdowspPQ54kgAlb4hQeWOtDaU2smI70nM84V4=; b=yHzQh+J5lhwYOAo+mB
 Y82ELx/xUVeQXCmuCbY05TePJ9lLoHkmxU+9mv3uuDZMcmFXAI0D24SAua2QINYP
 Jz9MSY0XL6mnKbm5PMLjrgj3VMHrlFgAcIg4UBg7QtIQrhh8fRMLkfUNBNWj+1lM
 Rat/5M4jDiQ0iQJO036pGlSBD9/twc3vgiXp2iBD53gH0e3L5rKZjFcKuCUv8+Dr
 Da9gV/IJ/AQy0L1XZrWWN3l/tkeTUUk0hs/+CxtfKe2/Z0LBMXTtHAwykLW2f20n
 d2qjm32d7WUFC4CiGMS6QLE32G9DZYkqlsyP0ZJ0Qhg1TdOMSZ3LH0S4neIYNU9l
 LQtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853379; x=1654939779; bh=FOHNmDhdowspP
 Q54kgAlb4hQeWOtDaU2smI70nM84V4=; b=MHJbDDbr3jXkxUdaYkRJQPZaGKq61
 eoZpRFBH3Hze2p532w43408PptUOin+6nWI4lIhgSjVSAte768IrdR+IDBXAg0s9
 vg0Wy9aNMAd3ZftzZD4PJ/FRAPsy6atOB2VlvkG+OfxjQi4XygZpPnSnKoEhNm6u
 fGO7iD5k+hCEReOq2ocsRHjXVWQQB/TsOIUUtR63YkMXGQa49l8IdzS6Ky9M2XIP
 10EGzjjLJIrGdd7Yo1brZF1MwhcrbbvLCknU+CKMEq9nZp97BiYWlbMz7Y4hFx/q
 haPC21BfpTwoChBDe7fvjdBY9y4RFzu3pMMgPXx5+OPXfjYCjIQT5Ez2A==
X-ME-Sender: <xms:Aw-jYrf3-JP5TbVhglnBEn92DN_Hnoy97oivrEf63Qu9XfBPbimCAw>
 <xme:Aw-jYhP_OQYdghuh_-ZprCgT4xqurpizAT1d1l4QAQhrl19wOAcxT1fvWgc0_BLnp
 _VANzINXvLmhEAEO7k>
X-ME-Received: <xmr:Aw-jYkgFwVhLO0aqXC5AQuitg0BI_Q5xPmlo4eUHURc-NYzPIMTPO4Zlaap0El81rmibAocVm0xZO1hwWCpNU2FsRxEQm7MveeIuut0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Aw-jYs9bMchkpcDNCD7eloPBr08T72LlG__k_JjgiZgTUVsLEsHk_Q>
 <xmx:Aw-jYnvVl_Y7UFujQfO-diavADp-m6fYfsz9QbtZNh2xsH4MxkSSgQ>
 <xmx:Aw-jYrEDvWAMTxSH3kve4hr8cRjr3inFfWnciFG0iNrytRp5TqYm2A>
 <xmx:Aw-jYhLy_pB6G9iHuObCxdRUrTb_FFi5YfzQVewXvihy6BljGRkUOg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 06/64] drm/connector: Introduce drmm_connector_init
Date: Fri, 10 Jun 2022 11:28:26 +0200
Message-Id: <20220610092924.754942-7-maxime@cerno.tech>
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

Unlike other DRM entities, there's no helper to create a DRM-managed
initialisation of a connector.

Let's create an helper to initialise a connector that would be passed as an
argument, and handle the cleanup through a DRM-managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 108 +++++++++++++++++++++++++-------
 include/drm/drm_connector.h     |   4 ++
 2 files changed, 90 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 2a78a23836d8..f150270b519f 100644
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
@@ -212,28 +213,10 @@ void drm_connector_free_work_fn(struct work_struct *work)
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
- * should call drm_connector_unregister(), drm_connector_cleanup() and
- * kfree() the connector structure. The connector structure should not
- * be allocated with devm_kzalloc().
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
@@ -337,6 +320,39 @@ int drm_connector_init(struct drm_device *dev,
 
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
+ * should call drm_connector_unregister(), drm_connector_cleanup() and
+ * kfree() the connector structure. The connector structure should not
+ * be allocated with devm_kzalloc().
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
@@ -379,6 +395,54 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_connector_init_with_ddc);
 
+static void drm_connector_cleanup_action(struct drm_device *dev,
+					 void *ptr)
+{
+	struct drm_connector *connector = ptr;
+
+	drm_connector_unregister(connector);
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
+ * Initialises a preallocated connector. Connectors should be
+ * subclassed as part of driver connector objects. Cleanup is
+ * automatically handled through registering drm_connector_unregister()
+ * and drm_connector_cleanup() with drm_add_action(). The connector
+ * structure should be allocated with drmm_kzalloc().
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

