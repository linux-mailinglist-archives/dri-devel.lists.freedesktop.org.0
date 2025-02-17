Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3370A382DE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 13:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E5A10E443;
	Mon, 17 Feb 2025 12:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="i3dmZT+Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2NPk5A7v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i3dmZT+Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2NPk5A7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C8E10E447
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 12:23:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A65E7211B3;
 Mon, 17 Feb 2025 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739795021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDVZAq/ERwpiqXfjXIWFjWpbXNsyM9GZspo6S7hiHoQ=;
 b=i3dmZT+Qejoveyo02TJIoisQs7QjAY+m1CYf4ox6ZIUsduMcHw34qPFKsLeqfSG/FbUjT8
 f8gGspg71cKgsEMyHIsUtwrznyVWrpGoXhcFGHZY83GIknbBqd/mo8G6fjR9YAWTj0l+td
 /yqxeQAn5JuT6yLzFTzmPwydXDxdqas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739795021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDVZAq/ERwpiqXfjXIWFjWpbXNsyM9GZspo6S7hiHoQ=;
 b=2NPk5A7vTB4m5jtLGG3cnfRM3ddIt4TLLJ2lZwKLLEltIi8/0LzJyEmN7H7uQid6sHtV6z
 kM/TniFnx5LKcbCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739795021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDVZAq/ERwpiqXfjXIWFjWpbXNsyM9GZspo6S7hiHoQ=;
 b=i3dmZT+Qejoveyo02TJIoisQs7QjAY+m1CYf4ox6ZIUsduMcHw34qPFKsLeqfSG/FbUjT8
 f8gGspg71cKgsEMyHIsUtwrznyVWrpGoXhcFGHZY83GIknbBqd/mo8G6fjR9YAWTj0l+td
 /yqxeQAn5JuT6yLzFTzmPwydXDxdqas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739795021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDVZAq/ERwpiqXfjXIWFjWpbXNsyM9GZspo6S7hiHoQ=;
 b=2NPk5A7vTB4m5jtLGG3cnfRM3ddIt4TLLJ2lZwKLLEltIi8/0LzJyEmN7H7uQid6sHtV6z
 kM/TniFnx5LKcbCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8142213AC1;
 Mon, 17 Feb 2025 12:23:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UPk9Hk0qs2cwdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Feb 2025 12:23:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/4] drm/ast: cursor: Calculate checksum in helper
Date: Mon, 17 Feb 2025 13:22:04 +0100
Message-ID: <20250217122336.230067-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217122336.230067-1-tzimmermann@suse.de>
References: <20250217122336.230067-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_TLS_ALL(0.00)[]
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

Setting the cursor image requires a 32-bit checksum of the cursor
image data. The current cursor code converts the image to ARGB4444
format and computes the checksum in a single step. Moving the
checksum calculation into a separate helper will allow to move the
format conversion into a shared helper.

v2:
- don't loop for checksum'ing final pixel (Jocelyn)
- fix typo in commit message (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h  | 13 +++++++-
 drivers/gpu/drm/ast/ast_mode.c | 61 +++++++++++++++++++++++++---------
 2 files changed, 58 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 022a8c070c1b..d3115b31b032 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -142,6 +142,17 @@ static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
 	return container_of(plane, struct ast_plane, base);
 }
 
+struct ast_cursor_plane {
+	struct ast_plane base;
+
+	u8 argb4444[AST_HWC_SIZE];
+};
+
+static inline struct ast_cursor_plane *to_ast_cursor_plane(struct drm_plane *plane)
+{
+	return container_of(to_ast_plane(plane), struct ast_cursor_plane, base);
+}
+
 /*
  * Connector
  */
