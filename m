Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99144A3EAE
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 09:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC3D10F56C;
	Mon, 31 Jan 2022 08:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB8510E12B
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 22:01:58 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ka4so29121344ejc.11
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 14:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=yjUU9ER/vIEGLeysJCo+/yYTdTjRHWEWnfNYddtn3aA=;
 b=GasqK6RF2C1NLwNFKTrQaUjs2o8JvlWlPo88Gk33v2yX68jTVNTX8RuL9WeODxuYgI
 0zVfdFLvDQ6Scm07F8G4M28CBxrFgmgzFCZN1YPFJOzIwEZtqfGnmpEunqvqASO6YJln
 Ync30uNDDbpnXWDLMpetV3oG0ExsqVaZqaLvT6dCXDjteTaouVkFwgpWOx4bV27QHNEy
 F7vqwf6ejDMbcH1ZrwJR177hpWXMzpm/Z3N3VNSo/1OHYAd9Bsz2df5sPio+OqhWcHZh
 LF/FInpELUZKeDEjeZyr1LsbNVfm1SYbnkZy0JFf+3/1ZopOuaeHe2zmd1Z9XxqiP/rV
 B77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=yjUU9ER/vIEGLeysJCo+/yYTdTjRHWEWnfNYddtn3aA=;
 b=cngDmoiGYspRbgnhK198WvbKjc+8fU2VFtihguzvjIymnIJOqEIgWX8BZmg0HTyv/a
 jU0MQqOxSQwgv5yi8GXxTMq5EiItiIVeP0NTFEXrmlnDu10ywBBGpIyZJd+LV4aMY4ox
 NTPCYYi5pEdqdq7DdiF7uBODU+AsF7swEWAFe1G2JjuBvR7cBWJyf5qYDHZ/05AgQQOB
 I9+3/vq3ismWs7qHwINrUzmFHcQvQ9SMAwFBheUg0rKHwGOfpkjRHNokOOU13ZU6VSJA
 vQhDz2z+Fs/ITww/JkgZscBPKHrWv39HtqOfQc8gT919NKbXZ7K1dA8ee/us994/xPXq
 ndYg==
X-Gm-Message-State: AOAM533zFnIv+jDXjXq5yB0s4yMnEkvueyr2nYTcaHHUNbFoU/CFT/lE
 7ij1NxT3Isv8sk+b3GwS9y4=
X-Google-Smtp-Source: ABdhPJyn9Tnz9SCtDypxoXBmZOjSdAvG+KAgXi0wQd7Ix3xNYlAf5Zop3ncrx+pbyhT4baltFFW5EQ==
X-Received: by 2002:a17:907:94d2:: with SMTP id
 dn18mr4507899ejc.304.1643493716705; 
 Sat, 29 Jan 2022 14:01:56 -0800 (PST)
Received: from adroid (027-177-184-091.ip-addr.vsenet.de. [91.184.177.27])
 by smtp.gmail.com with ESMTPSA id ry6sm3338861ejc.45.2022.01.29.14.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 14:01:56 -0800 (PST)
Date: Sat, 29 Jan 2022 23:01:53 +0100
From: Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: fimd: add BGR support for exynos4/5
Message-ID: <20220129220153.GA33165@adroid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Jan 2022 08:35:18 +0000
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
Cc: Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the downstream kernels for exynos4 and exynos5 devices, there is an
undocumented register that controls the order of the RGB output. It can
be set to either normal order or reversed, which enables BGR support for
those SoCs.

