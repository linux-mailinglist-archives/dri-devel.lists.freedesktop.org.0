Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966A525BE90
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 11:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC016E974;
	Thu,  3 Sep 2020 09:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C426E974
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 09:41:02 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200903094100euoutp02e3d5dfc2faa59f021a10bc38fe8d6f0b~xPK4EWufN1022310223euoutp02q
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 09:41:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200903094100euoutp02e3d5dfc2faa59f021a10bc38fe8d6f0b~xPK4EWufN1022310223euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599126060;
 bh=lNzTVOe1RlGYarJbAujtBN+OfuISkyE1D+uzUxy0yEg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=WyNgAeQKca1mnwKSz5gpJood5vK6Cu4ns6iB/bhMpBperj5XkkmCE0S19DkYA9rpJ
 oNCWZ5S1dbec5RbRFad012snJZxUYh15gaFq9aFZG2pgAQEWfGyYRkj4TMyp/rySb9
 zPsuEpV1mMyFcg0kEOv2IGxCZ8wRbUbe7vbDfMAY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200903094100eucas1p224e038d77c9bbcca6f352ac2ccb86a09~xPK33Mowl1933119331eucas1p2r;
 Thu,  3 Sep 2020 09:41:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C8.28.06318.C2AB05F5; Thu,  3
 Sep 2020 10:41:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200903094100eucas1p27170359050cf9c124c6a502aecec1ceb~xPK3kY64i1931419314eucas1p2x;
 Thu,  3 Sep 2020 09:41:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200903094100eusmtrp153ad5fa5ab8e9453a48d2b46b9b26f72~xPK3jrcxr1904119041eusmtrp1U;
 Thu,  3 Sep 2020 09:41:00 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-51-5f50ba2cbec3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 38.B7.06017.C2AB05F5; Thu,  3
 Sep 2020 10:41:00 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200903094059eusmtip24aa3871c5935ef4c55ce2f5d54d62874~xPK2-wqZt2510625106eusmtip2P;
 Thu,  3 Sep 2020 09:40:59 +0000 (GMT)
