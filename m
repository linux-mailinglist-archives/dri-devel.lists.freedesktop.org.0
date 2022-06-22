Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8276554D18
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09F21121D3;
	Wed, 22 Jun 2022 14:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AD11121D3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 69C9E3200944;
 Wed, 22 Jun 2022 10:32:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908344; x=1655994744; bh=0C
 /WbeiMjdFBtwjw6PGzqDVCjS050P9qFpRuUCiQgLg=; b=ZcricHpXnogOStxHFO
 Nb8+S89Vfo/2vo7tgrxh0siw8w6/NudaUIbukpB8dZVLXQYOKuhMnf27GMD7TeSi
 WdUjCwIfpUCIjsk6sn5qRC52+G2/DdtK9znWzWwS1bGdfCanSi3L9QJ4htyUXGL7
 ZpzZw5UOVIbSCvJlkFO9TJYI75LQ8ocjGXA84u9XM7LKdY/Llezja17sdoVUazRr
 gqlexvW/csrHhIWl5JP59u7JNQKdeXotuakLD+y6oGmZszEGcdI3T0tqZWWjpIH3
 gjysoq9S/5y7d6+QZ1b0XhUUYnXoY7NsK7I2pPBhYobr3ZSGKHkoiSBmthEhq1qn
 p+Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908344; x=1655994744; bh=0C/WbeiMjdFBt
 wjw6PGzqDVCjS050P9qFpRuUCiQgLg=; b=GL+nErH/TgQ9ItUUAqywm5kCajn8J
 hNxMLwQrWt7OTRE1ekK2goKK4LB6IhIGt8F5vNg7jFwShw10xBVQ+qh5XbrBqWYy
 7vlOtBLW3n34goKnj4coYDAUSl5c5EaSBvBxpjwMdYxGtONKHTzCvnkDo1wIfR8M
 Nrj6Lc9eYhqjnnjvKxZK6vL2HTp3iaiduSQk/FcH7hAGtxeNg1C+GL2K9+Q1StF4
 mFoOFzy+B4j2dyn/Zl3EB2F/fLUI6jMnMTcqu1aGuaL3ALL8+/R0IvGaycJyt2Cn
 LOWggKAD2HDSM1oq7FiVQHfsOrQS1qNiQWYbWwSMjNfnO0GrWO3Q8fWuw==
X-ME-Sender: <xms:-CezYk9QiB6cKzbx1_fZqAyxhGgu59DDTzDzXTsHo5Z7_PzoC6VRLA>
 <xme:-CezYstH-0qhwWOa7DAxV62HsnGQGQqS7YXJi_p0wq-zj0xarlE5HDPa2EdqSMqNZ
 CmqyeMKrC4CvANg50A>
X-ME-Received: <xmr:-CezYqBLAuB0EZJ--2NAq2noYOg546q0gt2Ov5zBs2h6oQx8Nj4lTSL6qDq54W8rDbjfvjbtWKb0MRV7EZ7KL0vueGQTa6j8Eyd5-4Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-CezYkdfTy3UuK5rRvfXFGBDEArajkZv2ZxjMnA06ChdeEiq6sB-lA>
 <xmx:-CezYpMfHT4VY8RgOsTRWd0b_K2alIpRCNZ1qUAYSwuc1lvNQ11-uQ>
 <xmx:-CezYukfL7PUhS3rPPbawKChdoE1yIef_FmF53Lg-GJpXfTQsbfiTA>
 <xmx:-CezYuro5CBK6TKBOLgUQxqtI1YM5atUZlBeKAqZ-SSxjaHJ6RZOLA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 03/68] drm/encoder: Introduce drmm_encoder_init
Date: Wed, 22 Jun 2022 16:31:04 +0200
Message-Id: <20220622143209.600298-4-maxime@cerno.tech>
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

The DRM-managed function to register an encoder is
drmm_encoder_alloc() and its variants, which will allocate the underlying
structure and initialisation the encoder.

However, we might want to separate the structure creation and the encoder
initialisation, for example if the structure is shared across multiple DRM
entities, for example an encoder and a connector.

Let's create an helper to only initialise an encoder that would be passed
as an argument.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_encoder.c | 57 ++++++++++++++++++++++++++++-------
 include/drm/drm_encoder.h     |  5 +++
 2 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index a940024c8087..b29f2f07744f 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -148,9 +148,9 @@ static int __drm_encoder_init(struct drm_device *dev,
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
@@ -221,9 +221,6 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
 	va_list ap;
 	int ret;
 
-	if (WARN_ON(funcs && funcs->destroy))
-		return ERR_PTR(-EINVAL);
-
 	container = drmm_kzalloc(dev, size, GFP_KERNEL);
 	if (!container)
 		return ERR_PTR(-ENOMEM);
@@ -231,19 +228,57 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
 	encoder = container + offset;
 
 	va_start(ap, name);
-	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
+	ret = drmm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
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
+	if (WARN_ON(funcs && funcs->destroy))
+		return -EINVAL;
+
+	va_start(ap, name);
+	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
+	va_end(ap);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
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
index 6e91a0280f31..6713fe1804e9 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -194,6 +194,11 @@ int drm_encoder_init(struct drm_device *dev,
 		     const struct drm_encoder_funcs *funcs,
 		     int encoder_type, const char *name, ...);
 
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

