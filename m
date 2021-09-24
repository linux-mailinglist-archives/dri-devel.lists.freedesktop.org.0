Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46EF416C27
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBF66EE0E;
	Fri, 24 Sep 2021 06:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ABB6EDF5;
 Fri, 24 Sep 2021 06:50:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B396058107F;
 Fri, 24 Sep 2021 02:44:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Sep 2021 02:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=xpHw3dVyitCss
 wUBuUby/MBpmwaRe7OGtFviC33KSf0=; b=Obavd4dRrAcTjE8izX7By+AWxmPWR
 sd95TNPTS45RoGX2YsI6pu4O4eW+14r+bNIq8ZgKpBqUqTDAV0DNIGCyKbPvEdxN
 J6K9f9vY4rVSQxDd3wds8VBLr3f4qAL9wxCnNByKNcMwVG0LvZD46WP/yexfLSPg
 ++HlaWjxBFjjwfkmKQ7sA0Lx014/SIZ0pauKFc1avmVyx46sMPBgwnv3SeYGfZ6d
 3rY8SirosES4grZEVNbqh72rh3StVe580etPIsMqQWkQLB96NpWCcVz65r+S0TIb
 k2birgSYUEA/bBuPeaIaZJ+3DQuk0DM6BKPdEGMf4lQhyYBCKW8NkTpqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xpHw3dVyitCsswUBuUby/MBpmwaRe7OGtFviC33KSf0=; b=KKbu+FcI
 qy/KmSy9fpXR+JUQxncRr4s1/ih7MSXWTbtu500gdkxQiDPlwjTrlHdz11R6N2wn
 Nhj9yoDh1V0R98KNMbTp1A87y7DmgBihS9wo1h6vpy2kTfoEItzIrVJkeniPP+zH
 i3XeJ4NPH/IZPHrdjuANggPDMppckBJMSZncjHm/h+S3USAeuJz9sorE1ITiAzNq
 3aOOiJdY3c6N9kWWbIcdKhhm918XQ0MOT32MW1lX6K1d4lN+Xkoz0ocy1MB4W2kE
 PVQloOsYAFF+A4ygMGzaBTK3vOP+rc8rEAwU934oNsuSpFY0eexZhIDkhReQ0IfH
 R2JQsOheFX8iWQ==
X-ME-Sender: <xms:w3NNYZbKJPz8mzYSYBvo7-ZTV7oWimulnFe3_tK5DJ9ieqwT_JG3_A>
 <xme:w3NNYQYi64eIHF3wC_E-jGWVmViv_V5baeELplOZ2e73MjqzouM2lCwOHdorxcPiR
 x0vsNq2BkUkggQR_g>
X-ME-Received: <xmr:w3NNYb84l6iRJJ1CLp7rGSgpsZINnndDrJ-wdK1j7hxSHFtIvIDQmOU7lkkKYDZtHU1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:w3NNYXovVtyZ4y8LR8CM83Egi624L2YfqgXJcGIh9NRrw6lr7CjPtA>
 <xmx:w3NNYUqXFQw70sypI0sfdCMfqG6_H8e3cUv00thuYY166VyinySyVA>
 <xmx:w3NNYdSCPLBQuCh2cmc9VY-_vdwfp7XQ_WPVKb-RjXW5o7xdkGcw8w>
 <xmx:w3NNYb0inv4xpxoiFdX9SibNlPZstkWhkvwsUYFGd9DHyK5xBAg2iA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:44:16 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 16/17] drm: cleanup: remove drm_modeset_(un)lock_all()
Date: Fri, 24 Sep 2021 08:43:23 +0200
Message-Id: <20210924064324.229457-17-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
References: <20210924064324.229457-1-greenfoo@u92.eu>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Functions drm_modeset_lock_all() and drm_modeset_unlock_all() are no
longer used anywhere and can be removed.

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/drm_modeset_lock.c | 94 +-----------------------------
 include/drm/drm_modeset_lock.h     |  2 -
 2 files changed, 3 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index fcfe1a03c4a1..afd1351749a5 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -77,93 +77,6 @@
 
 static DEFINE_WW_CLASS(crtc_ww_class);
 
