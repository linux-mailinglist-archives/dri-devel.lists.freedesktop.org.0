Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B954A74A8B6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 04:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504AF10E4EB;
	Fri,  7 Jul 2023 02:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4787910E4EB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 02:01:34 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230707020130epoutp04c8539f628ccbc9690c2999fe88f1a1dd~vc2uIGf7m0310303103epoutp04x
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 02:01:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230707020130epoutp04c8539f628ccbc9690c2999fe88f1a1dd~vc2uIGf7m0310303103epoutp04x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1688695291;
 bh=PelmqNjPk6oGqr+lcQscDDbKwoYt8iFv7lsSXZ03UmI=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=luyfCIl3bXzuI5QT1nWtKOisZrTtU+AP598MGtr7llexDzg7QLTvlu51sbumiqhyl
 r9EvnSkkUGBvXRKdEceZ2WR7RJqlisYMHPwBtWvPfQVztcSQUTaDXrCKhH5lC/Kl2V
 PxCNZlkf+2rWEf/RcxxBktdYu4cr1DfG8gXNeIe8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230707020130epcas1p23da995d70977a4d1729186a5652aa9c5~vc2tr7BDm2743927439epcas1p2u;
 Fri,  7 Jul 2023 02:01:30 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.135]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4QxxTP33qWz4x9Pv; Fri,  7 Jul
 2023 02:01:29 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 FA.9C.22933.7F177A46; Fri,  7 Jul 2023 11:01:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20230707020127epcas1p328fc9539cb01bf314f569e676c277f86~vc2q4MKf_1856118561epcas1p3b;
 Fri,  7 Jul 2023 02:01:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230707020127epsmtrp12d135f5243a3857ae29611840fcd0c98~vc2q3S9-R0210602106epsmtrp1E;
 Fri,  7 Jul 2023 02:01:27 +0000 (GMT)
X-AuditID: b6c32a39-a83ff70000005995-51-64a771f7a53e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 83.16.34491.7F177A46; Fri,  7 Jul 2023 11:01:27 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230707020127epsmtip20f142e261c01eca40e56dc0c4330cec4~vc2qmQ3cU0804308043epsmtip2j;
 Fri,  7 Jul 2023 02:01:27 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHiL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?=
 <inki.dae@samsung.com>
