Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4D4A7E15
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 03:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BDE10E83C;
	Thu,  3 Feb 2022 02:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4515E10E83C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 02:45:31 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220203024529epoutp036e2d981d45054b7c8f69fe4d0ef738e5~QJp8qEU1s0485004850epoutp03K
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 02:45:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220203024529epoutp036e2d981d45054b7c8f69fe4d0ef738e5~QJp8qEU1s0485004850epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1643856329;
 bh=LTMx0mvoTh7gsldxW1ELZHlFxhkhF5WWa60fzIk8E7k=;
 h=Date:Subject:To:From:In-Reply-To:References:From;
 b=tL3/76ezFVuw51yj/KspCnSx1sXvx4vqoq3PgDwTpdJa0tUnoWd2Ababs8xkqkC3G
 CffoSqw74ZBlTSxXL2w92nbmLgsicmAYKhURDjjKh7W2QAbUXk77HzXOLa4Vy4fLRN
 N3XdEt0zfJReJ7Zc4tFz1JVmXxA8rTQixsnZpQb0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20220203024528epcas1p43e630f8cfcc2a02b75bcee3ed700cef9~QJp8G2Ye53213532135epcas1p4K;
 Thu,  3 Feb 2022 02:45:28 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.237]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Jq31b4GtNz4x9Px; Thu,  3 Feb
 2022 02:45:23 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 F1.64.64085.3C14BF16; Thu,  3 Feb 2022 11:45:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20220203024523epcas1p49abd1129eeb53bbf48c9933f23060282~QJp3MG5kt2091920919epcas1p4d;
 Thu,  3 Feb 2022 02:45:23 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220203024523epsmtrp28a7e26c1d45f9ee51b1dc8e15f07562d~QJp3LNTo_2773627736epsmtrp2w;
 Thu,  3 Feb 2022 02:45:23 +0000 (GMT)
X-AuditID: b6c32a35-9c3ff7000000fa55-06-61fb41c36050
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 15.58.08738.3C14BF16; Thu,  3 Feb 2022 11:45:23 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220203024522epsmtip204196f5f1c1c26fb95e31826b9737847~QJp2lyW8s2085620856epsmtip2d;
 Thu,  3 Feb 2022 02:45:22 +0000 (GMT)
Message-ID: <0813963b-db28-f931-cf28-771b2141ee1c@samsung.com>
Date: Thu, 3 Feb 2022 11:57:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/exynos: fimd: add BGR support for exynos4/5
Content-Language: en-US
To: =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>, Joonyoung
 Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
