Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897E98420B9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3C112EE3;
	Tue, 30 Jan 2024 10:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20933112EC8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:21 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 907241F84B;
 Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swZ4H6HVrj4Eq2LcQJLpBz0+Z9+Y9wST3rOu94zt6H0=;
 b=zjOtO6+WtneJ33m+2SmyyLcp032vztVv2ryhaP20Rily+VI+lGSM/OoaV35OtyOWDncaHL
 xvYrEzX7PzPBVXcNwE5+th5ujBbp7VlFwAWytlS/F//1O8bSB/D4zoaNvWpMbWmPvwOJeG
 6fk8iUIs+7wy2ZtpacrKxllT//EgK6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swZ4H6HVrj4Eq2LcQJLpBz0+Z9+Y9wST3rOu94zt6H0=;
 b=NNJJ2PUgf5vzzEemJ9CwsypLqmlZyJeri961QpLjLQOInfUh+fOQLWBk92Q0/B9SqeBzDc
 ukAcxhsGZQ5E3vAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swZ4H6HVrj4Eq2LcQJLpBz0+Z9+Y9wST3rOu94zt6H0=;
 b=zjOtO6+WtneJ33m+2SmyyLcp032vztVv2ryhaP20Rily+VI+lGSM/OoaV35OtyOWDncaHL
 xvYrEzX7PzPBVXcNwE5+th5ujBbp7VlFwAWytlS/F//1O8bSB/D4zoaNvWpMbWmPvwOJeG
 6fk8iUIs+7wy2ZtpacrKxllT//EgK6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swZ4H6HVrj4Eq2LcQJLpBz0+Z9+Y9wST3rOu94zt6H0=;
 b=NNJJ2PUgf5vzzEemJ9CwsypLqmlZyJeri961QpLjLQOInfUh+fOQLWBk92Q0/B9SqeBzDc
 ukAcxhsGZQ5E3vAA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 395C41376E;
 Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id OLPfDFfKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 17/23] drm/format-helper: Use struct drm_pixmap for
 drm_fb_xrgb8888_to_gray8()
Date: Tue, 30 Jan 2024 10:53:52 +0100
Message-ID: <20240130100714.12608-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; TO_DN_SOME(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store the source-buffer parameters of drm_fb_xrgb8888_to_gray8()
in struct drm_pixmap. Update the function's interface and all of its
callers.

Callers of drm_fb_xrgb8888_to_gray8() initialize the pixmap's
instance from a pre-existing instance of struct drm_framebuffer.
There's potential to simplify some of that code in a later patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c            | 15 +++++----------
 drivers/gpu/drm/gud/gud_pipe.c                 |  6 ++++--
 drivers/gpu/drm/solomon/ssd130x.c              |  4 +++-
 drivers/gpu/drm/tests/drm_format_helper_test.c |  5 ++++-
 drivers/gpu/drm/tiny/st7586.c                  |  4 +++-
 include/drm/drm_format_helper.h                |  4 ++--
 6 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index c77915df0b9a3..eb621b7da38e0 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -965,15 +965,13 @@ static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned
  * @dst: Array of 8-bit grayscale destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @src: Array of XRGB8888 source buffers
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
+ * @src_pix: Source pixmap to copy from
  * @state: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
- * least as many entries as there are planes in @fb's format. Each entry stores the
+ * parameters @dst and @dst_pitch refer to arrays. Each array must have at
+ * least as many entries as there are planes in the pixmap's format. Each entry stores the
  * value for the format's respective color plane at the same index.
  *
  * This function does not apply clipping on @dst (i.e. the destination is at the
@@ -987,15 +985,12 @@ static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned
  * ITU BT.601 is being used for the RGB -> luma (brightness) conversion.
  */
 void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
-			      const struct iosys_map *src, const struct drm_framebuffer *fb,
-			      const struct drm_rect *clip, struct drm_format_conv_state *state)
+			      const struct drm_pixmap *src_pix,
+			      struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		1,
 	};
-	struct drm_pixmap pixmap;
-	struct drm_pixmap *src_pix = &pixmap;
-	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
 	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_gray8_line);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 419fc82784e01..cc69cb97154c1 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -59,6 +59,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	unsigned int x, y, width, height;
 	u8 pix, *pix8, *block = dst; /* Assign to silence compiler warning */
 	struct iosys_map dst_map, vmap;
+	struct drm_pixmap src_pix;
 	size_t len;
 	void *buf;
 
@@ -76,7 +77,8 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 
 	iosys_map_set_vaddr(&dst_map, buf);
 	iosys_map_set_vaddr(&vmap, src);
-	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, rect, fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, &vmap, rect);
+	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &src_pix, fmtcnv_state);
 	pix8 = buf;
 
 	for (y = 0; y < height; y++) {
@@ -188,7 +190,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			if (!len)
 				return -ENOMEM;
 		} else if (format->format == DRM_FORMAT_R8) {
-			drm_fb_xrgb8888_to_gray8(&dst, NULL, src, fb, rect, fmtcnv_state);
+			drm_fb_xrgb8888_to_gray8(&dst, NULL, &src_pix, fmtcnv_state);
 		} else if (format->format == DRM_FORMAT_RGB332) {
 			drm_fb_xrgb8888_to_rgb332(&dst, NULL, &src_pix, fmtcnv_state);
 		} else if (format->format == DRM_FORMAT_RGB565) {
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 05305c0788e17..19ce866d98814 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1039,6 +1039,7 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
 	unsigned int dst_pitch = drm_rect_width(rect);
 	struct iosys_map dst;
+	struct drm_pixmap src_pix;
 	int ret = 0;
 
 	/* Align x to display segment boundaries */
@@ -1051,7 +1052,8 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
 		return ret;
 
 	iosys_map_set_vaddr(&dst, buf);
-	drm_fb_xrgb8888_to_gray8(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, vmap, rect);
+	drm_fb_xrgb8888_to_gray8(&dst, &dst_pitch, &src_pix, fmtcnv_state);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index c5f1d0634492e..492c3e7291226 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -613,6 +613,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
 	u8 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
+	struct drm_pixmap src_pix;
 
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
@@ -634,7 +635,9 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_gray8(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, &fb, &src, &params->clip);
+
+	drm_fb_xrgb8888_to_gray8(&dst, dst_pitch, &src_pix, &fmtcnv_state);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 7336fa1ddaed1..5f8e18383e249 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -71,6 +71,7 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 	unsigned int x, y;
 	u8 *src, *buf, val;
 	struct iosys_map dst_map, vmap;
+	struct drm_pixmap src_pix;
 
 	buf = kmalloc(len, GFP_KERNEL);
 	if (!buf)
@@ -78,7 +79,8 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 
 	iosys_map_set_vaddr(&dst_map, buf);
 	iosys_map_set_vaddr(&vmap, vaddr);
-	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, clip, fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, &vmap, clip);
+	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &src_pix, fmtcnv_state);
 	src = buf;
 
 	for (y = clip->y1; y < clip->y2; y++) {
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 497878d6da1de..e4b75fd42e800 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -130,8 +130,8 @@ void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *d
 				    const struct drm_pixmap *src_pix,
 				    struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
-			      const struct iosys_map *src, const struct drm_framebuffer *fb,
-			      const struct drm_rect *clip, struct drm_format_conv_state *state);
+			      const struct drm_pixmap *src_pix,
+			      struct drm_format_conv_state *state);
 
 int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
 		const struct iosys_map *src, const struct drm_framebuffer *fb,
-- 
2.43.0

