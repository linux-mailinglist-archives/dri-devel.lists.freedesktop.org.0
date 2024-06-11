Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A1903C6E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAFD10E620;
	Tue, 11 Jun 2024 12:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114C110E601
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:53:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3F9C219D0;
 Tue, 11 Jun 2024 12:53:24 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C0D4137DF;
 Tue, 11 Jun 2024 12:53:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cD43FcRIaGbxMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jun 2024 12:53:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, linus.walleij@linaro.org, f.suligoi@asem.it,
 ukleinek@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/17] backlight: aat2870-backlight: Use blacklight power
 constants
Date: Tue, 11 Jun 2024 14:41:57 +0200
Message-ID: <20240611125321.6927-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611125321.6927-1-tzimmermann@suse.de>
References: <20240611125321.6927-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A3F9C219D0
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Action: no action
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

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/aat2870_bl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index b4c3354a1a8a6..94de11b6cdff0 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -156,7 +156,7 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 		bd->props.max_brightness = 255;
 
 	aat2870_bl->brightness = 0;
-	bd->props.power = FB_BLANK_UNBLANK;
+	bd->props.power = BL_CORE_UNBLANK;
 	bd->props.brightness = bd->props.max_brightness;
 
 	ret = aat2870_bl_update_status(bd);
@@ -176,7 +176,7 @@ static void aat2870_bl_remove(struct platform_device *pdev)
 	struct aat2870_bl_driver_data *aat2870_bl = platform_get_drvdata(pdev);
 	struct backlight_device *bd = aat2870_bl->bd;
 
-	bd->props.power = FB_BLANK_POWERDOWN;
+	bd->props.power = BL_CORE_POWERDOWN;
 	bd->props.brightness = 0;
 	backlight_update_status(bd);
 }
-- 
2.45.2

