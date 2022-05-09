Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E15C51FC1A
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905C810EF2E;
	Mon,  9 May 2022 12:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDD010EF10
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 12:05:08 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220509120505euoutp02853b7ee7fa99188dcf0a302ced31dd73~tbkqjspjA3027130271euoutp02w
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 12:05:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220509120505euoutp02853b7ee7fa99188dcf0a302ced31dd73~tbkqjspjA3027130271euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652097905;
 bh=Gq3z2v+zJPQ56HofxEBhHQO/uJh2LtFXTSHFd1R459c=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=YvNYteGPSWY671ZhH4Z1c8Q4RYue79UPA/PJpSf6ZhHETDOIcakN7XIaMC/hlESyY
 qgZWVelX46weFvGB9PcnG9V5NpQfmDUkDTCSieeFKEIU8DZHf6putqxB7FeBqBmMnn
 7hvcFFt1jqgnj5WJ/owVIhT/RTW8ggISbHntLsqY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220509120504eucas1p103b2234b755a517acd155e821d236642~tbkp6s-k03247832478eucas1p1R;
 Mon,  9 May 2022 12:05:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 7D.CB.10260.07309726; Mon,  9
 May 2022 13:05:04 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220509120503eucas1p17ebac464eb6178961d8b2b3d90172fa6~tbkpM8Ron3247832478eucas1p1P;
 Mon,  9 May 2022 12:05:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220509120503eusmtrp1279a100d1dbc17fddd1b40f8d4b0fa3f~tbkpKHljD3104131041eusmtrp1r;
 Mon,  9 May 2022 12:05:03 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-2f-627903705d11
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0C.5C.09522.F6309726; Mon,  9
 May 2022 13:05:03 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220509120502eusmtip2b3da5d4946c879992e16db3795385710~tbkoJto2O0578305783eusmtip2U;
 Mon,  9 May 2022 12:05:02 +0000 (GMT)
Message-ID: <7dc628c5-a387-1065-6e41-bb16c13cb1b6@samsung.com>
Date: Mon, 9 May 2022 14:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 07/12] drm: bridge: samsung-dsim: Add module init, exit
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220504114021.33265-8-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmk+LIzCtJLcpLzFFi42LZduznOd0C5sokg6v/RCzu3D7NbHF/8WcW
 i9e3V7BZXPn6ns2id+k5VotJ9yewWHzZNIHN4sW9iywWZ5vesFt0TlzCbrF8wj42i02Pr7Fa
 dP1ayWwx4/w+JovTj9YzW5xqbGWxONQXbfFp1kOg+OSXbBYXT3xitvj++yyzg6jH2o/3WT3e
 32hl95hy4girx7meu2weO2fdZfeY3TGT1WPxnpdMHkeuLmb1uHNtD5vH/e7jTB6bl9R7bHy3
 g8mjb8sqRo/Pm+QC+KK4bFJSczLLUov07RK4Mha+vsVesFSkYuXpZ6wNjHsFuhg5OSQETCSW
 LFrF3MXIxSEksIJR4s3soywQzhdGibaTS6Ccz4wShxumsMK0fNzYCWYLCSxnlGh5nQ5R9JFR
 Yvfl24xdjBwcvAJ2EtcuSYCYLAIqEkt/GIOU8woISpyc+YQFxBYVSJJ48+YqM4gtLBAgsWba
 GkYQm1lAXOLWk/lMILaIwCRWiaYv4iDjmUHG9/x4CNbAJmAo0fW2iw3E5hRwkFh17wg7RLO8
 xPa3c8DekRDo4pL4vqSJCeJoF4nOryehHhCWeHV8CzuELSNxenIPC8ihEgL5En9nGEOEKySu
 vV7DDGFbS9w594sNpIRZQFNi/S59iLCjxCRgUoDo5JO48VYQ4gI+iUnbpjNDhHklOtqEIKrV
 JGYdXwe38+CFS8wTGJVmIQXKLCTPz0LyyyyEvQsYWVYxiqeWFuempxYb56WW6xUn5haX5qXr
 JefnbmIEptfT/45/3cG44tVHvUOMTByMhxglOJiVRHj391UkCfGmJFZWpRblxxeV5qQWH2KU
 5mBREudNztyQKCSQnliSmp2aWpBaBJNl4uCUamCyDm4MOtWYYNZ2QLjNX9L4u2jq59YnpazG
 d0W+h65+75kf/1/GSGbWpk9N7/8HbQzKYk5c1uAR+mJ33/QNH+Zxuf3jqJv8nMnN7dzyf41M
 E3JyGg4XxXizP5XLvewlr9eeuu/iW/OXYlXXWjfeMDrqJba/SZ/lWP9Gu2fBi9YcPrZ7TUei
 253Xdr3tfG//eTi7J991ONToluN31+j6NqHTbFvqteY7fX3HbXrqusrPxXUc6UXHw1++6Mi2
 2bo/v9/W4M2TXRNSOxTmTLtiXCgtWnuj7dqtlTfX9n+yr1t1k/9B+KOdN724U1fNdzpSKH6g
 1/V/OsPn6eGyLOfPKyQvP3RKhmdX8MtG0Tvqv/uVWIozEg21mIuKEwGZpqMwHgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsVy+t/xe7r5zJVJBrvPqljcuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBaT7k9gsfiyaQKbxYt7F1kszja9YbfonLiE3WL5hH1sFpseX2O1
 6Pq1ktlixvl9TBanH61ntjjV2Mpicagv2uLTrIdA8ckv2SwunvjEbPH991lmB1GPtR/vs3q8
 v9HK7jHlxBFWj3M9d9k8ds66y+4xu2Mmq8fiPS+ZPI5cXczqcefaHjaP+93HmTw2L6n32Phu
 B5NH35ZVjB6fN8kF8EXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk
 5mSWpRbp2yXoZSx8fYu9YKlIxcrTz1gbGPcKdDFyckgImEh83NjJ2sXIxSEksJRRYu30fcwQ
 CRmJk9MaWCFsYYk/17rYIIreM0rcnTwfKMHBwStgJ3HtkgSIySKgIrH0hzFIOa+AoMTJmU9Y
 QMKiAkkSRw7zg4SFBfwkelc/ZQSxmQXEJW49mc8EMlFEYBqrxL23X8HGMwt8ZJS4NHkLO0iV
 kMBJRon1K91AbDYBQ4mutyA3cHJwCjhIrLp3hB1ikplE19YuqKnyEtvfzmGewCg0C8kds5As
 nIWkZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECk8q2Yz8372Cc9+qj3iFGJg7G
 Q4wSHMxKIrz7+yqShHhTEiurUovy44tKc1KLDzGaAsNiIrOUaHI+MK3llcQbmhmYGpqYWRqY
 WpoZK4nzehZ0JAoJpCeWpGanphakFsH0MXFwSjUwJezI2CFx28h+RcaNK/vf+MSnney2XVXF
 osgy9e7VqRV1UlUHVmwUWV+c45Nx4pLohJvWH+/wLV7q88aSZfpVo+V7tplmhnWZtF3u4xcM
 V7WY2Z982WNOz3K9K8eMMs2nzDbhkVB8836/s53+Y6v3dx9ffpUsdqzxbMqlAyUnTfuePCqf
 HcAiJlk5++CrA5orTA89qdMNn6rf2iRzPTJT5uV++WB74/3yPxMsrPTWzPfjcX95WtJZO/XQ
 nY+KWgJzLt+r4X99suqL1Yy677M9Elf0Tb71tb4pobTIp3/SFp1knfwpNcsqZGQ1t81ysPJ8
 4xa+YvI2+1My3fvcLfbyMnNsCPx+95axb66lHYOMEktxRqKhFnNRcSIAbmECwrMDAAA=
