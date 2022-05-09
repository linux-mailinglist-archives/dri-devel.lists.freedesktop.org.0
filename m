Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5990651FD21
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093E810EF09;
	Mon,  9 May 2022 12:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05C910EEFD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 12:44:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220509124409euoutp02be4bef2936b01997c061cc5c58ad5212~tcGyHOQsF0948209482euoutp02v
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 12:44:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220509124409euoutp02be4bef2936b01997c061cc5c58ad5212~tcGyHOQsF0948209482euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652100249;
 bh=gYLRTtp9iYV+NPmjmlpgNAGRbbCtzjg5C6MzBWnOHmE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=EJuihP0ONaEJGnw2pBp/wAbVt2j9IeG0svuYoUAVKzFEept5+AYKRXiTi5wLmpuiH
 kkGmpM2f5PHASqDMhPMW4x13VeP/+v7IPSBLJe48vDyl5HPVimQfCtyLNXHrvEJjD9
 HNtpsGkB/jcgJOsigYKXJ98QSIIw7av9mRXhhoYI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220509124409eucas1p123705982f1303f80ed460b817bbae139~tcGxwMe6Z1594615946eucas1p1H;
 Mon,  9 May 2022 12:44:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8D.CD.09887.99C09726; Mon,  9
 May 2022 13:44:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220509124408eucas1p1add95068402c4e5fd1ca1eeebbc6d834~tcGxPHmsz1555215552eucas1p1E;
 Mon,  9 May 2022 12:44:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220509124408eusmtrp123f2f4ca3aceba41323079d9895db72a~tcGxN_wqK2337123371eusmtrp1P;
 Mon,  9 May 2022 12:44:08 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-ea-62790c990f57
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DD.89.09404.89C09726; Mon,  9
 May 2022 13:44:08 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220509124407eusmtip282a06b802501e8055ccfb2733ee49620~tcGvsZ-L40160801608eusmtip2F;
 Mon,  9 May 2022 12:44:07 +0000 (GMT)
Message-ID: <13c76fa1-b1cb-6444-f152-6ccc3b61aec2@samsung.com>
Date: Mon, 9 May 2022 14:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 01/12] drm: bridge: Add Samsung DSIM bridge driver
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
In-Reply-To: <20220504114021.33265-2-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfVCTdRy/3/O2Z9Phw4D2OxS8m5lXFgrU+UsTCfR81FKz6zyTrKFPwAnD
 2+Nq2IuGRwcDaY40Nso8h2CKMIZMQlRYuNEGQyqmAbIo6kAg4qWD8OBiPFj89/l+vm+fz/e+
 NC47RYXSKaqjnFqlTFVQEsLm+MfznHFxRuLajiuBqKvTjSOfeYxAA52XKPTT38MUOnXRQyKD
 T0+gcaueQn3dbQRqyRwUoZzTxSJUqr9FIetvXhLppr7BUWHrLQy5f63AkeuTLALZ8/ejUVPP
 LF/QT6G2plEcTTxqwWND2KsjPpIdvp8lYj9vaiRZT94Div3W9EDEFmUbSdZc14+xje1mku3y
 1lGsL9eJsVXFx9nKP2swNv/aZcCOWcN3B7wpeekQl5ryHqdeE/OOJDn39h3iiEuu7XFMkyeA
 R6YDYhoyz0OXcwTTAQktYy4BWN/cjQvBOIBZfWcoIRgDsOxHA/64xXuyRSQkSgE80+smhGAE
 wPMdDcBfJWViYNXUBZEfE8yTcDKvlRT4QPi9sZfw4xAmEQ4Ots9OpekgZhscts6V44wcdvR+
 jflxMGMgYea43D8f98/Pm+yZU0ExkVA3pKP8WMzEwnu2mfnm5fBkddGcB8hkSmBB1XdAkL0Z
 1uhzSQEHwYfOayIBL4PugjzCLwIy6XC6MFqgtdA7UDbveAPs8kxR/hKceRpW1K4R6Jdhde3M
 fGcAvD8UKCgIgAbbF7hAS2H2p/OXfgqanOX/7Wy4+wOuBwrTgpuYFpg3LfBi+n/veUBcBnJO
 w6clcXyUins/glem8RpVUsTB9DQrmP1Y94xzvAaUPhyJsAOMBnYAaVwRLL2dr02USQ8pM45x
 6vS31ZpUjreDpTShkEsPpliUMiZJeZQ7zHFHOPXjLEaLQ09gIG39ndf7y2/apuNQ96op/EoJ
 f27/3XYNFZ9tpCI3/uX9wPJaxD6P8Sx3oO3F1VbtxYqM8hWOJzSRVKU4P6p6967D2/f4/nCO
 1vZtfbbsq+zTL3z0aNWN8Di8zFwy1Knc9q7IsdhU4vKe2xHbbd+0d+OrmcfeUJmbF9U27InK
 yQhZh8V0budjdikqRtXmOjrBiiVHr17Sa9m0bid5oF0Xtjz+s/olhbYNO5vPul2Na/eKJ1dq
 GKrl5o3jvhQ7/8vPCelBK7b8/mXRojDkvdr6SkF98YVC7db+zW8hS//1YMfEMqtMs5Qu2ReK
 N5Rfr4zPib9n6Fo/8HFwWHhTQly0buJDi4Lgk5WRz+BqXvkvYnx0dSAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xe7ozeCqTDBZv1LK4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCxOP1rPbHGqsZXF4lBftMWnWQ+B4pNfsllcPPGJ2eL777PMDqIeaz/eZ/V4
 f6OV3WPKiSOsHud67rJ57Jx1l91jdsdMVo/Fe14yeRy5upjV4861PWwe97uPM3lsXlLvsfHd
 DiaPvi2rGD0+b5IL4IvSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJ
 zcksSy3St0vQy+jef5Sl4JR4xcNjf1kbGM8JdTFyckgImEhcaz7L3sXIxSEksJRRYtaTzywQ
 CRmJk9MaWCFsYYk/17rYIIreM0o8ub4FLMErYCex+dcidhCbRUBF4kfPeai4oMTJmU+ABnFw
 iAokSRw5zA9iCgt4SrzfBFbNLCAucevJfCaQkSIC01gl7r39CjafWeAjo8SlyVugLjrJKHHu
 4zM2kBY2AUOJrrddYDangIPE9W3/oEaZSXRt7WKEsOUlmrfOZp7AKDQLyR2zkGychaRlFpKW
 BYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQITy7ZjP7fsYFz56qPeIUYmDsZDjBIczEoi
 vPv7KpKEeFMSK6tSi/Lji0pzUosPMZoCA2Mis5Rocj4wteWVxBuaGZgamphZGphamhkrifN6
 FnQkCgmkJ5akZqemFqQWwfQxcXBKNTDNsdc9oG12fyvz2R/acVv9ZN3Zjs+RP9Ot8Hm6Qc4F
 z406jLcnuuYmuQZytqTe/DCpyXi/w6rVE3ovtlSdV3ZVXvRSoVjoakrFka/GfXnSLN7+zlfs
 Ik3ePWV+8OHZx73xggtTdR94+B2K0zHbGfJL9sCdf1YPPsboq81eG5MXE7LmUcK76JjTplFc
 c/y3ZVz8seKE1STeRRaLwzuUbWbMsjxp9/2tjaDDt9eC521X33XYnSv/WOPNVfWY7gV6Iuw7
 Ls3LLAt2/LZmWWeH9K7W16ffsom1eS3eOe/z1/m6Dt+Z1dYKsYV3G0vnWORX3l17/aJXZlTb
 Tic/NQ2/Axs++ETekLtpWGvZ6BbE+V+JpTgj0VCLuag4EQDAvYYTtQMAAA==
