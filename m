Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA00E8420AA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D323E112EE7;
	Tue, 30 Jan 2024 10:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870C112EC9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:21 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6DCA222E0;
 Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+im/Qvlo1eu4PzOTKSiRLRGk6gaQ7v99V6m8NGA3DQ=;
 b=y3VthqcRqTu3t1xx3U1wUllo4KYV/iUw763Tn5puGLjcK+ZE4p343Ijel4S3rGu93v1xQh
 yKXIl4so1eOJKMocatSIEVjUf3CwXJMdqR638jO8pMoeQyr2sK/7YqmaWvAioSbJ166XaZ
 2cDFw9UYSQZh+gI39bA6m2hzPr4+HP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+im/Qvlo1eu4PzOTKSiRLRGk6gaQ7v99V6m8NGA3DQ=;
 b=T2dD9tGeBbG1S6XepvI16J4+mAtam4I7XdXOhQD6XcRdiBitGRoe+OsDKpf2bcU4H1kKNw
 geve5Vjge7BKiOAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+im/Qvlo1eu4PzOTKSiRLRGk6gaQ7v99V6m8NGA3DQ=;
 b=y3VthqcRqTu3t1xx3U1wUllo4KYV/iUw763Tn5puGLjcK+ZE4p343Ijel4S3rGu93v1xQh
 yKXIl4so1eOJKMocatSIEVjUf3CwXJMdqR638jO8pMoeQyr2sK/7YqmaWvAioSbJ166XaZ
 2cDFw9UYSQZh+gI39bA6m2hzPr4+HP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609239;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+im/Qvlo1eu4PzOTKSiRLRGk6gaQ7v99V6m8NGA3DQ=;
 b=T2dD9tGeBbG1S6XepvI16J4+mAtam4I7XdXOhQD6XcRdiBitGRoe+OsDKpf2bcU4H1kKNw
 geve5Vjge7BKiOAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 95D4613462;
 Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id aJGDI1fKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 18/23] drm/format-helper: Use struct drm_pixmap for
 drm_fb_xrgb8888_to_mono()
Date: Tue, 30 Jan 2024 10:53:53 +0100
Message-ID: <20240130100714.12608-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; TO_DN_SOME(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLson8px8pywph8mow9a7f4xe8)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
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

Store the source-buffer parameters of drm_fb_xrgb8888_to_mono()
in struct drm_pixmap. Update the function's interface and all of its
callers.

Callers of drm_fb_xrgb8888_to_mono() initialize the pixmap's
instance from a pre-existing instance of struct drm_framebuffer.
There's potential to simplify some of that code in a later patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c           | 28 +++++++++----------
 drivers/gpu/drm/solomon/ssd130x.c             |  4 ++-
 .../gpu/drm/tests/drm_format_helper_test.c    |  5 +++-
 drivers/gpu/drm/tiny/repaper.c                |  4 ++-
 include/drm/drm_format_helper.h               |  7 +++--
 5 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index eb621b7da38e0..1dc59c750c3b4 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1105,18 +1105,17 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
 
 /**
  * drm_fb_xrgb8888_to_mono - Convert XRGB8888 to monochrome
+ * @dev: DRM device
  * @dst: Array of monochrome destination buffers (0=black, 1=white)
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
@@ -1134,25 +1133,26 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
  * This function uses drm_fb_xrgb8888_to_gray8() to convert to grayscale and
  * then the result is converted from grayscale to monochrome.
  */
-void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
-			     const struct iosys_map *src, const struct drm_framebuffer *fb,
-			     const struct drm_rect *clip, struct drm_format_conv_state *state)
+void drm_fb_xrgb8888_to_mono(struct drm_device *dev,
+			     struct iosys_map *dst, const unsigned int *dst_pitch,
+			     const struct drm_pixmap *src_pix,
+			     struct drm_format_conv_state *state)
 {
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
 		0, 0, 0, 0
 	};
+	const struct drm_rect *clip = &src_pix->clip;
 	unsigned int linepixels = drm_rect_width(clip);
 	unsigned int lines = drm_rect_height(clip);