@@ -186,7 +197,7 @@ struct ast_device {
 	enum ast_tx_chip tx_chip;
 
 	struct ast_plane primary_plane;
-	struct ast_plane cursor_plane;
+	struct ast_cursor_plane cursor_plane;
 	struct drm_crtc crtc;
 	union {
 		struct {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index bd781293b6d9..d25852b0ce03 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -632,7 +632,34 @@ static int ast_primary_plane_init(struct ast_device *ast)
  * Cursor plane
  */
 
-static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width, int height)
+static u32 ast_cursor_calculate_checksum(const void *src, unsigned int width, unsigned int height)
+{
+	u32 csum = 0;
+	unsigned int one_pixel_copy = width & BIT(0);
+	unsigned int two_pixel_copy = width - one_pixel_copy;
+	unsigned int trailing_bytes = (AST_MAX_HWC_WIDTH - width) * sizeof(u16);
+	unsigned int x, y;
+
+	for (y = 0; y < height; y++) {
+		for (x = 0; x < two_pixel_copy; x += 2) {
+			const u32 *src32 = (const u32 *)src;
+
+			csum += *src32;
+			src += SZ_4;
+		}
+		if (one_pixel_copy) {
+			const u16 *src16 = (const u16 *)src;
+
+			csum += *src16;
+			src += SZ_2;
+		}
+		src += trailing_bytes;
+	}
+
+	return csum;
+}
+
+static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, u8 *tmp, int width, int height)
 {
 	union {
 		u32 ul;
@@ -642,9 +669,9 @@ static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width, i
 		u16 us;
 		u8 b[2];
 	} data16;
-	u32 csum = 0;
+	u32 csum;
 	s32 alpha_dst_delta, last_alpha_dst_delta;
-	u8 __iomem *dstxor;
+	u8 *dstxor;
 	const u8 *srcxor;
 	int i, j;
 	u32 per_pixel_copy, two_pixel_copy;
@@ -653,7 +680,7 @@ static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width, i
 	last_alpha_dst_delta = alpha_dst_delta - (width << 1);
 
 	srcxor = src;
-	dstxor = (u8 *)dst + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - height) * alpha_dst_delta;
+	dstxor = tmp + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - height) * alpha_dst_delta;
 	per_pixel_copy = width & 1;
 	two_pixel_copy = width >> 1;
 
@@ -665,21 +692,17 @@ static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width, i
 			data32.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
 			data32.b[2] = srcdata32[1].b[1] | (srcdata32[1].b[0] >> 4);
 			data32.b[3] = srcdata32[1].b[3] | (srcdata32[1].b[2] >> 4);
-
-			writel(data32.ul, dstxor);
-			csum += data32.ul;
+			memcpy(dstxor, &data32, 4);
 
 			dstxor += 4;
 			srcxor += 8;
-
 		}
 
 		for (i = 0; i < per_pixel_copy; i++) {
 			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
 			data16.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
 			data16.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
-			writew(data16.us, dstxor);
-			csum += (u32)data16.us;
+			memcpy(dstxor, &data16, 2);
 
 			dstxor += 2;
 			srcxor += 4;
@@ -687,6 +710,11 @@ static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, int width, i
 		dstxor += last_alpha_dst_delta;
 	}
 
+	csum = ast_cursor_calculate_checksum(tmp, width, height);
+
+	/* write pixel data */
+	memcpy_toio(dst, tmp, AST_HWC_SIZE);
+
 	/* write checksum + signature */
 	dst += AST_HWC_SIZE;
 	writel(csum, dst);
@@ -767,6 +795,7 @@ static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
 static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 						  struct drm_atomic_state *state)
 {
+	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	struct ast_plane *ast_plane = to_ast_plane(plane);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
@@ -789,7 +818,8 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	 */
 
 	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
-		ast_update_cursor_image(dst, src, fb->width, fb->height);
+		ast_update_cursor_image(dst, src, ast_cursor_plane->argb4444,
+					fb->width, fb->height);
 		ast_set_cursor_base(ast, dst_off);
 	}
 
@@ -849,8 +879,9 @@ static const struct drm_plane_funcs ast_cursor_plane_funcs = {
 static int ast_cursor_plane_init(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
-	struct ast_plane *ast_cursor_plane = &ast->cursor_plane;
-	struct drm_plane *cursor_plane = &ast_cursor_plane->base;
+	struct ast_cursor_plane *ast_cursor_plane = &ast->cursor_plane;
+	struct ast_plane *ast_plane = &ast_cursor_plane->base;
+	struct drm_plane *cursor_plane = &ast_plane->base;
 	size_t size;
 	void __iomem *vaddr;
 	u64 offset;
@@ -869,7 +900,7 @@ static int ast_cursor_plane_init(struct ast_device *ast)
 	vaddr = ast->vram + ast->vram_fb_available - size;
 	offset = ast->vram_fb_available - size;
 
-	ret = ast_plane_init(dev, ast_cursor_plane, vaddr, offset, size,
+	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
 			     0x01, &ast_cursor_plane_funcs,
 			     ast_cursor_plane_formats, ARRAY_SIZE(ast_cursor_plane_formats),
 			     NULL, DRM_PLANE_TYPE_CURSOR);
@@ -1156,7 +1187,7 @@ static int ast_crtc_init(struct ast_device *ast)
 	int ret;
 
 	ret = drm_crtc_init_with_planes(dev, crtc, &ast->primary_plane.base,
-					&ast->cursor_plane.base, &ast_crtc_funcs,
+					&ast->cursor_plane.base.base, &ast_crtc_funcs,
 					NULL);
 	if (ret)
 		return ret;
-- 
2.48.1

