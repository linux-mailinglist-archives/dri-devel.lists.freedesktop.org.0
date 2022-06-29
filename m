Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D290F55FFEC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E0712B0D5;
	Wed, 29 Jun 2022 12:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001CF11BE95
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B939632006F5;
 Wed, 29 Jun 2022 08:35:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506124; x=1656592524; bh=CZ
 pks4ETb3cnt0KzMyLG54c2+oF+kwPzdeeeESrf3Fc=; b=n48ljmVBEpH2uPH2np
 lPgnpZzGx676vvw2JEJguWpfOt98oZxi7VQKGAKBasz5ooPQQljfDVvW4QSKuq4w
 55rBKZZGgAYdZYVvU4eVSojrTlSr4Hyqbe2gLQ4h/uvKx1chKyoXNs8Qdv6dxl1P
 f2ha7SKftxZQgBUcoSL9rc//vwKnR0YyKt9GGBwj0x4YutVXaWS81wvtEikt6dQU
 j+Tz0K0v1fWXyP+OFXs72KNMapTJFW7dYbF01xkEqlSEQ8bzuSpcD+hYCfdhoBZ4
 AhVcESIVVT3Hk8ekbO/JOTg6jsH/xfQvbXm/dydRWOS/pGb3tBp9HhUhmO8Fr2yy
 hfLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506124; x=1656592524; bh=CZpks4ETb3cnt
 0KzMyLG54c2+oF+kwPzdeeeESrf3Fc=; b=TtVAMFjc4bLAVzN1GnWgpBA8j66iz
 7sSULzR+Oc5aMxGJ0lvSIz9tIVTFPF3YZBaVA2zhOzp6JnKxPaxTujgupsAYVyN+
 YD8Mi9XjIhLr4O+RDSi1bsLTtA6pkQvmWavy2Rgk2ZLp6pGXB2GuyXVkLa2Wkz2H
 Vfe2rH+ugZLVFCxBWlWS/xjMeSdQmmENa/KStbyIcvl5CBJe4kSb3PijiF677b7a
 IrWiIQlgPh+oaJnPbVc+snnRMfpYint5hi60j4URY95lLnGZmT3dAZJGNhZbUBcX
 +Y4f1o9a4LleAMBzwdpwEkdljfA6D+IDNN1WWM7n0tBtXDBp/Cvzjk/VA==
X-ME-Sender: <xms:DEe8YjlsiJhkiJ0weIWe5T_wax9BK_XCrd4-H3sqwRdgPwDYKoIFGg>
 <xme:DEe8Ym1m0_2LmDPX96dGD1erh_0K5Z4vNCx27baTWztXAok2OBd2OYDGmXXF7uNfq
 QAOF6wdmMcQWDz_i9I>
X-ME-Received: <xmr:DEe8Ypri5OoFjEh6l_3bqhhFeS3t3o5sgRxNzDm2KF7XM1NCYqUwBcdziB_-CBKaezk85F3P-iN0mpM7XvzAKZDCRCBubl4ZCThlTbE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DEe8YrlD5l1aNYCUpwM939MQfFWIQt7Eb1QAD-f8ud-L4t0DeiUycg>
 <xmx:DEe8Yh3QsvT2jXLkXPnJz_NJqZGqqDETgGZLuVsPzzStmUiWZ-Uv2A>
 <xmx:DEe8YqtGv1h8FESbU_DlgXdyuCdE7jMXJ5AxlsPI0ZyXm17V54pY5g>
 <xmx:DEe8YsTungfZ7lN817EIndImdSloqPx6Q_sF4ko_mYjRJhyozHX_wQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 03/71] drm/encoder: Introduce drmm_encoder_init
Date: Wed, 29 Jun 2022 14:34:02 +0200
Message-Id: <20220629123510.1915022-4-maxime@cerno.tech>
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
 drivers/gpu/drm/drm_encoder.c | 76 ++++++++++++++++++++++++++++++-----
 include/drm/drm_encoder.h     |  6 +++
 2 files changed, 71 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index a940024c8087..ae2da4be080b 100644
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
@@ -212,6 +212,29 @@ static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
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
+	if (WARN_ON(funcs && funcs->destroy))
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
@@ -221,9 +244,6 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
 	va_list ap;
 	int ret;
 
-	if (WARN_ON(funcs && funcs->destroy))
-		return ERR_PTR(-EINVAL);
-
 	container = drmm_kzalloc(dev, size, GFP_KERNEL);
 	if (!container)
 		return ERR_PTR(-ENOMEM);
@@ -231,19 +251,53 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
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
+	if (WARN_ON(funcs && funcs->destroy))
+		return -EINVAL;
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

