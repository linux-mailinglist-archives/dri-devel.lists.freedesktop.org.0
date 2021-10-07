Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4E425C4C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7906F4F5;
	Thu,  7 Oct 2021 19:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E606F4E5;
 Thu,  7 Oct 2021 19:39:24 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 14A4E2B00A33;
 Thu,  7 Oct 2021 15:39:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 07 Oct 2021 15:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=JMRbRjZdc3Tdp
 VsyoSFWvoeRwxWybiBnYbFZhu98rTo=; b=ar69jEdWOUnJDV8rtAiAdLcMQ02v4
 Gd3IOjYY4K/eInZILTtfxpd0LbRwhLL4Qc3fAvnWdwKFxtAXzKDdUJgKf2TaqkZl
 Q/FBPLolzYfiO695DuoFL6GvuNJkDo6yUJbmunDESNa072RJXjInZ+AaC6PYa55M
 TkuPuhjgWK2TJRXdIx5RY0o99j9GAMPTqbgBwIy6es0RidmmWg6MfjnDHlOctBSs
 exA6p/+rkM4CPdzvxoUxUoqyJUO8boj+k2FkHTDDAGALk5ZYa0prfb5gxe1FoxDv
 viy/EB07mmTd9mmt2LATvjXQkHaT9wneJQ+wMcFCw825ol4eQIsEVfczg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=JMRbRjZdc3TdpVsyoSFWvoeRwxWybiBnYbFZhu98rTo=; b=ZU/GCIYu
 7LjIKL54SSVqLMnq8a9fpvzlnAvv/njfrr2s9Iv4yH12Omq98GW3ocapBObkS7Di
 2mlDdrkUmqfUg1MzrzUFo5jUEBoMcwLkWy9qgIATILDtIQsZISZdEXO58uUTm9d8
 GVaLvOswoaCURwtDR9AtaCTvVafrGPFt8ec4Z4iVLwLFSut/I8O/hzLx2MabmnoR
 Edjdzy02bHF0ZCMK35ofpGWYHPxNCJB7UXziifsDauKXjuSTcgHNQCCmlh7Nevkj
 Tvx9g18t+zJWqM3tA2ly5N3Oe4s27TXWdTwDFaZMlk4OdBh/SsJnbsiUhi6TG+35
 Y2cLapUlI+yi3w==
X-ME-Sender: <xms:6kxfYS6oKL6lt7FBkIZEOcN8jwO3DrrNP5LiDokipD6RaUgaZw4K_g>
 <xme:6kxfYb4Lx7QAwmktEkV70DSR0IIj8MDY3QSUpthBha4UQbe9qAHA36tt6rsmkU1s7
 9grYEz70vO3iXAOaQ>
X-ME-Received: <xmr:6kxfYRcM1VuN1cr7xaC2sVHGRqUOTpw2TKd1lEkVauZPfLYa1r-FNgzNOwROKBjtetT9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:6kxfYfI7qt4ZT5v-QbsygebVGqZ8iJ5raTHHus9njGGnjovGGbbS9g>
 <xmx:6kxfYWK2shthNztAl7QNMUrfUTFD9wCnnxJQHMsIdonJcyhWktP6BA>
 <xmx:6kxfYQxQMvpa9qC_Rti1_GcsCHzL48qdDdxv1hV_ho53TxYazCa9PQ>
 <xmx:6kxfYTU9buR390E-RIBMvLypk8xfjHKJODaCt6lqvI6eGnwRHiOe_il8LW4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:39:20 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 19/20] drm: cleanup: remove drm_modeset_(un)lock_all()
Date: Thu,  7 Oct 2021 21:37:54 +0200
Message-Id: <20211007193755.29579-20-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
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
index bf8a6e823a15..ac49bf6169a2 100644
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

