Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7411A6B851
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 10:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92AC10E777;
	Fri, 21 Mar 2025 09:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="wl62cvF7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fo9rUufp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wl62cvF7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fo9rUufp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1AE10E778
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:59:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C13731FB97;
 Fri, 21 Mar 2025 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742551115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjvmKwm15s7PTwQfCuO5OWysPJlAX7tyvL4Vs3tZwAI=;
 b=wl62cvF7GHhX28Lnw4O1wKWVM9LPc+Gcmyo6nhCTmrIcVUOFuzckLYqBoJscMn/pmRcA0t
 3Tv6E7JSsFQHTtEr1U3FgXQowXQHUBPf/SoCLnDz1VvJVj3jANK0wccXCY/6CpZ7jLTCD/
 UoC+s50DzGn82SbtfKBq2q4qJ4DVdLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742551115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjvmKwm15s7PTwQfCuO5OWysPJlAX7tyvL4Vs3tZwAI=;
 b=Fo9rUufpID+iLPqdJv6CgStn3QCZjqgrF1YyoYbFUpaG2Ax6U4ZjyOGFFippcuUZuVj8IE
 IacLau5KLqXYcaCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wl62cvF7;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Fo9rUufp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742551115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjvmKwm15s7PTwQfCuO5OWysPJlAX7tyvL4Vs3tZwAI=;
 b=wl62cvF7GHhX28Lnw4O1wKWVM9LPc+Gcmyo6nhCTmrIcVUOFuzckLYqBoJscMn/pmRcA0t
 3Tv6E7JSsFQHTtEr1U3FgXQowXQHUBPf/SoCLnDz1VvJVj3jANK0wccXCY/6CpZ7jLTCD/
 UoC+s50DzGn82SbtfKBq2q4qJ4DVdLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742551115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjvmKwm15s7PTwQfCuO5OWysPJlAX7tyvL4Vs3tZwAI=;
 b=Fo9rUufpID+iLPqdJv6CgStn3QCZjqgrF1YyoYbFUpaG2Ax6U4ZjyOGFFippcuUZuVj8IE
 IacLau5KLqXYcaCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77583139AA;
 Fri, 21 Mar 2025 09:58:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gH/fG0s43Wd9JAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 09:58:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v4 08/11] backlight: lcd: Replace fb events with a dedicated
 function call
Date: Fri, 21 Mar 2025 10:54:01 +0100
Message-ID: <20250321095517.313713-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250321095517.313713-1-tzimmermann@suse.de>
References: <20250321095517.313713-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C13731FB97
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 R_RATELIMIT(0.00)[to_ip_from(RLa7dkhshwamq1oe933z1pzp6m)];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Remove support for fb events from the lcd subsystem. Provide the
helper lcd_notify_blank_all() instead. In fbdev, call
lcd_notify_blank_all() to inform the lcd subsystem of changes
to a display's blank state.

Fbdev maintains a list of all installed notifiers. Instead of fbdev
notifiers, maintain an internal list of lcd devices.

v3:
- export lcd_notify_mode_change_all() (kernel test robot)
v2:
- maintain global list of lcd devices
- avoid IS_REACHABLE() in source file
- use lock guards
- initialize lcd list and list mutex

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/video/backlight/lcd.c    | 98 +++++++++-----------------------
 drivers/video/fbdev/core/fbmem.c | 39 +++++++++++--
 include/linux/lcd.h              | 21 ++++++-
 3 files changed, 79 insertions(+), 79 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index f57ff8bcc2fa..affe5c52471a 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -15,9 +15,11 @@
 #include <linux/notifier.h>
 #include <linux/ctype.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/slab.h>
 
