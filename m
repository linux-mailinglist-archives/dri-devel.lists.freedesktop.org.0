Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 080EF513189
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 12:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93CD10F889;
	Thu, 28 Apr 2022 10:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A210010F889
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 10:43:45 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220428104343euoutp01498358266e41931a3e76d667b50b33db~qCXfV0waX0335703357euoutp01u
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 10:43:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220428104343euoutp01498358266e41931a3e76d667b50b33db~qCXfV0waX0335703357euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651142623;
 bh=tll8Rq1cOZaova2yjcZmkl23SUCnnMy91esfSOJ+DO4=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=tK9FG0aSr2V20zA2il7iEJHw6sgL61k8VrCWqhuu6/Oz9Ndh+fk3ambACoMINFydx
 fX4FSHggiPV/6S+LaMTQ04rItwADATrDNtswvvzBaKhDGOGUu8pYuDJKRWdclh9T6L
 QEIa5BWonFrNr+ZVpSRW7Rl6x+ygO5iIxSluUo3U=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220428104343eucas1p1adcf0acd6963dc4f809edf4e48857a8d~qCXfMpBWi1566815668eucas1p1F;
 Thu, 28 Apr 2022 10:43:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 67.E0.09887.FDF6A626; Thu, 28
 Apr 2022 11:43:43 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220428104343eucas1p1338eded8d1319afbb154aa6f094df817~qCXexa12H0911509115eucas1p19;
 Thu, 28 Apr 2022 10:43:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220428104343eusmtrp2b22d9fa7283790c70ab58fda32babfd4~qCXewc1Nm0452304523eusmtrp2E;
 Thu, 28 Apr 2022 10:43:43 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-29-626a6fdf86dc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 34.17.09404.EDF6A626; Thu, 28
 Apr 2022 11:43:42 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220428104342eusmtip10c90c10c97459b459ce50e33b1e3c115~qCXeRX5mr0253002530eusmtip1R;
 Thu, 28 Apr 2022 10:43:42 +0000 (GMT)
