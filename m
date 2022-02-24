Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF194C20ED
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 02:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D214410E3D0;
	Thu, 24 Feb 2022 01:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F3F10E3D0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 01:29:25 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220224012923epoutp02ad6778292d9bce0f8e5ecedeb5abd5b6~WlKgH3fg61388813888epoutp02D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 01:29:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220224012923epoutp02ad6778292d9bce0f8e5ecedeb5abd5b6~WlKgH3fg61388813888epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1645666163;
 bh=oKV2bBmcTXKAudQ3kQowohQzg6JH+sqRX1vI0I6NbM8=;
 h=Date:Subject:To:From:In-Reply-To:References:From;
 b=VEPEz1HHeczJqhEDXkdvGvGdm4uorjQDWozHFjIZ6iHt0TQSWh00q1xxe20UUT0ny
 DQ1DWFwkKiZq7UGP0xRbsauRGByJvv7u8ht/i8+4SiNAyJbnpejHzSyX1mlvzBRgE3
 pIGvYIpWURzhE8Xp4GPFebJejRQUu1bqXH5KeQ4A=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20220224012922epcas1p415dd6209df7ef6497d8e084e517c8e1b~WlKftnopK2271522715epcas1p4T;
 Thu, 24 Feb 2022 01:29:22 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.236]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4K3wL272lyz4x9QL; Thu, 24 Feb
 2022 01:29:14 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 8F.03.21932.86FD6126; Thu, 24 Feb 2022 10:29:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20220224012912epcas1p31a933b65acbe2834fc8f43344b7a6b97~WlKVwigtU1897218972epcas1p3d;
 Thu, 24 Feb 2022 01:29:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220224012912epsmtrp1247319c90f000c46656a1ec46666db85~WlKVt9GV-0056300563epsmtrp1Q;
 Thu, 24 Feb 2022 01:29:12 +0000 (GMT)
X-AuditID: b6c32a38-93fff700000255ac-a7-6216df68b5a2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B0.CC.29871.76FD6126; Thu, 24 Feb 2022 10:29:12 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220224012911epsmtip24134ef2aa977f6cb2203d6e84a5b1bf3~WlKVZxGEM1071710717epsmtip2d;
 Thu, 24 Feb 2022 01:29:11 +0000 (GMT)
