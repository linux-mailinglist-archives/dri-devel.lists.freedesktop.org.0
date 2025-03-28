Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273F1A74C57
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7002F10EA36;
	Fri, 28 Mar 2025 14:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="z4YCw4Vf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fsm0truj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z4YCw4Vf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fsm0truj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2FB10EA36
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:21:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB58B1F38F;
 Fri, 28 Mar 2025 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743171656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRcP4pMccLNC1wPe4tc3qfCiI2yl7EZar6WcwIKz6ac=;
 b=z4YCw4VfHFor1bSiWsUegQpUiMDrev+/ONDjNojjFtBD4nONPlmSCygs8Ltn0yrIGDYzVy
 To3kRwzqBFNLB6AJidpOOt7ouX0FxjHuD5ZztfZc+DTA1XL+jXnEmJkdpUL+KjUcEqSGKF
 R6BdnqSQAAPokEjpnVhZ2XByUv3uwvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743171656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRcP4pMccLNC1wPe4tc3qfCiI2yl7EZar6WcwIKz6ac=;
 b=Fsm0trujAr7Royp+q7tSmQTWCkJD4nn9/RDhKOG33MwKEbKLikmEw+nud4VxyeXeCI44Xc
 /KD5NVWJyM54j/CA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z4YCw4Vf;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Fsm0truj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743171656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRcP4pMccLNC1wPe4tc3qfCiI2yl7EZar6WcwIKz6ac=;
 b=z4YCw4VfHFor1bSiWsUegQpUiMDrev+/ONDjNojjFtBD4nONPlmSCygs8Ltn0yrIGDYzVy
 To3kRwzqBFNLB6AJidpOOt7ouX0FxjHuD5ZztfZc+DTA1XL+jXnEmJkdpUL+KjUcEqSGKF
 R6BdnqSQAAPokEjpnVhZ2XByUv3uwvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743171656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRcP4pMccLNC1wPe4tc3qfCiI2yl7EZar6WcwIKz6ac=;
 b=Fsm0trujAr7Royp+q7tSmQTWCkJD4nn9/RDhKOG33MwKEbKLikmEw+nud4VxyeXeCI44Xc
 /KD5NVWJyM54j/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CAA7139D4;
 Fri, 28 Mar 2025 14:20:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iMIaHUiw5mdOdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Mar 2025 14:20:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, jani.nikula@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/8] drm/format-helper: Move helpers for pixel conversion
 to header file
Date: Fri, 28 Mar 2025 15:14:57 +0100
Message-ID: <20250328141709.217283-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328141709.217283-1-tzimmermann@suse.de>
References: <20250328141709.217283-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BB58B1F38F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_TLS_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,ffwll.ch,gmail.com,kernel.org];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM draw helpers contain format-conversion helpers that operate
on individual pixels. Move them into an internal header file and adopt
them as individual API. Update the draw code accordingly. The pixel
helpers will also be useful for other format conversion helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_draw.c            | 100 +++-------------------
 drivers/gpu/drm/drm_format_internal.h | 119 ++++++++++++++++++++++++++
 2 files changed, 130 insertions(+), 89 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_format_internal.h

diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
index cb2ad12bce57f..d41f8ae1c1483 100644
--- a/drivers/gpu/drm/drm_draw.c
+++ b/drivers/gpu/drm/drm_draw.c
@@ -11,85 +11,7 @@
 #include <drm/drm_fourcc.h>
 
 #include "drm_draw_internal.h"
