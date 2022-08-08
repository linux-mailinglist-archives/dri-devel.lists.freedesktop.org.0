Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B1558C961
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 15:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDAD926BC;
	Mon,  8 Aug 2022 12:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309A591071
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 12:54:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E34663794B;
 Mon,  8 Aug 2022 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659963253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PpJarha6z0rKO4iGWeUHIs8U6UBo13PMzmnwdB3iIL8=;
 b=jE2JPKzJRTMqn0//vaR0hU/DjyoTGqJqplwfxjHWq1OnodCGlS3P8xBz2BciIEp+i7L7dR
 UL8jrMPWC/rv0pVf1E08lHDgaBKqp8Ksnb9UeK3nxaaVQ9jZn0k2+LwcDAnKmLwUcyB+Tm
 yRF3abrI9vNwp7FVw4486gmVJhpOHYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659963253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PpJarha6z0rKO4iGWeUHIs8U6UBo13PMzmnwdB3iIL8=;
 b=rpbcmPob7PcowGROvEtnYSgk8lM82PWkcTv3P2VmhnAneqk3Odto7pZOuZ2EesoIv3Yep/
 ujmc8QOInRp/YHCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8910013ADE;
 Mon,  8 Aug 2022 12:54:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aNp0IHUH8WLHUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:54:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Subject: [PATCH v2 14/14] drm/format-helper: Rename parameter vmap to src
Date: Mon,  8 Aug 2022 14:54:06 +0200
Message-Id: <20220808125406.20752-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808125406.20752-1-tzimmermann@suse.de>
References: <20220808125406.20752-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The name the parameter vmap to src in all functions. The parameter
contains the locations of the source data and the new name says that.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 106 ++++++++++++++--------------
 include/drm/drm_format_helper.h     |  18 ++---
 2 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 0fec3b68db95..56642816fdff 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -132,7 +132,7 @@ static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsign
 /* TODO: Make this function work with multi-plane formats. */
 static int drm_fb_xfrm(struct iosys_map *dst,
 		       const unsigned int *dst_pitch, const u8 *dst_pixsize,
-		       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		       const struct iosys_map *src, const struct drm_framebuffer *fb,
 		       const struct drm_rect *clip, bool vaddr_cached_hint,
 		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
@@ -143,13 +143,13 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 	if (!dst_pitch)
 		dst_pitch = default_dst_pitch;
 
-	/* TODO: handle vmap in I/O memory here */
+	/* TODO: handle src in I/O memory here */
 	if (dst[0].is_iomem)
 		return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
-					  vmap[0].vaddr, fb, clip, vaddr_cached_hint, xfrm_line);
+					  src[0].vaddr, fb, clip, vaddr_cached_hint, xfrm_line);
 	else
 		return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
-				     vmap[0].vaddr, fb, clip, vaddr_cached_hint, xfrm_line);
+				     src[0].vaddr, fb, clip, vaddr_cached_hint, xfrm_line);
 }
 
 /**
@@ -157,13 +157,13 @@ static int drm_fb_xfrm(struct iosys_map *dst,
  * @dst: Array of destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @vmap: Array of source buffers
+ * @src: Array of source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * This function copies parts of a framebuffer to display memory. Destination and
  * framebuffer formats must match. No conversion takes place. The parameters @dst,
- * @dst_pitch and @vmap refer to arrays. Each array must have at least as many entries
+ * @dst_pitch and @src refer to arrays. Each array must have at least as many entries
  * as there are planes in @fb's format. Each entry stores the value for the format's
  * respective color plane at the same index.
  *
@@ -171,7 +171,7 @@ static int drm_fb_xfrm(struct iosys_map *dst,
  * top-left corner).
  */
 void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
-		   const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		   const struct iosys_map *src, const struct drm_framebuffer *fb,
 		   const struct drm_rect *clip)
 {
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
@@ -190,16 +190,16 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
 		size_t len_i = DIV_ROUND_UP(drm_rect_width(clip) * bpp_i, 8);
 		unsigned int dst_pitch_i = dst_pitch[i];
 		struct iosys_map dst_i = dst[i];
-		struct iosys_map vmap_i = vmap[i];
+		struct iosys_map src_i = src[i];
 
 		if (!dst_pitch_i)
 			dst_pitch_i = len_i;
 
-		iosys_map_incr(&vmap_i, clip_offset(clip, fb->pitches[i], cpp_i));
+		iosys_map_incr(&src_i, clip_offset(clip, fb->pitches[i], cpp_i));
 		for (y = 0; y < lines; y++) {
-			/* TODO: handle vmap_i in I/O memory here */
-			iosys_map_memcpy_to(&dst_i, 0, vmap_i.vaddr, len_i);
-			iosys_map_incr(&vmap_i, fb->pitches[i]);
+			/* TODO: handle src_i in I/O memory here */
+			iosys_map_memcpy_to(&dst_i, 0, src_i.vaddr, len_i);
+			iosys_map_incr(&src_i, fb->pitches[i]);
 			iosys_map_incr(&dst_i, dst_pitch_i);
 		}
 	}
