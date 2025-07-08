Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47770AFC85D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 12:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB92110E5DF;
	Tue,  8 Jul 2025 10:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A/0tZEcB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8943910E1AA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 10:06:57 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b3182c6d03bso4768187a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 03:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751969217; x=1752574017; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t4A+fUpCBh4aNcednHgSYX2CdV8vkDyDHq3RKq2iRXk=;
 b=A/0tZEcBDZj776C4e5n7LGkE9Dtwd7HyJwDLYDEI8pl3QVw6oUY2OfVcpKRJjUCDaL
 UnpM/G582+hmjNQXnAmHGlWsnCkOafBTSvMeLzh7u/FvZPk2xjM0VoCPwV49ZpuqaHrl
 0CvO5rt+JOBfoV0MA0sRfcuvHpBsFdyA2OOexdk0huv7ZlWihHAkCH6zAXaB8Rp+0sKH
 37IsLhiVi359+yxov0uidRi75YSOJcseTmIABPgF23sMw1BJc4oPVNjJKaWXUInubh7g
 9vfDr5424+DLyw3b+4w59vOH8E4tjeayTE3POJau0d/Toazgd2xEBTUeOa/3zPzYEQE4
 Nd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751969217; x=1752574017;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t4A+fUpCBh4aNcednHgSYX2CdV8vkDyDHq3RKq2iRXk=;
 b=Yz65IM8ZxepTVOVGhOot0fHIUa9kMBT5357fBEgMeLgrR5IgvNAROc5Fe0zDstgghQ
 oK7qyEKYCAmyrYa7nHBPOnzlFeIwiTm4hPVJ9TgwY1ga2fAE+0/q+/M/1476tUPyQx+G
 zhLnhPRkYGKG9vnnnbLATmwdpANRYxovC4uu9lE3WT6l2uBl8TGm2EhoWg1XTwJTfAP5
 IgAubjU+Hb4E6AXJQtar5zu7llZj6YxDxU8kExetnJ3lNEd4mtF+9Rm1DAi124raGAeD
 ILOiqJefzMrr3dp2xBVyBHDLjO6xBCb8tAEK2Xezu4eA5Ld2kpqNeRutu4XRwW9X8CvE
 lc9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCURkLH9ssllLBSfeVN9NgjvHiXVFOspDhFau/6ZO80wE7H8nXLIAWGr3wengv9YPXb5rAld8mXbBPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ5dpdV0SCRpFXa0cGVw6czuTQdxhrtzuyTLMTJeU2ZMQX8yEu
 wfjNJQW2aua6rSlSBxmiaCKaiVlp5/UMwPrgMwfCPmPwpqNvxXXZqlZK
X-Gm-Gg: ASbGncvTN21bXHsFeIfgL5QUCO0q9OLNUQdRwukj1od8tdb9m1Yyb5g/S0HL/ierGLz
 9Ewrth3Zn5c1n8lQPzjVvBhGKRMp2sQ8d6UONsWXiTId6yZ9rPgGwMNfFRfj5dTpjtEWPDX/iYp
 t59ob73wKLE2kV8PK4E0X3szRA3L2/EYYt2IWXK++l3BqTqkIE99g3vSmJGRRoBX2nxwMPSpvOF
 XewvFu2r2XTHce21eb8Czeymx7UasQZFAjbPCCyU3N0NdUV4q4l40/MiDravJEKbh58CI6k6oPO
 7HrvI+zVIrfxqMuo2C5qye/57U6QuaanHqxF87FOu4WeGXCw4Co8PMpF18J5i09SmUvTUItr3BF
 AAZjItunNG01PCyelz/xkDL9Q+Q==
X-Google-Smtp-Source: AGHT+IE2CgRhSntoGAEhNQyf1ss8GaeoW7iSTQxaSCYzh8yKO1lNUCgUgu22J7FcKTn/GnNqE/REfQ==
X-Received: by 2002:a05:6a20:7fa2:b0:223:cdb7:e6fb with SMTP id
 adf61e73a8af0-22b440b6251mr4371443637.29.1751969216772; 
 Tue, 08 Jul 2025 03:06:56 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359ecd6sm11971174b3a.24.2025.07.08.03.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 03:06:55 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 08 Jul 2025 18:06:45 +0800
