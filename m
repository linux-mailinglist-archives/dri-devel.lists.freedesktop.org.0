Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F4A546223
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B49F113F13;
	Fri, 10 Jun 2022 09:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6EA113E8B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4FD345C01A5;
 Fri, 10 Jun 2022 05:29:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853381; x=1654939781; bh=ct
 gWxxTjKltyGRF+6vGejofWiXxwUcxSLkfyMeE9slQ=; b=rejOnOQ0jyai8bRC2r
 h1wchiXL6LwfqKLvd03Ajvf/oUy/RhwAzxpwzO/F1TQkuEPd3399KLt6lWmKKvS6
 AI89OKhKW2ZgXHZi3jydwsbs/puKOlrfyLctMmeql0UvYO3Jm+x/NfY704aKCwqH
 mgn/sofwQRcsm18VLvSm3hgTEk7oaGb/0v87FnCGU1lsYijrrWoE6hAW5Eb2IBmo
 /Z4QDwRfRxXogFzG1e1LCgc900ymxSMef30nPfgb+ifTZvHGa8r5klpUJGphCjbO
 2fOvxgSkEnPNEnebpRy2uPFraK+d0zR/RU2lzCemM3Rr64g2hF9hMtqonvXVh/gZ
 VHiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853381; x=1654939781; bh=ctgWxxTjKltyG
 RF+6vGejofWiXxwUcxSLkfyMeE9slQ=; b=b/cKZvkIqENyiRjbEJeIHz+Dkt7dJ
 3MEJvJqDWRraYwcsogRHrghnsWFhvVRWlYfeLz0rzkR4SMpYkpyQvNTVhjLqY/Yo
 l0SC1bWuHrzAgv6t7bDdbVGuyRI9UuOuAZ1A3T6ClQi1LFJm+hRWjWsV5LcQo2vg
 8HKOMw/SyvQm+JTpG+97u7cjxHDdYMmKoYmirK0Olt/rZjixw+YngucMxBJC0bhA
 yazLnHppUmGAqL4WoaPswhJXZlLwi31chMnBCOzz7uN0x/yzGKISiX0Zsa6tb6RU
 zO5YirTdiHtqdARJy5KXdOKcbWHqzMqJy1X2SYOTB/nF09waeGFuG5SEQ==
X-ME-Sender: <xms:BQ-jYv19e0pmvIizPPBVxKVV5RiJ3M9p548KFqB5bQ27Q0GyPUDJ_A>
 <xme:BQ-jYuEO-HwDfy0z2Hu4vuEJrvvrqkrpsgpme4rUxBbAKFYMNlhrRb-McD4RHUkbG
 cBawDuXabQX2bmVDlI>
X-ME-Received: <xmr:BQ-jYv7TyN8FZyHNGBcAOa5dsBeqea-7MeXuUDlL46pJkL35i7-n5lH_W9iLZY2LmX_KxLcfuJarQ1Guoqp1sQ20C50yRqavKcdh5C8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BQ-jYk3jA64rJu8HfNTAmPe_2Y3unVfFEriMXo8gnAbxyebF-M2nOg>
 <xmx:BQ-jYiG6HiOUSGEk3rYlcQYmqC7ydFP-bjvipSbZDZRYllq3tEc5cw>
 <xmx:BQ-jYl-CoUQpTyy_FtMD5PTAnecGZ_1CMkWcmHtWOj87IRyH0Rmnjg>
 <xmx:BQ-jYuhiQcnSNz78Mrc4EP5EdfU2cHUJ2oRF8FfnXy_6UOUIUEum7g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 07/64] drm/connector: Introduce drmm_connector_init_with_ddc
Date: Fri, 10 Jun 2022 11:28:27 +0200
Message-Id: <20220610092924.754942-8-maxime@cerno.tech>
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

Let's create a DRM-managed variant of drm_connector_init_with_ddc that will
take care of an action of the connector cleanup.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 72 ++++++++++++++++++++++++++++-----
 include/drm/drm_connector.h     |  5 +++
 2 files changed, 67 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f150270b519f..f577e5a739f1 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -355,6 +355,30 @@ int drm_connector_init(struct drm_device *dev,
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
@@ -373,6 +397,10 @@ EXPORT_SYMBOL(drm_connector_init);
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
@@ -382,16 +410,9 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
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
 
@@ -443,6 +464,37 @@ int drmm_connector_init(struct drm_device *dev,
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
+ * subclassed as part of driver connector objects. Cleanup is
+ * automatically handled through registering drm_connector_unregister()
+ * and drm_connector_cleanup() with drm_add_action(). The connector
+ * structure should be allocated with drmm_kzalloc().
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

