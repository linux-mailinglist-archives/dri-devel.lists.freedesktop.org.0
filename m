Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F1B1D310
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0520710E7E7;
	Thu,  7 Aug 2025 07:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GhiP/+Vw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B7410E28D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 12:48:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso14533475e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754484503; x=1755089303; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fDGRoM+xkQNjYRwj2eFjWlIC7j/omxeg86v93oHycQo=;
 b=GhiP/+VwJ6iyHW6B9VKFnRkb3lj4GZkozsLHBdwSX9Ggb5SUpRAbTTnp9X7hJI+5Jz
 7//Isk+ILxrCWnjpf4bGid1FW5CYUgUQuZq6TkM7SbXZ/m+g+dgWjfVa2+CrNQ4RSpFr
 ufHr2Qj7vvmfAAvBA9rsbddDzBBVvS/l5+gtv7YfVtE6o3NUElc0V5GBa3V49zMDM7GS
 Vf3rWbAF0RPbnSOo2mMCtb6Li4rXlCO/mDI9iG1qR74YFiAyDVo/SYvO0KFbZLg77t6x
 xLmYTqeTLvV09T8CoELZwKVFRD44pD4/jsSCpP4m6S8EUhpxI7z4t5i93z+vEd+q9kf9
 RgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754484503; x=1755089303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fDGRoM+xkQNjYRwj2eFjWlIC7j/omxeg86v93oHycQo=;
 b=S2/an05uxwRuhVRMUjJUQ9UHLjMVuao7TNqUwDNO3QpGSSjSsP5Dsdv1cnwFnCwihR
 nsb5qVHQqDXgQrL+MZSs9fxVuozYq/eCv0e/U2W8uMyhxZPYp4OzDhOnpm7VrE5ajVSe
 9HsdBBZzmK5n+pfIaq6SDQUSODqBl0lnUyCqTUeWvHbppBAF52yI0kbF9cwqV4xsznA8
 m+ZmLN/YY1nD6ZQ1Co3COYIv6WXBEkrmgdCVYVg/4+Ioq9Qcypavxgz3y/g3HGynzy6a
 FrlNmE9h8OjSp9lC7N6bmbOikHwMO+w/JaqfEag/FzKT8NougVsKzXyDAgLrKfsQh7Y9
 nspw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7PVBASm4v0Ja5SiEvvwtXXEwyAgzxuefb9I9R3pT9yx/J1MCjeGXmWnddCmhs9eJF9Yc9u/ghabE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqbwL5Qd3J69CTwgZQ+xeO/43HsAVQE6zV8S+cXP+vk+c81qnR
 E25ikkPH8i/iZbc0JYzTT7jL9b8iqTitlukqX0Wbz/mkVnMCsePjYOL3+4M4sAS6
X-Gm-Gg: ASbGnctcYBzUh0NtJysB9X4glKIi3tconSe+HAr+CAv1WJoNeuhgCsp6J4oW5SyuTWh
 j/QCjkt4d+vcm4AFCDGr3r+GESlqFc1d7PJqwjU6CuEYGL1wcVVZ9Uu/cYuj3NYElGHLSDNMYho
 5qLNCRziyqMAYP4BvJZITudC3iXuDCdftqrSjx8GqXdwxp2FziWy6Tl2eRILrjF0zBz09zEOopT
 TLtyBDyBt0Whmp0FU6qoWpJhCo2GEqldN6hd27Wh2yqCwRItSQAXkBGWBAtLX3LL9QHC04+teWw
 6TX4c6Stgh98gSwL6U4WNvygMEYS3JSSSx37RtNfvxOBnnDZfB7N+rvsJIT+OfyZLCWSS2Uo67/
 3xHcSIvHl8/qCv1ssrCGCFEuBIBNQbQbbpNgfWHFT6vSdUgfFvRYvR+Ww5ZbojhS5STHbtB2y1K
 E=
