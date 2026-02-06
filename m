Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBVpGBbuhWnSIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE317FE33B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66D610E6E6;
	Fri,  6 Feb 2026 13:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WvRlgDpz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EGtvkqfj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WvRlgDpz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EGtvkqfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A00510E6E6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:35:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1FCC15BCCB;
 Fri,  6 Feb 2026 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CW0Pf0nQKxwYs+rEAw/1y0QYQcpJ6MDXe/a9G5zq0U8=;
 b=WvRlgDpzxD6Vfkrqpyp2M3riRYhBhOtOLXFbkR/xhOOkPV2w5c82NwsWEsAFq+9Gk36LlQ
 ayvwvmkFXX9JpmMHZyx/0q06EfSNX3a+zZcCc5ytKHH9Hwbvcu55Jxp/K5rztIf62HtovS
 0TJYomhjavV8tKVvUcBzL5NT8VjXtEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CW0Pf0nQKxwYs+rEAw/1y0QYQcpJ6MDXe/a9G5zq0U8=;
 b=EGtvkqfjRt63AWdIo+RGLvHmxqpZK0cnFJuggMtMEnihB9YmI/ynAwGTHDV1J+QyQ4owHH
 5YJ04s4qZPwJRYDg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WvRlgDpz;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EGtvkqfj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CW0Pf0nQKxwYs+rEAw/1y0QYQcpJ6MDXe/a9G5zq0U8=;
 b=WvRlgDpzxD6Vfkrqpyp2M3riRYhBhOtOLXFbkR/xhOOkPV2w5c82NwsWEsAFq+9Gk36LlQ
 ayvwvmkFXX9JpmMHZyx/0q06EfSNX3a+zZcCc5ytKHH9Hwbvcu55Jxp/K5rztIf62HtovS
 0TJYomhjavV8tKVvUcBzL5NT8VjXtEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CW0Pf0nQKxwYs+rEAw/1y0QYQcpJ6MDXe/a9G5zq0U8=;
 b=EGtvkqfjRt63AWdIo+RGLvHmxqpZK0cnFJuggMtMEnihB9YmI/ynAwGTHDV1J+QyQ4owHH
 5YJ04s4qZPwJRYDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D39243EA64;
 Fri,  6 Feb 2026 13:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sL1zMgbuhWnncwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Feb 2026 13:35:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm/gma500: fbdev: Calculate buffer geometry with format
 helpers
Date: Fri,  6 Feb 2026 14:21:56 +0100
Message-ID: <20260206133458.226467-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206133458.226467-1-tzimmermann@suse.de>
References: <20260206133458.226467-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.51
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: EE317FE33B
X-Rspamd-Action: no action

Replace the geometry and size calculation in gma500's fbdev emulation
with DRM format helpers. This consists of 4CC lookup from the fbdev
parameters, format loockup, pitch calculation and size calculation.
Then allocate the GEM buffer object for the framebuffer memory from
the calculated size.

As before, fallback to 16-bit colors if the stolen memory is insufficient
for 32-bit colors. But look at the result from psb_gem_create() instead
of guessing before the allocation. The new method is more reliable when
others allocate from stolen video memory (e.g., cursors).

Set up mode_cmd with the calculated values just before allocating the
framebuffer. This code will later be replaced with a DRM client buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c | 60 ++++++++++++++++------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index f5e60ada6de2..a93c3d2fe0ff 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -109,56 +109,52 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct fb_info *info = fb_helper->info;
+	u32 fourcc, pitch;
+	u64 size;
+	const struct drm_format_info *format;
 	struct drm_framebuffer *fb;
 	struct drm_mode_fb_cmd2 mode_cmd = { };
-	int size;
 	int ret;
 	struct psb_gem_object *backing;
 	struct drm_gem_object *obj;
-	u32 bpp, depth;
 
 	/* No 24-bit packed mode */
 	if (sizes->surface_bpp == 24) {
 		sizes->surface_bpp = 32;
 		sizes->surface_depth = 24;
 	}
-	bpp = sizes->surface_bpp;
-	depth = sizes->surface_depth;
 
-	/*
-	 * If the mode does not fit in 32 bit then switch to 16 bit to get
-	 * a console on full resolution. The X mode setting server will
-	 * allocate its own 32-bit GEM framebuffer.
-	 */
-	size = ALIGN(sizes->surface_width * DIV_ROUND_UP(bpp, 8), 64) *
-		     sizes->surface_height;
-	size = ALIGN(size, PAGE_SIZE);
+try_psb_gem_create:
+	fourcc = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	format = drm_get_format_info(dev, fourcc, DRM_FORMAT_MOD_LINEAR);
+	pitch = ALIGN(drm_format_info_min_pitch(format, 0, sizes->surface_width), SZ_64);
+	size = ALIGN(pitch * sizes->surface_height, PAGE_SIZE);
 
-	if (size > dev_priv->vram_stolen_size) {
-		sizes->surface_bpp = 16;
-		sizes->surface_depth = 16;
+	/* Allocate the framebuffer in the GTT with stolen page backing */
+	backing = psb_gem_create(dev, size, "fb", true, PAGE_SIZE);
+	if (IS_ERR(backing)) {
+		ret = PTR_ERR(backing);
+		if (ret == -EBUSY && sizes->surface_bpp > 16) {
+			/*
+			 * If the mode does not fit in 32 bit then switch to 16 bit to
+			 * get a console on full resolution. User-space compositors will
+			 * allocate their own 32-bit framebuffers.
+			 */
+			sizes->surface_bpp = 16;
+			sizes->surface_depth = 16;
+			goto try_psb_gem_create;
+		}
+		return ret;
 	}
-	bpp = sizes->surface_bpp;
-	depth = sizes->surface_depth;
+	obj = &backing->base;
 
 	mode_cmd.width = sizes->surface_width;
 	mode_cmd.height = sizes->surface_height;
-	mode_cmd.pitches[0] = ALIGN(mode_cmd.width * DIV_ROUND_UP(bpp, 8), 64);
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(bpp, depth);
-
-	size = mode_cmd.pitches[0] * mode_cmd.height;
-	size = ALIGN(size, PAGE_SIZE);
-
-	/* Allocate the framebuffer in the GTT with stolen page backing */
-	backing = psb_gem_create(dev, size, "fb", true, PAGE_SIZE);
-	if (IS_ERR(backing))
-		return PTR_ERR(backing);
-	obj = &backing->base;
+	mode_cmd.pixel_format = fourcc;
+	mode_cmd.pitches[0] = pitch;
+	mode_cmd.modifier[0] = DRM_FORMAT_MOD_LINEAR;
 
-	fb = psb_framebuffer_create(dev,
-				    drm_get_format_info(dev, mode_cmd.pixel_format,
-							mode_cmd.modifier[0]),
-				    &mode_cmd, obj);
+	fb = psb_framebuffer_create(dev, format, &mode_cmd, obj);
 	if (IS_ERR(fb)) {
 		ret = PTR_ERR(fb);
 		goto err_drm_gem_object_put;
-- 
2.52.0

