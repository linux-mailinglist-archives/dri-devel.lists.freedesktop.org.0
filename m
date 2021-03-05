Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089F132F2DC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995A96EC21;
	Fri,  5 Mar 2021 18:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3956EC15
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 18:39:45 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b13so4002241edx.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 10:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tf33K71twIkxM4hJLRQD7HM9YN0mvsbuZX3c9Y/Nb9I=;
 b=u+RQmqprzdy1MsB9sKjqgF24R2C9QV0O0WKwjebxR2m9olvz/IuHLOB8f7XTwUUEm1
 T3cavT85BvevU66boYJpX7L9BxVXrTBlGOO78vm0u8ZfARGtgp80vloUbmvO+fbVofU+
 /gFe6a0ls/VO68TRl2HIckJpW9enTQe1HaODNwQLtA66ooso7WVrsrh4F4IqedMjpANn
 P2CR0ryw0lepLKDI1mpFQJjLy+CT0pwBu1l2+6IVEFojYNp5CCq89o5BfYX5NJ6X8S60
 Pfn8lffoT0Xzsz34iOwfew4rs3RlP32OSIUkOtQoBtXb9jQ7M1XISF4b7DFf1dZivutY
 7gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tf33K71twIkxM4hJLRQD7HM9YN0mvsbuZX3c9Y/Nb9I=;
 b=d5LZE+TPzbm3G9iAny+95f1pj5owc67Jih1/tJ1R5uf6K7FrixKMpPiHIwqeMIZcXa
 wD3LfZP54nacTdiSmGaDtKGjE/EjGk7SL1M/jduA0V7VsNxcZZPjX90flF8lC6mkyvWa
 1oFJtrCI4Lx35smPqfMTqc4u9BQ+WWojhhYJuKIzv+FGzA4Lk6BcYst34f9X7+iwBMo+
 sytzzbG8JtCYGWDzlsUQzykYmyWbNLi6eQZtPNwVKwNndO3rLbyanjpy6wSpyf86wklU
 hZg6RCMYxueQLCLhlyUdIHlsQIJgAYOUDo6IshAqz82PTtSPKoneZgG8/eGtlrGfezFF
 wisg==
X-Gm-Message-State: AOAM531xJgtOpiChc0ZWa3buL7w6wMY0UPuOYTspJx9Go9raBOqn1Knl
 kl/WhPB/gs4jOEHVYwRTg/HdlwlD9MvCTA==
X-Google-Smtp-Source: ABdhPJxq1XvPuZG+i3nd4X6EJSujEotsK7sBnnc87kaoOOWNne65bWKi2tQr2yAU6w/Ac+93oV1M8Q==
X-Received: by 2002:aa7:dd49:: with SMTP id o9mr10358033edw.14.1614969584316; 
 Fri, 05 Mar 2021 10:39:44 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net.
 [82.24.248.100])
 by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 10:39:43 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] ARM: dts: at91: sama5d4: add vdec0 component
Date: Fri,  5 Mar 2021 18:39:24 +0000
Message-Id: <20210305183924.1754026-8-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

The SoC features a Hantro G1 compatible video decoder.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 arch/arm/boot/dts/sama5d4.dtsi                |   9 ++
 arch/arm/configs/sama5_defconfig              |   3 +
 drivers/staging/media/hantro/Kconfig          |  10 +-
 drivers/staging/media/hantro/Makefile         |   3 +
 drivers/staging/media/hantro/hantro_drv.c     |   3 +
 drivers/staging/media/hantro/hantro_hw.h      |   1 +
 .../staging/media/hantro/sama5d4_vdec_hw.c    | 118 ++++++++++++++++++
 7 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c

diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index 05c55875835d..deaf1f6cc784 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -101,6 +101,15 @@ nfc_sram: sram@100000 {
 			ranges = <0 0x100000 0x2400>;
 		};
 
