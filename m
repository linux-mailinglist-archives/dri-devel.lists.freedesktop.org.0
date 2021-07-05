Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F443BBC66
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 13:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351AB89911;
	Mon,  5 Jul 2021 11:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C818789911
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 11:48:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210705114803euoutp01bc307931800185c4230305a018b3e9fd~O4p4G7UHw0089700897euoutp01g
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 11:48:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210705114803euoutp01bc307931800185c4230305a018b3e9fd~O4p4G7UHw0089700897euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1625485683;
 bh=TWHebfNZHEMZzPcFEOQOODh5ZXY0IPXBMHUhGf0C9Bs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=bPH2+UU1RfTxCpN6OHAG5Xy5k4iGXD16+05M8o8saPu/MmFA267udOpnS4HYWPaVY
 cpN5AGWAGdrcxhZ708BNxgBri4CFPS/EGKywI0SKqJ2Z8k/CMNOGWY0f0Y2r/CNOTy
 Ov3Rm19wQarIk1zoCBUuD/3OVe+LVSfLcF97SsXg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210705114803eucas1p1b65a7543bb45d0a36be68adb206294fe~O4p3oSTzV0970609706eucas1p1M;
 Mon,  5 Jul 2021 11:48:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 7E.90.42068.371F2E06; Mon,  5
 Jul 2021 12:48:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210705114757eucas1p279a0d3dd831dd8feb8ac772e88614220~O4pybBbyt0432304323eucas1p2S;
 Mon,  5 Jul 2021 11:47:57 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210705114757eusmtrp2bfbc91708d36646fc674deac399d235d~O4pyaBdTn1711517115eusmtrp2M;
 Mon,  5 Jul 2021 11:47:57 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-26-60e2f1731460
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DD.4D.31287.D61F2E06; Mon,  5
 Jul 2021 12:47:57 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210705114756eusmtip2fc6d214d54fd08286f0a8fe13df43fa1~O4pxNN5Ps2165621656eusmtip2J;
 Mon,  5 Jul 2021 11:47:56 +0000 (GMT)
Subject: Re: [RFC PATCH 03/17] drm/exynos: dsi: Use the drm_panel_bridge API
To: Jagan Teki <jagan@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Daniel Vetter <daniel.vetter@intel.com>,
 Marek Vasut <marex@denx.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Fabio Estevam <festevam@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <7af964c7-0e92-f190-2a86-d7a061a05129@samsung.com>
