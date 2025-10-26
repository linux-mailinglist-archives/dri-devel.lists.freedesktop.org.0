Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D62FC0B695
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 00:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4527510E30A;
	Sun, 26 Oct 2025 23:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="XcxwhrE2";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="kMm6xi+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA0E10E119
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 23:03:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-68vb.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761519836; 
 b=KqhzFWriHqTSlXiugn+hWt/r2bi7yj116Q2izCRIIvYkCL+5oaXemj1/opiz5bHhfg3hLQGkky
 Qiw8bg6xkrR2Gs6VybtFjKkgAAwoO7ACq47Wnf7nTs8dVG3mF7DczXkivxhtL3igrDXxfEg+EN
 Wl5tIMUOiC5QUeIdedwUHtJ1konojM6qJ3RiSUIC7PpOJwzxxH5awaLfbmQkvBOtLhLD0ZjgZr
 GcsdpmqHvZ1gM//apGUzDdLrTnuPJYxCzNgKfVfVNoQn1ZF98hvAm97oYeDmmBGw9jRlHfme1z
 MDNOcwgpmg38wjG0xFLhM7zK/jstWoF7RLYhpb4xmvsu/Q==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-68vb.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-68vb.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761519836; 
 bh=xoXrhHzPCacrBzsTec8U9Lev82WQujM7eNeHxPp4vjM=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=GGEZDj4F8FietF/oxwCFRBAWvHxe/6e8vmvoAh2YKQgYPBk1/AkiGTCIUHhUVt6AJ18WH8b/yX
 nmxe79VSsw/u0GzN8IABush4sueRWN3aca52rfF+WtMkzDqb+vwFWS8bOpCvOi8PSDZRKDegdt
 nju/TPIC9gAOu2WsOnKMj9u0Gp68cP3wN47O/eGFPDY7EUwxosE06HZyfKYewAxUWpt8OzdL2K
 Voe+g6j9THMPhpg3zEqg311FYS6+SmaT3Zv95L7o9eMUb1H7dE6OKjXfBf0WGjeVAm1OQkfS5h
 ZCku5u/6huLeguoqV2HUI9BFnMJldrQCU02FoWXmzjRlOQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=vDeCu2zNom6DtRNTKdjnOneiH6FGRfPsrs+H9zgngrs=; b=XcxwhrE2z4UblP7khk3Bi/ibsz
 XkO3r7XoctrLhuFXOXtqXdKzZAn7i5ysxJE/qzfOMwI/u/KMLX0ID9tpsvwk98QmFlQ7p41IkVdBQ
 49PDV7DpuW5DfKCwiw7CFWSsPN/UF9ik0HP/IU5LfKDQVYwoC0EZiDSJyTAtEMBygloE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-68vb.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vD9mC-000000002GL-0elp
 for dri-devel@lists.freedesktop.org; Sun, 26 Oct 2025 23:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=vDeCu2zNom6DtRNTKdjnOneiH6FGRfPsrs+H9zgngrs=; b=kMm6xi+HlNWb6P1p/qs1iRRoa9
 0Be0QjN6xNJIJYETAkSrHGHfHFPEHx/9ZRMK+n5BeJ3r6Os9N1f21IW5EWIc6PtfBiRBBOlAbTrux
 1M3Ex7ZxiuSZU9pMujeYVkmfZWx4BicrA7y6+7zWELPwmGmhNPw+5fIlm/u2qler5auE=;