-
-/*
- * Conversions from xrgb8888
- */
-
-static u16 convert_xrgb8888_to_rgb565(u32 pix)
-{
-	return ((pix & 0x00F80000) >> 8) |
-	       ((pix & 0x0000FC00) >> 5) |
-	       ((pix & 0x000000F8) >> 3);
-}
-
-static u16 convert_xrgb8888_to_rgba5551(u32 pix)
-{
-	return ((pix & 0x00f80000) >> 8) |
-	       ((pix & 0x0000f800) >> 5) |
-	       ((pix & 0x000000f8) >> 2) |
-	       BIT(0); /* set alpha bit */
-}
-
-static u16 convert_xrgb8888_to_xrgb1555(u32 pix)
-{
-	return ((pix & 0x00f80000) >> 9) |
-	       ((pix & 0x0000f800) >> 6) |
-	       ((pix & 0x000000f8) >> 3);
-}
-
-static u16 convert_xrgb8888_to_argb1555(u32 pix)
-{
-	return BIT(15) | /* set alpha bit */
-	       ((pix & 0x00f80000) >> 9) |
-	       ((pix & 0x0000f800) >> 6) |
-	       ((pix & 0x000000f8) >> 3);
-}
-
-static u32 convert_xrgb8888_to_argb8888(u32 pix)
-{
-	return pix | GENMASK(31, 24); /* fill alpha bits */
-}
-
-static u32 convert_xrgb8888_to_xbgr8888(u32 pix)
-{
-	return ((pix & 0x00ff0000) >> 16) <<  0 |
-	       ((pix & 0x0000ff00) >>  8) <<  8 |
-	       ((pix & 0x000000ff) >>  0) << 16 |
-	       ((pix & 0xff000000) >> 24) << 24;
-}
-
-static u32 convert_xrgb8888_to_abgr8888(u32 pix)
-{
-	return ((pix & 0x00ff0000) >> 16) <<  0 |
-	       ((pix & 0x0000ff00) >>  8) <<  8 |
-	       ((pix & 0x000000ff) >>  0) << 16 |
-	       GENMASK(31, 24); /* fill alpha bits */
-}
-
-static u32 convert_xrgb8888_to_xrgb2101010(u32 pix)
-{
-	pix = ((pix & 0x000000FF) << 2) |
-	      ((pix & 0x0000FF00) << 4) |
-	      ((pix & 0x00FF0000) << 6);
-	return pix | ((pix >> 8) & 0x00300C03);
-}
-
-static u32 convert_xrgb8888_to_argb2101010(u32 pix)
-{
-	pix = ((pix & 0x000000FF) << 2) |
-	      ((pix & 0x0000FF00) << 4) |
-	      ((pix & 0x00FF0000) << 6);
-	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
-}
-
-static u32 convert_xrgb8888_to_abgr2101010(u32 pix)
-{
-	pix = ((pix & 0x00FF0000) >> 14) |
-	      ((pix & 0x0000FF00) << 4) |
-	      ((pix & 0x000000FF) << 22);
-	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
-}
+#include "drm_format_internal.h"
 
 /**
  * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
@@ -104,28 +26,28 @@ u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
 {
 	switch (format) {
 	case DRM_FORMAT_RGB565:
-		return convert_xrgb8888_to_rgb565(color);
+		return drm_pixel_xrgb8888_to_rgb565(color);
 	case DRM_FORMAT_RGBA5551:
-		return convert_xrgb8888_to_rgba5551(color);
+		return drm_pixel_xrgb8888_to_rgba5551(color);
 	case DRM_FORMAT_XRGB1555:
-		return convert_xrgb8888_to_xrgb1555(color);
+		return drm_pixel_xrgb8888_to_xrgb1555(color);
 	case DRM_FORMAT_ARGB1555:
-		return convert_xrgb8888_to_argb1555(color);
+		return drm_pixel_xrgb8888_to_argb1555(color);
 	case DRM_FORMAT_RGB888:
 	case DRM_FORMAT_XRGB8888:
 		return color;
 	case DRM_FORMAT_ARGB8888:
-		return convert_xrgb8888_to_argb8888(color);
+		return drm_pixel_xrgb8888_to_argb8888(color);
 	case DRM_FORMAT_XBGR8888:
-		return convert_xrgb8888_to_xbgr8888(color);
+		return drm_pixel_xrgb8888_to_xbgr8888(color);
 	case DRM_FORMAT_ABGR8888:
-		return convert_xrgb8888_to_abgr8888(color);
+		return drm_pixel_xrgb8888_to_abgr8888(color);
 	case DRM_FORMAT_XRGB2101010:
-		return convert_xrgb8888_to_xrgb2101010(color);
+		return drm_pixel_xrgb8888_to_xrgb2101010(color);
 	case DRM_FORMAT_ARGB2101010:
-		return convert_xrgb8888_to_argb2101010(color);
+		return drm_pixel_xrgb8888_to_argb2101010(color);
 	case DRM_FORMAT_ABGR2101010:
-		return convert_xrgb8888_to_abgr2101010(color);
+		return drm_pixel_xrgb8888_to_abgr2101010(color);
 	default:
 		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
 		return 0;
diff --git a/drivers/gpu/drm/drm_format_internal.h b/drivers/gpu/drm/drm_format_internal.h
new file mode 100644
index 0000000000000..5f82f0b9c8e81
--- /dev/null
+++ b/drivers/gpu/drm/drm_format_internal.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+
+#ifndef DRM_FORMAT_INTERNAL_H
+#define DRM_FORMAT_INTERNAL_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+/*
+ * Each pixel-format conversion helper takes a raw pixel in a
+ * specific input format and returns a raw pixel in a specific
+ * output format. All pixels are in little-endian byte order.
+ *
+ * Function names are
+ *
+ *   drm_pixel_<input>_to_<output>_<algorithm>()
+ *
+ * where <input> and <output> refer to pixel formats. The
+ * <algorithm> is optional and hints to the method used for the
+ * conversion. Helpers with no algorithm given apply pixel-bit
+ * shifting.
+ *
+ * The argument type is u32. We expect this to be wide enough to
+ * hold all conversion input from 32-bit RGB to any output format.
+ * The Linux kernel should avoid format conversion for anything
+ * but XRGB8888 input data. Converting from other format can still
+ * be acceptable in some cases.
+ *
+ * The return type is u32. It is wide enough to hold all conversion
+ * output from XRGB8888. For output formats wider than 32 bit, a
+ * return type of u64 would be acceptable.
+ */
+
+/*
+ * Conversions from XRGB8888
+ */
+
+static inline u32 drm_pixel_xrgb8888_to_rgb565(u32 pix)
+{
+	return ((pix & 0x00f80000) >> 8) |
+	       ((pix & 0x0000fc00) >> 5) |
+	       ((pix & 0x000000f8) >> 3);
+}
+
+static inline u32 drm_pixel_xrgb8888_to_rgbx5551(u32 pix)
+{
+	return ((pix & 0x00f80000) >> 8) |
+	       ((pix & 0x0000f800) >> 5) |
+	       ((pix & 0x000000f8) >> 2);
+}
+
+static inline u32 drm_pixel_xrgb8888_to_rgba5551(u32 pix)
+{
+	return drm_pixel_xrgb8888_to_rgbx5551(pix) |
+	       BIT(0); /* set alpha bit */
+}
+
+static inline u32 drm_pixel_xrgb8888_to_xrgb1555(u32 pix)
+{
+	return ((pix & 0x00f80000) >> 9) |
+	       ((pix & 0x0000f800) >> 6) |
+	       ((pix & 0x000000f8) >> 3);
+}
+
+static inline u32 drm_pixel_xrgb8888_to_argb1555(u32 pix)
+{
+	return BIT(15) | /* set alpha bit */
+	       drm_pixel_xrgb8888_to_xrgb1555(pix);
+}
+
+static inline u32 drm_pixel_xrgb8888_to_argb8888(u32 pix)
+{
+	return GENMASK(31, 24) | /* fill alpha bits */
+	       pix;
+}
+
+static inline u32 drm_pixel_xrgb8888_to_xbgr8888(u32 pix)
+{
+	return ((pix & 0xff000000)) | /* also copy filler bits */
+	       ((pix & 0x00ff0000) >> 16) |
+	       ((pix & 0x0000ff00)) |
+	       ((pix & 0x000000ff) << 16);
+}
+
+static inline u32 drm_pixel_xrgb8888_to_abgr8888(u32 pix)
+{
+	return GENMASK(31, 24) | /* fill alpha bits */
+	       drm_pixel_xrgb8888_to_xbgr8888(pix);
+}
+
+static inline u32 drm_pixel_xrgb8888_to_xrgb2101010(u32 pix)
+{
+	pix = ((pix & 0x000000ff) << 2) |
+	      ((pix & 0x0000ff00) << 4) |
+	      ((pix & 0x00ff0000) << 6);
+	return pix | ((pix >> 8) & 0x00300c03);
+}
+
+static inline u32 drm_pixel_xrgb8888_to_argb2101010(u32 pix)
+{
+	return GENMASK(31, 30) | /* set alpha bits */
+	       drm_pixel_xrgb8888_to_xrgb2101010(pix);
+}
+
+static inline u32 drm_pixel_xrgb8888_to_xbgr2101010(u32 pix)
+{
+	pix = ((pix & 0x00ff0000) >> 14) |
+	      ((pix & 0x0000ff00) << 4) |
+	      ((pix & 0x000000ff) << 22);
+	return pix | ((pix >> 8) & 0x00300c03);
+}
+
+static inline u32 drm_pixel_xrgb8888_to_abgr2101010(u32 pix)
+{
+	return GENMASK(31, 30) | /* set alpha bits */
+	       drm_pixel_xrgb8888_to_xbgr2101010(pix);
+}
+
+#endif
-- 
2.48.1

