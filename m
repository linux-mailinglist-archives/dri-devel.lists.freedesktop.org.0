Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B192E523696
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 17:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D65010E7DD;
	Wed, 11 May 2022 15:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3FD10E8A3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 15:02:04 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220511150203euoutp01462afe460e5d86cb78b86187d1d1eff6~uFRv72YU_0334703347euoutp01v
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 15:02:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220511150203euoutp01462afe460e5d86cb78b86187d1d1eff6~uFRv72YU_0334703347euoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652281323;
 bh=01KONJ5CQ9mRixgKLlzLiuq2X4gzrTFQGjvCaQweokM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=IHXRz2wfoYh0G2zceyZT4txCNQw5cwzbyUweQiEDoauE0wgRdK5NTMhr7vIY1OJoO
 sA1wZGww9ZlT9GaCfI6xCm2IdswyRGNm5lPkB9ONsqisow+ciQsdjimpcry1ZAJn4r
 W3ROE63FDwXLLcL+5QsuBUyYUHa7pb59YPpH6ZCg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220511150202eucas1p19c814440725b2c755eedc6716b02c176~uFRvgYeHq0262602626eucas1p1R;
 Wed, 11 May 2022 15:02:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id B6.7C.09887.AEFCB726; Wed, 11
 May 2022 16:02:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220511150202eucas1p2f62bc28fc02a5f7024b8177279adcd4b~uFRu_MKEk1323113231eucas1p2L;
 Wed, 11 May 2022 15:02:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220511150202eusmtrp1c96aa149689c4728a488bf13069946ef~uFRu7Oizz2779827798eusmtrp1w;
 Wed, 11 May 2022 15:02:02 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-66-627bcfea5564
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 3E.62.09522.9EFCB726; Wed, 11
 May 2022 16:02:02 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220511150201eusmtip2b6ec3553aaf22de57306aa6102da33e7~uFRt4Bqk71588415884eusmtip2i;
 Wed, 11 May 2022 15:02:00 +0000 (GMT)
Message-ID: <e8e56e98-59aa-62b1-2b96-3a0436e91dac@samsung.com>
Date: Wed, 11 May 2022 17:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 05/12] drm: bridge: samsung-dsim: Add DSI init in
 bridge pre_enable()
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
In-Reply-To: <20220504114021.33265-6-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphk+LIzCtJLcpLzFFi42LZduznOd1X56uTDM7d1LK4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCxOP1rPbHGqsZXF4lBftMWnWQ+B4pNfsllcPPGJ2eL777PMDqIeaz/eZ/V4
 f6OV3WPKiSOsHud67rJ57Jx1l91jdsdMVo/Fe14yeRy5upjV4861PWwe97uPM3lsXlLvsfHd
 DiaPvi2rGD0+b5IL4IvisklJzcksSy3St0vgyri0/iJbwRTRisuTm9gaGH8LdDFyckgImEjM
 vHqHqYuRi0NIYAWjROPiDmYI5wujxM1zh6Ccz4wS79o2ssO07Ls5hw0isZxRovvVHkYI5yOj
 xPPttxhBqngF7CS+7t8KZrMIqEpsO3WWDSIuKHFy5hMWEFtUIEnizZurzCC2sECcxI7WFjCb
 WUBc4taT+UwgtojAJFaJpi/iIAuYQRb0/HgIVsQmYCjR9bYLbCingIPE7f0/GSGa5SW2v53D
 DHFqE5dE57qsLkYOINtFYurPJIiwsMSr41ugvpGROD25hwWiJF/i7wxjiHCFxLXXa6CmWEvc
 OfeLDaSEWUBTYv0ufYiwo8T3Xz8YITr5JG68FYTYzycxadt0Zogwr0RHmxBEtZrErOPr4HYe
 vHCJeQKj0iykIJmF5PVZSD6ZhbB3ASPLKkbx1NLi3PTUYqO81HK94sTc4tK8dL3k/NxNjMAE
 e/rf8S87GJe/+qh3iJGJg/EQowQHs5II7/6+iiQh3pTEyqrUovz4otKc1OJDjNIcLErivMmZ
 GxKFBNITS1KzU1MLUotgskwcnFINTFzZaSEvejaaK97Ttq9fuavy7YQfyx5LT8sr79LdXnTS
 +uRHs83Lz96y3W9w3kkhSnfqJ/GtwqXf15UoqBmIHNdi7nA+qpofqFaxx0yQKaA1Z+Lh/zav
 Jrfnm289uPh3bNZPbpkztmkNyr/Pvv/wx+X2RoP4H71hlW/+GdTWpvMozeVpPRv1/cV1EV+u
 H01l3K977pgvWrbdV7fhsP8s/mCLX+a6FW4uwdP3vOHskF/7Y7qn6T+9ssfTZ24Sv3r1YGhK
 N3dT2bnP1wO0XzQcTsoxcP+i9civY/aFY49Drk7Wkt4wpz4te/v68L9XWl/WefXFVSxpXfxA
 wO7J86T8jqmf+HZnqD8xkL79P/7eYyWW4oxEQy3mouJEAM6zkpQfBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsVy+t/xe7qvzlcnGZyaz2Rx5/ZpZov7iz+z
 WLy+vYLN4srX92wWvUvPsVpMuj+BxeLLpglsFi/uXWSxONv0ht2ic+ISdovlE/axWWx6fI3V
 ouvXSmaLGef3MVmcfrSe2eJUYyuLxaG+aItPsx4CxSe/ZLO4eOITs8X332eZHUQ91n68z+rx
 /kYru8eUE0dYPc713GXz2DnrLrvH7I6ZrB6L97xk8jhydTGrx51re9g87ncfZ/LYvKTeY+O7
 HUwefVtWMXp83iQXwBelZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OS
 mpNZllqkb5egl3Fp/UW2gimiFZcnN7E1MP4W6GLk5JAQMJHYd3MOWxcjF4eQwFJGib55R5kh
 EjISJ6c1sELYwhJ/rnVBFb1nlJj87zxYglfATuLr/q2MIDaLgKrEtlNn2SDighInZz5h6WLk
 4BAVSJI4cpgfJCwsECexo7UFbD6zgLjErSfzmUBmighMY5W49/Yr2AJmgY+MEpcmb2GH2HaS
 UeJg23SwqWwChhJdb7vAbE4BB4nb+38yQowyk+ja2gVly0tsfzuHeQKj0Cwkh8xCsnEWkpZZ
 SFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECEwt24793LyDcd6rj3qHGJk4GA8xSnAw
 K4nw7u+rSBLiTUmsrEotyo8vKs1JLT7EaAoMjYnMUqLJ+cDkllcSb2hmYGpoYmZpYGppZqwk
 zutZ0JEoJJCeWJKanZpakFoE08fEwSnVwMTjxNr5oL69b66vgJOPheBFIYXw3My8/3fzVTkl
 ne897dSM5d/8Sv26StqEZR845FU1f+zS5dW10fVYJL1gk14En1ie6/Yan61TpGKX2u//H9Qq
 elf6TELoT9vSo5mSdySMq485nmOXPOU9ZZfJapnPUi9cJtbmKh5hWWHDlu4zw5bPfYKjBtdf
 ZVGB8PT3aeebsqqblWYmxDxbtdVf+ezRuQWqB0StL0c9tZgfe/Jgf/b5myFhTk3sjE2eNwMV
 3iWfi+5qmV1xqak4cYGIa5tUuv8fVUXVBPnjz263aayeEbL1fhf7ERmfzu2mCc95C/ZZPdeV
 mdAWdTDnj0tQkjhj+6YVMffWL5l46ooSS3FGoqEWc1FxIgCcyoqctgMAAA==