-	unsigned int cpp = fb->format->cpp[0];
+	unsigned int cpp = src_pix->format->cpp[0];
 	unsigned int len_src32 = linepixels * cpp;
-	struct drm_device *dev = fb->dev;
-	void *vaddr = src[0].vaddr;
+	void *vaddr = src_pix->data[0].vaddr;
 	unsigned int dst_pitch_0;
 	unsigned int y;
 	u8 *mono = dst[0].vaddr, *gray8;
 	u32 *src32;
 
-	if (drm_WARN_ON(dev, fb->format->format != DRM_FORMAT_XRGB8888))
+	if (drm_WARN_ON(dev, src_pix->format->format != DRM_FORMAT_XRGB8888))
 		return;
 
 	if (!dst_pitch)
@@ -1182,12 +1182,12 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 
 	gray8 = (u8 *)src32 + len_src32;
 
-	vaddr += clip_offset(clip, fb->pitches[0], cpp);
+	vaddr += clip_offset(clip, src_pix->pitches[0], cpp);
 	for (y = 0; y < lines; y++) {
 		src32 = memcpy(src32, vaddr, len_src32);
 		drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
 		drm_fb_gray8_to_mono_line(mono, gray8, linepixels);
-		vaddr += fb->pitches[0];
+		vaddr += src_pix->pitches[0];
 		mono += dst_pitch_0;
 	}
 }
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 19ce866d98814..daec240adc97a 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1008,6 +1008,7 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
 	struct iosys_map dst;
 	unsigned int dst_pitch;
+	struct drm_pixmap src_pix;
 	int ret = 0;
 
 	/* Align y to display page boundaries */
@@ -1021,7 +1022,8 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 		return ret;
 
 	iosys_map_set_vaddr(&dst, buf);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, vmap, rect);
+	drm_fb_xrgb8888_to_mono(fb->dev, &dst, &dst_pitch, &src_pix, fmtcnv_state);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 492c3e7291226..8c3de91191006 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1088,6 +1088,7 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
 	u8 *buf = NULL;
 	__le32 *xrgb8888 = NULL;
 	struct iosys_map dst, src;
+	struct drm_pixmap src_pix;
 
 	struct drm_framebuffer fb = {
 		.format = drm_format_info(DRM_FORMAT_XRGB8888),
@@ -1109,7 +1110,9 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_mono(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, &fb, &src, &params->clip);
+
+	drm_fb_xrgb8888_to_mono(NULL, &dst, dst_pitch, &src_pix, &fmtcnv_state);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 8fd6758f5725f..8c97d865a3143 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -517,6 +517,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb,
 	unsigned int dst_pitch = 0;
 	struct iosys_map dst, vmap;
 	struct drm_rect clip;
+	struct drm_pixmap src_pix;
 	int idx, ret = 0;
 	u8 *buf = NULL;
 
@@ -546,7 +547,8 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb,
 
 	iosys_map_set_vaddr(&dst, buf);
 	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip, fmtcnv_state);
+	drm_pixmap_init_from_framebuffer(&src_pix, fb, &vmap, &clip);
+	drm_fb_xrgb8888_to_mono(fb->dev, &dst, &dst_pitch, &src_pix, fmtcnv_state);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index e4b75fd42e800..5e188bcc18b7f 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -137,9 +137,10 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		const struct iosys_map *src, const struct drm_framebuffer *fb,
 		const struct drm_rect *clip, struct drm_format_conv_state *state);
 
-void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
-			     const struct iosys_map *src, const struct drm_framebuffer *fb,
-			     const struct drm_rect *clip, struct drm_format_conv_state *state);
+void drm_fb_xrgb8888_to_mono(struct drm_device *dev,
+			     struct iosys_map *dst, const unsigned int *dst_pitch,
+			     const struct drm_pixmap *src_pix,
+			     struct drm_format_conv_state *state);
 
 size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 				const u32 *native_fourccs, size_t native_nfourccs,
-- 
2.43.0

