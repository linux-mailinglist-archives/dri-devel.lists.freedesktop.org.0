Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A847AA23999
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 07:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FE810EA1F;
	Fri, 31 Jan 2025 06:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nCVo3o8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F5610EA1F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 06:44:35 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2f833af7a09so2195551a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 22:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738305875; x=1738910675; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uxt7XgylM0RNNQeFvYOcAUiv7nVUhdc6VDeUfR75H2A=;
 b=nCVo3o8UzJfJtaDfd9dXWN4R7e03Dwke+98VRtwU3K9QE7xEYs7uHXKC29gPEiCAW6
 C3IrvsmrhLlx/Wi8MTXaj0ZXADPO43XraDEdnF5qVksBuh3xYvItIWGHUB2IPGdSEA5z
 +3L4NdS2+h/9o/YeqdCJJGcgwNIHsV4TsOnVYRB8j+AXJzMA4X9cOa9ZLo+qODB5PV5V
 htMeOwGdRFnsoQZrIWNqMWPb0MEZf7biFiYYFVinsmL2aP2WT+EfERu+LAXmeNO+np1Q
 FKGHbIfUB74Xs4RkZI3aA2QevlyRhGTm0fcNU5uErZ0WYGzfsEUDipBLWjWAZxQr15mT
 u1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738305875; x=1738910675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uxt7XgylM0RNNQeFvYOcAUiv7nVUhdc6VDeUfR75H2A=;
 b=dEwjVKdcLEHggNhjbUjWXDxqPre3R5bk58ItOuEXaJowTDKakC+8VhN+YHjgF6uJec
 gl8qGIiUSm6W6zr51KbT15tJiFl0oGtW/Wc9NcVcGOm9WsRNcZ77jIqSD2AThzf3e2Cj
 FtI45FyanY5p71w3C7Ln0qJQi41jDGEdf5IK++jsc9vUSysCA5Nmu/26IAh9zzsMLRCW
 bv4meSjR1tCbh8V3nGDp0apvCYWIimFFpjAFdyjnmul3LhssfyLG4D9I/gjRHd9ciRZb
 hVCbw2HDupFwWgze/tOmkPb5VhFCZekaoYE23DFjcQV8f0v8gQqLrXYpJxWqXTk8aq3Z
 GgQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUJIUv6QF9bVfkpIkdZnxSAnwoUdUEOQbNA2GrETrH9Rh7Wd6QzdphRf5JSc41olFBWAj0vEpYRS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwabEDiJxwrTy7u3yLVKnZhIsh5a0HbrdjLrSniBsK9e8GKpDqi
 asqSAO3Eo3d6fKHFvAummJDcyoogqPY5v/ESeUCrDM5L1dYghLyCgHJUUSLB
X-Gm-Gg: ASbGncsooNjiGKenH0ksQtzMeEWpUgIOacO5xzuMQR7DYOwUjYzOxpPqkwY1ZdHimxk
 r3OJFpwx+X1/JPz7ZHKHuC5Ux6Tq8r2hPY/+fc8pHdDRe4q/DbJhZkC08lS8YKbe71Upn8/hBvF
 ZIjrtNg/1CEIENi2J2eRwOyGmaCe6jfb5Nu+Sa4XOJBiFcWpCUiP9z7197Nvah05vbJF009vZma
 29FY3CaTsBjo68KAMdt6GA5Zai0AdyvvQT7d9A+OZTHKVpezhyzx7nnwC4DD/Ta9Jg3nTdSzkBe
 JybumF97p+MWpmb8e/RTqrTc32M=
X-Google-Smtp-Source: AGHT+IHCCGvbadTzQSXOFZiCDedmOYIDDA+dHN78B+HXrjLu5qnI/+PnMm+dRI48nV23T9Oqber2XA==
X-Received: by 2002:a17:90b:1f86:b0:2ee:aed2:c15c with SMTP id
 98e67ed59e1d1-2f83ac8c3famr14496578a91.28.1738305874754; 
 Thu, 30 Jan 2025 22:44:34 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f83bfc0ddbsm5098947a91.45.2025.01.30.22.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 22:44:34 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/2] drm: panel: Add a driver for Generic MIPI-DSI/DPI(+SPI)
 panels
Date: Fri, 31 Jan 2025 15:43:54 +0900
Message-ID: <20250131064354.4163579-3-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131064354.4163579-1-kikuchan98@gmail.com>
References: <20250131064354.4163579-1-kikuchan98@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although the MIPI specifications define how to communicate with a panel
to display an image, some panels still require a panel-specific
initialization sequence to be sent.

This is a driver for such generic MIPI-DSI/DPI panels that require
initialization with a simple command sequence before use.

Its fundamental approach is similar to `panel-mipi-dbi` driver,
which sends an initialization sequence stored in a firmware file.

Moreover, this driver allows display modes, timings, and panel
configuration parameters to be stored in the same file or in DT.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig      |   10 +
 drivers/gpu/drm/panel/Makefile     |    1 +
 drivers/gpu/drm/panel/panel-mipi.c | 1355 ++++++++++++++++++++++++++++
 3 files changed, 1366 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-mipi.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d7469c565d1..46eea1974a0 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -408,6 +408,16 @@ config DRM_PANEL_MANTIX_MLAF057WE51
 	  has a resolution of 720x1440 pixels, a built in backlight and touch
 	  controller.
 
+config DRM_PANEL_MIPI
+	tristate "Generic MIPI-DSI/DPI(+SPI) panel"
+	depends on OF
+	depends on SPI || DRM_MIPI_DSI
+	select DRM_MIPI_DBI if SPI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Generic MIPI-DSI /
+	  MIPI-DPI(+SPI) panels.
+
 config DRM_PANEL_NEC_NL8048HL11
 	tristate "NEC NL8048HL11 RGB panel"
 	depends on GPIOLIB && OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 7dcf72646ca..22276255a7b 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
+obj-$(CONFIG_DRM_PANEL_MIPI) += panel-mipi.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
 obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
 obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
