Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04A6560FF0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 06:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD44E10F1D8;
	Thu, 30 Jun 2022 04:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AF310F1D5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 04:16:20 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220630041617epoutp0292882b25975269399feb32f3ff0ff257~9SuM0e0DR1635916359epoutp02i
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 04:16:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220630041617epoutp0292882b25975269399feb32f3ff0ff257~9SuM0e0DR1635916359epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1656562577;
 bh=WYo+8++U2XG7rGkYKmdbzvrC7WI9k8fTzCRkX5FeOR8=;
 h=From:To:In-Reply-To:Subject:Date:References:From;
 b=RZlHy7Y3RgnXhaktEJeZTYJEACo5Npfj7cDGJSAcSo/BLwvC/pj5J3K2imVX0tkKH
 GUCoQNo1GxlOExUzhIxee1LDT2+99C3IgXBxXASvSIwzppfkAg61ZfGJMtm1/y76Zt
 W7BRmC/gImTvvm8kqUnd74xcaI6wJm6VwxuXAEoo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220630041617epcas1p2e6c393b9dd489291a46448eb94d680cb~9SuMRhUi91655416554epcas1p23;
 Thu, 30 Jun 2022 04:16:17 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.237]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4LYQ4c0Fkvz4x9Q3; Thu, 30 Jun
 2022 04:16:16 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 AA.26.10203.F832DB26; Thu, 30 Jun 2022 13:16:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220630041615epcas1p17a727ebc024297c2a5e6ed879abcef6d~9SuKz4mJP1022110221epcas1p1-;
 Thu, 30 Jun 2022 04:16:15 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220630041615epsmtrp1c20ff3825e2619240e59b05ce64a628c~9SuKynX7W1942119421epsmtrp1r;
 Thu, 30 Jun 2022 04:16:15 +0000 (GMT)
X-AuditID: b6c32a38-597ff700000027db-c2-62bd238f7c17
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 0A.B3.08802.F832DB26; Thu, 30 Jun 2022 13:16:15 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220630041615epsmtip2daa72489fc999f2f6cee0e9f8bcaaf03~9SuKdaJQY0204302043epsmtip2k;
 Thu, 30 Jun 2022 04:16:15 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHiL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?=
 <inki.dae@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Seung-Woo
 Kim'" <sw0312.kim@samsung.com>, "'Kyungmin Park'"
 <kyungmin.park@samsung.com>, "'David Airlie'" <airlied@linux.ie>, "'Daniel
 Vetter'" <daniel@ffwll.ch>, "'Rob Herring'" <robh+dt@kernel.org>,
 "'Krzysztof	Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>, "'Alim Akhtar'"
 <alim.akhtar@samsung.com>, "'Kishon Vijay Abraham I'" <kishon@ti.com>,
 "'Vinod	Koul'" <vkoul@kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-phy@lists.infradead.org>
In-Reply-To: <20220626163320.6393-1-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 1/2] drm/exynos: MAINTAINERS: move Joonyoung Shim to
 credits
