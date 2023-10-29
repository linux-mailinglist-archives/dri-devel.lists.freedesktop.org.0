Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA847DAE02
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 20:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6F510E1A3;
	Sun, 29 Oct 2023 19:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8836F10E192
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 19:46:17 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxnuuHtj5ly5s1AA--.36829S3;
 Mon, 30 Oct 2023 03:46:15 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxXNx+tj5lKq02AA--.51878S10; 
 Mon, 30 Oct 2023 03:46:13 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 8/8] drm/loongson: Add support for the display subsystem in
 LS2K2000
Date: Mon, 30 Oct 2023 03:46:07 +0800
Message-Id: <20231029194607.379459-9-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029194607.379459-1-suijingfeng@loongson.cn>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxXNx+tj5lKq02AA--.51878S10
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3KF47KF4xtFy5XFyfWFy5WrX_yoWDWFWxpa
 13A3ySgr48tFnI939xtr1UXw1YkFyayFZayFWfGw1rW3srAr18tFnYyF4FqFW7XFy5Jr12
 qrn7G3yIk3WUGabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAF
 wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
 0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0lPfDUUUUU==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before apply this patch, drm/loongson is basically works on LS2K2000.
Because majority of hardware features of the DC are same with LS7A2000's
counterpart. Despite LS2K2000 is a SoC, it don't has a dedicated VRAM.
But the firmware will carve out part of system RAM as VRAM, and write the
base address and size of this reserved RAM to the PCI Bar 2 of the GPU.
So this kind of reserved RAM is nearly same with the dedicated video RAM.

In short, the display subsystem in LS2K2000 are nearly compatible with the
display subsystem in LS7A2000. But LS2K2000 has only one built-in HDMI
encoder, which is connected with the CRTC-0 (display pipe 0). Display pipe
1 exports a generic DVO interface. So there still need a trivial fix.

Before apply this patch:

$ dmesg | grep 0000:00:06.1

 pci 0000:00:06.1: [0014:7a36] type 00 class 0x030000
 pci 0000:00:06.1: reg 0x10: [mem 0x51250000-0x5125ffff 64bit]
 pci 0000:00:06.1: reg 0x18: [mem 0x512b6000-0x512b60ff]
 pci 0000:00:06.1: BAR 0: assigned [mem 0x51250000-0x5125ffff 64bit]
 pci 0000:00:06.1: BAR 2: assigned [mem 0x512b7f00-0x512b7fff]
 pci 0000:00:06.1: vgaarb: setting as boot VGA device
 loongson 0000:00:06.1: Found LS7A2000 bridge chipset, revision: 16
 loongson 0000:00:06.1: [drm] dc: 400MHz, gmc: 800MHz, gpu: 533MHz
 loongson 0000:00:06.1: [drm] Dedicated vram start: 0x40000000, size: 256MiB
 loongson 0000:00:06.1: [drm] Loongson VBIOS version: 2.1
 loongson 0000:00:06.1: [drm] Loongson VBIOS: has 8 DCBs
 loongson 0000:00:06.1: [drm] VRAM: 16384 pages ready
 loongson 0000:00:06.1: [drm] GTT: 32768 pages ready
 loongson 0000:00:06.1: [drm] lsdc-i2c0(sda pin mask=1, scl pin mask=2) created
 loongson 0000:00:06.1: [drm] lsdc-i2c1(sda pin mask=4, scl pin mask=8) created
 loongson 0000:00:06.1: [drm] DisplayPipe-0 has HDMI-0
 loongson 0000:00:06.1: [drm] DisplayPipe-1 has HDMI-1
 loongson 0000:00:06.1: [drm] Total 2 outputs
 loongson 0000:00:06.1: [drm] registered irq: 42
 [drm] Initialized loongson 1.0.0 20220701 for 0000:00:06.1 on minor 0
 loongson 0000:00:06.1: [drm] *ERROR* Setting HDMI-1 PLL failed
 loongson 0000:00:06.1: [drm] fb0: loongsondrmfb frame buffer device

After apply this patch, the error "*ERROR* Setting HDMI-1 PLL failed" got
fixed.

