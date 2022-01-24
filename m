Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E71F49784D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 06:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE1D10E212;
	Mon, 24 Jan 2022 05:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6AD10E212
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 05:10:48 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20220124051046epoutp049589f74b0f511ecd3ff2e02ccd686843~NHL8To-p81928919289epoutp04T
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 05:10:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20220124051046epoutp049589f74b0f511ecd3ff2e02ccd686843~NHL8To-p81928919289epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1643001046;
 bh=p7efwgi+o6DOZUqt3gtE70CSXnIkzdOfpRPHkrg3MuE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=W+aSUYk3C262tMxO8eJmFKfFk4VNzlB4oEOHVvTZNxMMkHRO+I5l63kNYkmY+CbH9
 GwpQQyiQNu1slfcan/4cqjc+rqkJmO4/VFaZ7l4qcA2glSyxeV9y9fbcdx0CwScdTj
 yCvGK2KrV1AgEZt6B13RhxwJp6yhi+VzBPVenUXo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220124051045epcas1p2da018639ba8c356644f72c43e68857ad~NHL78d_uu0675206752epcas1p21;
 Mon, 24 Jan 2022 05:10:45 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.145]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Jhyjs49pKz4x9QT; Mon, 24 Jan
 2022 05:10:41 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 F4.ED.28648.7C43EE16; Mon, 24 Jan 2022 14:10:31 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220124051030epcas1p11a048539e037eb2d4591af37638aaf76~NHLuQl7fT1600516005epcas1p1S;
 Mon, 24 Jan 2022 05:10:30 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220124051030epsmtrp11ac327b9a7f8f25d4f6819efda4f88ea~NHLuPL6Tq2455224552epsmtrp1S;
 Mon, 24 Jan 2022 05:10:30 +0000 (GMT)
X-AuditID: b6c32a39-003ff70000006fe8-4d-61ee34c7eb15
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 E4.3A.08738.6C43EE16; Mon, 24 Jan 2022 14:10:30 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220124051030epsmtip14e0e279154412cce4cba9049b50c50f6~NHLty0jHD0738407384epsmtip1J;
 Mon, 24 Jan 2022 05:10:30 +0000 (GMT)
