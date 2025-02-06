Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C4A2ACBB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC7F10E8AA;
	Thu,  6 Feb 2025 15:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jiAqai6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AS3bldt3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jiAqai6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AS3bldt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F2610E8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 280602115F;
 Thu,  6 Feb 2025 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738856446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3XUtLPaqLGIYCmzV8GNcFujB/Skf7MzzsqQR1UIaXo=;
 b=jiAqai6eQD64hkxSM8Q88uQ6xlGs4LeTNZz9Ur1nzc7dekU5DvwUOrS2GH2KttA/XfrJQn
 PIKlkuqly8paOu8FXEdgwta5gt3bM+Y6xWPtJgz8mXmjxQbvb9UhmENKkMg0OotuNoW4Uq
 xe27EP06VS7KgT8DdLsnblR99NyLVjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738856446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3XUtLPaqLGIYCmzV8GNcFujB/Skf7MzzsqQR1UIaXo=;
 b=AS3bldt3OBsYK1Q4RqdXamim7zvqvdxXZkbcCd5R1VV12G2D7PFqW/uEv2NEZkfyRgCzsN
 7mKGW6IjBOXm84Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738856446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3XUtLPaqLGIYCmzV8GNcFujB/Skf7MzzsqQR1UIaXo=;
 b=jiAqai6eQD64hkxSM8Q88uQ6xlGs4LeTNZz9Ur1nzc7dekU5DvwUOrS2GH2KttA/XfrJQn
 PIKlkuqly8paOu8FXEdgwta5gt3bM+Y6xWPtJgz8mXmjxQbvb9UhmENKkMg0OotuNoW4Uq
 xe27EP06VS7KgT8DdLsnblR99NyLVjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738856446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3XUtLPaqLGIYCmzV8GNcFujB/Skf7MzzsqQR1UIaXo=;
 b=AS3bldt3OBsYK1Q4RqdXamim7zvqvdxXZkbcCd5R1VV12G2D7PFqW/uEv2NEZkfyRgCzsN
 7mKGW6IjBOXm84Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D327E13A7F;
 Thu,  6 Feb 2025 15:40:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iCRdMv3XpGf4PAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: pavel@ucw.cz, lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/13] backlight: lcd: Maintain global list of lcd devices
Date: Thu,  6 Feb 2025 16:30:26 +0100
Message-ID: <20250206154033.697495-8-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
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

Maintain a list of lcd devices. This will replace the fbdev notifiers
that all lcd devices currently subscribe to.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c | 11 +++++++++++
 include/linux/lcd.h           |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index 3267acf8dc5b..95a371b3e8a4 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -18,6 +18,9 @@
 #include <linux/fb.h>
 #include <linux/slab.h>
 
+static struct list_head lcd_dev_list;
+static struct mutex lcd_dev_list_mutex;
+
 #if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
 			   defined(CONFIG_LCD_CLASS_DEVICE_MODULE))
 static int to_lcd_power(int fb_blank)
@@ -251,6 +254,10 @@ struct lcd_device *lcd_device_register(const char *name, struct device *parent,
 		return ERR_PTR(rc);
 	}
 
+	mutex_lock(&lcd_dev_list_mutex);
+	list_add(&new_ld->entry, &lcd_dev_list);
+	mutex_unlock(&lcd_dev_list_mutex);
+
 	return new_ld;
 }
 EXPORT_SYMBOL(lcd_device_register);
@@ -266,6 +273,10 @@ void lcd_device_unregister(struct lcd_device *ld)
 	if (!ld)
 		return;
 
+	mutex_lock(&lcd_dev_list_mutex);
+	list_del(&ld->entry);
+	mutex_unlock(&lcd_dev_list_mutex);
+
 	mutex_lock(&ld->ops_lock);
 	ld->ops = NULL;
 	mutex_unlock(&ld->ops_lock);
diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index c3ccdff4519a..195b95edb13f 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -82,6 +82,11 @@ struct lcd_device {
 	/* The framebuffer notifier block */
 	struct notifier_block fb_notif;
 
+	/**
+	 * @entry: List entry of all registered lcd devices
+	 */
+	struct list_head entry;
+
 	struct device dev;
 };
 
-- 
2.48.1

