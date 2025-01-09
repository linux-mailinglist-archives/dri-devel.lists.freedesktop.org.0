Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F4AA07A21
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 16:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D1F10EE32;
	Thu,  9 Jan 2025 15:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ntZkX8HI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KRido0aS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ntZkX8HI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KRido0aS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776C510EE27;
 Thu,  9 Jan 2025 15:03:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 157402116D;
 Thu,  9 Jan 2025 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736434996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sh7vVw1B49hkDdbVfqLYlvz8obe5G8l/LkcFxQMXdM=;
 b=ntZkX8HIPc1qGvPW8UM3Evg6Ff9TM4m/+rMTrtZcyvaUoSYG4MrK4zcw+XGDVVaTWpH7VQ
 7fbl79Pw4UcW5H8ug3QUw8sp9ufyiWEcAHz3WKEHjB9MqZMiL/ntefZ7I6bgtfudgZeMg4
 Eezv9GbAWHlf4ZgRNmiE562bHzv0X/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736434996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sh7vVw1B49hkDdbVfqLYlvz8obe5G8l/LkcFxQMXdM=;
 b=KRido0aSgwUv2dnvGXNMHH0PnwD78rt0xuNhPUc3UhOyhb1FS2KDnnaKFfuch02NIZf5DB
 LvLC3fVQ/RHRQjCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ntZkX8HI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KRido0aS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736434996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sh7vVw1B49hkDdbVfqLYlvz8obe5G8l/LkcFxQMXdM=;
 b=ntZkX8HIPc1qGvPW8UM3Evg6Ff9TM4m/+rMTrtZcyvaUoSYG4MrK4zcw+XGDVVaTWpH7VQ
 7fbl79Pw4UcW5H8ug3QUw8sp9ufyiWEcAHz3WKEHjB9MqZMiL/ntefZ7I6bgtfudgZeMg4
 Eezv9GbAWHlf4ZgRNmiE562bHzv0X/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736434996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sh7vVw1B49hkDdbVfqLYlvz8obe5G8l/LkcFxQMXdM=;
 b=KRido0aSgwUv2dnvGXNMHH0PnwD78rt0xuNhPUc3UhOyhb1FS2KDnnaKFfuch02NIZf5DB
 LvLC3fVQ/RHRQjCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8ED65139AB;
 Thu,  9 Jan 2025 15:03:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cNeRITPlf2c1awAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 02/25] drm/dumb-buffers: Provide helper to set pitch and
 size
Date: Thu,  9 Jan 2025 15:56:56 +0100
Message-ID: <20250109150310.219442-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 157402116D
X-Spam-Level: 
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[19]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
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

Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
scanline pitch and allocation size. Implementations of struct
drm_driver.dumb_create can call the new helper for their size
computations. There's currently quite a bit of code duplication
among DRM's memory managers. Each calculates scanline pitch and
buffer size from the given arguments, but the implementations are
inconsistent in how they treat alignment and format support. Later
patches will unify this code on top of drm_mode_size_dumb() as
much as possible.

drm_mode_size_dumb() uses existing 4CC format helpers to interpret the
given color mode. This makes the dumb-buffer interface behave similar
the kernel's video= parameter. Again, current per-driver implementations
likely have subtle differences or bugs in how they support color modes.

Future directions: one bug is present in the current input validation
in drm_mode_create_dumb(). The dumb-buffer overflow tests round up any
given bits-per-pixel value to a multiple of 8. So even one-bit formats,
such as DRM_FORMAT_C1, require 8 bits per pixel. While not common,
low-end displays use such formats; with a possible overcommitment of
memory. At some point, the validation logic in drm_mode_size_dumb() is
supposed to replace the erronous code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_dumb_buffers.c | 93 ++++++++++++++++++++++++++++++
 include/drm/drm_dumb_buffers.h     | 14 +++++
 2 files changed, 107 insertions(+)
 create mode 100644 include/drm/drm_dumb_buffers.h

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 9916aaf5b3f2..fd39720bd617 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -25,6 +25,8 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_mode.h>
 