To: "'Thomas Zimmermann'" <tzimmermann@suse.de>, <javierm@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>
In-Reply-To: <20230706124905.15134-7-tzimmermann@suse.de>
Subject: RE: [PATCH v2 06/11] drm/exynos: Set fbdev FBINFO_VIRTFB flag
Date: Fri, 7 Jul 2023 11:01:27 +0900
Message-ID: <026c01d9b076$f090ef00$d1b2cd00$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQGcl+T1wpybQEf0N9BGhueYe3tDCQE/Zq+0Ao2EXCuwCVaXQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLJsWRmVeSWpSXmKPExsWy7bCmnu73wuUpBhPbDS0ezNvGZnHl63s2
 i4XTljNa7H29ld3ibNMbdotNj6+xWpzo+8BqMeP8PiaLzi+zgEo+bmWxaOtcBhSb/JLNYsub
 iawOvB6bVnWyedy5tofNY97JQI/73ceZPDYvqfd4v+8qm0ffllWMHptPV3t83iQXwBmVbZOR
 mpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdLWSQlliTilQ
 KCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj7v2/
 jAV7BCra7v1ibmDs4uti5OSQEDCRuPXrCWMXIxeHkMAORontV6+yQzifGCUmfZ/LCuF8Y5To
 ufeJGablw+O/bBCJvYwSm1d+YYFwXjJKHFw8lx2kik0gQ+Ju+2KwdhGBJkaJGe/bwRxmgV9M
 Ej8OrQWbxSlgKbHrwBEmEFtYwE2ibeEzsDiLgIrEry17wOK8QDVvTu5nhbAFJU7OfMICYjML
 GEksWT2fCcKWl9j+dg7UfQoSP58uY4WIi0jM7mwDi4sIOEncuf8R7FUJgTscEh+WdUA1uEjc
 X/gPyhaWeHV8CzuELSXxsr+NHaJhMqPEnesrWCCcGYwSh39eZ4SoMpbYv3QyE4StKLHz91xG
 iNV8Eu++9gCdwQEU55XoaBOCKFGSOHbxBlSrhMSFJRPZJjAqzULy3Cwkz81C8twsJA8tYGRZ
 xSiWWlCcm55abFhgCo/z5PzcTYzgdK1luYNx+tsPeocYmTgYDzFKcDArifAeO7MsRYg3JbGy
 KrUoP76oNCe1+BCjKTC8JzJLiSbnAzNGXkm8oYmlgYmZkbGJhaGZoZI477m3vSlCAumJJanZ
 qakFqUUwfUwcnFINTEqua06xiRRErXnivOXJ6V3BXZmM295VLiyd8qsrXyV3woLKH843e0UE
 etTvMOt3T3RYofdG99XrPRO5bsTcMby4ylooqW/CAkOBIvnFwXZzuorcl4h9Fnidu//2IqfT
 qp+KH0nob/omu8n+o1h4bqL/kt6UGoWHqw9fyn9+Ovd0f/D5D7OFT35jt/CevX/1l2DejTv3
 at0+5vFAg810n6dX7tx5oXJpR9NNhafyKq+Jn6gQ+V+udU9asjjf0mCTGpVeDu5T3Q/VZzPb
 cVvbzfW3kl3YEHzOYQfLiRWr4zjWB9sI3/q4Pl5neqyptpVfVli60qctPfr6Plpv9ly1r+AJ
 EZlqz+f5yONS86ODSizFGYmGWsxFxYkAXJUZb2AEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsWy7bCSvO73wuUpBju7JCwezNvGZnHl63s2
 i4XTljNa7H29ld3ibNMbdotNj6+xWpzo+8BqMeP8PiaLzi+zgEo+bmWxaOtcBhSb/JLNYsub
 iawOvB6bVnWyedy5tofNY97JQI/73ceZPDYvqfd4v+8qm0ffllWMHptPV3t83iQXwBnFZZOS
 mpNZllqkb5fAlTH3/l/Ggj0CFW33fjE3MHbxdTFyckgImEh8ePyXrYuRi0NIYDejxML+Pcxd
 jBxACQmJLVs5IExhicOHi0HKhQSeM0rMO6ELYrMJpElMmrufFaRVRKCNUeLRx/9gDrNAA7PE
 wlOr2SGGbmeU2Nx5jQWkhVPAUmLXgSNMILawgJtE28JnzCA2i4CKxK8te8DivEA1b06CjAWx
 BSVOznwC1ssMdGnj4W4oW15i+9s5zBAfKEj8fLqMFSIuIjG7sw0sLiLgJHHn/kfGCYzCs5CM
 moVk1Cwko2YhaV/AyLKKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4WrU0dzBuX/VB
 7xAjEwfjIUYJDmYlEd5jZ5alCPGmJFZWpRblxxeV5qQWH2KU5mBREucVf9GbIiSQnliSmp2a
 WpBaBJNl4uCUamDq5Vv+IuLKUY8d3xhu2BgyCjJkvrxX9O+kT/bXT7JFX60XG3x6vSNg/szA
 eM95F87Nmi3w1CzrllnjM4PnQp+rJC4/Tz3d8emCVIvKknjjZb2XpBadFb2RfuvVpapfvwXN
 4+4xqH/dO31x8hqDmdkdyQ8Y0v6LPMjnfNK/XYZzwUXD1qdSff/85KZnmt9sjmzZveD4+Zd2
 mx7pV27a8V+4YoPWy+o4HWnx1q4/797u1erb/WDCVIHfvqbf76w4MumC0SJhoZWHY3zntbxa
 kZC51vnGLwmnm/NLZbgq79hx7A3uu6SlraJ16uFFxpjyBheuLaWyFmJ2U/6dqC7c8MPGOlHk
 U5GPjuWOiuRGWY7dSizFGYmGWsxFxYkANMGVdUUDAAA=
X-CMS-MailID: 20230707020127epcas1p328fc9539cb01bf314f569e676c277f86
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230706125011epcas1p437211c1555189b16614f13aa212688db
References: <20230706124905.15134-1-tzimmermann@suse.de>
 <CGME20230706125011epcas1p437211c1555189b16614f13aa212688db@epcas1p4.samsung.com>
 <20230706124905.15134-7-tzimmermann@suse.de>
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
> Sent: Thursday, July 6, 2023 9:47 PM
> To: javierm@redhat.com; maarten.lankhorst@linux.intel.com;
> mripard@kernel.org
> Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; linux-tegra@vger.kernel.org; linux-
> fbdev@vger.kernel.org; Thomas Zimmermann <tzimmermann@suse.de>; Inki Dae
> <inki.dae@samsung.com>; Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin
> Park <kyungmin.park@samsung.com>; Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>; Alim Akhtar <alim.akhtar@samsung.com>
> Subject: [PATCH v2 06/11] drm/exynos: Set fbdev FBINFO_VIRTFB flag
> 
> Mark the framebuffer with FBINFO_VIRTFB. The framebuffer range is
> in DMA-able memory and should be accessed with the CPU's regular
> memory ops.
> 
> v2:
> 	* drop FBINFO_FLAG_DEFAULT
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 7ca3424b59ce..828318de8529 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -79,6 +79,7 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper
> *helper,
>  	offset = fbi->var.xoffset * fb->format->cpp[0];
>  	offset += fbi->var.yoffset * fb->pitches[0];
> 
> +	fbi->flags |= FBINFO_VIRTFB;
>  	fbi->screen_buffer = exynos_gem->kvaddr + offset;
>  	fbi->screen_size = size;
>  	fbi->fix.smem_len = size;
> --
> 2.41.0


