Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4DF4E7593
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FFD10E72F;
	Fri, 25 Mar 2022 15:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFD010E72F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:01:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220325150120euoutp01e208c61633e9af491dbea7d0cf2c6ad6~fp8tRvgmU2551625516euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:01:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220325150120euoutp01e208c61633e9af491dbea7d0cf2c6ad6~fp8tRvgmU2551625516euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648220480;
 bh=ij1vinpp99xNEpvR0di3HxfomrhkUvCF3knZW3FNuCA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=OSIzFi7F+vjw7MncvhwVgXUdjYnlq7xffTJLUY3peLZr1HmUyHsr51nYboKvKyqG3
 SXJSo+RTot0LCPpYklQ3FYbMDkR4qKnPqREyhaiEPRJgKc++RIAmB0YyXPfx5gN9Rd
 efUKqXZ+sM3tZBmy7sLW6e/bLbm4hBhiTqvHX6Q4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220325150119eucas1p248fd7c391e9fbab156d177225080ddcf~fp8sw8mkq2519425194eucas1p28;
 Fri, 25 Mar 2022 15:01:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 18.C0.10009.F39DD326; Fri, 25
 Mar 2022 15:01:19 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220325150119eucas1p207124cf9ca47cd248184102c33340547~fp8sScOew2749927499eucas1p2D;
 Fri, 25 Mar 2022 15:01:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220325150119eusmtrp24c2312241c911c9a64e9d3e5a1fa49b0~fp8sRp7mU2057120571eusmtrp2O;
 Fri, 25 Mar 2022 15:01:19 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-c5-623dd93f564b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A7.0C.09404.F39DD326; Fri, 25
 Mar 2022 15:01:19 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220325150118eusmtip2a6814491f4fc02e61dce68b2649f40ef~fp8rnEqXh1686716867eusmtip2P;
 Fri, 25 Mar 2022 15:01:18 +0000 (GMT)
Message-ID: <16744c9b-2364-9247-3599-2ff9acaecf64@samsung.com>
Date: Fri, 25 Mar 2022 16:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 1/6] drm: bridge: tc358764: Use drm panel_bridge API
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220303163654.3381470-2-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7r2N22TDDqPa1jcX/yZxeLK1/ds
 FpPuT2Cx+LJpAptF58Ql7BbLJ+xjszjV2Mpicagv2uLTrIfMFit+bmV04PJY+/E+q8f7G63s
 HrM7ZrJ6LN7zksnjzrU9bB73u48zeSyZdpXNo2/LKsYAjigum5TUnMyy1CJ9uwSujFsXWQtm
 mVdcb7zF1sD4WqeLkZNDQsBE4sXuH4xdjFwcQgIrGCWez7rIDuF8YZQ4uPESlPOZUeLRoQ1M
 XYwcYC1nnhhDxJczSlxsXQnV/pFR4szVM2wgRbwCdhLH9gmBrGARUJXY0dLECGLzCghKnJz5
 hAXEFhVIkli9fTUbiC0s4C2xsnkiWA2zgLjErSfzmUBmigg8YpJ4+uc/K0TCXeLpm23MIDab
 gKFE19susGZOASeJj2ceQdXIS2x/O4cZpFlCoJtTYtqrt4wQj7pITFu1iRnCFpZ4dXwLO4Qt
 I/F/53yoz/Il/s4whghXSFx7vQaq3FrizrlfYH8xC2hKrN+lDxF2lNj28C8rRCefxI23ghAX
 8ElM2jadGSLMK9HRJgRRrSYx6/g6uJ0HL1xinsCoNAspUGYheX4Wkl9mIexdwMiyilE8tbQ4
 Nz212DAvtVyvODG3uDQvXS85P3cTIzBxnf53/NMOxrmvPuodYmTiYDzEKMHBrCTCe/+ydZIQ
 b0piZVVqUX58UWlOavEhRmkOFiVx3uTMDYlCAumJJanZqakFqUUwWSYOTqkGJrkTWTJmfidF
 KxiL23Nv/9yyzPjw2aPGcp73f/rqbVr4cMfHtTy31OwuPGQ2Pz7n9G3BSMmNB4Trbr+QlXIO
 j5ur+Kt7oYiRRqNuaFmASqHRKk+pmxuz4w9YBcxSf37lYMlTWQf2wM1iEzfHzPM805Qb3Dkl
 jvGV4vS/4UePOk6sdcy0Y085fv7877r5W+SdTjtqbdguxGw/I+fUlbTad1Nvevo/2fY+peCq
 Zmbg6u+zVvtxytTMFzRY5tbBc+pzkXyTUGr18boHZUkuEomfr+x8dCY6V+2ls4/5lwfMJ3ij
 T7y+p5pZeGK/tFFkTOmsnULfLred6pt9le/M+kVT2bJZu46ueOpXc/LutklR35VYijMSDbWY
 i4oTAdxYCfLLAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xe7r2N22TDDZ8Y7O4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGqsZXF4lBftMWnWQ+ZLVb83MrowOWx9uN9Vo/3N1rZ
 PWZ3zGT1WLznJZPHnWt72Dzudx9n8lgy7SqbR9+WVYwBHFF6NkX5pSWpChn5xSW2StGGFkZ6
 hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GbcushbMMq+43niLrYHxtU4XIweHhICJ
 xJknxl2MXBxCAksZJd52f2TqYuQEistInJzWwAphC0v8udbFBlH0nlHi+dnHrCDNvAJ2Esf2
 CYHUsAioSuxoaWIEsXkFBCVOznzCAmKLCiRJXOpqB4sLC3hLrGyeCGYzC4hL3HoynwlkpojA
 MyaJo5vWskIk3CWevtnGDLHsLKPE/Rs3wBJsAoYSXW9BruDk4BRwkvh45hFUg5lE19YuqKny
 EtvfzmGewCg0C8khs5AsnIWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzEC43Xb
 sZ9bdjCufPVR7xAjEwfjIUYJDmYlEd77l62ThHhTEiurUovy44tKc1KLDzGaAkNjIrOUaHI+
 MGHklcQbmhmYGpqYWRqYWpoZK4nzehZ0JAoJpCeWpGanphakFsH0MXFwSjUw+feH94n/Zu69
 EV7CF//I8ZjTO+W0u3UH64sYhNmiuH/YPGWyzeh7K/h9koBagnuESZbU4pnWa5O+P81ZH/+o
 Ieb3Au5JkkrhculXP6/QfRb64mtIzNmXrgzCN7TWzi/fae0eZSzpIqnsfMCj8Fq7UZbr7UkT
 y5N72N687ha1e3f+7a+Z/urh69+bT/itpnF4Yee53nMMs+1O7lpu3ebz+pb4YosUD3PBpKh5
 LV9UxZv7Mv9cdzebW/iQo7Fh73qvtIRtTw4dL/YMz7zcsOqqvL/Jq53nRURkr8b+0Pjku6nc
 ZJbs3+wEF+HH06YaXfVYynUnk7nnozWruv5NoTx358lKO/ccqP7Xz8lSoK7EUpyRaKjFXFSc
 CAC66fBQYAMAAA==
