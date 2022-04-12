Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C9C4FD375
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE2B10E250;
	Tue, 12 Apr 2022 09:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4D110E250
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:55:43 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220412095541euoutp02fe469e638e860eeffb1283a496b1d8b7~lHY_3nJcS1155011550euoutp02O
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:55:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220412095541euoutp02fe469e638e860eeffb1283a496b1d8b7~lHY_3nJcS1155011550euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649757341;
 bh=njL2qvMFEhc0HzKA4tmgsS/RDhcCQzFsP7scg60RFzY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Z5VzAJSqs/bx2PopCOi/JpZraBnG2ADmjCSmvdHQ4umD10wpdGBarhHxr+5i4zh+s
 Gu8PhtTbngjnv2A5aJY4Yk1/KgZY3+PS/PPN5Q3VC7FEoYGGu9ODL3goaej8oAE5Rk
 3CvfZyrql1Bo49BoJ/uLeOeKDh2MEF/sCatBpfps=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220412095541eucas1p222886ea3c33e6a2bf05cb3c20057aee7~lHY_eBiZo2834828348eucas1p2q;
 Tue, 12 Apr 2022 09:55:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 99.C2.09887.D9C45526; Tue, 12
 Apr 2022 10:55:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220412095540eucas1p26338894d71d3ab9190ac24639a89feff~lHY97jrgM3241332413eucas1p2s;
 Tue, 12 Apr 2022 09:55:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220412095540eusmtrp27ca8c15d1c0ea9fd2cddeca7af9946d1~lHY91mUGV2041920419eusmtrp2B;
 Tue, 12 Apr 2022 09:55:40 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-26-62554c9de641
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A6.4B.09404.C9C45526; Tue, 12
 Apr 2022 10:55:40 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220412095537eusmtip1588c11a8d081c52b541062d64f10378a~lHY7KZ8rA1294412944eusmtip1F;
 Tue, 12 Apr 2022 09:55:37 +0000 (GMT)
