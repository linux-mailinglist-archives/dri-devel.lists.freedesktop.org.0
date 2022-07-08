Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA0056B611
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B67910FDCA;
	Fri,  8 Jul 2022 09:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2953010FDCA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:16 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 02DE332009BC;
 Fri,  8 Jul 2022 05:57:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 Jul 2022 05:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274234; x=1657360634; bh=gs
 0rbkNZXA+zt9MSP5Zja+kj62hGJ9p+qn0fuQj1RH0=; b=xOsjFbR3jSNY2he4V7
 vGyTU9zCUiiCaTS0ZwAzM4dO79X/oR2bTH3Ak44aTpC7QsyY7ttyUBS6ARJ+5sV0
 g4fvxzy3nZ0ehmQnkdf6a4KNhCFZk6WzTEwbGXpzIgjRuRj1DY/nx/FshPK6ftuc
 hKDqbqvQtW1EB3N9ezfsWbYFWUuiwaWvGgte7351d8e5qGlLMY6C092jdTuGHclJ
 a5gNF+cC0l5Ylh3ZHH1iA0wo5/w2HtLto0UWZVYmnPHWEKxJ9Fnur4FNzyHolM5X
 mroAdxQSmzKUWrg3O8uDes3SBFc3IWi3s8/ip/WQUvLyEaDRUM2tqv64tmzGfZKl
 5UOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274234; x=1657360634; bh=gs0rbkNZXA+zt
 9MSP5Zja+kj62hGJ9p+qn0fuQj1RH0=; b=jc7CW5JLW8G5sczpw7p5trqB34ltk
 8x7fx0NHrdruXe08KYEWB6tgjxIT6Ap+ZsjqLK0iC0dTWBhMLss75Sby4QmD16NE
 yPnqNPywhHxBmpeSP2ksvMc1bS1I5Ws5A1lTtP/3gVbwoezaqHE9jlwXWmCZNDzn
 JX0W7PJFlhNb23JoITRdZIbb4BFu7OnjC+Ql9kDT+JnAAEdjK1uY8/u2EadDMLjL
 IaLtuZj8BObknu4hhgGQin7NeT3hRYIfO0C/tacPMEhkZnbI2K14dXBDNK1VcMnN
 hQ9OLjpQlD79FqPC1WTVGmV8KSwV85zZ334W6MLD5O8WM1NyFvXc6X0aQ==
X-ME-Sender: <xms:ev_HYjsCddD_fyuauXqnAOzryiVN8Nf3MWF5Wpu4kvCxrvn5cvsoRw>
 <xme:ev_HYkcRLWJxVneMmR6vcwGVZidvYeSGJjUufhX7cgl16vsczsLMi8onExsY81hu-
 wvhlxoFNp9nqWk8uP4>
X-ME-Received: <xmr:ev_HYmx9isE9KLn9fGmgc5_i6Cf7tD_j2Q323Kq8syyUgYna9uHco5PET4Pksg93Mixa8ukTRUcdclXXSJ8VAKBwTnsl9nJhbnSpudE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ev_HYiPbGWHOgqHFFpTs3dB206MTlHUfQ9BbAPltF9sH28YDONA8VA>
 <xmx:ev_HYj-Eay3uOs48p8qy8G1JN8zCGdsYBkeV7F2ucIF5KI9IY8yPcQ>
 <xmx:ev_HYiWFkvz7WnhsEgjN9BMTDzJEEReH5v5dSxp72GyLhZ-zgkzqDw>
 <xmx:ev_HYvYwDHkGx4AAwfLBlu6d1Gfw-Vzw6PfOzzIEVVq-NfcR2zx5wA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 02/69] drm/crtc: Introduce drmm_crtc_init_with_planes
Date: Fri,  8 Jul 2022 11:56:00 +0200
Message-Id: <20220708095707.257937-3-maxime@cerno.tech>
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

The DRM-managed function to register a CRTC is
drmm_crtc_alloc_with_planes(), which will allocate the underlying
structure and initialisation the CRTC.

However, we might want to separate the structure creation and the CRTC
initialisation, for example if the structure is shared across multiple
DRM entities, for example an encoder and a connector.

Let's create an helper to only initialise a CRTC that would be passed as
an argument.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_crtc.c | 93 +++++++++++++++++++++++++++++++++-----
 include/drm/drm_crtc.h     |  9 ++++
 2 files changed, 90 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index cad2a7e5166f..b7a46917c147 100644
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
+	drm_WARN_ON(dev, funcs && funcs->destroy);
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
index ffc1cde331d3..8e1cbc75143e 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1216,6 +1216,15 @@ int drm_crtc_init_with_planes(struct drm_device *dev,
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