diff --git a/drivers/gpu/drm/panel/panel-mipi.c b/drivers/gpu/drm/panel/panel-mipi.c
new file mode 100644
index 00000000000..bcbaa15b62a
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-mipi.c
@@ -0,0 +1,1355 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Generic MIPI-DSI/DPI(+SPI) Panel Driver
+ *
+ * Supported panels:
+ * - A generic MIPI-DSI panel which implements basic DCS
+ * - A generic MIPI-DPI panel which implements basic DCS over SPI
+ *
+ * Copyright (C) 2025, Hironori KIKUCHI <kikuchan98@gmail.com>
+ */
+
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+#include <video/display_timing.h>
+#include <video/mipi_display.h>
+#include <video/of_display_timing.h>
+#include <video/videomode.h>
+
+/*
+ * The display panel configuration can be stored in a firmware file,
+ * under the firmware directory of the system.
+ *
+ * The name of the file is `panels/<firmware-name>.panel`, where the
+ * 'firmware-name' should be defined as the property of the device
+ * in the Device Tree, otherwise the first `compatible` string is used.
+ *
+ * File Layout:
+ *     A binary file composed with the following data:
+ *         <header>
+ *         <config>
+ *         <timings>
+ *         <init-sequence>
+ *
+ * The 'header':
+ *     A `struct panel_firmware_header`.
+ *     The `file_format_version` must be `1`.
+ *
+ * The 'config':
+ *     A `struct panel_firmware_config`.
+ *     The values are in big-endian.
+ *
+ * The 'timings':
+ *     An array of `struct panel_firmware_panel_timing`.
+ *     Its length is `num_timings` in the config.
+ *     The values are in big-endian.
+ *
+ * The 'init-sequence':
+ *     MIPI commands to execute when the display pipeline is enabled.
+ *     This is used to configure the display controller, and it may
+ *     contains panel specific parameters as well.
+ *
+ *     The commands are encoded and stored in a byte array:
+ *
+ *         0x00             : sleep 10 ms
+ *         0x01 <M>         : MIPI command <M> with no arguments
+ *         0x02 <M> <a>     : MIPI command <M> with 1 argument <a>
+ *         0x03 <M> <a> <b> : MIPI command <M> with 2 arguments <a> <b>
+ *                :
+ *         0x7f <M> <...>   : MIPI command <M> with 126 arguments <...>
+ *         0x80             : sleep 100 ms
+ *         0x81 - 0xff      : reserved
+ *
+ *     Example:
+ *         command 0x11
+ *         sleep 10ms
+ *         command 0xb1 arguments 0x01 0x2c 0x2d
+ *         command 0x29
+ *         sleep 130ms
+ *
+ *     Byte sequence:
+ *         0x01 0x11
+ *         0x00
+ *         0x04 0xb1 0x01 0x2c 0x2d
+ *         0x01 0x29
+ *         0x80 0x00 0x00 0x00
+ *
+ */
+static const u8 panel_firmware_magic[15] = {
+	0x50, 0x41, 0x4e, 0x45, 0x4c, 0x2d, 0x46, 0x49,
+	0x52, 0x4d, 0x57, 0x41, 0x52, 0x45, 0x00,
+};
+
+struct panel_firmware_header {
+	u8 magic[15];
+	u8 file_format_version; /* must be 1 */
+} __packed;
+
+struct panel_firmware_config {
+	u16 width_mm, height_mm;
+	u16 rotation;
+	u8 _reserved_1[2];
+	u8 _reserved_2[8];
+
+	u16 reset_delay; /* delay after the reset command, in ms */
+	u16 init_delay; /* delay for sending the initial command sequence, in ms */
+	u16 sleep_delay; /* delay after the sleep command, in ms */
+	u16 backlight_delay; /* delay for enabling the backlight, in ms */
+	u16 _reserved_3[4];
+
+	u16 dsi_lanes; /* unsigned int */
+	u16 dsi_format; /* enum mipi_dsi_pixel_format */
+	u32 dsi_mode_flags; /* unsigned long */
+	u32 bus_flags; /* struct drm_bus_flags */
+	u8 _reserved_4[2];
+	u8 preferred_timing;
+	u8 num_timings;
+} __packed;
+
+struct panel_firmware_panel_timing {
+	u16 hactive;
+	u16 hfp;
+	u16 hslen;
+	u16 hbp;
+
+	u16 vactive;
+	u16 vfp;
+	u16 vslen;
+	u16 vbp;
+
+	u32 dclk; /* in kHz */
+	u32 flags; /* include/drm/drm_modes.h DRM_MODE_FLAG_* */
+
+	u8 _reserved_1[8];
+} __packed;
+
+struct panel_commands {
+	const u8 *data;
+	size_t size;
+};
+
+struct panel_firmware {
+	const struct firmware *blob;
+	const struct panel_firmware_config *config;
+	const struct panel_firmware_panel_timing *timings;
+	struct panel_commands commands;
+};
+
+struct panel_mipi {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dbi dbi;
+
+	struct mutex lock;
+
+	struct regulator_bulk_data supplies[2];
+	struct gpio_desc *reset;
+
+	unsigned int reset_delay;
+	unsigned int init_delay;
+	unsigned int sleep_delay;
+	unsigned int backlight_delay;
+
+	unsigned int dsi_lanes;
+	enum mipi_dsi_pixel_format dsi_format;
+
+	/* Panel info */
+	u32 width_mm, height_mm;
+	u32 bus_format, bus_flags;
+	enum drm_panel_orientation orientation;
+
+	struct list_head mode_list;
+
+	struct panel_firmware *firmware;
+	struct panel_commands commands;
+
+	int (*write_command)(struct panel_mipi *mipi, const u8 *buf,
+			     size_t len);
+	int (*read_command)(struct panel_mipi *mipi, u8 cmd, u8 *buf,
+			    size_t len);
+
+	/* DMA-able buffer */
+	u8 initial_display_id[3];
+	u8 display_id[3];
+
+	/* debugfs */
+	struct dentry *debugfs;
+	u8 recvbuf[1024];
+	size_t recvlen;
+};
+
+static inline struct panel_mipi *to_panel_mipi(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_mipi, panel);
+}
+
+static int panel_mipi_dsi_write(struct panel_mipi *mipi, const u8 *buf,
+				size_t len)
+{
+	int ret;
+
+	ret = mipi_dsi_dcs_write_buffer(mipi->dsi, buf, len);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int panel_mipi_dbi_write(struct panel_mipi *mipi, const u8 *buf,
+				size_t len)
+{
+	return mipi_dbi_command_stackbuf(&mipi->dbi, buf[0], buf + 1, len - 1);
+}
+
+#define panel_mipi_write(mipi, ...)                                \
+	({                                                         \
+		u8 _buf[] = { __VA_ARGS__ };                       \
+		mipi->write_command(mipi, _buf, ARRAY_SIZE(_buf)); \
+	})
+
+static int panel_mipi_dsi_read(struct panel_mipi *mipi, u8 cmd, u8 *buf,
+			       size_t len)
+{
+	return mipi_dsi_dcs_read(mipi->dsi, cmd, buf, len);
+}
+
+static int panel_mipi_dbi_read(struct panel_mipi *mipi, u8 cmd, u8 *buf,
+			       size_t len)
+{
+	return mipi_dbi_command_buf(&mipi->dbi, cmd, buf, len);
+}
+
+#define panel_mipi_read(mipi, cmd, buf, len) \
+	(mipi)->read_command((mipi), (cmd), (buf), (len))
+
+static unsigned long panel_mipi_dsi_set_mode_flags(struct panel_mipi *mipi,
+						   unsigned long new_flags)
+{
+	unsigned long old_flags;
+
+	if (!mipi->dsi)
+		return 0;
+
+	old_flags = mipi->dsi->mode_flags;
+
+	mipi->dsi->mode_flags = new_flags;
+
+	return old_flags;
+}
+
+static bool panel_mipi_dsi_set_lpm(struct panel_mipi *mipi, bool set)
+{
+	unsigned long old_flags;
+
+	if (!mipi->dsi)
+		return false;
+
+	old_flags = panel_mipi_dsi_set_mode_flags(
+		mipi, set ? mipi->dsi->mode_flags | MIPI_DSI_MODE_LPM :
+			    mipi->dsi->mode_flags & ~MIPI_DSI_MODE_LPM);
+
+	return old_flags & MIPI_DSI_MODE_LPM ? true : false;
+}
+
+#define PANEL_MIPI_TRANSACTION(mipi, stmt)   \
+	do {                                 \
+		mutex_lock(&(mipi)->lock);   \
+		do {                         \
+			stmt;                \
+		} while (0);                 \
+		mutex_unlock(&(mipi)->lock); \
+	} while (0)
+
+#define PANEL_MIPI_TRANSACTION_LPM(mipi, lpm, stmt)                       \
+	PANEL_MIPI_TRANSACTION(                                           \
+		mipi,                                                     \
+		bool _lpm_backup = panel_mipi_dsi_set_lpm((mipi), (lpm)); \
+		do { stmt; } while (0);                                   \
+		panel_mipi_dsi_set_lpm((mipi), _lpm_backup))
+
+static int panel_mipi_validate_commands(struct panel_mipi *mipi, const u8 *data,
+					size_t size, size_t *valid_len)
+{
+	size_t i = 0;
+
+	/* sanity check */
+	while (i < size) {
+		u8 inst = data[i];
+		bool ext = (inst & 0x80) ? true : false;
+		u8 len = inst & 0x7f;
+
+		if (ext && len > 0)
+			return -EINVAL; /* reserved */
+
+		if (i + 1 + len > size)
+			break;
+
+		i += 1 + len;
+	}
+
+	*valid_len = i;
+
+	return 0;
+}
+
+static int panel_mipi_load_commands(struct panel_mipi *mipi, const u8 *data,
+				    size_t size)
+{
+	int err;
+	size_t valid_len;
+
+	err = panel_mipi_validate_commands(mipi, data, size, &valid_len);
+	if (err)
+		return err;
+
+	if (valid_len != size)
+		return -EINVAL;
+
+	mipi->commands.data = data;
+	mipi->commands.size = size;
+
+	return 0;
+}
+
+static int panel_mipi_write_commands(struct panel_mipi *mipi, const u8 *data,
+				     size_t size)
+{
+	const u8 *read_commands;
+	unsigned int write_memory_bpw;
+	size_t i = 0;
+	int err = 0;
+
+	if (!data)
+		return 0;
+
+	/*
+	 * Disable interpretation for special commands for DBI
+	 *
+	 * This is required because the vendor specific custom commands
+	 * may change its command set to the other.
+	 */
+	read_commands = mipi->dbi.read_commands;
+	write_memory_bpw = mipi->dbi.write_memory_bpw;
+	mipi->dbi.read_commands = NULL;
+	mipi->dbi.write_memory_bpw = 8;
+
+	while (i < size) {
+		u8 inst = data[i++];
+		bool ext = (inst & 0x80) ? true : false;
+		u8 len = inst & 0x7f;
+
+		if (len == 0x00) {
+			msleep(ext ? 100 : 10);
+			continue;
+		}
+
+		err = mipi->write_command(mipi, data + i, len);
+
+		if (err)
+			break;
+
+		i += len;
+	}
+
+	/* restore */
+	mipi->dbi.read_commands = read_commands;
+	mipi->dbi.write_memory_bpw = write_memory_bpw;
+
+	return err;
+}
+
+static int panel_mipi_read_firmware(const struct device *dev,
+				    struct panel_mipi *mipi,
+				    const struct panel_firmware *firmware)
+{
+	int rotation;
+	int err;
+
+	if (!firmware)
+		return 0;
+
+	err = panel_mipi_load_commands(mipi, firmware->commands.data,
+				       firmware->commands.size);
+	if (err) {
+		dev_err(dev, "firmware: Malformed command sequence\n");
+		return err;
+	}
+
+	mipi->width_mm = be16_to_cpu(firmware->config->width_mm);
+	mipi->height_mm = be16_to_cpu(firmware->config->height_mm);
+
+	rotation = be16_to_cpu(firmware->config->rotation);
+	if (rotation == 0)
+		mipi->orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
+	else if (rotation == 90)
+		mipi->orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
+	else if (rotation == 180)
+		mipi->orientation = DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
+	else if (rotation == 270)
+		mipi->orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
+	else {
+		dev_err(dev, "firmware: Invalid rotation %u\n", rotation);
+		return -EINVAL;
+	}
+
+	if (firmware->config->reset_delay)
+		mipi->reset_delay = be16_to_cpu(firmware->config->reset_delay);
+	if (firmware->config->init_delay)
+		mipi->init_delay = be16_to_cpu(firmware->config->init_delay);
+	if (firmware->config->sleep_delay)
+		mipi->sleep_delay = be16_to_cpu(firmware->config->sleep_delay);
+	if (firmware->config->backlight_delay)
+		mipi->backlight_delay =
+			be16_to_cpu(firmware->config->backlight_delay);
+
+	if (firmware->config->bus_flags)
+		mipi->bus_flags = be32_to_cpu(firmware->config->bus_flags);
+
+	return 0;
+}
+
+static struct panel_firmware *panel_mipi_load_firmware(struct device *dev)
+{
+	const struct firmware *blob;
+	const struct panel_firmware_header *hdr;
+	const struct panel_firmware_config *config;
+	const struct panel_firmware_panel_timing *timings;
+	struct panel_firmware *firmware;
+	const char *firmware_name;
+	size_t command_offset;
+	char filename[128];
+	int err;
+
+	err = of_property_read_string_index(dev->of_node, "compatible", 0,
+					    &firmware_name);
+	if (err)
+		return NULL;
+
+	/* Use firmware-name instead if any */
+	of_property_read_string(dev->of_node, "firmware-name", &firmware_name);
+
+	snprintf(filename, sizeof(filename), "panels/%s.panel", firmware_name);
+	err = firmware_request_nowarn(&blob, filename, dev);
+	if (err)
+		return NULL;
+
+	hdr = (const struct panel_firmware_header *)blob->data;
+
+	if (blob->size < sizeof(*hdr)) {
+		dev_err(dev, "firmware: %s: file size %zu is too small\n",
+			filename, blob->size);
+		err = -EINVAL;
+		goto err;
+	}
+
+	if (memcmp(hdr->magic, panel_firmware_magic, sizeof(hdr->magic))) {
+		dev_err(dev, "firmware: %s: Bad magic %15ph\n", filename,
+			hdr->magic);
+		err = -EINVAL;
+		goto err;
+	}
+
+	if (hdr->file_format_version != 1) {
+		dev_err(dev, "firmware: %s: version %u is not supported\n",
+			filename, hdr->file_format_version);
+		err = -EINVAL;
+		goto err;
+	}
+
+	config = (struct panel_firmware_config *)(blob->data + sizeof(*hdr));
+	timings = (struct panel_firmware_panel_timing *)(blob->data +
+							 sizeof(*hdr) +
+							 sizeof(*config));
+	command_offset = sizeof(*hdr) + sizeof(*config) +
+			 config->num_timings * sizeof(*timings);
+	if (blob->size < command_offset) {
+		dev_err(dev, "firmware: %s: file size %zu is too small\n",
+			filename, blob->size);
+		err = -EINVAL;
+		goto err;
+	}
+
+	firmware = devm_kzalloc(dev, sizeof(*firmware), GFP_KERNEL);
+	if (!firmware) {
+		err = -ENOMEM;
+		goto err;
+	}
+
+	firmware->blob = blob;
+	firmware->config = config;
+	firmware->timings = timings;
+	firmware->commands.data = blob->data + command_offset;
+	firmware->commands.size = blob->size - command_offset;
+
+	dev_info(dev, "firmware: %s: loaded successfully\n", filename);
+
+	return firmware;
+
+err:
+	release_firmware(blob);
+
+	return ERR_PTR(err);
+}
+
+static int panel_mipi_read_display_id(struct panel_mipi *mipi, u8 *dest)
+{
+	return panel_mipi_read(mipi, MIPI_DCS_GET_DISPLAY_ID, dest, 3);
+}
+
+static int panel_mipi_enable(struct drm_panel *panel)
+{
+	struct panel_mipi *mipi = to_panel_mipi(panel);
+	int err;
+
+	PANEL_MIPI_TRANSACTION(mipi, {
+		err = panel_mipi_write(mipi, MIPI_DCS_SET_DISPLAY_ON);
+	});
+	if (err)
+		return err;
+
+	if (panel->backlight) {
+		/* Wait for the picture to be ready before enabling backlight */
+		msleep(mipi->backlight_delay);
+	}
+
+	return 0;
+}
+
+static int panel_mipi_disable(struct drm_panel *panel)
+{
+	struct panel_mipi *mipi = to_panel_mipi(panel);
+	int err = 0;
+
+	PANEL_MIPI_TRANSACTION(mipi, {
+		err = panel_mipi_write(mipi, MIPI_DCS_SET_DISPLAY_OFF);
+	});
+
+	return err;
+}
+
+static int panel_mipi_prepare(struct drm_panel *panel)
+{
+	struct panel_mipi *mipi = to_panel_mipi(panel);
+	int err;
+
+	err = regulator_bulk_enable(ARRAY_SIZE(mipi->supplies), mipi->supplies);
+	if (err)
+		return err;
+
+	PANEL_MIPI_TRANSACTION(mipi, {
+		/* Reset the chip */
+		if (mipi->reset) {
+			gpiod_set_value_cansleep(mipi->reset, 1);
+			msleep(mipi->reset_delay);
+			gpiod_set_value_cansleep(mipi->reset, 0);
+		}
+
+		msleep(mipi->init_delay);
+
+		/* Read the Display ID */
+		if (!panel_mipi_read_display_id(mipi,
+						mipi->initial_display_id)) {
+			dev_info(panel->dev, "MIPI Display ID: %3phN\n",
+				 mipi->initial_display_id);
+		}
+
+		/* Write the init-sequence */
+		err = panel_mipi_write_commands(mipi, mipi->commands.data,
+						mipi->commands.size);
+		if (err)
+			break;
+
+		/* Ensure to exit from a sleep mode */
+		err = panel_mipi_write(mipi, MIPI_DCS_EXIT_SLEEP_MODE);
+		if (err)
+			break;
+		msleep(mipi->sleep_delay);
+
+		/*
+		 * Read the Display ID again,
+		 * because the init-sequence might have changed the ID.
+		 */
+		if (!panel_mipi_read_display_id(mipi, mipi->display_id) &&
+		    memcmp(mipi->initial_display_id, mipi->display_id,
+			   sizeof(mipi->display_id))) {
+			dev_info(panel->dev,
+				 "MIPI Display ID: %3phN (changed)\n",
+				 mipi->display_id);
+		}
+	});
+
+	if (err) {
+		regulator_bulk_disable(ARRAY_SIZE(mipi->supplies),
+				       mipi->supplies);
+		return err;
+	}
+
+	return 0;
+}
+
+static int panel_mipi_unprepare(struct drm_panel *panel)
+{
+	struct panel_mipi *mipi = to_panel_mipi(panel);
+	int err;
+
+	PANEL_MIPI_TRANSACTION(mipi, {
+		err = panel_mipi_write(mipi, MIPI_DCS_ENTER_SLEEP_MODE);
+		if (err)
+			dev_warn(panel->dev, "Failed to enter a sleep mode\n");
+		msleep(mipi->sleep_delay);
+	});
+
+	if (mipi->reset) {
+		gpiod_set_value_cansleep(mipi->reset, 1);
+		msleep(mipi->reset_delay);
+	}
+
+	regulator_bulk_disable(ARRAY_SIZE(mipi->supplies), mipi->supplies);
+
+	return 0;
+}
+
+static int panel_mipi_get_modes(struct drm_panel *panel,
+				struct drm_connector *connector)
+{
+	struct panel_mipi *mipi = to_panel_mipi(panel);
+	struct drm_display_mode *mode;
+	unsigned int count = 0;
+
+	list_for_each_entry(mode, &mipi->mode_list, head) {
+		struct drm_display_mode *dmode;
+
+		dmode = drm_mode_duplicate(connector->dev, mode);
+		if (!dmode)
+			return -EINVAL;
+
+		drm_mode_probed_add(connector, dmode);
+		count++;
+	}
+
+	connector->display_info.bpc = 8;
+	connector->display_info.width_mm = mipi->width_mm;
+	connector->display_info.height_mm = mipi->height_mm;
+	connector->display_info.bus_flags = mipi->bus_flags;
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &mipi->bus_format, 1);
+
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
+	drm_connector_set_panel_orientation(connector, mipi->orientation);
+
+	return count;
+}
+
+static enum drm_panel_orientation
+panel_mipi_get_orientation(struct drm_panel *panel)
+{
+	struct panel_mipi *mipi = to_panel_mipi(panel);
+
+	return mipi->orientation;
+}
+
+#ifdef CONFIG_DEBUG_FS
+
+static int display_id_show(struct seq_file *s, void *data)
+{
+	struct drm_panel *panel = s->private;
+	struct panel_mipi *mipi = to_panel_mipi(panel);
+	int err = 0;
+
+	PANEL_MIPI_TRANSACTION(mipi, {
+		err = panel_mipi_read_display_id(mipi, mipi->display_id);
+		if (err)
+			break;
+
+		seq_printf(s, "%3phN\n", mipi->display_id);
+	});
+
+	return err;
+}
+DEFINE_SHOW_ATTRIBUTE(display_id);
+
+static int initial_display_id_show(struct seq_file *s, void *data)
+{
+	struct drm_panel *panel = s->private;
+	struct panel_mipi *mipi = to_panel_mipi(panel);
+
+	seq_printf(s, "%3phN\n", mipi->initial_display_id);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(initial_display_id);
+
+static int commands_open(struct inode *inode, struct file *file)
+{
+	struct panel_mipi *mipi = inode->i_private;
+
+	mipi->recvlen = 0;
+	file->private_data = mipi;
+
+	return 0;
+}
+
+static ssize_t commands_write(struct file *file, const char __user *data,
+			      size_t size, loff_t *pos)
+{
+	struct panel_mipi *mipi = file->private_data;
+	ssize_t s = min_t(u64, sizeof(mipi->recvbuf) - mipi->recvlen, size);
+	size_t valid_len;
+	int err;
+
+	if (!s || !mipi)
+		return -EINVAL;
+
+	if (copy_from_user(mipi->recvbuf + mipi->recvlen, data, s))
+		return -EINVAL;
+
+	mipi->recvlen += s;
+
+	err = panel_mipi_validate_commands(mipi, mipi->recvbuf, mipi->recvlen,
+					   &valid_len);
+	if (err)
+		return err;
+
+	if (valid_len > 0) {
+		PANEL_MIPI_TRANSACTION(mipi, {
+			err = panel_mipi_write_commands(mipi, mipi->recvbuf,
+							valid_len);
+		});
+		if (err)
+			return err;
+
+		mipi->recvlen -= valid_len;
+		if (mipi->recvlen)
+			memmove(mipi->recvbuf, mipi->recvbuf + valid_len,
+				mipi->recvlen);
+	}
+
+	return s;
+}
+
+static int commands_release(struct inode *inode, struct file *file)
+{
+	struct panel_mipi *mipi = inode->i_private;
+
+	if (mipi->recvlen) {
+		dev_err(mipi->panel.dev, "Premature end of commands\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static const struct file_operations commands_fops = {
+	.owner = THIS_MODULE,
+	.open = commands_open,
+	.write = commands_write,
+	.release = commands_release,
+};
+
+#endif
+
+static void panel_mipi_debugfs_init(struct device *dev, struct panel_mipi *mipi)
+{
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *dir;
+
+	mipi->debugfs = debugfs_lookup("panel-mipi", NULL);
+	if (!mipi->debugfs)
+		mipi->debugfs = debugfs_create_dir("panel-mipi", NULL);
+
+	dir = debugfs_create_dir(dev_name(dev), mipi->debugfs);
+	debugfs_create_file("display-id", 0600, dir, mipi, &display_id_fops);
+	debugfs_create_file("initial-display-id", 0600, dir, mipi,
+			    &initial_display_id_fops);
+	debugfs_create_file("commands", 0600, dir, mipi, &commands_fops);
+#endif
+}
+
+static void panel_mipi_debugfs_remove(struct panel_mipi *mipi)
+{
+#ifdef CONFIG_DEBUG_FS
+	debugfs_remove_recursive(mipi->debugfs);
+	mipi->debugfs = NULL;
+#endif
+}
+
+static const struct drm_panel_funcs panel_mipi_funcs = {
+	.prepare = panel_mipi_prepare,
+	.unprepare = panel_mipi_unprepare,
+	.enable = panel_mipi_enable,
+	.disable = panel_mipi_disable,
+	.get_modes = panel_mipi_get_modes,
+	.get_orientation = panel_mipi_get_orientation,
+};
+
+static int panel_mipi_add_mode(struct device *dev, struct panel_mipi *mipi,
+			       const struct drm_display_mode *src_mode,
+			       const char *source)
+{
+	struct drm_display_mode *mode;
+
+	mode = devm_kzalloc(dev, sizeof(*mode), GFP_KERNEL);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_copy(mode, src_mode);
+
+	if (!mode->clock)
+		mode->clock = mode->htotal * mode->vtotal * 60 / 1000;
+
+	mode->type |= DRM_MODE_TYPE_DRIVER;
+
+	dev_info(dev, "Modeline " DRM_MODE_FMT " added by %s\n",
+		 DRM_MODE_ARG(mode), source);
+
+	list_add_tail(&mode->head, &mipi->mode_list);
+
+	return 0;
+}
+
+static int panel_mipi_firmware_read_modes(const struct panel_firmware *firmware,
+					  struct drm_display_mode *mode,
+					  u32 *bus_flags, unsigned int i)
+{
+	const struct panel_firmware_panel_timing *timings =
+		&firmware->timings[i];
+
+	if (!firmware || i >= firmware->config->num_timings)
+		return -ENOENT;
+
+	if (!timings->hactive || !timings->vactive)
+		return -ENOENT;
+
+	memset(mode, 0, sizeof(*mode));
+
+	mode->clock = be32_to_cpu(timings->dclk);
+
+	mode->hdisplay = be16_to_cpu(timings->hactive);
+	mode->hsync_start = mode->hdisplay + be16_to_cpu(timings->hfp);
+	mode->hsync_end = mode->hsync_start + be16_to_cpu(timings->hslen);
+	mode->htotal = mode->hsync_end + be16_to_cpu(timings->hbp);
+
+	mode->vdisplay = be16_to_cpu(timings->vactive);
+	mode->vsync_start = mode->vdisplay + be16_to_cpu(timings->vfp);
+	mode->vsync_end = mode->vsync_start + be16_to_cpu(timings->vslen);
+	mode->vtotal = mode->vsync_end + be16_to_cpu(timings->vbp);
+
+	mode->flags = be32_to_cpu(timings->flags);
+
+	drm_mode_set_name(mode);
+
+	if (bus_flags && firmware->config->bus_flags)
+		*bus_flags = be32_to_cpu(firmware->config->bus_flags);
+
+	return 0;
+}
+
+static void drm_display_mode_from_timing(const struct display_timing *timing,
+					 struct drm_display_mode *dmode,
+					 u32 *bus_flags)
+{
+	struct videomode vm;
+
+	videomode_from_timing(timing, &vm);
+
+	memset(dmode, 0, sizeof(*dmode));
+	drm_display_mode_from_videomode(&vm, dmode);
+
+	if (bus_flags)
+		drm_bus_flags_from_videomode(&vm, bus_flags);
+}
+
+static int panel_mipi_read_of_display_timings(struct device *dev,
+					      struct panel_mipi *mipi)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *timings_np;
+	struct display_timings *timings;
+	struct drm_display_mode mode = {};
+	u32 bus_flags;
+	unsigned int i;
+	int err;
+
+	/* To avoid the not found error message */
+	timings_np = of_get_child_by_name(np, "display-timings");
+	if (!timings_np)
+		return 0;
+	of_node_put(timings_np);
+
+	/* Then, load timings as usual */
+	timings = of_get_display_timings(np);
+	if (!timings)
+		return dev_err_probe(dev, -EINVAL,
+				     "%pOF: Failed to get 'display-timings'\n",
+				     dev->of_node);
+
+	for (i = 0; i < timings->num_timings; i++) {
+		drm_display_mode_from_timing(timings->timings[i], &mode,
+					     &bus_flags);
+
+		if (timings->native_mode == i)
+			mode.type |= DRM_MODE_TYPE_PREFERRED;
+
+		err = panel_mipi_add_mode(dev, mipi, &mode, "display-timings");
+		if (err)
+			return err;
+		if (bus_flags)
+			mipi->bus_flags = bus_flags;
+	}
+
+	display_timings_release(timings);
+
+	return 0;
+}
+
+static int panel_mipi_probe_modes(struct device *dev, struct panel_mipi *mipi)
+{
+	unsigned int i = 0;
+	u32 bus_flags = 0;
+	struct drm_display_mode mode = {};
+	struct display_timing timing = {};
+	int err;
+
+	INIT_LIST_HEAD(&mipi->mode_list);
+
+	/* Read firmware first */
+	for (i = 0; mipi->firmware && i < mipi->firmware->config->num_timings;
+	     i++) {
+		if (!panel_mipi_firmware_read_modes(mipi->firmware, &mode,
+						    &bus_flags, i)) {
+			if (mipi->firmware->config->preferred_timing == i)
+				mode.type |= DRM_MODE_TYPE_PREFERRED;
+
+			err = panel_mipi_add_mode(dev, mipi, &mode, "firmware");
+			if (err)
+				return err;
+			if (bus_flags)
+				mipi->bus_flags = bus_flags;
+		}
+	}
+
+	/* Read `display-timings` and append if any */
+	err = panel_mipi_read_of_display_timings(dev, mipi);
+	if (err)
+		return err;
+
+	/* Read `panel-timing` and append if any */
+	err = of_get_display_timing(dev->of_node, "panel-timing", &timing);
+	if (err && err != -ENOENT)
+		return err;
+	else if (!err) {
+		drm_display_mode_from_timing(&timing, &mode, &bus_flags);
+		err = panel_mipi_add_mode(dev, mipi, &mode, "panel-timing");
+		if (err)
+			return err;
+		if (bus_flags)
+			mipi->bus_flags = bus_flags;
+	}
+
+	if (list_empty(&mipi->mode_list))
+		return dev_err_probe(dev, -EINVAL, "No modes defined\n");
+
+	return 0;
+}
+
+static void panel_mipi_cleanup(void *data)
+{
+	struct panel_mipi *mipi = (struct panel_mipi *)data;
+
+	panel_mipi_debugfs_remove(mipi);
+
+	drm_panel_remove(&mipi->panel);
+	drm_panel_disable(&mipi->panel);
+	drm_panel_unprepare(&mipi->panel);
+
+	if (mipi->firmware)
+		release_firmware(mipi->firmware->blob);
+}
+
+static int
+panel_mipi_backlight_update_status(struct backlight_device *backlight)
+{
+	struct panel_mipi *mipi = dev_get_drvdata(&backlight->dev);
+	int level = backlight_get_brightness(backlight);
+	int err;
+
+	PANEL_MIPI_TRANSACTION_LPM(mipi, false, {
+		err = panel_mipi_write(mipi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
+				       level, level);
+	});
+
+	return err;
+}
+
+static int
+panel_mipi_backlight_get_brightness(struct backlight_device *backlight)
+{
+	return backlight_get_brightness(backlight);
+}
+
+static const struct backlight_ops panel_mipi_backlight_ops = {
+	.get_brightness = panel_mipi_backlight_get_brightness,
+	.update_status = panel_mipi_backlight_update_status,
+};
+
+static int panel_mipi_set_backlight(struct drm_panel *panel, struct device *dev,
+				    struct panel_mipi *mipi)
+{
+	int err;
+
+	err = drm_panel_of_backlight(panel);
+	if (err)
+		return err;
+
+	if (!panel->backlight) {
+		struct backlight_device *backlight = NULL;
+		struct backlight_properties props = {
+			.max_brightness = 255,
+			.type = BACKLIGHT_RAW,
+		};
+
+		backlight = devm_backlight_device_register(
+			dev, dev_name(dev), dev, mipi,
+			&panel_mipi_backlight_ops, &props);
+		if (IS_ERR(backlight))
+			return PTR_ERR(backlight);
+
+		panel->backlight = backlight;
+	}
+
+	return 0;
+}
+
+static int panel_mipi_probe(struct device *dev, int connector_type)
+{
+	struct panel_mipi *mipi;
+	int err;
+
+	mipi = devm_kzalloc(dev, sizeof(*mipi), GFP_KERNEL);
+	if (!mipi)
+		return -ENOMEM;
+
+	mutex_init(&mipi->lock);
+
+	/* Get `power-supply` and `io-supply` (if any) */
+	mipi->supplies[0].supply = "power";
+	mipi->supplies[1].supply = "io";
+	err = devm_regulator_bulk_get(dev, ARRAY_SIZE(mipi->supplies),
+				      mipi->supplies);
+	if (err < 0) {
+		return dev_err_probe(dev, err,
+				     "%pOF: Failed to get regulators\n",
+				     dev->of_node);
+	}
+
+	/* GPIO for /RESET */
+	mipi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(mipi->reset))
+		return dev_err_probe(dev, PTR_ERR(mipi->reset),
+				     "%pOF: Failed to get GPIO for RESET\n",
+				     dev->of_node);
+
+	/* Default values */
+	mipi->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	mipi->reset_delay = 1;
+	mipi->init_delay = 10;
+	mipi->sleep_delay = 120;
+	mipi->backlight_delay = 120;
+
+	/* Load from the firmware */
+	mipi->firmware = panel_mipi_load_firmware(dev);
+	if (IS_ERR(mipi->firmware))
+		return dev_err_probe(dev, PTR_ERR(mipi->firmware),
+				     "Failed to load a firmware\n");
+	err = panel_mipi_read_firmware(dev, mipi, mipi->firmware);
+	if (err)
+		return err;
+
+	/* Load panel modes */
+	err = panel_mipi_probe_modes(dev, mipi);
+	if (err)
+		return err;
+
+	/* Load overrides from the DT */
+	const struct property *prop =
+		of_find_property(dev->of_node, "init-sequence", NULL);
+	if (prop && prop->value && prop->length > 0) {
+		err = panel_mipi_load_commands(mipi, prop->value, prop->length);
+		if (err)
+			return dev_err_probe(
+				dev, err, "%pOF: Malformed command sequence\n",
+				dev->of_node);
+	}
+	of_property_read_u32(dev->of_node, "width-mm", &mipi->width_mm);
+	of_property_read_u32(dev->of_node, "height-mm", &mipi->height_mm);
+	of_property_read_u32(dev->of_node, "reset-delay", &mipi->reset_delay);
+	of_property_read_u32(dev->of_node, "init-delay", &mipi->init_delay);
+	of_property_read_u32(dev->of_node, "sleep-delay", &mipi->sleep_delay);
+	of_property_read_u32(dev->of_node, "backlight-delay",
+			     &mipi->backlight_delay);
+	if (of_find_property(dev->of_node, "rotation", NULL)) {
+		err = of_drm_get_panel_orientation(dev->of_node,
+						   &mipi->orientation);
+		if (err)
+			return dev_err_probe(dev, err,
+					     "%pOF: Invalid rotation\n",
+					     dev->of_node);
+	}
+
+	/* DRM panel setup */
+	drm_panel_init(&mipi->panel, dev, &panel_mipi_funcs, connector_type);
+
+	err = panel_mipi_set_backlight(&mipi->panel, dev, mipi);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to set backlight\n");
+
+	drm_panel_add(&mipi->panel);
+
+	dev_set_drvdata(dev, mipi);
+
+	panel_mipi_debugfs_init(dev, mipi);
+
+	return devm_add_action_or_reset(dev, panel_mipi_cleanup, mipi);
+}
+
+static unsigned long panel_mipi_read_dsi_mode_props(struct device_node *np)
+{
+	unsigned long mode = 0;
+
+	mode |= of_property_read_bool(np, "dsi-mode-video") ?
+			MIPI_DSI_MODE_VIDEO :
+			0;
+	mode |= of_property_read_bool(np, "dsi-mode-video-burst") ?
+			MIPI_DSI_MODE_VIDEO_BURST :
+			0;
+	mode |= of_property_read_bool(np, "dsi-mode-video-sync-pulse") ?
+			MIPI_DSI_MODE_VIDEO_SYNC_PULSE :
+			0;
+	mode |= of_property_read_bool(np, "dsi-mode-video-auto-vert") ?
+			MIPI_DSI_MODE_VIDEO_AUTO_VERT :
+			0;
+	mode |= of_property_read_bool(np, "dsi-mode-video-hse") ?
+			MIPI_DSI_MODE_VIDEO_HSE :
+			0;
+	mode |= of_property_read_bool(np, "dsi-mode-video-no-hfp") ?
+			MIPI_DSI_MODE_VIDEO_NO_HFP :
+			0;
+	mode |= of_property_read_bool(np, "dsi-mode-video-no-hbp") ?
+			MIPI_DSI_MODE_VIDEO_NO_HBP :
+			0;
+	mode |= of_property_read_bool(np, "dsi-mode-video-no-hsa") ?
+			MIPI_DSI_MODE_VIDEO_NO_HSA :
+			0;
+	mode |= of_property_read_bool(np, "dsi-mode-vsync-flush") ?
+			MIPI_DSI_MODE_VSYNC_FLUSH :
+			0;
+	mode |= of_property_read_bool(np, "dsi-mode-no-eot-packet") ?
+			MIPI_DSI_MODE_NO_EOT_PACKET :
+			0;
+	mode |= of_property_read_bool(np, "dsi-clock-non-continuous") ?
+			MIPI_DSI_CLOCK_NON_CONTINUOUS :
+			0;
+	mode |= of_property_read_bool(np, "dsi-mode-lpm") ? MIPI_DSI_MODE_LPM :
+							    0;
+	mode |= of_property_read_bool(np, "dsi-hs-pkt-end-aligned") ?
+			MIPI_DSI_HS_PKT_END_ALIGNED :
+			0;
+
+	return mode;
+}
+
+static int panel_mipi_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct panel_mipi *mipi;
+	const char *format;
+	int err;
+
+	err = panel_mipi_probe(&dsi->dev, DRM_MODE_CONNECTOR_DSI);
+	if (err)
+		return err;
+
+	mipi = dev_get_drvdata(&dsi->dev);
+	mipi->dsi = dsi;
+	mipi->write_command = panel_mipi_dsi_write;
+	mipi->read_command = panel_mipi_dsi_read;
+
+	/* Default values */
+	dsi->lanes = 1;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = 0;
+
+	/* Read from the firmware */
+	if (mipi->firmware) {
+		dsi->lanes = be16_to_cpu(mipi->firmware->config->dsi_lanes);
+		dsi->format = be16_to_cpu(mipi->firmware->config->dsi_format);
+		dsi->mode_flags =
+			be32_to_cpu(mipi->firmware->config->dsi_mode_flags);
+	}
+
+	/* Load from the DT */
+	of_property_read_u32(dsi->dev.of_node, "dsi-lanes", &dsi->lanes);
+	if (!of_property_read_string(dsi->dev.of_node, "dsi-format", &format)) {
+		if (!strcmp(format, "rgb888"))
+			dsi->format = MIPI_DSI_FMT_RGB888;
+		else if (!strcmp(format, "rgb666"))
+			dsi->format = MIPI_DSI_FMT_RGB666;
+		else if (!strcmp(format, "rgb666-packed"))
+			dsi->format = MIPI_DSI_FMT_RGB666_PACKED;
+		else if (!strcmp(format, "rgb565"))
+			dsi->format = MIPI_DSI_FMT_RGB565;
+		else
+			return dev_err_probe(&dsi->dev, -EINVAL,
+					     "%pOF: Unknown dsi-format '%s'\n",
+					     dsi->dev.of_node, format);
+	}
+	dsi->mode_flags |= panel_mipi_read_dsi_mode_props(dsi->dev.of_node);
+
+	if (!dsi->lanes)
+		return dev_err_probe(&dsi->dev, -EINVAL,
+				     "dsi-lanes == 0 for DSI panel\n");
+
+	/* Adjust bus_format */
+	switch (dsi->format) {
+	case MIPI_DSI_FMT_RGB888:
+		mipi->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case MIPI_DSI_FMT_RGB666:
+		mipi->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
+		break;
+	case MIPI_DSI_FMT_RGB666_PACKED:
+		mipi->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
+		break;
+	case MIPI_DSI_FMT_RGB565:
+		mipi->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
+		break;
+	}
+
+	err = mipi_dsi_attach(dsi);
+	if (err)
+		return dev_err_probe(&dsi->dev, err, "Failed to init DSI\n");
+
+	return 0;
+}
+
+static int panel_mipi_spi_probe(struct spi_device *spi)
+{
+	struct panel_mipi *mipi;
+	struct gpio_desc *dc;
+	int err;
+
+	err = panel_mipi_probe(&spi->dev, DRM_MODE_CONNECTOR_DPI);
+	if (err)
+		return err;
+
+	mipi = dev_get_drvdata(&spi->dev);
+	mipi->write_command = panel_mipi_dbi_write;
+	mipi->read_command = panel_mipi_dbi_read;
+
+	dc = devm_gpiod_get_optional(&spi->dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc))
+		return dev_err_probe(&spi->dev, PTR_ERR(dc),
+				     "Failed to get GPIO for D/CX\n");
+
+	err = mipi_dbi_spi_init(spi, &mipi->dbi, dc);
+	if (err)
+		return dev_err_probe(&spi->dev, err, "Failed to init SPI\n");
+
+	return 0;
+}
+
+static void panel_mipi_dsi_remove(struct mipi_dsi_device *dsi)
+{
+	mipi_dsi_detach(dsi);
+}
+
+static const struct of_device_id panel_mipi_dsi_of_match[] = {
+	{ .compatible = "panel-mipi-dsi" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, panel_mipi_dsi_of_match);
+
+static const struct of_device_id panel_mipi_spi_of_match[] = {
+	{ .compatible = "panel-mipi-dpi-spi" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, panel_mipi_spi_of_match);
+
+static const struct spi_device_id panel_mipi_spi_ids[] = {
+	{ "panel-mipi-dpi-spi" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, panel_mipi_spi_ids);
+
+static struct mipi_dsi_driver panel_mipi_dsi_driver = {
+	.probe		= panel_mipi_dsi_probe,
+	.remove		= panel_mipi_dsi_remove,
+	.driver = {
+		.name		= "panel-mipi",
+		.of_match_table	= panel_mipi_dsi_of_match,
+	},
+};
+
+static struct spi_driver panel_mipi_spi_driver = {
+	.probe		= panel_mipi_spi_probe,
+	.id_table	= panel_mipi_spi_ids,
+	.driver = {
+		.name		= "panel-mipi",
+		.of_match_table	= panel_mipi_spi_of_match,
+	},
+};
+
+static int __init panel_mipi_driver_init(void)
+{
+	int err;
+
+	if (IS_ENABLED(CONFIG_SPI)) {
+		err = spi_register_driver(&panel_mipi_spi_driver);
+		if (err)
+			return err;
+	}
+
+	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
+		err = mipi_dsi_driver_register(&panel_mipi_dsi_driver);
+		if (err) {
+			if (IS_ENABLED(CONFIG_SPI))
+				spi_unregister_driver(&panel_mipi_spi_driver);
+			return err;
+		}
+	}
+
+	return 0;
+}
+module_init(panel_mipi_driver_init);
+
+static void __exit panel_mipi_driver_exit(void)
+{
+	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
+		mipi_dsi_driver_unregister(&panel_mipi_dsi_driver);
+
+	if (IS_ENABLED(CONFIG_SPI))
+		spi_unregister_driver(&panel_mipi_spi_driver);
+}
+module_exit(panel_mipi_driver_exit);
+
+MODULE_DESCRIPTION("Generic MIPI-DSI/DPI(+SPI) Panel Driver");
+MODULE_AUTHOR("Hironori KIKUCHI <kikuchan98@gmail.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.48.1