Message-ID: <5823f59a-9c57-5f9a-0ebd-1ea2f39e73cb@samsung.com>
Date: Tue, 12 Apr 2022 11:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 02/11] drm: bridge: samsung-dsim: Handle platform init
 via driver_data
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Rob Herring
 <robh+dt@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220408162108.184583-3-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzlvvf6+trY7lkl3Og2tyZug0Q+hn/cAZKxOPNiTJhGTAAdFHgB
 JhTXB36MbMMPBOrAtotQi6ROuhSwA61gQV0XGqATB4gCMwitRHQqIIHipsi6tX268d/5nd/H
 OefmUrisklxD5SoLWZVSkScnxcTlnhcDG+q2JWVEajw4Grt7A0fueg+Bpu42kMjY1S9AQ89m
 SVT5ow/p3BoCLVg1JHrkGiRQ35FpIarQmoTIrLGTyHp/RIDUi4040g/YMdR7uJRAjqpUNG+Y
 wFHpz11CpP/+MYkGf53HPw5mfppzC5jZO6VCpv+7cZLpMIwLmdry0wKm/tpjjLE2VZBM13C9
 gBkbuUYy7hNOjLlk+pa5+LQdY6pamwDjsb79mTRFHJfF5uXuZ1UR8eninG67HdvXKT9oNLdi
 JWBxrRqIKEhvhOrpUVwNxJSMbgCwrdOC8cUCgN6qF4AvPADeqvlL+HrldssQyTfMvpXbNiFf
 zAFo/L1Z4J+S0PGwvswE/Jig10O78TDO8yvh9dOThB8H0xnwvO287xJFraJ3Q50zzk/jdAgc
 nTQGbKymlwj4ctFF8o2HAP7mDtwk6SionlEHeBGdADt0o69m1kHbzJlAIEh7RfDqn70C3vZm
 qG+4B3i8Cj5xtr6K8yb8p8OvRvlwAfxbH83TB+HIlAXncSwc618M+MTpUNhyJYKnE+D0kWrA
 b0rhnZmVvAMp1F2uwXlaAsuPy/jp96DB2fyfZufNW7gGyA3L3sSwLLxhWRbD/7pnAdEEQtgi
 Lj+b5T5UsgfCOUU+V6TMDs8syLcC34+94XUutAPzk7lwB8Ao4ACQwuWrJSffT8qQSbIUh75i
 VQVpqqI8lnOAtRQhD5Fk5l5QyOhsRSG7l2X3sarXXYwSrSnB2n4I+mipd3eYzRKT803i7MDO
 Ff1LoQmbgnacDHqgldobL41sqmHLpO80FOvmMlwlm4styQ/Cnh+L7Z3vPjpWe7y15dQvz6TN
 cNjb8wbZFXk09v5baVzb/sRjyee21o7GOOdBX+jDl+2pKZEx284oDhVXOptFddV/7Emu+MIs
 m/g0bcOMN0W75dG9yvWO8cRSwYJWn/llLZgss6wbzNvztckVb6xulPfZpMHq7RXhU3QoHbUr
 6cLOKTr93ayNHYU3M7vPfj6cU7dUfuBpKrcdaxyaiNoxFK08lQ3MEpje4mWl1NYrJaaeFSbV
 Rf0nPUUG6Ra3uDPug4jnLi154qpHFy0nuBxFVBiu4hT/ArP6jSAgBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsVy+t/xu7pzfEKTDBZ9FrO4c/s0s8X9xZ9Z
 LF7fXsFmMf/IOVaLK1/fs1n0LgWyJt2fwGLxZdMENosX9y6yWJxtesNu0TlxCbvF8gn72Cw2
 Pb7GatH1ayWzxYzz+5gsTjW2slgc6ou2+DTrIbNF694j7BYzJr9ks7h44hOzg6jH2o/3WT3e
 32hl9zjXc5fNY+esu+wesztmsnos3vOSyWPTqk42jyNXF7N63Lm2h83jfvdxJo/NS+o9Nr7b
 weTRt2UVo8fnTXIBfFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2Nimp
 OZllqUX6dgl6GUf37WMqOKhUMX/5FqYGxl/SXYycHBICJhKX119hA7GFBJYySmw+ZwYRl5E4
 Oa2BFcIWlvhzrQuohguo5j2jxMzPp9lBErwCdhKL25cwgtgsAqoS++Y3MkPEBSVOznzCAmKL
 CiRJXOpqB6sRFoiR2HBmJ1icWUBc4taT+UwgtohAA6vEoYtcEPFnjBJ3f6VBLDvNKHH1xQqw
 ZWwChhJdb7vALuUUcJTYOekWG0SDmUTX1i5GCFteYvvbOcwTGIVmIbljFpJ9s5C0zELSsoCR
 ZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgWtl27OeWHYwrX33UO8TIxMF4iFGCg1lJhLdf
 PTRJiDclsbIqtSg/vqg0J7X4EKMpMDAmMkuJJucDE1teSbyhmYGpoYmZpYGppZmxkjivZ0FH
 opBAemJJanZqakFqEUwfEwenVANTdA/7vdWLF03Tq34yY8eWXT0idllTgy6H365VSpp86X+z
 D/ssfe7Lt0tr/zdMiVXZJFlV+ZXFMOIyx+GMGO9FSxwLY4L+v48zeumtybM+s/jik+0H7ddY
 BXCetLvQsLtFLfvP7uj1EpsPlfOr3Sr6OZV77bIN8ZNU8p9cWnhqmvLCzzdVZkdLCcjX597q
 f/akqFYiyV1M9UGgrhT32gyb3u6Nc1Q7hc395707eHKPdkTv/MevrU0+el/k/dvA1RviqTn3
 v8NNzyWz1gq+2bl+Sh37r82Cx9V5/04T3yDv8b+1zlrOvaAmqi+Tm1+OJ/LySbfV1xJ/Hf/3
 MftaRc+6duPvb27s5UxL+M6+1ktPiaU4I9FQi7moOBEAyqNtI7QDAAA=