$ dmesg | grep 0000:00:06.1

 pci 0000:00:06.1: [0014:7a36] type 00 class 0x030000
 pci 0000:00:06.1: reg 0x10: [mem 0x51250000-0x5125ffff 64bit]
 pci 0000:00:06.1: reg 0x18: [mem 0x512b6000-0x512b60ff]
 pci 0000:00:06.1: BAR 0: assigned [mem 0x51250000-0x5125ffff 64bit]
 pci 0000:00:06.1: BAR 2: assigned [mem 0x512b7f00-0x512b7fff]
 pci 0000:00:06.1: vgaarb: setting as boot VGA device
 loongson 0000:00:06.1: Found LS2K2000 SoC, revision: 16
 loongson 0000:00:06.1: [drm] dc: 400MHz, gmc: 800MHz, gpu: 533MHz
 loongson 0000:00:06.1: [drm] Dedicated vram start: 0x40000000, size: 256MiB
 loongson 0000:00:06.1: [drm] Loongson VBIOS version: 2.1
 loongson 0000:00:06.1: [drm] Loongson VBIOS: has 8 DCBs
 loongson 0000:00:06.1: [drm] VRAM: 16384 pages ready
 loongson 0000:00:06.1: [drm] GTT: 32768 pages ready
 loongson 0000:00:06.1: [drm] lsdc-i2c0(sda pin mask=1, scl pin mask=2) created
 loongson 0000:00:06.1: [drm] lsdc-i2c1(sda pin mask=4, scl pin mask=8) created
 loongson 0000:00:06.1: [drm] DisplayPipe-0 has HDMI-0
 loongson 0000:00:06.1: [drm] DisplayPipe-1 has DVO-1
 loongson 0000:00:06.1: [drm] Total 2 outputs
 loongson 0000:00:06.1: [drm] registered irq: 42
 [drm] Initialized loongson 1.0.0 20220701 for 0000:00:06.1 on minor 0
 loongson 0000:00:06.1: [drm] fb0: loongsondrmfb frame buffer device

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/loongson/Makefile             |  1 +
 drivers/gpu/drm/loongson/loongson_device.c    | 46 ++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  5 ++
 drivers/gpu/drm/loongson/lsdc_output_2k2000.c | 84 +++++++++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output_2k2000.c

diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
index 393709e686aa..7d3d82ddd5ff 100644
--- a/drivers/gpu/drm/loongson/Makefile
+++ b/drivers/gpu/drm/loongson/Makefile
@@ -10,6 +10,7 @@ loongson-y := \
 	lsdc_i2c.o \
 	lsdc_irq.o \
 	lsdc_output.o \
+	lsdc_output_2k2000.o \
 	lsdc_output_7a1000.o \
 	lsdc_output_7a2000.o \
 	lsdc_plane.o \
diff --git a/drivers/gpu/drm/loongson/loongson_device.c b/drivers/gpu/drm/loongson/loongson_device.c
index 64096ad5466e..33aae403f0b0 100644
--- a/drivers/gpu/drm/loongson/loongson_device.c
+++ b/drivers/gpu/drm/loongson/loongson_device.c
@@ -6,6 +6,7 @@
 #include <linux/pci.h>
 
 #include "lsdc_drv.h"
+#include "lsdc_probe.h"
 
 extern struct loongson_vbios __loongson_vbios;
 
@@ -27,6 +28,15 @@ static const struct lsdc_kms_funcs ls7a2000_kms_funcs = {
 	.crtc_init = ls7a2000_crtc_init,
 };
 
