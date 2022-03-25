Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE484E75A0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E106A10E926;
	Fri, 25 Mar 2022 15:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B196B10E926
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:02:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220325150205euoutp02689bfdcc1a81f9f8d19e95ccf530ea66~fp9XTdzNZ2328723287euoutp02T
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:02:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220325150205euoutp02689bfdcc1a81f9f8d19e95ccf530ea66~fp9XTdzNZ2328723287euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648220525;
 bh=0yDRzK+vDt9iLFU/f2Zu1McrS3xOHaphQ/Sp8QbB9Pk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=S4SUO3j13xVK3RD5eQRSyAnjaTSJeKDGKSJQHQcZSxXPuTFP1FayPXy0axMe3FQdo
 Vpie6dFNsBi4GQC9LyFYA95gvFwzJy64aGcw3nW0oE7mP/iSEStmO6TRaV8ktWN/6k
 ktzfktlagWikFVWtLEo0hkNZw5aWnQ33jhmdA+i4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220325150205eucas1p2f36ce68492e6ff2b41a82cf6a3ab7b11~fp9W5mHQf2833328333eucas1p2Q;
 Fri, 25 Mar 2022 15:02:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 5A.92.10260.C69DD326; Fri, 25
 Mar 2022 15:02:04 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220325150204eucas1p1e47c98d91ac1e4019fd21fecd1e89663~fp9WWEicM0739307393eucas1p1d;
 Fri, 25 Mar 2022 15:02:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220325150204eusmtrp2949453d65e79048b223747d049093db5~fp9WVUa2L2136521365eusmtrp2m;
 Fri, 25 Mar 2022 15:02:04 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-64-623dd96c220b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 03.2C.09404.C69DD326; Fri, 25
 Mar 2022 15:02:04 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220325150203eusmtip257f5aef6acd649659add5bd407bedcd9~fp9VsO13f1630016300eusmtip2j;
 Fri, 25 Mar 2022 15:02:03 +0000 (GMT)
Message-ID: <94dce546-fa3f-e84a-8992-6503cf31a917@samsung.com>
Date: Fri, 25 Mar 2022 16:02:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 4/6] drm: exynos: dsi: Use drm panel_bridge API
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220303163654.3381470-5-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djPc7o5N22TDN59N7e4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGqsZXF4lBftMWnWQ+ZLVb83MrowOWx9uN9Vo/3N1rZ
 PWZ3zGT1WLznJZPHnWt72Dzudx9n8lgy7SqbR9+WVYwBHFFcNimpOZllqUX6dglcGa9WHmIt
 WOpVsfJcK3sD41qbLkZODgkBE4ldLU3sXYxcHEICKxglVu+fxgLhfGGU2HZtG5TzmVHi4IqN
 LDAtC87PYgexhQSWM0rM70iFKPrIKNH6pwEowcHBK2AnceKpF0gNi4CqxNFpn8B6eQUEJU7O
 fAJmiwokSazevpoNxBYWcJN4+egXK4jNLCAucevJfCaQmSICj5gknv75D5Vwl3j6ZhsziM0m
 YCjR9bYLrJlTwEli2o1tbBA18hLb385hBmmWEOjnlFi9aQUbxNUuEo0nZ0LZwhKvjm9hh7Bl
 JP7vBNnGAWTnS/ydYQwRrpC49noNM4RtLXHn3C82kBJmAU2J9bv0IcKOEhv/dDBCdPJJ3Hgr
 CHEBn8SkbdOZIcK8Eh1tQhDVahKzjq+D23nwwiXmCYxKs5ACZRaS52ch+WUWwt4FjCyrGMVT
 S4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxAlPX6X/Hv+5gXPHqo94hRiYOxkOMEhzMSiK89y9b
 JwnxpiRWVqUW5ccXleakFh9ilOZgURLnTc7ckCgkkJ5YkpqdmlqQWgSTZeLglGpgin3bly0Z
 5uO336FSVaJJtVX7eeSnrF9Jz7Z5u15fpPXkUoPfVdvVqybc9OObaTSDYbJbzmWja/6zZ909
 J9HlWXxlvfyqZ8uTp81usZlYFjVlhtLXvCd1S1XvTYxrik3g/L/op3/Y8qzM7itzJGe7Cta0
 RdU76+g/Fl9zLaw4y3cD14OjVwz3rJhs/fvohvvvTZVfe0tOMj+QcXQN2/T1XnwmOfON238y
 8WiGPFHcsG7fv39zEoJvfS2bUnjvtcmqyPnXihiZDhYVLlmSH7bA9jWvpz1jxawdyTlp73SO
 9W4+NH210qMc3U+7GJ2n7z0fydxh+zBuAYtZ1/u9t9bmyhlueTU517jJzZt3xSQbFyWW4oxE
 Qy3mouJEAA6q60fMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xe7o5N22TDCatEbG4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGqsZXF4lBftMWnWQ+ZLVb83MrowOWx9uN9Vo/3N1rZ
 PWZ3zGT1WLznJZPHnWt72Dzudx9n8lgy7SqbR9+WVYwBHFF6NkX5pSWpChn5xSW2StGGFkZ6
 hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Ga9WHmItWOpVsfJcK3sD41qbLkZODgkB
 E4kF52exdzFycQgJLGWU6Oj6yA6RkJE4Oa2BFcIWlvhzrYsNoug9o8ShZ3+Yuxg5OHgF7CRO
 PPUCqWERUJU4Ou0TC4jNKyAocXLmEzBbVCBJ4lJXOyOILSzgJvHy0S+wmcwC4hK3nsxnApkp
 IvCMSeLoprVQCXeJp2+2MUMsO8soce/HZmaQBJuAoUTXW5ArODk4BZwkpt3YxgbRYCbRtbWL
 EcKWl9j+dg7zBEahWUgOmYVk4SwkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kR
 GLPbjv3csoNx5auPeocYmTgYDzFKcDArifDev2ydJMSbklhZlVqUH19UmpNafIjRFBgaE5ml
 RJPzgUkjryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBqelO8LtQ
 kRk3jky7a/JsS+m+xtSHSw5MuMr4UrNins8xlTtynJ5ixgazAtjC7Az9HryYXde9RvtY+/Wo
 yJXOdz5JLPG8HTj/8FbmhhMtVyQO2vM+89O6KbfottSR2yYfbbM181WVvx0Ke1139/P0XfIn
 /i2qf3Om5l4u18fy647LEx58OO9zqyVOhc3s4u4O5spltWeVTczcXLJSvO6kPD1xX/jME727
 Nt3L3eMnXGnyE7TmzuQoVX7cHThXpOXAwac8G8o/u8XsreuyX7PWUCfBTOnNocsrZIS/eG4t
 WLX4krD7crmX4Vmm/JJysm2Wj3ZOYb2rIH7Tec+kCqbDLzJNo+rMXGblfjrod8LuuxJLcUai
 oRZzUXEiAA5GvyZiAwAA
