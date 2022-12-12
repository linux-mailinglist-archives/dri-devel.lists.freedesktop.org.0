Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0353E6499FB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 09:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0399710E032;
	Mon, 12 Dec 2022 08:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9636910E032
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 08:26:33 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221212082630euoutp02e0689e6c896a46d6764fddc9cf16a71c~v-kxhotrz2063020630euoutp02o
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 08:26:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221212082630euoutp02e0689e6c896a46d6764fddc9cf16a71c~v-kxhotrz2063020630euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670833590;
 bh=mY5JFFwE9qSh4lN0ppSIQ1W3nCfwNZSLYA6BzpjgUfo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=CP1dvzNBLwKL5WZh/hnb4wLGz0bKYN5kQc4AU6YOQkGewbjsCAX65PpoKsXBVCLNg
 xk6/wTzZWwQuy6d4RyJdqJykzfmzDvKg2MQmCFyogLSXRMtqQXqQOVHQmpt6mdXOjm
 pBp7iHnFZZxPiA71P1mkgOEA7qwOW2cCMX+65DRM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221212082630eucas1p1cdf3dbb5a455d687350467cf14cdfab9~v-kxIk6QE2613826138eucas1p1z;
 Mon, 12 Dec 2022 08:26:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id AD.0C.10112.6B5E6936; Mon, 12
 Dec 2022 08:26:30 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221212082629eucas1p1c46b4e883a60cffb78bced0818be36c5~v-kwbqTCD1722517225eucas1p1V;
 Mon, 12 Dec 2022 08:26:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221212082629eusmtrp21ee94687f1ee80a0c91b7c7a55cef928~v-kwavWKA1388913889eusmtrp2e;
 Mon, 12 Dec 2022 08:26:29 +0000 (GMT)
X-AuditID: cbfec7f4-d09ff70000002780-3c-6396e5b6ed0e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0B.43.08916.5B5E6936; Mon, 12
 Dec 2022 08:26:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221212082628eusmtip2d0d2645718e83801e08b8e242698d6aa~v-kvYawsG0621106211eusmtip2z;
 Mon, 12 Dec 2022 08:26:28 +0000 (GMT)
Message-ID: <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
Date: Mon, 12 Dec 2022 09:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host
 for first DSI transfer
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>, Marek Vasut <marex@denx.de>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20221209152343.180139-11-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7djPc7rbnk5LNvi7WMDizu3TzBb3F39m
 sXh9ewWbxZWv79ksepeeY7WYdH8Ci8WXTRPYLF7cu8hicbbpDbtF58Ql7BbLJ+xjs9j0+Bqr
 RdevlcwWM87vY7J409bIaHH60Xpmi1ONrSwWl6YcZrP4NOshUHbySzaLiyc+MVt8/32W2UHM
 Y+3H+6we82adYPGYcuIIq8e5nrtsHjtn3WX3mN0xk9Vj8Z6XTB5Hri5m9bhzbQ+bx/3u40we
 m5fUe2x8t4PJo2/LKkaPz5vkAviiuGxSUnMyy1KL9O0SuDI+HdjKVrBWpmL75GmsDYznxbsY
 OTkkBEwkJhz7xghiCwmsYJRo2GTWxcgFZH9hlFi59AcrhPOZUeLg+unsMB331u5gh0gsZ5T4
 MvEEC4TzkVHi6MEOJpAqXgE7icZd19lAbBYBVYnu9ucsEHFBiZMzn4DZogIpEgd2ngWrFxZI
 kng3ZQXYVBGBtawSfct62EAcZpCpPT8eMoNUMQuIS9x6Mh+sg03AUKLrbRfYBk4BJ4kN5zYw
 QtTISzRvnc0McWsbl8TdNXwQtovEn/v/oX4Qlnh1fAuULSPxfyfITC4gu51RYsHv+1DOBGBw
 PL/FCFFlLXHn3C+gbRxAGzQl1u/Shwg7SjyY2ckMEpYQ4JO48VYQ4gY+iUnbpkOFeSU62oQg
 qtUkZh1fB7f24IVLzBMYlWYhhcssJF/OQvLNLIS9CxhZVjGKp5YW56anFhvlpZbrFSfmFpfm
 pesl5+duYgQm3dP/jn/Zwbj81Ue9Q4xMHIyHGCU4mJVEeFU1piUL8aYkVlalFuXHF5XmpBYf
 YpTmYFES510xpSNZSCA9sSQ1OzW1ILUIJsvEwSnVwFRwQyFHVuTsKvEZk+vvOviVR53cxza7
 s0o2OXChb/m5O+vyNhotecblJsYdLXrsk+IqwRshuyUDAt/4mWxIv8f1Ipz5+9YXk9xLFIsL
 tb791/pveOChHyN3zgqDpZMqblcb3JznvqH1iYHnRfHuF75r9z2bLxTuwLz9W1VxpX/2Mvcn
 Gxt54h9d+TDB8bWIg/Hxl63Ll/6cuPGp61fJb0Kviy66Lq18+KC8U/Rq6sb01bJZNRcSvV0s
 2sRCdpiL37jUZhNyYqLNPOW+g70byjgeJ7ZvufbBdufynunBf6a9XTYxKj6mWGmZhmjO3ih1
 zXf3hK9/LmD9LWx2oSd9dvevNIkj60+sSs1cvTfl4GolluKMREMt5qLiRAAv+p/eKQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsVy+t/xe7pbn05LNjh5Qcbizu3TzBb3F39m
 sXh9ewWbxZWv79ksepeeY7WYdH8Ci8WXTRPYLF7cu8hicbbpDbtF58Ql7BbLJ+xjs9j0+Bqr
 RdevlcwWM87vY7J409bIaHH60Xpmi1ONrSwWl6YcZrP4NOshUHbySzaLiyc+MVt8/32W2UHM
 Y+3H+6we82adYPGYcuIIq8e5nrtsHjtn3WX3mN0xk9Vj8Z6XTB5Hri5m9bhzbQ+bx/3u40we
 m5fUe2x8t4PJo2/LKkaPz5vkAvii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62M
 TJX07WxSUnMyy1KL9O0S9DI+HdjKVrBWpmL75GmsDYznxbsYOTkkBEwk7q3dwd7FyMUhJLCU
 UeJ7dwsrREJG4uS0BihbWOLPtS42iKL3jBIdx96xgSR4BewkGnddB7NZBFQlutufs0DEBSVO
 znwCZosKpEi09/xjArGFBZIk9k1ZBDZIRGAzq8TedxOYQBxmgY+MEpcmb4G64wyjREP3A7AW
 ZgFxiVtP5oPZbAKGEl1vu8DWcQo4SWw4t4ERosZMomtrF5QtL9G8dTbzBEahWUgumYVk1Cwk
 LbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRmGi2Hfu5eQfjvFcf9Q4xMnEwHmKU
 4GBWEuFV1ZiWLMSbklhZlVqUH19UmpNafIjRFBgcE5mlRJPzgakuryTe0MzA1NDEzNLA1NLM
 WEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBqfLTtkYrUfbN8Qs5mrTWvjl+zvj91zz3fNFC
 J99nV30FT7w+en5e9KUO/maJ6ZcFnPdsWGSwIkT/rWhhZsHqVf+n9nlb33764Pdmhb2xvUvU
 Dq5xf81QaHqwvY1xA9dP3kANc/31hifKg3Nl7GI0nE2X391Vnrhp7XaTLs3s2w9l98U+3LJ2
 +mOlsKfzLgS8NPF98vSJp2TjcnW2Dx5eNeHZBbmMjNmyi0Uen04Ue8374v6JwqsMimpfFss7
 iOVrdrlKXsmyevLgmmamieo7pdIZQjsntbPZ3pu/tshncUDt7v8f5H9rSzZNe1JkmC9q75Gz
 OGjeCrft91/cjTl90543ylf9kHxzquifxFcNSizFGYmGWsxFxYkA/zNHkL0DAAA=