@@ -231,14 +231,14 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
  * @dst: Array of destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @vmap: Array of source buffers
+ * @src: Array of source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  * @cached: Source buffer is mapped cached (eg. not write-combined)
  *
  * This function copies parts of a framebuffer to display memory and swaps per-pixel
  * bytes during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
  * least as many entries as there are planes in @fb's format. Each entry stores the
  * value for the format's respective color plane at the same index. If @cached is
  * false a temporary buffer is used to cache one pixel line at a time to speed up
@@ -248,7 +248,7 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
  * top-left corner).
  */
 void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
-		 const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		 const struct iosys_map *src, const struct drm_framebuffer *fb,
 		 const struct drm_rect *clip, bool cached)
 {
 	const struct drm_format_info *format = fb->format;
@@ -268,7 +268,7 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		return;
 	}
 
-	drm_fb_xfrm(dst, dst_pitch, &cpp, vmap, fb, clip, cached, swab_line);
+	drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, swab_line);
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
@@ -292,13 +292,13 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
  * @dst: Array of RGB332 destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @vmap: Array of XRGB8888 source buffers
+ * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
  * least as many entries as there are planes in @fb's format. Each entry stores the
  * value for the format's respective color plane at the same index.
  *
@@ -308,14 +308,14 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
  * Drivers can use this function for RGB332 devices that don't support XRGB8888 natively.
  */
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
-			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		1,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
 		    drm_fb_xrgb8888_to_rgb332_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
@@ -360,14 +360,14 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
  * @dst: Array of RGB565 destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @vmap: Array of XRGB8888 source buffer
+ * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  * @swab: Swap bytes
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
  * least as many entries as there are planes in @fb's format. Each entry stores the
  * value for the format's respective color plane at the same index.
  *
@@ -377,7 +377,7 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
  * Drivers can use this function for RGB565 devices that don't support XRGB8888 natively.
  */
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
-			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip, bool swab)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
@@ -391,7 +391,7 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 	else
 		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false, xfrm_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
@@ -415,13 +415,13 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
  * @dst: Array of RGB888 destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @vmap: Array of XRGB8888 source buffers
+ * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
  * least as many entries as there are planes in @fb's format. Each entry stores the
  * value for the format's respective color plane at the same index.
  *
@@ -432,14 +432,14 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
  * support XRGB8888.
  */
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
-			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		3,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
 		    drm_fb_xrgb8888_to_rgb888_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
@@ -463,7 +463,7 @@ static void drm_fb_rgb565_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigne
 }
 
 static void drm_fb_rgb565_to_xrgb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
-				      const struct iosys_map *vmap,
+				      const struct iosys_map *src,
 				      const struct drm_framebuffer *fb,
 				      const struct drm_rect *clip)
 {
@@ -471,7 +471,7 @@ static void drm_fb_rgb565_to_xrgb8888(struct iosys_map *dst, const unsigned int
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
 		    drm_fb_rgb565_to_xrgb8888_line);
 }
 
@@ -491,7 +491,7 @@ static void drm_fb_rgb888_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigne
 }
 
 static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
-				      const struct iosys_map *vmap,
+				      const struct iosys_map *src,
 				      const struct drm_framebuffer *fb,
 				      const struct drm_rect *clip)
 {
@@ -499,7 +499,7 @@ static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
 		    drm_fb_rgb888_to_xrgb8888_line);
 }
 
@@ -526,13 +526,13 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
  * @dst: Array of XRGB2101010 destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @vmap: Array of XRGB8888 source buffers
+ * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
  * least as many entries as there are planes in @fb's format. Each entry stores the
  * value for the format's respective color plane at the same index.
  *
@@ -543,14 +543,14 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
  * natively.
  */
 void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
-				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+				    const struct iosys_map *src, const struct drm_framebuffer *fb,
 				    const struct drm_rect *clip)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
 		    drm_fb_xrgb8888_to_xrgb2101010_line);
 }
 
@@ -576,13 +576,13 @@ static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned
  * @dst: Array of 8-bit grayscale destination buffers
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @vmap: Array of XRGB8888 source buffers
+ * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
  * least as many entries as there are planes in @fb's format. Each entry stores the
  * value for the format's respective color plane at the same index.
  *