Message-ID: <5e18705f-79c1-18a7-57f2-74866abe21e9@samsung.com>
Date: Thu, 24 Feb 2022 10:41:04 +0900
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
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmgW7GfbEkg+MrVSx6z51ksvi/bSKz
 xZWv79ksXty7yGKx8e0PJouzTW/YLTY9vsZqcXnXHDaLGef3MVmc+TeVxWLG5JdsDtwesxp6
 2Tz2flvA4rFz1l12j+3fHrB63O8+zuSxeUm9R9+WVYwenzfJBXBEZdtkpCampBYppOYl56dk
 5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAB2qpFCWmFMKFApILC5W0rezKcov
 LUlVyMgvLrFVSi1IySkwLdArTswtLs1L18tLLbEyNDAwMgUqTMjOuP5pLkvBBJ2K3dvOsTQw
 7lHuYuTkkBAwkdhxeQljFyMXh5DADkaJySdOMIIkhAQ+MUrc3BsFYX9jlGhbbg/TsHvuRqiG
 vYwSX6e+ZYZw3jNKNDYfZgGp4hWwk7g85TUbiM0ioCox/fhNNoi4oMTJmU/AakQFIiReHvnL
 BGILC7hIzFkE0cssIC5x68l8JpChIgInmSUe3JvEDJJgAxo0ccV9sEGcAjoSZw98Z4JokJdo
 3job7AoJgR0cEtd6XjBB3Ooicf7xKUYIW1ji1fEt7BC2lMTL/jZ2iIbJjBJ3rq9ggXBmMEoc
 /nkdqsNYYv/SyUCTOIBWaEqs36UPEVaU2Pl7LiPEZj6Jd197WEFKJAR4JTrahCBKlCSOXbwB
 NUVC4sKSiWwQtofEj2PnWCFhWi+xsO8q8wRGhVlIATMLKQBmIfltFsIRCxhZVjGKpRYU56an
 FhsWmMCjOzk/dxMjOBVrWexgnPv2g94hRiYOxkOMEhzMSiK8poViSUK8KYmVValF+fFFpTmp
 xYcYTYHRM5FZSjQ5H5gN8kriDU0sDUzMjIxNLAzNDJXEeXunnk4UEkhPLEnNTk0tSC2C6WPi
 4JRqYIqNTurgthb/mryV9Yma4628Rf/P7LU3Wfbd5Wj67cNzvnIe/ixkeUhswZFCzzW6FXfP
 7jitwbJ601yRZQVbnPwzVfqu1vQy/Fq4uOW2RiWvhUTxpSRFkTVxCruuvAqP4BHN+Rr+gH0Z
 s/6ZL29XPRQ8tHlu70fNO7rPVp13/eF06H+YNPP3vS5bnyiYTbq9OvWIakOXZmdBycSgsOWq
 v3tsijgPLuE5vLu3c8/UHYFtcqd0pOd1Ga2qOzNHt3Fq58F3e7P+Od9YujKJ23et05S5fyoN
 F2akGhuszvlUmLElc+Lcd09Kgni+NH+Na33peDBg4RrvJs7j/kUpWe1FPysenzPsu5TOFpXP
 cPniYwslluKMREMt5qLiRAAwuQTsTgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42LZdlhJXjfjvliSwa+zjBa9504yWfzfNpHZ
 4srX92wWL+5dZLHY+PYHk8XZpjfsFpseX2O1uLxrDpvFjPP7mCzO/JvKYjFj8ks2B26PWQ29
 bB57vy1g8dg56y67x/ZvD1g97ncfZ/LYvKTeo2/LKkaPz5vkAjiiuGxSUnMyy1KL9O0SuDKu
 f5rLUjBBp2L3tnMsDYx7lLsYOTkkBEwkds/dyNjFyMUhJLCbUWLezLVsXYwcQAkJiS1bOSBM
 YYnDh4shSt4ySrS/nMUE0ssrYCdxecprNhCbRUBVYvrxm2wQcUGJkzOfsIDYogIREm3LpjCD
 2MICLhJzFh0GizMLiEvcejKfCWSoiMBpZomJF1YygiSEBOolTk9eDVbEBjR04or7YEM5BXQk
 zh74zgRyELOAusT6eUIQc+QlmrfOZp7AKDgLyepZSFbMQuiYhaRjASPLKkbJ1ILi3PTcYsMC
 w7zUcr3ixNzi0rx0veT83E2M4OjS0tzBuH3VB71DjEwcjIcYJTiYlUR4TQvFkoR4UxIrq1KL
 8uOLSnNSiw8xSnOwKInzXug6GS8kkJ5YkpqdmlqQWgSTZeLglGpgEmnN2HKwoGhuyhuGslPF
 EzdXPe16N6G3cXnVwtWTn0ZPdzn1zkhU3lQiZhXH+tfp6rvKCpPuMlp8MOPZluevcK0i4/cd
 J6XHcTGPTthYHdywtUL0qmb5zXo2/pqNh/X0p06KfPy3u97qxDY70R3y8tL9d9WsCq+11r3W
 XGxVtU1epWx6bfarJpHpu2wOJ8lMWXHt2u4zZ1v/TjczKQwJlKs1NlixrE//YMb9CQ1XL387
 WuW/JGF9Sa9mh50wo+TdLJO/oebat7r+emnsmH+h+FLOfKd2TtvMS/pPIrYcarZqzNA56Xtq
 3uylX66ZGFTsXZQRraXFuiM8PtRbedWvK26RbvIx07kKe6aWeyYqsRRnJBpqMRcVJwIA4jBY
 ox0DAAA=
X-CMS-MailID: 20220224012912epcas1p31a933b65acbe2834fc8f43344b7a6b97
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

I found that exynos4 and 5 data sheet include documented same register.
RGB_ORDER_E field of VIDCONx registers will do same thing.

I'm not sure whether the use of undocumented register is safe or not - maybe some HW bug exists.

Anyway, I'd like to recommend you to use documented register only.

Sorry for late and thanks,
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
