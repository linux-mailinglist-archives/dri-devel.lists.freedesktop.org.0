Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE008A2ACC9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A6610E8AC;
	Thu,  6 Feb 2025 15:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jRpephcJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h2O7oBMh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jRpephcJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h2O7oBMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE8B10E8A7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6EA8921166;
 Thu,  6 Feb 2025 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738856446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZmSbxc1AHuHQ+2yO3YEeVx9ZHYe5QOAUrseW/7hQgI=;
 b=jRpephcJqYitMquzyHiwk86AvSNCN6bux0coQmqnDWLLiOOQQE9Dn5iQAC84mbICHINK6Q
 KZ5S+H1SHZQdWGBHZDBQt7GWYCbZXSzE5CXovzbAY44R1EsfjffXHyIQZUva+ziKTJmvcr
 SUR3OlwjLIqRi/HvFGegwLwT/Zx40IU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738856446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZmSbxc1AHuHQ+2yO3YEeVx9ZHYe5QOAUrseW/7hQgI=;
 b=h2O7oBMheiW/4lpBFfVMeN3JfaNY33vUmguKLwJMb4ocvzsQYcWulvqRKgFYxjHlG+VS0k
 6j1NNDFZKdthbEBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738856446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZmSbxc1AHuHQ+2yO3YEeVx9ZHYe5QOAUrseW/7hQgI=;
 b=jRpephcJqYitMquzyHiwk86AvSNCN6bux0coQmqnDWLLiOOQQE9Dn5iQAC84mbICHINK6Q
 KZ5S+H1SHZQdWGBHZDBQt7GWYCbZXSzE5CXovzbAY44R1EsfjffXHyIQZUva+ziKTJmvcr
 SUR3OlwjLIqRi/HvFGegwLwT/Zx40IU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738856446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZmSbxc1AHuHQ+2yO3YEeVx9ZHYe5QOAUrseW/7hQgI=;
 b=h2O7oBMheiW/4lpBFfVMeN3JfaNY33vUmguKLwJMb4ocvzsQYcWulvqRKgFYxjHlG+VS0k
 6j1NNDFZKdthbEBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E5C313697;
 Thu,  6 Feb 2025 15:40:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UGLpCf7XpGf4PAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: pavel@ucw.cz, lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/13] backlight: lcd: Move event handling into helpers
Date: Thu,  6 Feb 2025 16:30:27 +0100
Message-ID: <20250206154033.697495-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206154033.697495-1-tzimmermann@suse.de>
References: <20250206154033.697495-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[ucw.cz,kernel.org,gmail.com,gmx.de,ffwll.ch];
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

Move the handling of display updates to separate helper functions.
There is code for handling fbdev blank events and fbdev mode changes.
The code currently runs from fbdev event notifiers, which will be
replaced.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c | 38 ++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index 95a371b3e8a4..b2ee25060d66 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -21,6 +21,32 @@
 static struct list_head lcd_dev_list;
 static struct mutex lcd_dev_list_mutex;
 
+static void lcd_notify_blank(struct lcd_device *ld, struct device *display_dev,
+			     int power)
+{
+	guard(mutex)(&ld->ops_lock);
+
+	if (!ld->ops || !ld->ops->set_power)
+		return;
+	if (ld->ops->controls_device && !ld->ops->controls_device(ld, display_dev))
+		return;
+
+	ld->ops->set_power(ld, power);
+}
+
+static void lcd_notify_mode_change(struct lcd_device *ld, struct device *display_dev,
+				   unsigned int width, unsigned int height)
+{
+	guard(mutex)(&ld->ops_lock);
+
+	if (!ld->ops || !ld->ops->set_mode)
+		return;
+	if (ld->ops->controls_device && !ld->ops->controls_device(ld, display_dev))
+		return;
+
+	ld->ops->set_mode(ld, width, height);
+}
+
 #if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
 			   defined(CONFIG_LCD_CLASS_DEVICE_MODULE))
 static int to_lcd_power(int fb_blank)
@@ -53,25 +79,17 @@ static int fb_notifier_callback(struct notifier_block *self,
 	struct fb_info *info = evdata->info;
 	struct lcd_device *fb_lcd = fb_lcd_device(info);
 
-	guard(mutex)(&ld->ops_lock);
-
-	if (!ld->ops)
-		return 0;
-	if (ld->ops->controls_device && !ld->ops->controls_device(ld, info->device))
-		return 0;
 	if (fb_lcd && fb_lcd != ld)
 		return 0;
 
 	if (event == FB_EVENT_BLANK) {
 		int power = to_lcd_power(*(int *)evdata->data);
 
-		if (ld->ops->set_power)
-			ld->ops->set_power(ld, power);
+		lcd_notify_blank(ld, info->device, power);
 	} else {
 		const struct fb_videomode *videomode = evdata->data;
 
-		if (ld->ops->set_mode)
-			ld->ops->set_mode(ld, videomode->xres, videomode->yres);
+		lcd_notify_mode_change(ld, info->device, videomode->xres, videomode->yres);
 	}
 
 	return 0;
-- 
2.48.1