Message-ID: <9db6de88-dfe0-79af-cb1c-eb996e297f3d@samsung.com>
Date: Thu, 28 Apr 2022 12:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH] drm: exynos: dsi: Use child panel or bridge find helpers
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Maxime Ripard
 <maxime@cerno.tech>, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220428094808.782938-1-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djP87r387OSDOY8lLG48vU9m8Wk+xNY
 LL5smsBmsXzCPjaLGef3MVnM+PGP0YHNY+3H+6wed86dZ/O4332cyaNvyypGj8+b5AJYo7hs
 UlJzMstSi/TtErgy7p58xlTwSbDi2KRfbA2Mj/m6GDk5JARMJFZ838rUxcjFISSwglFiys7r
 7BDOF0aJNVdOM0M4nxkltszbwALTMuHrFKiq5YwSBzd2sEA4HxklGmetA2rh4OAVsJPYej4T
 pIFFQFVi0sHfTCA2r4CgxMmZT8AGiQokSczddw+sXFjAX+LXcS+QMLOAuMStJ/PBThIR2A50
 UusvJoiEmsSSjo9gNpuAoUTX2y42EJtTwFHibVc3C0SNvMT2t3PArpYQuMMhMflkP9TVLhIb
 z89ihLCFJV4d38IOYctI/N8Jso0DyM6X+DvDGCJcIXHt9RpmCNta4s65X2wgJcwCmhLrd+lD
 hB0lmo7MYIHo5JO48VYQ4gI+iUnbpjNDhHklOtqEIKrVJGYdXwe38+CFS8wTGJVmIYXJLCTP
 z0LyyyyEvQsYWVYxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEJp3T/45/2cG4/NVHvUOM
 TByMhxglOJiVRHi/7M5IEuJNSaysSi3Kjy8qzUktPsQozcGiJM6bnLkhUUggPbEkNTs1tSC1
 CCbLxMEp1cAkn29+cYVbSoBmws207XIC3Ktl4l3+6q6OuXvR2Oe19wbHt8fWB6wu4Qs7FRp7
 61PzHreOWQfXFh3O0FoevVa4rOaO7jzhqmjhK3t97NX7GOTqn1x9tHfa47dPJ11MVtKqmz9n
 7qXpm49/Pj9Fc/I0DzeHGjmftXc5q+tW/TLi7y2Rk5m8dbvkhRPPZulPt9+r6HCRKeMzh0hm
 4LL9q8UPx/yZkrj219rM2r9HEj8d3nuqddknT/Evi8ysLvv7TndLK5jMtfifjL2Uq4P1zrPm
 /1M0A/YsWq3NdIbb8Z56W//FdYcidZoO8D824vh0eVOdtLnCyR09tRd3lJySKlujybbBTZeJ
 sfFdZ367yw9RJZbijERDLeai4kQA9Vk+p6kDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xu7r38rOSDBZ8s7S48vU9m8Wk+xNY
 LL5smsBmsXzCPjaLGef3MVnM+PGP0YHNY+3H+6wed86dZ/O4332cyaNvyypGj8+b5AJYo/Rs
 ivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy7p58xlTw
 SbDi2KRfbA2Mj/m6GDk5JARMJCZ8ncLexcjFISSwlFHi7c3FrBAJGYmT0xqgbGGJP9e62CCK
 3jNKXJm2hamLkYODV8BOYuv5TJAaFgFViUkHfzOB2LwCghInZz5hAbFFBZIkXmx7zghiCwv4
 SlzYPJ8NxGYWEJe49WQ+E8hMEYHtjBInli9hgkioSSzp+MgEsWwKo8S8aa/BOtgEDCW63naB
 2ZwCjhJvu7pZIBrMJLq2djFC2PIS29/OYZ7AKDQLySGzkCychaRlFpKWBYwsqxhFUkuLc9Nz
 i430ihNzi0vz0vWS83M3MQKjbduxn1t2MK589VHvECMTB+MhRgkOZiUR3i+7M5KEeFMSK6tS
 i/Lji0pzUosPMZoCQ2Mis5Rocj4w3vNK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NT
 C1KLYPqYODilGpj4VCasflp3aGVps557idqajrNtnZ94tHbJy69YV/1yQeOyE/e4qkOWv0n4
 L+ubbHHDLk7CPfykrm8GM99x60u/ZDYcLPA20Yt+Vu2lnaFwprbH5Pf15fvfxfUePL8icDJn
 yrdjBno2u8w2yizZffBLqTivz6Edsrs91tfpBmgUr/tpp3H1w932V692r2RVOt8T1VFXaTwv
 kY/rK1eFyqalU4Rehp99+3tW+Enf52fvfKw483Ly6RVH5D6rdKV2X4pf1HKC60hk44vNj+et
 Vtj9wvDqlO6O7jYPVaFztkFVKo9P3fPatFtR59S9Ey17TnEJqjxnvF/H/vnvluZz64sK59e4
 /vo/6fCNo6enGvXdU2Ipzkg01GIuKk4EACO61s4/AwAA
X-CMS-MailID: 20220428104343eucas1p1338eded8d1319afbb154aa6f094df817
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220428094854eucas1p2c7252b3e6aba5c55a25aef398e8517d4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220428094854eucas1p2c7252b3e6aba5c55a25aef398e8517d4
References: <CGME20220428094854eucas1p2c7252b3e6aba5c55a25aef398e8517d4@eucas1p2.samsung.com>
 <20220428094808.782938-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.04.2022 11:48, Jagan Teki wrote:
> commit <711c7adc4687> ("drm: exynos: dsi: Use drm panel_bridge API")
> added devm_drm_of_get_bridge for looking up if child node has panel
> or bridge.
>
> However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
> has panel or bridge") has reverted panel or bridge child node lookup
> from devm_drm_of_get_bridge which eventually failed to find the DSI
> devices in exynos drm dsi driver.
>
> So, use the conventional child panel bridge lookup helpers like it
> does before.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

This restores Exynos DSI driver operation in linux-next after the 
mentioned commits went via drm-misc-fixes tree.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index f067c86b0b12..ec673223d6b7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -25,6 +25,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_simple_kms_helper.h>
> @@ -1451,9 +1452,18 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   	struct device *dev = dsi->dev;
>   	struct drm_encoder *encoder = &dsi->encoder;
>   	struct drm_device *drm = encoder->dev;
> +	struct drm_panel *panel;
>   	int ret;
>   
> -	dsi->out_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	panel = of_drm_find_panel(device->dev.of_node);
> +	if (!IS_ERR(panel)) {
> +		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> +	} else {
> +		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> +		if (!dsi->out_bridge)
> +			dsi->out_bridge = ERR_PTR(-EINVAL);
> +	}
> +
>   	if (IS_ERR(dsi->out_bridge)) {
>   		ret = PTR_ERR(dsi->out_bridge);
>   		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

