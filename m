Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A4408904
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 12:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613B26E139;
	Mon, 13 Sep 2021 10:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC5A6E139
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:30:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210913103030euoutp02b3dd12cb9e92a945e2e950035145aca3~kWwI5vOxf0217702177euoutp02u
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:30:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210913103030euoutp02b3dd12cb9e92a945e2e950035145aca3~kWwI5vOxf0217702177euoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631529030;
 bh=mBdkMQ0a8HEntf0WzyTJuWVTEn0vGpkJ1scguzqe5wU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=iXIOXsC5Mzi7xmMItc5NH+Cfsoa/0qoam8btpJMjtkQCjYNXbijx/gOFFkw44Z5bj
 OyUGjxul97AbqdWDguhrIVQnPvv7UH/Wy5YV5J6uYvN+sLCNR6XbAVzUoiUHcMvPMk
 gaZZeFKzimuUGYJWa/tbJmoV0hjg9yrPCcDL/260=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210913103029eucas1p2ab099b567293b34bd52ae698c4e08ae1~kWwIaypEq2979329793eucas1p2O;
 Mon, 13 Sep 2021 10:30:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 64.53.42068.5482F316; Mon, 13
 Sep 2021 11:30:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210913103028eucas1p1428844a2a68d9611ef5fe5cc41827079~kWwHup5db0359103591eucas1p17;
 Mon, 13 Sep 2021 10:30:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210913103028eusmtrp1eacd5f624076fb100ad3e10715c82169~kWwHs96iX1386413864eusmtrp1I;
 Mon, 13 Sep 2021 10:30:28 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-24-613f28456861
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B5.48.31287.4482F316; Mon, 13
 Sep 2021 11:30:28 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210913103027eusmtip115ab51036f568e5ad8646b732b3baac3~kWwGezCNM0455004550eusmtip1L;
 Mon, 13 Sep 2021 10:30:27 +0000 (GMT)
Message-ID: <29a2111d-024b-4d9e-27ef-e3399509ff32@samsung.com>
Date: Mon, 13 Sep 2021 12:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0)
 Gecko/20100101 Thunderbird/92.0
