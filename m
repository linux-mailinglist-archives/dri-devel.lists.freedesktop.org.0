Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE04E759C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD7310E754;
	Fri, 25 Mar 2022 15:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA7210E754
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:01:57 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220325150156euoutp0277087828b4774b5e25d8b835eb770f81~fp9O97Sbc2279822798euoutp02q
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:01:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220325150156euoutp0277087828b4774b5e25d8b835eb770f81~fp9O97Sbc2279822798euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648220516;
 bh=8RphYm7Z2h3CFLWkl5wOsafCwFOXb85wgt2hniBGU9A=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=NAuDqopgwnF3gy/whh0lJ1jqry0x33vQZNL1fvL0mGANBz74VcAna+0we6WQdOvj8
 bPTdIe6uSwv0fSDgqhtEysq7ALiROiepAKiv6MmtfiSbzCigJVM+RuBVZvDxzCSplC
 7Uf76JeKvN/lSiQzP5YpUu7HdoVQrSqSS1xYefo8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220325150155eucas1p2c35d337d1c32e0efd166e487b06f9c6b~fp9Oeurzw2631126311eucas1p2J;
 Fri, 25 Mar 2022 15:01:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CE.D0.10009.369DD326; Fri, 25
 Mar 2022 15:01:55 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220325150155eucas1p1baa08d7b2b3fe3df3e654a8670b99986~fp9OEkqC70956509565eucas1p1G;
 Fri, 25 Mar 2022 15:01:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220325150155eusmtrp103a5fcf327e917fadfbb3e8606d6eeac~fp9N7Q0yY1475514755eusmtrp1h;
 Fri, 25 Mar 2022 15:01:55 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-3d-623dd963003a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C1.2D.09522.369DD326; Fri, 25
 Mar 2022 15:01:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220325150154eusmtip17f966a0de8ed3d3ca5d5e25435c38a46~fp9NUGK0F0799107991eusmtip13;
 Fri, 25 Mar 2022 15:01:54 +0000 (GMT)
Message-ID: <86fceb2e-cebc-adf2-945d-fe12d80ec666@samsung.com>
Date: Fri, 25 Mar 2022 16:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 3/6] exynos: drm: dsi: Attach in_bridge in MIC driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220303163654.3381470-4-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djPc7rJN22TDJZdN7O4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGqsZXF4lBftMWnWQ+ZLVb83MrowOWx9uN9Vo/3N1rZ
 PWZ3zGT1WLznJZPHnWt72Dzudx9n8lgy7SqbR9+WVYwBHFFcNimpOZllqUX6dglcGe8XbmAq
 eKxY8ffNHKYGxonSXYycHBICJhJ31zxk6mLk4hASWMEosfv8LSjnC6NE8/ZDUM5nRonjU/uY
 YVoatk5mh0gsZ5TombeWDcL5yChxr7OLFaSKV8BOYsKZQ4wgNouAqsT99XdZIOKCEidnPgGz
 RQWSJFZvX80GYgsL+EgcO9oCZjMLiEvcejIfbLWIwCMmiad//rNCJNwlnr7ZBnYGm4ChRNfb
 LqAGDg5OASeJhf3RECXyEtvfzmEG6ZUQaOeU6Lm6lQ3ibBeJ/986oGxhiVfHt7BD2DISpyf3
 sIDMkRDIl/g7wxgiXCFx7fUaqI+tJe6c+wW2illAU2L9Ln2IsKPEr6tH2SA6+SRuvBWEuIBP
 YtK26cwQYV6JjjYhiGo1iVnH18HtPHjhEvMERqVZSGEyC8nvs5D8Mgth7wJGllWM4qmlxbnp
 qcWGeanlesWJucWleel6yfm5mxiByev0v+OfdjDOffVR7xAjEwfjIUYJDmYlEd77l62ThHhT
 EiurUovy44tKc1KLDzFKc7AoifMmZ25IFBJITyxJzU5NLUgtgskycXBKNTCFm07Iki/WLH94
 jr1wRtImtaqv0RVnbW98UwhxfX+8N87ewrFvxZ+rN+Vkz/3KOe+3yHyX7LfvO/rW/T9gLrTw
 29Udbn+Zq479Ln0ad2mm/RQvjUn5nLe5n86Ttkth73OM7HXiNa/i26cxnaHBb861jc8y3orf
 /6HoLzBrna+37oRXdi4TWmwfsb5Y6H3I8V9dbIGgcCEfh75NvY+A6uSlLuEdTvIL/grOfql+
 wmtD2butn49HZbfE7o3uu9ahurfozoXKr5stN+8O8Dp3OWf981fvjjEx/e4wsvmz6K5Xznlr
 6bxl8s+KWK4XFBx3+Ojrs4yhzbn819rVQY8rmphLl2/V1LiV4bJeSWN+dYUSS3FGoqEWc1Fx
 IgDrd7vhzQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xu7rJN22TDDY9EbS4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGqsZXF4lBftMWnWQ+ZLVb83MrowOWx9uN9Vo/3N1rZ
 PWZ3zGT1WLznJZPHnWt72Dzudx9n8lgy7SqbR9+WVYwBHFF6NkX5pSWpChn5xSW2StGGFkZ6
 hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Ge8XbmAqeKxY8ffNHKYGxonSXYycHBIC
 JhINWyezdzFycQgJLGWU+HBoFxtEQkbi5LQGVghbWOLPtS42iKL3jBLvV60DS/AK2ElMOHOI
 EcRmEVCVuL/+LgtEXFDi5MwnYLaoQJLEpa52sBphAR+JY0dbwBYwC4hL3HoynwlkqIjAMyaJ
 o5vWskIk3CWevtnGDLHtLKNE66UpTCAJNgFDia63IGdwcHAKOEks7I+GqDeT6NraxQhhy0ts
 fzuHeQKj0Cwkd8xCsm8WkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIzZbcd+
 bt7BOO/VR71DjEwcjIcYJTiYlUR471+2ThLiTUmsrEotyo8vKs1JLT7EaAoMjInMUqLJ+cCk
 kVcSb2hmYGpoYmZpYGppZqwkzutZ0JEoJJCeWJKanZpakFoE08fEwSnVwLTZKiNLmbNV83SA
 3alJfXV2rk7m2y4/DGq6vMMtRFqwenJw6gFO6dbTStf1pjBUKNr+aZE+q+F28MNdzof7bZoP
 Ous/uHK2xFvx89oM4ysvWZ6Z8nlsVpD7m2KnV7Q9yeFqcjDbL45Xd+LreGqn+e6y/9MWK5Lr
 JPChwWEDS1uuyG6Pbx2WMx+nrCz7cElJeCXDtb6SXEdPvW8JPTJW/z/+PLVlTu7DH+VrDl1o
 Xa/6wJr52jzTtKl7b30S5L7099b16Hf62RYbpeYf8ZHrs9ou1Oyrn76ySWJCjnjJG1mJskz+
 7jyx2Hxvk6zwjnJz827nKx8OJCxr3zzhq9uVX/fi5AxsDs8JuRBUzJikxFKckWioxVxUnAgA
 Scli1mIDAAA=