@@ -57,6 +59,97 @@
  * a hardware-specific ioctl to allocate suitable buffer objects.
  */
 
+static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
+			       unsigned long pitch_align,
+			       unsigned long size_align)
+{
+	u32 pitch = args->pitch;
+	u32 size;
+
+	if (!pitch)
+		return -EINVAL;
+
+	if (pitch_align)
+		pitch = roundup(pitch, pitch_align);
+
+	/* overflow checks for 32bit size calculations */
+	if (args->height > U32_MAX / pitch)
+		return -EINVAL;
+
+	if (!size_align)
+		size_align = PAGE_SIZE;
+	else if (!IS_ALIGNED(size_align, PAGE_SIZE))
+		return -EINVAL;
+
+	size = ALIGN(args->height * pitch, size_align);
+	if (!size)
+		return -EINVAL;
+
+	args->pitch = pitch;
+	args->size = size;
+
+	return 0;
+}
+
+/**
+ * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
+ * @dev: DRM device
+ * @args: Parameters for the dumb buffer
+ * @pitch_align: Scanline alignment in bytes
+ * @size_align: Buffer-size alignment in bytes
+ *
+ * The helper drm_mode_size_dumb() calculates the size of the buffer
+ * allocation and the scanline size for a dumb buffer. Callers have to
+ * set the buffers width, height and color mode in the argument @arg.
+ * The helper validates the correctness of the input and tests for
+ * possible overflows. If successful, it returns the dumb buffer's
+ * required scanline pitch and size in &args.
+ *
+ * The parameter @pitch_align allows the driver to specifies an
+ * alignment for the scanline pitch, if the hardware requires any. The
+ * calculated pitch will be a multiple of the alignment. The parameter
+ * @size_align allows to specify an alignment for buffer sizes. The
+ * returned size is always a multiple of PAGE_SIZE.
+ *
+ * Returns:
+ * Zero on success, or a negative error code otherwise.
+ */
+int drm_mode_size_dumb(struct drm_device *dev,
+		       struct drm_mode_create_dumb *args,
+		       unsigned long pitch_align,
+		       unsigned long size_align)
+{
+	u32 fourcc;
+	const struct drm_format_info *info;
+	u64 pitch;
+
+	/*
+	 * The scanline pitch depends on the buffer width and the color
+	 * format. The latter is specified as a color-mode constant for
+	 * which we first have to find the corresponding color format.
+	 *
+	 * Different color formats can have the same color-mode constant.
+	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
+	 * It is possible to use different formats for dumb-buffer allocation
+	 * and rendering as long as all involved formats share the same
+	 * color-mode constant.
+	 */
+	fourcc = drm_driver_color_mode_format(dev, args->bpp);
+	if (fourcc == DRM_FORMAT_INVALID)
+		return -EINVAL;
+	info = drm_format_info(fourcc);
+	if (!info)
+		return -EINVAL;
+	pitch = drm_format_info_min_pitch(info, 0, args->width);
+	if (!pitch || pitch > U32_MAX)
+		return -EINVAL;
+
+	args->pitch = pitch;
+
+	return drm_mode_align_dumb(args, pitch_align, size_align);
+}
+EXPORT_SYMBOL(drm_mode_size_dumb);
+
 int drm_mode_create_dumb(struct drm_device *dev,
 			 struct drm_mode_create_dumb *args,
 			 struct drm_file *file_priv)
diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
new file mode 100644
index 000000000000..6fe36004b19d
--- /dev/null
+++ b/include/drm/drm_dumb_buffers.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __DRM_DUMB_BUFFERS_H__
+#define __DRM_DUMB_BUFFERS_H__
+
+struct drm_device;
+struct drm_mode_create_dumb;
+
+int drm_mode_size_dumb(struct drm_device *dev,
+		       struct drm_mode_create_dumb *args,
+		       unsigned long pitch_align,
+		       unsigned long size_align);
+
+#endif
-- 
2.47.1

