Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F757E3D1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 17:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3EF911DA;
	Fri, 22 Jul 2022 15:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA95D91630
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 15:35:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220722153503euoutp028e4996ef898083669631ebb10d9e6c63~EMLIDvxKY2383223832euoutp02g
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 15:35:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220722153503euoutp028e4996ef898083669631ebb10d9e6c63~EMLIDvxKY2383223832euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1658504103;
 bh=8iUWnppJCV9cxi73ncqkunMv5J6/UqB70bb8lGw2n3k=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=KzUpsuuehVYC5r/VzK8Dm3um+qUqCGBgAsg8ziuvehxIGgApxKDJ9tC4S3AxUa1GF
 PNw3N4OpCf27oofg2/8nDCKqdA0GbygmsG5dEWRaN0ro6zgvU2r+Y6LYBXvEDl1qk9
 OfepIKw1XHMes5z412CkwPJIojIqn8O+Qr7jKJ4k=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220722153503eucas1p29ef9a4a71db3286ba7fa795137935b6f~EMLHmFIgr0537105371eucas1p2q;
 Fri, 22 Jul 2022 15:35:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 5A.8C.09580.7A3CAD26; Fri, 22
 Jul 2022 16:35:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220722153502eucas1p2f821f4ed624695d0880e3f663ad05184~EMLHJPJVn0836008360eucas1p2B;
 Fri, 22 Jul 2022 15:35:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220722153502eusmtrp2fadd49a2a85be0ee3bc075eb306e7a33~EMLG3Vbxn3191631916eusmtrp27;
 Fri, 22 Jul 2022 15:35:02 +0000 (GMT)
X-AuditID: cbfec7f5-9adff7000000256c-d9-62dac3a70336
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 07.25.09095.6A3CAD26; Fri, 22
 Jul 2022 16:35:02 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220722153501eusmtip268ac35be11a31049a22881b1d390a26d~EMLFx2cKh0570605706eusmtip2Z;
 Fri, 22 Jul 2022 15:35:01 +0000 (GMT)