+static DEFINE_MUTEX(lcd_dev_list_mutex);
+static LIST_HEAD(lcd_dev_list);
+
 static void lcd_notify_blank(struct lcd_device *ld, struct device *display_dev,
 			     int power)
 {
@@ -31,6 +33,17 @@ static void lcd_notify_blank(struct lcd_device *ld, struct device *display_dev,
 	ld->ops->set_power(ld, power);
 }
 
+void lcd_notify_blank_all(struct device *display_dev, int power)
+{
+	struct lcd_device *ld;
+
+	guard(mutex)(&lcd_dev_list_mutex);
+
+	list_for_each_entry(ld, &lcd_dev_list, entry)
+		lcd_notify_blank(ld, display_dev, power);
+}
+EXPORT_SYMBOL(lcd_notify_blank_all);
+
 static void lcd_notify_mode_change(struct lcd_device *ld, struct device *display_dev,
 				   unsigned int width, unsigned int height)
 {
@@ -44,75 +57,17 @@ static void lcd_notify_mode_change(struct lcd_device *ld, struct device *display
 	ld->ops->set_mode(ld, width, height);
 }
 
-#if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
-			   defined(CONFIG_LCD_CLASS_DEVICE_MODULE))
-static int to_lcd_power(int fb_blank)
+void lcd_notify_mode_change_all(struct device *display_dev,
+				unsigned int width, unsigned int height)
 {
-	switch (fb_blank) {
-	case FB_BLANK_UNBLANK:
-		return LCD_POWER_ON;
-	/* deprecated; TODO: should become 'off' */
-	case FB_BLANK_NORMAL:
-		return LCD_POWER_REDUCED;
-	case FB_BLANK_VSYNC_SUSPEND:
-		return LCD_POWER_REDUCED_VSYNC_SUSPEND;
-	/* 'off' */
-	case FB_BLANK_HSYNC_SUSPEND:
-	case FB_BLANK_POWERDOWN:
-	default:
-		return LCD_POWER_OFF;
-	}
-}
+	struct lcd_device *ld;
 
-/* This callback gets called when something important happens inside a
- * framebuffer driver. We're looking if that important event is blanking,
- * and if it is, we're switching lcd power as well ...
- */
-static int fb_notifier_callback(struct notifier_block *self,
-				 unsigned long event, void *data)
-{
-	struct lcd_device *ld = container_of(self, struct lcd_device, fb_notif);
-	struct fb_event *evdata = data;
-	struct fb_info *info = evdata->info;
-	struct lcd_device *fb_lcd = fb_lcd_device(info);
-
-	if (fb_lcd && fb_lcd != ld)
-		return 0;
-
-	if (event == FB_EVENT_BLANK) {
-		int power = to_lcd_power(*(int *)evdata->data);
-
-		lcd_notify_blank(ld, info->device, power);
-	} else {
-		const struct fb_videomode *videomode = evdata->data;
-
-		lcd_notify_mode_change(ld, info->device, videomode->xres, videomode->yres);
-	}
+	guard(mutex)(&lcd_dev_list_mutex);
 
-	return 0;
+	list_for_each_entry(ld, &lcd_dev_list, entry)
+		lcd_notify_mode_change(ld, display_dev, width, height);
 }
-
-static int lcd_register_fb(struct lcd_device *ld)
-{
-	memset(&ld->fb_notif, 0, sizeof(ld->fb_notif));
-	ld->fb_notif.notifier_call = fb_notifier_callback;
-	return fb_register_client(&ld->fb_notif);
-}
-
-static void lcd_unregister_fb(struct lcd_device *ld)
-{
-	fb_unregister_client(&ld->fb_notif);
-}
-#else
-static int lcd_register_fb(struct lcd_device *ld)
-{
-	return 0;
-}
-
-static inline void lcd_unregister_fb(struct lcd_device *ld)
-{
-}
-#endif /* CONFIG_FB */
+EXPORT_SYMBOL(lcd_notify_mode_change_all);
 
 static ssize_t lcd_power_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
@@ -263,11 +218,8 @@ struct lcd_device *lcd_device_register(const char *name, struct device *parent,
 		return ERR_PTR(rc);
 	}
 
-	rc = lcd_register_fb(new_ld);
-	if (rc) {
-		device_unregister(&new_ld->dev);
-		return ERR_PTR(rc);
-	}
+	guard(mutex)(&lcd_dev_list_mutex);
+	list_add(&new_ld->entry, &lcd_dev_list);
 
 	return new_ld;
 }
@@ -284,10 +236,12 @@ void lcd_device_unregister(struct lcd_device *ld)
 	if (!ld)
 		return;
 
