Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F130D78C753
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BFC10E33B;
	Tue, 29 Aug 2023 14:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B475B10E336
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:21:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6F12D1F38C;
 Tue, 29 Aug 2023 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693318889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdv0cLQ6j1TsZQmdczOCC46tJyhpJPozzqmzgQ+pW6I=;
 b=ahtn3VTrCuEHEHObH9V07adWKUxOD5bT2xSCSmrvZh0U+l9975MToLLrl/EoeWxNEz1HIL
 YTmm3zzX1tSIIN6lRaKVHE/83wX2OarloMohDtUZkoymUm+hEtayyCVuSJHkmZdDu40PdZ
 hzgFEtzx1jC2LAcCIa7yxU+bTVd6HlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693318889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdv0cLQ6j1TsZQmdczOCC46tJyhpJPozzqmzgQ+pW6I=;
 b=lEMwenznQ1/v0CjQSH863yJS+JL0tQVj7OoxDI7yAydKvURMQWCC8TIZgEQVv9VEUpU+3U
 OMF/wDwxrA03yzDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3868B13909;
 Tue, 29 Aug 2023 14:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WHLiDOn+7WREewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 29 Aug 2023 14:21:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] fbdev/core: Fix style of code for boot-up logo
Date: Tue, 29 Aug 2023 16:15:42 +0200
Message-ID: <20230829142109.4521-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829142109.4521-1-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
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
2.41.0