X-CMS-MailID: 20220509120503eucas1p17ebac464eb6178961d8b2b3d90172fa6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220504114135eucas1p2b874e8c467c6b507239861d67198be25
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220504114135eucas1p2b874e8c467c6b507239861d67198be25
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <CGME20220504114135eucas1p2b874e8c467c6b507239861d67198be25@eucas1p2.samsung.com>
 <20220504114021.33265-8-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.05.2022 13:40, Jagan Teki wrote:
> Add module init and exit functions for the bridge to register
> and unregister dsi_driver.
>
> Exynos drm driver stack will register the platform_driver separately
> in the common of it's exynos_drm_drv.c including dsi_driver.
>
> Register again would return -EBUSY, so return 0 for such cases as
> dsi_driver is already registered.
>
> v2, v1:
> * none
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 8f9ae16d45bc..b618e52d0ee3 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1740,6 +1740,28 @@ struct platform_driver dsi_driver = {
>   	},
>   };
>   
> +static int __init samsung_mipi_dsim_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&dsi_driver);
> +
> +	/**
> +	 * Exynos drm driver stack will register the platform_driver
> +	 * separately in the common of it's exynos_drm_drv.c including
> +	 * dsi_driver. Register again would return -EBUSY, so return 0
> +	 * for such cases as dsi_driver is already registered.
> +	 */
> +	return ret == -EBUSY ? 0 : ret;
> +}
> +module_init(samsung_mipi_dsim_init);

I've just noticed this. The above approach is really a bad pattern: 
registering the same driver 2 times and relying on the error.

This gives the following error on Exynos boards:

Error: Driver 'samsung-dsim' is already registered, aborting...

which a bit misleading, because it is assumed that this will be ok.

This will also break if one compile it as modules, because the driver 
operation will depend on the order of module loading (and Exynos DSI 
won't be able to load as a second 'driver').

However the most important issue with such pattern is lack of 
multi-platform support (used usually by generic distros). One would not 
be able to compile a kernel with both Exynos and IMX support built-in. 
New drivers should really follow the multi-platform friendly patterns.


> +
> +static void __exit samsung_mipi_dsim_exit(void)
> +{
> +	platform_driver_unregister(&dsi_driver);
> +}
> +module_exit(samsung_mipi_dsim_exit);
> +
>   MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
>   MODULE_DESCRIPTION("Samsung MIPI DSIM controller bridge");
>   MODULE_LICENSE("GPL");

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

