Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB64A54D2D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C66C10E9AC;
	Thu,  6 Mar 2025 14:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zOEbLJ4O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qgE38FWh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zOEbLJ4O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qgE38FWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C8510E9AC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:13:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6BF67211C9;
 Thu,  6 Mar 2025 14:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741270391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+UOmYI8pYAdTADicoEBuV9yRTh+o0PMIQLD2KUkth4=;
 b=zOEbLJ4OMrO1cNs5F4tmEFGYqH5SF5/uzldaJir4pmCY969r91RLnXE6+WiW4e7R5U+qC4
 IgWo9EJzTpZ0pASG94XQjypL0fbs0xP61BnECu+Hlr6LwCNWUUgEo8Nvo+f26oDgwnANDr
 tyAp3qzJNLROAyXdukA6B+9H8xD5vxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741270391;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+UOmYI8pYAdTADicoEBuV9yRTh+o0PMIQLD2KUkth4=;
 b=qgE38FWhJPasQUuMT5dUoV3FC7EDOnErlnF9u1idpXZS58eWvKpd77PEjW6gv6dB6Dn/W4
 OdgGdRE6hurturAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741270391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+UOmYI8pYAdTADicoEBuV9yRTh+o0PMIQLD2KUkth4=;
 b=zOEbLJ4OMrO1cNs5F4tmEFGYqH5SF5/uzldaJir4pmCY969r91RLnXE6+WiW4e7R5U+qC4
 IgWo9EJzTpZ0pASG94XQjypL0fbs0xP61BnECu+Hlr6LwCNWUUgEo8Nvo+f26oDgwnANDr
 tyAp3qzJNLROAyXdukA6B+9H8xD5vxU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741270391;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+UOmYI8pYAdTADicoEBuV9yRTh+o0PMIQLD2KUkth4=;
 b=qgE38FWhJPasQUuMT5dUoV3FC7EDOnErlnF9u1idpXZS58eWvKpd77PEjW6gv6dB6Dn/W4
 OdgGdRE6hurturAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25C7713676;
 Thu,  6 Mar 2025 14:13:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2IfyB3etyWeveQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Mar 2025 14:13:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 06/11] backlight: Replace fb events with a dedicated
 function call
Date: Thu,  6 Mar 2025 15:05:48 +0100
Message-ID: <20250306140947.580324-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306140947.580324-1-tzimmermann@suse.de>
References: <20250306140947.580324-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
X-Spam-Flag: NO
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

Remove support for fb events from backlight subsystem. Provide the
helper backlight_notify_blank_all() instead. Also export the existing
helper backlight_notify_blank() to update a single backlight device.

In fbdev, call either helper to inform the backlight subsystem of
changes to a display's blank state. If the framebuffer device has a
specific backlight, only update this one; otherwise update all.

v3:
- declare empty fb_bl_notify_blank() as static inline (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/backlight.c     | 85 ++++---------------------
 drivers/video/fbdev/core/fb_backlight.c | 12 ++++
 drivers/video/fbdev/core/fbmem.c        |  2 +
 include/linux/backlight.h               | 12 ++--
 include/linux/fb.h                      |  4 ++
 5 files changed, 36 insertions(+), 79 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 1c43f579396f..9dc93c5e480b 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -15,7 +15,6 @@
 #include <linux/notifier.h>
 #include <linux/ctype.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/slab.h>
 
 #ifdef CONFIG_PMAC_BACKLIGHT
@@ -57,10 +56,10 @@
  * a hot-key to adjust backlight, the driver must notify the backlight
  * core that brightness has changed using backlight_force_update().
  *
- * The backlight driver core receives notifications from fbdev and
- * if the event is FB_EVENT_BLANK and if the value of blank, from the
- * FBIOBLANK ioctrl, results in a change in the backlight state the
- * update_status() operation is called.
+ * Display drives can control the backlight device's status using
+ * backlight_notify_blank() and backlight_notify_blank_all(). If this
+ * results in a change in the backlight state the functions call the
+ * update_status() operation.
  */
 
 static struct list_head backlight_dev_list;
@@ -78,11 +77,8 @@ static const char *const backlight_scale_types[] = {
 	[BACKLIGHT_SCALE_NON_LINEAR]	= "non-linear",
 };
 
-#if defined(CONFIG_FB_CORE) || (defined(CONFIG_FB_CORE_MODULE) && \
-				defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
-static void backlight_notify_blank(struct backlight_device *bd,
-				   struct device *display_dev,
-				   bool fb_on, bool prev_fb_on)
+void backlight_notify_blank(struct backlight_device *bd, struct device *display_dev,
+			    bool fb_on, bool prev_fb_on)
 {
 	guard(mutex)(&bd->ops_lock);
 
@@ -103,68 +99,18 @@ static void backlight_notify_blank(struct backlight_device *bd,
 		}
 	}
 }
+EXPORT_SYMBOL(backlight_notify_blank);
 
