Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761CA5708FF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FFA8FA0A;
	Mon, 11 Jul 2022 17:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB538F6E5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:39:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D87565C0167;
 Mon, 11 Jul 2022 13:39:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561188; x=1657647588; bh=uS
 Y0R8J+73yGhij9xJ0Bc18MCS4Cv2aRMJxF5h4eCus=; b=by/MCKPmN6Qebk5ch4
 oRQotoTLFaIn5/UGJc9WV935evRuxCRpiH7OCtUSXSMhUoWyUORPZejDY5jiMBiE
 Ykvpv0/On4ky5840cTXuS2y4BLn4yGZq+WZQ856de1E/QyurVK/3CekmWfdWdkuJ
 41939P391xzZggeIRuz+v44XglQlbiuzRrg0JtSAPnY8r+o6NQlGpg9uuYcAdzcp
 Mc9Qnx7zqqx948RV41/nb27bxxwGWNMEIyMCBbYM5AVL7m4CJjjLce3Ugtsb8oZC
 OzKwghR+mFHPxeSRgRG0V4Dr+FjVSX1USHSm+X9993IQZjUfKg/SzisVkH0qhyc2
 dC+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561188; x=1657647588; bh=uSY0R8J+73yGh
 ij9xJ0Bc18MCS4Cv2aRMJxF5h4eCus=; b=UOskjxAvDiZDqYiE+QHo0sIwXM3yn
 ZYGz+8PGUYxQGymkMc14lz1CnZlX9XpnkR2IXASPe4D/rEzvcmer9JlUN+JkQDDO
 hVcJR5kGkcvatVTiRkaEfG1mSXKxZEcof0D0iptklda4NgiFE/1Dx8Pa/6SqD3Dl
 7VBnTlqsypSgrGO4pjaSA4DFHU9tMJRvS8wMDyuuDS5jsJFG+m0nJZAvNW3ZEzlP
 5GBYbfRy2Mb7i9knNneApV1S198JB91osYSF78zZVgQ7ALJH0BuWAMmN4qbaL0p7
 /Vf46VQHXiD+sqGAqQp2WXOK/PPIlm7UvWsZ9UZ2kZHTanOoLUyylUfmQ==
X-ME-Sender: <xms:ZGDMYrWbFEVSkJVmQ3LJvI5nPB-xzuLRUBG1S9Y609x-PznSGi48uw>
 <xme:ZGDMYjkGfbbq3xfoQA4i-jmv9lg3O6-P9BF5aINQKkDavTrXKBd54_cuC2gDbflSZ
 c-79L99Sx0DL1veFcY>
X-ME-Received: <xmr:ZGDMYnY0vyjs5IuXJRvRBpPB1Qc5G2Y569h_-2hQ050DUQ50j23erFj0IT0ZiEX4QtmcvhYqWdwc9yyI2DhA2Ro-bezdeqT5NO6_aLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZGDMYmXGNhjUTWwmu05DXZAFlCucIbgNAG66NH_R9g-9qTGaWzkshA>
 <xmx:ZGDMYln78DzZkd9Tm8FhZv44pXYAhqRyc9m9kELr-GW8PXpRWnAmqA>
 <xmx:ZGDMYjeXX9ktAppTKxr75wEIAZGO4NQvKC2paq-u1Pmbi_8AEK6exQ>
 <xmx:ZGDMYuBZC0k8P_EkZmjpRxVaE0BKxfSf5iiZ0Xl_RtYVZ2i6B6Rv6w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:39:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 03/69] drm/encoder: Introduce drmm_encoder_init
Date: Mon, 11 Jul 2022 19:38:33 +0200
Message-Id: <20220711173939.1132294-4-maxime@cerno.tech>
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

The DRM-managed function to register an encoder is
drmm_encoder_alloc() and its variants, which will allocate the underlying
structure and initialisation the encoder.

However, we might want to separate the structure creation and the encoder
initialisation, for example if the structure is shared across multiple DRM
entities, for example an encoder and a connector.

