Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754E784209D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFBE112EC0;
	Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014E7112EC0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:18 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4BEB1F840;
 Tue, 30 Jan 2024 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tierAKf1aG0Nd2r1Ul3LX1tXqZrGFSTY66ONHBhZi3c=;
 b=PUrXwMKKK5CRpgMBbuguU2ozbqEj/NPz0qacK7HYhkXcqUTBqY95IpA/qoG5gfMu34O4iP
 OvGADfNV1ZPCWtLIrLqY6Tw49fBuz0WIOqUyYxX03t/JZRrM/RGz8dlCPnIX1HT78jxDHa
 u3309XJbEBPdjtr7yflCqOWcoqK3YMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tierAKf1aG0Nd2r1Ul3LX1tXqZrGFSTY66ONHBhZi3c=;
 b=/F6YyHFIYCq72DUMjvliKC5pW995IXhoWqR0b6+PMLq36IvaJ1L7jqu8WhdgNeWA2UpUhg
 PnOvI4lVMQcsmSBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tierAKf1aG0Nd2r1Ul3LX1tXqZrGFSTY66ONHBhZi3c=;
 b=PUrXwMKKK5CRpgMBbuguU2ozbqEj/NPz0qacK7HYhkXcqUTBqY95IpA/qoG5gfMu34O4iP
 OvGADfNV1ZPCWtLIrLqY6Tw49fBuz0WIOqUyYxX03t/JZRrM/RGz8dlCPnIX1HT78jxDHa
 u3309XJbEBPdjtr7yflCqOWcoqK3YMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tierAKf1aG0Nd2r1Ul3LX1tXqZrGFSTY66ONHBhZi3c=;
 b=/F6YyHFIYCq72DUMjvliKC5pW995IXhoWqR0b6+PMLq36IvaJ1L7jqu8WhdgNeWA2UpUhg
 PnOvI4lVMQcsmSBA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F8411376E;
 Tue, 30 Jan 2024 10:07:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id ADq5JVTKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 01/23] drm/format-helper: Add struct drm_pixmap
Date: Tue, 30 Jan 2024 10:53:36 +0100
Message-ID: <20240130100714.12608-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
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

Add struct drm_pixmap to wrap the source parameters for all drawing
operations. This consists of the format, the clipping rectangle, the
line pitch and source data buffers. Also add a helper that creates a
pixmap from a framebuffer.

Existing code uses struct drm_framebuffer for drawing. Converting the
drawing interfaces to struct drm_pixmap will allow for other types of
source buffers, such as plain memory buffers or font data from struct
font_desc.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 49 +++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     | 36 ++++++++++++++++++---
 2 files changed, 81 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index b1be458ed4dda..0b69b16d5802a 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -132,6 +132,55 @@ unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info
 }
 EXPORT_SYMBOL(drm_fb_clip_offset);
 
+static void drm_pixmap_init(struct drm_pixmap *pix, const struct drm_format_info *format,
+			    const struct iosys_map *data, const unsigned int *pitches,
+			    const struct drm_rect *clip)
+{
+	size_t i;
+
+	pix->format = format;
+
+	/*
+	 * TODO: Set the size and data pointers from the
+	 * clipping rectangle and remove their computation
+	 * from the xfrm helpers.
+	 */
+	memcpy(&pix->clip, clip, sizeof(pix->clip));
+
+	for (i = 0; i < format->num_planes; ++i)
+		pix->pitches[i] = pitches[i];
+	for (; i < ARRAY_SIZE(pix->pitches); ++i)
+		pix->pitches[i] = 0;
+
+	for (i = 0; i < format->num_planes; ++i)
+		pix->data[i] = data[i];
+	for (; i < ARRAY_SIZE(pix->data); ++i)
+		iosys_map_clear(&pix->data[i]);
+}
+
+/**
+ * drm_pixmap_init_from_framebuffer - Initializes a pixmap from a DRM framebuffer
+ * @pix: The pixmap to initialize
+ * @fb: DRM framebuffer
+ * @data: Array of source buffers
+ * @clip: Clip rectangle area to copy
+ *
+ * The parameter @data refers to an array with least as many entries as
+ * there are planes in @fb's format. Each entry stores the value for the
+ * format's respective color plane at the same index.
+ */
+void drm_pixmap_init_from_framebuffer(struct drm_pixmap *pix, const struct drm_framebuffer *fb,
+				      const struct iosys_map *data, const struct drm_rect *clip)
+{
+	const struct drm_rect full_clip = DRM_RECT_INIT(0, 0, fb->width, fb->height);
+
+	if (!clip)
+		clip = &full_clip;
+
+	drm_pixmap_init(pix, fb->format, data, fb->pitches, clip);
+}
+EXPORT_SYMBOL(drm_pixmap_init_from_framebuffer);
+
 /* TODO: Make this function work with multi-plane formats. */
 static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
 			 const void *vaddr, const struct drm_framebuffer *fb,
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index f13b34e0b752b..56a98999503e2 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -6,14 +6,14 @@
 #ifndef __LINUX_DRM_FORMAT_HELPER_H
 #define __LINUX_DRM_FORMAT_HELPER_H
 
+#include <linux/iosys-map.h>
 #include <linux/types.h>
 
+#include <drm/drm_fourcc.h>
+#include <drm/drm_rect.h>
+
 struct drm_device;
-struct drm_format_info;
 struct drm_framebuffer;
-struct drm_rect;
-
-struct iosys_map;
 
 /**
  * struct drm_format_conv_state - Stores format-conversion state
@@ -66,6 +66,34 @@ void *drm_format_conv_state_reserve(struct drm_format_conv_state *state,
 				    size_t new_size, gfp_t flags);
 void drm_format_conv_state_release(struct drm_format_conv_state *state);
 
+/**
+ * struct drm_pixmap - source pixmap for format-conversion helpers
+ *
+ * A pixmap represents the source data for drawing operations. All
+ * fields are considered private.
+ */
+struct drm_pixmap {
+	/**
+	 * @format: The pixmap's color format
+	 */
+	const struct drm_format_info *format;
+	/**
+	 * @clip: The cliping rectangle.
+	 */
+	struct drm_rect clip;
+	/**
+	 * @pitches: Per-plane offset between two consecutive rows of pixels in Bytes
+	 */
+	unsigned int pitches[DRM_FORMAT_MAX_PLANES];
+	/**
+	 * @data: Per-plane source buffer
+	 */
+	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
+};
+
+void drm_pixmap_init_from_framebuffer(struct drm_pixmap *pix, const struct drm_framebuffer *fb,
+				      const struct iosys_map *data, const struct drm_rect *clip);
+
 unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
 				const struct drm_rect *clip);
 
-- 
2.43.0

