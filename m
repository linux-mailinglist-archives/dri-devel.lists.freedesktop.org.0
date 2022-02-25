Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E434C550B
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 11:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8BA10ECF7;
	Sat, 26 Feb 2022 10:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B5C10E774
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:33:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qk11so9691468ejb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 01:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wVwXFGjPqrDDJSK8G4NlUrkX3LWHDibAAXwXLRr8zhU=;
 b=od9VIU2Y+YR/rihaLVf56h6HZXL6oQ2Xaazd0VFgMw8QYGgAtwLyQDY0Muby+Yxlc/
 C49i+v7JiTmdK5Zz/kL9SWTClA2ZJ8MMY8DZzSk8XOr6f80uPnA0vXbNB2Y2lLkAHded
 rU2KFznU7l1zvoIQnWxt/1SzbePyI6aPZJlxfYD2euVRdW9GYTRj48BR1TGktN7w90pf
 4Ntnn536n14uLsZPs0o3E2pwZl5z59kEVYEodgg4OCpznB1NOeHiaqJwbwG1JVF3F5oY
 UUoAJlfvkklglAqHXEE7+cO8lsSSE/2z8p2hEtDh2xruMeWHCFyOOqyWqMOoNwcjapcE
 VSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wVwXFGjPqrDDJSK8G4NlUrkX3LWHDibAAXwXLRr8zhU=;
 b=l+TcR1XURtfKjoGlACJKeeEPW2yHmuw9B+R3TZU7zJiYEBoCUesHyED7nPWvMYU4Z/
 pWunqfJl8NpC5iLoHi+5E174AsB5sZqI+Q/PNj5Cj6SDP6imiCOHjo9/OqG2583EMf3f
 wxJtkQ0dM1/m7ozsNZLWhWfrdq8+5XadRA7HMsNxQDsE71whhDoFq2wb18/JxEMzElM3
 dE8MjXjCmzbqQTh/eY2fRVywnyLkJP+u56NJjFC+SqMegaWcH4NohV54+VmXuV2kcTqD
 nzrxCS2pIXGMZeR8ERVWznRwXLZS1QX7Kzm21VCr+aC3NgrlQzGnEOCPYyny8229o3zx
 ny2Q==
X-Gm-Message-State: AOAM533Vvlvj0ZdE4Fnkly9/Dz3c7007O4j+hTeicDCXHLW5miPytiIN
 yM6+SbgWWPnUUtr54pr3btfeOiKCYogJZw==
X-Google-Smtp-Source: ABdhPJw6q7dLehrGphqLcggKl5vFOrSHQbhv9gy7yZjIFRQu0S1kAZvDLVs/+c2kVkSb2by7JkxMjQ==
X-Received: by 2002:a17:907:75fc:b0:6d5:c6bd:6fbd with SMTP id
 jz28-20020a17090775fc00b006d5c6bd6fbdmr5383036ejc.695.1645781596237; 
 Fri, 25 Feb 2022 01:33:16 -0800 (PST)
Received: from adroid (027-177-184-091.ip-addr.vsenet.de. [91.184.177.27])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a170906739400b006ccc4eb357dsm808195ejl.8.2022.02.25.01.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 01:33:15 -0800 (PST)
Date: Fri, 25 Feb 2022 10:33:13 +0100
From: Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
To: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fimd: add BGR support for exynos4/5
Message-ID: <20220225093313.GA87542@adroid>
References: <CGME20220129220203epcas1p25b1704191dd7babfb8d5b8dc6704d566@epcas1p2.samsung.com>
 <20220129220153.GA33165@adroid>
 <5e18705f-79c1-18a7-57f2-74866abe21e9@samsung.com>
 <20220224232723.GA133007@adroid>
 <b9650211-2e98-5e1f-1dc9-9c5c3571f359@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9650211-2e98-5e1f-1dc9-9c5c3571f359@samsung.com>
X-Mailman-Approved-At: Sat, 26 Feb 2022 10:00:59 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Inki,

On Fri, Feb 25, 2022 at 12:52:56PM +0900, Inki Dae wrote:
> Hi Martin,
> 
> 22. 2. 25. 08:27에 Martin Jücker 이(가) 쓴 글:
> > Hello Inki,
> > 
> > On Thu, Feb 24, 2022 at 10:41:04AM +0900, Inki Dae wrote:
> >> Hi Martin.
> >>
> >> I found that exynos4 and 5 data sheet include documented same register.
> >> RGB_ORDER_E field of VIDCONx registers will do same thing.
> > 
> > If I read the manual correctly, this register combined with the
> > RGB_ORDER_O makes it possible to map the whole RGB interface output to a
> > different order. What my patch provides is a way to configure each
> > hardware plane separately while maintaining a consistent output on the
> > RGB interface.
> > 
> 
> Understood. Your patch will allow BGR pixel order per a plane. Seems to be useful because a framebuffer with BGR pixel format can be displayed on screen without any color space conversion. :)
> 
> > Implementing the RGB_ORDER_O and E would need some logic to make sure
> > that all planes are always using the same RGB order.
> > 
> >>
> >> I'm not sure whether the use of undocumented register is safe or not - maybe some HW bug exists.
> > 
> > I see, that makes sense. Would it be possible then to introduce a new
> > compatible, e.g. samsung,exynos4210-fimd-ext which can be used on tested
> 
> Seems providing a new compatible is not a good idea.
> 
> > devices? I know that some other Galaxy Note and S devices with the
> > exynos4 chip have the same problem (and solution).
> 
> Could you give me more details about the same problem and its solution on the devices?
> It would be useful for us to decide the upstream direction.
>
> If necessary then we may need to contact HW engineer for clarity.