+static const struct lsdc_kms_funcs ls2k2000_kms_funcs = {
+	.create_i2c = lsdc_create_i2c_chan,
+	.irq_handler = ls7a2000_dc_irq_handler,
+	.output_init = ls2k2000_output_init,
+	.cursor_plane_init = ls7a2000_cursor_plane_init,
+	.primary_plane_init = lsdc_primary_plane_init,
+	.crtc_init = ls7a2000_crtc_init,
+};
+
 static const struct loongson_gfx_desc ls7a1000_gfx = {
 	.dc = {
 		.num_of_crtc = 2,
@@ -93,14 +103,50 @@ static const struct loongson_gfx_desc ls7a2000_gfx = {
 	.model = "LS7A2000 bridge chipset",
 };
 
+static const struct loongson_gfx_desc ls2k2000_gfx = {
+	.dc = {
+		.num_of_crtc = 2,
+		.max_pixel_clk = 350000,
+		.max_width = 4096,
+		.max_height = 4096,
+		.num_of_hw_cursor = 2,
+		.hw_cursor_w = 64,
+		.hw_cursor_h = 64,
+		.pitch_align = 64,
+		.has_vblank_counter = true,
+		.funcs = &ls2k2000_kms_funcs,
+	},
+	.conf_reg_base = LS7A2000_CONF_REG_BASE,
+	.gfxpll = {
+		.reg_offset = LS7A2000_PLL_GFX_REG,
+		.reg_size = 8,
+	},
+	.pixpll = {
+		[0] = {
+			.reg_offset = LS7A2000_PIXPLL0_REG,
+			.reg_size = 8,
+		},
+		[1] = {
+			.reg_offset = LS7A2000_PIXPLL1_REG,
+			.reg_size = 8,
+		},
+	},
+	.vbios = &__loongson_vbios,
+	.chip_id = CHIP_LS2K2000,
+	.model = "LS2K2000 SoC",
+};
+
 static const struct lsdc_desc *__chip_id_desc_table[] = {
 	[CHIP_LS7A1000] = &ls7a1000_gfx.dc,
 	[CHIP_LS7A2000] = &ls7a2000_gfx.dc,
+	[CHIP_LS2K2000] = &ls2k2000_gfx.dc,
 	[CHIP_LS_LAST] = NULL,
 };
 
 const struct lsdc_desc *
 lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id chip_id)
 {
+	chip_id = loongson_chip_id_fixup(chip_id);
+
 	return __chip_id_desc_table[chip_id];
 }
diff --git a/drivers/gpu/drm/loongson/lsdc_output.h b/drivers/gpu/drm/loongson/lsdc_output.h
index a37a72687bdf..463d59d680c2 100644
--- a/drivers/gpu/drm/loongson/lsdc_output.h
+++ b/drivers/gpu/drm/loongson/lsdc_output.h
@@ -61,6 +61,11 @@ int ls7a2000_output_init(struct drm_device *ddev,
 			 struct i2c_adapter *ddc,
 			 unsigned int index);
 
+int ls2k2000_output_init(struct drm_device *ddev,
+			 struct lsdc_display_pipe *dispipe,
+			 struct i2c_adapter *ddc,
+			 unsigned int pipe);
+
 int lsdc_output_init(struct drm_device *ddev,
 		     struct lsdc_display_pipe *dispipe,
 		     struct i2c_adapter *ddc,
diff --git a/drivers/gpu/drm/loongson/lsdc_output_2k2000.c b/drivers/gpu/drm/loongson/lsdc_output_2k2000.c
new file mode 100644
index 000000000000..350af51da541
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_output_2k2000.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+#include "lsdc_drv.h"
+#include "lsdc_output.h"
+
+/*
+ * The DC in LS2K2000 is nearly same with the DC in LS7A2000, except that
+ * LS2K2000 has only one built-in HDMI encoder which is connected with the
+ * display pipe 0. Display pipe 1 is a DVO output interface.
+ *       ________________________
+ *      |                        |                        ______________
+ *      |             +----------|                       |              |
+ *      | CRTC-0 ---> | HDMI phy ---> HDMI Connector --> | HDMI Monitor |<--+
+ *      |             +----------|                       |______________|   |
+ *      |            +-------+   |                                          |
+ *      |            | i2c-x |   <------------------------------------------+
+ *      |            +-------+   |
+ *      |                        |
+ *      |    DC in LS2K2000      |
+ *      |                        |
+ *      |            +-------+   |
+ *      |            | i2c-y |   <------------------------------------+
+ *      |            +-------+   |                                    |
+ *      |                        |                                ____|____
+ *      |                +-------|                               |         |
+ *      | CRTC-1 ------> |  DVO  --> Encoder1 --> Connector1 --> | Display |
+ *      |                +-------|                               |_________|
+ *      |________________________|
+ */
+
+static void ls2k2000_pipe1_dvo_encoder_reset(struct drm_encoder *encoder)
+{
+	struct drm_device *ddev = encoder->dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	u32 val;
+
+	val = PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN;
+	lsdc_wreg32(ldev, LSDC_CRTC1_DVO_CONF_REG, val);
+}
+
+const struct drm_encoder_funcs ls2k2000_pipe1_dvo_encoder_funcs = {
+	.reset = ls2k2000_pipe1_dvo_encoder_reset,
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct lsdc_output_desc ls2k2000_output_desc[2] = {
+	{
+		.pipe = 0,
+		.encoder_type = DRM_MODE_ENCODER_TMDS,
+		.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		.encoder_funcs = &lsdc_pipe0_hdmi_encoder_funcs,
+		.encoder_helper_funcs = &lsdc_pipe0_hdmi_encoder_helper_funcs,
+		.connector_funcs = &lsdc_pipe0_hdmi_connector_funcs,
+		.connector_helper_funcs = &lsdc_connector_helper_funcs,
+		.name = "HDMI-0",
+	},
+	{
+		.pipe = 1,
+		.encoder_type = DRM_MODE_ENCODER_DPI,
+		.connector_type = DRM_MODE_CONNECTOR_DPI,
+		.encoder_funcs = &ls2k2000_pipe1_dvo_encoder_funcs,
+		.encoder_helper_funcs = &lsdc_encoder_helper_funcs,
+		.connector_funcs = &lsdc_connector_funcs,
+		.connector_helper_funcs = &lsdc_connector_helper_funcs,
+		.name = "DVO-1",
+	},
+};
+
+int ls2k2000_output_init(struct drm_device *ddev,
+			 struct lsdc_display_pipe *dispipe,
+			 struct i2c_adapter *ddc,
+			 unsigned int pipe)
+{
+	struct lsdc_output *output = &dispipe->output;
+
+	output->descp = &ls2k2000_output_desc[pipe];
+
+	lsdc_output_init(ddev, dispipe, ddc, pipe);
+
+	return 0;
+}
-- 
2.34.1