X-CMS-MailID: 20220412095540eucas1p26338894d71d3ab9190ac24639a89feff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220408162227eucas1p1f07cc5435b048a33013a72b52b135081
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220408162227eucas1p1f07cc5435b048a33013a72b52b135081
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
 <CGME20220408162227eucas1p1f07cc5435b048a33013a72b52b135081@eucas1p1.samsung.com>
 <20220408162108.184583-3-jagan@amarulasolutions.com>
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


On 08.04.2022 18:20, Jagan Teki wrote:
> In order to make a common Samsung DSIM bridge driver some platform specific
> glue code needs to maintain separately as it is hard to maintain platform
> specific glue and conventional component_ops on the drm bridge drivers side.
>
> This patch is trying to support that glue code initialization and invocation
> in the form of platform_init flag in driver_data.
>
> So, the platforms which enable platform_init flags will handle all platform
> specific initialization via samsung_dsim_plat_probe.
>
> The Platform probe is responsible to
> - initialize samsung_dsim_plat_data and install hooks
> - initialize component_ops
> - preserve samsung_dsim structure pointer
>
> v1:
> * use platform_init instead of exynos_specific
> * handle component_ops in glue code
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 20 ++++++++++++++++----
>   include/drm/bridge/samsung-dsim.h     |  1 +
>   2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index ee5d7e5518a6..0e6a5d1c7e4e 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -370,6 +370,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
>   	.wait_for_reset = 1,
>   	.num_bits_resol = 11,
>   	.reg_values = reg_values,
> +	.platform_init = true,
>   };
>   
>   static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
> @@ -382,6 +383,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
>   	.wait_for_reset = 1,
>   	.num_bits_resol = 11,
>   	.reg_values = reg_values,
> +	.platform_init = true,
>   };
>   
>   static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
> @@ -392,6 +394,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
>   	.wait_for_reset = 1,
>   	.num_bits_resol = 11,
>   	.reg_values = reg_values,
> +	.platform_init = true,
>   };
>   
>   static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
> @@ -403,6 +406,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
>   	.wait_for_reset = 0,
>   	.num_bits_resol = 12,
>   	.reg_values = exynos5433_reg_values,
> +	.platform_init = true,
>   };
>   
>   static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
> @@ -414,6 +418,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
>   	.wait_for_reset = 1,
>   	.num_bits_resol = 12,
>   	.reg_values = exynos5422_reg_values,
> +	.platform_init = true,
>   };
>   
>   static const struct of_device_id samsung_dsim_of_match[] = {
> @@ -1565,12 +1570,16 @@ static int samsung_dsim_probe(struct platform_device *pdev)
>   	dsi->bridge.of_node = dev->of_node;
>   	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>   
> -	dsi->plat_data = samsung_dsim_plat_probe(dsi);
> -	if (IS_ERR(dsi->plat_data)) {
> +	if (dsi->driver_data->platform_init) {
> +		dsi->plat_data = samsung_dsim_plat_probe(dsi);
>   		ret = PTR_ERR(dsi->plat_data);

ret = IS_ERR(dsi->plat_data) ? PTR_ERR(dsi->plat_data) : 0;

otherwise it always fails.

> -		goto err_disable_runtime;
> +	} else {
> +		ret = mipi_dsi_host_register(&dsi->dsi_host);
>   	}
>   
> +	if (ret)
> +		goto err_disable_runtime;
> +
>   	return 0;
>   
>   err_disable_runtime:
> @@ -1585,7 +1594,10 @@ static int samsung_dsim_remove(struct platform_device *pdev)
>   
>   	pm_runtime_disable(&pdev->dev);
>   
> -	samsung_dsim_plat_remove(dsi);
> +	if (dsi->driver_data->platform_init)
> +		samsung_dsim_plat_remove(dsi);
> +	else
> +		mipi_dsi_host_unregister(&dsi->dsi_host);
>   
>   	return 0;
>   }
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
> index 59a43f9c4477..eca7eacb5910 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -39,6 +39,7 @@ struct samsung_dsim_driver_data {
>   	unsigned int wait_for_reset;
>   	unsigned int num_bits_resol;
>   	const unsigned int *reg_values;
> +	bool platform_init;
>   };
>   
>   struct samsung_dsim_host_ops {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

