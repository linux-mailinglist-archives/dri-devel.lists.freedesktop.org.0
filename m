Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 037106A0871
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15ED10E0AD;
	Thu, 23 Feb 2023 12:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C421010EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:17:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21C855D621;
 Thu, 23 Feb 2023 12:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677154659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KfIdyPU1uH8YdNBK0BpEkjZ74Xfzdw2KposFv+N/1zQ=;
 b=O5/tEKQWafDgX4j76dF65//z+FGzIr5kWNHZCWp03Ka328G1OSSf/qD9DhBMKzJX4yrL7s
 APPgC2BUrz0XPOWKx7ceP+ZRwj3H4kLASarZKJQd9LEVrB9S5SugwNzmgkqGOvkr9aDnTM
 Kg1UanQbT8QHawJvx7iHAoIpKQMXMCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677154659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KfIdyPU1uH8YdNBK0BpEkjZ74Xfzdw2KposFv+N/1zQ=;
 b=TvtiCFIaP2yc24aeAbitFfppFmn7M/C9P3v8dbF+Xn4fFpBnTSr0EPEaiXGG4VbHUDk9Tv
 iecLRF5Xnsb40JAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00EA613928;
 Thu, 23 Feb 2023 12:17:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SA/SOmJZ92OhSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Feb 2023 12:17:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH 4/7] drm/gma500: Fix naming in fb_ops.
Date: Thu, 23 Feb 2023 13:17:30 +0100
Message-Id: <20230223121733.12549-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223121733.12549-1-tzimmermann@suse.de>
References: <20230223121733.12549-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix some names around struct fb_ops to better fit the overall naming
conventions. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 6885550f6815..2c511359a7c6 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -59,10 +59,10 @@ static const struct vm_operations_struct psb_fbdev_vm_ops = {
 
 #define CMAP_TOHW(_val, _width) ((((_val) << (_width)) + 0x7FFF - (_val)) >> 16)
 
-static int psbfb_setcolreg(unsigned int regno,
-			   unsigned int red, unsigned int green,
-			   unsigned int blue, unsigned int transp,
-			   struct fb_info *info)
+static int psb_fbdev_fb_setcolreg(unsigned int regno,
+				  unsigned int red, unsigned int green,
+				  unsigned int blue, unsigned int transp,
+				  struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_framebuffer *fb = fb_helper->fb;
@@ -99,7 +99,7 @@ static int psbfb_setcolreg(unsigned int regno,
 	return 0;
 }
 
-static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+static int psb_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_framebuffer *fb = fb_helper->fb;
@@ -121,16 +121,16 @@ static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return 0;
 }
 
-static const struct fb_ops psbfb_unaccel_ops = {
+static const struct fb_ops psb_fbdev_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_setcolreg = psbfb_setcolreg,
+	.fb_setcolreg = psb_fbdev_fb_setcolreg,
 	.fb_read = drm_fb_helper_cfb_read,
 	.fb_write = drm_fb_helper_cfb_write,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
-	.fb_mmap = psbfb_mmap,
+	.fb_mmap = psb_fbdev_fb_mmap,
 };
 
 /*
@@ -190,7 +190,7 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
 
 	fb_helper->fb = fb;
 
-	info->fbops = &psbfb_unaccel_ops;
+	info->fbops = &psb_fbdev_ops;
 
 	info->fix.smem_start = dev_priv->fb_base;
 	info->fix.smem_len = size;
-- 
2.39.2

