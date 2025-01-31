Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2ABA23ACF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 09:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD5410EA32;
	Fri, 31 Jan 2025 08:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TY1nApFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034CA10EA32
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 08:41:14 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-436202dd730so11959955e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 00:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738312873; x=1738917673; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q1VfOTtliBDZ4hlBrGOXr4g2jtxV7JmZWFRb7E/vulE=;
 b=TY1nApFzEK+HypQR6RGp6NEJRfeUinufivl9mcFp23LJv3xCCgTP0Ebjku3qadSsyE
 0XGSEHW38mtwljBrIoFasrriteK/HUGH3a3th9bYP5065MeDuk1xlezc47YslEAjJFDu
 mPotUydxUQPQeYxHRgCQV1uANVhE/Qd0BUuZLIxqFmpz1VQMjL/PstUn4xE4MBb1q7dy
 3iSUENDDTkEx2pnEOa9B1dUa5SXe2xl4CKRB6dOfuq6tWtKOfPlAqGRjBG4fFfYA+B5C
 y6bSj4clLJerD654CS6fKxxCcg0S5AjMNBFQBd8IO9t1EmTYss/hgOOwEfueO9RtV8u0
 A7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738312873; x=1738917673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q1VfOTtliBDZ4hlBrGOXr4g2jtxV7JmZWFRb7E/vulE=;
 b=elkUFBDKXE0Ppc72IVxizBOvdpDb8FTHpQqipq9B5FJ8U4LPYiSVoQ8s679pRFOqvb
 WvWDmV7FEFq2htk7giixKiJvSH1YDm1Vs4/HtfpgZhNTCGDAlTWdOY2hIPYZ+Uc8pwMD
 a7pQfDLh3OR6mIT0pdLM+9ZQm9CDyul0d23V9lwZIx2f7yt857I048gShIi8xu/DVjJI
 qdgsA4mAuSU2S71e8cdfWNS76TASlhO8dIV6KlaZ5XMQYHn//CVEpm43MLMjFXKYgOoj
 MGLdCmZMdyIRv01XmJVOen2RaIvUCzISCslALjzLb6f4S7pQRc7Z4MDL/wYui68uedLu
 39fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPOVIzJnvxK45O2uBJLFM21Pvb+OBjWzUfol7oY2IGqYtqqljb+9u0HTMttauwelQyObWL1H1EHeA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNwkQ34kgoIRAEUHCciUUuNbVsZ49/nKbtLaNNpzw0QYXGr7EV
 Yg5jaTGl/ZVsSWeMz1p3SD7kXKvJL9QNzW9zMKsFchLfH+y/oEMg
X-Gm-Gg: ASbGnctPq8wKX1ReO9KuW8tXWVNTcZEk319gcKUErEbIOghiqkybaEDktwrDRJ5zqnD
 rzGCUxrnuNoKxZgSJhIkCscy4P9JYxEtUuvjng/8BpI3u+9jew/kRN9T+jU7gXa0oUGUNJ9bDaB
 CTzGFFmPsXUFcfGi8ophq2LYlgaP7a8BJoNaVeI2hQiqm+JYYafzSqbzNkdovcljGpcp78FMZKe
 L0NXgrlBsDgQw5LliXOIkNYovCgMWUufwxsy0vemiH1DiI3/w5HcctRSaKWcj7CpIbZaOBFYh2q
 VAJW64tcu46r2s1M
X-Google-Smtp-Source: AGHT+IGB6gcJ4fuIHKQXOPNZF4QCa4AbazEYBDkwmC5957fowmE1e4VWWEYS9UZMbxD+La8e4HqALQ==
X-Received: by 2002:a05:600c:4586:b0:434:eb86:aeca with SMTP id
 5b1f17b1804b1-438dc3ae051mr105002595e9.10.1738312873231; 
 Fri, 31 Jan 2025 00:41:13 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e5e53sm47479755e9.17.2025.01.31.00.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 00:41:12 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org, nicolejadeyee@google.com,
 pekka.paalanen@collabora.com, pekka.paalanen@haloniitty.fi,
 rdunlap@infradead.org, rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 simona.vetter@ffwll.ch, simona@ffwll.ch, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de