Date: Mon, 5 Jul 2021 13:47:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704090230.26489-4-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xTZxjed269kLJDRfnCcMvqLTjBSYg7G44gw+xk92wxGW6BVjkpBijY
 A+I2EzsYFTvAqmSWA6NuQIrOdqFDVgUaVzuqAeuG4ioCHcwwkEtT2hlwk63tmRv/nud9nvd7
 3+fNJ0Slx4h44X5VKaNWKQplhBjr6ltyJ7H+CfnzVmMMNWxx45RpwIJSRmcI3frDR1DjQ29T
 tW0hdtKrx6igVU9QU2M/Y1TH3CJCXa+YFVDHTrQKKJPeTlDW327jlO7hWZQy3LAj1Kz2U0A5
 6j6gFrjxUOnUNJERS5v9Xpz2eaoENKepJehm7ipGX+RGBXRjdQNOt/RMI7RzqAWnR273ELT3
 cxdCf9d6hO6YtyF0Xec5QAesT78TvUe8I48p3H+QUW9Nl4vzuesjgpLga4ce9X+PaIBzhw6I
 hJBMhX1f3AVhLCXbAVw6tUkHxCEcBPDK0ATBk0BIqHeGXMJIx2kN4OsmAJvrXQhP/ADeCrRj
 4adWkW9Ah3sSDwux5C8Y9PfaIgJKTgI44I3MI8htUDenI8JYQqZD218NEQ9GroftV5fxMF5N
 7oO+ZgPOe2LgtYZ7EY+IzIA/Vj/6981nYOWFRpTHcXD4njGyESQXRLCjfgrjg2bB1gc3CR6v
 gvddnQIeJ8C/Lz5uqARw3G0W8KQGwJsVBsC70uCI+yERPgBKJsJvL23lyzvhwNgYxt8lGnrm
 YvglouHJrtMoX5bAaq2Ud2+EnMvy39gffhpE9UDGrYjGrYjDrYjD/T/3DMDOgTimjC1SMmyK
 iilPZhVFbJlKmbyvuMgKQr+1f9kVtAHTfX+yAyBC4ABQiMpiJbH1E3KpJE/x0ceMujhXXVbI
 sA7wlBCTxUn2dp7PlZJKRSlTwDAljPqxighF8Rok07Wgmt9p2miGtQcS3rJj3OqcKxc24XjK
 urX2tPjGS+buwaZgNvLrV8KvZ3KqsMxnC+Yvn89LK40yRW15UXtXqctK623rPjt7IkdgNnSB
 4c3bm+/kOZRbagml6JuK544eLd1Q3tdtvtP7/u7Gwy0PUo17u1JykwxV7GBFvljr9qI+R/rg
 4ZkvD05mLEpmlhK2w3ezLfrsNYqo1gXnkaSapt+pT44n7tqdZPQpX1m3LEfpkg32N8Haa1N7
 wGj3GfK9GOazy/LyVH3/y0986HmyLaUys2fNS68uHtoVmD+O3CjQjb5Qt1TTHh/o+dOmEWRp
 X1+fON0rNhaXeDyWpujhAzKMzVds24yqWcU/8LkBiBwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsVy+t/xe7q5Hx8lGPx/o2xxa905VovlZ9Yx
 W8w/AmRd+fqezeLhVX+L3qVA3qT7E1gsvmyawGbx4t5FFouNb38wWZxtesNu0TlxCbvF8gn7
 2Cw2Pb7GatH1ayWzxYzz+5gs3rQ1Mloc6ou2+DTrIVBo8ks2BxGPtR/vs3q8v9HK7jGroZfN
 Y96sEyweO2fdZfeY3TGT1WPxnpdMHkeuLmb1uHNtD5vH/e7jTB6bl9R7bHy3g8mjb8sqRo/P
 m+QC+KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0
 MmadvcNe8MWr4u/p7UwNjEdsuhg5OCQETCSmNzB2MXJxCAksZZR4uPQlSxcjJ1BcRuLktAZW
 CFtY4s+1LjaIoveMErs+fgFLCAv4SBw694wVJCEicJtF4vKJ9cwgCWaBZ4wSd3+lQXScZJTo
 +DMRLMEmYCjR9RZkFCcHr4CdxI4/M8HWsQioSKw48Q9sqqhAssTP9e1QNYISJ2c+AavhFHCQ
 ONrxlwVigZnEvM0PoZbJSzRvnQ1li0vcejKfaQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW5
 6bnFhnrFibnFpXnpesn5uZsYgclk27Gfm3cwznv1Ue8QIxMH4yFGCQ5mJRFekSmPEoR4UxIr
 q1KL8uOLSnNSiw8xmgL9M5FZSjQ5H5jO8kriDc0MTA1NzCwNTC3NjJXEebfOXRMvJJCeWJKa
 nZpakFoE08fEwSnVwMTjEhK7lNlVNY9j2az7+h33/+cXSm69yM9rJc3PnX/gkoOxOVfWqUtt
 XgWVq6/5/nsuKqqy4l3Cp2kMJz49TJljOUHcc0feVCbZbouSaVkHHYs6PRn3hH0Kz0x1dGp+
 lOIhzF0woYDJ9kXMXfHz8YKTu5sDnymJP4l3vdp1NPD8hAU3BKr7y23+850/k7jjkISlRf+W
 wzVv0kIWMtkcd5lwyeCFed926V0LFwp6pQeVLFv3Y3XEU0vp0Ogl0juzt1++3Sixvzilk8Vl
 3qZN0xZ+v3raXPHxtMVhRVt3KG67ZeXuE+qvFrjyZu3C2ad8ljtdO50nIpj/r/VVXQBP8p7f
 yitdK79sVe1dwFvyRImlOCPRUIu5qDgRAKg+o6avAwAA
X-CMS-MailID: 20210705114757eucas1p279a0d3dd831dd8feb8ac772e88614220
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210704090432eucas1p2fa4225336e35f3f5fd2fbf5da99001ff
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210704090432eucas1p2fa4225336e35f3f5fd2fbf5da99001ff
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <CGME20210704090432eucas1p2fa4225336e35f3f5fd2fbf5da99001ff@eucas1p2.samsung.com>
 <20210704090230.26489-4-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.07.2021 11:02, Jagan Teki wrote:
> Use drm_panel_bridge to replace manual panel and
> bridge_chain handling code.
>
> This makes the driver simpler to allow all components
> in the display pipeline to be treated as bridges by
> cleaning the way to generic connector handling.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

This breaks Exysos DSI driver operation (Trats board worked fine with 
only patches 1-2):