Subject: [PATCH 2/3] drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-drm-v1-2-45055fdadc8a@gmail.com>
References: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
In-Reply-To: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969205; l=26521;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=15UFwH+2NTmPTLalGT4s6sfrjB31rH26gzQlBDcqDbs=;
 b=FreRCSG7axoFJALqjNe/6Trm1StUPMgvY4w2pjErAMov9wv+K5eVpbQGkhBQnC7kiPCinB4pJ
 I4Amc0C5CXnCAciDlvjCyfr5cybC6YNnGWtOO7soL4WRmyLyNv6Re8G
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Tue, 08 Jul 2025 10:27:43 +0000
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

Introduce a DRM driver for the Mayqueen Pixpaper e-ink display panel,
which is controlled via SPI. The driver supports a 122x250 resolution
display with XRGB8888 format.

Also, add a MAINTAINERS entry for the Pixpaper driver.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 MAINTAINERS                     |   6 +
 drivers/gpu/drm/tiny/Kconfig    |  15 +
 drivers/gpu/drm/tiny/Makefile   |   1 +
 drivers/gpu/drm/tiny/pixpaper.c | 784 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 806 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fad6cb025a1918beec113b576cf28b76151745ef..0613f32ef8a702e508c9a2e51853f8fe6a38ba42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7756,6 +7756,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/repaper.txt
 F:	drivers/gpu/drm/tiny/repaper.c
 
+DRM DRIVER FOR PIXPAPER E-INK PANEL
+M:	LiangCheng Wang <zaq14760@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
+F:	drivers/gpu/drm/tiny/pixpaper.c
+
 DRM DRIVER FOR QEMU'S CIRRUS DEVICE
 M:	Dave Airlie <airlied@redhat.com>
 M:	Gerd Hoffmann <kraxel@redhat.com>
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 06e54694a7f2fe1649e1886f039926b24f698e0d..f9b814e87348cad1946dd5e2ff54d304100ef264 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -164,6 +164,21 @@ config TINYDRM_MI0283QT
 	  DRM driver for the Multi-Inno MI0283QT display panel
 	  If M is selected the module will be called mi0283qt.
 
+config TINYDRM_PIXPAPER
+	tristate "DRM support for PIXPAPER display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	help
+	  DRM driver for the Mayqueen Pixpaper e-ink display panel.
+
+	  This driver supports small e-paper displays connected over SPI,
+	  with a resolution of 122x250 and XRGB8888 framebuffer format.
+	  It is intended for low-power embedded applications.
+
+	  If M is selected, the module will be built as pixpaper.ko.
+
 config TINYDRM_REPAPER
 	tristate "DRM support for Pervasive Displays RePaper panels (V231)"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 4a9ff61ec25420e2c0a648c04eaab7ca25dd5407..40d613b57f5ee990dbf170d69939a39546be21b7 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -12,5 +12,6 @@ obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
 obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
 obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