Subject: Re: [PATCH v4 24/24] drm/exynos: dsi: Adjust probe order
Content-Language: en-GB
To: Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Thierry Reding
 <thierry.reding@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, Robert Foss
 <robert.foss@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org, Kyungmin
 Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, Xinliang Liu
 <xinliang.liu@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao
 <tiantao6@hisilicon.com>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Clark
 <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, John Stultz
 <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Joonyoung Shim <jy0922.shim@samsung.com>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210910101218.1632297-25-maxime@cerno.tech>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xTZxjOd87p6aFZ8VDc+uEYdQ3LNhLwErd9gwmSjewkbslcNra4ealw
 1jYCaiuMXZwEL3QdYksnQsE6osjFpVNsYRSEDVDacGdjIAIVnQO5rHKVCsIoBzP+Pe/zvs/7
 Ps+Xj8JFleQ6SplwmFUlyOKkpIAou+luDY56JUK2sfy0BJ1qcWCosMmMoz+nXSTKG2wGKNOp
 I9DgeTNATXPByDHaSaCh/nYCzT6p5qHm1FE++l5/kY/0Nc189Ictj0TZrdUYyh+3Eih7dgGg
 2ozPkDPLuLQjfxZHE8YBHBW5rQD1GeoByjY8IJHbZiLQ5ZFqPrKM6nnoRk0Jb5s/4+o+wWd6
 W1pJpsLYx2funbvKZ3I1OTzmQtUDjLHrOjCm968qkimfucNjTI4djPOHBoxpsPXwmYtZnSST
 YSkBzLXGb5jJ0oAP6J2Ct2LZOGUSq9oQvlegSOuyYAfzJMn1OT+SKcDspwVeFKS3wPGeOlIL
 BJSILgKwot8EuGIKwFLDbwRXTALo6pzCn0pGDCdwrlEI4EDpwsqUC8Cu/ONLHYoS0uGwyC72
 CAj6Jdh1coLwYCHtAx05fy/jZ+m9cLBgGvNgXzoS6ib6l3mcFsPUqWKeZ+daeg6HV9y3lg/g
 dDsBrXe1yzZI+lX45Not0oO96FBYN+PEOLUEHrPmLtuDtEMAi7UzfM73O1BvLMA47AuHGywr
 vD9sNKQTHD4KnUXHV8QaAK1XKlZCh8HelsekJxq+dPkX2waOjoSaUk8cagl7w+4xH86DN8ws
 O4tztBBqToq46Rehs9m6slAMC9qmSR2QGle9i3FVfuOqNMb/7/4EiBIgZhPV8XJWvTmB/TJE
 LYtXJybIQ2IOxJeCpf/duNAw9SsoHB4PqQUYBWoBpHDpWmHZ6FaZSBgr++prVnVgjyoxjlXX
 gucpQioW7rP8vEdEy2WH2f0se5BVPe1ilNe6FKx4V33Yy7yN86fPV80ETm32nk08E3rpmcG3
 D93dGn4p5fXcbv0jHyYjxC87ObvHIv12sbr/04G22N/tc02ff6j+J9j3MpF4fzx93vCG1vRR
 YWsUNj/23ptJktR9Z9vfP2cKOCavXOz4OCkzv9gvpjdrzcDDcr+dIxeG5h5vf8EceXNTx0SY
 /qhI8K4Tv794JFkv++5q3Z3dqQ532sPI2tvrzWkS+70von1DA/uUClngc+ttEbdPic+AijWP
 cuxR0f9G8+Rt1BFbTroS7C7S6YbdHa9dj+yc3jLRmaeIiNl2yK6K14eRSsxfXqgIulEWHNTg
 0lR8MhQVoB6rrNmxf/J6d8kupZRQK2SbgnCVWvYfxEW/0U4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsVy+t/xu7ouGvaJBm9faFr0njvJZLH8zDpm
 iytf37NZzHl+ltFi0v0JLBbP569jtDjzW9fi5JurLBYv7l1ksfjxdx+rxdmmN+wWnROXsFtM
 3H+W3eLyrjlsFjPO72OyWPhxK4vFjB//GC0O9UVb3J82C2jGwh/MFp9mPWS2WPFzK6PF3clH
 GC1mTH7JZvFz1zwWi9Wv97FbbHkzkdXi6P5VrA4yHu9vtLJ73Dl3ns1j56y77B6P525k95jd
 MZPVY/Gel0weJyZcYvK4c20Pm8f2bw9YPeadDPS4332cyeP4rlvsHkumXWXz6NuyitFj8+lq
 j8+b5AIEovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/Tt
 EvQy2q9vYSqYI19xZOYUtgbGdZJdjJwcEgImEq8ntzKD2EICSxkl1s4sgIiLS+ye/5YZwhaW
 +HOtiw2i5i2jxPZzgV2MHBy8AnYSK06Ig4RZBFQlrrd9YgGxeQUEJU7OfAJmiwokSOw+3MUO
 YgsLOEpM+HQPLM4MNL7py0rWLkYuDhGB/8wSXdNXMYM4zAJXWSQajs5iA3GEBPYwSjz/d4cJ
 pIVNQFPi7+abYFdwClhJHP52nwlilJlE19YuRghbXqJ562zmCYxCs5BcMgvJxllIWmYhaVnA
 yLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMFltO/Zz8w7Gea8+6h1iZOJgPMQowcGsJMK7
 7Y1tohBvSmJlVWpRfnxRaU5q8SFGU2BwTGSWEk3OB6bLvJJ4QzMDU0MTM0sDU0szYyVx3q1z
 18QLCaQnlqRmp6YWpBbB9DFxcEo1MNVJT3i1atrzssfR1/+raJyr1fh6ck2BXsucbP787HsW
 geGZjRrnjjy4ZBJ2Ycram5VelUu0mupFg2Ie883irS12WcP6xiup0D8290nLB/uDh6d53P22
 vP6m2XO7vWcspLhetTi/feJ+7Mc3lU/px32dzLXiL9+5Mf2F+dzvmpf79z4+zrHOyGzvjgu2
 twqMvVT3P+CPElQwmfNxcv/f9xPFVp55K7ePVXS1S8Izb7eF9/y1mJ4+09WcyFI/RTZvt1ro
 7+IL+sAwcPLYtrJ9e5ZV7tmW1kN/lZ5H/jCJd38w6c/urTPsJ0oue8JbvOvc5gd1bNtVenVf
 X1dv9/1v4Rn01zA6pyDbb6vldmG2/UosxRmJhlrMRcWJAEdcfsjfAwAA
