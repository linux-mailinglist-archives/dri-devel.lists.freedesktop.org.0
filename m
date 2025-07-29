Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45EB1514E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 18:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B17610E03A;
	Tue, 29 Jul 2025 16:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="D+a5l1fO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E3810E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 16:29:57 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 8EC6520F84;
 Tue, 29 Jul 2025 18:29:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kh5I-_ur6aEA; Tue, 29 Jul 2025 18:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1753806592; bh=cYPpvp6/LktGFqLRabjLYkW/Jo8p7bCXx5XWj6nAHfQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=D+a5l1fOvhebePXJUchw4Yhtzye0Fw7YkC6+MLurTq8XGuJcueOGpRM2zSobYf8iU
 j5+5ljLOrkjG28uiSPb3IWE8Iu7t6iJ2eU6h2VULRj3V5QCNQuuOcbrsSlJUdyPPGO
 6D2mPPUf0GUCzKVoXw+efXTzlgiO1k0OeLH+LGe5ZR5uOkVxcbnbtjgZfcOA2Dtt+k
 +EMxwuPvc+w094r40OWw9k4Iu0Ej+pJAZ5istvxlAHAsAfQXySN6/VKbIAuAQvG8uv
 ia+cztb0FemhJ98IKUv+ZaGAP4jhyc15v+zAWJohyFvZ2SjEoR+aSBNPTgeyPCQEZr
 cRGAiEqMf+rhg==
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 16:29:52 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 10/13] drm/bridge: samsung-dsim: add ability to define
 clock names for every variant
In-Reply-To: <CAAQKjZNfb6LkShtCvan__ew=H7CaquTqn5DLcP1agtkG6B5mSw@mail.gmail.com>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
 <20250706-exynos7870-dsim-v3-10-9879fb9a644d@disroot.org>
 <CAAQKjZNfb6LkShtCvan__ew=H7CaquTqn5DLcP1agtkG6B5mSw@mail.gmail.com>
Message-ID: <080f567245829dba8572be649a46cc93@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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

On 2025-07-29 07:02, Inki Dae wrote:
> 2025년 7월 7일 (월) 오전 3:28, Kaustabh Chakraborty 
> <kauschluss@disroot.org>님이 작성:
>> 
>> -       dsi->clks = devm_kcalloc(dev, dsi->driver_data->num_clks,
>> -                                sizeof(*dsi->clks), GFP_KERNEL);
>> -       if (!dsi->clks)
>> -               return -ENOMEM;
>> -
>> -       for (i = 0; i < dsi->driver_data->num_clks; i++) {
>> -               dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
>> -               if (IS_ERR(dsi->clks[i])) {
>> -                       if (strcmp(clk_names[i], "sclk_mipi") == 0) {
>> -                               dsi->clks[i] = devm_clk_get(dev, 
>> OLD_SCLK_MIPI_CLK_NAME);
>> -                               if (!IS_ERR(dsi->clks[i]))
>> -                                       continue;
>> -                       }
>> -
>> -                       dev_info(dev, "failed to get the clock: %s\n", 
>> clk_names[i]);
>> -                       return PTR_ERR(dsi->clks[i]);
>> -               }
>> +       ret = devm_clk_bulk_get(dev, dsi->driver_data->num_clks,
>> +                               dsi->driver_data->clk_data);
>> +       if (ret) {
>> +               dev_err(dev, "failed to get clocks in bulk (%d)\n", 
>> ret);
>> +               return ret;
> 
> Above change modifies the existing behavior.
> 
> Previously, when devm_clk_get() failed and the clock name was
> "sclk_mipi", the code included a fallback mechanism to try "pll_clk"
> instead. This fallback logic has been removed in the current patch.
> 
> While changing this behavior may raise concerns, the benefits of
> refactoring—specifically, defining clock names per SoC and adopting
> the clk_bulk_* API for improved maintainability—appear to outweigh the
> potential downsides.

I have checked all devices which use this driver.

Here is a mapping of all compatible -> clock names in the driver:
- fsl,imx8mm-mipi-dsim: bus_clk, sclk_mipi
- fsl,imx8mp-mipi-dsim: bus_clk, sclk_mipi
- samsung,exynos3250-mipi-dsi: bus_clk, pll_clk
- samsung,exynos4210-mipi-dsi: bus_clk, sclk_mipi
- samsung,exynos5410-mipi-dsi: bus_clk, pll_clk
- samsung,exynos5422-mipi-dsi: bus_clk, pll_clk
- samsung,exynos5433-mipi-dsi: bus_clk, sclk_mipi,
                                phyclk_mipidphy0_bitclkdiv8,
                                phyclk_mipidphy0_rxclkesc0,
                                sclk_rgb_vclk_to_dsim0

And here is what I found by grep-ing all devicetrees:

arm/boot/dts/nxp/imx/imx7s.dtsi
     compatible = "fsl,imx7d-mipi-dsim", "fsl,imx8mm-mipi-dsim";
     (uses bus_clk, sclk_mipi)

arm/boot/dts/samsung/exynos3250.dtsi
     compatible = "samsung,exynos3250-mipi-dsi";
     (uses bus_clk, pll_clk)

arm/boot/dts/samsung/exynos4.dtsi
     compatible = "samsung,exynos4210-mipi-dsi";
     (uses bus_clk, sclk_mipi)

arm/boot/dts/samsung/exynos5420.dtsi
     compatible = "samsung,exynos5410-mipi-dsi";
     (uses bus_clk, pll_clk)

arm/boot/dts/samsung/exynos5800.dtsi
     compatible = "samsung,exynos5422-mipi-dsi";
     (uses bus_clk, pll_clk - uses node from exynos5420.dtsi)

arm64/boot/dts/exynos/exynos5433.dtsi
     compatible = "samsung,exynos5433-mipi-dsi";
     (uses bus_clk, sclk_mipi, and 3 others as mentioned above)

arm64/boot/dts/freescale/imx8mm.dtsi
     compatible = "fsl,imx8mm-mipi-dsim";
     (uses bus_clk, sclk_mipi)

arm64/boot/dts/freescale/imx8mn.dtsi
     compatible = "fsl,imx8mn-mipi-dsim", "fsl,imx8mm-mipi-dsim";
     (uses bus_clk, sclk_mipi)

arm64/boot/dts/freescale/imx8mp.dtsi
     compatible = "fsl,imx8mp-mipi-dsim";
     (uses bus_clk, sclk_mipi)

So, there shouldn't be any regressions.

> 
> Unless there are objections from other reviewers, I intend to proceed
> with merging this patch.
> If anyone has concerns or sees potential issues with this change,
> please share your thoughts.
> 
> Thanks,
> Inki Dae
> 
