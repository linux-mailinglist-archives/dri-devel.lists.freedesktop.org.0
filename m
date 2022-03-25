Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52694E75A2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAF810E93D;
	Fri, 25 Mar 2022 15:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D4C10E93D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:02:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220325150220euoutp019b39ab647db5c491700b5e0e6c0a0fb3~fp9lB-9cq2281822818euoutp01J
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:02:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220325150220euoutp019b39ab647db5c491700b5e0e6c0a0fb3~fp9lB-9cq2281822818euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648220540;
 bh=UmmpxQY54GJw0GXRsxQvNu8wArizAuvYIEmtCbvVOnU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=mqzIb7u6fOtH/WQz9m/dP0mxrEjVmDC8NRUlVDcoHKLsPC1A1oLAWQ2K9d8CHHVV+
 dHCxlzKqpF1MpUzUdFvHckGIrnkgfQMtG8z3/xyeLD5GGMgp8Eju3+73ka/0OjfaSD
 9J4rowHQ7lar6Lj4TW2rOZ2UrUWkiV9nq4KDJKtc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220325150219eucas1p1047d2482dd0c620360615e0aa1c5592f~fp9kieVNr0858308583eucas1p1f;
 Fri, 25 Mar 2022 15:02:19 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 7A.5B.09887.B79DD326; Fri, 25
 Mar 2022 15:02:19 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220325150219eucas1p20eccf3520c42a8d246ab9778f7f0a534~fp9kEjR-32631126311eucas1p2r;
 Fri, 25 Mar 2022 15:02:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220325150219eusmtrp1efa125dcdd16f191fd6f8eff6ee4f470~fp9j_Wbxi1555315553eusmtrp1b;
 Fri, 25 Mar 2022 15:02:19 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-a4-623dd97b195d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 00.3D.09522.A79DD326; Fri, 25
 Mar 2022 15:02:18 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220325150218eusmtip2180577b1bc64dcd9628638ab0714a085~fp9jAhshX1351213512eusmtip2k;
 Fri, 25 Mar 2022 15:02:17 +0000 (GMT)
Message-ID: <e7594945-2598-2a2e-49a4-da3945e1bb40@samsung.com>
Date: Fri, 25 Mar 2022 16:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 5/6] drm: exynos: dsi: Convert to bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220303163654.3381470-6-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djP87rVN22TDH4tVrC4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGqsZXF4lBftMWnWQ+ZLVb83MrowOWx9uN9Vo/3N1rZ
 PWZ3zGT1WLznJZPHnWt72Dzudx9n8lgy7SqbR9+WVYwBHFFcNimpOZllqUX6dglcGV8/H2cr
 OOpQsaxrF2MD4zyTLkZODgkBE4nlF66wdjFycQgJrGCUmLy1D8r5wiix++RCJgjnM6PEt9aX
 jDAt35edgqpaziix8fNTZgjnI6PEnvbbrCBVvAJ2Ei+/tDGD2CwCqhLrbtxkhogLSpyc+YQF
 xBYVSJJYvX01WxcjB4ewgJvEubchIGFmAXGJW0/mg20WEXjEJPH0z39WiIS7xNM328DmsAkY
 SnS97WIDsTkFnCRWnfjACFEjL7H97RywgyQEujklZmzpZYc420Viya7VzBC2sMSr41ug4jIS
 pyf3sIAcISGQL/F3hjFEuELi2us1UOXWEnfO/QK7k1lAU2L9Ln2IsKPEqW/HmSE6+SRuvBWE
 uIBPYtK26VBhXomONiGIajWJWcfXwe08eOES8wRGpVlIYTILyfOzkPwyC2HvAkaWVYziqaXF
 uempxUZ5qeV6xYm5xaV56XrJ+bmbGIHJ6/S/4192MC5/9VHvECMTB+MhRgkOZiUR3vuXrZOE
 eFMSK6tSi/Lji0pzUosPMUpzsCiJ8yZnbkgUEkhPLEnNTk0tSC2CyTJxcEo1MClbHKrlkI3t
 7L/XkCLPdG/rInWnxvVz322szdkYPsNVyTJj/22Nvekyvi9466Q810tpHX3xcIZFyE/5p+bB
 Z7dLCi2Ivs3G9nO31syN926U5ayPZOLO9rwzn3PqFn+dOJb6o0t3qtRERlz+q7W04sP2TnbR
 NVomJ+teLW26luzvWteSFDup/peSnJASl0jKj9iXcusfH/nYXB64QnbpxD19SenJpcxr5mT+
 8op3mSV4wGdNvvGyZ//+WfIcv/6cWzGBZ6LDId6LH4/4V61cmvzKdld6pNGz4rV+Qof3Hoz+
 o79KM+7ThGPXpy/O4VP72HcnUDp1y7+nK5Y/m3j+scnqS2+frGNaOudBqF2W3RslluKMREMt
 5qLiRAAtIWi1zQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xe7rVN22TDD7YWtxf/JnF4srX92wW
 k+5PYLH4smkCm0XnxCXsFssn7GOzONXYymJxqC/a4tOsh8wWK35uZXTg8lj78T6rx/sbrewe
 sztmsnos3vOSyePOtT1sHve7jzN5LJl2lc2jb8sqxgCOKD2bovzSklSFjPziElulaEMLIz1D
 Sws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2Mr5+PsxUcdahY1rWLsYFxnkkXIyeHhICJ
 xPdlp1hBbCGBpYwSWz5pQcRlJE5Oa2CFsIUl/lzrYuti5AKqec8o8ehNF1iCV8BO4uWXNmYQ
 m0VAVWLdjZvMEHFBiZMzn7CA2KICSRKXutoZuxg5OIQF3CTOvQ0BCTMLiEvcejKfCWSmiMAz
 Jomjm9ayQiTcJZ6+2cYMsewso8SSFc+ZQBJsAoYSXW9BruDk4BRwklh14gMjRIOZRNfWLihb
 XmL72znMExiFZiG5YxaShbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYLxu
 O/Zz8w7Gea8+6h1iZOJgPMQowcGsJMJ7/7J1khBvSmJlVWpRfnxRaU5q8SFGU2BgTGSWEk3O
 ByaMvJJ4QzMDU0MTM0sDU0szYyVxXs+CjkQhgfTEktTs1NSC1CKYPiYOTqkGJjauj+uOfn+y
 tLVOt+KozvGjLX55Aud9Nz0WfvXj+Qk12wff3jV/ldnkyxFnwGa7tkV021fpwNQ2h0/2YiG9
 uXbnGiu1/UJ7j2SunTUhXu4jr1hGd4DKy7a90belnjjHOh+RSfE74/jR9cOEZ+8uHt/XU97P
 pai9qsbT1NyllzPTfO2apOyXjnJiQnd1g6V+/3Perea1R34W28rELQypa1YlPqg4csk/yzqk
 9cqBaBMWyVlrt377fGlS0TGdyTo1f7hNeW9JPlE3yd2y2mW1wqsu5sofn2++fbd0yWQVF6H0
 izY1kWs7OFR8nC//PeZ/+HtOsqvzA3/mJVdt731+LLTZWTz/hMK5xT/bxfqElFiKMxINtZiL
 ihMBHyZldmADAAA=