X-CMS-MailID: 20220325150155eucas1p1baa08d7b2b3fe3df3e654a8670b99986
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220303163758eucas1p26a293c60823dcb5036bd4be2103785de
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220303163758eucas1p26a293c60823dcb5036bd4be2103785de
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <CGME20220303163758eucas1p26a293c60823dcb5036bd4be2103785de@eucas1p2.samsung.com>
 <20220303163654.3381470-4-jagan@amarulasolutions.com>
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
> MIC drivers in the Exynos5433 display pipeline are already registered
> as bridge drivers and it is more advisable to attach the downstream
> bridge on the bridge attach call instead of doing the same in the
> DSI driver.
>
> This makes bridge attachment more meaningful and avoids the races
> during bridge function calls.
>
> So, move the bridge finding and drm_bridge_attach from DSI to MIC.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes for v6:
> - new patch
>
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 15 ---------------
>   drivers/gpu/drm/exynos/exynos_drm_mic.c | 22 ++++++++++++++++++++++
>   2 files changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index b7d0a4aead0a..741c046513e8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1660,11 +1660,6 @@ static int exynos_dsi_of_read_u32(const struct device_node *np,
>   	return ret;
>   }
>   
> -enum {
> -	DSI_PORT_IN,
> -	DSI_PORT_OUT
> -};
> -
>   static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
>   {
>   	struct device *dev = dsi->dev;
> @@ -1695,8 +1690,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>   	struct exynos_dsi *dsi = dev_get_drvdata(dev);
>   	struct drm_encoder *encoder = &dsi->encoder;
>   	struct drm_device *drm_dev = data;
> -	struct device_node *in_bridge_node;
> -	struct drm_bridge *in_bridge;
>   	int ret;
>   
>   	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
> @@ -1707,14 +1700,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>   	if (ret < 0)
>   		return ret;
>   
> -	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
> -	if (in_bridge_node) {
> -		in_bridge = of_drm_find_bridge(in_bridge_node);
> -		if (in_bridge)
> -			drm_bridge_attach(encoder, in_bridge, NULL, 0);
> -		of_node_put(in_bridge_node);
> -	}
> -
>   	return mipi_dsi_host_register(&dsi->dsi_host);
>   }
>   
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index 32672bf8ae4a..9e06f8e2a863 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -102,6 +102,7 @@ struct exynos_mic {
>   	struct videomode vm;
>   	struct drm_encoder *encoder;
>   	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
>   
>   	bool enabled;
>   };
> @@ -298,12 +299,22 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>   
>   static void mic_enable(struct drm_bridge *bridge) { }
>   
> +static int mic_attach(struct drm_bridge *bridge,
> +		      enum drm_bridge_attach_flags flags)
> +{
> +	struct exynos_mic *mic = bridge->driver_private;
> +
> +	return drm_bridge_attach(bridge->encoder, mic->next_bridge,
> +				 &mic->bridge, flags);
> +}
> +
>   static const struct drm_bridge_funcs mic_bridge_funcs = {
>   	.disable = mic_disable,
>   	.post_disable = mic_post_disable,
>   	.mode_set = mic_mode_set,
>   	.pre_enable = mic_pre_enable,
>   	.enable = mic_enable,
> +	.attach = mic_attach,
>   };
>   
>   static int exynos_mic_bind(struct device *dev, struct device *master,
> @@ -377,6 +388,7 @@ static int exynos_mic_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct exynos_mic *mic;
> +	struct device_node *remote;
>   	struct resource res;
>   	int ret, i;
>   
> @@ -420,6 +432,16 @@ static int exynos_mic_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
> +	mic->next_bridge = of_drm_find_bridge(remote);
> +	if (IS_ERR(mic->next_bridge)) {
> +		DRM_DEV_ERROR(dev, "mic: Failed to find next bridge\n");
> +		ret = PTR_ERR(mic->next_bridge);
> +		goto err;
> +	}
> +
> +	of_node_put(remote);
> +
>   	platform_set_drvdata(pdev, mic);
>   
>   	mic->bridge.funcs = &mic_bridge_funcs;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

