Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBB64D2482
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 23:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780F710E1C0;
	Tue,  8 Mar 2022 22:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D398010E1C0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 22:52:29 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220308225228euoutp02e6ea57ab332c714b5f0cc07da55bfa39~aiaNGRGTg1408214082euoutp02H
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 22:52:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220308225228euoutp02e6ea57ab332c714b5f0cc07da55bfa39~aiaNGRGTg1408214082euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1646779948;
 bh=EBbI8yQ4WFkYljbWnvurikHt7n6iLk/5KwMVTWAyASE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Z/h2MqjpSvVfp9W0E8hIBxEWQ+RfD2tiruvh03hNK0GZC4uq2YTmXmgOrX7AZHIxg
 W809s2puWcTs+FDr4FNTu02yqtFGF9VnV5w5tlkN8sR+lL/Az6YoUnjXRKIoDqEpB/
 uOaWmXLshRP5J2EJLw7HwUJauG7/MOdWgeJDdiqk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220308225227eucas1p1d476304358db8421cdeb64f8d1ef8f84~aiaMQi-P41052010520eucas1p1_;
 Tue,  8 Mar 2022 22:52:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A8.36.10260.B2ED7226; Tue,  8
 Mar 2022 22:52:27 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141~aiaLEGaVC1086810868eucas1p1v;
 Tue,  8 Mar 2022 22:52:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220308225225eusmtrp2ae38a0905a6a3d789dcf472d78af97c5~aiaLDXpT-2878628786eusmtrp2l;
 Tue,  8 Mar 2022 22:52:25 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-39-6227de2b5fe3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E2.80.09404.92ED7226; Tue,  8
 Mar 2022 22:52:25 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220308225225eusmtip243690e8bf371446869e504166e81ca35~aiaKbSzpA0392603926eusmtip2w;
 Tue,  8 Mar 2022 22:52:25 +0000 (GMT)