Message-ID: <38886612-7d6a-42b4-2e3c-e0bb4294391b@samsung.com>
Date: Mon, 24 Jan 2022 14:22:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/exynos: Don't fail if no TE-gpio is defined for DSI
 driver
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
In-Reply-To: <20220121100039.17316-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmnu5xk3eJBms3illc+fqezWLj2x9M
 FjPO72OyWHvkLrtFW8t1dosZk1+yObB5zGroZfO4332cyaNvyypGjwcfSz0+b5ILYI3KtslI
 TUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBOkBJoSwxpxQo
 FJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BaoFecmFtcmpeul5daYmVoYGBkClSYkJ1xZeFx
 9oJnXBUrrl1hamD8ydHFyMkhIWAicfvwOdYuRi4OIYEdjBKzr61hgnA+MUrcbXzHDuF8ZpSY
 P2UnE0zL4UsToap2MUoseP6MGcJ5zyjx4PkJVpAqXgE7ie+nX4J1sAioSjx/0ggVF5Q4OfMJ
 C4gtKhAh8fLIX7AaYYFQidNHusFqmAXEJW49mQ8WFxEolZj7/xjYGcwCsxgldt2ayw6SYAMa
 OnHFfTYQmxNo2Z7Pe1ggmuUlmrfOBrtIQqCTQ+LwwdOMEHe7SMzYsJMdwhaWeHV8C5QtJfGy
 v40domEfo8TyXSehnMOMEs07m6G+NpbYv3QykM0BtEJTYv0ufYiwosTO33MZITbzSbz72sMK
 UiIhwCvR0SYEUaIkceziDagbJCQuLJnIBmF7SDTtn8w4gVFxFlLAzEIKgFlI/pmFsHgBI8sq
 RrHUguLc9NRiwwJTeIQn5+duYgSnTy3LHYzT337QO8TIxMF4iFGCg1lJhLcg/1WiEG9KYmVV
 alF+fFFpTmrxIUZTYPRMZJYSTc4HJvC8knhDE0sDEzMjYxMLQzNDJXHeVdNOJwoJpCeWpGan
 phakFsH0MXFwSjUweW+Mz5ycHn7cW4vnutxp84PXbz6wd53QIttg+TJLiWfvvrl8CrEc6138
 Fh8RX/Xx3RF9D2bTMKkbJ2YsXnTtS8RaiU31mVn7Ftm+lZ+Rz104r1P/kvHu5Sllj638V82M
 XRZ6PaDokn/79vk1Cy+Wn2l0zn8tEPk0rHCvyQ6FXQrCC4oNpX/H9cwMOnazz+/dxqY7txV6
 C9X+/c+vS/CvPWH+vnOR+PM9Utv8ONZOnJUutv3Bp11VuWwH+vdVpE9JdXaMMbgm7bBefsFj
 3/2vG49EBm850b2/5tz7XQ7/y+xMQvhePtEXX7okITXw+FbWv5UTy9b+KAi/mKBwpOCPq+8v
 h/Z5Mqp/Jzkfm3y4XYmlOCPRUIu5qDgRAL9SKrAoBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRmVeSWpSXmKPExsWy7bCSnO4xk3eJBrcX6llc+fqezWLj2x9M
 FjPO72OyWHvkLrtFW8t1dosZk1+yObB5zGroZfO4332cyaNvyypGjwcfSz0+b5ILYI3isklJ
 zcksSy3St0vgyriy8Dh7wTOuihXXrjA1MP7k6GLk5JAQMJE4fGkiUxcjF4eQwA5GiUU7DrF1
 MXIAJSQktmzlgDCFJQ4fLgYpFxJ4yyhx5gMfiM0rYCfx/fRLJhCbRUBV4vmTRlaIuKDEyZlP
 WEBsUYEIibZlU5hBbGGBUInTR7rBapgFxCVuPZkP1isiUCrxqv8+I8gJzAIzGCX2fupkhbhn
 IqNE59QusA42oA0TV9xnA7E5gTbv+byHBeQ4ZgF1ifXzhCCGyks0b53NPIFRaBaSO2Yh2TcL
 oWMWko4FjCyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCo0RLawfjnlUf9A4xMnEw
 HmKU4GBWEuEtyH+VKMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgs
 EwenVAOTY90p60KpTpOjdw/dmHXXYNPq7ielsTWP309t+5z/+HNnm8xdMdH07gILx0/SDKdY
 /sQeC9zsIHbrRtjbI+dFp1q3ysQKyTVXHTJLjhU6eHNv+UzzSWVTfKoCP7AZGmscv6O7eHHT
 EtttMT+mT1nSFme6wfN2peNz+wmLfuqvNAsrYMt5JvrlyXPbALcnK5fp8azb7mYz0bKP50DY
 hE/FvDadK0vsMwtnSggvefxj1/nk2IOcv4xaHRf4//bm9RM/2Zuf1jpTja/6zfwVl3/vUSjx
 ku8LigkokN50xnnfL5XIyUdXsxzX/L1f8MgRAaN+qwUWG4zb1CP/br+zQLTA8/2OXv0JJ87x
 lqc8feWjxFKckWioxVxUnAgAkAfsNAEDAAA=
X-CMS-MailID: 20220124051030epcas1p11a048539e037eb2d4591af37638aaf76
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220121100046eucas1p264ec703358da48f3cddec028425ba981
References: <CGME20220121100046eucas1p264ec703358da48f3cddec028425ba981@eucas1p2.samsung.com>
 <20220121100039.17316-1-m.szyprowski@samsung.com>
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
Cc: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thanks for fixing it.
Inki Dae.

22. 1. 21. 19:00에 Marek Szyprowski 이(가) 쓴 글:
> TE-gpio is optional and if it is not found then gpiod_get_optional()
> returns NULL. In such case the code will continue and try to convert NULL
> gpiod to irq what in turn fails. The failure is then propagated and driver
> is not registered.
> 
> Fix this by returning early from exynos_dsi_register_te_irq() if no
> TE-gpio is found.
> 
> Fixes: ee6c8b5afa62 ("drm/exynos: Replace legacy gpio interface for gpiod interface")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 32a36572b894..14ebbb124852 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1335,7 +1335,9 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
>  	int te_gpio_irq;
>  
>  	dsi->te_gpio = devm_gpiod_get_optional(dsi->dev, "te", GPIOD_IN);
> -	if (IS_ERR(dsi->te_gpio)) {
> +	if (!dsi->te_gpio) {
> +		return 0;
> +	} else if (IS_ERR(dsi->te_gpio)) {
>  		dev_err(dsi->dev, "gpio request failed with %ld\n",
>  				PTR_ERR(dsi->te_gpio));
>  		return PTR_ERR(dsi->te_gpio);