[    2.540066] exynos4-fb 11c00000.fimd: Adding to iommu group 0
[    2.554733] OF: graph: no port node found in /soc/fimd@11c00000
[    2.602819] [drm] Exynos DRM: using 11c00000.fimd device for DMA 
mapping operations
[    2.609649] exynos-drm exynos-drm: bound 11c00000.fimd (ops 
fimd_component_ops)
[    2.632558] exynos-drm exynos-drm: failed to bind 11c80000.dsi (ops 
exynos_dsi_component_ops): -22
[    2.642263] exynos-drm exynos-drm: master bind failed: -22
[    2.651017] exynos-drm: probe of exynos-drm failed with error -22

> ---
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 167 ++++--------------------
>   1 file changed, 23 insertions(+), 144 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index d7d60aee465b..24f0b082ac6d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -254,9 +254,6 @@ struct exynos_dsi_driver_data {
>   struct exynos_dsi {
>   	struct drm_encoder encoder;
>   	struct mipi_dsi_host dsi_host;
> -	struct drm_connector connector;
> -	struct drm_panel *panel;
> -	struct list_head bridge_chain;
>   	struct drm_bridge bridge;
>   	struct drm_bridge *out_bridge;
>   	struct drm_device *drm;
> @@ -287,7 +284,6 @@ struct exynos_dsi {
>   };
>   
>   #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
> -#define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
>   
>   static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
>   {
> @@ -1379,7 +1375,6 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>   static void exynos_dsi_bridge_enable(struct drm_bridge *bridge)
>   {
>   	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> -	struct drm_bridge *iter;
>   	int ret;
>   
>   	if (dsi->state & DSIM_STATE_ENABLED)
> @@ -1393,134 +1388,51 @@ static void exynos_dsi_bridge_enable(struct drm_bridge *bridge)
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
>   
> -	if (dsi->panel) {
> -		ret = drm_panel_prepare(dsi->panel);
> -		if (ret < 0)
> -			goto err_put_sync;
> -	} else {
> -		list_for_each_entry_reverse(iter, &dsi->bridge_chain,
> -					    chain_node) {
> -			if (iter->funcs->pre_enable)
> -				iter->funcs->pre_enable(iter);
> -		}
> -	}
> -
>   	exynos_dsi_set_display_mode(dsi);
>   	exynos_dsi_set_display_enable(dsi, true);
>   
> -	if (dsi->panel) {
> -		ret = drm_panel_enable(dsi->panel);
> -		if (ret < 0)
> -			goto err_display_disable;
> -	} else {
> -		list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> -			if (iter->funcs->enable)
> -				iter->funcs->enable(iter);
> -		}
> -	}
> -
>   	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
>   	return;
> -
> -err_display_disable:
> -	exynos_dsi_set_display_enable(dsi, false);
> -	drm_panel_unprepare(dsi->panel);
> -
> -err_put_sync:
> -	dsi->state &= ~DSIM_STATE_ENABLED;
> -	pm_runtime_put(dsi->dev);
>   }
>   
>   static void exynos_dsi_bridge_disable(struct drm_bridge *bridge)
>   {
>   	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> -	struct drm_bridge *iter;
>   
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return;
>   
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>   
> -	drm_panel_disable(dsi->panel);
> -
> -	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> -		if (iter->funcs->disable)
> -			iter->funcs->disable(iter);
> -	}
> -
>   	exynos_dsi_set_display_enable(dsi, false);
> -	drm_panel_unprepare(dsi->panel);
> -
> -	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> -		if (iter->funcs->post_disable)
> -			iter->funcs->post_disable(iter);
> -	}
>   
>   	dsi->state &= ~DSIM_STATE_ENABLED;
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> -static enum drm_connector_status
> -exynos_dsi_detect(struct drm_connector *connector, bool force)
> -{
> -	return connector->status;
> -}
> -
> -static void exynos_dsi_connector_destroy(struct drm_connector *connector)
> +static int exynos_dsi_panel_or_bridge(struct exynos_dsi *dsi,
> +				      struct device_node *node)
>   {
> -	drm_connector_unregister(connector);
> -	drm_connector_cleanup(connector);
> -	connector->dev = NULL;
> -}
> -
> -static const struct drm_connector_funcs exynos_dsi_connector_funcs = {
> -	.detect = exynos_dsi_detect,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = exynos_dsi_connector_destroy,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static int exynos_dsi_get_modes(struct drm_connector *connector)
> -{
> -	struct exynos_dsi *dsi = connector_to_dsi(connector);
> -
> -	if (dsi->panel)
> -		return drm_panel_get_modes(dsi->panel, connector);
> -
> -	return 0;
> -}
> +	struct drm_bridge *panel_bridge;
> +	struct drm_panel *panel;
>   
> -static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
> -	.get_modes = exynos_dsi_get_modes,
> -};
> +	panel_bridge = of_drm_find_bridge(node);
> +	if (!panel_bridge) {
> +		panel = of_drm_find_panel(node);
> +		if (!IS_ERR(panel)) {
> +			panel_bridge = drm_panel_bridge_add(panel);
> +			if (IS_ERR(panel_bridge))
> +				return PTR_ERR(panel_bridge);
> +		}
> +	}
>   
> -static int exynos_dsi_create_connector(struct exynos_dsi *dsi,
> -				       struct drm_device *drm)
> -{
> -	struct drm_encoder *encoder = &dsi->encoder;
> -	struct drm_connector *connector = &dsi->connector;
> -	int ret;
> +	of_node_put(node);
>   
> -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> +	dsi->out_bridge = panel_bridge;
>   
> -	ret = drm_connector_init(drm, connector, &exynos_dsi_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DSI);
> -	if (ret) {
> -		DRM_DEV_ERROR(dsi->dev,
> -			      "Failed to initialize connector with drm\n");
> -		return ret;
> -	}
> +	if (!dsi->out_bridge)
> +		return -EPROBE_DEFER;
>   
> -	connector->status = connector_status_disconnected;
> -	drm_connector_helper_add(connector, &exynos_dsi_connector_helper_funcs);
> -	drm_connector_attach_encoder(connector, encoder);
> -	if (!drm->registered)
> -		return 0;
> -
> -	connector->funcs->reset(connector);
> -	drm_connector_register(connector);
>   	return 0;
>   }
>   
> @@ -1531,7 +1443,8 @@ static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
>   
>   	dsi->drm = bridge->dev;
>   
> -	return 0;
> +	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> +				 flags);
>   }
>   
>   static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> @@ -1546,32 +1459,12 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   				  struct mipi_dsi_device *device)
>   {
>   	struct exynos_dsi *dsi = host_to_dsi(host);
> -	struct drm_encoder *encoder = &dsi->encoder;
>   	struct drm_device *drm = dsi->drm;
> -	struct drm_bridge *out_bridge;
> -
> -	out_bridge  = of_drm_find_bridge(device->dev.of_node);
> -	if (out_bridge) {
> -		drm_bridge_attach(encoder, out_bridge, NULL, 0);
> -		dsi->out_bridge = out_bridge;
> -		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> -	} else {
> -		int ret = exynos_dsi_create_connector(dsi, drm);
> -
> -		if (ret) {
> -			DRM_DEV_ERROR(dsi->dev,
> -				      "failed to create connector ret = %d\n",
> -				      ret);
> -			drm_encoder_cleanup(encoder);
> -			return ret;
> -		}
> +	int ret;
>   
> -		dsi->panel = of_drm_find_panel(device->dev.of_node);
> -		if (IS_ERR(dsi->panel))
> -			dsi->panel = NULL;
> -		else
> -			dsi->connector.status = connector_status_connected;
> -	}
> +	ret = exynos_dsi_panel_or_bridge(dsi, device->dev.of_node);
> +	if (ret)
> +		return ret;
>   
>   	/*
>   	 * This is a temporary solution and should be made by more generic way.
> @@ -1607,19 +1500,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   	struct exynos_dsi *dsi = host_to_dsi(host);
>   	struct drm_device *drm = dsi->drm;
>   
> -	if (dsi->panel) {
> -		mutex_lock(&drm->mode_config.mutex);
> -		exynos_dsi_bridge_disable(&dsi->bridge);
> -		dsi->panel = NULL;
> -		dsi->connector.status = connector_status_disconnected;
> -		mutex_unlock(&drm->mode_config.mutex);
> -	} else {
> -		if (dsi->out_bridge->funcs->detach)
> -			dsi->out_bridge->funcs->detach(dsi->out_bridge);
> -		dsi->out_bridge = NULL;
> -		INIT_LIST_HEAD(&dsi->bridge_chain);
> -	}
> -
>   	if (drm->mode_config.poll_enabled)
>   		drm_kms_helper_hotplug_event(drm);
>   
> @@ -1770,7 +1650,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   	init_completion(&dsi->completed);
>   	spin_lock_init(&dsi->transfer_lock);
>   	INIT_LIST_HEAD(&dsi->transfer_list);
> -	INIT_LIST_HEAD(&dsi->bridge_chain);
>   
>   	dsi->dsi_host.ops = &exynos_dsi_ops;
>   	dsi->dsi_host.dev = dev;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