Here is my current understanding of the situation:

The issue is related to Android and a recovery image having conflicting
pixel formats on the same device. There is a solution in Replicant[1]
for this using parameters for the fimd driver to force the pixel format
to RGB or BGR. It's using the PNRMODE register on VIDCON0, but this
solution needs two separate kernels to be built to add the parameter as
the boot loader is not adjustable.

This was also discussed in dri-devel irc and it was proposed to expose
both formats and fail the atomic commit if userspace tried to use both
RGB and BGR formats at the same time. With this approach there should be
something on the screen but it might happen that some users can't deal
with the failing commits as it's rather difficult to find the cause and
fix it on the go.

After that I accidentally discovered this undocumented register while
reading the old vendor sources and it seems that it fixes all the
issues. At least if there are no HW bugs as you mentioned.

Kind Regards
Martin

[1] https://git.replicant.us/replicant-next/kernel_replicant_linux/commit/?h=replicant-11&id=cc5a0615b40cd5ede1eb87a60daa50333701a135

> 
> Thanks,
> Inki Dae
> 
> > 
> >>
> >> Anyway, I'd like to recommend you to use documented register only.
> >>
> >> Sorry for late and thanks,
> >> Inki Dae
> > 
> > Kind Regards
> > Martin
> > 
> >>
> >> 22. 1. 30. 07:01에 Martin Jücker 이(가) 쓴 글:
> >>> In the downstream kernels for exynos4 and exynos5 devices, there is an
> >>> undocumented register that controls the order of the RGB output. It can
> >>> be set to either normal order or reversed, which enables BGR support for
> >>> those SoCs.
> >>>
> >>> This patch enables the BGR support for all the SoCs that were found to
> >>> have at least one device with this logic in the corresponding downstream
> >>> kernels.
> >>>
> >>> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> >>> ---
> >>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 42 ++++++++++++++++++++++--
> >>>  include/video/samsung_fimd.h             |  4 +++
> >>>  2 files changed, 44 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> >>> index c735e53939d8..cb632360c968 100644
> >>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> >>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> >>> @@ -109,6 +109,7 @@ struct fimd_driver_data {
> >>>  	unsigned int has_dp_clk:1;
> >>>  	unsigned int has_hw_trigger:1;
> >>>  	unsigned int has_trigger_per_te:1;
> >>> +	unsigned int has_bgr_support:1;
> >>>  };
> >>>  
> >>>  static struct fimd_driver_data s3c64xx_fimd_driver_data = {
> >>> @@ -138,6 +139,7 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
> >>>  	.lcdblk_bypass_shift = 1,
> >>>  	.has_shadowcon = 1,
> >>>  	.has_vtsel = 1,
> >>> +	.has_bgr_support = 1,
> >>>  };
> >>>  
> >>>  static struct fimd_driver_data exynos5_fimd_driver_data = {
> >>> @@ -149,6 +151,7 @@ static struct fimd_driver_data exynos5_fimd_driver_data = {
> >>>  	.has_vidoutcon = 1,
> >>>  	.has_vtsel = 1,
> >>>  	.has_dp_clk = 1,
> >>> +	.has_bgr_support = 1,
> >>>  };
> >>>  
> >>>  static struct fimd_driver_data exynos5420_fimd_driver_data = {
> >>> @@ -162,6 +165,7 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
> >>>  	.has_vtsel = 1,
> >>>  	.has_mic_bypass = 1,
> >>>  	.has_dp_clk = 1,
> >>> +	.has_bgr_support = 1,
> >>>  };
> >>>  
> >>>  struct fimd_context {
> >>> @@ -226,6 +230,18 @@ static const uint32_t fimd_formats[] = {
> >>>  	DRM_FORMAT_ARGB8888,
> >>>  };
> >>>  
> >>> +static const uint32_t fimd_extended_formats[] = {
> >>> +	DRM_FORMAT_C8,
> >>> +	DRM_FORMAT_XRGB1555,
> >>> +	DRM_FORMAT_XBGR1555,
> >>> +	DRM_FORMAT_RGB565,
> >>> +	DRM_FORMAT_BGR565,
> >>> +	DRM_FORMAT_XRGB8888,
> >>> +	DRM_FORMAT_XBGR8888,
> >>> +	DRM_FORMAT_ARGB8888,
> >>> +	DRM_FORMAT_ABGR8888,
> >>> +};
> >>> +
> >>>  static const unsigned int capabilities[WINDOWS_NR] = {
> >>>  	0,
> >>>  	EXYNOS_DRM_PLANE_CAP_WIN_BLEND | EXYNOS_DRM_PLANE_CAP_PIX_BLEND,
> >>> @@ -673,21 +689,25 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
> >>>  		val |= WINCONx_BYTSWP;
> >>>  		break;
> >>>  	case DRM_FORMAT_XRGB1555:
> >>> +	case DRM_FORMAT_XBGR1555:
> >>>  		val |= WINCON0_BPPMODE_16BPP_1555;
> >>>  		val |= WINCONx_HAWSWP;
> >>>  		val |= WINCONx_BURSTLEN_16WORD;
> >>>  		break;
> >>>  	case DRM_FORMAT_RGB565:
> >>> +	case DRM_FORMAT_BGR565:
> >>>  		val |= WINCON0_BPPMODE_16BPP_565;
> >>>  		val |= WINCONx_HAWSWP;
> >>>  		val |= WINCONx_BURSTLEN_16WORD;
> >>>  		break;
> >>>  	case DRM_FORMAT_XRGB8888:
> >>> +	case DRM_FORMAT_XBGR8888:
> >>>  		val |= WINCON0_BPPMODE_24BPP_888;
> >>>  		val |= WINCONx_WSWP;
> >>>  		val |= WINCONx_BURSTLEN_16WORD;
> >>>  		break;
> >>>  	case DRM_FORMAT_ARGB8888:
> >>> +	case DRM_FORMAT_ABGR8888:
> >>>  	default:
> >>>  		val |= WINCON1_BPPMODE_25BPP_A1888;
> >>>  		val |= WINCONx_WSWP;
> >>> @@ -695,6 +715,18 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
> >>>  		break;
> >>>  	}
> >>>  
> >>> +	switch (pixel_format) {
> >>> +	case DRM_FORMAT_XBGR1555:
> >>> +	case DRM_FORMAT_XBGR8888:
> >>> +	case DRM_FORMAT_ABGR8888:
> >>> +	case DRM_FORMAT_BGR565:
> >>> +		writel(WIN_RGB_ORDER_REVERSE, ctx->regs + WIN_RGB_ORDER(win));
> >>> +		break;
> >>> +	default:
> >>> +		writel(WIN_RGB_ORDER_FORWARD, ctx->regs + WIN_RGB_ORDER(win));
> >>> +		break;
> >>> +	}
> >>> +
> >>>  	/*
> >>>  	 * Setting dma-burst to 16Word causes permanent tearing for very small
> >>>  	 * buffers, e.g. cursor buffer. Burst Mode switching which based on
> >>> @@ -1074,8 +1106,14 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
> >>>  	ctx->drm_dev = drm_dev;
> >>>  
> >>>  	for (i = 0; i < WINDOWS_NR; i++) {
> >>> -		ctx->configs[i].pixel_formats = fimd_formats;
> >>> -		ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
> >>> +		if (ctx->driver_data->has_bgr_support) {
> >>> +			ctx->configs[i].pixel_formats = fimd_extended_formats;
> >>> +			ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_extended_formats);
> >>> +		} else {
> >>> +			ctx->configs[i].pixel_formats = fimd_formats;
> >>> +			ctx->configs[i].num_pixel_formats = ARRAY_SIZE(fimd_formats);
> >>> +		}
> >>> +
> >>>  		ctx->configs[i].zpos = i;
> >>>  		ctx->configs[i].type = fimd_win_types[i];
> >>>  		ctx->configs[i].capabilities = capabilities[i];
> >>> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> >>> index c4a93ce1de48..e6966d187591 100644
> >>> --- a/include/video/samsung_fimd.h
> >>> +++ b/include/video/samsung_fimd.h
> >>> @@ -476,6 +476,10 @@
> >>>   * 1111		-none-	 -none-   -none-   -none-    -none-
> >>>  */
> >>>  
> >>> +#define WIN_RGB_ORDER(_win)			(0x2020 + ((_win) * 4))
> >>> +#define WIN_RGB_ORDER_FORWARD			(0 << 11)
> >>> +#define WIN_RGB_ORDER_REVERSE			(1 << 11)
> >>> +
> >>>  /* FIMD Version 8 register offset definitions */
> >>>  #define FIMD_V8_VIDTCON0	0x20010
> >>>  #define FIMD_V8_VIDTCON1	0x20014
> > 
