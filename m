Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B31747B6D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 04:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7514410E0CE;
	Wed,  5 Jul 2023 02:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F41910E0CE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 02:10:44 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230705021041epoutp04861869fba583260e47bff350791f052e~u1sKS689q1337413374epoutp04K
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 02:10:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230705021041epoutp04861869fba583260e47bff350791f052e~u1sKS689q1337413374epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1688523041;
 bh=4E+MzmqOKL2RtSjlP0QIVLmiF2vs0swS5EIe841yo2E=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=hSt0rjUTI2r09JM/oYIRzPAGrq5AiQVpRUTb6pS4zCohp5bMMyzyKz1/OhaR1hkv1
 HLWhByt6hRjEn1bZO7rtOmquOsxfZbi927hgkvsXIeXP/B2HwBkkSfDLWOlJ8zyUGG
 GX4ajwjBcghgsD27brdTkxAUPEXRltU+oIURwi7M=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20230705021041epcas1p3c9816f14c108d50d56b77f31536a987f~u1sJ8WNa00837808378epcas1p3S;
 Wed,  5 Jul 2023 02:10:41 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.135]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Qwjmv70kFz4x9Pr; Wed,  5 Jul
 2023 02:10:39 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 86.88.12307.F11D4A46; Wed,  5 Jul 2023 11:10:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20230705021039epcas1p4e94d1de39688cf905452a04d2ed53959~u1sIdBUam0754707547epcas1p4G;
 Wed,  5 Jul 2023 02:10:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230705021039epsmtrp2d12b8fd3a52ef908527c7e39ccefd381~u1sIcJw_I0958409584epsmtrp2s;
 Wed,  5 Jul 2023 02:10:39 +0000 (GMT)
X-AuditID: b6c32a4c-cd7ff70000053013-52-64a4d11f3002
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 88.39.34491.F11D4A46; Wed,  5 Jul 2023 11:10:39 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230705021039epsmtip2ac67d7b1ff03b5cf87e11c4fc4fe5b2a~u1sIJ7YET1774717747epsmtip2i;
 Wed,  5 Jul 2023 02:10:39 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHiL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?=
 <inki.dae@samsung.com>
To: "'Thomas Zimmermann'" <tzimmermann@suse.de>, <javierm@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>
In-Reply-To: <20230704160133.20261-6-tzimmermann@suse.de>
Subject: RE: [PATCH 05/10] drm/exynos: Use fbdev DMA helpers
Date: Wed, 5 Jul 2023 11:10:39 +0900
Message-ID: <00ec01d9aee5$e4c35290$ae49f7b0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQHuhM/LBRmP0P1z6R6SIKtY9iGhpwG3SkJIAXEc4UKvZ3zNMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLJsWRmVeSWpSXmKPExsWy7bCmvq78xSUpBn+emFs8mLeNzeLK1/ds
 FgunLWe02Pt6K7vF2aY37BabHl9jtTjR94HVYsb5fUwWnV9mAZV83Mpi0da5DCg2+SWbxZY3
 E1kdeD02repk87hzbQ+bx7yTgR73u48zeWxeUu/xft9VNo++LasYPTafrvb4vEkugDMq2yYj
 NTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6GolhbLEnFKg
 UEBicbGSvp1NUX5pSapCRn5xia1SakFKToFpgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbGvma9
 ggNiFbc2bWRrYPwv1MXIySEhYCLR93QfWxcjF4eQwB5GiTXPfrCDJIQEPjFK/NxtD2F/Y5TY
 OZ8fpuHE5POMEA17GSWufv7DClH0klFiwzFrEJtNIEPibvtiVpAiEYEmRokZ79vBHGaBX0wS
 Pw6tZQap4hSwlLjas4gNxBYWsJFYtuwJ2GoWARWJlvsHwWxeoJqelY9ZIGxBiZMzn4DZzAJG
 EktWz2eCsOUltr+dwwxxnoLEz6fLWCHiIhKzO9vA4iICThLv+06xgBwhIXCDQ2Lv7QmsEA0u
 Ep37+9kgbGGJV8e3sEPYUhKf3+1lg2iYzChx5/oKqO4ZjBKHf15nhKgylti/dDIThK0osfP3
 XEaI1XwS7772AG3gAIrzSnS0QUNbSeLYxRtQrRISF5ZMZJvAqDQLyXOzkDw3C8lzs5A8tICR
 ZRWjVGpBcW56arJhgaFuXmo5PM6T83M3MYLTtZbPDsbv6//qHWJk4mA8xCjBwawkwrvi++IU
 Id6UxMqq1KL8+KLSnNTiQ4ymwDCfyCwlmpwPzBh5JfGGJpYGJmZGxiYWhmaGSuK8MZ/aU4QE
 0hNLUrNTUwtSi2D6mDg4pRqYHLdatfLM3d1pnn+t0M3p1v7a2N3b5kctdNxvLhuYIPSkNfqG
 5ItI85NsxRvCTA5mySit6hRtlBVYIWLFaeY++8n62Rt/hZW69rx4I1ldrOKt+nM3S1k9Y+EM
 iyr9WL41bj/Lc3yW359zbrfkQ+kdyamSwtonRFh2HrfddUvzZLoiw/U19+YLs3NrB8s/4z5x
 1Vfma82mgufpQfMUA6ZL5QpO2iS+K2ZXfuZGFgfH7ZuiA09ES2r+3nTVn+WI6e2nMqKZR4va
 Q+apqUi72fNuVTF890K0dJd09LyFczRmdrOWRk48wny+pvlHqYGuVvMJNc7TXpLnlOYdmSL7
 tHfxC+2th5ekiR1YKjj5bJkSS3FGoqEWc1FxIgDmXc/7YAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsWy7bCSvK78xSUpBh3HxC0ezNvGZnHl63s2
 i4XTljNa7H29ld3ibNMbdotNj6+xWpzo+8BqMeP8PiaLzi+zgEo+bmWxaOtcBhSb/JLNYsub
 iawOvB6bVnWyedy5tofNY97JQI/73ceZPDYvqfd4v+8qm0ffllWMHptPV3t83iQXwBnFZZOS
 mpNZllqkb5fAlbGvWa/ggFjFrU0b2RoY/wt1MXJySAiYSJyYfJ6xi5GLQ0hgN6PE6y8tTF2M
 HEAJCYktWzkgTGGJw4eLIUqeM0p8PD6NGaSXTSBNYtLc/awgCRGBNkaJRx//gznMAg3MEgtP
 rWaHaNnOKLFizhlGkBZOAUuJqz2L2EBsYQEbiWXLnrCD2CwCKhIt9w+C2bxANT0rH7NA2IIS
 J2c+AbOZgU5tPNwNZctLbH87hxniBQWJn0+XsULERSRmd7aBxUUEnCTe951imcAoPAvJqFlI
 Rs1CMmoWkvYFjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCo1VLcwfj9lUf9A4x
 MnEwHmKU4GBWEuFd8X1xihBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe8Re9KUIC6YklqdmpqQWp
 RTBZJg5OqQYmtjPHOFyrTqzzsTEU1C6J+Xj1REpr6NmQUBW/26m3qiZ72/hGPrJ2XN/lOdmj
 votH++pRvWsPYjbonHY2yIpIq1jQcfCTjZjCfY4Py673P1Fki3B8eXVeaM3Cq1wZ96rm3tj6
 /G3k2czge3aHFvucvcSbqX6Uo088LH/d7GBVx+ZJfBxn3oR94jIRvJ20dXuFgFD2rCXR4TPl
 nSf18IZ+n6l8v+B1MkfQR5bQu5+vbn4rcKhtBve19OTNrT3fjnX/7V++n2Va+KzXrg133zNs
 T/2atNLVO26r1hlR3oTDKh96vF/m/4vMSOSNTHoiv583Tqpxmt2ZH1Xnln/Ym6q7/GgL//8f
 t8O/zFdxcr2sxFKckWioxVxUnAgAr5utA0UDAAA=