X-CMS-MailID: 20210913103028eucas1p1428844a2a68d9611ef5fe5cc41827079
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210910101445eucas1p172f99ff7fe853052fc457861c3174f9e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210910101445eucas1p172f99ff7fe853052fc457861c3174f9e
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CGME20210910101445eucas1p172f99ff7fe853052fc457861c3174f9e@eucas1p1.samsung.com>
 <20210910101218.1632297-25-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


W dniu 10.09.2021 o 12:12, Maxime Ripard pisze:
> Without proper care and an agreement between how DSI hosts and devices
> drivers register their MIPI-DSI entities and potential components, we can
> end up in a situation where the drivers can never probe.
>
> Most drivers were taking evasive maneuvers to try to workaround this,
> but not all of them were following the same conventions, resulting in
> various incompatibilities between DSI hosts and devices.
>
> Now that we have a sequence agreed upon and documented, let's convert
> exynos to it.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

This patch should be dropped, as it will probably break the driver.

Exynos is already compatible with the pattern 
register-bus-then-get-sink, but it adds/removes panel/bridge 
dynamically, so it creates drm_device without waiting for downstream sink.


Regards

Andrzej


> ---
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index e39fac889edc..dfda2b259c44 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1529,6 +1529,7 @@ static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
>   
>   MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
>   
> +static const struct component_ops exynos_dsi_component_ops;
>   static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   				  struct mipi_dsi_device *device)
>   {
> @@ -1536,6 +1537,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   	struct drm_encoder *encoder = &dsi->encoder;
>   	struct drm_device *drm = encoder->dev;
>   	struct drm_bridge *out_bridge;
> +	struct device *dev = host->dev;
>   
>   	out_bridge  = of_drm_find_bridge(device->dev.of_node);
>   	if (out_bridge) {
> @@ -1585,7 +1587,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   	if (drm->mode_config.poll_enabled)
>   		drm_kms_helper_hotplug_event(drm);
>   
> -	return 0;
> +	return component_add(dev, &exynos_dsi_component_ops);
>   }
>   
>   static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
> @@ -1593,6 +1595,9 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   {
>   	struct exynos_dsi *dsi = host_to_dsi(host);
>   	struct drm_device *drm = dsi->encoder.dev;
> +	struct device *dev = host->dev;
> +
> +	component_del(dev, &exynos_dsi_component_ops);
>   
>   	if (dsi->panel) {
>   		mutex_lock(&drm->mode_config.mutex);
> @@ -1716,7 +1721,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>   		of_node_put(in_bridge_node);
>   	}
>   
> -	return mipi_dsi_host_register(&dsi->dsi_host);
> +	return 0;
>   }
>   
>   static void exynos_dsi_unbind(struct device *dev, struct device *master,
> @@ -1726,8 +1731,6 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
>   	struct drm_encoder *encoder = &dsi->encoder;
>   
>   	exynos_dsi_disable(encoder);
> -
> -	mipi_dsi_host_unregister(&dsi->dsi_host);
>   }
>   
>   static const struct component_ops exynos_dsi_component_ops = {
> @@ -1821,7 +1824,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   
>   	pm_runtime_enable(dev);
>   
> -	ret = component_add(dev, &exynos_dsi_component_ops);
> +	ret = mipi_dsi_host_register(&dsi->dsi_host);
>   	if (ret)
>   		goto err_disable_runtime;
>   
> @@ -1835,10 +1838,12 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   
>   static int exynos_dsi_remove(struct platform_device *pdev)
>   {
> +	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
> +
> +	mipi_dsi_host_unregister(&dsi->dsi_host);
> +
>   	pm_runtime_disable(&pdev->dev);
>   
> -	component_del(&pdev->dev, &exynos_dsi_component_ops);
> -
>   	return 0;
>   }
>   
