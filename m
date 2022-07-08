Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3637456B60B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C0A1137BD;
	Fri,  8 Jul 2022 09:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29161137AE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C7EC832009AA;
 Fri,  8 Jul 2022 05:57:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274237; x=1657360637; bh=P5
 DkXCvWMNliUoN+yU7Sn3Ta819ZOkHcaG4KwuVT8PM=; b=TREkhRQonhx2w6LKH5
 xp3S9dz//639v1llmHd3ZJn6V1Q754LB3D+1I2f4503F5+r9muCejWwSYTvEAiMu
 J7Ndeys+74pR6q4S2/MTti40ojvkRTqes3+i4ymfB9LeI/DbMbL0X7WeMhyZ7opD
 Ae9KxCPySWVEBstSgmj8g90biXX8UGJ01WtfSHv0CDYnD8nUfNEWm2fGZXFGE6Nc
 x7eL5QbXuWvD3DymCmfMiK3v6SYarB0MOBCV020zMGXU+KNOeMxjV2eI+/wjdnjB
 CNFzlJyT4+RZre2cUVYCYsgkbtX6haW7AOSUbZwps+s+BbFSzYK2btIlP/842QQ+
 DZoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274237; x=1657360637; bh=P5DkXCvWMNliU
 oN+yU7Sn3Ta819ZOkHcaG4KwuVT8PM=; b=dOnXpQDwizu8b3IgTAAflX06465Kn
 KjTwxXzdf2W1h53bDyd2nx1u2ilws1s/D/tmt4wInvRcZHP8P2w1Wy6CPsHmoKNt
 bJtZPLf371XMmuBrHwfEOiLJIE4wyLdLUAAE8VOW68S4B6VwDGegI5Z6o1p7Rw53
 VESbXGVpzA5BP2eOX/8j/few2sbKflKkKko+ecU6QKfQ0Y4/XhoHmOAQwJzrsfrR
 T7j01vRvISmKRjtp5WJF955S88YA4JAqSYX84d7E8l/M9qeJ48Mkt30l4EGeDSBo
 oaQcfxZdmX+LuHYS6gjHpgvMz+f2oUtSt0bxk30K1i4a6U+uOSZrofu4w==
X-ME-Sender: <xms:ff_HYuFoNl3G8YBeKD5FXUA_VudZ1Pt6G51i4hFBXMqBElp4JTykIA>
 <xme:ff_HYvXpxqc0fGXd-hWbcaGUGAUhBILGA8mcMUjXqpMCVWHqK_4JycmHDrUqSfw1I
 YOPIyQZgrDyaPNiVJ4>
X-ME-Received: <xmr:ff_HYoITIEHIZVOnw7iInjg7lZZcrxHxUl6UGCBU7EZB-XUWSigxMJDLBtEW3CAcdt-NdnmvEkY2JvT0zZoeK2Vd2JURI8drOFvwPYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ff_HYoGG6ohs6Nx-pVF0k0xVW-RcV1Tsde_a_7w562yddsC2rjfP5A>
 <xmx:ff_HYkXv4hmw_hmmckT989i_zGdrPyX-3gq3TwRcxWo7HaCKBpzXyg>
 <xmx:ff_HYrN6GtNIaVYjffOQQFAQqcrZEkVa_sx8G8EESyGgeWJnKMC1Yg>
 <xmx:ff_HYizLbxP3XqkdwcYjG662ROc0MJ3qoYvxmaDv-43Mg_Ip6YvRNQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 03/69] drm/encoder: Introduce drmm_encoder_init
Date: Fri,  8 Jul 2022 11:56:01 +0200
Message-Id: <20220708095707.257937-4-maxime@cerno.tech>
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
 drivers/gpu/drm/drm_encoder.c | 74 +++++++++++++++++++++++++++++------
 include/drm/drm_encoder.h     |  6 +++
 2 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index a940024c8087..711ed5798dc9 100644
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
@@ -212,6 +213,29 @@ static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
 	drm_encoder_cleanup(encoder);
 }
 
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
@@ -221,9 +245,6 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
 	va_list ap;
 	int ret;
 
-	if (WARN_ON(funcs && funcs->destroy))
-		return ERR_PTR(-EINVAL);
-
 	container = drmm_kzalloc(dev, size, GFP_KERNEL);
 	if (!container)
 		return ERR_PTR(-ENOMEM);
@@ -231,19 +252,50 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
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

