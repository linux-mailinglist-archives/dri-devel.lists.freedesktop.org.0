Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C45554D1F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A9711246F;
	Wed, 22 Jun 2022 14:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C7711246F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B34C132009A1;
 Wed, 22 Jun 2022 10:32:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908361; x=1655994761; bh=CT
 TlR8pk60GaNilWn8E/x1S7K2oNmL7K4xhg6khE62Y=; b=EwphHgTioNDtwn6uPu
 Estjl8uMdH4aaELtq+TbVrus7mWUtsyI4ooG99hdc7Rds6e5C3cWrfL7KLUfdjvJ
 Fu7XRLlVxT1bVO+3P/ey9t9uL8LK62526ByFLEXiAfFyQInemqdnVxVuGVfuQMQY
 fwhDCi7pgU7ymlbI4NMUdzpIGaoDhdvbOMzSliPH1P8C1Xl6DVyobCK9xo9k3zuU
 0YCsFkIUuDPqy8ewAi+jibZzGXndxNAyD6ZLOmxkmXtG5V2CH6GYWkxcsJsagZTd
 Ktqad18EQ+T2vCKeIBd1yO3LMLep1OwUKYoJjVAMmsVrefXDUvq3U5lItuM3GkWa
 N0Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908361; x=1655994761; bh=CTTlR8pk60GaN
 ilWn8E/x1S7K2oNmL7K4xhg6khE62Y=; b=Ia20tEdeKPYH3ClKz9v0LQb72FmBp
 cNdgS3I9Z+Nxb7rFj2E3qzSOSxuQME0AtKxsPvcH5+QEZEMa7lappOwFsza7lYU7
 Pj1pNph8OmieXaEojYlimwVLc9hwmioBb5XCniuhBxVbva8d9/XACdsorV8k2PtZ
 tcVk7CuRZ/C4qv33NVLXfNjDnq+itbHC5NLireKWN1NdL3gSS6ZcyuxLBNmETPQO
 I7vby+78GC82lY+NtEhUxH5XAUsj10Ir1wuCJBoExa92ZmTjKbl+D7Q9kqc9gBCe
 Oaen18YKcI1mKVZgd5JrExVlw73A63Lb6TgJtuL82zeuszoe/oCobCiKw==
X-ME-Sender: <xms:CSizYrJNV6MXhuXQh-68VEcXrR42jzadOobyhi65HZ-6__nURN3e_w>
 <xme:CSizYvIcCECxj3mitI29kLVejim1_voUbeQ_0uVX_7IOYAHa-bwydA8ARthIFtkYt
 xsKnWcCrxND_yD7c88>
X-ME-Received: <xmr:CSizYjsX7g_r_c4EtteloG8EGnlSzy4ttNxyRtrZ36rojmJM1BNc8zpJexxxlFSScPbsc1oPDzxdknJKwT-I1Zcal_LSlNtQOn8B7ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CSizYkZShopcQjR0YgLQQSK6IkcmMrCbfOraV_vmy9I4sbNEBT88XA>
 <xmx:CSizYiaw53HEw_KQClBgr5SIHvVLd34hIt820XueKAFKrmwm4X5K-Q>
 <xmx:CSizYoDA1n8a79Q2c7jp2ecygGCmfKb76vXRvwKRZ8T4gj6NizfHIw>
 <xmx:CSizYpXRXFTZ30hxBUG_5tNMavwJ6VUvX4sUDp-LXDQ_K38u6NogMA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 08/68] drm/connector: Introduce drmm_connector_init_with_ddc
Date: Wed, 22 Jun 2022 16:31:09 +0200
Message-Id: <20220622143209.600298-9-maxime@cerno.tech>
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

Let's create a DRM-managed variant of drm_connector_init_with_ddc that will
take care of an action of the connector cleanup.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 74 ++++++++++++++++++++++++++++-----
 include/drm/drm_connector.h     |  5 +++
 2 files changed, 69 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 0fec2d87178f..076ca247c6d0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -354,6 +354,30 @@ int drm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_connector_init);
 
+typedef int (*connector_init_t)(struct drm_device *dev,
+				struct drm_connector *connector,
+				const struct drm_connector_funcs *funcs,
+				int connector_type);
+
+static int __drm_connector_init_with_ddc(struct drm_device *dev,
+					 struct drm_connector *connector,
+					 connector_init_t init_func,
+					 const struct drm_connector_funcs *funcs,
+					 int connector_type,
+					 struct i2c_adapter *ddc)
+{
+	int ret;
+
+	ret = init_func(dev, connector, funcs, connector_type);
+	if (ret)
+		return ret;
+
+	/* provide ddc symlink in sysfs */
+	connector->ddc = ddc;
+
+	return ret;
+}
+
 /**
  * drm_connector_init_with_ddc - Init a preallocated connector
  * @dev: DRM device
@@ -371,6 +395,10 @@ EXPORT_SYMBOL(drm_connector_init);
  *
  * Ensures that the ddc field of the connector is correctly set.
  *
+ * Note: consider using drmm_connector_init_with_ddc() instead of
+ * drm_connector_init_with_ddc() to let the DRM managed resource
+ * infrastructure take care of cleanup and deallocation.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -380,16 +408,9 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
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
+	return __drm_connector_init_with_ddc(dev, connector,
+					     drm_connector_init,
+					     funcs, connector_type, ddc);
 }
 EXPORT_SYMBOL(drm_connector_init_with_ddc);
 
@@ -443,6 +464,39 @@ int drmm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
+/**
+ * drmm_connector_init_with_ddc - Init a preallocated connector
+ * @dev: DRM device
+ * @connector: the connector to init
+ * @funcs: callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated connector. Connectors should be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * Ensures that the ddc field of the connector is correctly set.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_init_with_ddc(struct drm_device *dev,
+				 struct drm_connector *connector,
+				 const struct drm_connector_funcs *funcs,
+				 int connector_type,
+				 struct i2c_adapter *ddc)
+{
+	return __drm_connector_init_with_ddc(dev, connector,
+					     drmm_connector_init,
+					     funcs, connector_type, ddc);
+}
+EXPORT_SYMBOL(drmm_connector_init_with_ddc);
+
 /**
  * drm_connector_attach_edid_property - attach edid property.
  * @connector: the connector
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 35a6b6e944b7..2565541f2c10 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1676,6 +1676,11 @@ int drmm_connector_init(struct drm_device *dev,
 			struct drm_connector *connector,
 			const struct drm_connector_funcs *funcs,
 			int connector_type);
+int drmm_connector_init_with_ddc(struct drm_device *dev,
+				 struct drm_connector *connector,
+				 const struct drm_connector_funcs *funcs,
+				 int connector_type,
+				 struct i2c_adapter *ddc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
-- 
2.36.1

