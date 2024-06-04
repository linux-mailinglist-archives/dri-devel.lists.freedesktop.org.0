Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617FD8FBFBA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 01:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2AE10E514;
	Tue,  4 Jun 2024 23:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="jQxSKOn6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 351 seconds by postgrey-1.36 at gabe;
 Tue, 04 Jun 2024 23:14:33 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6DB10E514
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 23:14:33 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240604230837epoutp02e3ad690bf9be94a8a9b669a900747f25~V79HMEAzX3190831908epoutp02Z
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 23:08:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240604230837epoutp02e3ad690bf9be94a8a9b669a900747f25~V79HMEAzX3190831908epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1717542517;
 bh=4veX9m39ssflR/U5lyZBk5FIwfMEea8mPfEyrJbNarE=;
 h=From:To:In-Reply-To:Subject:Date:References:From;
 b=jQxSKOn6EIkKSzhVDukM4ojtfWQrS3fxKNmJiJ5gM0bhnVMuaFKROaVVxtb0F0Vs8
 8//jgqYNf7FJ/PQvei427ca0qSv5VXHyyDQEeWPAv4SCPIIxTHHHsaAiuLiemv+BXy
 spgWz1NZu5N+LSeMOQE5fF36J2OzWyIdNnNR9FDk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20240604230836epcas1p451d6271f53af0d77431bcaf00ac1c521~V79GstVsk0417104171epcas1p4w;
 Tue,  4 Jun 2024 23:08:36 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.134]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Vv5ql5xXlz4x9Pp; Tue,  4 Jun
 2024 23:08:35 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 77.05.08602.37E9F566; Wed,  5 Jun 2024 08:08:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20240604230835epcas1p3bc057c676339e8c0274a1becb9cba0c0~V79FaluHP2633726337epcas1p3I;
 Tue,  4 Jun 2024 23:08:35 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240604230835epsmtrp1b1948bb4422912a1f4dd3388c9ae41a6~V79FZoAnr2877628776epsmtrp1v;
 Tue,  4 Jun 2024 23:08:35 +0000 (GMT)
X-AuditID: b6c32a33-40dff7000000219a-94-665f9e7347b7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 30.7E.08336.37E9F566; Wed,  5 Jun 2024 08:08:35 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20240604230835epsmtip26d46dd1703cf234cc15f8eae001600fa~V79FH1oXf1493914939epsmtip2u;
 Tue,  4 Jun 2024 23:08:35 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHiL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?=
 <inki.dae@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Jingoo Han'"
 <jingoohan1@gmail.com>, "'Seung-Woo Kim'" <sw0312.kim@samsung.com>,
 "'Kyungmin Park'" <kyungmin.park@samsung.com>, "'David Airlie'"
 <airlied@gmail.com>, "'Daniel Vetter'" <daniel@ffwll.ch>, "'Krzysztof
 Kozlowski'" <krzk@kernel.org>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20240604131129.193972-1-krzysztof.kozlowski@linaro.org>