Subject: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
Date: Fri, 31 Jan 2025 09:41:11 +0100
Message-ID: <20250131084111.2903-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
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

Hi Louis,

> From: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Create KUnit tests to test the conversion between YUV and RGB. Test each
> conversion and range combination with some common colors.
> 
> The code used to compute the expected result can be found in comment.
>
> [Louis Chauvet:
> - fix minor formating issues (whitespace, double line)
> - change expected alpha from 0x0000 to 0xffff
> - adapt to the new get_conversion_matrix usage
> - apply the changes from Arthur
> - move struct pixel_yuv_u8 to the test itself]
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/Kconfig                  |  15 ++
>  drivers/gpu/drm/vkms/Makefile                 |   1 +
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>  drivers/gpu/drm/vkms/tests/Makefile           |   3 +
>  drivers/gpu/drm/vkms/tests/vkms_format_test.c | 271 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.c           |   7 +-
>  drivers/gpu/drm/vkms/vkms_formats.h           |   5 +
>  7 files changed, 304 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index 9def079f685bd30e1df3e4082e4818e402395391..d4665e913de7702fbd5c0f047876dad9715c690a 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -14,3 +14,18 @@ config DRM_VKMS
>  	  a VKMS.
>  
>  	  If M is selected the module will be called vkms.
> +
> +config DRM_VKMS_KUNIT_TESTS
> +	tristate "KUnit tests for VKMS." if !KUNIT_ALL_TESTS
> +	depends on DRM_VKMS && KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds unit tests for VKMS. This option is not useful for
> +	  distributions or general kernels, but only for kernel
> +	  developers working on VKMS.
> +
> +	  For more information on KUnit and unit tests in general,
> +	  please refer to the KUnit documentation in
> +	  Documentation/dev-tools/kunit/.
> +
> +	  If in doubt, say "N".
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 1b28a6a32948b557867dda51d2ccfdea687a2b62..8d3e46dde6350558a0aab4254df0dfe863f9c6ce 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -9,3 +9,4 @@ vkms-y := \
>  	vkms_writeback.o
>  
>  obj-$(CONFIG_DRM_VKMS) += vkms.o
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..70e378228cbdaa025f01641f207a93a6c01f0853
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> @@ -0,0 +1,4 @@
> +CONFIG_KUNIT=y
> +CONFIG_DRM=y
> +CONFIG_DRM_VKMS=y
> +CONFIG_DRM_VKMS_KUNIT_TESTS=y
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..2d1df668569e4f243ed9a06c1e16e595c131c4f6
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_format_test.o
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..aa81347ddce2288933abc2ff5b79f0ee11ff4271
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_fixed.h>
> +#include <drm/drm_fourcc.h>
> +
> +#include "../../drm_crtc_internal.h"
> +
> +#include "../vkms_formats.h"
> +
> +#define TEST_BUFF_SIZE 50
> +
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> +
> +struct pixel_yuv_u8 {
> +	u8 y, u, v;
> +};
> +
> +/*
> + * struct yuv_u8_to_argb_u16_case - Reference values to test the color
> + * conversions in VKMS between YUV to ARGB
> + *
> + * @encoding: Encoding used to convert RGB to YUV
> + * @range: Range used to convert RGB to YUV
> + * @n_colors: Count of test colors in this case
> + * @format_pair.name: Name used for this color conversion, used to
> + *                    clarify the test results
> + * @format_pair.rgb: RGB color tested
> + * @format_pair.yuv: Same color as @format_pair.rgb, but converted to
> + *                   YUV using @encoding and @range.
> + */
> +struct yuv_u8_to_argb_u16_case {
> +	enum drm_color_encoding encoding;
> +	enum drm_color_range range;
> +	size_t n_colors;
> +	struct format_pair {
> +		char *name;
> +		struct pixel_yuv_u8 yuv;
> +		struct pixel_argb_u16 argb;
> +	} colors[TEST_BUFF_SIZE];
> +};
> +
> +/*
> + * The YUV color representation were acquired via the colour python framework.
> + * Below are the function calls used for generating each case.
> + *
> + * For more information got to the docs:
> + * https://colour.readthedocs.io/en/master/generated/colour.RGB_to_YCbCr.html
> + */
> +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = False,
> +	 *                     out_int = True)
> +	 *
> +	 * Test cases for conversion between YUV BT601 full range and RGB
> +	 * using the ITU-R BT.601 weights.
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT601,
> +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> +		.n_colors = 6,
> +		.colors = {
> +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x4c, 0x55, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0x96, 0x2c, 0x15 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x1d, 0xff, 0x6b }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = True,
> +	 *                     out_int = True)
> +	 * Test cases for conversion between YUV BT601 limited range and RGB
> +	 * using the ITU-R BT.601 weights.
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT601,
> +		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
> +		.n_colors = 6,
> +		.colors = {
> +			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x51, 0x5a, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0x91, 0x36, 0x22 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x29, 0xf0, 0x6e }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = False,
> +	 *                     out_int = True)
> +	 * Test cases for conversion between YUV BT709 full range and RGB
> +	 * using the ITU-R BT.709 weights.
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT709,
> +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> +		.n_colors = 4,

