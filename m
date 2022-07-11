Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8757570900
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E468FD0A;
	Mon, 11 Jul 2022 17:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61578FA0A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:39:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 351E55C0163;
 Mon, 11 Jul 2022 13:39:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 13:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561187; x=1657647587; bh=LY
 Pn7Nf0hxXCG/hxwn7RzjCz0KCx3xU3Y1RWV+t5RTs=; b=ffSUf/LtsOA93Wrvty
 7WI9909ukV6DZ2ySLjVBeD1G9Z2EBqpvOLBua0fbRUrR821NFZYqCPPzdSzX5r8A
 It5m3oJF9ScFIVFf+UzvedftuVemG5RPg3JkSgdfX+j1NN0gHIwPX7BUTRSJkV+a
 u3J+masz3N4LUpMcw54/4GLbyvwTghWuVcwGgGRFsoO6tqcIMY9HRPaMgm4H6Mwd
 I+BrJhUb0WtdR5burTnOxxjpiJsANyK2K0HUupUXedb/JpnvlqlAH1YEvekHI3dv
 swSDhgXRt1sAron3aHnNoGmlYnKWy8ZEG89P8we6Z2MbGuBxvZrt5MfyRYQghpUE
 cWyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561187; x=1657647587; bh=LYPn7Nf0hxXCG
 /hxwn7RzjCz0KCx3xU3Y1RWV+t5RTs=; b=t3uGnTlBVamXr6dSWcXJtTMlDePx5
 PkU52JRc+/CZSmpuKCARUIsjgx6q16NP/YMviYCGm2oLEXlQzt12Tr9I4YPHJBBV
 8rjkH8Fg9mUixjCZZdP+762wYhAuD5UIvlBsN4xq1I3lyyHxYVhLI68QemqJZZbB
 94MLJJPBC6ulw9Rwz90D61rqI5/Lqr0h9KVPeKGviXO6FEpQNQKas+pougRkVLgp
 xPwEj5JTcM17iHCkWDbhvxVZefvpenmsRFAyaR4yt4vVXqU4e1BJ3EeS24lBTM1R
 0+klWZJ9Fv37wsvRirhxDctZs2VuElmvDb4YSgZ+GW4pqbA+IXmg8YxIw==
X-ME-Sender: <xms:Y2DMYhEn19DkI99Ckg-EBxvh6NpyC2yQ99d-sr4nRtRY88CgY3VBjg>
 <xme:Y2DMYmUEV0JISU-9hlYKBCdKoUZika5M1EGsb4rZxfgxF1ShmdcouCtWTcVvXvQ0m
 hoEuKR2YgUEQWCRiYk>
X-ME-Received: <xmr:Y2DMYjL1ewfghx3EVAswTAP5FEokpgo87AvoBfLqfcDQAavRykOVzlDt06pjBkp9TGchPZb9Klk-j9ev8MGEE8kjOmL-eBiW9OsrFfc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Y2DMYnG-DTlk6_-cyxA7d8BihJ3Sx7QhjwOhSgUbeoGTurGl8EEXpw>
 <xmx:Y2DMYnVgY270Vj2EwLY216jiVIS2wZEP7r0TYsh7uy1M3E646roVkg>
 <xmx:Y2DMYiPMuyv1DugvZHebROqQwrRst7p1ktKwERZNysCe_WeU4XFq-w>
 <xmx:Y2DMYtz95JCftFQNBfumn3z6LLbkYhOkHvA1033BuXR1wwRYZcJvWQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:39:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 02/69] drm/crtc: Introduce drmm_crtc_init_with_planes
Date: Mon, 11 Jul 2022 19:38:32 +0200
Message-Id: <20220711173939.1132294-3-maxime@cerno.tech>
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
 drivers/gpu/drm/drm_crtc.c | 94 +++++++++++++++++++++++++++++++++-----
 include/drm/drm_crtc.h     |  9 ++++
 2 files changed, 91 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index cad2a7e5166f..df9bf3c9206e 100644
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
@@ -370,14 +371,88 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
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
 
+__printf(6, 0)
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
@@ -400,17 +475,12 @@ void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
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

