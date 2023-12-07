Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D288C807ECA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 03:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CC910E566;
	Thu,  7 Dec 2023 02:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A062F10E566
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 02:42:11 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20231207024209epoutp041dbd7e97284d1a81e877e077ed120acf~ebG4Wxmo40099700997epoutp04G
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 02:42:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20231207024209epoutp041dbd7e97284d1a81e877e077ed120acf~ebG4Wxmo40099700997epoutp04G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1701916929;
 bh=IJRjpRRYzV149bfbvJECvhSX5CQ/MPygVfCanhav1MM=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=E21Ds+KxrjjbHsAHZ/o42p+0DRhdhjlz14lXro/bGoor1iWqMNgiZamd+t2DqVZwA
 RN0Fk9ARGJD9pUtvHBJ3Me5rpNpPK6yJ+SyrhFuBzFFhFRwCAdhpcmOmx4BrlC2eKJ
 uIGIVZeA6JCNWjmMAP4PaVPulNTugeruLHEvZjeY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20231207024208epcas1p30d568f5b7e0786c61d9a6c93fb5d41b0~ebG4A3Wpl0202802028epcas1p3X;
 Thu,  7 Dec 2023 02:42:08 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.235]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Slz7h2h8Bz4x9Q0; Thu,  7 Dec
 2023 02:42:08 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 34.41.10025.00131756; Thu,  7 Dec 2023 11:42:08 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20231207024207epcas1p36f8fb90eb6532294ed8404775bf3687e~ebG3En9d12889228892epcas1p3F;
 Thu,  7 Dec 2023 02:42:07 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20231207024207epsmtrp1dc2889119dc469a8dab6328864e3b704~ebG3D4tRQ1912019120epsmtrp1R;
 Thu,  7 Dec 2023 02:42:07 +0000 (GMT)
X-AuditID: b6c32a39-9d9ff70000002729-a3-65713100552f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A8.1F.08817.FF031756; Thu,  7 Dec 2023 11:42:07 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20231207024207epsmtip1e99544dbb76e62b4c6348e722ee72504~ebG2yNRqV3205632056epsmtip1E;
 Thu,  7 Dec 2023 02:42:07 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHiL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?=
 <inki.dae@samsung.com>
To: "'Paul Cercueil'" <paul@crapouillou.net>, "'Seung-Woo Kim'"
 <sw0312.kim@samsung.com>, "'Kyungmin Park'" <kyungmin.park@samsung.com>,
 "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Alim Akhtar'"
 <alim.akhtar@samsung.com>