X-CMS-MailID: 20220325150119eucas1p207124cf9ca47cd248184102c33340547
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220303163740eucas1p1bf0b96980e128fe2b1427c53924e09c5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220303163740eucas1p1bf0b96980e128fe2b1427c53924e09c5
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <CGME20220303163740eucas1p1bf0b96980e128fe2b1427c53924e09c5@eucas1p1.samsung.com>
 <20220303163654.3381470-2-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03.03.2022 17:36, Jagan Teki wrote:
> Replace the manual panel handling code by a drm panel_bridge via
> devm_drm_of_get_bridge().
>
> Adding panel_bridge handling,
>
> - Drops drm_connector and related operations as drm_bridge_attach
>    creates connector during attachment.
>
> - Drops panel pointer and panel healpers.
>
> This simplifies the driver and allows all components in the display
> pipeline to be treated as bridges.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes for v6:
> - none
> Changes for v2:
> - s/panel_bridge/next_bridge
> - drop unneeded headers
>
>   drivers/gpu/drm/bridge/tc358764.c | 104 ++----------------------------
>   1 file changed, 6 insertions(+), 98 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> index c1e35bdf9232..dca41ed32f8a 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -16,14 +16,9 @@
>   #include <video/mipi_display.h>
>   
>   #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_bridge.h>
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_fb_helper.h>
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_of.h>
> -#include <drm/drm_panel.h>
>   #include <drm/drm_print.h>
> -#include <drm/drm_probe_helper.h>
>   
>   #define FLD_MASK(start, end)    (((1 << ((start) - (end) + 1)) - 1) << (end))
>   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end))
> @@ -153,10 +148,9 @@ static const char * const tc358764_supplies[] = {
>   struct tc358764 {
>   	struct device *dev;
>   	struct drm_bridge bridge;
> -	struct drm_connector connector;
> +	struct drm_bridge *next_bridge;
>   	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
>   	struct gpio_desc *gpio_reset;
> -	struct drm_panel *panel;
>   	int error;
>   };
>   
> @@ -210,12 +204,6 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
>   	return container_of(bridge, struct tc358764, bridge);
>   }
>   
> -static inline
> -struct tc358764 *connector_to_tc358764(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct tc358764, connector);
> -}
> -
>   static int tc358764_init(struct tc358764 *ctx)
>   {
>   	u32 v = 0;
> @@ -278,43 +266,11 @@ static void tc358764_reset(struct tc358764 *ctx)
>   	usleep_range(1000, 2000);
>   }
>   
> -static int tc358764_get_modes(struct drm_connector *connector)
> -{
> -	struct tc358764 *ctx = connector_to_tc358764(connector);
> -
> -	return drm_panel_get_modes(ctx->panel, connector);
> -}
> -
> -static const
> -struct drm_connector_helper_funcs tc358764_connector_helper_funcs = {
> -	.get_modes = tc358764_get_modes,
> -};
> -
> -static const struct drm_connector_funcs tc358764_connector_funcs = {
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static void tc358764_disable(struct drm_bridge *bridge)
> -{
> -	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> -	int ret = drm_panel_disable(bridge_to_tc358764(bridge)->panel);
> -
> -	if (ret < 0)
> -		dev_err(ctx->dev, "error disabling panel (%d)\n", ret);
> -}
> -
>   static void tc358764_post_disable(struct drm_bridge *bridge)
>   {
>   	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>   	int ret;
>   
> -	ret = drm_panel_unprepare(ctx->panel);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "error unpreparing panel (%d)\n", ret);
>   	tc358764_reset(ctx);
>   	usleep_range(10000, 15000);
>   	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> @@ -335,72 +291,25 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
>   	ret = tc358764_init(ctx);
>   	if (ret < 0)
>   		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
> -	ret = drm_panel_prepare(ctx->panel);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "error preparing panel (%d)\n", ret);
> -}
> -
> -static void tc358764_enable(struct drm_bridge *bridge)
> -{
> -	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> -	int ret = drm_panel_enable(ctx->panel);
> -
> -	if (ret < 0)
> -		dev_err(ctx->dev, "error enabling panel (%d)\n", ret);
>   }
>   
>   static int tc358764_attach(struct drm_bridge *bridge,
>   			   enum drm_bridge_attach_flags flags)
> -{
> -	struct tc358764 *ctx = bridge_to_tc358764(bridge);
> -	struct drm_device *drm = bridge->dev;
> -	int ret;
> -
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> -
> -	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
> -	ret = drm_connector_init(drm, &ctx->connector,
> -				 &tc358764_connector_funcs,
> -				 DRM_MODE_CONNECTOR_LVDS);
> -	if (ret) {
> -		DRM_ERROR("Failed to initialize connector\n");
> -		return ret;
> -	}
> -
> -	drm_connector_helper_add(&ctx->connector,
> -				 &tc358764_connector_helper_funcs);
> -	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
> -	ctx->connector.funcs->reset(&ctx->connector);
> -	drm_connector_register(&ctx->connector);
> -
> -	return 0;
> -}
> -
> -static void tc358764_detach(struct drm_bridge *bridge)
>   {
>   	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>   
> -	drm_connector_unregister(&ctx->connector);
> -	ctx->panel = NULL;
> -	drm_connector_put(&ctx->connector);
> +	return drm_bridge_attach(bridge->encoder, ctx->next_bridge, bridge, flags);
>   }
>   
>   static const struct drm_bridge_funcs tc358764_bridge_funcs = {
> -	.disable = tc358764_disable,
>   	.post_disable = tc358764_post_disable,
> -	.enable = tc358764_enable,
>   	.pre_enable = tc358764_pre_enable,
>   	.attach = tc358764_attach,
> -	.detach = tc358764_detach,
>   };
>   
>   static int tc358764_parse_dt(struct tc358764 *ctx)
>   {
>   	struct device *dev = ctx->dev;
> -	int ret;
>   
>   	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>   	if (IS_ERR(ctx->gpio_reset)) {
> @@ -408,12 +317,11 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
>   		return PTR_ERR(ctx->gpio_reset);
>   	}
>   
> -	ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
> -					  NULL);
> -	if (ret && ret != -EPROBE_DEFER)
> -		dev_err(dev, "cannot find panel (%d)\n", ret);
> +	ctx->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(ctx->next_bridge))
> +		return PTR_ERR(ctx->next_bridge);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int tc358764_configure_regulators(struct tc358764 *ctx)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