This patch enables the BGR support for all the SoCs that were found to
have at least one device with this logic in the corresponding downstream
kernels.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 42 ++++++++++++++++++++++--
 include/video/samsung_fimd.h             |  4 +++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index c735e53939d8..cb632360c968 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -109,6 +109,7 @@ struct fimd_driver_data {
 	unsigned int has_dp_clk:1;
 	unsigned int has_hw_trigger:1;
 	unsigned int has_trigger_per_te:1;
+	unsigned int has_bgr_support:1;
 };
 
 static struct fimd_driver_data s3c64xx_fimd_driver_data = {
@@ -138,6 +139,7 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
 	.lcdblk_bypass_shift = 1,
 	.has_shadowcon = 1,
 	.has_vtsel = 1,
+	.has_bgr_support = 1,
 };
 
 static struct fimd_driver_data exynos5_fimd_driver_data = {
@@ -149,6 +151,7 @@ static struct fimd_driver_data exynos5_fimd_driver_data = {
 	.has_vidoutcon = 1,
 	.has_vtsel = 1,
 	.has_dp_clk = 1,
+	.has_bgr_support = 1,
 };
 
 static struct fimd_driver_data exynos5420_fimd_driver_data = {
@@ -162,6 +165,7 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
 	.has_vtsel = 1,
 	.has_mic_bypass = 1,
 	.has_dp_clk = 1,
+	.has_bgr_support = 1,
 };
 
 struct fimd_context {
@@ -226,6 +230,18 @@ static const uint32_t fimd_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
 
+static const uint32_t fimd_extended_formats[] = {
+	DRM_FORMAT_C8,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_XBGR1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+};
+
 static const unsigned int capabilities[WINDOWS_NR] = {
 	0,
 	EXYNOS_DRM_PLANE_CAP_WIN_BLEND | EXYNOS_DRM_PLANE_CAP_PIX_BLEND,
@@ -673,21 +689,25 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
 		val |= WINCONx_BYTSWP;
 		break;
 	case DRM_FORMAT_XRGB1555:
+	case DRM_FORMAT_XBGR1555:
 		val |= WINCON0_BPPMODE_16BPP_1555;
 		val |= WINCONx_HAWSWP;
 		val |= WINCONx_BURSTLEN_16WORD;
 		break;
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_BGR565:
 		val |= WINCON0_BPPMODE_16BPP_565;
 		val |= WINCONx_HAWSWP;
 		val |= WINCONx_BURSTLEN_16WORD;
 		break;
 	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_XBGR8888:
 		val |= WINCON0_BPPMODE_24BPP_888;
 		val |= WINCONx_WSWP;
 		val |= WINCONx_BURSTLEN_16WORD;
 		break;
 	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ABGR8888:
 	default:
 		val |= WINCON1_BPPMODE_25BPP_A1888;
 		val |= WINCONx_WSWP;
@@ -695,6 +715,18 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
 		break;
 	}
 
+	switch (pixel_format) {
+	case DRM_FORMAT_XBGR1555:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_BGR565:
+		writel(WIN_RGB_ORDER_REVERSE, ctx->regs + WIN_RGB_ORDER(win));
+		break;
+	default:
+		writel(WIN_RGB_ORDER_FORWARD, ctx->regs + WIN_RGB_ORDER(win));
+		break;
+	}
+
 	/*
 	 * Setting dma-burst to 16Word causes permanent tearing for very small
 	 * buffers, e.g. cursor buffer. Burst Mode switching which based on
@@ -1074,8 +1106,14 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	ctx->drm_dev = drm_dev;
 
 	for (i = 0; i < WINDOWS_NR; i++) {
-		ctx->configs[i].pixel_formats = fimd_formats;
-		ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
+		if (ctx->driver_data->has_bgr_support) {
+			ctx->configs[i].pixel_formats = fimd_extended_formats;
+			ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_extended_formats);
+		} else {
+			ctx->configs[i].pixel_formats = fimd_formats;
+			ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
+		}
+
 		ctx->configs[i].zpos = i;
 		ctx->configs[i].type = fimd_win_types[i];
 		ctx->configs[i].capabilities = capabilities[i];
diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
index c4a93ce1de48..e6966d187591 100644
--- a/include/video/samsung_fimd.h
+++ b/include/video/samsung_fimd.h
@@ -476,6 +476,10 @@
  * 1111		-none-	 -none-   -none-   -none-    -none-
 */
 
+#define WIN_RGB_ORDER(_win)			(0x2020 + ((_win) * 4))
+#define WIN_RGB_ORDER_FORWARD			(0 << 11)
+#define WIN_RGB_ORDER_REVERSE			(1 << 11)
+
 /* FIMD Version 8 register offset definitions */
 #define FIMD_V8_VIDTCON0	0x20010
 #define FIMD_V8_VIDTCON1	0x20014
-- 
2.25.1