Subject: RE: [RESEND PATCH] drm/exynos: dp: drop driver owner initialization
Date: Wed, 5 Jun 2024 08:08:28 +0900
Message-ID: <0d1601dab6d4$20425130$60c6f390$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQHWtyanqIyw9adulRUaOtiSKpQ8BgFEb33msbYWViA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCJsWRmVeSWpSXmKPExsWy7bCmnm7xvPg0g0vbtC1OXF/EZPFg3jY2
 i//bJjJbXPn6ns1ixZeZ7Bbnz29gt9j7eiu7xdmmN+wWmx5fY7W4vGsOm8WM8/uYLGZMfsnm
 wOOx99sCFo+ds+6ye2xa1cnmcefaHjaP+93HmTw2L6n36NuyitHj8ya5AI6obJuM1MSU1CKF
 1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGuVFMoSc0qBQgGJxcVK
 +nY2RfmlJakKGfnFJbZKqQUpOQWmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZKyf8ZS/4wFPx
 YMpLxgbG11xdjJwcEgImEnPWtrN3MXJxCAnsYJRo297ICOF8YpTY9eEbM4TzjVFi/vNWFpiW
 qT2fWCESexklZvyYyAbhvGSU2Hn6ECNIFZtAhsTd9sVgVSICv5klbm+7ygSS4BRwlbj/8gQr
 iC0s4COxqH8F2FgWARWJ3ledbCA2r4ClROuqz8wQtqDEyZlPwGqYBYwklqyezwRhy0tsfzuH
 GeIkBYmfT5exQsRFJGZ3toHFRQSsJB60nGaDqDnCIdHUWQJhu0jc+PSbHcIWlnh1fAuULSXx
 sr8NHBoSApMZJe5cBzkOxJnBKHH453VGiCpjif1LJ0NdwSfx7msP0GYOoDivREebEESJksSx
 izegyiUkLiyZCHWEh8SlvROgwQ00c1rXJOYJjAqzkDw6C8mjs5A8OgvJcwsYWVYxiqUWFOem
 pyYbFhjCozw5P3cTIzg5axnvYLw8/5/eIUYmDsZDjBIczEoivH7F8WlCvCmJlVWpRfnxRaU5
 qcWHGE2BYT+RWUo0OR+YH/JK4g1NLA1MzIyMTSwMzQyVxHnPXClLFRJITyxJzU5NLUgtgulj
 4uCUamAKdoxjfxRZ9uqe5FxploScye26xYkXo27pKBxbf3l9LYO15dcZl78/SLmWeXTX1dMX
 IxaGPa5ZWRxQmLI6WLFUl9Pc59VO3ncn/07tiYo+yX7gdr//frMHd/x+O8vHFlvVihZ/2bz9
 4aI+9XvzfrTmzb792cJv0+wPTSelRXavy647F3HHuMZwVvymH8+KNNRmtby8f83NoNR7fYlU
 qOK0XzN6NylPmvVwV5aqTe2663k/aifvKBR8e8jC4uvXg2/l2JpTxLXWrjvxLWDeVIEN3yQq
 ND6ZzX+WIHnkVuAW9wTm7eFO8fItnUpzOT7MUfursZFx69x9fAwK+/WOP538Pfu5bWXzXK6k
 RA+eQG1nJZbijERDLeai4kQAlD+rl1cEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsWy7bCSvG7xvPg0g6P7+C1OXF/EZPFg3jY2
 i//bJjJbXPn6ns1ixZeZ7Bbnz29gt9j7eiu7xdmmN+wWmx5fY7W4vGsOm8WM8/uYLGZMfsnm
 wOOx99sCFo+ds+6ye2xa1cnmcefaHjaP+93HmTw2L6n36NuyitHj8ya5AI4oLpuU1JzMstQi
 fbsEroyVE/6yF3zgqXgw5SVjA+Nrri5GTg4JAROJqT2fWLsYuTiEBHYzSnx8O4W5i5EDKCEh
 sWUrB4QpLHH4cDFEyXNGic6N29hBetkE0iQmzd0P1isi0Moi8XnbFxaIqmmMEvuXrGMDqeIU
 cJW4//IEK4gtLOAjsah/BQuIzSKgItH7qhOshlfAUqJ11WdmCFtQ4uTMJ2A1zEDXNR7uhrLl
 Jba/ncMMcbWCxM+ny1gh4iISszvbwOIiAlYSD1pOs01gFJqFZNQsJKNmIRk1C0n7AkaWVYyS
 qQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwVGopbmDcfuqD3qHGJk4GA8xSnAwK4nw+hXH
 pwnxpiRWVqUW5ccXleakFh9ilOZgURLnFX/RmyIkkJ5YkpqdmlqQWgSTZeLglGpgmrH5ulWo
 S6/KmjeSab/0Zh0RyViYM2WVkP3eyx6qJufKIje7eF15nccfv+5Hiu16bTutE7fPPZR4Zb0+
 PcZOdjbzsWXz6m4YmPu7mH29d173+Qx7x3WyCdtdjhuzzzu/1OTMv5T5spKOYfuNwns92Sq5
 Th5b/2kVk8eOpSzpj08qqXjNWVN9K6ExXE35u4V12jeVCf/XXNNy3ndxl9bKwowSZeFZOemR
 BTNW8ar1Jgi6cz4qly0+MSWetc/rk+OEA+r3bYzW+8z/djXLyGj65l/8bgdTeDVTPnSesta6
 5aqbNffW+rCONSrzWK/neS9kfnxnR/2Jrnnt92+bnLQQrlDkbNP5Xdmypvid0o+NSizFGYmG
 WsxFxYkAw7fxWzEDAAA=
X-CMS-MailID: 20240604230835epcas1p3bc057c676339e8c0274a1becb9cba0c0
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240604131148epcas1p1eb594838cfe69f22cbda39b5c32a8126
References: <CGME20240604131148epcas1p1eb594838cfe69f22cbda39b5c32a8126@epcas1p1.samsung.com>
 <20240604131129.193972-1-krzysztof.kozlowski@linaro.org>
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

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Tuesday, June 4, 2024 10:11 PM
> To: Jingoo Han <jingoohan1@gmail.com>; Inki Dae <inki.dae@samsung.com>;
> Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin Park
> <kyungmin.park@samsung.com>; David Airlie <airlied@gmail.com>; Daniel
> Vetter <daniel@ffwll.ch>; Krzysztof Kozlowski <krzk@kernel.org>; Alim
> Akhtar <alim.akhtar@samsung.com>; dri-devel@lists.freedesktop.org; linux-
> arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Subject: [RESEND PATCH] drm/exynos: dp: drop driver owner initialization
> 
> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.  Whatever is set here will be anyway overwritten by
> main driver calling platform_driver_register().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c
> b/drivers/gpu/drm/exynos/exynos_dp.c
> index f48c4343f469..3e6d4c6aa877 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -285,7 +285,6 @@ struct platform_driver dp_driver = {
>  	.remove_new	= exynos_dp_remove,
>  	.driver		= {
>  		.name	= "exynos-dp",
> -		.owner	= THIS_MODULE,
>  		.pm	= pm_ptr(&exynos_dp_pm_ops),
>  		.of_match_table = exynos_dp_match,
>  	},
> --
> 2.43.0
> 