+		vdec0: vdec@00300000 {
+			compatible = "atmel,sama5d4-vdec";
+			reg = <0x00300000 0x100000>;
+			interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
+			interrupt-names = "vdec";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
+			clock-names = "vdec_clk";
+		};
+
 		usb0: gadget@400000 {
 			compatible = "atmel,sama5d3-udc";
 			reg = <0x00400000 0x100000
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 0dca50c64503..10806f38abfb 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -200,6 +200,9 @@ CONFIG_RTC_DRV_AT91RM9200=y
 CONFIG_DMADEVICES=y
 CONFIG_AT_HDMAC=y
 CONFIG_AT_XDMAC=y
+CONFIG_STAGING=y
+CONFIG_STAGING_MEDIA=y
+CONFIG_VIDEO_HANTRO=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
 CONFIG_AT91_ADC=y
diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
index 5b6cf9f62b1a..43762c8164e0 100644
--- a/drivers/staging/media/hantro/Kconfig
+++ b/drivers/staging/media/hantro/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_HANTRO
 	tristate "Hantro VPU driver"
-	depends on ARCH_MXC || ARCH_ROCKCHIP || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select MEDIA_CONTROLLER_REQUEST_API
@@ -24,6 +24,14 @@ config VIDEO_HANTRO_IMX8M
 	help
 	  Enable support for i.MX8M SoCs.
 
+config VIDEO_HANTRO_SAMA5D4
+	bool "Hantro VDEC SAMA5D4 support"
+	depends on VIDEO_HANTRO
+	depends on ARCH_AT91 || COMPILE_TEST
+	default y
+	help
+	  Enable support for Atmel SAMA5D4 SoCs.
+
 config VIDEO_HANTRO_ROCKCHIP
 	bool "Hantro VPU Rockchip support"
 	depends on VIDEO_HANTRO
diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 3747a32799b2..f4b99901eeee 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -22,6 +22,9 @@ hantro-vpu-y += \
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_IMX8M) += \
 		imx8m_vpu_hw.o
 
+hantro-vpu-$(CONFIG_VIDEO_HANTRO_SAMA5D4) += \
+		sama5d4_vdec_hw.o
+
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
 		rk3288_vpu_hw.o \
 		rk3399_vpu_hw.o
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index e5f200e64993..19f1202574a2 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -478,6 +478,9 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
+#endif
+#ifdef CONFIG_VIDEO_HANTRO_SAMA5D4
+	{ .compatible = "atmel,sama5d4-vdec", .data = &sama5d4_vdec_variant, },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 73c71bb2320c..4d39da1d1581 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -152,6 +152,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
+extern const struct hantro_variant sama5d4_vdec_variant;
 
 extern const struct hantro_postproc_regs hantro_g1_postproc_regs;
 
diff --git a/drivers/staging/media/hantro/sama5d4_vdec_hw.c b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
new file mode 100644
index 000000000000..9cf1068d986b
--- /dev/null
+++ b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VDEC driver
+ *
+ * Copyright (C) 2021 Collabora Ltd, Emil Velikov <emil.velikov@collabora.com>
+ */
+
+#include "hantro.h"
+
+
+/*
+ * Supported formats.
+ */
+
+static const struct hantro_fmt sama5d4_vdec_postproc_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+};
+
+static const struct hantro_fmt sama5d4_vdec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
+		.codec_mode = HANTRO_MODE_MPEG2_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1280,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 720,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1280,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 720,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 1280,
+			.step_width = MB_DIM,
+			.min_height = 48,
+			.max_height = 720,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
+static int sama5d4_hw_init(struct hantro_dev *vpu)
+{
+	return 0;
+}
+
+/*
+ * Supported codec ops.
+ */
+
+static const struct hantro_codec_ops sama5d4_vdec_codec_ops[] = {
+	[HANTRO_MODE_MPEG2_DEC] = {
+		.run = hantro_g1_mpeg2_dec_run,
+		.reset = hantro_g1_reset,
+		.init = hantro_mpeg2_dec_init,
+		.exit = hantro_mpeg2_dec_exit,
+	},
+	[HANTRO_MODE_VP8_DEC] = {
+		.run = hantro_g1_vp8_dec_run,
+		.reset = hantro_g1_reset,
+		.init = hantro_vp8_dec_init,
+		.exit = hantro_vp8_dec_exit,
+	},
+	[HANTRO_MODE_H264_DEC] = {
+		.run = hantro_g1_h264_dec_run,
+		.reset = hantro_g1_reset,
+		.init = hantro_h264_dec_init,
+		.exit = hantro_h264_dec_exit,
+	},
+};
+
+static const struct hantro_irq sama5d4_irqs[] = {
+	{ "vdec", hantro_g1_irq },
+};
+
+static const char * const sama5d4_clk_names[] = { "vdec_clk" };
+
+const struct hantro_variant sama5d4_vdec_variant = {
+	.dec_fmts = sama5d4_vdec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(sama5d4_vdec_fmts),
+	.postproc_fmts = sama5d4_vdec_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(sama5d4_vdec_postproc_fmts),
+	.postproc_regs = &hantro_g1_postproc_regs,
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
+		 HANTRO_H264_DECODER,
+	.codec_ops = sama5d4_vdec_codec_ops,
+	.init = sama5d4_hw_init,
+	.irqs = sama5d4_irqs,
+	.num_irqs = ARRAY_SIZE(sama5d4_irqs),
+	.clk_names = sama5d4_clk_names,
+	.num_clocks = ARRAY_SIZE(sama5d4_clk_names),
+};
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
