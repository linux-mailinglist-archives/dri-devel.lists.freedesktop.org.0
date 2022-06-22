Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67E554D16
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335C410FB5F;
	Wed, 22 Jun 2022 14:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FBA1121D3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C12EA320016F;
 Wed, 22 Jun 2022 10:32:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908341; x=1655994741; bh=W3
 tSjPzPR5bgJ4qXiTefgCZ1jzhgUiWlgJXU5AgCx80=; b=aHBRNgfgegTU5JC16F
 f9BqjRtPpC5iEntDvhWcDApqPM9yBdBjOxNptnXxyAdkmvNr0ISr0wu+5VpEX9vx
 uzd45GJ6aX5CcgbFp8NJhRph7MIfYHx+EZQM3sWJFpr8/e4YRA0MdcKM12VqZ72k
 K0LGHS5JxgnpUs8xLQiQX/Gs3zHj3lZkuowpy6gviWoAnVuUhBM5gM7Q3ttFNaM8
 wA5jgPntBiWdsmBY3nYFoyFWRzFEd2eyHw366Tq03VHQgjblhC/POcoF9s397UTg
 efTGucpGV1IrzMwyHYna+CF5tLn1bMHuZVSck8N0CQinyQ3DVBwnlz0jCwYt+9+U
 3fRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908341; x=1655994741; bh=W3tSjPzPR5bgJ
 4qXiTefgCZ1jzhgUiWlgJXU5AgCx80=; b=rJLwC7D2I6sALfQeHC662k6V/JXQM
 +A44NKJhvcBO6fwCdWaq2OL4dDcpKDqvNjAVtRHCCXvbXnOsW44I5/YKNcCKUv6W
 hT0p4FqM1/NW3+DdVfljuTTb67maMGWkctZna07VBwCVSaps85in7ZnMcyl4/sRq
 nYxTIWZgvt9zbHPnwTFHQe42HrjCAJ8rg4gpNdQWuZwePFTutOzv2wCRazBAXkPI
 TDL3XB6Ca5TUWYVsP/OUla5ZqsZVXmbOdOMQr2T8qDi1Ze6duFTh/ym05sn2gd/V
 34Jc4b/7ixxwTMLndW3iwg8Ro76lk+QWnUd+SrKy3iWdNgM4/DXikw46g==
X-ME-Sender: <xms:9SezYge_lk4N9GLEaVaTxUYduYlnKnhc6lnErvY5MgVbXRER1dpTIQ>
 <xme:9SezYiO8OVo7152hbfZPmV9QjJrLkzng0dEb1V8v1FQCu7y2ZDlWUkTJVCwfzj7Qs
 yjK47N4BwKOIgjwiU4>
X-ME-Received: <xmr:9SezYhjlQAvI77nZ_E8ceJZcuGCXO7qCYcmwzT2-bt3KuqzzJ-jY192i1GSZuXbEZUwsFdO0wSlYiuSKiYb31H8SyDsudDr4nICrUns>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9SezYl-HeF_Chi_VAh9kFVPYU3E-He_y_VURRzvFZeqxV4d2-2_9pg>
 <xmx:9SezYsvByFlgotrHuglIGCyLPXAmaZVplM28R7bYL6exAVQZnnM-pg>
 <xmx:9SezYsGBocqe-ANhKy3i7yok7ZMe0y3u_y4OzeFnLzweJr8PtPzuxg>
 <xmx:9SezYuLI0RaVxG0-nK410BXiOqA_nc6W24UGcvBQgPUZY7gevx9QXw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 02/68] drm/crtc: Introduce drmm_crtc_init_with_planes
Date: Wed, 22 Jun 2022 16:31:03 +0200
Message-Id: <20220622143209.600298-3-maxime@cerno.tech>
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
 drivers/gpu/drm/drm_crtc.c | 75 ++++++++++++++++++++++++++++++++------
 include/drm/drm_crtc.h     |  6 +++
 2 files changed, 69 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 26a77a735905..6c1fb42ecf19 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -341,9 +341,10 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
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
@@ -368,14 +369,69 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
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
+	WARN_ON(funcs && funcs->destroy);
+
+	va_start(ap, name);
+	ret = __drm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
+					  name, ap);
+	va_end(ap);
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
+EXPORT_SYMBOL(drmm_crtc_init_with_planes);
+
 void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
 				    size_t size, size_t offset,
 				    struct drm_plane *primary,
@@ -398,17 +454,12 @@ void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
 	crtc = container + offset;
 
 	va_start(ap, name);
-	ret = __drm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
-					  name, ap);
+	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
+					 name, ap);
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
index a70baea0636c..2babd5cffbf3 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1229,6 +1229,12 @@ int drm_crtc_init_with_planes(struct drm_device *dev,
 			      struct drm_plane *cursor,
 			      const struct drm_crtc_funcs *funcs,
 			      const char *name, ...);
+int drmm_crtc_init_with_planes(struct drm_device *dev,
+			       struct drm_crtc *crtc,
+			       struct drm_plane *primary,
+			       struct drm_plane *cursor,
+			       const struct drm_crtc_funcs *funcs,
+			       const char *name, ...);
 void drm_crtc_cleanup(struct drm_crtc *crtc);
 
 __printf(7, 8)
-- 
2.36.1

