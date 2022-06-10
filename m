Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D054621F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B926F112808;
	Fri, 10 Jun 2022 09:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAA0112808
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:32 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 484975C01AE;
 Fri, 10 Jun 2022 05:29:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853372; x=1654939772; bh=3Z
 eK4SgqMe46ICtVrDBQ/sCCxxBtU5YbkfZj6crEBy4=; b=MqNm+OaFy3Zu4qcQFY
 0kx2WCdKxMK87v8hEABrPLaLT9vVMnaSSHTruUdsFgej2o3W66VZQoTHNMwzzpKa
 G1MFctEqjjgyIHDJvVG6sb46fnwrObEXGus5scs2eSXSMjgmcVoTcn1j9JDtUcoI
 Mf36V4sbiIUziYF6Xx1xpglxo7Gl3YY6ozfB8scXIw3leocL8lU6LFyX0jfrxGj+
 9QJSDsv3RQxaGB6QdkYi2Y23q1omkyt2cRHBlPB//yKfNq2d+YQ6UYWJ520BVpXx
 nqABdkFkurIA+N1RPX+LW40qD+qJi9Kun/brEXcRKVHL1jzHJ5ul/18iQRex+LQ3
 4VyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853372; x=1654939772; bh=3ZeK4SgqMe46I
 CtVrDBQ/sCCxxBtU5YbkfZj6crEBy4=; b=b5gvBY+jpk2TUpb4aiIuj2xHVnjik
 dyng72HIgTIqe/jpPDjhlbAPOP5VIaKQpnpm0Qoct6e3T5xFI4+CkZiqUY90RXLV
 +Q9G2vAsN8VP5quedyX8Ex1koc4qTbWiNKnSEw1WY9yf1KyZlMFfljdu806nJPsG
 umB0xvQINbld6eC8CoHVhKSMlVmW8pQOQXKdn058GpED8tuyhSwf7LJoK3/56bEZ
 knhSRbSwWkdXPwUvcdgRDZCXnwMg3z0FM+mIApqkDhEQCPonkbGlLjvAp7zCyUoV
 GhAjAjEGMIhBj59gkEXYE0UbHDhb1yBsYC1zFYwLsrB0NDxsIrOppIIvw==
X-ME-Sender: <xms:_A6jYnFSYCaZNNOQh-HQ-9a5hifbf23ENVvqn5uJr7AV7B5tBn-hhQ>
 <xme:_A6jYkW8Nid3DcZ9qgHwLoBSuX7oH32tBG4SXwsbtyAY5UkL76u3FzBrvscXgBu8a
 J30f3Btzsn98o6WsGg>
X-ME-Received: <xmr:_A6jYpJ_cDxxPoFtanQ7hIyXbBk_uF0RiUtXNFxMgZslRgvyMDPq84QTnxYK5byP3rjoya2ZnU5fk2FFRGgxegtOpyRG2olxpttyd_M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_A6jYlHp_knBSBGPV31fwxN4EXlEksis7x4QekF7mfmOOymoPd_5Dg>
 <xmx:_A6jYtXhFxjwNHtU_CwBfS2ybN17NMyHTt39idhdpU8H5Skn9ARmiw>
 <xmx:_A6jYgMiUx4ZXTclY670WLR7PZAQWFhatQ-uGhaLMwlwwQ4F0NKw3w>
 <xmx:_A6jYjx6IalBwiBfxyM-R-aWWiKgroyRgzCgI8FSYFQT-VJhLI_iYA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
Date: Fri, 10 Jun 2022 11:28:22 +0200
Message-Id: <20220610092924.754942-3-maxime@cerno.tech>
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
 drivers/gpu/drm/drm_crtc.c | 70 ++++++++++++++++++++++++++++++++++++--
 include/drm/drm_crtc.h     |  6 ++++
 2 files changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 26a77a735905..fd986a7dd4ad 100644
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
@@ -368,6 +369,69 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_init_with_planes);
 
+static void drmm_crtc_init_with_planes_cleanup(struct drm_device *dev,
+					       void *ptr)
+{
+	struct drm_crtc *crtc = ptr;
+
+	drm_crtc_cleanup(crtc);
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
 static void drmm_crtc_alloc_with_planes_cleanup(struct drm_device *dev,
 						void *ptr)
 {
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