Message-ID: <8598bc48-ab5d-92fe-076a-c1e6ca74fccd@samsung.com>
Date: Fri, 22 Jul 2022 17:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 06/13] drm: bridge: samsung-dsim: Add DSI init in
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
 <tommaso.merciai@amarulasolutions.com>, Marek Vasut <marex@denx.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220720155210.365977-7-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxbVRje6f1o6Va8dB+cIMps3CKL6yDsx0k26dgQb/wjRBcUdWtXLqwK
 FHth3yrbAhsVCasTS7ewzpaUkQEWkG2GAMOuMAkFjFYEulI+EhirCC2KkA4plyn/nvd5n+d9
 3vfkCDCxnowQqHLyGE2OIktCCvFm+z+9uy0/Dh6LGfGJ0fBQN4bcJh+OpoeqSfTL/AyJvqxy
 EEjnLsORv6GMRJOP+nHUc+EJHxVfMfORpayVRA1jTgJpF29hSN/bykNPis4D1D1aj6Gfzhfi
 qKP0fTRn8Kw0v5oiUX/XHIb+XurBDmyja2fdBD0zUMinKw1dOH21y0bQjhIXSd8zuPj0tcsV
 BG1qmeLRtl9NBD3sbCFp9xedPLrR/Dlt/eMujy5tqgG0r+HF5OfShPvTmSzVCUazJ14uPG5r
 GiNy+7eeqnFdAwXAEqYFIQJI7YVLXiehBUKBmKoGsM7uWyv8ALZZdIArfABanBeIZ5a2wEWc
 a1gA1AXq1iyzAD5oneMHVSIqHhrbjWQQ49QO6GkeITk+DD6sGMeDeCulhHcWL61O3Uwdgf6Z
 kVUeo8Lh4PgNXnDoFqqegN7xq6t7YMGEkgUPFlSRVCzUerWrU0OoBHhj2k1w7ih4x3sd43b9
 WgiL/3qFw4mwsmmC5PBm+Lizic/hSLh8L5gmWMFqGNDHcfQp6Jy+vTZmHxx2LJJBCUZFw/of
 9nB0ArRr/STnDIUD3jBugVCoa/4G42gRvFwk5tQ7oaGz7r/M+30/Y2VAYlj3KIZ1xxvWnWL4
 P9cI8BoQzuSz2ZkMG5fDnJSyimw2PydTqlRnN4CVz9v9tHP+Lqh+PCvtADwB6ABQgEm2iCY+
 +e2YWJSuOH2G0aiPavKzGLYDPC/AJeEipeo7hZjKVOQxHzNMLqN51uUJQiIKePyU4qQU76tF
 ITbRkdtzoLNng3lp4+vJm/buGvLH8z0nTTFx0j6Z8qPJJNc7yW++cO4s7FL0DTRXVRXuTn1N
 p4oYLRy9OFkgwc0Z0vmKiaaDQ+/aTz+4Wa7rkpsWXI0bX4pPra38s9T6sJxayGi/lVVr3a63
 DR8+IdHp03zXWTZyW5TqDbauj1TbA4+mXo4+ajXtM15Simz4WJ5nga6JSg+YbzpKvle6KgwK
 Z9KY2Lkj7dvoyAOzmzLeloW2L/Xm7nyvUpYvsSbKPtw/Xy4XnflAtpzQok48fOXgobfMhz6T
 y1PkgzHL98/9Lt2w3RH61FjaO5LZ2PapKV98dibWnCrB2eOK2F2YhlX8CwIqwHorBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsVy+t/xe7rLDt9KMlh+X9bizu3TzBb3F39m
 sXh9ewWbxZWv79ksepeeY7WYdH8Ci8WXTRPYLF7cu8hicbbpDbtF58Ql7BbLJ+xjs9j0+Bqr
 RdevlcwWM87vY7J409bIaHH60Xpmi1ONrSwWh/qiLT7NegiUnPySzeLiiU/MFt9/n2V2EPNY
 +/E+q8f7G63sHvNmnWDxmHLiCKvHuZ67bB47Z91l95jdMZPVY/Gel0weR64uZvW4c20Pm8f9
 7uNMHpuX1HtsfLeDyaNvyypGj8+b5AL4o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyN
 zWOtjEyV9O1sUlJzMstSi/TtEvQyjmx5zFpwUbRi1d3ZjA2MywW7GDk5JARMJPb/bWbpYuTi
 EBJYyiixrO8aM0RCRuLktAZWCFtY4s+1LjaIoveMEguergNL8ArYSSw4sIANxGYRUJV4uO0B
 G0RcUOLkzCcsILaoQLJEy/8+sLiwQJzEl/cPwOLMAuISt57MZwIZKiKwlVXi1bZ1YBuYBT4y
 SlyavIUdYt1pRolbrVPBWtgEDCW63naBjeIUcJSY//o+K8QoM4murV2MELa8xPa3c5gnMArN
 QnLJLCQbZyFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAhLPt2M/NOxjnvfqo
 d4iRiYPxEKMEB7OSCO/TwutJQrwpiZVVqUX58UWlOanFhxhNgcExkVlKNDkfmPLySuINzQxM
 DU3MLA1MLc2MlcR5PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqY3I9uEDv8sZDlRcW333bHxHfz
 2HfPCPcIrmNm6Zsj3Psj4eee4ORT8SZZ3hfaG0yWXNjJbFgSVXCxmdlN797NytrdE05rcZ7a
 mHnq5q6ZVYp27U+WSAnP+D+rw2FaV4v7PrnQWtYX5gbKkSmcW5oO8vTKL2bYlKfTx8g6YbfM
 v00S17IOuyx5lZzE3HlV4/2SYxsvrznCKplkNpXRlbFFfMsX/8rV9g6GdxWmbp1UefN0Z3Ry
 YpnpdpXNretmTTrzyfk7f+GMvqz3t/z2feaf9GFKKc/igozfPD6rFpVvCzk2weXuz+OVE/q/
 /ri4XSRMdeXZ1Zc1Hz89e3QGT4bD1zmPjmzcay2adHSLm/nhXUosxRmJhlrMRcWJABk4Y1HB
 AwAA
X-CMS-MailID: 20220722153502eucas1p2f821f4ed624695d0880e3f663ad05184
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220720155316eucas1p2ab58c67670ef8f30f0827fdbe5c41ef2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220720155316eucas1p2ab58c67670ef8f30f0827fdbe5c41ef2
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
 <CGME20220720155316eucas1p2ab58c67670ef8f30f0827fdbe5c41ef2@eucas1p2.samsung.com>
 <20220720155210.365977-7-jagan@amarulasolutions.com>
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

On 20.07.2022 17:52, Jagan Teki wrote:
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

This is still problematic in case of Exynos. Without a workaround like this

https://github.com/mszyprow/linux/commit/11bbfc61272da9610dd5c574bb8ef838dc150961

the display on the all real DSI panels on my Exynos based boards is broken.


>
> v3:
> * none
>
> v2:
> * check initialized state in samsung_dsim_init
>
> v1:
> * keep DSI init in host transfer
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 9b74a3f98a17..b07909a52f2d 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1258,6 +1258,9 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
>   {
>   	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
>   
> +	if (dsi->state & DSIM_STATE_INITIALIZED)
> +		return 0;
> +
>   	samsung_dsim_reset(dsi);
>   	samsung_dsim_enable_irq(dsi);
>   
> @@ -1270,6 +1273,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
>   	samsung_dsim_set_phy_ctrl(dsi);
>   	samsung_dsim_init_link(dsi);
>   
> +	dsi->state |= DSIM_STATE_INITIALIZED;
> +
>   	return 0;
>   }
>   
> @@ -1289,6 +1294,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
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

