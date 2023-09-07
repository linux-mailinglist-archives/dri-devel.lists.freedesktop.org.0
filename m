Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C1279710E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3F910E798;
	Thu,  7 Sep 2023 08:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F60310E7A1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:54:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1EF9B1F892;
 Thu,  7 Sep 2023 08:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694076851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTdWTaQ0riYteVmSEGuLLxQSuE95aGwkbU+EWn7Zhus=;
 b=VF9DmHycTsHhbjZNTwE+ES8Kr5Q+issjxv9O3wgDrux7sNo5Ad8dK3c4WnQDyQnA+K8TuC
 Pb3qqefhcRJAklXQDXBiNd05d7ZAt9iuhMV8iIFwusYWg30DMxAEXQ9Ds0LYxwcz52NZ1Q
 KeK7YtNG76ah7rGIZV+x8E1rNmYJuG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694076851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTdWTaQ0riYteVmSEGuLLxQSuE95aGwkbU+EWn7Zhus=;
 b=iwlq0EIThJcoMtZrlh40mgCzwKv6qe8cSffZPJ9an4DHHCwqA/JYuA3fzBpdbHv7sdRh+t
 pr84lhFV4ad+YmAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4A58138FA;
 Thu,  7 Sep 2023 08:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SDrONrKP+WT6JgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Sep 2023 08:54:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/7] fbdev/core: Fix style of code for boot-up logo
Date: Thu,  7 Sep 2023 10:52:02 +0200
Message-ID: <20230907085408.9354-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907085408.9354-1-tzimmermann@suse.de>
References: <20230907085408.9354-1-tzimmermann@suse.de>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a number of warnings from checkpatch.pl in this code before
moving it into a separate file. This includes

 * Prefer 'unsigned int' to bare use of 'unsigned'
 * space required after that ',' (ctx:VxV)
 * space prohibited after that open parenthesis '('
 * suspect code indent for conditional statements (16, 32)
 * braces {} are not necessary for single statement blocks

No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fbmem.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index ee44a46a66be..98e1847e4287 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -186,7 +186,7 @@ EXPORT_SYMBOL(fb_get_buffer_offset);
 
 #ifdef CONFIG_LOGO
 
-static inline unsigned safe_shift(unsigned d, int n)
+static inline unsigned int safe_shift(unsigned int d, int n)
 {
 	return n < 0 ? d >> -n : d << n;
 }
@@ -229,7 +229,9 @@ static void  fb_set_logo_truepalette(struct fb_info *info,
 					    const struct linux_logo *logo,
 					    u32 *palette)
 {
-	static const unsigned char mask[] = { 0,0x80,0xc0,0xe0,0xf0,0xf8,0xfc,0xfe,0xff };
+	static const unsigned char mask[] = {
+		0, 0x80, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc, 0xfe, 0xff
+	};
 	unsigned char redmask, greenmask, bluemask;
 	int redshift, greenshift, blueshift;
 	int i;
@@ -247,7 +249,7 @@ static void  fb_set_logo_truepalette(struct fb_info *info,
 	greenshift = info->var.green.offset - (8 - info->var.green.length);
 	blueshift  = info->var.blue.offset  - (8 - info->var.blue.length);
 
-	for ( i = 0; i < logo->clutsize; i++) {
+	for (i = 0; i < logo->clutsize; i++) {
 		palette[i+32] = (safe_shift((clut[0] & redmask), redshift) |
 				 safe_shift((clut[1] & greenmask), greenshift) |
 				 safe_shift((clut[2] & bluemask), blueshift));
@@ -371,7 +373,7 @@ static void fb_rotate_logo_cw(const u8 *in, u8 *out, u32 width, u32 height)
 
 	for (i = 0; i < height; i++)
 		for (j = 0; j < width; j++)
-				out[height * j + h - i] = *in++;
+			out[height * j + h - i] = *in++;
 }
 
 static void fb_rotate_logo_ccw(const u8 *in, u8 *out, u32 width, u32 height)
@@ -636,9 +638,8 @@ int fb_prepare_logo(struct fb_info *info, int rotate)
 	/* Return if no suitable logo was found */
 	fb_logo.logo = fb_find_logo(depth);
 
-	if (!fb_logo.logo) {
+	if (!fb_logo.logo)
 		return 0;
-	}
 
 	if (rotate == FB_ROTATE_UR || rotate == FB_ROTATE_UD)
 		yres = info->var.yres;
-- 
2.42.0