X-CMS-MailID: 20220325150219eucas1p20eccf3520c42a8d246ab9778f7f0a534
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220303163819eucas1p10fe3adddbb22bf9d1f8f14247d141c83
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220303163819eucas1p10fe3adddbb22bf9d1f8f14247d141c83
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <CGME20220303163819eucas1p10fe3adddbb22bf9d1f8f14247d141c83@eucas1p1.samsung.com>
 <20220303163654.3381470-6-jagan@amarulasolutions.com>
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
> Convert the encoders to bridge drivers in order to standardize on
> a single API with built-in dumb encoder support for compatibility
> with existing component drivers.
>
> Driver bridge conversion will help to reuse the same bridge on
> different platforms as exynos dsi driver can be used as a Samsung
> DSIM and use it for i.MX8MM platform.
>
> Bridge conversion,
>
> - Drops drm_encoder_helper_funcs.
>
> - Adds drm_bridge_funcs and register a drm bridge.
>
> - Drops bridge_chain.
>
> - Separate pre_enable from enable function.
>
> - Separate post_disable from disable function.
>
> Convert it.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes for v6, v5:
> - none
> Changes for v4:
> - add pre_enable function
> - add post_disable function
> Changes for v3:
> - move bridge add in host_attach
> - move bridge remove in host_detach
> - use flags, bridge in drm_bridge_attach in attch
> Changes for v2:
> - drop bridge_chain
>
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 88 +++++++++++++------------
>   1 file changed, 45 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 953094133ed8..59a4f7f52180 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -251,7 +251,7 @@ struct exynos_dsi_driver_data {
>   struct exynos_dsi {
>   	struct drm_encoder encoder;
>   	struct mipi_dsi_host dsi_host;
> -	struct list_head bridge_chain;
> +	struct drm_bridge bridge;
>   	struct drm_bridge *out_bridge;
>   	struct device *dev;
>   	struct drm_display_mode mode;
> @@ -282,9 +282,9 @@ struct exynos_dsi {
>   
>   #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
>   
> -static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
> +static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
>   {
> -	return container_of(e, struct exynos_dsi, encoder);
> +	return container_of(b, struct exynos_dsi, bridge);
>   }
>   
>   enum reg_idx {
> @@ -1358,10 +1358,9 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>   	}
>   }
>   
> -static void exynos_dsi_enable(struct drm_encoder *encoder)
> +static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
>   {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> -	struct drm_bridge *iter;
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   	int ret;
>   
>   	if (dsi->state & DSIM_STATE_ENABLED)
> @@ -1374,63 +1373,64 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>   	}
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
> +}
>   
> -	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> -		if (iter->funcs->pre_enable)
> -			iter->funcs->pre_enable(iter);
> -	}
> +static void exynos_dsi_enable(struct drm_bridge *bridge)
> +{
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   
>   	exynos_dsi_set_display_mode(dsi);
>   	exynos_dsi_set_display_enable(dsi, true);
>   
> -	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> -		if (iter->funcs->enable)
> -			iter->funcs->enable(iter);
> -	}
> -
>   	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
> +
>   	return;
>   }
>   
> -static void exynos_dsi_disable(struct drm_encoder *encoder)
> +static void exynos_dsi_disable(struct drm_bridge *bridge)
>   {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> -	struct drm_bridge *iter;
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return;
>   
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
> +}
>   
> -	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
> -		if (iter->funcs->disable)
> -			iter->funcs->disable(iter);
> -	}
> +static void exynos_dsi_post_disable(struct drm_bridge *bridge)
> +{
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   
>   	exynos_dsi_set_display_enable(dsi, false);
>   
> -	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
> -		if (iter->funcs->post_disable)
> -			iter->funcs->post_disable(iter);
> -	}
> -
>   	dsi->state &= ~DSIM_STATE_ENABLED;
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> -static void exynos_dsi_mode_set(struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode)
> +static void exynos_dsi_mode_set(struct drm_bridge *bridge,
> +				const struct drm_display_mode *mode,
> +				const struct drm_display_mode *adjusted_mode)
>   {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   
>   	drm_mode_copy(&dsi->mode, adjusted_mode);
>   }
>   
> -static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
> -	.enable = exynos_dsi_enable,
> -	.disable = exynos_dsi_disable,
> -	.mode_set = exynos_dsi_mode_set,
> +static int exynos_dsi_attach(struct drm_bridge *bridge,
> +			     enum drm_bridge_attach_flags flags)
> +{
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
> +}
> +
> +static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> +	.pre_enable			= exynos_dsi_pre_enable,
> +	.enable				= exynos_dsi_enable,
> +	.disable			= exynos_dsi_disable,
> +	.post_disable			= exynos_dsi_post_disable,
> +	.mode_set			= exynos_dsi_mode_set,
> +	.attach				= exynos_dsi_attach,
>   };
>   
>   MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
> @@ -1453,8 +1453,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   
>   	DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
>   
> -	drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
> -	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
> +	drm_bridge_add(&dsi->bridge);
> +
> +	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
>   
>   	/*
>   	 * This is a temporary solution and should be made by more generic way.
> @@ -1493,13 +1494,14 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   	if (dsi->out_bridge->funcs->detach)
>   		dsi->out_bridge->funcs->detach(dsi->out_bridge);
>   	dsi->out_bridge = NULL;
> -	INIT_LIST_HEAD(&dsi->bridge_chain);
>   
>   	if (drm->mode_config.poll_enabled)
>   		drm_kms_helper_hotplug_event(drm);
>   
>   	exynos_dsi_unregister_te_irq(dsi);
>   
> +	drm_bridge_remove(&dsi->bridge);
> +
>   	return 0;
>   }
>   
> @@ -1583,8 +1585,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>   
>   	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
>   
> -	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
> -
>   	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
>   	if (ret < 0)
>   		return ret;
> @@ -1596,9 +1596,8 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
>   				void *data)
>   {
>   	struct exynos_dsi *dsi = dev_get_drvdata(dev);
> -	struct drm_encoder *encoder = &dsi->encoder;
>   
> -	exynos_dsi_disable(encoder);
> +	exynos_dsi_disable(&dsi->bridge);
>   
>   	mipi_dsi_host_unregister(&dsi->dsi_host);
>   }
> @@ -1621,7 +1620,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   	init_completion(&dsi->completed);
>   	spin_lock_init(&dsi->transfer_lock);
>   	INIT_LIST_HEAD(&dsi->transfer_list);
> -	INIT_LIST_HEAD(&dsi->bridge_chain);
>   
>   	dsi->dsi_host.ops = &exynos_dsi_ops;
>   	dsi->dsi_host.dev = dev;
> @@ -1689,6 +1687,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   
>   	pm_runtime_enable(dev);
>   
> +	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
> +	dsi->bridge.of_node = dev->of_node;
> +	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +
>   	ret = component_add(dev, &exynos_dsi_component_ops);
>   	if (ret)
>   		goto err_disable_runtime;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