In-Reply-To: <20220129220153.GA33165@adroid>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmge5hx9+JBo/eKFj0njvJZPF/20Rm
 iytf37NZvLh3kcVi49sfTBZnm96wW2x6fI3V4vKuOWwWM87vY7I4828qi8WMyS/ZHLg9ZjX0
 snns/baAxWPnrLvsHtu/PWD1uN99nMlj85J6j74tqxg9Pm+SC+CIyrbJSE1MSS1SSM1Lzk/J
 zEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMATpUSaEsMacUKBSQWFyspG9nU5Rf
 WpKqkJFfXGKrlFqQklNgWqBXnJhbXJqXrpeXWmJlaGBgZApUmJCd0Tl5H3PBI82KW39PMDYw
 nlHsYuTkkBAwkWjefJWti5GLQ0hgB6PE3W9rmCGcT4wS6059YIdwPjNK7H67jg2mZVrXN0aI
 xC5GicMv9zBBOO8ZJdY+nskMUsUrYCexvO0lI4jNIqAicef2P3aIuKDEyZlPWEBsUYEIiZdH
 /jKB2MICLhJzFh0GizMLiEvcejIfbKiIwElmiQf3JoENZRNQlZi44j7YGZwCOhJnD3xngmiQ
 l2jeOhvscAmBHRwSM3eeZoW41UXi679eFghbWOLV8S3sELaUxOd3e9kgGiYzSty5voIFwpkB
 9NDP64wQVcYS+5dOBlrBAbRCU2L9Ln2IsKLEzt9zGSE280m8+9rDClIiIcAr0dEmBFGiJHHs
 4g2oKRISF5ZMhIadh8SPY+fAbhMSqJdY2HeVeQKjwiykgJmFFACzkPw2C+GIBYwsqxjFUguK
 c9NTiw0LDOERnpyfu4kRnI61THcwTnz7Qe8QIxMH4yFGCQ5mJRHevQu/JwrxpiRWVqUW5ccX
 leakFh9iNAVGz0RmKdHkfGBGyCuJNzSxNDAxMzI2sTA0M1QS51017XSikEB6YklqdmpqQWoR
 TB8TB6dUA1PovN512xaaXrdbvW1Jj7dnUrPX9NerTW/+W32GedYb7u4T/K363GopswyOd/fV
 KzEX+xhfX7X5uuf65ya323+ckO+tctwbEX7v56P9vSc59Oau+hn5ypj1hEd97eZjJr0Vbx57
 Fs0+lfxd+Iv8l2X31INO/DJr6KvLjiwNn8Dy0vmo096XC99Xic9Z+dR+7Vmx87PLUhXSw5PP
 rtm5xqhRqm3mc7bPQedL9e7377Kp/KAh8PTT7WmxnDGPlzH+2ft3f/+evl9HKwIXXhZ9yJh6
 u/m09cJET1ebx12CVnVL12vGXZHfV2Ji7HUi8EQmR2X6IoXNDpb/XnRkffUNELpi9mh6av/m
 P8ee+Rmd6pNSYinOSDTUYi4qTgQAVn7erFAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42LZdlhJXvew4+9Eg6kT2S16z51ksvi/bSKz
 xZWv79ksXty7yGKx8e0PJouzTW/YLTY9vsZqcXnXHDaLGef3MVmc+TeVxWLG5JdsDtwesxp6
 2Tz2flvA4rFz1l12j+3fHrB63O8+zuSxeUm9R9+WVYwenzfJBXBEcdmkpOZklqUW6dslcGV0
 Tt7HXPBIs+LW3xOMDYxnFLsYOTkkBEwkpnV9Y+xi5OIQEtjBKNG88jFTFyMHUEJCYstWDghT
 WOLw4WKIkreMEqcWLWcF6eUVsJNY3vaSEcRmEVCRuHP7HztEXFDi5MwnLCC2qECERNuyKcwg
 trCAi8ScRYfB4swC4hK3nsxnAhkqInCaWWLihZVgg4QE6iVOT14NVsQmoCoxccV9NhCbU0BH
 4uyB72C3MQuoS6yfJwQxR16ieets5gmMgrOQrJ6FZMUshI5ZSDoWMLKsYpRMLSjOTc8tNiww
 ykst1ytOzC0uzUvXS87P3cQIji4trR2Me1Z90DvEyMTBeIhRgoNZSYR378LviUK8KYmVValF
 +fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUw7TKYNMNy99tfObFSP+Rv
 508RSnPf75H10euah3VIu8nfRh7x/y22Uwqf8/2f6buIMWq9gs+izY9yf3ExK2/0M7k7VTWe
 v9DUkCMqw073gmbN+oucN20uOz6fPV1rp85+tolhi95MrDgS47hx7uXaA/oS5kViHHvEjnHL
 xhZPEzYPX3LQI2KCi96Wz0rKav/X3705XWaWvmF7ybWftkclU89xJd3uEp8UbOXTOeN6aRPH
 oWUq7GrN+3c3fUopXuqtPnvPYrNTXMdnZOx7d+N79JyHPbsnKTPMWrGFQ91MtCLBdm/eU/XK
 laqB6v7/M04c2dqaseDHiTVqW75GqP1hOjR99zYZ4den5rrNXsW9T4mlOCPRUIu5qDgRAPSd
 y2YdAwAA
X-CMS-MailID: 20220203024523epcas1p49abd1129eeb53bbf48c9933f23060282
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220129220203epcas1p25b1704191dd7babfb8d5b8dc6704d566
References: <CGME20220129220203epcas1p25b1704191dd7babfb8d5b8dc6704d566@epcas1p2.samsung.com>
 <20220129220153.GA33165@adroid>
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

Hi Martin.

Thanks for your contribution,
Inki Dae

