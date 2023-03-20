Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A76C16AA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6975910E2B5;
	Mon, 20 Mar 2023 15:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E224110E1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:07:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8AD491F896;
 Mon, 20 Mar 2023 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679324875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3zTQT1jnVYYBAbmkb0Rkl2KItyUgFua+RzCRC5T03c=;
 b=XpwmmeLyBFyzcjutEs167xloQYQeWM7LW9Qapq3Qb08D+99dnXXOIE9w5w7x6LEUfewZkT
 /gzSOf5tkthm9/qDbSdJzT+qrZDCBzPOqAvyL4Tsc9ZCyiyxrfX7ApwcPEWwaPCtFDmK5V
 qodE+lLFesSfqVKsP4ubwqLHHuo9spE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679324875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3zTQT1jnVYYBAbmkb0Rkl2KItyUgFua+RzCRC5T03c=;
 b=aJEYUpRRaiTiSe21D8K3jx5oSAf78qbfBFlAyphYtlFD/oQc09Bo8I/6iOIT3TZubN0zXR
 xNkk3BLHxdWcGmBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FD3513A00;
 Mon, 20 Mar 2023 15:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YKpvEst2GGTXOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 15:07:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH v2 8/8] drm/fbdev-generic: Rename symbols
Date: Mon, 20 Mar 2023 16:07:51 +0100
Message-Id: <20230320150751.20399-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230320150751.20399-1-tzimmermann@suse.de>
References: <20230320150751.20399-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename symbols to match the style of other fbdev-emulation source
code. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 66 ++++++++++++++---------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index e7eeba0c44b4..8e5148bf40bb 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -13,7 +13,7 @@
 #include <drm/drm_fbdev_generic.h>
 
 /* @user: 1=userspace, 0=fbcon */
-static int drm_fbdev_fb_open(struct fb_info *info, int user)
+static int drm_fbdev_generic_fb_open(struct fb_info *info, int user)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 
@@ -24,7 +24,7 @@ static int drm_fbdev_fb_open(struct fb_info *info, int user)
 	return 0;
 }
 
-static int drm_fbdev_fb_release(struct fb_info *info, int user)
+static int drm_fbdev_generic_fb_release(struct fb_info *info, int user)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 
@@ -34,7 +34,7 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
 	return 0;
 }
 
-static void drm_fbdev_fb_destroy(struct fb_info *info)
+static void drm_fbdev_generic_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 	void *shadow = info->screen_buffer;
@@ -52,10 +52,10 @@ static void drm_fbdev_fb_destroy(struct fb_info *info)
 	kfree(fb_helper);
 }
 
