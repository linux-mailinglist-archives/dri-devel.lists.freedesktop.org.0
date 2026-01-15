Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939FAD23139
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEDC10E6D9;
	Thu, 15 Jan 2026 08:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yr+i5dVB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="78oMPflR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BiH53wco";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Le9BICc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D75E10E702
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:22:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DCD1E33694;
 Thu, 15 Jan 2026 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768465296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVcrEgrYRYVUoJGpnBQ3L07nF+5/sD/tcIv41h1qU1M=;
 b=yr+i5dVBB6sOXkVV+Uf0rCunaxQsaxo3zIEgt9Q9jnCo3imLSyrKEigJCP+gT1DXK41YYQ
 tu6A24GQYyZygelLVIZqQjHREzxreCI5/3QfTCB1bT+uE2jUCIit1fqUOvu7OQ4nHesgZ9
 BMy223scQ26sJnFB34zGXpVCCdO5Bfc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768465296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVcrEgrYRYVUoJGpnBQ3L07nF+5/sD/tcIv41h1qU1M=;
 b=78oMPflRMQ3c8J6G92O3gcOYM+AesiUAI0D+oLrIX6KN1qurhRcD86cWrzH030ENSINgzV
 XV/2/BlNsFrqUzCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BiH53wco;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Le9BICc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768465295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVcrEgrYRYVUoJGpnBQ3L07nF+5/sD/tcIv41h1qU1M=;
 b=BiH53wcoL8T4yfqrqYV/qvIRPC6bE8rErJSew03h3BBoyUnI26N1ut0bXpRK6bNDj7rM/9
 BleD8mIUKZRY0CkN+mIwJqIlexfbH+49txJukyFQN5D1ptQxUxJw/QoZjzPgf7DGqvf0mY
 BUHOWePBiPQMi18d2qzOrgXE9Ga/BZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768465295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVcrEgrYRYVUoJGpnBQ3L07nF+5/sD/tcIv41h1qU1M=;
 b=Le9BICc/ukdXVtlao5Z6RxfO0Ebx+vG04T9tgvBHl5r+LzCwztTsR+QdoN772FxP2qTOnA
 GMMtzaWy1onjAoBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C8E93EA65;
 Thu, 15 Jan 2026 08:21:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KCHhII+jaGkjBQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jan 2026 08:21:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 11/12] drm/sysfb: corebootdrm: Add DRM driver for coreboot
 framebuffers
Date: Thu, 15 Jan 2026 08:57:21 +0100
Message-ID: <20260115082128.12460-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115082128.12460-1-tzimmermann@suse.de>
References: <20260115082128.12460-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[12];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 R_RATELIMIT(0.00)[to_ip_from(RLegosg57ubitsp1hzqd38n4uy)];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: DCD1E33694
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Add corebotdrm, a DRM driver for coreboot framebuffers. The driver
supports a pre-initialized framebuffer with various packed RGB formats.
The driver code is fairly small and uses the same logic as the other
sysfb drivers. Most of the implementation comes from existing sysfb
helpers.

Until now, coreboot relied on simpledrm or simplefb for boot-up graphics
output. Initialize the platform device for corebootdrm in the same place
in framebuffer_probe(). With a later commit, the simple-framebuffer should
be removed.

v2:
- reimplement as platform driver
- limit resources and mappings to known framebuffer memory; no
  page alignment
- create corebootdrm device from coreboot framebuffer code

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/google/Kconfig               |   3 +-
 .../firmware/google/framebuffer-coreboot.c    |  17 +-
 drivers/gpu/drm/sysfb/Kconfig                 |  16 +
 drivers/gpu/drm/sysfb/Makefile                |   1 +
 drivers/gpu/drm/sysfb/corebootdrm.c           | 412 ++++++++++++++++++
 include/linux/coreboot.h                      |   4 +
 6 files changed, 449 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/corebootdrm.c

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 3ab3e089328b..b78c644fa253 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -63,7 +63,8 @@ config GOOGLE_FRAMEBUFFER_COREBOOT
 	help
 	  This option enables the kernel to search for a framebuffer in
 	  the coreboot table.  If found, it is registered with a platform