Let's create an helper to only initialise an encoder that would be passed
as an argument.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_encoder.c | 75 ++++++++++++++++++++++++++++++-----
 include/drm/drm_encoder.h     |  6 +++
 2 files changed, 70 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index a940024c8087..1143bc7f3252 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -27,6 +27,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
 
@@ -148,9 +149,9 @@ static int __drm_encoder_init(struct drm_device *dev,
  * the encoder structure. The encoder structure should not be allocated with
  * devm_kzalloc().
  *
- * Note: consider using drmm_encoder_alloc() instead of drm_encoder_init() to
- * let the DRM managed resource infrastructure take care of cleanup and
- * deallocation.
+ * Note: consider using drmm_encoder_alloc() or drmm_encoder_init()
+ * instead of drm_encoder_init() to let the DRM managed resource
+ * infrastructure take care of cleanup and deallocation.
  *
  * Returns:
  * Zero on success, error code on failure.
@@ -212,6 +213,30 @@ static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
 	drm_encoder_cleanup(encoder);
 }
 
+__printf(5, 0)
+static int __drmm_encoder_init(struct drm_device *dev,
+			       struct drm_encoder *encoder,
+			       const struct drm_encoder_funcs *funcs,
+			       int encoder_type,
+			       const char *name,
+			       va_list args)
+{
+	int ret;
+
+	if (drm_WARN_ON(dev, funcs && funcs->destroy))
+		return -EINVAL;
+
+	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, args);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
 			   const struct drm_encoder_funcs *funcs,
 			   int encoder_type, const char *name, ...)
@@ -221,9 +246,6 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
 	va_list ap;
 	int ret;
 
-	if (WARN_ON(funcs && funcs->destroy))
-		return ERR_PTR(-EINVAL);
-
 	container = drmm_kzalloc(dev, size, GFP_KERNEL);
 	if (!container)
 		return ERR_PTR(-ENOMEM);
@@ -231,19 +253,50 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
 	encoder = container + offset;
 
 	va_start(ap, name);
-	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
+	ret = __drmm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
 	va_end(ap);
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return container;
 }
 EXPORT_SYMBOL(__drmm_encoder_alloc);
 
+/**
+ * drmm_encoder_init - Initialize a preallocated encoder
+ * @dev: drm device
+ * @encoder: the encoder to init
+ * @funcs: callbacks for this encoder (optional)
+ * @encoder_type: user visible type of the encoder
+ * @name: printf style format string for the encoder name, or NULL for default name
+ *
+ * Initializes a preallocated encoder. Encoder should be subclassed as
+ * part of driver encoder objects. Cleanup is automatically handled
+ * through registering drm_encoder_cleanup() with drmm_add_action(). The
+ * encoder structure should be allocated with drmm_kzalloc().
+ *
+ * The @drm_encoder_funcs.destroy hook must be NULL.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_encoder_init(struct drm_device *dev, struct drm_encoder *encoder,
+		      const struct drm_encoder_funcs *funcs,
+		      int encoder_type, const char *name, ...)
+{
+	va_list ap;
+	int ret;
+
+	va_start(ap, name);
+	ret = __drmm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
+	va_end(ap);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drmm_encoder_init);
+
 static struct drm_crtc *drm_encoder_get_crtc(struct drm_encoder *encoder)
 {
 	struct drm_connector *connector;
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 6e91a0280f31..3a09682af685 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -194,6 +194,12 @@ int drm_encoder_init(struct drm_device *dev,
 		     const struct drm_encoder_funcs *funcs,
 		     int encoder_type, const char *name, ...);
 
+__printf(5, 6)
+int drmm_encoder_init(struct drm_device *dev,
+		      struct drm_encoder *encoder,
+		      const struct drm_encoder_funcs *funcs,
+		      int encoder_type, const char *name, ...);
+
 __printf(6, 7)
 void *__drmm_encoder_alloc(struct drm_device *dev,
 			   size_t size, size_t offset,
-- 
2.36.1