X-CMS-MailID: 20220509124408eucas1p1add95068402c4e5fd1ca1eeebbc6d834
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220504114058eucas1p1363bdee5cb1bf8d38dd33810a729d28b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220504114058eucas1p1363bdee5cb1bf8d38dd33810a729d28b
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <CGME20220504114058eucas1p1363bdee5cb1bf8d38dd33810a729d28b@eucas1p1.samsung.com>
 <20220504114021.33265-2-jagan@amarulasolutions.com>
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
> Samsung MIPI DSIM controller is common DSI IP that can be used in various
> SoCs like Exynos, i.MX8M Mini/Nano.
>
> In order to access this DSI controller between various platform SoCs,
> the ideal way to incorporate this in the drm stack is via the drm bridge
> driver.
>
> This patch is trying to differentiate platform-specific and bridge driver
> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
> glue code and samsung-dsim.c as a common bridge driver code.
>
> - Exynos specific glue code is exynos specific te_irq, host_attach, and
>    detach code along with conventional component_ops.
>
> - Samsung DSIM is a bridge driver which is common across all platforms and
>    the respective platform-specific glue will initialize at the end of the
>    probe. The platform-specific operations and other glue calls will invoke
>    on associate code areas.
>
> v2:
> * fixed exynos dsi driver conversion (Marek Szyprowski)
> * updated commit message
> * updated MAINTAINERS file
>
> v1:
> * Don't maintain component_ops in bridge driver
> * Don't maintain platform glue code in bridge driver
> * Add platform-specific glue code and make a common bridge
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   MAINTAINERS                             |    8 +
>   drivers/gpu/drm/bridge/Kconfig          |   12 +
>   drivers/gpu/drm/bridge/Makefile         |    1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c   | 1687 ++++++++++++++++++++++
>   drivers/gpu/drm/exynos/Kconfig          |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1724 +----------------------
>   include/drm/bridge/samsung-dsim.h       |   97 ++
>   7 files changed, 1869 insertions(+), 1661 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>   create mode 100644 include/drm/bridge/samsung-dsim.h

> ...

> -static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
> -				      struct device *panel)
> +static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi, struct device *panel)
>   {
> -	int ret;
> +	struct samsung_dsim *priv = dsi->priv;
>   	int te_gpio_irq;
> +	int ret;
> -	dsi->te_gpio = gpiod_get_optional(panel, "te", GPIOD_IN);
> -	if (!dsi->te_gpio) {
> -		return 0;
> -	} else if (IS_ERR(dsi->te_gpio)) {
> -		dev_err(dsi->dev, "gpio request failed with %ld\n",
> +	dsi->te_gpio = devm_gpiod_get_optional(priv->dev, "te", GPIOD_IN);
> +	if (IS_ERR(dsi->te_gpio)) {

The above change is basically a revert to the old broken code, which has 
been fixed by the following commits:

fedc89821990 drm/exynos: Search for TE-gpio in DSI panel's node
8e3fa9d841db drm/exynos: Don't fail if no TE-gpio is defined for DSI driver

Please update it to the current mainline state by removing the above change.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

