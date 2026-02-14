Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MnIdKak+kGmiXwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 10:21:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDACB13B8F7
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 10:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3F410E26D;
	Sat, 14 Feb 2026 09:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VWcDq/s6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F10710E07F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 07:01:38 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-8230c2d3128so790589b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 23:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771052497; x=1771657297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t3fS/jBrz25JfiVnibsVI6lmnN85JbB8A6Q8rODhA7A=;
 b=VWcDq/s6mFBg51ED/X0MYl2D3b5FGJEFgT08Z/zl4PjjLlKS63heuYeMyHbG93eGEf
 Sivme+lrzU3rh1FmQut1OxgY3KmwXPJtBANfYZVEqV3s/wL9naXOHXW3UwfyXmfJ96Us
 gQOyeF+oCHbMk25vs5wa/ZRrtIFkMVRVHIdl30z08HoWMwtaCR+Fs+kgv1JGofGCTory
 Uo6RV/8dve58C7uB+zpkh4sirv9JhFJo7PF3bDzQYRHEhRSgJKWCrXjA1SVRMjWdw6Lg
 Yf1ymIqqUK2v2ziYYt21fXd0DXgNDF+0adsO1HE43/zYInh44dhNKx1SUnnWwuMQEYhx
 i2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771052497; x=1771657297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3fS/jBrz25JfiVnibsVI6lmnN85JbB8A6Q8rODhA7A=;
 b=s1qfLdEiDpmzzW3w6Q0XI1n2fVsXIAWJ6LHNM2mrFv2VtOUYd/MJDuUfKTlpf8NcHe
 8WurcgarPsxFBUL+w6T6JJrYosrUQ7qhkfOJNEiN5xg4YjbETojXZq9wpWMAr9yNupJu
 GrchX5V0ELkCYwR4+Dakcyrr0a4gCjBefDoqJ7+KWnqp5FSdBq505J7LvRwrz22GrzoX
 RgJv+ACiHbTU2I4c0vfQKZkOT8IMmHUjGhk6HbCw+eVjmi2vT+RJmW5Re25IJGmZPKOv
 ndEiZ/sqd5R4WQ5BQj2ggkjDUWuGuUJQ7XEmM8PpiPFoloWxvZBbOeFCtbvKrOcK/XmM
 Mkvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZNWtIz4iSEit5QSNZrtMdDXT/OA3Wr6FOar8ib8vYkx+iouvEgi8qMUfeDAkRIOvdmjUDiCed1uU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEZ7+W0uOstrja6PzJ7mdBwIDMcvbm38w0RhVGbnwA1Cqma9M9
 JhmdOWjXOOa3cTKLjdmVvHvuH6MbDTmilPHj+ZYyXyaViZY+E5Eyj/Uk
X-Gm-Gg: AZuq6aJhY3LJ3gO5SH+IFOmBziuy3EA4a91RI4lznq4NJU9Vw7G5mvZcUf3EAexgLVj
 ukVqzPG4bAvQhVBnX6cw4LjIlDABhlo64tL+apgxdKBYtNAa0k//XkwhvYAJ/BCcl5Yt2iu6Lvo
 4sv3uIXJaXXavhFu8gacADhaynS5+AKhzuTgPvVh4F/qzH5e9LfUaQrYNhyW+NOLO5qxV8uhF4v
 +H358GhWmDM8+7UAZHDA6WMrGfBuNr1bTiEl1Qa3bOglSJ5nPOfl1HoD+TnkiXGgxdk/KnbwQlz
 pD7sUfwbw9jy6DLTEv9mF9l0CrVsdpoow+EmuUgc+HY9DULOBHg3kUTUn2h+dK3qFhnOEMzwsqS
 VRvseWwh5H9+HooxRAg5AuyM7yHXgF3RwKXVKp46XoQE+iwwMMPQ/DyT+tNwCQZrHEJ1iYsDqFZ
 Ofm68HBCq7Vg7L+vaS5ktgkwOZVbEJsyIlRSrxesTrgQ==
X-Received: by 2002:a05:6a21:d82:b0:35f:6e12:186f with SMTP id
 adf61e73a8af0-3946c733f3cmr4041961637.23.1771052497293; 
 Fri, 13 Feb 2026 23:01:37 -0800 (PST)