Received: from [87.17.42.198] (port=63736 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vD9lq-00000000KNm-3FZw; Sun, 26 Oct 2025 23:03:30 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 27 Oct 2025 00:03:01 +0100
Subject: [PATCH RFC 1/3] drm: client: add splash client
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-drm_client_splash-v1-1-00698933b34a@valla.it>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
In-Reply-To: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=27400; i=francesco@valla.it;
 h=from:subject:message-id; bh=xoXrhHzPCacrBzsTec8U9Lev82WQujM7eNeHxPp4vjM=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDBn/VhyQ72B9NPVSsLxHIuPBkPQ5X8Kf/jR1XvKy+qq4Z
 sChJ5bWHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEynUZ/ge9NXJYmKcYeadE
 89d2rm5J5hsu6gcal5w7en+FcWSvRCQjw+Y2TiZ9w8orx+b92H+Hf+UGbV+h7wx+2z8I3GYrfiv
 exQEA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: bc367ee28d5f7359ef3323854d906338
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vD9mC-000000002GL-0elp-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-68vb.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

Add a DRM client that draws a simple splash, with possibility to show:

  - a colored background
  - a text message
  - a progress bar
  - (optionally) a static splash image

The client is not meant to replace a full-featured bootsplash, but
rather to remove some complexity (and hopefully boot time) on small
embedded platforms or on systems with a limited scope (e.g: recovery
or manufacturing images).

The text message and the progress bar can be set through sysfs
properties; a default value for the former can also be set from the
kernel command line using the drm_client_lib.message="<...>" parameter.

If enabled, the splash image is loaded as firmware for each DRM device.
The splash client expects this image to be a binary dump of the graphic
buffer to be shown on the screen connected to the modeset, with the
same dimensions (width and height) and color format.

Just like the existing DRM clients, the splash can be enable from the
kernel command line using drm_client_lib.active=splash.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpu/drm/clients/Kconfig               |  46 +-
 drivers/gpu/drm/clients/Makefile              |   1 +
 drivers/gpu/drm/clients/drm_client_internal.h |   9 +
 drivers/gpu/drm/clients/drm_client_setup.c    |   8 +
 drivers/gpu/drm/clients/drm_splash.c          | 761 ++++++++++++++++++++++++++
 5 files changed, 824 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index 6096c623d9d5b1a3d4a40d986c45aad2f8277767..0b23756f2453c9b815d9f242987d5f386b7a894f 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -12,6 +12,7 @@ config DRM_CLIENT_LIB
 config DRM_CLIENT_SELECTION
 	tristate
 	depends on DRM
+	select DRM_CLIENT_LIB if DRM_CLIENT_SPLASH
 	select DRM_CLIENT_LIB if DRM_CLIENT_LOG
 	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
 	help
@@ -85,10 +86,46 @@ config DRM_CLIENT_LOG
 	  If you only need logs, but no terminal, or if you prefer userspace
 	  terminal, say "Y".
 
+config DRM_CLIENT_SPLASH
+	bool "Display graphical splash"
+	depends on DRM_CLIENT_SELECTION
+	select DRM_CLIENT
+	select DRM_CLIENT_SETUP
+	select DRM_DRAW
+	select FONT_SUPPORT
+	help
+	  This enables a splash drm client, able to display a colored background,
+	  a progress bar, some text and (optionally, if DRM_CLIENT_SPLASH_LOAD_AS_FW
+	  is set) a graphical image until the userspace is ready to take over.
+
+	  Message and progress can be set through sysfs; an initial message can also
+	  be set by using the kernel command line 'drm_client_lib.message=' option.
+
+config DRM_CLIENT_SPLASH_FOREGROUND_COLOR
+	hex "Splash foreground color, in RGB"
+	depends on DRM_CLIENT_SPLASH
+	default 0xffffff
+
+config DRM_CLIENT_SPLASH_BACKGROUND_COLOR
+	hex "Splash background color, in RGB"
+	depends on DRM_CLIENT_SPLASH
+	default 0x000000
+
+config DRM_CLIENT_SPLASH_LOAD_AS_FW
+	bool "Load splash image as firmware"
+	depends on DRM_CLIENT_SPLASH
+	select FW_LOADER
+	help
+	  Load image to be used as splash using the firmware loading facility the
+	  kernel provides.
+
+	  Even when this option is set, the image loading can be avoided by using
+	  the kernel command line 'drm_client_lib.skip_image=true' option.
+
 choice
 	prompt "Default DRM Client"
 	depends on DRM_CLIENT_SELECTION
-	depends on DRM_FBDEV_EMULATION || DRM_CLIENT_LOG
+	depends on DRM_FBDEV_EMULATION || DRM_CLIENT_LOG || DRM_CLIENT_SPLASH
 	default DRM_CLIENT_DEFAULT_FBDEV
 	help
 	  Selects the default drm client.
@@ -111,6 +148,12 @@ config DRM_CLIENT_DEFAULT_LOG
 	  screen, but doesn't implement a full terminal. For that you will need
 	  a userspace terminal using drm/kms.
 
+config DRM_CLIENT_DEFAULT_SPLASH
+	bool "splash"
+	depends on DRM_CLIENT_SPLASH
+	help
+	  Use splash as default drm client.
+
 endchoice
 
 config DRM_CLIENT_DEFAULT
@@ -118,6 +161,7 @@ config DRM_CLIENT_DEFAULT
        depends on DRM_CLIENT
        default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
        default "log" if DRM_CLIENT_DEFAULT_LOG
+       default "splash" if DRM_CLIENT_DEFAULT_SPLASH
        default ""
 
 endmenu
diff --git a/drivers/gpu/drm/clients/Makefile b/drivers/gpu/drm/clients/Makefile
index c16addbc327f09572aa3142cbf0d1d13f172a9e9..3df02d10cd18a47d7e8d7cee70163b0ef0129b51 100644
--- a/drivers/gpu/drm/clients/Makefile
+++ b/drivers/gpu/drm/clients/Makefile
@@ -5,4 +5,5 @@ subdir-ccflags-y += -I$(src)/..
 drm_client_lib-y := drm_client_setup.o
 drm_client_lib-$(CONFIG_DRM_CLIENT_LOG) += drm_log.o
 drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_client.o
+drm_client_lib-$(CONFIG_DRM_CLIENT_SPLASH) += drm_splash.o
 obj-$(CONFIG_DRM_CLIENT_LIB) += drm_client_lib.o
diff --git a/drivers/gpu/drm/clients/drm_client_internal.h b/drivers/gpu/drm/clients/drm_client_internal.h
index 6dc078bf6503b902cbb3267b64ea42d9f1c23375..48ee0c1c2529882b2bf5dc786788390823e25cd6 100644
--- a/drivers/gpu/drm/clients/drm_client_internal.h
+++ b/drivers/gpu/drm/clients/drm_client_internal.h
@@ -22,4 +22,13 @@ void drm_log_register(struct drm_device *dev);
 static inline void drm_log_register(struct drm_device *dev) {}
 #endif
 
+#ifdef CONFIG_DRM_CLIENT_SPLASH
+void drm_splash_register(struct drm_device *dev,
+			 const struct drm_format_info *format);
+#else
+static inline void drm_splash_register(struct drm_device *dev,
+				       const struct drm_format_info *format)
+{}
+#endif
+
 #endif
diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
index 72480db1f00d0b9fcd1fe5aa72a3a31a074393b2..023a142319227c5f7ba887dcd55af4b04942f9ce 100644
--- a/drivers/gpu/drm/clients/drm_client_setup.c
+++ b/drivers/gpu/drm/clients/drm_client_setup.c
@@ -56,6 +56,14 @@ void drm_client_setup(struct drm_device *dev, const struct drm_format_info *form
 		return;
 	}
 #endif
+
+#ifdef CONFIG_DRM_CLIENT_SPLASH
+	if (!strcmp(drm_client_default, "splash")) {
+		drm_splash_register(dev, format);
+		return;
+	}
+#endif
+
 	if (strcmp(drm_client_default, ""))
 		drm_warn(dev, "Unknown DRM client %s\n", drm_client_default);
 }
diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
new file mode 100644
index 0000000000000000000000000000000000000000..308924e917e32d1e6d7686bf6f9b3a3ff2bafe68
--- /dev/null
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -0,0 +1,761 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/*
+ * Copyright (c) 2025 Francesco Valla <francesco@valla.it>
+ *
+ */
+
+#include <linux/atomic.h>
+#include <linux/device.h>
+#include <linux/firmware.h>
+#include <linux/font.h>
+#include <linux/init.h>
+#include <linux/iosys-map.h>
+#include <linux/kthread.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include <drm/drm_client.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+
+#include "drm_client_internal.h"
+#include "drm_draw_internal.h"
+#include "drm_internal.h"
+
+// TODO: determine proper size for max message length
+#define DRM_SPLASH_MAX_MSG_LEN 128
+
+static char *message;
+module_param(message, charp, 0400);
+MODULE_PARM_DESC(message, "Initial message, up to " __stringify(DRM_SPLASH_MAX_MSG_LEN) " chars");
+
+#ifdef CONFIG_DRM_CLIENT_SPLASH_LOAD_AS_FW
+static bool skip_image;
+module_param(skip_image, bool, 0400);
+MODULE_PARM_DESC(skip_image, "Do not try to load splash image (default: false)");
+#endif
+
+/**
+ * DOC: overview
+ *
+ * This is a simple graphic bootsplash.
+ * Images to be shown are loaded as firmware.
+ */
+
+struct drm_splash_scanout {
+	int id;
+	u32 format;
+	unsigned int width;
+	unsigned int height;
+	struct drm_client_buffer *buffer;
+
+	struct mutex lock;
+	const struct font_desc *font;
+	bool bg_drawn;
+	bool message_drawn;
+
+#ifdef CONFIG_DRM_CLIENT_SPLASH_LOAD_AS_FW
+	const struct firmware *fw;
+#endif
+};
+
+struct drm_splash {
+	struct drm_client_dev client;
+	u32 preferred_format;
+	struct device dev;
+
+	struct mutex lock;
+	struct task_struct *thread;
+	atomic_t pending;
+	bool initialized;
+
+	char message[DRM_SPLASH_MAX_MSG_LEN];
+	u8 progress;
+
+	u32 n_scanout;
+	struct drm_splash_scanout *scanout;
+};
+
+static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
+{
+	return container_of_const(client, struct drm_splash, client);
+}
+
+static struct drm_splash_scanout *
+get_scanout_from_tile_group(struct drm_splash *splash, int id)
+{
+	int j;
+
+	for (j = 0; j < splash->n_scanout; j++)
+		if (splash->scanout[j].id == id)
+			return &splash->scanout[j];
+
+	return NULL;
+}
+
+static u32 drm_splash_find_usable_format(struct drm_plane *plane,
+					 u32 preferred_format)
+{
+	int i;
+
+	/* If preferred format is not set, use RGB888 (which offers full colors
+	 * with minimal occupation).
+	 */
+	if (preferred_format == 0)
+		preferred_format = DRM_FORMAT_RGB888;
+
+	/* Check if the preferred format can be used */
+	for (i = 0; i < plane->format_count; i++)
+		if (plane->format_types[i] == preferred_format)
+			return preferred_format;
+
+	/* Otherwise, find the first format that can be converted from XRGB8888 */
+	for (i = 0; i < plane->format_count; i++)
+		if (drm_draw_color_from_xrgb8888(0xffffffff, plane->format_types[i]) != 0)
+			return plane->format_types[i];
+
+	return DRM_FORMAT_INVALID;
+}
+
+static void drm_splash_blit(struct iosys_map *dst, unsigned int dst_pitch,
+			    const u8 *src, unsigned int src_pitch,
+			    u32 height, u32 width, u32 px_width, u32 color)
+{
+	switch (px_width) {
+	case 2:
+		drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, width, 1, color);
+		break;
+	case 3:
+		drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, width, 1, color);
+		break;
+	case 4:
+		drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, width, 1, color);
+		break;
+	default:
+		WARN_ONCE(1, "Can't blit with pixel width %d\n", px_width);
+	}
+}
+
+static void drm_splash_fill(struct iosys_map *map, unsigned int dst_pitch,
+			    unsigned int height, unsigned int width,
+			    u32 px_width, u32 color)
+{
+	switch (px_width) {
+	case 2:
+		drm_draw_fill16(map, dst_pitch, height, width, color);
+		break;
+	case 3:
+		drm_draw_fill24(map, dst_pitch, height, width, color);
+		break;
+	case 4:
+		drm_draw_fill32(map, dst_pitch, height, width, color);
+		break;
+	default:
+		WARN_ONCE(1, "Can't fill with pixel width %d\n", px_width);
+	}
+}
+
+static int drm_splash_fill_solid_color(struct drm_client_buffer *buffer, u32 color)
+{
+	struct drm_client_dev *client = buffer->client;
+	struct drm_framebuffer *fb = buffer->fb;
+	struct drm_rect r = DRM_RECT_INIT(0, 0, fb->width, fb->height);
+	u32 px_width = fb->format->cpp[0];
+	struct iosys_map map;
+	int ret;
+
+	ret = drm_client_buffer_vmap_local(buffer, &map);
+	if (ret) {
+		drm_err(client->dev, "splash: cannot vmap buffer: %d", ret);
+		return ret;
+	}
+
+	drm_splash_fill(&map, fb->pitches[0], drm_rect_height(&r),
+			drm_rect_width(&r), px_width, color);
+
+	drm_client_buffer_vunmap_local(buffer);
+
+	return drm_client_framebuffer_flush(buffer, &r);
+}
+
+#ifdef CONFIG_DRM_CLIENT_SPLASH_LOAD_AS_FW
+static int drm_splash_fill_from_data(struct drm_client_buffer *buffer,
+				     const u8 *data, size_t data_len)
+{
+	struct drm_client_dev *client = buffer->client;
+	struct drm_framebuffer *fb = buffer->fb;
+	struct drm_rect r = DRM_RECT_INIT(0, 0, fb->width, fb->height);
+	struct iosys_map map;
+	size_t buffer_size;
+	int ret;
+
+	buffer_size = fb->width * fb->height * fb->format->cpp[0];
+	if (data_len != buffer_size) {
+		drm_err(client->dev,
+			"splash: data size mismatch (expected %zu, got %zu)",
+			data_len, buffer_size);
+		return -ENODATA;
+	}
+
+	ret = drm_client_buffer_vmap_local(buffer, &map);
+	if (ret) {
+		drm_err(client->dev, "splash: cannot vmap buffer: %d", ret);
+		return ret;
+	}
+
+	iosys_map_memcpy_to(&map, 0, data, data_len);
+
+	drm_client_buffer_vunmap_local(buffer);
+
+	return drm_client_framebuffer_flush(buffer, &r);
+}
+#endif
+
+static int drm_splash_draw_bar_message(struct drm_splash_scanout *scanout,
+				       const char *msg,
+				       unsigned int progress,
+				       u32 bg_color,
+				       u32 fg_color)
+{
+	struct drm_framebuffer *fb = scanout->buffer->fb;
+	const struct font_desc *font = scanout->font;
+	size_t font_pitch = DIV_ROUND_UP(font->width, 8);
+	u32 px_width = fb->format->cpp[0];
+	unsigned int y_padding = 2;
+	struct drm_rect r = DRM_RECT_INIT(0, fb->height * 3 / 4 - y_padding,
+					  fb->width, font->height + y_padding);
+	unsigned int fill_width = drm_rect_width(&r) * progress / 100;
+	struct iosys_map map;
+	const u8 *src;
+	size_t i, len;
+
+	/* Clamp len if required */
+	len = min(strlen(msg), drm_rect_width(&r) / font->width);
+
+	if (drm_client_buffer_vmap_local(scanout->buffer, &map))
+		return -1;
+
+	/* Draw progress bar */
+	iosys_map_incr(&map, r.y1 * fb->pitches[0]);
+	drm_splash_fill(&map, fb->pitches[0], drm_rect_height(&r),
+			drm_rect_width(&r), px_width, bg_color);
+	drm_splash_fill(&map, fb->pitches[0], drm_rect_height(&r),
+			fill_width, px_width, fg_color);
+
+	/* Center the message horizontally */
+	iosys_map_incr(&map, y_padding * fb->pitches[0]);
+	iosys_map_incr(&map, (drm_rect_width(&r) - (font->width * len)) * px_width / 2);
+
+	/* Write message */
+	for (i = 0; i < len; i++) {
+		unsigned int ch_x;
+
+		src = drm_draw_get_char_bitmap(font, msg[i], font_pitch);
+
+		/* Use background color over fill bar, foreground otherwise */
+		ch_x = (drm_rect_width(&r) - font->width * len) / 2 + i * font->width;
+		drm_splash_blit(&map, fb->pitches[0], src, font_pitch,
+				font->height, font->width, px_width,
+				(fill_width > ch_x) ? bg_color : fg_color);
+		iosys_map_incr(&map, font->width * px_width);
+	}
+
+	drm_client_buffer_vunmap_local(scanout->buffer);
+	drm_client_framebuffer_flush(scanout->buffer, &r);
+
+	return 0;
+}
+
+static int drm_splash_draw_scanout(struct drm_splash_scanout *scanout,
+				   const char *msg, unsigned int progress)
+{
+	u32 bg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR,
+						    scanout->format);
+	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_CLIENT_SPLASH_FOREGROUND_COLOR,
+						    scanout->format);
+	int ret = -ENOENT;
+
+	if (!scanout->buffer)
+		return -ENODEV;
+
+#ifdef CONFIG_DRM_CLIENT_SPLASH_LOAD_AS_FW
+	if (!skip_image) {
+		const struct firmware *fw = NULL;
+
+		scoped_guard(mutex, &scanout->lock) {
+			fw = scanout->fw;
+			scanout->fw = NULL;
+		}
+
+		if (fw) {
+			ret = drm_splash_fill_from_data(scanout->buffer,
+							fw->data, fw->size);
+			release_firmware(fw);
+
+			if (ret == 0)
+				scanout->bg_drawn = true;
+		}
+	}
+#endif
+
+	/* If no firmware has been used to fill the screen (either by choice of
+	 * because it's unavailable) fill the screen with the background color.
+	 *
+	 */
+	if (!scanout->bg_drawn) {
+		drm_splash_fill_solid_color(scanout->buffer, bg_color);
+		scanout->bg_drawn = true;
+	}
+
+	/* If message is empty and no previous message was shown, there is
+	 * nothing to do
+	 */
+	if (scanout->message_drawn || strlen(msg) != 0 || progress != 0) {
+		ret = drm_splash_draw_bar_message(scanout, msg, progress,
+						  bg_color, fg_color);
+		if (ret)
+			return ret;
+
+		scanout->message_drawn = true;
+	}
+
+	return 0;
+}
+
+static int drm_splash_render_thread(void *data)
+{
+	struct drm_splash *splash = data;
+	struct drm_client_dev *client = &splash->client;
+	char buf[sizeof(splash->message)];
+	unsigned int progress;
+
+	while (!kthread_should_stop()) {
+		unsigned int draw_count = 0;
+		int j, ret;
+
+		/* Copy message and progress to be drawn, to avoid locking for
+		 * too much time and/or showing different contents on different
+		 * screens.
+		 */
+		scoped_guard(mutex, &splash->lock) {
+			strscpy(buf, splash->message);
+			progress = splash->progress;
+		}
+
+		for (j = 0; j < splash->n_scanout; j++) {
+			ret = drm_splash_draw_scanout(&splash->scanout[j], buf,
+						      progress);
+			if (ret) {
+				drm_err(client->dev,
+					"splash: failed to fill scanout %d: %d",
+					j, ret);
+				continue;
+			}
+
+			draw_count++;
+		}
+
+		if (draw_count > 0) {
+			ret = drm_client_modeset_commit(client);
+			/* If commit returns EBUSY, another master showed up.
+			 * This means that the splash is no more required.
+			 */
+			if (ret == -EBUSY) {
+				drm_info(client->dev,
+					"splash: not master anymore, exiting");
+				break;
+			}
+		}
+
+		/* If no changes arrived in the mean time, wait to be awaken by
+		 * a sysfs write, a firmware callback or a stop command.
+		 */
+		if (atomic_xchg(&splash->pending, 0) == 0)
+			set_current_state(TASK_UNINTERRUPTIBLE);
+
+		schedule();
+	}
+
+	return 0;
+}
+
+static inline void drm_splash_wake_render_thread(struct drm_splash *splash)
+{
+	atomic_set(&splash->pending, 1);
+	wake_up_process(splash->thread);
+}
+
+static int drm_splash_init_client(struct drm_splash *splash)
+{
+	struct drm_client_dev *client = &splash->client;
+	struct drm_mode_set *modeset;
+	unsigned int modeset_mask = 0;
+	unsigned int fb_count = 0;
+	int j;
+
+	if (drm_client_modeset_probe(client, 0, 0))
+		return -1;
+
+	j = 0;
+	drm_client_for_each_modeset(modeset, client) {
+		struct drm_splash_scanout *tmp;
+		struct drm_splash_scanout *scanout;
+		u32 format;
+		int id = -1;
+
+		/* Skip modesets without a mode */
+		if (!modeset->mode)
+			continue;
+
+		if (modeset->connectors[0]->has_tile) {
+			struct drm_splash_scanout *tiled;
+			int new_id = modeset->connectors[0]->tile_group->id;
+
+			/* Tiled modesets contribute to a single framebuffer,
+			 * check if this tiled group has already been seen.
+			 */
+			tiled = get_scanout_from_tile_group(splash, new_id);
+			if (tiled != NULL) {
+				if (!modeset->x)
+					tiled->width += modeset->mode->vdisplay;
+				if (!modeset->y)
+					tiled->height += modeset->mode->hdisplay;
+				modeset->fb = tiled->buffer->fb;
+				continue;
+			}
+
+			/* New tile group, save its ID for later */
+			id = new_id;
+		}
+
+		format = drm_splash_find_usable_format(modeset->crtc->primary,
+						       splash->preferred_format);
+		if (format == DRM_FORMAT_INVALID) {
+			drm_warn(client->dev,
+				 "splash: can't find a usable format for modeset");
+			continue;
+		}
+
+		tmp = krealloc(splash->scanout,
+			       (splash->n_scanout + 1) * sizeof(*splash->scanout),
+			       GFP_KERNEL);
+		if (!tmp) {
+			drm_warn(client->dev,
+				 "splash: can't reallocate the scanout array");
+			break;
+		}
+
+		splash->scanout = tmp;
+		scanout = &splash->scanout[splash->n_scanout];
+		splash->n_scanout++;
+
+		memset(scanout, 0, sizeof(*scanout));
+		scanout->id = id;
+		scanout->format = format;
+		scanout->width = modeset->mode->hdisplay;
+		scanout->height = modeset->mode->vdisplay;
+		mutex_init(&scanout->lock);
+
+		modeset_mask |= BIT(j);
+		j++;
+	}
+
+	/* Now that all sensible modesets have been collected, allocate buffers */
+	j = 0;
+	drm_client_for_each_modeset(modeset, client) {
+		struct drm_splash_scanout *scanout;
+
+		if (!(modeset_mask & BIT(j)))
+			continue;
+
+		scanout = &splash->scanout[j];
+		j++;
+
+		scanout->buffer = drm_client_framebuffer_create(client,
+								scanout->width,
+								scanout->height,
+								scanout->format);
+		if (IS_ERR(scanout->buffer)) {
+			drm_warn(client->dev,
+				 "splash: can't create framebuffer %d %d %p4cc",
+				 scanout->width, scanout->height, &scanout->format);
+			continue;
+		}
+
+		drm_info(client->dev, "splash: created framebuffer %d %d %p4cc",
+			 scanout->width, scanout->height, &scanout->format);
+
+		scanout->font = get_default_font(scanout->width, scanout->height,
+						 NULL, NULL);
+		if (!scanout->font) {
+			drm_warn(client->dev,
+				 "splash: failed to get default font");
+		}
+
+		modeset->fb = scanout->buffer->fb;
+		fb_count++;
+	}
+
+	return (fb_count == 0) ? -ENODEV : 0;
+}
+
+static void drm_splash_free_scanout(struct drm_client_dev *client)
+{
+	struct drm_splash *splash = client_to_drm_splash(client);
+	int i;
+
+	if (splash->n_scanout) {
+		for (i = 0; i < splash->n_scanout; i++) {
+			drm_client_framebuffer_delete(splash->scanout[i].buffer);
+#ifdef CONFIG_DRM_CLIENT_SPLASH_LOAD_AS_FW
+			if (splash->scanout[i].fw)
+				release_firmware(splash->scanout[i].fw);
+#endif
+			mutex_destroy(&splash->scanout[i].lock);
+		}
+		splash->n_scanout = 0;
+		kfree(splash->scanout);
+		splash->scanout = NULL;
+	}
+}
+
+#ifdef CONFIG_DRM_CLIENT_SPLASH_LOAD_AS_FW
+static void drm_splash_fw_callback(const struct firmware *fw, void *context)
+{
+	struct drm_splash_scanout *scanout = context;
+	struct drm_client_dev *client = scanout->buffer->client;
+	struct drm_splash *splash = client_to_drm_splash(client);
+
+	if (!fw || !fw->data) {
+		drm_err(client->dev, "splash: no firmware");
+		return;
+	}
+
+	/* Assign new firmware to the scanout */
+	scoped_guard(mutex, &scanout->lock) {
+		if (scanout->fw)
+			release_firmware(scanout->fw);
+		scanout->fw = fw;
+	}
+
+	/* Wake the render thread */
+	drm_dbg(client->dev, "splash: firmware loaded, wake up drawing thread");
+	drm_splash_wake_render_thread(splash);
+}
+
+static int drm_splash_kick_fw_load(struct drm_splash *splash,
+				   struct task_struct *thread)
+{
+	struct drm_client_dev *client = &splash->client;
+	int j;
+
+	for (j = 0; j < splash->n_scanout; j++) {
+		struct drm_splash_scanout *scanout = &splash->scanout[j];
+		char *fw_name = kasprintf(GFP_KERNEL,
+					  "drm_splash_%ux%u_%.4s.raw",
+					  scanout->width, scanout->height,
+					  (const char *)&scanout->format);
+		if (!fw_name)
+			return -ENOMEM;
+
+		drm_dbg(client->dev, "splash: request firmware %s", fw_name);
+		request_firmware_nowait(THIS_MODULE, FW_ACTION_NOUEVENT, fw_name,
+					&splash->dev, GFP_KERNEL,
+					scanout, drm_splash_fw_callback);
+		kfree(fw_name);
+	}
+
+	return 0;
+}
+#endif /* CONFIG_DRM_CLIENT_SPLASH_LOAD_AS_FW */
+
+static int drm_splash_client_hotplug(struct drm_client_dev *client)
+{
+	struct drm_splash *splash = client_to_drm_splash(client);
+	int ret;
+
+	guard(mutex)(&splash->lock);
+
+	/* The modesets that get a splash are defined at first hotplug event */
+	if (splash->initialized)
+		return 0;
+
+	ret = drm_splash_init_client(splash);
+	if (ret == -ENODEV) {
+		drm_info(client->dev, "splash: no modeset found");
+		return 0;
+	} else if (ret) {
+		drm_err(client->dev,
+			"splash: failed to init client: %d", ret);
+		return ret;
+	}
+
+	/* Create the render thread, waken later */
+	splash->thread = kthread_create(drm_splash_render_thread,
+					splash, "drm_splash_%s",
+					client->dev->unique);
+	if (IS_ERR(splash->thread)) {
+		ret = PTR_ERR(splash->thread);
+		drm_err(client->dev, "splash: failed to create render thread: %d", ret);
+		drm_splash_free_scanout(client);
+		return ret;
+	}
+
+#ifdef CONFIG_DRM_CLIENT_SPLASH_LOAD_AS_FW
+	if (!skip_image) {
+		ret = drm_splash_kick_fw_load(splash, splash->thread);
+		if (ret) {
+			drm_err(client->dev, "splash: failed to kick fw load: %d", ret);
+			kthread_stop(splash->thread);
+			drm_splash_free_scanout(client);
+			return ret;
+		}
+	}
+#endif
+
+	/* Wake the render thread to show initial contents */
+	drm_splash_wake_render_thread(splash);
+
+	splash->initialized = true;
+
+	return 0;
+}
+
+static void drm_splash_client_unregister(struct drm_client_dev *client)
+{
+	struct drm_splash *splash = client_to_drm_splash(client);
+	struct drm_device *dev = client->dev;
+
+	kthread_stop(splash->thread);
+	device_del(&splash->dev);
+	drm_splash_free_scanout(client);
+	drm_client_release(client);
+	put_device(&splash->dev);
+	kfree(splash);
+	drm_dbg(dev, "Unregistered with drm splash");
+}
+
+static const struct drm_client_funcs drm_splash_client_funcs = {
+	.owner		= THIS_MODULE,
+	.hotplug	= drm_splash_client_hotplug,
+	.unregister	= drm_splash_client_unregister,
+};
+
+static ssize_t progress_store(struct device *device,
+			      struct device_attribute *attr,
+			      const char *buf,
+			      size_t count)
+{
+	struct drm_splash *splash = dev_get_drvdata(device);
+	u8 progress;
+	int ret;
+
+	ret = kstrtou8(buf, 0, &progress);
+	if (ret)
+		return ret;
+
+	if (ret > 100)
+		return -ERANGE;
+
+	scoped_guard(mutex, &splash->lock)
+		splash->progress = progress;
+
+	drm_splash_wake_render_thread(splash);
+
+	return count;
+}
+DEVICE_ATTR_WO(progress);
+
+static ssize_t message_store(struct device *device,
+			     struct device_attribute *attr,
+			     const char *buf,
+			     size_t count)
+{
+	struct drm_splash *splash = dev_get_drvdata(device);
+	size_t len = min(count, sizeof(splash->message));
+
+	scoped_guard(mutex, &splash->lock)
+		strscpy(splash->message, buf, len);
+
+	drm_splash_wake_render_thread(splash);
+
+	return count;
+}
+DEVICE_ATTR_WO(message);
+
+static ssize_t stop_store(struct device *device,
+			  struct device_attribute *attr,
+			  const char *buf,
+			  size_t count)
+{
+	struct drm_splash *splash = dev_get_drvdata(device);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val != 0)
+		kthread_stop(splash->thread);
+
+	return count;
+}
+DEVICE_ATTR_WO(stop);
+
+static struct attribute *drm_splash_attrs[] = {
+	&dev_attr_message.attr,
+	&dev_attr_progress.attr,
+	&dev_attr_stop.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(drm_splash);
+
+/**
+ * drm_splash_register() - Register a drm device to drm_splash
+ * @dev: the drm device to register.
+ * @format: drm device preferred format.
+ */
+void drm_splash_register(struct drm_device *dev,
+			 const struct drm_format_info *format)
+{
+	struct drm_splash *splash;
+	int ret;
+
+	splash = kzalloc(sizeof(*splash), GFP_KERNEL);
+	if (!splash)
+		goto err_warn;
+
+	mutex_init(&splash->lock);
+	if (format && format->num_planes == 1)
+		splash->preferred_format = format->format;
+
+	if (message)
+		strscpy(splash->message, message);
+
+	if (drm_client_init(dev, &splash->client, "drm_splash",
+			    &drm_splash_client_funcs))
+		goto err_free;
+
+	device_initialize(&splash->dev);
+	splash->dev.parent = dev->dev;
+	splash->dev.groups = drm_splash_groups;
+	dev_set_name(&splash->dev, "drm_splash");
+	dev_set_drvdata(&splash->dev, splash);
+	ret = device_add(&splash->dev);
+	if (ret)
+		goto err_free;
+
+	drm_client_register(&splash->client);
+	drm_dbg(dev, "Registered with drm splash");
+
+	return;
+
+err_free:
+	kfree(splash);
+err_warn:
+	drm_warn(dev, "Failed to register with drm splash");
+}

-- 
2.51.0