-	  device of type simple-framebuffer.
+	  device of type coreboot-framebuffer. Using the old device of
+	  type simple-framebuffer is deprecated.
 
 config GOOGLE_MEMCONSOLE_COREBOOT
 	tristate "Firmware Memory Console"
diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index 2d468d055872..0992288eda28 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -76,22 +76,23 @@ static struct device *framebuffer_parent_dev(struct resource *res)
 	return NULL;
 }
 
-static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
-
 static int framebuffer_probe(struct coreboot_device *dev)
 {
-	int i;
 	struct lb_framebuffer *fb = &dev->framebuffer;
 	struct device *parent;
 	struct platform_device *pdev;
 	struct resource res;
 	int ret;
+#if !IS_ENABLED(CONFIG_DRM_COREBOOTDRM)
 	struct simplefb_platform_data pdata = {
 		.width = fb->x_resolution,
 		.height = fb->y_resolution,
 		.stride = fb->bytes_per_line,
 		.format = NULL,
 	};
+	int i;
+	static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
+#endif
 
 	/*
 	 * On coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
@@ -118,6 +119,15 @@ static int framebuffer_probe(struct coreboot_device *dev)
 	if (IS_ERR(parent))
 		return PTR_ERR(parent);
 
+#if IS_ENABLED(CONFIG_DRM_COREBOOTDRM)
+	pdev = platform_device_register_resndata(parent, "coreboot-framebuffer", 0,
+						 &res, 1, fb, fb->size);
+	if (IS_ERR(pdev)) {
+		pr_warn("coreboot: could not register framebuffer\n");
+		ret = PTR_ERR(pdev);
+		goto err_put_device_parent;
+	}
+#else
 	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
 		if (fb->bits_per_pixel     == formats[i].bits_per_pixel &&
 		    fb->red_mask_pos       == formats[i].red.offset &&
@@ -142,6 +152,7 @@ static int framebuffer_probe(struct coreboot_device *dev)
 		pr_warn("coreboot: could not register framebuffer\n");
 		goto err_put_device_parent;
 	}
+#endif
 
 	if (parent)
 		put_device(parent);
diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index 9c9884c7efc6..2559ead6cf1f 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -7,6 +7,22 @@ config DRM_SYSFB_HELPER
 	tristate
 	depends on DRM
 
+config DRM_COREBOOTDRM
+	tristate "Coreboot framebuffer driver"
+	depends on DRM && MMU
+	depends on GOOGLE_FRAMEBUFFER_COREBOOT
+	select APERTURE_HELPERS
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select DRM_SYSFB_HELPER
+	help
+	  DRM driver for coreboot-provided framebuffers.
+
+	  This driver assumes that the display hardware has been initialized
+	  by coreboot firmware before the kernel boots. Scanout buffer, size,
+	  and display format must be provided via coreboot framebuffer device.
+
 config DRM_EFIDRM
 	tristate "EFI framebuffer driver"
 	depends on DRM && MMU && EFI && (!SYSFB_SIMPLEFB || COMPILE_TEST)
diff --git a/drivers/gpu/drm/sysfb/Makefile b/drivers/gpu/drm/sysfb/Makefile
index a156c496413d..85c9087ab03d 100644
--- a/drivers/gpu/drm/sysfb/Makefile
+++ b/drivers/gpu/drm/sysfb/Makefile
@@ -6,6 +6,7 @@ drm_sysfb_helper-y := \
 drm_sysfb_helper-$(CONFIG_SCREEN_INFO) += drm_sysfb_screen_info.o
 obj-$(CONFIG_DRM_SYSFB_HELPER)	+= drm_sysfb_helper.o
 
+obj-$(CONFIG_DRM_COREBOOTDRM)	+= corebootdrm.o
 obj-$(CONFIG_DRM_EFIDRM)	+= efidrm.o
 obj-$(CONFIG_DRM_OFDRM)		+= ofdrm.o
 obj-$(CONFIG_DRM_SIMPLEDRM)	+= simpledrm.o
diff --git a/drivers/gpu/drm/sysfb/corebootdrm.c b/drivers/gpu/drm/sysfb/corebootdrm.c
new file mode 100644
index 000000000000..745318580a5d
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/corebootdrm.c
@@ -0,0 +1,412 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/aperture.h>
+#include <linux/coreboot.h>
+#include <linux/minmax.h>
+#include <linux/platform_device.h>
+
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_shmem.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#include "drm_sysfb_helper.h"
+
+#define DRIVER_NAME	"corebootdrm"
+#define DRIVER_DESC	"DRM driver for Coreboot framebuffers"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+static const struct drm_format_info *
+corebootdrm_get_format_fb(struct drm_device *dev, const struct lb_framebuffer *fb)
+{
+	static const struct drm_sysfb_format formats[] = {
+		{ PIXEL_FORMAT_XRGB1555, DRM_FORMAT_XRGB1555, },
+		{ PIXEL_FORMAT_RGB565, DRM_FORMAT_RGB565, },
+		{ PIXEL_FORMAT_RGB888, DRM_FORMAT_RGB888, },
+		{ PIXEL_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, },
+		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
+		{ PIXEL_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, },
+	};
+	const struct pixel_format pixel = {
+		.bits_per_pixel = fb->bits_per_pixel,
+		.indexed  = false,
+		.alpha = {
+			.offset = 0,
+			.length = 0,
+		},
+		.red = {
+			.offset = fb->red_mask_pos,
+			.length = fb->red_mask_size,
+		},
+		.green = {
+			.offset = fb->green_mask_pos,
+			.length = fb->green_mask_size,
+		},
+		.blue = {
+			.offset = fb->blue_mask_pos,
+			.length = fb->blue_mask_size,
+		},
+	};
+
+	return drm_sysfb_get_format(dev, formats, ARRAY_SIZE(formats), &pixel);
+}
+
+static int corebootdrm_get_width_fb(struct drm_device *dev, const struct lb_framebuffer *fb)
+{
+	return drm_sysfb_get_validated_int0(dev, "width", fb->x_resolution, INT_MAX);
+}
+
+static int corebootdrm_get_height_fb(struct drm_device *dev, const struct lb_framebuffer *fb)
+{
+	return drm_sysfb_get_validated_int0(dev, "height", fb->y_resolution, INT_MAX);
+}
+
+static int corebootdrm_get_pitch_fb(struct drm_device *dev, const struct drm_format_info *format,
+				    unsigned int width, const struct lb_framebuffer *fb)
+{
+	u64 bytes_per_line = fb->bytes_per_line;
+
+	if (!bytes_per_line)
+		bytes_per_line = drm_format_info_min_pitch(format, 0, width);
+
+	return drm_sysfb_get_validated_int0(dev, "pitch", bytes_per_line, INT_MAX);
+}
+
+static resource_size_t corebootdrm_get_size_fb(struct drm_device *dev, unsigned int height,
+					       unsigned int pitch,
+					       const struct lb_framebuffer *fb)
+{
+	resource_size_t size;
+
+	if (check_mul_overflow(height, pitch, &size))
+		return 0;
+
+	return size;
+}
+
+static phys_addr_t corebootdrm_get_address_fb(struct drm_device *dev, resource_size_t size,
+					      const struct lb_framebuffer *fb)
+{
+	if (size > PHYS_ADDR_MAX)
+		return 0;
+	if (!fb->physical_address)
+		return 0;
+	if (fb->physical_address > (PHYS_ADDR_MAX - size))
+		return 0;
+
+	return fb->physical_address;
+}
+
+/*
+ * Simple Framebuffer device
+ */
+
+struct corebootdrm_device {
+	struct drm_sysfb_device sysfb;
+
+	/* modesetting */
+	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
+	struct drm_plane primary_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+};
+
+/*
+ * Modesetting
+ */
+
+static const u64 corebootdrm_primary_plane_format_modifiers[] = {
+	DRM_SYSFB_PLANE_FORMAT_MODIFIERS,
+};
+
+static const struct drm_plane_helper_funcs corebootdrm_primary_plane_helper_funcs = {
+	DRM_SYSFB_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs corebootdrm_primary_plane_funcs = {
+	DRM_SYSFB_PLANE_FUNCS,
+	.destroy = drm_plane_cleanup,
+};
+
+static const struct drm_crtc_helper_funcs corebootdrm_crtc_helper_funcs = {
+	DRM_SYSFB_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs corebootdrm_crtc_funcs = {
+	DRM_SYSFB_CRTC_FUNCS,
+	.destroy = drm_crtc_cleanup,
+};
+
+static const struct drm_encoder_funcs corebootdrm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct drm_connector_helper_funcs corebootdrm_connector_helper_funcs = {
+	DRM_SYSFB_CONNECTOR_HELPER_FUNCS,
+};
+
+static const struct drm_connector_funcs corebootdrm_connector_funcs = {
+	DRM_SYSFB_CONNECTOR_FUNCS,
+	.destroy = drm_connector_cleanup,
+};
+
+static const struct drm_mode_config_funcs corebootdrm_mode_config_funcs = {
+	DRM_SYSFB_MODE_CONFIG_FUNCS,
+};
+
+static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev)
+{
+	struct drm_sysfb_device *sysfb = &cdev->sysfb;
+	struct drm_device *dev = &sysfb->dev;
+	const struct drm_format_info *format = sysfb->fb_format;
+	unsigned int width = sysfb->fb_mode.hdisplay;
+	unsigned int height = sysfb->fb_mode.vdisplay;
+	struct drm_plane *primary_plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+	size_t nformats;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
+	dev->mode_config.min_width = width;
+	dev->mode_config.max_width = max_t(unsigned int, width, DRM_SHADOW_PLANE_MAX_WIDTH);
+	dev->mode_config.min_height = height;
+	dev->mode_config.max_height = max_t(unsigned int, height, DRM_SHADOW_PLANE_MAX_HEIGHT);
+	dev->mode_config.funcs = &corebootdrm_mode_config_funcs;
+	dev->mode_config.preferred_depth = format->depth;
+
+	/* Primary plane */
+
+	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
+					       cdev->formats, ARRAY_SIZE(cdev->formats));
+
+	primary_plane = &cdev->primary_plane;
+	ret = drm_universal_plane_init(dev, primary_plane, 0, &corebootdrm_primary_plane_funcs,
+				       cdev->formats, nformats,
+				       corebootdrm_primary_plane_format_modifiers,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(primary_plane, &corebootdrm_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	/* CRTC */
+
+	crtc = &cdev->crtc;
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&corebootdrm_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &corebootdrm_crtc_helper_funcs);
+
+	/* Encoder */
+
+	encoder = &cdev->encoder;
+	ret = drm_encoder_init(dev, encoder, &corebootdrm_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	/* Connector */
+
+	connector = &cdev->connector;
+	ret = drm_connector_init(dev, connector, &corebootdrm_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(connector, &corebootdrm_connector_helper_funcs);
+	drm_connector_set_panel_orientation_with_quirk(connector,
+						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+						       width, height);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * DRM driver
+ */
+
+DEFINE_DRM_GEM_FOPS(corebootdrm_fops);
+
+static struct drm_driver corebootdrm_drm_driver = {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.fops			= &corebootdrm_fops,
+};
+
+/*
+ * Coreboot driver
+ */
+
+static int corebootdrm_probe(struct platform_device *pdev)
+{
+	const struct lb_framebuffer *fb = dev_get_platdata(&pdev->dev);
+	struct corebootdrm_device *cdev;
+	struct drm_sysfb_device *sysfb;
+	struct drm_device *dev;
+	const struct drm_format_info *format;
+	int width, height, pitch;
+	resource_size_t size;
+	phys_addr_t address;
+	struct resource *res, *mem = NULL;
+	struct resource aperture;
+	void __iomem *screen_base;
+	int ret;
+
+	cdev = devm_drm_dev_alloc(&pdev->dev, &corebootdrm_drm_driver,
+				  struct corebootdrm_device, sysfb.dev);
+	if (IS_ERR(cdev))
+		return PTR_ERR(cdev);
+	platform_set_drvdata(pdev, cdev);
+
+	sysfb = &cdev->sysfb;
+	dev = &sysfb->dev;
+
+	if (!fb) {
+		drm_err(dev, "coreboot framebuffer not found\n");
+		return -EINVAL;
+	} else if (!LB_FRAMEBUFFER_HAS_LFB(fb)) {
+		drm_err(dev, "coreboot framebuffer entry too small\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Hardware settings
+	 */
+
+	format = corebootdrm_get_format_fb(dev, fb);
+	if (!format)
+		return -EINVAL;
+	width = corebootdrm_get_width_fb(dev, fb);
+	if (width < 0)
+		return width;
+	height = corebootdrm_get_height_fb(dev, fb);
+	if (height < 0)
+		return height;
+	pitch = corebootdrm_get_pitch_fb(dev, format, width, fb);
+	if (pitch < 0)
+		return pitch;
+	size = corebootdrm_get_size_fb(dev, height, pitch, fb);
+	if (!size)
+		return -EINVAL;
+	address = corebootdrm_get_address_fb(dev, size, fb);
+	if (!address)
+		return -EINVAL;
+
+	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
+	sysfb->fb_format = format;
+	sysfb->fb_pitch = pitch;
+
+	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sysfb->fb_mode));
+	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, pitch=%d byte\n",
+		&format->format, width, height, pitch);
+
+	/*
+	 * Memory management
+	 */
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		drm_err(dev, "memory resource not found\n");
+		return -EINVAL;
+	}
+
+	mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res),
+				      dev->driver->name);
+	if (!mem) {
+		drm_warn(dev, "could not acquire memory resource at %pr\n", res);
+		/*
+		 * We cannot make this fatal. Sometimes this comes from magic
+		 * spaces our resource handlers simply don't know about. Use
+		 * the memory resource as-is and try to map that instead.
+		 */
+		mem = res;
+	}
+
+	drm_dbg(dev, "using memory resource at %pr\n", mem);
+
+	aperture = DEFINE_RES_MEM(address, size);
+	if (!resource_contains(mem, &aperture)) {
+		drm_err(dev, "framebuffer aperture at invalid memory range %pr\n", &aperture);
+		return -EINVAL;
+	}
+
+	ret = devm_aperture_acquire_for_platform_device(pdev, address, size);
+	if (ret) {
+		drm_err(dev, "could not acquire framebuffer aperture: %d\n", ret);
+		return ret;
+	}
+
+	screen_base = devm_ioremap_wc(&pdev->dev, address, size);
+	if (!screen_base)
+		return -ENOMEM;
+
+	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
+
+	/*
+	 * DRM mode setting and registration
+	 */
+
+	ret = corebootdrm_mode_config_init(cdev);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(dev);
+
+	ret = drm_dev_register(dev, 0);
+	if (ret)
+		return ret;
+
+	drm_client_setup(dev, sysfb->fb_format);
+
+	return 0;
+}
+
+static void corebootdrm_remove(struct platform_device *pdev)
+{
+	struct corebootdrm_device *cdev = platform_get_drvdata(pdev);
+	struct drm_device *dev = &cdev->sysfb.dev;
+
+	drm_dev_unplug(dev);
+}
+
+static struct platform_driver corebootdrm_platform_driver = {
+	.driver = {
+		.name = "coreboot-framebuffer",
+	},
+	.probe = corebootdrm_probe,
+	.remove = corebootdrm_remove,
+};
+
+module_platform_driver(corebootdrm_platform_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
index 514c95f9d0e3..e81ee5746e2b 100644
--- a/include/linux/coreboot.h
+++ b/include/linux/coreboot.h
@@ -14,6 +14,7 @@
 
 #include <linux/compiler_attributes.h>
 #include <linux/types.h>
+#include <linux/stddef.h>
 
 /* List of coreboot entry structures that is used */
 
@@ -64,4 +65,7 @@ struct lb_framebuffer {
 	u8  reserved_mask_size;
 } __packed;
 
+#define LB_FRAMEBUFFER_HAS_LFB(__fb) \
+	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
+
 #endif /* _LINUX_COREBOOT_H */
-- 
2.52.0

