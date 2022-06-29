Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272F55FFE8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7486511BED8;
	Wed, 29 Jun 2022 12:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E377711BE95
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BD460320094C;
 Wed, 29 Jun 2022 08:35:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506121; x=1656592521; bh=Yy
 7wEtMR57qYoFXWbcbUoGSjF9BNHyRvEYQT0WY1BF0=; b=SSi6FtWq8p/1RRVQzS
 ZGvOjrThYc2Fhqssb5x+LBPzaYEaZyZ2mePe3gTmj2FL9BilyPabhWP2c46d4zZA
 rk9qyGxQhsHQ7fDs1MwSSS9gukhMpQfwT87DUk476rDgQvdLYYnZpvaI1wsBHBm3
 elqIIyczMFypqAYZEVxBCzvIAvJqVoW+EXnvxrqd+XQejkvFhm0Qin1/I6o4GqVT
 k6Eae+yLhd8mlUp83pRjNdkp5fFXfv1R9f9P7hYK8U0dRc/vcdPniRAI88TPcdnL
 4Lo3A0y5nqYpl4/WNvu2OmZtJIWAslw1lCEHbJ26/qx+UGiFtAFeow2D2zxHoHzW
 I07A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506121; x=1656592521; bh=Yy7wEtMR57qYo
 FXWbcbUoGSjF9BNHyRvEYQT0WY1BF0=; b=Z1ClKyK4mBdgZIhze0Yc8HAWZJGdK
 egeteaO5mcuzAkQhVZX5wKywqA5Hs0GL90UtozlqwR7rB2dHVHrZ+MEgz7x2EnV2
 t6f7rvV2fQQeDhG9DlXykARiFpAVGOCitU5xvFfd6nmWIZdM1Il14rWCC6tTotfj
 0+yYW3FZe4XIx/LRKjUKC/hI7v+hO8Xy2zxCUUwfzdff3cyUcqMlGcBgthD52j1x
 GB3VLaB4Lw1/a+eYAAb6FIaqNT9kIU7jd35aZpxQeHGHq9qYkszJFgvxMZX1n8f4
 svZccTop34+BUgrw9k5+rao2Aq3/bERW5HQ+FHRUEoDCQFkynvCdPBt0Q==
X-ME-Sender: <xms:CUe8YiWtpRYvTmwwPG4_PgDQhGa_sj3wToIJ6xr7eR0SsUYjrjUegw>
 <xme:CUe8YukSLHph-6MPUzss5WSxGe4MT8C33j2oX-6UmrpKqbMzvc-hKHq2IrxcJnYEb
 aIJtkVcSSmGryCYeFI>
X-ME-Received: <xmr:CUe8Yma77RGj-AivjQ1zsRNrGbbPJG8TXujjZpkqjO8VgOinr_ZaAUzPBeyxtKrywhqdhKnUTSSkgL8Xq4Y9Z7wXTCFllU8_hPgAyP8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CUe8YpXagbO-s4DfBjaar-7P8hBA0s4SdHNYSk-iVvD74hQ7OmWgsQ>
 <xmx:CUe8YsmzSwxFlyJpfRfs4HS0706ib1UshnM0AdSqKib7zc6uyRkFXw>
 <xmx:CUe8Yue-9MtTwEjeHjllahu4JGA6CTs4hnWZkufhDLaQW_MZe42V3w>
 <xmx:CUe8YtAtFr3v_yUAvOVW5x38vUiIb1YCItZ6bHLaJq2od3mvQq_jnA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 02/71] drm/crtc: Introduce drmm_crtc_init_with_planes
Date: Wed, 29 Jun 2022 14:34:01 +0200
Message-Id: <20220629123510.1915022-3-maxime@cerno.tech>
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

The DRM-managed function to register a CRTC is
drmm_crtc_alloc_with_planes(), which will allocate the underlying
structure and initialisation the CRTC.

However, we might want to separate the structure creation and the CRTC
initialisation, for example if the structure is shared across multiple
DRM entities, for example an encoder and a connector.

Let's create an helper to only initialise a CRTC that would be passed as
an argument.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_crtc.c | 93 +++++++++++++++++++++++++++++++++-----
 include/drm/drm_crtc.h     |  9 ++++
 2 files changed, 90 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index cad2a7e5166f..fa2ff2819c10 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -343,9 +343,10 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
  * The @primary and @cursor planes are only relevant for legacy uAPI, see
  * &drm_crtc.primary and &drm_crtc.cursor.
  *