+	guard(mutex)(&lcd_dev_list_mutex);
+	list_del(&ld->entry);
+
 	mutex_lock(&ld->ops_lock);
 	ld->ops = NULL;
 	mutex_unlock(&ld->ops_lock);
-	lcd_unregister_fb(ld);
 
 	device_unregister(&ld->dev);
 }
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index c931f270ac34..001662c606d7 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -15,6 +15,7 @@
 #include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/fbcon.h>
+#include <linux/lcd.h>
 
 #include <video/nomodeset.h>
 
@@ -220,6 +221,12 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
 	return err;
 }
 
+static void fb_lcd_notify_mode_change(struct fb_info *info,
+				      struct fb_videomode *mode)
+{
+	lcd_notify_mode_change_all(info->device, mode->xres, mode->yres);
+}
+
 int
 fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 {
@@ -227,7 +234,6 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 	u32 activate;
 	struct fb_var_screeninfo old_var;
 	struct fb_videomode mode;
-	struct fb_event event;
 	u32 unused;
 
 	if (var->activate & FB_ACTIVATE_INV_MODE) {
@@ -331,14 +337,38 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 	if (ret)
 		return ret;
 
-	event.info = info;
-	event.data = &mode;
-	fb_notifier_call_chain(FB_EVENT_MODE_CHANGE, &event);
+	fb_lcd_notify_mode_change(info, &mode);
 
 	return 0;
 }
 EXPORT_SYMBOL(fb_set_var);
 
+static void fb_lcd_notify_blank(struct fb_info *info)
+{
+	int power;
+
+	switch (info->blank) {
+	case FB_BLANK_UNBLANK:
+		power = LCD_POWER_ON;
+		break;
+	/* deprecated; TODO: should become 'off' */
+	case FB_BLANK_NORMAL:
+		power = LCD_POWER_REDUCED;
+		break;
+	case FB_BLANK_VSYNC_SUSPEND:
+		power = LCD_POWER_REDUCED_VSYNC_SUSPEND;
+		break;
+	/* 'off' */
+	case FB_BLANK_HSYNC_SUSPEND:
+	case FB_BLANK_POWERDOWN:
+	default:
+		power = LCD_POWER_OFF;
+		break;
+	}
+
+	lcd_notify_blank_all(info->device, power);
+}
+
 int fb_blank(struct fb_info *info, int blank)
 {
 	int old_blank = info->blank;
@@ -364,6 +394,7 @@ int fb_blank(struct fb_info *info, int blank)
 		goto err;
 
 	fb_bl_notify_blank(info, old_blank);
+	fb_lcd_notify_blank(info);
 
 	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index c3ccdff4519a..d4fa03722b72 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -11,7 +11,6 @@
 
 #include <linux/device.h>
 #include <linux/mutex.h>
-#include <linux/notifier.h>
 
 #define LCD_POWER_ON			(0)
 #define LCD_POWER_REDUCED		(1) // deprecated; don't use in new code
@@ -79,8 +78,11 @@ struct lcd_device {
 	const struct lcd_ops *ops;
 	/* Serialise access to set_power method */
 	struct mutex update_lock;
-	/* The framebuffer notifier block */
-	struct notifier_block fb_notif;
+
+	/**
+	 * @entry: List entry of all registered lcd devices
+	 */
+	struct list_head entry;
 
 	struct device dev;
 };
@@ -125,6 +127,19 @@ extern void lcd_device_unregister(struct lcd_device *ld);
 extern void devm_lcd_device_unregister(struct device *dev,
 	struct lcd_device *ld);
 
+#if IS_REACHABLE(CONFIG_LCD_CLASS_DEVICE)
+void lcd_notify_blank_all(struct device *display_dev, int power);
+void lcd_notify_mode_change_all(struct device *display_dev,
+				unsigned int width, unsigned int height);
+#else
+static inline void lcd_notify_blank_all(struct device *display_dev, int power)
+{}
+
+static inline void lcd_notify_mode_change_all(struct device *display_dev,
+					      unsigned int width, unsigned int height)
+{}
+#endif
+
 #define to_lcd_device(obj) container_of(obj, struct lcd_device, dev)
 
 static inline void * lcd_get_data(struct lcd_device *ld_dev)
-- 
2.48.1