If I understood correctly, "n_colors" here indicates the number of items in
"colors", but there is a mismatch between both lengths.

It also applies to the other test cases where "n_colors = 4".

> +		.colors = {
> +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x36, 0x63, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0xb6, 0x1e, 0x0c }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x12, 0xff, 0x74 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> +	 *                     in_bits = 16,
> +	 *                     int_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = True,
> +	 *                     out_int = True)
> +	 * Test cases for conversion between YUV BT709 limited range and RGB
> +	 * using the ITU-R BT.709 weights.
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT709,
> +		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x3f, 0x66, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0xad, 0x2a, 0x1a }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x20, 0xf0, 0x76 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = False,
> +	 *                     out_int = True)
> +	 * Test cases for conversion between YUV BT2020 full range and RGB
> +	 * using the ITU-R BT.2020 weights.
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT2020,
> +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x43, 0x5c, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0xad, 0x24, 0x0b }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x0f, 0xff, 0x76 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = True,
> +	 *                     out_int = True)
> +	 * Test cases for conversion between YUV BT2020 limited range and RGB
> +	 * using the ITU-R BT.709 weights.
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT2020,
> +		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x4a, 0x61, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0xa4, 0x2f, 0x19 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x1d, 0xf0, 0x77 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +};
> +
> +/*
> + * vkms_format_test_yuv_u8_to_argb_u16 - Testing the conversion between YUV
> + * colors to ARGB colors in VKMS
> + *
> + * This test will use the functions get_conversion_matrix_to_argb_u16 and
> + * argb_u16_from_yuv888 to convert YUV colors (stored in
> + * yuv_u8_to_argb_u16_cases) into ARGB colors.
> + *
> + * The conversion between YUV and RGB is not totally reversible, so there may be
> + * some difference between the expected value and the result.
> + * In addition, there may be some rounding error as the input color is 8 bits
> + * and output color is 16 bits.
> + */
> +static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
> +{
> +	const struct yuv_u8_to_argb_u16_case *param = test->param_value;
> +	struct pixel_argb_u16 argb;
> +
> +	for (size_t i = 0; i < param->n_colors; i++) {
> +		const struct format_pair *color = &param->colors[i];
> +		struct conversion_matrix matrix;
> +
> +		get_conversion_matrix_to_argb_u16
> +			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
> +
> +		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, &matrix);

Running the test on ppc64 (big endian) doesn't fail. For reference:

  $ sudo dnf install powerpc64-linux-gnu-gcc
  $ sudo dnf install qemu-system-ppc64
  $ ./tools/testing/kunit/kunit.py run \
     --kunitconfig=drivers/gpu/drm/vkms/tests \
     --arch=powerpc --cross_compile=powerpc64-linux-gnu- \
     --make_options CF=-D__CHECK_ENDIAN__ \
     --kconfig_add CONFIG_KASAN=y \
     --kconfig_add CONFIG_KASAN_VMALLOC=y

However, I wonder if endianness is correctly handled. I always find endianness
difficult to reason about, but I'll try my best to explain it.

On a big endian architecture, color->yuv is stored in big endian. This might not
be an issue, because its components (y, u and v) are u8.
However, I think that the return value of argb_u16_from_yuv888(), which is the
result of argb_u16_from_u16161616(), is returned in big endian while it should
be little endian.

Since you are comparing argb.a (big endian) with color->argb.a (big endian) the
test succedess, but in this case it should fail because, if I remember
correctly, colors must be stored in little endian and therefore, the color
returned by argb_u16_from_yuv888() should be little endian.

If you replace this 4 KUNIT_EXPECT_LE_MSG() with KUNIT_EXPECT_MEMEQ(), all test
will fail, but you'll notice that the buffers printed in the error log are
different depending on the endianness (x86_64 vs ppc64).

What do you think? Did I overlook the conversion?

Have a look to the tests present in drm_format_helper_test.c. They use different
functions (cpubuf_to_le32, le32buf_to_cpu, etc) to make sure that colors are
represented in little endian and that comparing the expected and actual results
happens in the same endian.

> +
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.a, color->argb.a), 0x1ff,
> +				    "On the A channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->argb.a, argb.a);
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.r, color->argb.r), 0x1ff,
> +				    "On the R channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->argb.r, argb.r);
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.g, color->argb.g), 0x1ff,
> +				    "On the G channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->argb.g, argb.g);
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.b, color->argb.b), 0x1ff,
> +				    "On the B channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->argb.b, argb.b);
> +	}
> +}
> +
> +static void vkms_format_test_yuv_u8_to_argb_u16_case_desc(struct yuv_u8_to_argb_u16_case *t,
> +							  char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s - %s",
> +		 drm_get_color_encoding_name(t->encoding), drm_get_color_range_name(t->range));
> +}
> +
> +KUNIT_ARRAY_PARAM(yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_cases,
> +		  vkms_format_test_yuv_u8_to_argb_u16_case_desc
> +);
> +
> +static struct kunit_case vkms_format_test_cases[] = {
> +	KUNIT_CASE_PARAM(vkms_format_test_yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_format_test_suite = {
> +	.name = "vkms-format",
> +	.test_cases = vkms_format_test_cases,
> +};
> +
> +kunit_test_suite(vkms_format_test_suite);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Kunit test for vkms format conversion");
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 1f3ce4f334be9560e62c9a7fd933fa0ed6640e8f..0b867444999105262c855a24bf03bc66d9ebea1b 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -7,6 +7,8 @@
>  #include <drm/drm_rect.h>
>  #include <drm/drm_fixed.h>
>  
> +#include <kunit/visibility.h>
> +
>  #include "vkms_formats.h"
>  
>  /**
> @@ -247,8 +249,8 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
>  	return out_pixel;
>  }
>  
> -static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
> -						  const struct conversion_matrix *matrix)
> +VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
> +							    const struct conversion_matrix *matrix)
>  {
>  	u16 r, g, b;
>  	s64 fp_y, fp_channel_1, fp_channel_2;
> @@ -278,6 +280,7 @@ static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel
>  
>  	return argb_u16_from_u16161616(0xffff, r, g, b);
>  }
> +EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
>  
>  /*
>   * The following functions are read_line function for each pixel format supported by VKMS.
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index d583855cb32027d16b73d2a5b5a0644b13191d08..b4fe62ab9c65d465925d29911f26612193a80799 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -13,4 +13,9 @@ void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encod
>  				       enum drm_color_range range,
>  				       struct conversion_matrix *matrix);
>  
> +#if IS_ENABLED(CONFIG_KUNIT)
> +struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
> +					   const struct conversion_matrix *matrix);
> +#endif
> +
>  #endif /* _VKMS_FORMATS_H_ */
> 