@@ -597,14 +597,14 @@ static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned
  * ITU BT.601 is being used for the RGB -> luma (brightness) conversion.
  */
 void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
-			      const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			      const struct iosys_map *src, const struct drm_framebuffer *fb,
 			      const struct drm_rect *clip)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		1,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
 		    drm_fb_xrgb8888_to_gray8_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
@@ -615,14 +615,14 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
  * @dst_format:	FOURCC code of the display's color format
- * @vmap:	The framebuffer memory to copy from
+ * @src:	The framebuffer memory to copy from
  * @fb:		The framebuffer to copy from
  * @clip:	Clip rectangle area to copy
  *
  * This function copies parts of a framebuffer to display memory. If the
  * formats of the display and the framebuffer mismatch, the blit function
  * will attempt to convert between them during the process. The parameters @dst,
- * @dst_pitch and @vmap refer to arrays. Each array must have at least as many
+ * @dst_pitch and @src refer to arrays. Each array must have at least as many
  * entries as there are planes in @dst_format's format. Each entry stores the
  * value for the format's respective color plane at the same index.
  *
@@ -635,7 +635,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
  * a negative error code otherwise.
  */
 int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
-		const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		const struct iosys_map *src, const struct drm_framebuffer *fb,
 		const struct drm_rect *clip)
 {
 	uint32_t fb_format = fb->format->format;
@@ -651,30 +651,30 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		dst_format = DRM_FORMAT_XRGB2101010;
 
 	if (dst_format == fb_format) {
-		drm_fb_memcpy(dst, dst_pitch, vmap, fb, clip);
+		drm_fb_memcpy(dst, dst_pitch, src, fb, clip);
 		return 0;
 
 	} else if (dst_format == DRM_FORMAT_RGB565) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, vmap, fb, clip, false);
+			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, false);
 			return 0;
 		}
 	} else if (dst_format == DRM_FORMAT_RGB888) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, vmap, fb, clip);
+			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip);
 			return 0;
 		}
 	} else if (dst_format == DRM_FORMAT_XRGB8888) {
 		if (fb_format == DRM_FORMAT_RGB888) {
-			drm_fb_rgb888_to_xrgb8888(dst, dst_pitch, vmap, fb, clip);
+			drm_fb_rgb888_to_xrgb8888(dst, dst_pitch, src, fb, clip);
 			return 0;
 		} else if (fb_format == DRM_FORMAT_RGB565) {
-			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, vmap, fb, clip);
+			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, src, fb, clip);
 			return 0;
 		}
 	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, vmap, fb, clip);
+			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
 			return 0;
 		}
 	}
@@ -708,13 +708,13 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
  * @dst: Array of monochrome destination buffers (0=black, 1=white)
  * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
  *             within @dst; can be NULL if scanlines are stored next to each other.
- * @vmap: Array of XRGB8888 source buffers
+ * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
- * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
  * least as many entries as there are planes in @fb's format. Each entry stores the
  * value for the format's respective color plane at the same index.
  *
@@ -734,7 +734,7 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
  * then the result is converted from grayscale to monochrome.
  */
 void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
-			     const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			     const struct iosys_map *src, const struct drm_framebuffer *fb,
 			     const struct drm_rect *clip)
 {
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
@@ -745,7 +745,7 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 	unsigned int cpp = fb->format->cpp[0];
 	unsigned int len_src32 = linepixels * cpp;
 	struct drm_device *dev = fb->dev;
-	void *vaddr = vmap[0].vaddr;
+	void *vaddr = src[0].vaddr;
 	unsigned int dst_pitch_0;
 	unsigned int y;
 	u8 *mono = dst[0].vaddr, *gray8;
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 1e1d8f356cc1..caa181194335 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -15,33 +15,33 @@ unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info
 				const struct drm_rect *clip);
 
 void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
-		   const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		   const struct iosys_map *src, const struct drm_framebuffer *fb,
 		   const struct drm_rect *clip);
 void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
-		 const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		 const struct iosys_map *src, const struct drm_framebuffer *fb,
 		 const struct drm_rect *clip, bool cached);
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
-			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
-			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip, bool swab);
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
-			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
-				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+				    const struct iosys_map *src, const struct drm_framebuffer *fb,
 				    const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
-			      const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			      const struct iosys_map *src, const struct drm_framebuffer *fb,
 			      const struct drm_rect *clip);
 
 int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
-		const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		const struct iosys_map *src, const struct drm_framebuffer *fb,
 		const struct drm_rect *rect);
 
 void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
-			     const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			     const struct iosys_map *src, const struct drm_framebuffer *fb,
 			     const struct drm_rect *clip);
 
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.37.1