Received: from debian.ari ([152.58.179.225]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6e533155fdsm1072674a12.27.2026.02.13.23.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 23:01:36 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, javierm@redhat.com, nathan@kernel.org,
 geert+renesas@glider.be, marcus.folkesson@gmail.com, david@lechnology.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Archit Anant <architanant5@gmail.com>
Subject: [RFC PATCH] drm/sitronix: add ST7789V panel driver
Date: Sat, 14 Feb 2026 12:31:23 +0530
Message-Id: <20260214070123.41374-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 14 Feb 2026 09:21:40 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:javierm@redhat.com,m:nathan@kernel.org,m:geert+renesas@glider.be,m:marcus.folkesson@gmail.com,m:david@lechnology.com,m:noralf@tronnes.org,m:linux-kernel@vger.kernel.org,m:architanant5@gmail.com,m:geert@glider.be,m:marcusfolkesson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,redhat.com,kernel.org,glider.be,lechnology.com,tronnes.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EDACB13B8F7
X-Rspamd-Action: no action

Add a DRM driver for Sitronix ST7789V display controllers using the
mipi_dbi interface.

Currently, support for this controller is split between a legacy fbdev
driver in staging (fb_st7789v.c) and a DRM panel driver that requires
9-bit SPI words (panel-sitronix-st7789v.c). This new driver uses the
mipi_dbi helper to support standard 8-bit SPI with a D/C GPIO, which
is the configuration used by the vast majority of hobbyist and
embedded hardware.

The initialization sequence is ported from the staging driver and
supports several panels:
- Generic 240x320 profile
- HannStar HSD20 IPS
- Inanbo T28CP45TN89-V17
- EDT ET028013DMA
- Jasonic JT240MHQS-HWT-EK-E3

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/gpu/drm/sitronix/Kconfig   |  17 ++
 drivers/gpu/drm/sitronix/Makefile  |   2 +
 drivers/gpu/drm/sitronix/st7789v.c | 307 +++++++++++++++++++++++++++++
 3 files changed, 326 insertions(+)
 create mode 100644 drivers/gpu/drm/sitronix/st7789v.c

diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
index 6de7d92d9b74..7a2c66677003 100644
--- a/drivers/gpu/drm/sitronix/Kconfig
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -40,3 +40,20 @@ config DRM_ST7735R
 
 	  If M is selected the module will be called st7735r.
 
+config DRM_ST7789V
+	tristate "DRM support for Sitronix ST7789V display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_DMA_HELPER
+	select DRM_KMS_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for Sitronix ST7789V panels connected via SPI.
+	  This driver supports several panels including:
+	  * HannStar HSD20 IPS
+	  * Inanbo T28CP45TN89-V17
+	  * EDT ET028013DMA
+	  * Jasonic JT240MHQS-HWT-EK-E3
+
+	  If M is selected the module will be called st7789v.
diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
index bd139e5a6995..96b2a4d85368 100644
--- a/drivers/gpu/drm/sitronix/Makefile
+++ b/drivers/gpu/drm/sitronix/Makefile
@@ -1,3 +1,5 @@
 obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
 obj-$(CONFIG_DRM_ST7586)		+= st7586.o
 obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
+obj-$(CONFIG_DRM_ST7789V)		+= st7789v.o
+
diff --git a/drivers/gpu/drm/sitronix/st7789v.c b/drivers/gpu/drm/sitronix/st7789v.c
new file mode 100644
index 000000000000..4ce4b46d8df2
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/st7789v.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * DRM driver for Sitronix ST7789V LCD panels
+ *
+ * Copyright (C) 2026 Archit Anant <architanant5@gmail.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/spi/spi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/delay.h>
+#include <linux/backlight.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_fbdev_dma.h>
+#include <video/mipi_display.h>
+
+#define ST7789V_PORCTRL      0xb2
+#define ST7789V_GCTRL        0xb7
+#define ST7789V_VCOMS        0xbb
+#define ST7789V_LCMCTRL      0xc0
+#define ST7789V_VDVVRHEN     0xc2
+#define ST7789V_VRHS         0xc3
+#define ST7789V_VDVS         0xc4
+#define ST7789V_VCMOFSET     0xc5
+#define ST7789V_FRCTRL2      0xc6
+#define ST7789V_PWCTRL1      0xd0
+#define ST7789V_PVGAMCTRL    0xe0
+#define ST7789V_NVGAMCTRL    0xe1
+
+#define ST7789V_MADCTL_MY  BIT(7)
+#define ST7789V_MADCTL_MX  BIT(6)
+#define ST7789V_MADCTL_MV  BIT(5)
+#define ST7789V_MADCTL_BGR BIT(3)
+
+
+struct st7789v_cfg {
+	const struct drm_display_mode mode;
+	unsigned int left_offset;
+	unsigned int top_offset;
+	bool is_ips;   /* Controls PORCTRL and GCTRL timings */
+	bool invert;   /* Controls Color Inversion (positive/negative) */
+};
+struct st7789v_priv {
+	struct mipi_dbi_dev dbidev; /* Must be first for .release() */
+	const struct st7789v_cfg *cfg;
+};
+
+
+/* 1. Generic Fallback (Matches default behavior of fb_st7789v.c) */
+static const struct st7789v_cfg generic_cfg = {
+	.mode = { DRM_SIMPLE_MODE(240, 320, 0, 0) },
+	.is_ips = false,
+	.invert = true,
+};
+
+/* 2. HannStar 2.0" IPS (The specific panel handled in staging) */
+static const struct st7789v_cfg hsd20_ips_cfg = {
+	.mode = { DRM_SIMPLE_MODE(240, 320, 31, 41) },
+	.is_ips = true,
+	.invert = true,
+};
+
+/* 3. Inanbo 2.8" (From the 9-bit driver: No Inversion) */
+static const struct st7789v_cfg inanbo_panel_cfg = {
+	.mode = { DRM_SIMPLE_MODE(240, 320, 43, 57) },
+	.is_ips = false,
+	.invert = false,
+};
+
+/* 4. EDT 2.8" (From the 9-bit driver: Normal Inversion) */
+static const struct st7789v_cfg edt_panel_cfg = {
+	.mode = { DRM_SIMPLE_MODE(240, 320, 43, 58) },
+	.is_ips = false,
+	.invert = true,
+};
+
+/* 5. Jasonic 2.4" (From the 9-bit driver: Custom Height + Offset) */
+static const struct st7789v_cfg jasonic_panel_cfg = {
+	.mode = { DRM_SIMPLE_MODE(240, 280, 37, 43) },
+	.is_ips = true,
+	.invert = true,
+	.top_offset = 38,
+};
+
+DEFINE_DRM_GEM_DMA_FOPS(st7789v_fops);
+
+static const struct drm_driver st7789v_driver = {
+    .driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+    .fops               = &st7789v_fops,
+    DRM_GEM_DMA_DRIVER_OPS_VMAP,
+    DRM_FBDEV_DMA_DRIVER_OPS,
+    .debugfs_init       = mipi_dbi_debugfs_init,
+    .name               = "st7789v",
+    .desc               = "Sitronix ST7789V",
+    .major              = 1,
+    .minor              = 0,
+};
+
+static void st7789v_pipe_enable(struct drm_simple_display_pipe *pipe,
+                                struct drm_crtc_state *crtc_state,
+                                struct drm_plane_state *plane_state)
+{
+    struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+    struct st7789v_priv *priv = container_of(dbidev, struct st7789v_priv, dbidev);
+    struct mipi_dbi *dbi = &dbidev->dbi;
+    int ret,idx; 
+
+    if (!drm_dev_enter(pipe->crtc.dev, &idx))
+        return;
+
+    ret = mipi_dbi_poweron_reset(dbidev); 
+    if (ret)
+		goto out_exit;
+
+    mipi_dbi_command(dbi, MIPI_DCS_SOFT_RESET);
+    msleep(150);
+
+    mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+    msleep(500);
+
+    mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_16BIT);
+
+    if (priv->cfg->is_ips) {
+        mipi_dbi_command(dbi, ST7789V_PORCTRL, 0x05, 0x05, 0x00, 0x33, 0x33);
+        mipi_dbi_command(dbi, ST7789V_GCTRL, 0x75);
+    } else {
+        mipi_dbi_command(dbi, ST7789V_PORCTRL, 0x0c, 0x0c, 0x00, 0x33, 0x33);
+        mipi_dbi_command(dbi, ST7789V_GCTRL, 0x35);
+    }
+
+    mipi_dbi_command(dbi, ST7789V_VCOMS, 0x20); 
+    mipi_dbi_command(dbi, ST7789V_LCMCTRL, 0x2c);
+    mipi_dbi_command(dbi, ST7789V_VDVVRHEN, 0x01);
+    mipi_dbi_command(dbi, ST7789V_VRHS, 0x12);
+    mipi_dbi_command(dbi, ST7789V_VDVS, 0x20);
+    mipi_dbi_command(dbi, ST7789V_FRCTRL2, 0x0f);
+    mipi_dbi_command(dbi, ST7789V_PWCTRL1, 0xa4, 0xa1);
+
+    mipi_dbi_command(dbi, ST7789V_PVGAMCTRL, 
+                     0xd0, 0x04, 0x0d, 0x11, 0x13, 0x2b, 0x3f, 0x54, 
+                     0x4c, 0x18, 0x0d, 0x0b, 0x1f, 0x23);
+    mipi_dbi_command(dbi, ST7789V_NVGAMCTRL, 
+                     0xd0, 0x04, 0x0c, 0x11, 0x13, 0x2c, 0x3f, 0x44, 
+                     0x51, 0x2f, 0x1f, 0x1f, 0x20, 0x23);
+
+    if (priv->cfg->invert)
+        mipi_dbi_command(dbi, MIPI_DCS_ENTER_INVERT_MODE);
+    else
+        mipi_dbi_command(dbi, MIPI_DCS_EXIT_INVERT_MODE);
+    mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+    msleep(100);
+
+    u8 addr_mode = 0;
+
+    switch (dbidev->rotation) {
+    case 90:
+
+        addr_mode = ST7789V_MADCTL_MV | ST7789V_MADCTL_MY;
+        break;
+    case 180:
+        addr_mode = ST7789V_MADCTL_MX | ST7789V_MADCTL_MY;
+        break;
+    case 270:
+        addr_mode = ST7789V_MADCTL_MV | ST7789V_MADCTL_MX;
+        break;
+    default: 
+        addr_mode = 0;
+        break;
+    }
+
+    addr_mode |= ST7789V_MADCTL_BGR; 
+
+    mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
+
+    mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+
+out_exit:
+    drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs st7789v_pipe_funcs = 
+{
+    DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(st7789v_pipe_enable),
+};
+
+static int st7789v_probe(struct spi_device *spi)
+{
+    struct device *dev = &spi->dev;
+    const struct st7789v_cfg *cfg;
+    struct mipi_dbi_dev *dbidev;
+    struct st7789v_priv *priv;
+    struct drm_device *drm;
+    struct mipi_dbi *dbi;
+    struct gpio_desc *dc;
+    u32 rotation = 0;
+    int ret;
+
+    cfg = device_get_match_data(&spi->dev);
+
+	if (!cfg)
+		cfg = (void *)spi_get_device_id(spi)->driver_data;
+
+	priv = devm_drm_dev_alloc(dev, &st7789v_driver,
+				  struct st7789v_priv, dbidev.drm);
+
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+    dbidev = &priv->dbidev;
+    priv->cfg = cfg;
+
+    dbi = &dbidev->dbi;
+    drm = &dbidev->drm;
+
+    spi_set_drvdata(spi, drm);
+
+    dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+    if (IS_ERR(dbi->reset))
+        return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
+
+    dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
+    if (IS_ERR(dc))
+        return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
+
+    dbidev->backlight = devm_of_find_backlight(dev);
+    if (IS_ERR(dbidev->backlight))
+        return PTR_ERR(dbidev->backlight);
+    
+    dbidev->left_offset = priv->cfg->left_offset;
+    dbidev->top_offset = priv->cfg->top_offset;
+    
+    device_property_read_u32(dev, "rotation", &rotation);
+
+    ret = mipi_dbi_spi_init(spi, dbi, dc);
+    if (ret)
+        return ret;
+    
+    ret = mipi_dbi_dev_init(dbidev, &st7789v_pipe_funcs, &cfg->mode, rotation);
+    if (ret)
+        return ret;
+
+    drm_mode_config_reset(drm);
+    
+    ret = drm_dev_register(drm, 0);
+    if (ret)
+        return ret;
+
+    drm_client_setup(drm, NULL);
+
+    return 0;
+}
+
+static void st7789v_remove(struct spi_device *spi)
+{
+    struct drm_device *drm = spi_get_drvdata(spi);
+    drm_dev_unplug(drm);
+    drm_atomic_helper_shutdown(drm);
+}
+
+static void st7789v_shutdown(struct spi_device *spi)
+{
+    drm_atomic_helper_shutdown(spi_get_drvdata(spi));
+}
+
+
+static const struct of_device_id st7789v_of_match[] = {
+	{ .compatible = "sitronix,st7789v", .data = &generic_cfg },
+	{ .compatible = "hannstar,hsd20-ips", .data = &hsd20_ips_cfg },
+	{ .compatible = "inanbo,t28cp45tn89-v17", .data = &inanbo_panel_cfg },
+	{ .compatible = "edt,et028013dma", .data = &edt_panel_cfg },
+	{ .compatible = "jasonic,jt240mhqs-hwt-ek-e3", .data = &jasonic_panel_cfg },
+	{  }
+};
+MODULE_DEVICE_TABLE(of, st7789v_of_match);
+
+static const struct spi_device_id st7789v_id[] = {
+    { "st7789v", 0 },
+    { },
+};
+MODULE_DEVICE_TABLE(spi, st7789v_id);
+
+static struct spi_driver st7789v_spi_driver = {
+    .driver = {
+        .name = "st7789v",
+        .of_match_table = st7789v_of_match,
+    },
+    .probe = st7789v_probe,
+    .remove = st7789v_remove,
+    .shutdown = st7789v_shutdown,
+    .id_table = st7789v_id,
+};
+
+module_spi_driver(st7789v_spi_driver);
+
+MODULE_DESCRIPTION("Sitronix ST7789V DRM driver");
+MODULE_AUTHOR("Archit Anant <architanant5@gmail.com>");
+MODULE_LICENSE("GPL");
\ No newline at end of file
-- 
2.39.5