X-Google-Smtp-Source: AGHT+IHu8qfr/Kyiax6HAUTlPZbsrMR1pgrIu3eMS8Ht5O/jaR8FS4cWD7MqQWohT2YHmn4elky5+g==
X-Received: by 2002:a05:6000:240d:b0:3b8:d672:3cf8 with SMTP id
 ffacd0b85a97d-3b8f41b6bc6mr2156926f8f.43.1754484502468; 
 Wed, 06 Aug 2025 05:48:22 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([91.116.162.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458be70c5f7sm170110045e9.26.2025.08.06.05.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 05:48:22 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 06 Aug 2025 14:48:09 +0200
Subject: [PATCH 1/3] drm: Add driver for Sitronix ST7920 LCD displays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-st7920-v1-1-64ab5a34f9a0@gmail.com>
References: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
In-Reply-To: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Thu, 07 Aug 2025 07:13:37 +0000
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

This adds a functional DRM driver for ST7920 that communicates with the
display via the SPI bus.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/sitronix/Kconfig  |  10 +
 drivers/gpu/drm/sitronix/Makefile |   1 +
 drivers/gpu/drm/sitronix/st7920.c | 869 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sitronix/st7920.h |  55 +++
 4 files changed, 935 insertions(+)

diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
index 6de7d92d9b74c72746915b945869dba91f161d2b..68f792dda14e83f457579ae7c240f4cc6a469d33 100644
--- a/drivers/gpu/drm/sitronix/Kconfig
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -40,3 +40,13 @@ config DRM_ST7735R
 
 	  If M is selected the module will be called st7735r.
 
+config DRM_ST7920
+	tristate "DRM support for Sitronix ST7920 LCD displays"
+	depends on DRM && SPI
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select REGMAP_SPI
+	help
+	  DRM driver for the ST7920 Sitronix LCD controllers.
+
+	  If M is selected the module will be called st7920.
diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
index bd139e5a6995fa026cc635b3c29782473d1efad7..2f064a518121bfee3cca73acd42589e8c54cd4d7 100644
--- a/drivers/gpu/drm/sitronix/Makefile
+++ b/drivers/gpu/drm/sitronix/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
 obj-$(CONFIG_DRM_ST7586)		+= st7586.o
 obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
+obj-$(CONFIG_DRM_ST7920))		+= st7920.o
diff --git a/drivers/gpu/drm/sitronix/st7920.c b/drivers/gpu/drm/sitronix/st7920.c
new file mode 100644
index 0000000000000000000000000000000000000000..c3226f352e39c626e3654250631521d07edf6784
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/st7920.c
@@ -0,0 +1,869 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for Sitronix ST7920 LCD displays
+ *
+ * Copyright 2025 Iker Pedrosa <ikerpedrosam@gmail.com>
+ *
+ */
+
+#include <linux/bitrev.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_shmem.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_probe_helper.h>
+
+#include "st7920.h"
+
+#define DRIVER_NAME	"sitronix_st7920"
+#define DRIVER_DESC	"DRM driver for Sitronix ST7920 LCD displays"
+#define DRIVER_DATE	"20250723"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+/* Display organization */
+#define WIDTH_BYTES		16
+#define HEIGHT_IN_PIXELS	64
+#define BYTES_IN_DISPLAY	(WIDTH_BYTES * HEIGHT_IN_PIXELS)
+#define BYTES_IN_SEGMENT	2
+#define PIXELS_IN_SEGMENT	(BYTES_IN_SEGMENT * 8)
+
+/* Sync sequence */
+#define SYNC_BITS			0xF8
+#define RW_HIGH				0x04
+#define RS_HIGH				0x02
+
+/* Commands */
+#define SET_DISPLAY_ON			0x0C
+#define SET_DISPLAY_OFF			0x08
+#define SET_DISPLAY_CLEAR		0x01
+#define SET_BASIC_INSTRUCTION_SET	0x30
+#define SET_EXT_INSTRUCTION_SET		0x34
+#define SET_GRAPHICS_DISPLAY		0x36
+#define SET_GDRAM_ADDRESS		0x80
+#define SET_GDRAM_DATA			0xFF /* Driver internal command */
+
+/* Masks */
+#define HIGH_DATA_MASK			0xF0
+#define LOW_DATA_MASK			0x0F
+#define TOP_VERTICAL_ADDRESS		0x80
+#define BOTTOM_VERTICAL_ADDRESS		0x60
+#define TOP_HORIZONTAL_ADDRESS		0x00
+#define BOTTOM_HORIZONTAL_ADDRESS	0x80
+
+#define CMD_SIZE			35
+
+const struct st7920_deviceinfo st7920_variants[] = {
+	[ST7920_ID] = {
+		.default_width = 128,
+		.default_height = 64,
+		.family_id = ST7920_FAMILY,
+	}
+};
+EXPORT_SYMBOL_NS_GPL(st7920_variants, DRM_ST7920);
+
+struct st7920_plane_state {
+	struct drm_shadow_plane_state base;
+	/* Intermediate buffer to convert pixels from XRGB8888 to HW format */
+	u8 *buffer;
+};
+
+struct st7920_crtc_state {
+	struct drm_crtc_state base;
+	/* Buffer to store pixels in HW format and written to the panel */
+	u8 *data_array;
+};
+
+static inline struct st7920_plane_state *to_st7920_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct st7920_plane_state, base.base);
+}
+
+static inline struct st7920_crtc_state *to_st7920_crtc_state(struct drm_crtc_state *state)
+{
+	return container_of(state, struct st7920_crtc_state, base);
+}
+
+static inline struct st7920_device *drm_to_st7920(struct drm_device *drm)
+{
+	return container_of(drm, struct st7920_device, drm);
+}
+
+static int st7920_spi_write(struct spi_device *spi, int cmd, const void *data, size_t size)
+{
+	u8 reg[CMD_SIZE] = {0};
+	int i = 0, j = 0;
+	int ret;
+
+	/*
+	 * First the sync bits are sent: 11111WS0.
+	 * Where W is the read/write (RW) bit and S is the register/data (RS) bit.
+	 * Then, every 8 bits instruction/data will be separated into 2 groups.
+	 * Higher 4 bits (DB7~DB4) will be placed in the first section followed by
+	 * 4 '0's. And lower 4 bits (DB3~DB0) will be placed in the second section
+	 * followed by 4 '0's.
+	 */
+	if (cmd == SET_GDRAM_ADDRESS) {
+		const u8 y_addr = *(const u8 *)data;
+		bool bottom_screen = (y_addr >= 32);
+
+		reg[i++] = SYNC_BITS;
+		/* Set vertical address */
+		if (!bottom_screen)
+			reg[i++] = TOP_VERTICAL_ADDRESS + (*(uint8_t *)data & HIGH_DATA_MASK);
+		else
+			reg[i++] = BOTTOM_VERTICAL_ADDRESS + (*(uint8_t *)data & HIGH_DATA_MASK);
+
+		reg[i++] = *(uint8_t *)data << 4;
+		/* Set horizontal address */
+		reg[i++] = SET_GDRAM_ADDRESS;
+		if (!bottom_screen)
+			reg[i++] = TOP_HORIZONTAL_ADDRESS;
+		else
+			reg[i++] = BOTTOM_HORIZONTAL_ADDRESS;
+	} else if (cmd == SET_GDRAM_DATA) {
+		const u8 *line_data = data;
+
+		reg[i++] = SYNC_BITS | RS_HIGH;
+
+		for (j = 0; j < 16; j++) {
+			reg[i++] = line_data[j] & 0xF0;
+			reg[i++] = (line_data[j] << 4) & 0xF0;
+		}
+	} else {
+		reg[i++] = SYNC_BITS;
+		reg[i++] = cmd & HIGH_DATA_MASK;
+		reg[i++] = (cmd & LOW_DATA_MASK) << 4;
+	}
+
+	ret = spi_write(spi, reg, i);
+
+	return ret;
+}
+
+static const struct regmap_config st7920_spi_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const struct of_device_id st7920_of_match[] = {
+	/* st7920 family */
+	{
+		.compatible = "sitronix,st7920",
+		.data = &st7920_variants[ST7920_ID],
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, st7920_of_match);
+
+/*
+ * The SPI core always reports a MODALIAS uevent of the form "spi:<dev>", even
+ * if the device was registered via OF. This means that the module will not be
+ * auto loaded, unless it contains an alias that matches the MODALIAS reported.
+ *
+ * To workaround this issue, add a SPI device ID table. Even when this should
+ * not be needed for this driver to match the registered SPI devices.
+ */
+static const struct spi_device_id st7920_spi_id[] = {
+	/* st7920 family */
+	{ "st7920",  ST7920_ID },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, st7920_spi_id);
+
+static int st7920_power_on(struct st7920_device *st7920)
+{
+	int ret;
+
+	ret = st7920_spi_write(st7920->spi, SET_DISPLAY_ON, NULL, 0);
+	if (ret < 0)
+		return ret;
+	udelay(72);
+
+	return ret;
+}
+
+static int st7920_power_off(struct st7920_device *st7920)
+{
+	int ret;
+
+	ret = st7920_spi_write(st7920->spi, SET_DISPLAY_CLEAR, NULL, 0);
+	udelay(1600);
+	ret = st7920_spi_write(st7920->spi, SET_DISPLAY_OFF, NULL, 0);
+	udelay(72);
+
+	return ret;
+}
+
+static int st7920_init(struct st7920_device *st7920)
+{
+	int ret;
+
+	ret = st7920_spi_write(st7920->spi, SET_BASIC_INSTRUCTION_SET, NULL, 0);
+	if (ret < 0)
+		return ret;
+	udelay(72);
+
+	ret = st7920_power_on(st7920);
+	if (ret < 0)
+		return ret;
+
+	ret = st7920_spi_write(st7920->spi, SET_GRAPHICS_DISPLAY, NULL, 0);
+	if (ret < 0)
+		return ret;
+	udelay(72);
+
+	ret = st7920_spi_write(st7920->spi, SET_DISPLAY_CLEAR, NULL, 0);
+	if (ret < 0)
+		return ret;
+	udelay(1600);
+
+	return 0;
+}
+
+static int st7920_update_rect(struct st7920_device *st7920,
+			       struct drm_rect *rect, u8 *buf,
+			       u8 *data_array)
+{
+	u32 array_idx = 0;
+	int i, j;
+	int ret;
+
+	/*
+	 * The screen is divided in 64(Y)x8(X) segments and each segment is
+	 * further divided in 2 bytes (D15~D0).
+	 *
+	 * Segment 0x0 is in the top-right corner, while segment 63x15 is in the
+	 * bottom-left. They would be displayed in the screen in the following way:
+	 * 0x0  0x1  0x2  ... 0x15
+	 * 1x0  1x1  1x2  ... 1x15
+	 * ...
+	 * 63x0 63x1 63x2 ... 63x15
+	 *
+	 * The data in each byte is big endian.
+	 */
+
+	for (i = 0; i < HEIGHT_IN_PIXELS; i++) {
+		u8 *line_start = buf + (i * WIDTH_BYTES);
+		u8 line_buffer[WIDTH_BYTES];
+
+		for (j = 0; j < WIDTH_BYTES; j++) {
+			line_buffer[j] = bitrev8(line_start[j]);
+			data_array[array_idx++] = line_buffer[j];
+		}
+
+		ret = st7920_spi_write(st7920->spi, SET_GDRAM_ADDRESS, &i, 1);
+		if (ret < 0)
+			return ret;
+		udelay(72);
+
+		ret = st7920_spi_write(st7920->spi, SET_GDRAM_DATA, line_buffer, WIDTH_BYTES);
+		if (ret < 0)
+			return ret;
+		udelay(72);
+	}
+
+	return ret;
+}
+
+static void st7920_clear_screen(struct st7920_device *st7920, u8 *data_array)
+{
+	memset(data_array, 0, BYTES_IN_DISPLAY);
+
+	st7920_spi_write(st7920->spi, SET_DISPLAY_CLEAR, NULL, 0);
+	udelay(1600);
+}
+
+static int st7920_fb_blit_rect(struct drm_framebuffer *fb,
+				const struct iosys_map *vmap,
+				struct drm_rect *rect,
+				u8 *buf, u8 *data_array,
+				struct drm_format_conv_state *fmtcnv_state)
+{
+	struct st7920_device *st7920 = drm_to_st7920(fb->dev);
+	struct iosys_map dst;
+	unsigned int dst_pitch;
+	int ret = 0;
+
+	/* Align y to display page boundaries */
+	rect->y1 = round_down(rect->y1, PIXELS_IN_SEGMENT);
+	rect->y2 = min_t(unsigned int, round_up(rect->y2, PIXELS_IN_SEGMENT), st7920->height);
+
+	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
+
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	iosys_map_set_vaddr(&dst, buf);
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
+	st7920_update_rect(st7920, rect, buf, data_array);
+
+	return ret;
+}
+
+static int st7920_primary_plane_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct st7920_device *st7920 = drm_to_st7920(drm);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct st7920_plane_state *st7920_state = to_st7920_plane_state(plane_state);
+	struct drm_shadow_plane_state *shadow_plane_state = &st7920_state->base;
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+	const struct drm_format_info *fi;
+	unsigned int pitch;
+	int ret;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+	else if (!plane_state->visible)
+		return 0;
+
+	fi = drm_format_info(DRM_FORMAT_R1);
+	if (!fi)
+		return -EINVAL;
+
+	pitch = drm_format_info_min_pitch(fi, 0, st7920->width);
+
+	if (plane_state->fb->format != fi) {
+		void *buf;
+
+		/* format conversion necessary; reserve buffer */
+		buf = drm_format_conv_state_reserve(&shadow_plane_state->fmtcnv_state,
+						    pitch, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+
+	st7920_state->buffer = kcalloc(pitch, st7920->height, GFP_KERNEL);
+	if (!st7920_state->buffer)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void st7920_primary_plane_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	struct st7920_crtc_state *st7920_crtc_state =  to_st7920_crtc_state(crtc_state);
+	struct st7920_plane_state *st7920_plane_state = to_st7920_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_device *drm = plane->dev;
+	struct drm_rect dst_clip;
+	struct drm_rect damage;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		dst_clip = plane_state->dst;
+
+		if (!drm_rect_intersect(&dst_clip, &damage))
+			continue;
+
+		st7920_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
+				     st7920_plane_state->buffer,
+				     st7920_crtc_state->data_array,
+				     &shadow_plane_state->fmtcnv_state);
+	}
+
+	drm_dev_exit(idx);
+}
+
+static void st7920_primary_plane_atomic_disable(struct drm_plane *plane,
+						 struct drm_atomic_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct st7920_device *st7920 = drm_to_st7920(drm);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *crtc_state;
+	struct st7920_crtc_state *st7920_crtc_state;
+	int idx;
+
+	if (!plane_state->crtc)
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	st7920_crtc_state = to_st7920_crtc_state(crtc_state);
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	st7920_clear_screen(st7920, st7920_crtc_state->data_array);
+
+	drm_dev_exit(idx);
+}
+
+/* Called during init to allocate the plane's atomic state. */
+static void st7920_primary_plane_reset(struct drm_plane *plane)
+{
+	struct st7920_plane_state *st7920_state;
+
+	WARN_ON(plane->state);
+
+	st7920_state = kzalloc(sizeof(*st7920_state), GFP_KERNEL);
+	if (!st7920_state)
+		return;
+
+	__drm_gem_reset_shadow_plane(plane, &st7920_state->base);
+}
+
+static struct drm_plane_state *st7920_primary_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct drm_shadow_plane_state *new_shadow_plane_state;
+	struct st7920_plane_state *old_st7920_state;
+	struct st7920_plane_state *st7920_state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	old_st7920_state = to_st7920_plane_state(plane->state);
+	st7920_state = kmemdup(old_st7920_state, sizeof(*st7920_state), GFP_KERNEL);
+	if (!st7920_state)
+		return NULL;
+
+	/* The buffer is not duplicated and is allocated in .atomic_check */
+	st7920_state->buffer = NULL;
+
+	new_shadow_plane_state = &st7920_state->base;
+
+	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
+
+	return &new_shadow_plane_state->base;
+}
+
+static void st7920_primary_plane_destroy_state(struct drm_plane *plane,
+						struct drm_plane_state *state)
+{
+	struct st7920_plane_state *st7920_state = to_st7920_plane_state(state);
+
+	kfree(st7920_state->buffer);
+
+	__drm_gem_destroy_shadow_plane_state(&st7920_state->base);
+
+	kfree(st7920_state);
+}
+
+static const struct drm_plane_helper_funcs st7920_primary_plane_helper_funcs[] = {
+	[ST7920_FAMILY] = {
+		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+		.atomic_check = st7920_primary_plane_atomic_check,
+		.atomic_update = st7920_primary_plane_atomic_update,
+		.atomic_disable = st7920_primary_plane_atomic_disable,
+	}
+};
+
+static const struct drm_plane_funcs st7920_primary_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.reset = st7920_primary_plane_reset,
+	.atomic_duplicate_state = st7920_primary_plane_duplicate_state,
+	.atomic_destroy_state = st7920_primary_plane_destroy_state,
+	.destroy = drm_plane_cleanup,
+};
+
+static enum drm_mode_status st7920_crtc_mode_valid(struct drm_crtc *crtc,
+						    const struct drm_display_mode *mode)
+{
+	struct st7920_device *st7920 = drm_to_st7920(crtc->dev);
+
+	if (mode->hdisplay != st7920->mode.hdisplay &&
+	    mode->vdisplay != st7920->mode.vdisplay)
+		return MODE_ONE_SIZE;
+	else if (mode->hdisplay != st7920->mode.hdisplay)
+		return MODE_ONE_WIDTH;
+	else if (mode->vdisplay != st7920->mode.vdisplay)
+		return MODE_ONE_HEIGHT;
+
+	return MODE_OK;
+}
+
+static int st7920_crtc_atomic_check(struct drm_crtc *crtc,
+				     struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct st7920_crtc_state *st7920_state = to_st7920_crtc_state(crtc_state);
+	int ret;
+
+	ret = drm_crtc_helper_atomic_check(crtc, state);
+	if (ret)
+		return ret;
+
+	st7920_state->data_array = kmalloc(BYTES_IN_DISPLAY, GFP_KERNEL);
+	if (!st7920_state->data_array)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/* Called during init to allocate the CRTC's atomic state. */
+static void st7920_crtc_reset(struct drm_crtc *crtc)
+{
+	struct st7920_crtc_state *st7920_state;
+
+	WARN_ON(crtc->state);
+
+	st7920_state = kzalloc(sizeof(*st7920_state), GFP_KERNEL);
+	if (!st7920_state)
+		return;
+
+	__drm_atomic_helper_crtc_reset(crtc, &st7920_state->base);
+}
+
+static struct drm_crtc_state *st7920_crtc_duplicate_state(struct drm_crtc *crtc)
+{
+	struct st7920_crtc_state *old_st7920_state;
+	struct st7920_crtc_state *st7920_state;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	old_st7920_state = to_st7920_crtc_state(crtc->state);
+	st7920_state = kmemdup(old_st7920_state, sizeof(*st7920_state), GFP_KERNEL);
+	if (!st7920_state)
+		return NULL;
+
+	/* The buffer is not duplicated and is allocated in .atomic_check */
+	st7920_state->data_array = NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &st7920_state->base);
+
+	return &st7920_state->base;
+}
+
+static void st7920_crtc_destroy_state(struct drm_crtc *crtc,
+						struct drm_crtc_state *state)
+{
+	struct st7920_crtc_state *st7920_state = to_st7920_crtc_state(state);
+
+	kfree(st7920_state->data_array);
+
+	__drm_atomic_helper_crtc_destroy_state(state);
+
+	kfree(st7920_state);
+}
+
+/*
+ * The CRTC is always enabled. Screen updates are performed by
+ * the primary plane's atomic_update function. Disabling clears
+ * the screen in the primary plane's atomic_disable function.
+ */
+static const struct drm_crtc_helper_funcs st7920_crtc_helper_funcs[] = {
+	[ST7920_FAMILY] = {
+		.mode_valid = st7920_crtc_mode_valid,
+		.atomic_check = st7920_crtc_atomic_check,
+	}
+};
+
+static const struct drm_crtc_funcs st7920_crtc_funcs = {
+	.reset = st7920_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = st7920_crtc_duplicate_state,
+	.atomic_destroy_state = st7920_crtc_destroy_state,
+};
+
+static void st7920_encoder_atomic_enable(struct drm_encoder *encoder,
+						struct drm_atomic_state *state)
+{
+	struct drm_device *drm = encoder->dev;
+	struct st7920_device *st7920 = drm_to_st7920(drm);
+	int ret;
+
+	ret = st7920_init(st7920);
+	if (ret)
+		goto power_off;
+
+	return;
+
+power_off:
+	st7920_power_off(st7920);
+}
+
+static void st7920_encoder_atomic_disable(struct drm_encoder *encoder,
+					struct drm_atomic_state *state)
+{
+	struct drm_device *drm = encoder->dev;
+	struct st7920_device *st7920 = drm_to_st7920(drm);
+
+	st7920_power_off(st7920);
+}
+
+static const struct drm_encoder_helper_funcs st7920_encoder_helper_funcs[] = {
+	[ST7920_FAMILY] = {
+		.atomic_enable = st7920_encoder_atomic_enable,
+		.atomic_disable = st7920_encoder_atomic_disable,
+	}
+};
+
+static const struct drm_encoder_funcs st7920_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static int st7920_connector_get_modes(struct drm_connector *connector)
+{
+	struct st7920_device *st7920 = drm_to_st7920(connector->dev);
+	struct drm_display_mode *mode;
+	struct device *dev = st7920->dev;
+
+	mode = drm_mode_duplicate(connector->dev, &st7920->mode);
+	if (!mode) {
+		dev_err(dev, "Failed to duplicated mode\n");
+		return 0;
+	}
+
+	drm_mode_probed_add(connector, mode);
+	drm_set_preferred_mode(connector, mode->hdisplay, mode->vdisplay);
+
+	/* There is only a single mode */
+	return 1;
+}
+
+static const struct drm_connector_helper_funcs st7920_connector_helper_funcs = {
+	.get_modes = st7920_connector_get_modes,
+};
+
+static const struct drm_connector_funcs st7920_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_mode_config_funcs st7920_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const uint32_t st7920_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+DEFINE_DRM_GEM_FOPS(st7920_fops);
+
+static const struct drm_driver st7920_drm_driver = {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.date			= DRIVER_DATE,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
+	.fops			= &st7920_fops,
+};
+
+static int st7920_init_modeset(struct st7920_device *st7920)
+{
+	enum st7920_family_ids family_id = st7920->device_info->family_id;
+	struct drm_display_mode *mode = &st7920->mode;
+	struct device *dev = st7920->dev;
+	struct drm_device *drm = &st7920->drm;
+	unsigned long max_width, max_height;
+	struct drm_plane *primary_plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+	int ret;
+
+	/*
+	 * Modesetting
+	 */
+
+	ret = drmm_mode_config_init(drm);
+	if (ret) {
+		dev_err(dev, "DRM mode config init failed: %d\n", ret);
+		return ret;
+	}
+
+	mode->type = DRM_MODE_TYPE_DRIVER;
+	mode->clock = 1;
+	mode->hdisplay = mode->htotal = st7920->device_info->default_width;
+	mode->hsync_start = mode->hsync_end = st7920->device_info->default_width;
+	mode->vdisplay = mode->vtotal = st7920->device_info->default_height;
+	mode->vsync_start = mode->vsync_end = st7920->device_info->default_height;
+	mode->width_mm = 27;
+	mode->height_mm = 27;
+
+	max_width = max_t(unsigned long, mode->hdisplay, DRM_SHADOW_PLANE_MAX_WIDTH);
+	max_height = max_t(unsigned long, mode->vdisplay, DRM_SHADOW_PLANE_MAX_HEIGHT);
+
+	drm->mode_config.min_width = mode->hdisplay;
+	drm->mode_config.max_width = max_width;
+	drm->mode_config.min_height = mode->vdisplay;
+	drm->mode_config.max_height = max_height;
+	drm->mode_config.preferred_depth = 24;
+	drm->mode_config.funcs = &st7920_mode_config_funcs;
+
+	/* Primary plane */
+
+	primary_plane = &st7920->primary_plane;
+	ret = drm_universal_plane_init(drm, primary_plane, 0, &st7920_primary_plane_funcs,
+				    st7920_formats, ARRAY_SIZE(st7920_formats),
+				    NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		dev_err(dev, "DRM primary plane init failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_plane_helper_add(primary_plane, &st7920_primary_plane_helper_funcs[family_id]);
+
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	/* CRTC */
+
+	crtc = &st7920->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
+					&st7920_crtc_funcs, NULL);
+	if (ret) {
+		dev_err(dev, "DRM crtc init failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &st7920_crtc_helper_funcs[family_id]);
+
+	/* Encoder */
+
+	encoder = &st7920->encoder;
+	ret = drm_encoder_init(drm, encoder, &st7920_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret) {
+		dev_err(dev, "DRM encoder init failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_encoder_helper_add(encoder, &st7920_encoder_helper_funcs[family_id]);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	/* Connector */
+
+	connector = &st7920->connector;
+	ret = drm_connector_init(drm, connector, &st7920_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret) {
+		dev_err(dev, "DRM connector init failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_connector_helper_add(connector, &st7920_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		dev_err(dev, "DRM attach connector to encoder failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_mode_config_reset(drm);
+
+	return 0;
+}
+
+static int st7920_probe(struct spi_device *spi)
+{
+	struct st7920_device *st7920;
+	struct regmap *regmap;
+	struct device *dev = &spi->dev;
+	struct drm_device *drm;
+	int ret;
+
+	regmap = devm_regmap_init_spi(spi, &st7920_spi_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	st7920 = devm_drm_dev_alloc(dev, &st7920_drm_driver,
+				    struct st7920_device, drm);
+	if (IS_ERR(st7920))
+		return dev_err_probe(dev, PTR_ERR(st7920),
+							 "Failed to allocate DRM device\n");
+
+	drm = &st7920->drm;
+
+	st7920->dev = dev;
+	st7920->regmap = regmap;
+	st7920->spi = spi;
+	st7920->device_info = device_get_match_data(dev);
+	st7920->width = st7920->device_info->default_width;
+	st7920->height = st7920->device_info->default_height;
+
+	ret = st7920_init_modeset(st7920);
+	if (ret)
+		return ret;
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "DRM device register failed\n");
+
+	drm_client_setup(drm, NULL);
+
+	spi_set_drvdata(spi, st7920);
+
+	st7920_init(st7920);
+
+	return 0;
+}
+
+static void st7920_remove(struct spi_device *spi)
+{
+	struct st7920_device *st7920 = spi_get_drvdata(spi);
+
+	drm_dev_unplug(&st7920->drm);
+	drm_atomic_helper_shutdown(&st7920->drm);
+}
+
+static void st7920_shutdown(struct spi_device *spi)
+{
+	struct st7920_device *st7920 = spi_get_drvdata(spi);
+
+	drm_atomic_helper_shutdown(&st7920->drm);
+}
+
+static struct spi_driver st7920_spi_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = st7920_of_match,
+	},
+	.id_table = st7920_spi_id,
+	.probe = st7920_probe,
+	.remove = st7920_remove,
+	.shutdown = st7920_shutdown,
+};
+module_spi_driver(st7920_spi_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Iker Pedrosa <ipedrosam@gmail.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sitronix/st7920.h b/drivers/gpu/drm/sitronix/st7920.h
new file mode 100644
index 0000000000000000000000000000000000000000..83032baa7e82c2718deeb943fc564cc132c416a3
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/st7920.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Header file for:
+ * DRM driver for Sitronix ST7920 LCD displays
+ *
+ * Copyright 2025 Iker Pedrosa <ikerpedrosam@gmail.com>
+ *
+ * Based on drivers/video/fbdev/ssd130x.c
+ * Copyright 2022 Red Hat Inc.
+ */
+
+#ifndef __ST7920_H__
+#define __ST7920_H__
+
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
+
+enum st7920_family_ids {
+	ST7920_FAMILY
+};
+
+enum st7920_variants {
+	/* st7920 family */
+	ST7920_ID
+};
+
+struct st7920_deviceinfo {
+	u32 default_dclk_div;
+	u32 default_dclk_frq;
+	u32 default_width;
+	u32 default_height;
+
+	enum st7920_family_ids family_id;
+};
+
+struct st7920_device {
+	struct drm_device drm;
+	struct device *dev;
+	struct drm_display_mode mode;
+	struct drm_plane primary_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	struct spi_device *spi;
+
+	struct regmap *regmap;
+
+	const struct st7920_deviceinfo *device_info;
+
+	u32 height;
+	u32 width;
+};
+
+#endif /* __ST7920_H__ */

-- 
2.50.1