-/*
- * fb_notifier_callback
- *
- * This callback gets called when something important happens inside a
- * framebuffer driver. The backlight core only cares about FB_BLANK_UNBLANK
- * which is reported to the driver using backlight_update_status()
- * as a state change.
- *
- * There may be several fbdev's connected to the backlight device,
- * in which case they are kept track of. A state change is only reported
- * if there is a change in backlight for the specified fbdev.
- */
-static int fb_notifier_callback(struct notifier_block *self,
-				unsigned long event, void *data)
+void backlight_notify_blank_all(struct device *display_dev, bool fb_on, bool prev_fb_on)
 {
 	struct backlight_device *bd;
-	struct fb_event *evdata = data;
-	struct fb_info *info = evdata->info;
-	const int *fb_blank = evdata->data;
-	struct backlight_device *fb_bd = fb_bl_device(info);
-	bool fb_on, prev_fb_on;
-
-	/* If we aren't interested in this event, skip it immediately ... */
-	if (event != FB_EVENT_BLANK)
-		return 0;
-
-	bd = container_of(self, struct backlight_device, fb_notif);
-
-	if (fb_bd && fb_bd != bd)
-		return 0;
-
-	fb_on = fb_blank[0] == FB_BLANK_UNBLANK;
-	prev_fb_on = fb_blank[1] == FB_BLANK_UNBLANK;
-
-	backlight_notify_blank(bd, info->device, fb_on, prev_fb_on);
-
-	return 0;
-}
-
-static int backlight_register_fb(struct backlight_device *bd)
-{
-	memset(&bd->fb_notif, 0, sizeof(bd->fb_notif));
-	bd->fb_notif.notifier_call = fb_notifier_callback;
 
-	return fb_register_client(&bd->fb_notif);
-}
+	guard(mutex)(&backlight_dev_list_mutex);
 
-static void backlight_unregister_fb(struct backlight_device *bd)
-{
-	fb_unregister_client(&bd->fb_notif);
-}
-#else
-static inline int backlight_register_fb(struct backlight_device *bd)
-{
-	return 0;
+	list_for_each_entry(bd, &backlight_dev_list, entry)
+		backlight_notify_blank(bd, display_dev, fb_on, prev_fb_on);
 }
-
-static inline void backlight_unregister_fb(struct backlight_device *bd)
-{
-}
-#endif /* CONFIG_FB_CORE */
+EXPORT_SYMBOL(backlight_notify_blank_all);
 
 static void backlight_generate_event(struct backlight_device *bd,
 				     enum backlight_update_reason reason)
@@ -455,12 +401,6 @@ struct backlight_device *backlight_device_register(const char *name,
 		return ERR_PTR(rc);
 	}
 
-	rc = backlight_register_fb(new_bd);
-	if (rc) {
-		device_unregister(&new_bd->dev);
-		return ERR_PTR(rc);
-	}
-
 	new_bd->ops = ops;
 
 #ifdef CONFIG_PMAC_BACKLIGHT
@@ -547,7 +487,6 @@ void backlight_device_unregister(struct backlight_device *bd)
 	bd->ops = NULL;
 	mutex_unlock(&bd->ops_lock);
 
-	backlight_unregister_fb(bd);
 	device_unregister(&bd->dev);
 }
 EXPORT_SYMBOL(backlight_device_unregister);
diff --git a/drivers/video/fbdev/core/fb_backlight.c b/drivers/video/fbdev/core/fb_backlight.c
index 6fdaa9f81be9..dbed9696f4c5 100644
--- a/drivers/video/fbdev/core/fb_backlight.c
+++ b/drivers/video/fbdev/core/fb_backlight.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <linux/backlight.h>
 #include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/mutex.h>
@@ -36,4 +37,15 @@ struct backlight_device *fb_bl_device(struct fb_info *info)
 	return info->bl_dev;
 }
 EXPORT_SYMBOL(fb_bl_device);
+
+void fb_bl_notify_blank(struct fb_info *info, int old_blank)
+{
+	bool on = info->blank == FB_BLANK_UNBLANK;
+	bool prev_on = old_blank == FB_BLANK_UNBLANK;
+
+	if (info->bl_dev)
+		backlight_notify_blank(info->bl_dev, info->device, on, prev_on);
+	else
+		backlight_notify_blank_all(info->device, on, prev_on);
+}
 #endif
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 9650b641d8e8..c931f270ac34 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -363,6 +363,8 @@ int fb_blank(struct fb_info *info, int blank)
 	if (ret)
 		goto err;
 
+	fb_bl_notify_blank(info, old_blank);
+
 	fb_notifier_call_chain(FB_EVENT_BLANK, &event);
 
 	return 0;
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 03723a5478f8..7ed99cfd030f 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/fb.h>
 #include <linux/mutex.h>
-#include <linux/notifier.h>
 #include <linux/types.h>
 
 /**
@@ -278,11 +277,6 @@ struct backlight_device {
 	 */
 	const struct backlight_ops *ops;
 
-	/**
-	 * @fb_notif: The framebuffer notifier block
-	 */
-	struct notifier_block fb_notif;
-
 	/**
 	 * @entry: List entry of all registered backlight devices
 	 */
@@ -400,6 +394,12 @@ struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
 int backlight_device_set_brightness(struct backlight_device *bd,
 				    unsigned long brightness);
 
+void backlight_notify_blank(struct backlight_device *bd,
+			    struct device *display_dev,
+			    bool fb_on, bool prev_fb_on);
+void backlight_notify_blank_all(struct device *display_dev,
+				bool fb_on, bool prev_fb_on);
+
 #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
 
 /**
diff --git a/include/linux/fb.h b/include/linux/fb.h
index f41d3334ac23..d45bd220cb8f 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -757,11 +757,15 @@ extern void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max)
 
 #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
 struct backlight_device *fb_bl_device(struct fb_info *info);
+void fb_bl_notify_blank(struct fb_info *info, int old_blank);
 #else
 static inline struct backlight_device *fb_bl_device(struct fb_info *info)
 {
 	return NULL;
 }
+
+static inline void fb_bl_notify_blank(struct fb_info *info, int old_blank)
+{ }
 #endif
 
 static inline struct lcd_device *fb_lcd_device(struct fb_info *info)
-- 
2.48.1