Message-ID: <21110de8-d52a-e55e-8853-1f073c4ab969@samsung.com>
Date: Tue, 8 Mar 2022 23:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [v3,4/5] fbdev: Improve performance of cfb_imageblit()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 javierm@redhat.com, geert@linux-m68k.org, sam@ravnborg.org,
 kraxel@redhat.com, ppaalanen@gmail.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220223193804.18636-5-tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7djPc7ra99STDLrfM1v83zaR2eL+p9uM
 Fle+vmezeHZrL5PFwmnLGYGsk8wWJ/o+sFq0tlVbrPi5ldFiy5uJrA5cHnu/LWDx2DnrLrvH
 h49xHocOdzB63O8+zuSxZNpVNo/3+4DE5tPVHp83yQVwRnHZpKTmZJalFunbJXBlnLi0j7Xg
 i3LFju7fzA2Mx6S7GDk5JARMJFZMvsTcxcjFISSwglHi/cwOVpCEkMAXRolrn/IhEp8ZJf7+
 6GOF6Xj15T5Ux3JGielnFrBCOB8ZJRbf/cYGUsUrYCdx6+JxdhCbRUBFYvqaBkaIuKDEyZlP
 WEBsUYEkiQcH+sBqhAWcJf69fwNWwywgLnHryXwmkKEiApsZJRoOtTJBJBwk/nUsBlvAJmAo
 0fW2C8zmFLCUeLzvJ1SNvMT2t3PAzpMQaOeU+L6hF+puF4k/B5YyQ9jCEq+Ob2GHsGUk/u+E
 2CYh0Mwo8fDcWnYIp4dR4nLTDEaIKmuJO+d+Aa3jAFqhKbF+lz5E2FFi2oV2JpCwhACfxI23
 ghBH8ElM2jadGSLMK9HRJgRRrSYx6/g6uLUHL1xinsCoNAspXGYh+X8WkndmIexdwMiyilE8
 tbQ4Nz212DgvtVyvODG3uDQvXS85P3cTIzCNnf53/OsOxhWvPuodYmTiYDzEKMHBrCTCe/+8
 SpIQb0piZVVqUX58UWlOavEhRmkOFiVx3uTMDYlCAumJJanZqakFqUUwWSYOTqkGppUb9T81
 /ldbe9r6wNVH1xk+/GHxDlD6ocR3VXpKqVfVzgV3HrXqBzfdYtO3LvEMlLG0CJx95+uCu8Hp
 ST03q49OV1/6SEvp9zG5V4q7dp3efedYB4dzOeOpiPPLzH/OeD85taqbY63apcj17DwC0/cc
 ZWj4mMQlJmBeFB55fFK9+K+OdxqXDatc9wvONFq6J9HGJrjq8bxli9eVzWcp/s34ITwzKu5i
 Y4Ht/eyEuWoOgW1axdpsP24+DuTZ5tGqlWlbuO3rdI/uF/V/pz7p9Onqravxn769eNIys4AF
 nPLb7i5dv6v1Qz8795mZ0/cdrTML2c5vcEt5/VbHl1eNbVQv/i9+ecT/5n9fqaPeiUosxRmJ
 hlrMRcWJAKGPYsvSAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xe7qa99STDL6v07f4v20is8X9T7cZ
 La58fc9m8ezWXiaLhdOWMwJZJ5ktTvR9YLVobau2WPFzK6PFljcTWR24PPZ+W8DisXPWXXaP
 Dx/jPA4d7mD0uN99nMljybSrbB7v9wGJzaerPT5vkgvgjNKzKcovLUlVyMgvLrFVija0MNIz
 tLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLOHFpH2vBF+WKHd2/mRsYj0l3MXJySAiY
 SLz6cp8ZxBYSWMoocfGWLERcRuLktAZWCFtY4s+1LrYuRi6gmveMEjv+vgdr4BWwk7h18Tg7
 iM0ioCIxfU0DI0RcUOLkzCcsILaoQJLEy20bwQYJCzhL/Hv/BqyGWUBc4taT+UwgQ0UENjNK
 THwEMZRZwEHiX8diNoiLLCRm/jsLFmcTMJToetsFFucUsJR4vO8nE0S9mUTX1i6oofIS29/O
 YZ7AKDQLyR2zkOybhaRlFpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQKjdtuxn1t2
 MK589VHvECMTB+MhRgkOZiUR3vvnVZKEeFMSK6tSi/Lji0pzUosPMZoCA2Mis5Rocj4wbeSV
 xBuaGZgamphZGphamhkrifN6FnQkCgmkJ5akZqemFqQWwfQxcXBKNTBtv8H6oeIE/z1DU9nf
 X0Rnzzv2S1BQfsclxcAnBd7dH4ydTfb/qZN/uOGu6d2ZV4Kv3rfc+Veg9QPXtRMLulXsrlgZ
 LNR91tjO5vm9smjSHe4Ftk7Lvq+8ocJ0TzvDnEXowoavk26sDs3uvJTte7LzsgSPAa9WXKSF
 8wmx6cs+iFgvXHZcu639NZd/TObebROWScZ6Tl/AsV7q26alzccepE5MVjj871HCWwu24BTF
 4Cnfv1d4rw//db4m9aT0v4+zm9QvFmy6k5RffvTyH67WuKxHcq2rHBaZ5Bfvlo7v9OD6y5jK
 4HhizlGmb6rWec673G7IzOCzq+Fwl9/NX+19Ss5Id5NHwYVKo98T75xTYinOSDTUYi4qTgQA
 +1HBlGMDAAA=
X-CMS-MailID: 20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141
References: <20220223193804.18636-5-tzimmermann@suse.de>
 <CGME20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141@eucas1p1.samsung.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 23.02.2022 20:38, Thomas Zimmermann wrote:
> Improve the performance of cfb_imageblit() by manually unrolling
> the inner blitting loop and moving some invariants out. The compiler
> failed to do this automatically. This change keeps cfb_imageblit()
> in sync with sys_imagebit().
>
> A microbenchmark measures the average number of CPU cycles
> for cfb_imageblit() after a stabilizing period of a few minutes
> (i7-4790, FullHD, simpledrm, kernel with debugging).
>
> cfb_imageblit(), new: 15724 cycles
> cfb_imageblit(): old: 30566 cycles
>
> In the optimized case, cfb_imageblit() is now ~2x faster than before.
>
> v3:
> 	* fix commit description (Pekka)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
This patch landed recently in linux next-20220308 as commit 0d03011894d2 
("fbdev: Improve performance of cfb_imageblit()"). Sadly it causes a 
freeze after DRM and emulated fbdev initialization on various Samsung 
Exynos ARM 32bit based boards. This happens when kernel is compiled from 
exynos_defconfig. Surprisingly when kernel is compiled from 
multi_v7_defconfig all those boards boot fine, so this is a matter of 
one of the debugging options enabled in the exynos_defconfig. I will try 
to analyze this further and share the results. Reverting $subject on top 
of next-20220308 fixes the boot issue.
> ---
>   drivers/video/fbdev/core/cfbimgblt.c | 51 +++++++++++++++++++++++-----
>   1 file changed, 42 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/cfbimgblt.c b/drivers/video/fbdev/core/cfbimgblt.c
> index 01b01a279681..7361cfabdd85 100644
> --- a/drivers/video/fbdev/core/cfbimgblt.c
> +++ b/drivers/video/fbdev/core/cfbimgblt.c
> @@ -218,23 +218,29 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
>   {
>   	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
>   	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
> -	u32 bit_mask, end_mask, eorx, shift;
> +	u32 bit_mask, eorx;
>   	const char *s = image->data, *src;
>   	u32 __iomem *dst;
>   	const u32 *tab = NULL;
> +	size_t tablen;
> +	u32 colortab[16];
>   	int i, j, k;
>   
>   	switch (bpp) {
>   	case 8:
>   		tab = fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
> +		tablen = 16;
>   		break;
>   	case 16:
>   		tab = fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
> +		tablen = 4;
>   		break;
>   	case 32:
> -	default:
>   		tab = cfb_tab32;
> +		tablen = 2;
>   		break;
> +	default:
> +		return;
>   	}
>   
>   	for (i = ppw-1; i--; ) {
> @@ -248,15 +254,42 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
>   	eorx = fgx ^ bgx;
>   	k = image->width/ppw;
>   
> -	for (i = image->height; i--; ) {
> -		dst = (u32 __iomem *) dst1, shift = 8; src = s;
> +	for (i = 0; i < tablen; ++i)
> +		colortab[i] = (tab[i] & eorx) ^ bgx;
>   
> -		for (j = k; j--; ) {
> -			shift -= ppw;
> -			end_mask = tab[(*src >> shift) & bit_mask];
> -			FB_WRITEL((end_mask & eorx)^bgx, dst++);
> -			if (!shift) { shift = 8; src++; }
> +	for (i = image->height; i--; ) {
> +		dst = (u32 __iomem *)dst1;
> +		src = s;
> +
> +		switch (ppw) {
> +		case 4: /* 8 bpp */
> +			for (j = k; j; j -= 2, ++src) {
> +				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
> +			}
> +			break;
> +		case 2: /* 16 bpp */
> +			for (j = k; j; j -= 4, ++src) {
> +				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
> +			}
> +			break;
> +		case 1: /* 32 bpp */
> +			for (j = k; j; j -= 8, ++src) {
> +				FB_WRITEL(colortab[(*src >> 7) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 5) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 3) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 1) & bit_mask], dst++);
> +				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
> +			}
> +			break;
>   		}
> +
>   		dst1 += p->fix.line_length;
>   		s += spitch;
>   	}

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