- * Note: consider using drmm_crtc_alloc_with_planes() instead of
- * drm_crtc_init_with_planes() to let the DRM managed resource infrastructure
- * take care of cleanup and deallocation.
+ * Note: consider using drmm_crtc_alloc_with_planes() or
+ * drmm_crtc_init_with_planes() instead of drm_crtc_init_with_planes()
+ * to let the DRM managed resource infrastructure take care of cleanup
+ * and deallocation.
  *
  * Returns:
  * Zero on success, error code on failure.
@@ -370,14 +371,87 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_init_with_planes);
 
-static void drmm_crtc_alloc_with_planes_cleanup(struct drm_device *dev,
-						void *ptr)
+static void drmm_crtc_init_with_planes_cleanup(struct drm_device *dev,
+					       void *ptr)
 {
 	struct drm_crtc *crtc = ptr;
 
 	drm_crtc_cleanup(crtc);
 }
 
+static int __drmm_crtc_init_with_planes(struct drm_device *dev,
+					struct drm_crtc *crtc,
+					struct drm_plane *primary,
+					struct drm_plane *cursor,
+					const struct drm_crtc_funcs *funcs,
+					const char *name,
+					va_list args)
+{
+	int ret;
+
+	WARN_ON(funcs && funcs->destroy);
+
+	ret = __drm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
+					  name, args);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(dev, drmm_crtc_init_with_planes_cleanup,
+				       crtc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * drmm_crtc_init_with_planes - Initialise a new CRTC object with
+ *    specified primary and cursor planes.
+ * @dev: DRM device
+ * @crtc: CRTC object to init
+ * @primary: Primary plane for CRTC
+ * @cursor: Cursor plane for CRTC
+ * @funcs: callbacks for the new CRTC
+ * @name: printf style format string for the CRTC name, or NULL for default name
+ *
+ * Inits a new object created as base part of a driver crtc object. Drivers
+ * should use this function instead of drm_crtc_init(), which is only provided
+ * for backwards compatibility with drivers which do not yet support universal
+ * planes). For really simple hardware which has only 1 plane look at
+ * drm_simple_display_pipe_init() instead.
+ *
+ * Cleanup is automatically handled through registering
+ * drmm_crtc_cleanup() with drmm_add_action(). The crtc structure should
+ * be allocated with drmm_kzalloc().
+ *
+ * The @drm_crtc_funcs.destroy hook must be NULL.
+ *
+ * The @primary and @cursor planes are only relevant for legacy uAPI, see
+ * &drm_crtc.primary and &drm_crtc.cursor.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
+			       struct drm_plane *primary,
+			       struct drm_plane *cursor,
+			       const struct drm_crtc_funcs *funcs,
+			       const char *name, ...)
+{
+	va_list ap;
+	int ret;
+
+	va_start(ap, name);
+	ret = __drmm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
+					   name, ap);
+	va_end(ap);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drmm_crtc_init_with_planes);
+
 void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
 				    size_t size, size_t offset,
 				    struct drm_plane *primary,
@@ -400,17 +474,12 @@ void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
 	crtc = container + offset;
 
 	va_start(ap, name);
-	ret = __drm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
-					  name, ap);
+	ret = __drmm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
+					   name, ap);
 	va_end(ap);
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = drmm_add_action_or_reset(dev, drmm_crtc_alloc_with_planes_cleanup,
-				       crtc);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return container;
 }
 EXPORT_SYMBOL(__drmm_crtc_alloc_with_planes);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index c404b6e81220..2f252b5ec7b8 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1227,6 +1227,15 @@ int drm_crtc_init_with_planes(struct drm_device *dev,
 			      struct drm_plane *cursor,
 			      const struct drm_crtc_funcs *funcs,
 			      const char *name, ...);
+
+__printf(6, 7)
+int drmm_crtc_init_with_planes(struct drm_device *dev,
+			       struct drm_crtc *crtc,
+			       struct drm_plane *primary,
+			       struct drm_plane *cursor,
+			       const struct drm_crtc_funcs *funcs,
+			       const char *name, ...);
+
 void drm_crtc_cleanup(struct drm_crtc *crtc);
 
 __printf(7, 8)
-- 
2.36.1

