Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB258420C9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED62112ECC;
	Tue, 30 Jan 2024 10:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F9E112EF2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:51 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4004B222E2;
 Tue, 30 Jan 2024 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5QyKVJcftwUMugbalJrjFnk0Z0CECvRStb8molzHq2w=;
 b=PKRy9Z9Lm/tKwtZa6MvnLyjZcdSJpxBqDyrBIMwdkBAcd4BFKx5ncfNrdyasVQ9tFFIxs6
 qGfXFS3lpsth/G9VsARSmAHnCY2JKyBAtQy52QmB1etF3Nr0d3fcD+d6U7mdie6tXW0mwH
 4rl7uVGvkJ1CTNRR/FCDBt5ljfW0Wqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5QyKVJcftwUMugbalJrjFnk0Z0CECvRStb8molzHq2w=;
 b=LOoq/MX7ubqcOiyrkGkWeFFRpwntLVzDrJP/0Ii4TRCW2CQxN7Yuxw127IStkT/GH95dbY
 vS1zcru7m1TTL1CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5QyKVJcftwUMugbalJrjFnk0Z0CECvRStb8molzHq2w=;
 b=PKRy9Z9Lm/tKwtZa6MvnLyjZcdSJpxBqDyrBIMwdkBAcd4BFKx5ncfNrdyasVQ9tFFIxs6
 qGfXFS3lpsth/G9VsARSmAHnCY2JKyBAtQy52QmB1etF3Nr0d3fcD+d6U7mdie6tXW0mwH
 4rl7uVGvkJ1CTNRR/FCDBt5ljfW0Wqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5QyKVJcftwUMugbalJrjFnk0Z0CECvRStb8molzHq2w=;
 b=LOoq/MX7ubqcOiyrkGkWeFFRpwntLVzDrJP/0Ii4TRCW2CQxN7Yuxw127IStkT/GH95dbY
 vS1zcru7m1TTL1CQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AC171376E;
 Tue, 30 Jan 2024 10:07:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id YNJjBVjKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 21/23] [DO NOT MERGE] drm/format-helper: Add color palette
Date: Tue, 30 Jan 2024 10:53:56 +0100
Message-ID: <20240130100714.12608-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PKRy9Z9L;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="LOoq/MX7"
X-Spamd-Result: default: False [-0.31 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 4004B222E2
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a color palette to struct drm_format_conv_state. The palette
points to an array of struct drm_color_lut. It allows to blit from
an index color formats to a component-based destination.

The palette exists independently from the source pixmap and is
thus stored struct drm_format_conv_state instead of struct drm_pixmap.
As a nice side effect, this also allows for techniques like palette
swapping and color cycling.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 71 +++++++++++++++++++----------
 include/drm/drm_format_helper.h     |  2 +
 2 files changed, 48 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index ed90745f4d9fb..2588871672b6d 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -212,7 +212,8 @@ static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_p
 			 const void *src, unsigned long src_pitch, unsigned long src_pixsize,
 			 const struct drm_rect *src_clip, bool src_cached_hint,
 			 struct drm_format_conv_state *state,
-			 void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
+			 void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels,
+				 	   const struct drm_color_lut *palette))
 {
 	unsigned long pixels = drm_rect_width(src_clip);
 	unsigned long lines = drm_rect_height(src_clip);
@@ -241,7 +242,7 @@ static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_p
 			sbuf = memcpy(stmp, src, sbuf_len);
 		else
 			sbuf = src;
-		xfrm_line(dst, sbuf, pixels);
+		xfrm_line(dst, sbuf, pixels, state->palette);
 		src += src_pitch;
 		dst += dst_pitch;
 	}
@@ -253,7 +254,8 @@ static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsign
 			      const void *src, unsigned long src_pitch, unsigned long src_pixsize,
 			      const struct drm_rect *src_clip, bool src_cached_hint,
 			      struct drm_format_conv_state *state,
