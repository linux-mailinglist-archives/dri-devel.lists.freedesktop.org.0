Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55E6E6597
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781D10E147;
	Tue, 18 Apr 2023 13:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAAC10E147
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:12:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230418131223euoutp02326bebb1c37a1f55bafc0cab5c5e9d25~XCZoS5Y_k2797427974euoutp02H
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:12:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230418131223euoutp02326bebb1c37a1f55bafc0cab5c5e9d25~XCZoS5Y_k2797427974euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1681823543;
 bh=GLMLV4crR6NxxiI8SBdm48JU6uAFLVNA5moLlPqaAiA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Fl9VtpJXo8JxGD8zpWuq5BJxru0OF78ayGiI22X6N4k8DNSaa5v7ImCAimd5qdGZR
 4uU8YY4Gtpi/tuMwYzEWzZNdfkIcAqSKNP+jbqV5I2IDyj6zLFAgSQ3tFDEzHczxKW
 lx/f+Bzm6etnsxxF7E9pkbI7PEPdp+MJqHPh7u+k=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230418131222eucas1p1d9a360aec30c05913fb0d044cded69f5~XCZn6k1Wq2411424114eucas1p1A;
 Tue, 18 Apr 2023 13:12:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F9.83.09966.6379E346; Tue, 18
 Apr 2023 14:12:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230418131222eucas1p1414e4162953426f447e5eec90707283d~XCZnYJbEM2850928509eucas1p1Y;
 Tue, 18 Apr 2023 13:12:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230418131222eusmtrp2945b1a760a1a47399cd9f5cf5e3242b0~XCZnXbO5F1633716337eusmtrp21;
 Tue, 18 Apr 2023 13:12:22 +0000 (GMT)
X-AuditID: cbfec7f4-d39ff700000026ee-20-643e9736004f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8A.B0.34412.6379E346; Tue, 18
 Apr 2023 14:12:22 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230418131221eusmtip2546e1b377408cae8e4284154f1baf4d7~XCZmq62rx2703227032eusmtip2P;
 Tue, 18 Apr 2023 13:12:21 +0000 (GMT)
Message-ID: <0c4f2703-8810-fe0f-76aa-cc6250aea74a@samsung.com>
Date: Tue, 18 Apr 2023 15:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 3/3] drm: bridge: samsung-dsim: Remove init quirk
 for Exynos
Content-Language: en-US
To: Frieder Schrempf <frieder@fris.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@gmail.com>, dri-devel@lists.freedesktop.org, Inki Dae
 <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230418104256.878017-1-frieder@fris.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMKsWRmVeSWpSXmKPExsWy7djP87pm0+1SDPYu0LQ4cX0Rk8X9xZ9Z
 LP5vm8hsceXrezaL3qXnWC1WnJ7LZDHp/gQWiy+bJrBZPJ+/jtHi5JurLBadE5ewW1zeNYfN
 4k1bI6PF+523GC0mzbvJ6sDvsfbjfVaPebNOsHjs/baAxWNbo7XHzll32T1md8xk9Vi85yWT
 x6ZVnWweR64uZvU4MeESk8eda3vYPO53H2fy6NuyitHj8ya5AL4oLpuU1JzMstQifbsEroxV
 x84yF/yVrpg58yhbA+N3sS5GTg4JAROJiVfns3YxcnEICaxglFj3+yYbhPOFUWLu+pPsEM5n
 RokN19ayw7S8frKeGcQWEljOKHGu0Ryi6COjxJNb19lAErwCdhL/2j6zdDFycLAIqEqsfWkC
 ERaUODnzCQuILSqQKtE0+w3YTGGBMImZR1cxgdjMAuISt57MZwKZKSLwkUmib95dZhCHWeAq
 o8SUF2vButkEDCW63naBLeMUMJOY8W8GVLe8xPa3c8AaJAQecUrM/nCOGeJsF4kFF+ZDvSAs
 8er4FihbRuL/Toh1EgLtjBILft+HciYwSjQ8v8UIUWUtcefcLzaQf5gFNCXW79KHCDtKfPm3
 gRkkLCHAJ3HjrSDEEXwSk7ZNhwrzSnS0CUFUq0nMOr4Obu3BC5eYJzAqzUIKmFlIATALyTuz
 EPYuYGRZxSieWlqcm55abJSXWq5XnJhbXJqXrpecn7uJEZguT/87/mUH4/JXH/UOMTJxMB5i
 lOBgVhLhPeNqlSLEm5JYWZValB9fVJqTWnyIUZqDRUmcV9v2ZLKQQHpiSWp2ampBahFMlomD
 U6qBacVTVkubvKe3d167X1NUaL/wP2e08f+Dm9+723skzzwTcNG1tWXfjauRPRc/vdgsKeb0
 7SzLZf5vTz6tOaum1Ln3nva7Izfmepbnb42a8uWvdNS8hs2rYvafaVn0eGpo+auH6t9LPR8o
 Z07/mGrUpzF3fsynz/JvZxlvmrJx9QyGt+vNUxjij16JVWCfN0vjaE3PVL/Ukij9pf993jBu
 6Nl+OW3tdt0X/VIW5fsbrH1fGX0u+/hLzT825+WDNy81TE+eqFOsUPt+Q2aK+pfIJW+3SfTJ
 3jXceoLz4dQXK9drnOd7qlShoXbZ5L8pm4hm/cu7fkl3zRVE3BY8X+6imi3a//n6Vmd3leKt
 fT93rtVUYinOSDTUYi4qTgQAp9MHlQYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42I5/e/4PV2z6XYpBjuXclicuL6IyeL+4s8s
 Fv+3TWS2uPL1PZtF79JzrBYrTs9lsph0fwKLxZdNE9gsns9fx2hx8s1VFovOiUvYLS7vmsNm
 8aatkdHi/c5bjBaT5t1kdeD3WPvxPqvHvFknWDz2flvA4rGt0dpj56y77B6zO2ayeize85LJ
 Y9OqTjaPI1cXs3qcmHCJyePOtT1sHve7jzN59G1ZxejxeZNcAF+Unk1RfmlJqkJGfnGJrVK0
 oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaqY2eZC/5KV8yceZStgfG7WBcj
 J4eEgInE6yfrmbsYuTiEBJYySrTcXc0IkZCRODmtgRXCFpb4c62LDaLoPaPEovM32EESvAJ2
 Ev/aPrN0MXJwsAioSqx9aQIRFpQ4OfMJC4gtKpAqcWPPHzaQEmGBMIlzu9JBwswC4hK3nsxn
 AhkpIvCRSaL99llWEIdZ4DqjxJa/q1kglnUySry6dIgNpIVNwFCi620XmM0pYCYx498MJohR
 ZhJdW7sYIWx5ie1v5zBPYBSaheSQWUg2zkLSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6
 yfm5mxiB6WHbsZ9bdjCufPVR7xAjEwfjIUYJDmYlEd4zrlYpQrwpiZVVqUX58UWlOanFhxhN
 gYExkVlKNDkfmKDySuINzQxMDU3MLA1MLc2MlcR5PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqY
 UsOZfiT/z1+w/owZX3zd5ec8VySi9PeF6u358WBt/4/rgUeq/vw4euAwd+yfiqWbTd277XNZ
 6rZ+nlIbPzf+FpNu98TfklZFd3JMXqe/3XfD+E7+Fv7MsonhWUxzwkLme37cOsNuwqK6l5Je
 R7e8d7+y9OfNCce/T+497LxEmCFzc+bnHzzr7X9wR5bpBkSyb38VXe6yddOXpxts/r3OzHBr
 U5v94Mepwxole7T3RkxlSdieuF3/vTXDk/d3I+eI3a3g1G0JPRskGJqUXeInlHq8tFr1XOWx
 qzq5Id0xPSERLyOblhnFrFi+4KTCcsN995VvHXvEVJXnwlCpc7WnXIw1qnXO0bbe8JcF3/sF
 lViKMxINtZiLihMBBSBJNZgDAAA=