In-Reply-To: <20231206221841.15685-1-paul@crapouillou.net>
Subject: RE: [PATCH RESEND] drm/exynos: dpi: Change connector type to DPI
Date: Thu, 7 Dec 2023 11:42:07 +0900
Message-ID: <048a01da28b6$f84c2670$e8e47350$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQIJguOtbC01MD+M6xVIYNoCqQ5mrwKsgFS/sCkDq1A=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPJsWRmVeSWpSXmKPExsWy7bCmgS6DYWGqwc9vfBYnri9isngwbxub
 xf9tE5ktrnx9z2ax9/VWdouzTW/YLTY9vsZqcXnXHDaLGef3MVn0L77EYjFj8ks2B26P1Zfa
 2Tz2flvA4rFz1l12jzvX9rB53O8+zuSxeUm9R9+WVYwenzfJBXBEZdtkpCampBYppOYl56dk
 5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAB2qpFCWmFMKFApILC5W0rezKcov
 LUlVyMgvLrFVSi1IySkwLdArTswtLs1L18tLLbEyNDAwMgUqTMjOWPW7h61gEl/FwVUzGRsY
 X3F3MXJySAiYSDyf1cTWxcjFISSwg1Fi5fsVzBDOJ0aJk9vnMUI43xglWltPMMG0vLv5ASqx
 l1Hi9qNFUP0vGSW2/epnBKliE8iQuNu+mBUkIQIy6/vbk2BVzAKPGSVezD/ABlLFKWAlsWHl
 HzBbWMBTou3Ke6AdHBwsAioSPXfdQcK8ApYSy67/ZoSwBSVOznzCAmIzCxhJLFk9nwnClpfY
 /nYOM8R5ChI/ny5jhYiLSMzubAOLiwCtWrD8MzvIDRICRzgkpq89zArR4CIxrX8lC4QtLPHq
 +BZ2CFtK4mV/G1TDZEaJO9dXsEA4MxglDv+8zghRZSyxf+lkaMgoSuz8PZcRYjWfxLuvPawg
 30gI8Ep0tAlBlChJHLt4A6pVQuLCkolsExiVZiF5bhaS52YheW4WkocWMLKsYhRLLSjOTU8t
 NiwwhUd5cn7uJkZwStay3ME4/e0HvUOMTByMhxglOJiVRHhzzuenCvGmJFZWpRblxxeV5qQW
 H2I0BQb3RGYp0eR8YFbIK4k3NLE0MDEzMjaxMDQzVBLnPfe2N0VIID2xJDU7NbUgtQimj4mD
 U6qBSdFt4VqG/crpP7quqBhym8Vo/N3PZO+kZmHrmzapaHfelJLXf/SFHI4VPosTmZSzbcbx
 D6VzdgU0Ncf9fqr2K2SXYN+W+tvhoVvvd72zYBI58f9eudVkhjMxDht1L27fW5eZtLdV+vXZ
 9VcFWdMe7X1Y/f59c5igzXb5+eXPDRpvKXjrxey2+HKsq6yurm+BWtXCN9tUMs7yaR6Z6873
 5tgqv6dyNyZvO/xHL+35to2PdH49vp6WardfSfXnkxoBBSGuwL3dh29fu2QsNTdL5ORGedfy
 309cVjszRG5sfhv25YPiJs+uW4v0brdOlrl98cTbaxyf+29HbxdYkxf8/egfbjlj2bSuaKmY
 gzkGp5VYijMSDbWYi4oTAW42yc5SBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSnO5/g8JUgx0t+hYnri9isngwbxub
 xf9tE5ktrnx9z2ax9/VWdouzTW/YLTY9vsZqcXnXHDaLGef3MVn0L77EYjFj8ks2B26P1Zfa
 2Tz2flvA4rFz1l12jzvX9rB53O8+zuSxeUm9R9+WVYwenzfJBXBEcdmkpOZklqUW6dslcGWs
 +t3DVjCJr+LgqpmMDYyvuLsYOTkkBEwk3t38wAhiCwnsZpR43STcxcgBFJeQ2LKVA8IUljh8
 uBii4jmjxJt1ViA2m0CaxKS5+1m7GLk4RAS+MEq8fNAE5jCDFPW0/YKa2c0o8eyPDYjNKWAl
 sWHlHzYQW1jAU6LtynsmkAUsAioSPXfdQcK8ApYSy67/ZoSwBSVOznzCAmIzA53ZeLgbypaX
 2P52DjPE+QoSP58uY4WIi0jM7mwDi4sArVqw/DP7BEbhWUhGzUIyahaSUbOQtC9gZFnFKJla
 UJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcjVpaOxj3rPqgd4iRiYPxEKMEB7OSCG/O+fxU
 Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzfXvemCAmkJ5akZqemFqQWwWSZODilGpgYjyV8neG8
 v/6U5ifn+jUFe3dG8d2s25nV5y2rfbe6lTn1rke6ZeqViUwl3dOqDlqxrS3w2tL3ouv8IfXf
 rt2GzqdXq/Be/OD90fZSpvd0/9Q4w8++f5hendBWiU02snXKuvPOcd0VTcb31ltuljFpFpTp
 P4r7mhSZaC5z+pXDM1b/A/eepC8xnljAKLd4ZtHlOb35qx59DD7cvDwpdElvWs0353NbDVev
 5phZ3RLBsXZDRmqu2NlT3wUq0oouy2SujpYRlWk8vF3+k+WX9fotPp7vqgQitYu6Hzs97H5i
 05B/+9Df98ylIvvqNgQ8/Oznl1cycdbJ1ndp29fazlJI+mmxbd9WGZvZX4S3FCmxFGckGmox
 FxUnAgDP3VqHNQMAAA==
X-CMS-MailID: 20231207024207epcas1p36f8fb90eb6532294ed8404775bf3687e
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231206221903epcas1p2e9d90110b0f2901e3e7db86f748026f1
References: <CGME20231206221903epcas1p2e9d90110b0f2901e3e7db86f748026f1@epcas1p2.samsung.com>
 <20231206221841.15685-1-paul@crapouillou.net>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> -----Original Message-----
> From: Paul Cercueil <paul@crapouillou.net>
> Sent: Thursday, December 7, 2023 7:19 AM
> To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> <sw0312.kim@samsung.com>; Kyungmin Park <kyungmin.park@samsung.com>;
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Alim Akhtar
> <alim.akhtar@samsung.com>
> Cc: David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>;
> dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; Paul
> Cercueil <paul@crapouillou.net>
> Subject: [PATCH RESEND] drm/exynos: dpi: Change connector type to DPI
> 
> When exynos_drm_dpi.c was written, DRM_MODE_CONNECTOR_DPI did not exist
> yet and I guess that's the reason why DRM_MODE_CONNECTOR_VGA was used as
> the connector type.
> 
> However, now it makes more sense to use DRM_MODE_CONNECTOR_DPI as the
> connector type.

Sorry for late. Merged.

Thanks,
Inki Dae

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> index 378e5381978f..0dc36df6ada3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> @@ -101,7 +101,7 @@ static int exynos_dpi_create_connector(struct
> drm_encoder *encoder)
> 
>  	ret = drm_connector_init(encoder->dev, connector,
>  				 &exynos_dpi_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VGA);
> +				 DRM_MODE_CONNECTOR_DPI);
>  	if (ret) {
>  		DRM_DEV_ERROR(ctx->dev,
>  			      "failed to initialize connector with drm\n");
> --
> 2.42.0
> 