Subject: Re: [PATCH v4 04/15] drm/bridge: tc358764: add drm_panel_bridge
 support
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <cebb8200-db9e-5c3f-6808-f4e8068e4eeb@samsung.com>
Date: Thu, 3 Sep 2020 11:40:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200726203324.3722593-5-sam@ravnborg.org>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTYRTGfe+9266z2XUaO9iXDgmL0mIFtzSpiLoRofVXaGlLL1Pa1La0
 rCDLCrUP/KBsU/vQmVqGfVlulMWIObfUMjXDylhSLBqD3IypfbjdJP97zjm/5z3ngZfExUO8
 cDIr+xCrzpYrpXwh8cjs7Vmx3JiUttLsiaD7PS4+PfDTgdNd3wcIuqRcL6C/Fdn5dIs5mLbd
 bMVp08UUetxZgugmbxuivcarxIYgxjV0RsD8+vqWYM6NmXDGoPsgYKqLtTym/okDYyxlfRgz
 cq4TY/SXB/jM8wuVRJIwWRifwSqz8ll1bMI+YebZyXoit2XDEUfzfawQ/ZCVokASqNUw8KWb
 KEVCUkw1IXja95rHFW4Ebxo+C7hiDMHv8jfYjKX6aznGDRoRuO9o/1EuBHWDesJHhVK7wPPC
 yvfpMOo4fHytRT4Ip/owaH9h9D/Fp5bCrwfv/JCISoDb9ZN+M0FFQfuNZwKfnkelgtlqJzgm
 BLq0o34dSNGgN2j9DE4thsfOGpzTEjjlbvaHAMojgI+1k4i7ezP09tv5nA6Fb50PBZxeALbK
 8wSnT8BI02mcMxcjaLtrwLlBHLzvmZg2k9MblkKrMZZrbwSnexjztYEKhiFnCHdDMFQ8qsK5
 tgiKz4o5OhJGutv+PSiBhlcefhmS6mYl081Ko5uVRvd/73VE3EISNk+jUrAaWTZ7OEYjV2ny
 shUx6Tmq+2j6v9l+d3raUcfUfhOiSCSdI7K0JaaJefJ8TYHKhIDEpWGiTd22VLEoQ15wlFXn
 pKnzlKzGhOaThFQiktU59oophfwQe4Blc1n1zBQjA8MLkTpaZg6xfLIUKv+8W5bf3yAo2H5m
 3bC1Ao125GyRxZUb4lPmosW8tbsvVSwJD3q7M6AnKOGkwTqVsedgtDECO1VV4Dx95fKqa3mu
 3vH2l2xYUI2itogtoj359m3eYwHU4Ogzy9ahHc12cqE4XdGY425lIyfWLEruSRx2rL8XGiUl
 NJnyVctwtUb+F1goKhFrAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsVy+t/xe7o6uwLiDXo381pc+fqezeLq95fM
 FiffXGWx6Jy4hN3iVfMjNos1x/gsTi9bz2xxqC/a4tvbTkaLFT+3Mlr83DWPxYHb4/2NVnaP
 v8+vs3h0fz7E7LFz1l12j9kdM1k9Fu95yeRxYsIlJo/73ceZPJZMu8rmcaB3MksAV5SeTVF+
 aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJeRtvvxSwFaxwq
 Xq7cxNTA+Mm4i5GTQ0LARGL284lMXYxcHEICSxklGnu3sUEkxCV2z3/LDGELS/y51sUGUfSW
 UeLkx2tgRcICQRJfj5wCs0UEaiTeft7KDFLELHCFSeLupanMEB07GSU2fZjMBFLFJqAp8Xfz
 TbAOXgE7idWLf7OA2CwCKhI7Fu5nB7FFBeIkzvS8gKoRlDg58wlYDaeAhcSSnTPBapgFzCTm
 bX7IDGHLS2x/OwfKFpdo+rKSdQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnF
 pXnpesn5uZsYgRG97djPLTsYu94FH2IU4GBU4uE9sdU/Xog1say4MvcQowQHs5IIr9PZ03FC
 vCmJlVWpRfnxRaU5qcWHGE2BnpvILCWanA9MNnkl8YamhuYWlobmxubGZhZK4rwdAgdjhATS
 E0tSs1NTC1KLYPqYODilGhibeCTiEj98kVllYJzyzoUx5YjQwpDdC5o2BNh83vlo68Iq1rlF
 qrLLP5bOttCYbLJo4+T1bBn53q0GS1qEElidPr98fuGU8m+GF1X3z9eF7FF3rHOb3FF8IoTh
 yqZ65QtxS71EPec0vCs4e6dczvqR8YbyHPdlBnpzBfmXZNZxuzcKV5jYmiixFGckGmoxFxUn
 AgCAUex//gIAAA==
X-CMS-MailID: 20200903094100eucas1p27170359050cf9c124c6a502aecec1ceb
X-Msg-Generator: CA
X-RootMTR: 20200726203348eucas1p19db397b6847501d17de6ae168813c9d8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200726203348eucas1p19db397b6847501d17de6ae168813c9d8
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <CGME20200726203348eucas1p19db397b6847501d17de6ae168813c9d8@eucas1p1.samsung.com>
 <20200726203324.3722593-5-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26.07.2020 22:33, Sam Ravnborg wrote:
> Prepare the tc358764 bridge driver for use in a chained setup by
> replacing direct use of drm_panel with drm_panel_bridge support.
>
> The bridge panel will use the connector type reported by the panel,
> where the connector for this driver hardcodes DRM_MODE_CONNECTOR_LVDS.
>
> The tc358764 did not any additional info the the connector so the
> connector creation is passed to the bridge panel driver.
>
> v3:
>    - Merge with patch to make connector creation optional to avoid
>      creating two connectors (Laurent)
>    - Pass connector creation to bridge panel, as this bridge driver
>      did not add any extra info to the connector.
>    - Set bridge.type to DRM_MODE_CONNECTOR_LVDS.
>
> v2:
>    - Use PTR_ERR_OR_ZERO() (kbuild test robot)
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: kbuild test robot <lkp@intel.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>   drivers/gpu/drm/bridge/tc358764.c | 107 +++++-------------------------
>   1 file changed, 16 insertions(+), 91 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
> index a277739fab58..fdde4cfdc724 100644
> --- a/drivers/gpu/drm/bridge/tc358764.c
> +++ b/drivers/gpu/drm/bridge/tc358764.c
> @@ -153,10 +153,9 @@ static const char * const tc358764_supplies[] = {
>   struct tc358764 {
>   	struct device *dev;
>   	struct drm_bridge bridge;
> -	struct drm_connector connector;
>   	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
>   	struct gpio_desc *gpio_reset;
> -	struct drm_panel *panel;
> +	struct drm_bridge *panel_bridge;
>   	int error;
>   };
>   
> @@ -210,12 +209,6 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
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
> @@ -278,43 +271,11 @@ static void tc358764_reset(struct tc358764 *ctx)
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


Using this bridge_panel thing you reverse order of hw 
initialization/de-initialization, this is incorrect.

For example:

- panel_unprepare should be called before tc35* turn off,

- panel_prepare should be called after tc35* on.

This is why I avoid the whole "bridge chaining" - it enforces ridiculous 
order of initialization.


>   	tc358764_reset(ctx);
>   	usleep_range(10000, 15000);
>   	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> @@ -335,70 +296,28 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
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
> -	drm_panel_attach(ctx->panel, &ctx->connector);
> -	ctx->connector.funcs->reset(&ctx->connector);


I guess lack of calling .reset here is direct cause of WARN reported by 
Marek.


Summarizing my findings:

1. drm_panel_bridge does not fit to this scenario - it relays on 'bridge 
chaining" which has crazy assumption that order of hw initalization in 
the display chain follows the same fixed order of calls for all hw.

2. tc35* bridge allocates/deallocates connector dynamically - to safely 
handle drivers load/unload, and to avoid multiple deferred probe issues 
, drm_panel_bridge does not support it.


This and previous patch violates both points.


Regards

Andrzej


> -
> -	return 0;
> -}
> -
> -static void tc358764_detach(struct drm_bridge *bridge)
>   {
>   	struct tc358764 *ctx = bridge_to_tc358764(bridge);
>   
> -	drm_panel_detach(ctx->panel);
> -	ctx->panel = NULL;
> +	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
> +				 bridge, flags);
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
> +	struct drm_bridge *panel_bridge;
>   	struct device *dev = ctx->dev;
> +	struct drm_panel *panel;
>   	int ret;
>   
>   	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> @@ -407,12 +326,17 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
>   		return PTR_ERR(ctx->gpio_reset);
>   	}
>   
> -	ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
> -					  NULL);
> -	if (ret && ret != -EPROBE_DEFER)
> -		dev_err(dev, "cannot find panel (%d)\n", ret);
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> +	if (ret)
> +		return ret;
>   
> -	return ret;
> +	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +
> +	if (IS_ERR(panel_bridge))
> +		return PTR_ERR(panel_bridge);
> +
> +	ctx->panel_bridge = panel_bridge;
> +	return 0;
>   }
>   
>   static int tc358764_configure_regulators(struct tc358764 *ctx)
> @@ -458,6 +382,7 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
>   		return ret;
>   
>   	ctx->bridge.funcs = &tc358764_bridge_funcs;
> +	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
>   	ctx->bridge.of_node = dev->of_node;
>   
>   	drm_bridge_add(&ctx->bridge);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