+obj-$(CONFIG_TINYDRM_PIXPAPER)		+= pixpaper.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
new file mode 100644
index 0000000000000000000000000000000000000000..14768144997205319215784fa3c3a904fed8d1e1
--- /dev/null
+++ b/drivers/gpu/drm/tiny/pixpaper.c
@@ -0,0 +1,784 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DRM driver for PIXPAPER e-ink panel
+ *
+ * Author: LiangCheng Wang <zaq14760@gmail.com>,
+ */
+#include <drm/clients/drm_client_setup.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+
+MODULE_IMPORT_NS("DMA_BUF");
+
+#define PIXPAPER_WIDTH 122
+#define PIXPAPER_HEIGHT 250
+
+#define PANEL_BUFFER_WIDTH 128
+#define PANEL_BUFFER_TWO_BYTES_PER_ROW (PANEL_BUFFER_WIDTH / 4)
+
+#define PIXPAPER_SPI_SPEED_DEFAULT 1000000
+
+#define PIXPAPER_CMD_PANEL_SETTING 0x00
+#define PIXPAPER_CMD_POWER_SETTING 0x01
+#define PIXPAPER_CMD_POWER_OFF 0x02
+#define PIXPAPER_CMD_POWER_OFF_SEQUENCE 0x03
+#define PIXPAPER_CMD_POWER_ON 0x04
+#define PIXPAPER_CMD_BOOSTER_SOFT_START 0x06
+#define PIXPAPER_CMD_DEEP_SLEEP 0x07
+#define PIXPAPER_CMD_DATA_START_TRANSMISSION 0x10
+#define PIXPAPER_CMD_DISPLAY_REFRESH 0x12
+#define PIXPAPER_CMD_PLL_CONTROL 0x30
+#define PIXPAPER_CMD_TEMP_SENSOR_CALIB 0x41
+#define PIXPAPER_CMD_UNKNOWN_4D 0x4D
+#define PIXPAPER_CMD_VCOM_INTERVAL 0x50
+#define PIXPAPER_CMD_TCON_SETTING 0x60
+#define PIXPAPER_CMD_RESOLUTION_SETTING 0x61
+#define PIXPAPER_CMD_GATE_SOURCE_START 0x65
+#define PIXPAPER_CMD_UNKNOWN_B4 0xB4
+#define PIXPAPER_CMD_UNKNOWN_B5 0xB5
+#define PIXPAPER_CMD_CASCADE_SETTING 0xE0
+#define PIXPAPER_CMD_POWER_SAVING 0xE3
+#define PIXPAPER_CMD_AUTO_MEASURE_VCOM 0xE7
+#define PIXPAPER_CMD_UNKNOWN_E9 0xE9
+
+static int pixpaper_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_state *state);
+static int pixpaper_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_state *state);
+static void pixpaper_crtc_atomic_enable(struct drm_crtc *crtc,
+					struct drm_atomic_state *state);
+static void pixpaper_crtc_atomic_disable(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state);
+static void pixpaper_plane_atomic_update(struct drm_plane *plane,
+					 struct drm_atomic_state *state);
+static int pixpaper_connector_get_modes(struct drm_connector *connector);
+
+struct pixpaper_panel {
+	struct drm_device drm;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+
+	struct spi_device *spi;
+	struct gpio_desc *reset;
+	struct gpio_desc *busy;
+	struct gpio_desc *dc;
+};
+
+static const struct drm_plane_funcs pixpaper_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	.reset = drm_atomic_helper_plane_reset,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static const struct drm_plane_helper_funcs pixpaper_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = pixpaper_plane_helper_atomic_check,
+	.atomic_update = pixpaper_plane_atomic_update,
+};
+
+static const struct drm_crtc_funcs pixpaper_crtc_funcs = {
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.reset = drm_atomic_helper_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_crtc_helper_funcs pixpaper_crtc_helper_funcs = {
+	.atomic_check = pixpaper_crtc_helper_atomic_check,
+	.atomic_enable = pixpaper_crtc_atomic_enable,
+	.atomic_disable = pixpaper_crtc_atomic_disable,
+};
+
+static const struct drm_encoder_funcs pixpaper_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct drm_connector_funcs pixpaper_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_helper_funcs pixpaper_connector_helper_funcs = {
+	.get_modes = pixpaper_connector_get_modes,
+};
+
+static int pixpaper_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+	int ret;
+
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+	else if (!new_plane_state->visible)
+		return 0;
+
+	return 0;
+}
+
+static int pixpaper_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	if (!crtc_state->enable)
+		return 0;
+
+	return drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+}
+
+static void pixpaper_wait_busy(struct pixpaper_panel *panel)
+{
+	unsigned int delay_us = 1000;
+
+	usleep_range(delay_us, delay_us + 500);
+	while (true)
+		if (gpiod_get_value_cansleep(panel->busy) == 1)
+			break;
+}
+
+static int pixpaper_spi_sync(struct spi_device *spi, struct spi_message *msg)
+{
+	int ret;
+
+	ret = spi_sync(spi, msg);
+	if (ret < 0)
+		dev_err(&spi->dev, "SPI sync failed: %d\n", ret);
+
+	return ret;
+}
+
+static int pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd)
+{
+	struct spi_transfer xfer = {
+		.tx_buf = &cmd,
+		.len = 1,
+	};
+	struct spi_message msg;
+	int ret;
+
+	spi_message_init(&msg);
+	spi_message_add_tail(&xfer, &msg);
+
+	gpiod_set_value_cansleep(panel->dc, 0);
+	usleep_range(1, 5);
+	ret = pixpaper_spi_sync(panel->spi, &msg);
+
+	return ret;
+}
+
+static int pixpaper_send_data(struct pixpaper_panel *panel, u8 data)
+{
+	struct spi_transfer xfer = {
+		.tx_buf = &data,
+		.len = 1,
+	};
+	struct spi_message msg;
+	int ret;
+
+	spi_message_init(&msg);
+	spi_message_add_tail(&xfer, &msg);
+
+	gpiod_set_value_cansleep(panel->dc, 1);
+	usleep_range(1, 5);
+	ret = pixpaper_spi_sync(panel->spi, &msg);
+
+	return ret;
+}
+
+static int pixpaper_panel_hw_init(struct pixpaper_panel *panel)
+{
+	struct device *dev = &panel->spi->dev;
+	int ret = 0;
+
+	dev_info(dev, "%s: Starting hardware initialization\n", __func__);
+
+	gpiod_set_value_cansleep(panel->reset, 0);
+	msleep(50);
+	gpiod_set_value_cansleep(panel->reset, 1);
+	msleep(50);
+
+	pixpaper_wait_busy(panel);
+	dev_info(dev, "Hardware reset complete, panel idle.\n");
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_4D);
+	ret |= pixpaper_send_data(panel, 0x78);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_PANEL_SETTING);
+	ret |= pixpaper_send_data(panel, 0x0F);
+	ret |= pixpaper_send_data(panel, 0x09);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_SETTING);
+	ret |= pixpaper_send_data(panel, 0x07);
+	ret |= pixpaper_send_data(panel, 0x00);
+	ret |= pixpaper_send_data(panel, 0x22);
+	ret |= pixpaper_send_data(panel, 0x78);
+	ret |= pixpaper_send_data(panel, 0x0A);
+	ret |= pixpaper_send_data(panel, 0x22);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_OFF_SEQUENCE);
+	ret |= pixpaper_send_data(panel, 0x10);
+	ret |= pixpaper_send_data(panel, 0x54);
+	ret |= pixpaper_send_data(panel, 0x44);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_BOOSTER_SOFT_START);
+	ret |= pixpaper_send_data(panel, 0x0F);
+	ret |= pixpaper_send_data(panel, 0x0A);
+	ret |= pixpaper_send_data(panel, 0x2F);
+	ret |= pixpaper_send_data(panel, 0x25);
+	ret |= pixpaper_send_data(panel, 0x22);
+	ret |= pixpaper_send_data(panel, 0x2E);
+	ret |= pixpaper_send_data(panel, 0x21);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_PLL_CONTROL);
+	ret |= pixpaper_send_data(panel, 0x02);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_TEMP_SENSOR_CALIB);
+	ret |= pixpaper_send_data(panel, 0x00);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_VCOM_INTERVAL);
+	ret |= pixpaper_send_data(panel, 0x37);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_TCON_SETTING);
+	ret |= pixpaper_send_data(panel, 0x02);
+	ret |= pixpaper_send_data(panel, 0x02);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_RESOLUTION_SETTING);
+	ret |= pixpaper_send_data(panel, 0x00);
+	ret |= pixpaper_send_data(panel, 0x80);
+	ret |= pixpaper_send_data(panel, 0x00);
+	ret |= pixpaper_send_data(panel, 0xFA);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_GATE_SOURCE_START);
+	ret |= pixpaper_send_data(panel, 0x00);
+	ret |= pixpaper_send_data(panel, 0x00);
+	ret |= pixpaper_send_data(panel, 0x00);
+	ret |= pixpaper_send_data(panel, 0x00);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_AUTO_MEASURE_VCOM);
+	ret |= pixpaper_send_data(panel, 0x1C);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_SAVING);
+	ret |= pixpaper_send_data(panel, 0x22);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_CASCADE_SETTING);
+	ret |= pixpaper_send_data(panel, 0x00);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_B4);
+	ret |= pixpaper_send_data(panel, 0xD0);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_B5);
+	ret |= pixpaper_send_data(panel, 0x03);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	ret |= pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_E9);
+	ret |= pixpaper_send_data(panel, 0x01);
+	if (ret)
+		goto init_fail;
+	pixpaper_wait_busy(panel);
+
+	dev_info(dev, "%s: Hardware initialization successful\n", __func__);
+	return 0;
+
+init_fail:
+	dev_err(dev, "%s: Hardware initialization failed (err=%d)\n", __func__,
+		ret);
+	return ret;
+}
+
+static void pixpaper_crtc_atomic_enable(struct drm_crtc *crtc,
+					struct drm_atomic_state *state)
+{
+	struct pixpaper_panel *panel =
+		container_of(crtc, struct pixpaper_panel, crtc);
+	struct drm_device *drm = &panel->drm;
+	int ret;
+
+	dev_info(drm->dev, "%s: Enabling pipe\n", __func__);
+
+	ret = pixpaper_panel_hw_init(panel);
+	if (ret) {
+		dev_err(drm->dev, "Panel HW Init failed during enable: %d\n",
+			ret);
+		return;
+	}
+
+	dev_info(drm->dev, "Sending Power ON (PON)\n");
+	ret = pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_ON);
+	if (ret) {
+		dev_err(drm->dev, "Failed to send PON command: %d\n", ret);
+		return;
+	}
+
+	usleep_range(10000, 11000);
+
+	pixpaper_wait_busy(panel);
+
+	dev_info(drm->dev, "Panel enabled and powered on\n");
+}
+
+static void pixpaper_crtc_atomic_disable(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state)
+{
+	struct pixpaper_panel *panel =
+		container_of(crtc, struct pixpaper_panel, crtc);
+	struct drm_device *drm = &panel->drm;
+	int ret;
+
+	dev_dbg(drm->dev, "%s: Disabling pipe\n", __func__);
+
+	ret = pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_OFF);
+	if (!ret) {
+		usleep_range(10000, 11000);
+		pixpaper_wait_busy(panel);
+	} else {
+		dev_warn(drm->dev, "Failed to send POF command: %d\n", ret);
+	}
+	dev_info(drm->dev, "Panel disabled\n");
+}
+
+static u8 pack_pixels_to_byte(u32 *src_pixels, int i, int j,
+			      struct drm_framebuffer *fb)
+{
+	u8 packed_byte = 0;
+	int k;
+
+	for (k = 0; k < 4; k++) {
+		int current_pixel_x = j * 4 + k;
+		u8 two_bit_val;
+
+		if (current_pixel_x < PIXPAPER_WIDTH) {
+			u32 pixel_offset =
+				(i * (fb->pitches[0] / 4)) + current_pixel_x;
+			u32 pixel = src_pixels[pixel_offset];
+			u32 r = (pixel >> 16) & 0xFF;
+			u32 g = (pixel >> 8) & 0xFF;
+			u32 b = pixel & 0xFF;
+			u32 gray_val =
+				(r * 299 + g * 587 + b * 114 + 500) / 1000;
+
+			if (gray_val < 64)
+				two_bit_val = 0b00;
+			else if (gray_val < 128)
+				two_bit_val = 0b01;
+			else if (gray_val < 192)
+				two_bit_val = 0b10;
+			else
+				two_bit_val = 0b11;
+		} else {
+			two_bit_val = 0b11;
+		}
+
+		packed_byte |= two_bit_val << ((3 - k) * 2);
+	}
+
+	return packed_byte;
+}
+
+static void pixpaper_plane_atomic_update(struct drm_plane *plane,
+					 struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state =
+		drm_atomic_get_new_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct pixpaper_panel *panel =
+		container_of(crtc, struct pixpaper_panel, crtc);
+
+	struct drm_device *drm = &panel->drm;
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct iosys_map map = shadow_plane_state->data[0];
+	void *vaddr = map.vaddr;
+	int i, j, ret = 0;
+	u32 *src_pixels = NULL;
+
+	dev_info(drm->dev, "Starting frame update (phys=%dx%d, buf_w=%d)\n",
+		 PIXPAPER_WIDTH, PIXPAPER_HEIGHT, PANEL_BUFFER_WIDTH);
+
+	if (!fb || !plane_state->visible) {
+		dev_err(drm->dev,
+			"No framebuffer or plane not visible, skipping update\n");
+		return;
+	}
+
+	if (ret) {
+		dev_err(drm->dev, "Failed to vmap dma_buf\n");
+		return;
+	}
+
+	src_pixels = (u32 *)vaddr;
+
+	dev_info(drm->dev, "Sending DTM command\n");
+	ret = pixpaper_send_cmd(panel, PIXPAPER_CMD_DATA_START_TRANSMISSION);
+	if (ret)
+		goto update_cleanup;
+
+	usleep_range(10000, 11000);
+	pixpaper_wait_busy(panel);
+
+	dev_info(drm->dev,
+		 "Panel idle after DTM command, starting data batch send.\n");
+
+	for (i = 0; i < PIXPAPER_HEIGHT; i++) {
+		for (j = 0; j < PANEL_BUFFER_TWO_BYTES_PER_ROW; j++) {
+			u8 packed_byte =
+				pack_pixels_to_byte(src_pixels, i, j, fb);
+
+			pixpaper_wait_busy(panel);
+			pixpaper_send_data(panel, packed_byte);
+		}
+	}
+	pixpaper_wait_busy(panel);
+
+	dev_info(drm->dev, "Sending PON + 0x00 before DRF\n");
+	ret = pixpaper_send_cmd(panel, PIXPAPER_CMD_POWER_ON);
+	if (ret)
+		goto update_cleanup;
+	ret = pixpaper_send_data(panel, 0x00);
+	if (ret) {
+		dev_err(drm->dev,
+			"Failed sending data after PON-before-DRF: %d\n", ret);
+		goto update_cleanup;
+	}
+	usleep_range(10000, 11000);
+	pixpaper_wait_busy(panel);
+
+	dev_info(drm->dev, "Triggering display refresh (DRF)\n");
+	ret = pixpaper_send_cmd(panel, PIXPAPER_CMD_DISPLAY_REFRESH);
+	if (ret)
+		goto update_cleanup;
+	ret = pixpaper_send_data(panel, 0x00);
+	if (ret) {
+		dev_err(drm->dev, "Failed sending data after DRF: %d\n", ret);
+		goto update_cleanup;
+	}
+	usleep_range(10000, 11000);
+	pixpaper_wait_busy(panel);
+
+	dev_info(drm->dev, "Frame update completed and refresh triggered\n");
+
+update_cleanup:
+	if (ret && ret != -ETIMEDOUT)
+		dev_err(drm->dev,
+			"Frame update function failed with error %d\n", ret);
+
+}
+
+static int pixpaper_connector_get_modes(struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	dev_info(connector->dev->dev, "%s: CALLED for connector %s (id: %d)\n",
+		 __func__, connector->name, connector->base.id);
+
+	mode = drm_mode_create(connector->dev);
+	if (!mode) {
+		DRM_ERROR("Failed to create mode for connector %s\n",
+			  connector->name);
+		return 0;
+	}
+
+	mode->hdisplay = PIXPAPER_WIDTH;
+	mode->vdisplay = PIXPAPER_HEIGHT;
+
+	mode->htotal = mode->hdisplay + 80;
+	mode->hsync_start = mode->hdisplay + 8;
+	mode->hsync_end = mode->hdisplay + 8 + 32;
+	mode->vtotal = mode->vdisplay + 10;
+	mode->vsync_start = mode->vdisplay + 2;
+	mode->vsync_end = mode->vdisplay + 2 + 2;
+
+	mode->clock = 6000;
+
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
+
+	if (drm_mode_validate_size(mode, connector->dev->mode_config.max_width,
+				   connector->dev->mode_config.max_height) !=
+	    MODE_OK) {
+		DRM_WARN(
+			"%s: Mode %s (%dx%d) failed size validation against max %dx%d\n",
+			__func__, mode->name, mode->hdisplay, mode->vdisplay,
+			connector->dev->mode_config.max_width,
+			connector->dev->mode_config.max_height);
+		drm_mode_destroy(connector->dev, mode);
+		return 0;
+	}
+
+	drm_mode_probed_add(connector, mode);
+	dev_info(connector->dev->dev,
+		 "%s: Added mode '%s' (%dx%d@%d) to connector %s\n", __func__,
+		 mode->name, mode->hdisplay, mode->vdisplay,
+		 drm_mode_vrefresh(mode), connector->name);
+
+	connector->display_info.width_mm = 30;
+	connector->display_info.height_mm = 47;
+
+	return 1;
+}
+
+DEFINE_DRM_GEM_DMA_FOPS(pixpaper_fops);
+
+static struct drm_driver pixpaper_drm_driver = {
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops = &pixpaper_fops,
+	.name = "pixpaper",
+	.desc = "DRM driver for PIXPAPER e-ink",
+	.major = 1,
+	.minor = 0,
+	.fops = &pixpaper_fops,
+	DRM_GEM_DMA_DRIVER_OPS_VMAP,
+	DRM_FBDEV_DMA_DRIVER_OPS,
+};
+
+static int pixpaper_mode_valid(struct drm_device *dev,
+			       const struct drm_display_mode *mode)
+{
+	if (mode->hdisplay == PIXPAPER_WIDTH &&
+		mode->vdisplay == PIXPAPER_HEIGHT) {
+		return MODE_OK;
+	}
+	dev_dbg(dev->dev, "Rejecting mode %dx%d (supports only %dx%d)\n",
+		mode->hdisplay, mode->vdisplay, PIXPAPER_WIDTH,
+		PIXPAPER_HEIGHT);
+	return MODE_BAD;
+}
+
+static const struct drm_mode_config_funcs pixpaper_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.mode_valid = pixpaper_mode_valid,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int pixpaper_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct pixpaper_panel *panel;
+	struct drm_device *drm;
+	int ret;
+
+	dev_info(dev, "Probing PIXPAPER panel driver\n");
+
+	panel = devm_drm_dev_alloc(dev, &pixpaper_drm_driver,
+				   struct pixpaper_panel, drm);
+	if (IS_ERR(panel)) {
+		ret = PTR_ERR(panel);
+		dev_err(dev, "Failed to allocate DRM device: %d\n", ret);
+		return ret;
+	}
+	drm = &panel->drm;
+	panel->spi = spi;
+	spi_set_drvdata(spi, panel);
+
+	spi->mode = SPI_MODE_0;
+	spi->bits_per_word = 8;
+
+	if (!spi->max_speed_hz) {
+		dev_warn(
+			dev,
+			"spi-max-frequency not specified in DT, using default %u Hz\n",
+			PIXPAPER_SPI_SPEED_DEFAULT);
+		spi->max_speed_hz = PIXPAPER_SPI_SPEED_DEFAULT;
+	} else {
+		dev_info(dev, "Using spi-max-frequency from DT: %u Hz\n",
+			 spi->max_speed_hz);
+	}
+
+	ret = spi_setup(spi);
+	if (ret < 0) {
+		dev_err(dev, "SPI setup failed: %d\n", ret);
+		return ret;
+	}
+	dev_info(dev, "SPI setup OK (mode=%d, speed=%u Hz, bpw=%d)\n",
+		 spi->mode, spi->max_speed_hz, spi->bits_per_word);
+
+	if (!dev->dma_mask)
+		dev->dma_mask = &dev->coherent_dma_mask;
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dev, "Failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+	dev_dbg(dev, "DMA mask set\n");
+
+	panel->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(panel->reset))
+		return dev_err_probe(dev, PTR_ERR(panel->reset),
+				     "Failed to get 'reset' GPIO\n");
+	panel->busy = devm_gpiod_get(dev, "busy", GPIOD_IN);
+	if (IS_ERR(panel->busy))
+		return dev_err_probe(dev, PTR_ERR(panel->busy),
+				     "Failed to get 'busy' GPIO\n");
+	panel->dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_HIGH);
+	if (IS_ERR(panel->dc))
+		return dev_err_probe(dev, PTR_ERR(panel->dc),
+				     "Failed to get 'dc' GPIO\n");
+	dev_info(dev, "All required GPIOs obtained successfully.\n");
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+	drm->mode_config.funcs = &pixpaper_mode_config_funcs;
+	drm->mode_config.min_width = PIXPAPER_WIDTH;
+	drm->mode_config.max_width = PIXPAPER_WIDTH;
+	drm->mode_config.min_height = PIXPAPER_HEIGHT;
+	drm->mode_config.max_height = PIXPAPER_HEIGHT;
+
+	ret = drm_universal_plane_init(
+		drm, &panel->plane, 1, &pixpaper_plane_funcs,
+		(const uint32_t[]){ DRM_FORMAT_XRGB8888 }, 1, NULL,
+		DRM_PLANE_TYPE_PRIMARY, NULL);
+	drm_plane_enable_fb_damage_clips(&panel->plane);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(&panel->plane, &pixpaper_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &panel->crtc, &panel->plane, NULL,
+					&pixpaper_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(&panel->crtc, &pixpaper_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &panel->encoder, &pixpaper_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret)
+		return ret;
+	panel->encoder.possible_crtcs = drm_crtc_mask(&panel->crtc);
+
+	ret = drm_connector_init(drm, &panel->connector,
+				 &pixpaper_connector_funcs,
+				 DRM_MODE_CONNECTOR_SPI);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(&panel->connector,
+				 &pixpaper_connector_helper_funcs);
+	drm_connector_attach_encoder(&panel->connector, &panel->encoder);
+
+	drm_mode_config_reset(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		return ret;
+
+	drm_client_setup(drm, NULL);
+
+	dev_info(dev, "Initialized PIXPAPER panel driver successfully\n");
+	return 0;
+}
+
+static void pixpaper_remove(struct spi_device *spi)
+{
+	struct pixpaper_panel *panel = spi_get_drvdata(spi);
+
+	if (!panel)
+		return;
+
+	dev_info(&spi->dev, "Removing PIXPAPER panel driver\n");
+
+	drm_dev_unplug(&panel->drm);
+	drm_atomic_helper_shutdown(&panel->drm);
+}
+
+static const struct spi_device_id pixpaper_ids[] = { { "pixpaper", 0 }, {} };
+MODULE_DEVICE_TABLE(spi, pixpaper_ids);
+
+static const struct of_device_id pixpaper_dt_ids[] = {
+	{ .compatible = "mayqueen,pixpaper" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, pixpaper_dt_ids);
+
+static struct spi_driver pixpaper_spi_driver = {
+	.driver = {
+		.name = "pixpaper",
+		.of_match_table = pixpaper_dt_ids,
+	},
+	.id_table = pixpaper_ids,
+	.probe = pixpaper_probe,
+	.remove = pixpaper_remove,
+};
+
+module_spi_driver(pixpaper_spi_driver);
+
+MODULE_AUTHOR("LiangCheng Wang");
+MODULE_DESCRIPTION("DRM SPI driver for PIXPAPER e-ink panel");
+MODULE_LICENSE("GPL");

-- 
2.34.1

