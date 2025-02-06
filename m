Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BC9A2ACAD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C5810E8A6;
	Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tHHBaBCn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EtETu2tL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tHHBaBCn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EtETu2tL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A78410E23C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:40:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A34691F397;
 Thu,  6 Feb 2025 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738856444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkRKfhGCu+O+pvIPPmAHUbgG/tWWQRPaR8J6kROTrAU=;
 b=tHHBaBCnCnJGQCeHz5htZmAkTxXnWTN+MhXidMp5CRH0HKou2ERQY7Jm8X2VO1UrFP9Anl
 FyfEygh4cmHSImJKFpjRsP3BHTAacs2ZIyac+TiH3IHP9R4+ruWIGHM0o5sAZmF/WvPtDy
 hlkF9d0Ax598aUxy7bciwtFZhgwzyAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738856444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkRKfhGCu+O+pvIPPmAHUbgG/tWWQRPaR8J6kROTrAU=;
 b=EtETu2tLUACZUSJDIdcRPMHjos2ViYOWPlgtk8srGTgsDTjfB3yiGO81V/Mi3n3xLLxQnQ
 VJq2Q1p/xs3+BXDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738856444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkRKfhGCu+O+pvIPPmAHUbgG/tWWQRPaR8J6kROTrAU=;
 b=tHHBaBCnCnJGQCeHz5htZmAkTxXnWTN+MhXidMp5CRH0HKou2ERQY7Jm8X2VO1UrFP9Anl
 FyfEygh4cmHSImJKFpjRsP3BHTAacs2ZIyac+TiH3IHP9R4+ruWIGHM0o5sAZmF/WvPtDy
 hlkF9d0Ax598aUxy7bciwtFZhgwzyAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738856444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkRKfhGCu+O+pvIPPmAHUbgG/tWWQRPaR8J6kROTrAU=;
 b=EtETu2tLUACZUSJDIdcRPMHjos2ViYOWPlgtk8srGTgsDTjfB3yiGO81V/Mi3n3xLLxQnQ
 VJq2Q1p/xs3+BXDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6228113697;
 Thu,  6 Feb 2025 15:40:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MBjEFvzXpGf4PAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: pavel@ucw.cz, lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/13] fbdev: Track display blanking state
Date: Thu,  6 Feb 2025 16:30:21 +0100
Message-ID: <20250206154033.697495-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206154033.697495-1-tzimmermann@suse.de>
References: <20250206154033.697495-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ucw.cz,kernel.org,gmail.com,gmx.de,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
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

Store the display's blank status in struct fb_info.blank and track
it in fb_blank(). As an extra, the status is now available from the
sysfs blank attribute.

Support for blanking is optional. Therefore framebuffer_alloc()
initializes the state to FB_BLANK_UNBLANK (i.e., the display is
on). If the fb_blank callback has been set, register_framebuffer()
sets the state to FB_BLANK_POWERDOWN. On the first modeset, the
call to fb_blank() will update it to _UNBLANK. This is important,
as listeners to FB_EVENT_BLANK will now see the display being
switched on.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_info.c |  1 +
 drivers/video/fbdev/core/fbmem.c   | 17 ++++++++++++++++-
 drivers/video/fbdev/core/fbsysfs.c |  8 ++++----
 include/linux/fb.h                 |  2 ++
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_info.c b/drivers/video/fbdev/core/fb_info.c
index 4847ebe50d7d..52f9bd2c5417 100644
--- a/drivers/video/fbdev/core/fb_info.c
+++ b/drivers/video/fbdev/core/fb_info.c
@@ -42,6 +42,7 @@ struct fb_info *framebuffer_alloc(size_t size, struct device *dev)
 
 	info->device = dev;
 	info->fbcon_rotate_hint = -1;
+	info->blank = FB_BLANK_UNBLANK;
 
 #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
 	mutex_init(&info->bl_curve_mutex);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 39e2b81473ad..f34a80c7fc3a 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -341,6 +341,7 @@ EXPORT_SYMBOL(fb_set_var);
 
 int fb_blank(struct fb_info *info, int blank)
 {
+	int old_blank = info->blank;
 	struct fb_event event;
 	int ret;
 
@@ -353,13 +354,19 @@ int fb_blank(struct fb_info *info, int blank)
 	event.info = info;
 	event.data = &blank;
 
+	info->blank = blank;
+
 	ret = info->fbops->fb_blank(blank, info);
 	if (ret)
-		return ret;
+		goto err;
 
 	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
 	return 0;
+
+err:
+	info->blank = old_blank;
+	return ret;
 }
 EXPORT_SYMBOL(fb_blank);
 
@@ -408,6 +415,14 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 	mutex_init(&fb_info->lock);
 	mutex_init(&fb_info->mm_lock);
 
+	/*
+	 * With an fb_blank callback present, we assume that the
+	 * display blank, so that fb_blank() enables it on the first
+	 * modeset.
+	 */
+	if (fb_info->fbops->fb_blank)
+		fb_info->blank = FB_BLANK_POWERDOWN;
+
 	fb_device_create(fb_info);
 
 	if (fb_info->pixmap.addr == NULL) {
diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 1b3c9958ef5c..e337660bce46 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -242,11 +242,11 @@ static ssize_t store_blank(struct device *device,
 	return count;
 }
 
-static ssize_t show_blank(struct device *device,
-			  struct device_attribute *attr, char *buf)
+static ssize_t show_blank(struct device *device, struct device_attribute *attr, char *buf)
 {
-//	struct fb_info *fb_info = dev_get_drvdata(device);
-	return 0;
+	struct fb_info *fb_info = dev_get_drvdata(device);
+
+	return sysfs_emit(buf, "%d\n", fb_info->blank);
 }
 
 static ssize_t store_console(struct device *device,
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 5ba187e08cf7..f41d3334ac23 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -471,6 +471,8 @@ struct fb_info {
 	struct list_head modelist;      /* mode list */
 	struct fb_videomode *mode;	/* current mode */
 
+	int blank; /* current blanking; see FB_BLANK_ constants */
+
 #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
 	/* assigned backlight device */
 	/* set before framebuffer registration,
-- 
2.48.1