X-CMS-MailID: 20221212082629eucas1p1c46b4e883a60cffb78bced0818be36c5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com>
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

Hi Jagan,

On 09.12.2022 16:23, Jagan Teki wrote:
> The existing drm panels and bridges in Exynos required host
> initialization during the first DSI command transfer even though
> the initialization was done before.
>
> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
> flag and triggers from host transfer.
>
> Do this exclusively for Exynos.
>
> Initial logic is derived from Marek Szyprowski changes.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes from v9:
> - derived from v8
> - added comments
>
>   drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
>   include/drm/bridge/samsung-dsim.h     |  5 +++--
>   2 files changed, 17 insertions(+), 3 deletions(-)

The following chunk is missing compared to v8:

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
b/drivers/gpu/drm/bridge/samsung-dsim.c
index 6e9ad955ebd3..6a9403cb92ae 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim 
*dsi, unsigned int flag)
                 return 0;

         samsung_dsim_reset(dsi);
-       samsung_dsim_enable_irq(dsi);
+
+       if (!(dsi->state & DSIM_STATE_INITIALIZED))
+               samsung_dsim_enable_irq(dsi);

         if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
                 samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);


> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 2e15d753fdd0..ec3ab679afd9 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1254,6 +1254,19 @@ static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int flag)
>   {
>   	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
>   
> +	/*
> +	 * FIXME:
> +	 * The existing drm panels and bridges in Exynos required host
> +	 * initialization during the first DSI command transfer even though
> +	 * the initialization was done before.
> +	 *
> +	 * This host reinitialization is handled via DSIM_STATE_REINITIALIZED
> +	 * flag and triggers from host transfer. Do this exclusively for Exynos.
> +	 */
> +	if ((dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) &&
> +	    dsi->state & DSIM_STATE_REINITIALIZED)
> +		return 0;
> +
>   	if (dsi->state & flag)
>   		return 0;
>   
> @@ -1467,7 +1480,7 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return -EINVAL;
>   
> -	ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> +	ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
>   	if (ret)
>   		return ret;
>   
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
> index b8132bf8e36f..0c5a905f3de7 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -17,8 +17,9 @@ struct samsung_dsim;
>   
>   #define DSIM_STATE_ENABLED		BIT(0)
>   #define DSIM_STATE_INITIALIZED		BIT(1)
> -#define DSIM_STATE_CMD_LPM		BIT(2)
> -#define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
> +#define DSIM_STATE_REINITIALIZED	BIT(2)
> +#define DSIM_STATE_CMD_LPM		BIT(3)
> +#define DSIM_STATE_VIDOUT_AVAILABLE	BIT(4)
>   
>   enum samsung_dsim_type {
>   	SAMSUNG_DSIM_TYPE_EXYNOS3250,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

