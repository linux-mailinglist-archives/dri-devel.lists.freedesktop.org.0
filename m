Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD47870727
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FB6112323;
	Mon,  4 Mar 2024 16:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uglSnTu7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4BKGdb3V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uglSnTu7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4BKGdb3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1479411231A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:32:28 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6CE33337D0;
 Mon,  4 Mar 2024 16:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709569946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EM1dsMS8ciY5XroJVXglx2pw68rH+KuHUZfHYNIwP4=;
 b=uglSnTu7+xZM92stCNhlyqgvsl1PM19tN+xORtm2Cy/njLmeDHOMTiZNyKHkIBZWivSuRI
 7R9JQQVLBGU1K2tbD0ZJ0qMLU0ehC/1lU5GcDeu2R1KEMPtinsMS+ruXPRtKf467wZ+hOZ
 XtsdBybroLxvhEzNMK19NaihV2VZJWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709569946;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EM1dsMS8ciY5XroJVXglx2pw68rH+KuHUZfHYNIwP4=;
 b=4BKGdb3VIrLdKREyGvnwHkYAS35oG7fMDhZDNnUadlIkFkRvRs0riPehweOXIgX4cGIZvH
 Sez+RyEmlJunpWBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709569946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EM1dsMS8ciY5XroJVXglx2pw68rH+KuHUZfHYNIwP4=;
 b=uglSnTu7+xZM92stCNhlyqgvsl1PM19tN+xORtm2Cy/njLmeDHOMTiZNyKHkIBZWivSuRI
 7R9JQQVLBGU1K2tbD0ZJ0qMLU0ehC/1lU5GcDeu2R1KEMPtinsMS+ruXPRtKf467wZ+hOZ
 XtsdBybroLxvhEzNMK19NaihV2VZJWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709569946;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5EM1dsMS8ciY5XroJVXglx2pw68rH+KuHUZfHYNIwP4=;
 b=4BKGdb3VIrLdKREyGvnwHkYAS35oG7fMDhZDNnUadlIkFkRvRs0riPehweOXIgX4cGIZvH
 Sez+RyEmlJunpWBQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D23A139C6;
 Mon,  4 Mar 2024 16:32:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id yFDvAZr35WVLAQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Mar 2024 16:32:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, andy@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de, robin@protonic.nl, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v3 06/10] backlight/pwm-backlight: Remove struct
 backlight_ops.check_fb
Date: Mon,  4 Mar 2024 17:29:51 +0100
Message-ID: <20240304163220.19144-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304163220.19144-1-tzimmermann@suse.de>
References: <20240304163220.19144-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.23 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLbrmj4aennmrpd7btm9n9zy3k)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[13]; MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,protonic.nl,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.13)[67.63%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.23
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

The internal check_fb callback from struct pwm_bl_data is never
implemented. The driver's implementation of check_fb always
returns true, which is the backlight core's default if no
implementation has been set. So remove the code from the driver.

v2:
	* reword commit message

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/backlight/pwm_bl.c | 12 ------------
 include/linux/pwm_backlight.h    |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index ffcebf6aa76a9..61d30bc98eea5 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -11,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
-#include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/err.h>
 #include <linux/pwm.h>
@@ -34,7 +33,6 @@ struct pwm_bl_data {
 					  int brightness);
 	void			(*notify_after)(struct device *,
 					int brightness);
-	int			(*check_fb)(struct device *, struct fb_info *);
 	void			(*exit)(struct device *);
 };
 
@@ -129,17 +127,8 @@ static int pwm_backlight_update_status(struct backlight_device *bl)
 	return 0;
 }
 
-static int pwm_backlight_check_fb(struct backlight_device *bl,
-				  struct fb_info *info)
-{
-	struct pwm_bl_data *pb = bl_get_data(bl);
-
-	return !pb->check_fb || pb->check_fb(pb->dev, info);
-}
-
 static const struct backlight_ops pwm_backlight_ops = {
 	.update_status	= pwm_backlight_update_status,
-	.check_fb	= pwm_backlight_check_fb,
 };
 
 #ifdef CONFIG_OF
@@ -482,7 +471,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 
 	pb->notify = data->notify;
 	pb->notify_after = data->notify_after;
-	pb->check_fb = data->check_fb;
 	pb->exit = data->exit;
 	pb->dev = &pdev->dev;
 	pb->enabled = false;
diff --git a/include/linux/pwm_backlight.h b/include/linux/pwm_backlight.h
index cdd2ac366bc72..0bf80e98d5b40 100644
--- a/include/linux/pwm_backlight.h
+++ b/include/linux/pwm_backlight.h
@@ -19,7 +19,6 @@ struct platform_pwm_backlight_data {
 	int (*notify)(struct device *dev, int brightness);
 	void (*notify_after)(struct device *dev, int brightness);
 	void (*exit)(struct device *dev);
-	int (*check_fb)(struct device *dev, struct fb_info *info);
 };
 
 #endif
-- 
2.44.0

