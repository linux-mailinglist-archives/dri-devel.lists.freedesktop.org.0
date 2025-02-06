Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D8A2ACD0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7870D10E8B2;
	Thu,  6 Feb 2025 15:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6233110E8AD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:40:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E8CEF1F452;
 Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A522D13AB2;
 Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wAMfJ//XpGf4PAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: pavel@ucw.cz, lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 13/13] fbdev: Remove constants of unused events
Date: Thu,  6 Feb 2025 16:30:32 +0100
Message-ID: <20250206154033.697495-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206154033.697495-1-tzimmermann@suse.de>
References: <20250206154033.697495-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E8CEF1F452
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

The constants FB_EVENT_MODE_CHANGE and FB_EVENT_BLANK are unused.
Remove them from the header file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/fb.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index bebf279c8bc6..c272c0fc074d 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -129,18 +129,12 @@ struct fb_cursor_user {
  * Register/unregister for framebuffer events
  */
 
-/*	The resolution of the passed in fb_info about to change */
-#define FB_EVENT_MODE_CHANGE		0x01
-
 #ifdef CONFIG_GUMSTIX_AM200EPD
 /* only used by mach-pxa/am200epd.c */
 #define FB_EVENT_FB_REGISTERED          0x05
 #define FB_EVENT_FB_UNREGISTERED        0x06
 #endif
 
-/*      A display blank is requested       */
-#define FB_EVENT_BLANK                  0x09
-
 struct fb_event {
 	struct fb_info *info;
 	void *data;
-- 
2.48.1