22. 1. 30. 07:01에 Martin Jücker 이(가) 쓴 글:
> In the downstream kernels for exynos4 and exynos5 devices, there is an
> undocumented register that controls the order of the RGB output. It can
> be set to either normal order or reversed, which enables BGR support for
> those SoCs.
> 
> This patch enables the BGR support for all the SoCs that were found to
> have at least one device with this logic in the corresponding downstream
> kernels.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 42 ++++++++++++++++++++++--
>  include/video/samsung_fimd.h             |  4 +++
>  2 files changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index c735e53939d8..cb632360c968 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -109,6 +109,7 @@ struct fimd_driver_data {
>  	unsigned int has_dp_clk:1;
>  	unsigned int has_hw_trigger:1;
>  	unsigned int has_trigger_per_te:1;
> +	unsigned int has_bgr_support:1;
>  };
>  
>  static struct fimd_driver_data s3c64xx_fimd_driver_data = {
> @@ -138,6 +139,7 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
>  	.lcdblk_bypass_shift = 1,
>  	.has_shadowcon = 1,
>  	.has_vtsel = 1,
> +	.has_bgr_support = 1,
>  };
>  
>  static struct fimd_driver_data exynos5_fimd_driver_data = {
> @@ -149,6 +151,7 @@ static struct fimd_driver_data exynos5_fimd_driver_data = {
>  	.has_vidoutcon = 1,
>  	.has_vtsel = 1,
>  	.has_dp_clk = 1,
> +	.has_bgr_support = 1,
>  };
>  
>  static struct fimd_driver_data exynos5420_fimd_driver_data = {
> @@ -162,6 +165,7 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
>  	.has_vtsel = 1,
>  	.has_mic_bypass = 1,
>  	.has_dp_clk = 1,
> +	.has_bgr_support = 1,
>  };
>  
>  struct fimd_context {
> @@ -226,6 +230,18 @@ static const uint32_t fimd_formats[] = {
>  	DRM_FORMAT_ARGB8888,
>  };
>  
> +static const uint32_t fimd_extended_formats[] = {
> +	DRM_FORMAT_C8,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_XBGR1555,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ABGR8888,
> +};
> +
>  static const unsigned int capabilities[WINDOWS_NR] = {
>  	0,
>  	EXYNOS_DRM_PLANE_CAP_WIN_BLEND | EXYNOS_DRM_PLANE_CAP_PIX_BLEND,
> @@ -673,21 +689,25 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
>  		val |= WINCONx_BYTSWP;
>  		break;
>  	case DRM_FORMAT_XRGB1555:
> +	case DRM_FORMAT_XBGR1555:
>  		val |= WINCON0_BPPMODE_16BPP_1555;
>  		val |= WINCONx_HAWSWP;
>  		val |= WINCONx_BURSTLEN_16WORD;
>  		break;
>  	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_BGR565:
>  		val |= WINCON0_BPPMODE_16BPP_565;
>  		val |= WINCONx_HAWSWP;
>  		val |= WINCONx_BURSTLEN_16WORD;
>  		break;
>  	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_XBGR8888:
>  		val |= WINCON0_BPPMODE_24BPP_888;
>  		val |= WINCONx_WSWP;
>  		val |= WINCONx_BURSTLEN_16WORD;
>  		break;
>  	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_ABGR8888:
>  	default:
>  		val |= WINCON1_BPPMODE_25BPP_A1888;
>  		val |= WINCONx_WSWP;
> @@ -695,6 +715,18 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
>  		break;
>  	}
>  
> +	switch (pixel_format) {
> +	case DRM_FORMAT_XBGR1555:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ABGR8888:
> +	case DRM_FORMAT_BGR565:
> +		writel(WIN_RGB_ORDER_REVERSE, ctx->regs + WIN_RGB_ORDER(win));
> +		break;
> +	default:
> +		writel(WIN_RGB_ORDER_FORWARD, ctx->regs + WIN_RGB_ORDER(win));
> +		break;
> +	}
> +
>  	/*
>  	 * Setting dma-burst to 16Word causes permanent tearing for very small
>  	 * buffers, e.g. cursor buffer. Burst Mode switching which based on
> @@ -1074,8 +1106,14 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>  	ctx->drm_dev = drm_dev;
>  
>  	for (i = 0; i < WINDOWS_NR; i++) {
> -		ctx->configs[i].pixel_formats = fimd_formats;
> -		ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
> +		if (ctx->driver_data->has_bgr_support) {
> +			ctx->configs[i].pixel_formats = fimd_extended_formats;
> +			ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_extended_formats);
> +		} else {
> +			ctx->configs[i].pixel_formats = fimd_formats;
> +			ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
> +		}
> +
>  		ctx->configs[i].zpos = i;
>  		ctx->configs[i].type = fimd_win_types[i];
>  		ctx->configs[i].capabilities = capabilities[i];
> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> index c4a93ce1de48..e6966d187591 100644
> --- a/include/video/samsung_fimd.h
> +++ b/include/video/samsung_fimd.h
> @@ -476,6 +476,10 @@
>   * 1111		-none-	 -none-   -none-   -none-    -none-
>  */
>  
> +#define WIN_RGB_ORDER(_win)			(0x2020 + ((_win) * 4))
> +#define WIN_RGB_ORDER_FORWARD			(0 << 11)
> +#define WIN_RGB_ORDER_REVERSE			(1 << 11)
> +
>  /* FIMD Version 8 register offset definitions */
>  #define FIMD_V8_VIDTCON0	0x20010
>  #define FIMD_V8_VIDTCON1	0x20014