X-CMS-MailID: 20230418131222eucas1p1414e4162953426f447e5eec90707283d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230418104305eucas1p145a8fa1560520ebe430590abdeabb66e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230418104305eucas1p145a8fa1560520ebe430590abdeabb66e
References: <CGME20230418104305eucas1p145a8fa1560520ebe430590abdeabb66e@eucas1p1.samsung.com>
 <20230418104256.878017-1-frieder@fris.de>
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.04.2023 12:42, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> Assuming that with the init flow fixed to meet the documentation at
> [1] and the pre_enable_prev_first flag set in downstream bridge/panel
> drivers which require it, we can use the default flow for Exynos as
> already done for i.MX8M.
>
> [1] https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> I have no idea if my assumptions are correct and if this works at all.
> There's a very good chance it doesn't...

Unfortunately this change breaks all Exynos boards with DSI panels. I've 
check all 4 panels that are in mainline and none worked.

> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 39 ++++++++-------------------
>   1 file changed, 11 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 9775779721d9..8c68b767ae50 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1336,18 +1336,12 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
>   
> -	/*
> -	 * For Exynos-DSIM the downstream bridge, or panel are expecting
> -	 * the host initialization during DSI transfer.
> -	 */
> -	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> -		ret = samsung_dsim_init(dsi);
> -		if (ret)
> -			return;
> +	ret = samsung_dsim_init(dsi);
> +	if (ret)
> +		return;
>   
> -		samsung_dsim_set_display_mode(dsi);
> -		samsung_dsim_set_display_enable(dsi, true);
> -	}
> +	samsung_dsim_set_display_mode(dsi);
> +	samsung_dsim_set_display_enable(dsi, true);
>   }
>   
>   static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> @@ -1356,14 +1350,9 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>   	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>   	u32 reg;
>   
> -	if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> -		samsung_dsim_set_display_mode(dsi);
> -		samsung_dsim_set_display_enable(dsi, true);
> -	} else {
> -		reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> -		reg &= ~DSIM_FORCE_STOP_STATE;
> -		samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> -	}
> +	reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> +	reg &= ~DSIM_FORCE_STOP_STATE;
> +	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>   
>   	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
>   }
> @@ -1377,11 +1366,9 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return;
>   
> -	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> -		reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> -		reg |= DSIM_FORCE_STOP_STATE;
> -		samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> -	}
> +	reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> +	reg |= DSIM_FORCE_STOP_STATE;
> +	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>   
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>   }
> @@ -1680,10 +1667,6 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return -EINVAL;
>   
> -	ret = samsung_dsim_init(dsi);
> -	if (ret)
> -		return ret;
> -
>   	ret = mipi_dsi_create_packet(&xfer.packet, msg);
>   	if (ret < 0)
>   		return ret;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