-/**
- * drm_modeset_lock_all - take all modeset locks
- * @dev: DRM device
- *
- * This function takes all modeset locks, suitable where a more fine-grained
- * scheme isn't (yet) implemented. Locks must be dropped by calling the
- * drm_modeset_unlock_all() function.
- *
- * This function is deprecated. It allocates a lock acquisition context and
- * stores it in &drm_device.mode_config. This facilitate conversion of
- * existing code because it removes the need to manually deal with the
- * acquisition context, but it is also brittle because the context is global
- * and care must be taken not to nest calls. New code should use the
- * drm_modeset_lock_all_ctx() function and pass in the context explicitly.
- */
-void drm_modeset_lock_all(struct drm_device *dev)
-{
-	struct drm_mode_config *config = &dev->mode_config;
-	struct drm_modeset_acquire_ctx *ctx;
-	int ret;
-
-	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL | __GFP_NOFAIL);
-	if (WARN_ON(!ctx))
-		return;
-
-	mutex_lock(&config->mutex);
-
-	drm_modeset_acquire_init(ctx, 0);
-
-retry:
-	ret = drm_modeset_lock_all_ctx(dev, ctx);
-	if (ret < 0) {
-		if (ret == -EDEADLK) {
-			drm_modeset_backoff(ctx);
-			goto retry;
-		}
-
-		drm_modeset_acquire_fini(ctx);
-		kfree(ctx);
-		return;
-	}
-	ww_acquire_done(&ctx->ww_ctx);
-
-	WARN_ON(config->acquire_ctx);
-
-	/*
-	 * We hold the locks now, so it is safe to stash the acquisition
-	 * context for drm_modeset_unlock_all().
-	 */
-	config->acquire_ctx = ctx;
-
-	drm_warn_on_modeset_not_all_locked(dev);
-}
-EXPORT_SYMBOL(drm_modeset_lock_all);
-
-/**
- * drm_modeset_unlock_all - drop all modeset locks
- * @dev: DRM device
- *
- * This function drops all modeset locks taken by a previous call to the
- * drm_modeset_lock_all() function.
- *
- * This function is deprecated. It uses the lock acquisition context stored
- * in &drm_device.mode_config. This facilitates conversion of existing
- * code because it removes the need to manually deal with the acquisition
- * context, but it is also brittle because the context is global and care must
- * be taken not to nest calls. New code should pass the acquisition context
- * directly to the drm_modeset_drop_locks() function.
- */
-void drm_modeset_unlock_all(struct drm_device *dev)
-{
-	struct drm_mode_config *config = &dev->mode_config;
-	struct drm_modeset_acquire_ctx *ctx = config->acquire_ctx;
-
-	if (WARN_ON(!ctx))
-		return;
-
-	config->acquire_ctx = NULL;
-	drm_modeset_drop_locks(ctx);
-	drm_modeset_acquire_fini(ctx);
-
-	kfree(ctx);
-
-	mutex_unlock(&dev->mode_config.mutex);
-}
-EXPORT_SYMBOL(drm_modeset_unlock_all);
-
 /**
  * drm_warn_on_modeset_not_all_locked - check that all modeset locks are locked
  * @dev: device
@@ -380,10 +293,9 @@ EXPORT_SYMBOL(drm_modeset_unlock);
  * This function takes all modeset locks, suitable where a more fine-grained
  * scheme isn't (yet) implemented.
  *
- * Unlike drm_modeset_lock_all(), it doesn't take the &drm_mode_config.mutex
- * since that lock isn't required for modeset state changes. Callers which
- * need to grab that lock too need to do so outside of the acquire context
- * @ctx.
+ * It doesn't take the &drm_mode_config.mutex since that lock isn't required for
+ * modeset state changes. Callers which need to grab that lock too need to do so
+ * outside of the acquire context @ctx.
  *
  * Locks acquired with this function should be released by calling the
  * drm_modeset_drop_locks() function on @ctx.
diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
index aafd07388eb7..865e64bcc4cb 100644
--- a/include/drm/drm_modeset_lock.h
+++ b/include/drm/drm_modeset_lock.h
@@ -132,8 +132,6 @@ struct drm_device;
 struct drm_crtc;
 struct drm_plane;
 
-void drm_modeset_lock_all(struct drm_device *dev);
-void drm_modeset_unlock_all(struct drm_device *dev);
 void drm_warn_on_modeset_not_all_locked(struct drm_device *dev);
 
 int drm_modeset_lock_all_ctx(struct drm_device *dev,
-- 
2.33.0