X-CMS-MailID: 20230705021039epcas1p4e94d1de39688cf905452a04d2ed53959
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230704160141epcas1p1059d0c1b202ddb900c530a47247824fc
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <CGME20230704160141epcas1p1059d0c1b202ddb900c530a47247824fc@epcas1p1.samsung.com>
 <20230704160133.20261-6-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Seung-Woo
 Kim' <sw0312.kim@samsung.com>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, 'Kyungmin	Park' <kyungmin.park@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> -----Original Message-----
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Sent: Wednesday, July 5, 2023 12:50 AM
> To: javierm@redhat.com; maarten.lankhorst@linux.intel.com;
> mripard@kernel.org
> Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; linux-tegra@vger.kernel.org; linux-
> fbdev@vger.kernel.org; Thomas Zimmermann <tzimmermann@suse.de>; Inki Dae
> <inki.dae@samsung.com>; Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin
> Park <kyungmin.park@samsung.com>; Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>; Alim Akhtar <alim.akhtar@samsung.com>
> Subject: [PATCH 05/10] drm/exynos: Use fbdev DMA helpers
> 
> Use fbdev's DMA helpers for fbdev emulation. They drivers previously
> used the I/O-memory helpers, while allocating DMA-able system memory.
> This could (in theory) result in bus errors from accessing the memory
> range.
> 
> This bug has been present since the exynos driver was first added.

Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 1c248b7d2960 ("DRM: add DRM Driver for Samsung SoC EXYNOS4210.")
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Kconfig            | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig
> b/drivers/gpu/drm/exynos/Kconfig
> index 7ca7e1dab52c..661b42ad4873 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -7,7 +7,7 @@ config DRM_EXYNOS
>  	select DRM_DISPLAY_HELPER if DRM_EXYNOS_DP
>  	select DRM_KMS_HELPER
>  	select VIDEOMODE_HELPERS
> -	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
> +	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
>  	select SND_SOC_HDMI_CODEC if SND_SOC
>  	help
>  	  Choose this option if you have a Samsung SoC Exynos chipset.
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index fdf65587f1fe..7ca3424b59ce 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -49,9 +49,9 @@ static void exynos_drm_fb_destroy(struct fb_info *info)
> 
>  static const struct fb_ops exynos_drm_fb_ops = {
>  	.owner		= THIS_MODULE,
> -	__FB_DEFAULT_IO_OPS_RDWR,
> +	__FB_DEFAULT_DMA_OPS_RDWR,
>  	DRM_FB_HELPER_DEFAULT_OPS,
> -	__FB_DEFAULT_IO_OPS_DRAW,
> +	__FB_DEFAULT_DMA_OPS_DRAW,
>  	.fb_mmap        = exynos_drm_fb_mmap,
>  	.fb_destroy	= exynos_drm_fb_destroy,
>  };
> --
> 2.41.0