Date: Thu, 30 Jun 2022 13:16:14 +0900
Message-ID: <0de401d88c38$23aeb8e0$6b0c2aa0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQJghn6p1dSqDKoivxgEEVwDdxk9yAKXUcLlrEKoniA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFJsWRmVeSWpSXmKPExsWy7bCmgW6/8t4kg+U3rSx6z51ksngwbxub
 xf9tE5kt5h85x2px5et7NosLT3vYLPpePGS22Pt6K7vF2aY37BabHl9jtbi8aw6bxYRV31gs
 Zpzfx2TRuvcIu8WMyS/ZLHbeOcHsIOCx99sCFo9NqzrZPO5c28Pmsf3bA1aP+93HmTw2L6n3
 6NuyitHj+I3tTB6fN8kFcEZl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl
 5qbaKrn4BOi6ZeYAvaGkUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAt0CtOzC0u
 zUvXy0stsTI0MDAyBSpMyM44/u4fa8FhgYrri3ayNzA+4O1i5OSQEDCRuPPpAUsXIxeHkMAO
 Ronl05cwQjifGCVOXT/OCuF8ZpSYOPk2K0zLvCsNUIldjBI3dx+Dcl4ySjRMecsIUsUmkCFx
 t30xWIeIwHxWiUfPk0FsTgFnies3X7GD2MICQRLv/v0FWs7BwSKgKnFhvSlImFfAUqJ17SsW
 CFtQ4uTMJ2A2s4CRxJLV85kgbHmJ7W/nMEMcpCDx8+kyVoi4iMTszjZmiLVWEmsWrQP7TULg
 BYfEh//fWCAaXCTeNfyAahaWeHV8CzuELSXxsr+NHaJhMqPEnesroLpnMEoc/nmdEaLKWGL/
 0slMELaixM7fcxkhVvNJvPvawwryjYQAr0RHmxBEiZLEsYs3oFolJC4smcgGUeIhcfBK7QRG
 xVlI/pyF5M9ZSP6cheS3BYwsqxjFUguKc9NTiw0LTODxnZyfu4kRnMi1LHYwzn37Qe8QIxMH
 4yFGCQ5mJRHehWd2JgnxpiRWVqUW5ccXleakFh9iNAWG/ERmKdHkfGAuySuJNzSxNDAxMzI2
 sTA0M1QS5+2dejpRSCA9sSQ1OzW1ILUIpo+Jg1OqgSmix9NS5+S5+y0vTjyenDJlhkTs50fT
 3V9fd21PNpCa4s/99fbH+GMiTO921co8DK79mfWIQ/PTdp0D9p7f0lRm7AyoZFZMm3He4Gqo
 htyn7HeqRlrXKl6fS1n166cOz92Vs7puGbBaPXGzv3LM6c/Vld+2KuamBHC4cv/68qnx4SH+
 9cvXrPomxTWJX5s90GiOapPWirTjzzz+8uy0V+w9OPmy5eXs1XwBFu+kk1hWPdn6eBZ/xfwP
 b68KROpaNatP3vCk2EixRPmM0Ju6O2uLpVVvR4dX/VE90DZRef6kyYX96XxlKYvuW8m85NeZ
 Wz9xVXq2Bvsm5rQnuhWeZmEypzftm5bGqh6yjHPtllAlluKMREMt5qLiRABvXwPAbQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsWy7bCSvG6/8t4kg/svRC16z51ksngwbxub
 xf9tE5kt5h85x2px5et7NosLT3vYLPpePGS22Pt6K7vF2aY37BabHl9jtbi8aw6bxYRV31gs
 Zpzfx2TRuvcIu8WMyS/ZLHbeOcHsIOCx99sCFo9NqzrZPO5c28Pmsf3bA1aP+93HmTw2L6n3
 6NuyitHj+I3tTB6fN8kFcEZx2aSk5mSWpRbp2yVwZRx/94+14LBAxfVFO9kbGB/wdjFyckgI
 mEjMu9LA2sXIxSEksINRYu+RZvYuRg6ghITElq0cEKawxOHDxRAlzxklnsxezAbSyyaQJjFp
 7n6wXhGB1awSV7asYoKomsIo8WHBEVaQKk4BZ4nrN1+xg9jCAgESO498BVvAIqAqcWG9KUiY
 V8BSonXtKxYIW1Di5MwnYDYz0HGNh7uhbHmJ7W/nMEMcrSDx8+kyVoi4iMTszjawuIiAlcSa
 RetYJjAKzUIyahaSUbOQjJqFpH0BI8sqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzg
 qNXS2sG4Z9UHvUOMTByMhxglOJiVRHgXntmZJMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJ
 eCGB9MSS1OzU1ILUIpgsEwenVAPT+Z9b5M9Pf6bJEb7wvd/y3W5mjyJdbdN9ft+sV+1Z8nDi
 oxeGpzvTJkZsvd3/Tf94X6Rft7R2eDnn9EPH+9lldFIseYL9Pyw90L5JKm2DgLPOOo5PizJe
 3XNzLf2mGCl7ev0muwIB8aT4F5r9a28+Eo/sZtz/dIuNSwfnkuz6e5sY/vjtljfpPXTr876u
 fycbl908m+OkkrSqw+aJvfmfSWos0gG8mx9O/jP5phCPu6+peIzeqobGc0ofMhViuubILex+
 uDEmx7lOOfuJ+Ov9jD0Kj8//8Nl0ep5/7lKby81qLVfnSL6tYNR9GaDZ+ujsinuTmZpXTjR0
 1Qt1n/qrmTN+xtTV6txHlLcE/qxWYinOSDTUYi4qTgQAKL4DqUkDAAA=
X-CMS-MailID: 20220630041615epcas1p17a727ebc024297c2a5e6ed879abcef6d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220626163558epcas1p3f525431b9fb237bd420ad1453daaf1ac
References: <CGME20220626163558epcas1p3f525431b9fb237bd420ad1453daaf1ac@epcas1p3.samsung.com>
 <20220626163320.6393-1-krzysztof.kozlowski@linaro.org>
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



> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
> Sent: Monday, June 27, 2022 1:33 AM
> To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> <sw0312.kim@samsung.com>; Kyungmin Park <kyungmin.park@samsung.com>; David
> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Alim Akhtar
<alim.akhtar@samsung.com>;
> Kishon Vijay Abraham I <kishon@ti.com>; Vinod Koul <vkoul@kernel.org>;
> linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-phy@lists.infradead.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Subject: [PATCH 1/2] drm/exynos: MAINTAINERS: move Joonyoung Shim to
> credits
> 
> Emails to Joonyoung Shim bounce ("550 5.1.1 Recipient address rejected:
> User unknown"), so move him to credits file.
> 

Applied.

Thanks,
Inki Dae

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  CREDITS     | 4 ++++
>  MAINTAINERS | 1 -
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/CREDITS b/CREDITS
> index 7e85a53b6a88..91a564c17012 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -3491,6 +3491,10 @@ D: wd33c93 SCSI driver (linux-m68k)
>  S: San Jose, California
>  S: USA
> 
> +N: Joonyoung Shim
> +E: y0922.shim@samsung.com
> +D: Samsung Exynos DRM drivers
> +
>  N: Robert Siemer
>  E: Robert.Siemer@gmx.de
>  P: 2048/C99A4289 2F DC 17 2E 56 62 01 C8  3D F2 AC 09 F2 E5 DD EE
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 19875f60ebb1..d208bf3b6f11 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6695,7 +6695,6 @@ F:	drivers/gpu/drm/bridge/
> 
>  DRM DRIVERS FOR EXYNOS
>  M:	Inki Dae <inki.dae@samsung.com>
> -M:	Joonyoung Shim <jy0922.shim@samsung.com>
>  M:	Seung-Woo Kim <sw0312.kim@samsung.com>
>  M:	Kyungmin Park <kyungmin.park@samsung.com>
>  L:	dri-devel@lists.freedesktop.org
> --
> 2.34.1