X-CMS-MailID: 20220325150204eucas1p1e47c98d91ac1e4019fd21fecd1e89663
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220303163809eucas1p26b08875286bbb53171a7f599795c543f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220303163809eucas1p26b08875286bbb53171a7f599795c543f
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <CGME20220303163809eucas1p26b08875286bbb53171a7f599795c543f@eucas1p2.samsung.com>
 <20220303163654.3381470-5-jagan@amarulasolutions.com>
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
> - Drops panel pointer and iterate the bridge, so-that it can operate
>    the normal bridge and panel_bridge in constitutive callbacks.
>
> This simplifies the driver and allows all components in the display
> pipeline to be treated as bridges.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes for v6, v5:
> - none
> Changes for v4:
> - drop unneeded headers
> Changes for v3:
> - fix port number
> - add print for attached device
> Changes for v2:
> - new patch
>
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 157 ++++--------------------
>   1 file changed, 23 insertions(+), 134 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 741c046513e8..953094133ed8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -24,9 +24,7 @@
>   
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
> -#include <drm/drm_fb_helper.h>
>   #include <drm/drm_mipi_dsi.h>
> -#include <drm/drm_panel.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_simple_kms_helper.h>
> @@ -253,8 +251,6 @@ struct exynos_dsi_driver_data {
>   struct exynos_dsi {
>   	struct drm_encoder encoder;
>   	struct mipi_dsi_host dsi_host;
> -	struct drm_connector connector;
> -	struct drm_panel *panel;
>   	struct list_head bridge_chain;
>   	struct drm_bridge *out_bridge;
>   	struct device *dev;
> @@ -285,7 +281,6 @@ struct exynos_dsi {
>   };
>   
>   #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
> -#define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
>   
>   static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
>   {
> @@ -1380,42 +1375,21 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
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
> +	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> +		if (iter->funcs->pre_enable)
> +			iter->funcs->pre_enable(iter);
>   	}
>   
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
> +	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> +		if (iter->funcs->enable)
> +			iter->funcs->enable(iter);
>   	}
>   
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
>   static void exynos_dsi_disable(struct drm_encoder *encoder)
> @@ -1428,15 +1402,12 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>   
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>   
> -	drm_panel_disable(dsi->panel);
> -
>   	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
>   		if (iter->funcs->disable)
>   			iter->funcs->disable(iter);
>   	}
>   
>   	exynos_dsi_set_display_enable(dsi, false);
> -	drm_panel_unprepare(dsi->panel);
>   
>   	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
>   		if (iter->funcs->post_disable)
> @@ -1456,70 +1427,6 @@ static void exynos_dsi_mode_set(struct drm_encoder *encoder,
>   	drm_mode_copy(&dsi->mode, adjusted_mode);
>   }
>   
> -static enum drm_connector_status
> -exynos_dsi_detect(struct drm_connector *connector, bool force)
> -{
> -	return connector->status;
> -}
> -
> -static void exynos_dsi_connector_destroy(struct drm_connector *connector)
> -{
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
> -
> -static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
> -	.get_modes = exynos_dsi_get_modes,
> -};
> -
> -static int exynos_dsi_create_connector(struct drm_encoder *encoder)
> -{
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> -	struct drm_connector *connector = &dsi->connector;
> -	struct drm_device *drm = encoder->dev;
> -	int ret;
> -
> -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> -
> -	ret = drm_connector_init(drm, connector, &exynos_dsi_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DSI);
> -	if (ret) {
> -		DRM_DEV_ERROR(dsi->dev,
> -			      "Failed to initialize connector with drm\n");
> -		return ret;
> -	}
> -
> -	connector->status = connector_status_disconnected;
> -	drm_connector_helper_add(connector, &exynos_dsi_connector_helper_funcs);
> -	drm_connector_attach_encoder(connector, encoder);
> -	if (!drm->registered)
> -		return 0;
> -
> -	connector->funcs->reset(connector);
> -	drm_connector_register(connector);
> -	return 0;
> -}
> -
>   static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
>   	.enable = exynos_dsi_enable,
>   	.disable = exynos_dsi_disable,
> @@ -1532,33 +1439,23 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   				  struct mipi_dsi_device *device)
>   {
>   	struct exynos_dsi *dsi = host_to_dsi(host);
> +	struct device *dev = dsi->dev;
>   	struct drm_encoder *encoder = &dsi->encoder;
>   	struct drm_device *drm = encoder->dev;
> -	struct drm_bridge *out_bridge;
> -
> -	out_bridge  = of_drm_find_bridge(device->dev.of_node);
> -	if (out_bridge) {
> -		drm_bridge_attach(encoder, out_bridge, NULL, 0);
> -		dsi->out_bridge = out_bridge;
> -		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> -	} else {
> -		int ret = exynos_dsi_create_connector(encoder);
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
> +	dsi->out_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(dsi->out_bridge)) {
> +		ret = PTR_ERR(dsi->out_bridge);
> +		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
> +		return ret;
>   	}
>   
> +	DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
> +
> +	drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
> +	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> +
>   	/*
>   	 * This is a temporary solution and should be made by more generic way.
>   	 *
> @@ -1566,7 +1463,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   	 * TE interrupt handler.
>   	 */
>   	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
> -		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
> +		ret = exynos_dsi_register_te_irq(dsi, &device->dev);
>   		if (ret)
>   			return ret;
>   	}
> @@ -1593,18 +1490,10 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   	struct exynos_dsi *dsi = host_to_dsi(host);
>   	struct drm_device *drm = dsi->encoder.dev;
>   
> -	if (dsi->panel) {
> -		mutex_lock(&drm->mode_config.mutex);
> -		exynos_dsi_disable(&dsi->encoder);
> -		dsi->panel = NULL;
> -		dsi->connector.status = connector_status_disconnected;
> -		mutex_unlock(&drm->mode_config.mutex);
> -	} else {
> -		if (dsi->out_bridge->funcs->detach)
> -			dsi->out_bridge->funcs->detach(dsi->out_bridge);
> -		dsi->out_bridge = NULL;
> -		INIT_LIST_HEAD(&dsi->bridge_chain);
> -	}
> +	if (dsi->out_bridge->funcs->detach)
> +		dsi->out_bridge->funcs->detach(dsi->out_bridge);
> +	dsi->out_bridge = NULL;
> +	INIT_LIST_HEAD(&dsi->bridge_chain);
>   
>   	if (drm->mode_config.poll_enabled)
>   		drm_kms_helper_hotplug_event(drm);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