X-CMS-MailID: 20220511150202eucas1p2f62bc28fc02a5f7024b8177279adcd4b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220504114121eucas1p1aff92a52f2c4e1905b4c9672331b7db6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220504114121eucas1p1aff92a52f2c4e1905b4c9672331b7db6
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <CGME20220504114121eucas1p1aff92a52f2c4e1905b4c9672331b7db6@eucas1p1.samsung.com>
 <20220504114021.33265-6-jagan@amarulasolutions.com>
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
> Host transfer() in DSI master will invoke only when the DSI commands
> are sent from DSI devices like DSI Panel or DSI bridges and this
> host transfer wouldn't invoke for I2C-based-DSI bridge drivers.
>
> Handling DSI host initialization in transfer calls misses the
> controller setup for I2C configured DSI bridges.
>
> This patch adds the DSI initialization from transfer to bridge
> pre_enable as the bridge pre_enable API is invoked by core as
> it is common across all classes of DSI device drivers.
>
> v2:
> * check initialized state in samsung_dsim_init
>
> v1:
> * keep DSI init in host transfer
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

This doesn't work with Exynos DSI and DSI panels. Here is a bit more 
detailed explanation and my solution for this:

https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/


> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 60dc863113a0..b9361af5ef2d 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1259,6 +1259,9 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
>   {
>   	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
>   
> +	if (dsi->state & DSIM_STATE_INITIALIZED)
> +		return 0;
> +
>   	samsung_dsim_reset(dsi);
>   	samsung_dsim_enable_irq(dsi);
>   
> @@ -1271,6 +1274,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
>   	samsung_dsim_set_phy_ctrl(dsi);
>   	samsung_dsim_init_link(dsi);
>   
> +	dsi->state |= DSIM_STATE_INITIALIZED;
> +
>   	return 0;
>   }
>   
> @@ -1290,6 +1295,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   	}
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
> +
> +	ret = samsung_dsim_init(dsi);
> +	if (ret)
> +		return;
>   }
>   
>   static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> @@ -1464,12 +1473,9 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return -EINVAL;
>   
> -	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> -		ret = samsung_dsim_init(dsi);
> -		if (ret)
> -			return ret;
> -		dsi->state |= DSIM_STATE_INITIALIZED;
> -	}
> +	ret = samsung_dsim_init(dsi);
> +	if (ret)
> +		return ret;
>   
>   	ret = mipi_dsi_create_packet(&xfer.packet, msg);
>   	if (ret < 0)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