-			      void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
+			      void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels,
+						const struct drm_color_lut* palette))
 {
 	unsigned long npixels = drm_rect_width(src_clip);
 	unsigned long lines = drm_rect_height(src_clip);
@@ -283,7 +285,7 @@ static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsign
 			sbuf = memcpy(stmp, src, sbuf_len);
 		else
 			sbuf = src;
-		xfrm_line(dbuf, sbuf, npixels);
+		xfrm_line(dbuf, sbuf, npixels, state->palette);
 		memcpy_toio(dst, dbuf, dbuf_len);
 		src += src_pitch;
 		dst += dst_pitch;
@@ -297,7 +299,8 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 		       const unsigned int *dst_pitch, const u8 *dst_pixsize,
 		       const struct drm_pixmap *src_pix, bool vaddr_cached_hint,
 		       struct drm_format_conv_state *state,
-		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
+		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels,
+			       		 const struct drm_color_lut *palette))
 {
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
 		0, 0, 0, 0
@@ -373,7 +376,8 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
 }
 EXPORT_SYMBOL(drm_fb_memcpy);
 
-static void drm_fb_swab16_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_swab16_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       const struct drm_color_lut *palette)
 {
 	u16 *dbuf16 = dbuf;
 	const u16 *sbuf16 = sbuf;
@@ -383,7 +387,8 @@ static void drm_fb_swab16_line(void *dbuf, const void *sbuf, unsigned int pixels
 		*dbuf16++ = swab16(*sbuf16++);
 }
 
-static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       const struct drm_color_lut *palette)
 {
 	u32 *dbuf32 = dbuf;
 	const u32 *sbuf32 = sbuf;
@@ -421,7 +426,8 @@ void drm_fb_swab(struct drm_device *dev,
 {
 	const struct drm_format_info *format = src_pix->format;
 	u8 cpp = DIV_ROUND_UP(drm_format_info_bpp(format, 0), 8);
-	void (*swab_line)(void *dbuf, const void *sbuf, unsigned int npixels);
+	void (*swab_line)(void *dbuf, const void *sbuf, unsigned int npixels,
+			  const struct drm_color_lut *palette);
 
 	switch (cpp) {
 	case 4:
@@ -440,7 +446,8 @@ void drm_fb_swab(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
-static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	u8 *dbuf8 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -486,7 +493,8 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
 
-static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -505,7 +513,8 @@ static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigne
 
 /* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
 static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
-						unsigned int pixels)
+						unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -550,7 +559,8 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 		2,
 	};
 
-	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
+	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels,
+			  const struct drm_color_lut *palette);
 
 	if (swab)
 		xfrm_line = drm_fb_xrgb8888_to_rgb565_swab_line;
@@ -561,7 +571,8 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
-static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -611,7 +622,8 @@ void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
 
-static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -662,7 +674,8 @@ void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
 
-static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -713,7 +726,8 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
 
-static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	u8 *dbuf8 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -762,7 +776,8 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
 
-static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -809,7 +824,8 @@ void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
 
-static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -838,7 +854,8 @@ static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned in
 		    drm_fb_xrgb8888_to_abgr8888_line);
 }
 
-static void drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -867,7 +884,8 @@ static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned in
 		    drm_fb_xrgb8888_to_xbgr8888_line);
 }
 
-static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -918,7 +936,8 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
 
-static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -970,7 +989,8 @@ void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *d
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb2101010);
 
-static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	u8 *dbuf8 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -1109,7 +1129,8 @@ int drm_fb_blit(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_fb_blit);
 
-static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int pixels)
+static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
 {
 	u8 *dbuf8 = dbuf;
 	const u8 *sbuf8 = sbuf;
@@ -1208,8 +1229,8 @@ void drm_fb_xrgb8888_to_mono(struct drm_device *dev,
 	vaddr += clip_offset(clip, src_pix->pitches[0], cpp);
 	for (y = 0; y < lines; y++) {
 		src32 = memcpy(src32, vaddr, len_src32);
-		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
-		drm_fb_gray8_to_mono_line(mono, gray8, linepixels);
+		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels, state->palette);
+		drm_fb_gray8_to_mono_line(mono, gray8, linepixels, state->palette);
 		vaddr += src_pix->pitches[0];
 		mono += dst_pitch_0;
 	}
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 098e6f8412465..464812080f3dc 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -31,6 +31,8 @@ struct drm_format_conv_state {
 		size_t size;
 		bool preallocated;
 	} tmp;
+
+	const struct drm_color_lut *palette;
 };
 
 #define __DRM_FORMAT_CONV_STATE_INIT(_mem, _size, _preallocated) { \
-- 
2.43.0