-static const struct fb_ops drm_fbdev_fb_ops = {
+static const struct fb_ops drm_fbdev_generic_fb_ops = {
 	.owner		= THIS_MODULE,
-	.fb_open	= drm_fbdev_fb_open,
-	.fb_release	= drm_fbdev_fb_release,
+	.fb_open	= drm_fbdev_generic_fb_open,
+	.fb_release	= drm_fbdev_generic_fb_release,
 	.fb_read	= drm_fb_helper_sys_read,
 	.fb_write	= drm_fb_helper_sys_write,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -63,14 +63,14 @@ static const struct fb_ops drm_fbdev_fb_ops = {
 	.fb_copyarea	= drm_fb_helper_sys_copyarea,
 	.fb_imageblit	= drm_fb_helper_sys_imageblit,
 	.fb_mmap	= fb_deferred_io_mmap,
-	.fb_destroy	= drm_fbdev_fb_destroy,
+	.fb_destroy	= drm_fbdev_generic_fb_destroy,
 };
 
 /*
  * This function uses the client API to create a framebuffer backed by a dumb buffer.
  */
-static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
-			      struct drm_fb_helper_surface_size *sizes)
+static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
+					     struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
@@ -109,7 +109,7 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
-	info->fbops = &drm_fbdev_fb_ops;
+	info->fbops = &drm_fbdev_generic_fb_ops;
 	info->flags = FBINFO_DEFAULT;
 
 	/* screen */
@@ -140,9 +140,9 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
-static void drm_fbdev_damage_blit_real(struct drm_fb_helper *fb_helper,
-				       struct drm_clip_rect *clip,
-				       struct iosys_map *dst)
+static void drm_fbdev_generic_damage_blit_real(struct drm_fb_helper *fb_helper,
+					       struct drm_clip_rect *clip,
+					       struct iosys_map *dst)
 {
 	struct drm_framebuffer *fb = fb_helper->fb;
 	size_t offset = clip->y1 * fb->pitches[0];
@@ -179,8 +179,8 @@ static void drm_fbdev_damage_blit_real(struct drm_fb_helper *fb_helper,
 	}
 }
 
-static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
-				 struct drm_clip_rect *clip)
+static int drm_fbdev_generic_damage_blit(struct drm_fb_helper *fb_helper,
+					 struct drm_clip_rect *clip)
 {
 	struct drm_client_buffer *buffer = fb_helper->buffer;
 	struct iosys_map map, dst;
@@ -204,7 +204,7 @@ static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
 		goto out;
 
 	dst = map;
-	drm_fbdev_damage_blit_real(fb_helper, clip, &dst);
+	drm_fbdev_generic_damage_blit_real(fb_helper, clip, &dst);
 
 	drm_client_buffer_vunmap(buffer);
 
@@ -214,7 +214,8 @@ static int drm_fbdev_damage_blit(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
-static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
+static int drm_fbdev_generic_helper_fb_dirty(struct drm_fb_helper *helper,
+					     struct drm_clip_rect *clip)
 {
 	struct drm_device *dev = helper->dev;
 	int ret;
@@ -223,7 +224,7 @@ static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect
 	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
 		return 0;
 
-	ret = drm_fbdev_damage_blit(helper, clip);
+	ret = drm_fbdev_generic_damage_blit(helper, clip);
 	if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
 		return ret;
 
@@ -236,12 +237,12 @@ static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect
 	return 0;
 }
 
-static const struct drm_fb_helper_funcs drm_fb_helper_generic_funcs = {
-	.fb_probe = drm_fbdev_fb_probe,
-	.fb_dirty = drm_fbdev_fb_dirty,
+static const struct drm_fb_helper_funcs drm_fbdev_generic_helper_funcs = {
+	.fb_probe = drm_fbdev_generic_helper_fb_probe,
+	.fb_dirty = drm_fbdev_generic_helper_fb_dirty,
 };
 
-static void drm_fbdev_client_unregister(struct drm_client_dev *client)
+static void drm_fbdev_generic_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
@@ -254,14 +255,14 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
 	}
 }
 
-static int drm_fbdev_client_restore(struct drm_client_dev *client)
+static int drm_fbdev_generic_client_restore(struct drm_client_dev *client)
 {
 	drm_fb_helper_lastclose(client->dev);
 
 	return 0;
 }
 
-static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
+static int drm_fbdev_generic_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 	struct drm_device *dev = client->dev;
@@ -290,11 +291,11 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	return ret;
 }
 
-static const struct drm_client_funcs drm_fbdev_client_funcs = {
+static const struct drm_client_funcs drm_fbdev_generic_client_funcs = {
 	.owner		= THIS_MODULE,
-	.unregister	= drm_fbdev_client_unregister,
-	.restore	= drm_fbdev_client_restore,
-	.hotplug	= drm_fbdev_client_hotplug,
+	.unregister	= drm_fbdev_generic_client_unregister,
+	.restore	= drm_fbdev_generic_client_restore,
+	.hotplug	= drm_fbdev_generic_client_hotplug,
 };
 
 /**
@@ -320,8 +321,7 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
  *
  * The fbdev is destroyed by drm_dev_unregister().
  */
-void drm_fbdev_generic_setup(struct drm_device *dev,
-			     unsigned int preferred_bpp)
+void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 {
 	struct drm_fb_helper *fb_helper;
 	int ret;
@@ -332,15 +332,15 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
 	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
 	if (!fb_helper)
 		return;
-	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fb_helper_generic_funcs);
+	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_generic_helper_funcs);
 
-	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
+	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_generic_client_funcs);
 	if (ret) {
 		drm_err(dev, "Failed to register client: %d\n", ret);
 		goto err_drm_client_init;
 	}
 
-	ret = drm_fbdev_client_hotplug(&fb_helper->client);
+	ret = drm_fbdev_generic_client_hotplug(&fb_helper->client);
 	if (ret)
 		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
 
-- 
2.40.0

