Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77337A25363
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 08:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E374E10E3F1;
	Mon,  3 Feb 2025 07:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mH1VjjzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59C210E3F1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 07:57:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AF5E4A40C61;
 Mon,  3 Feb 2025 07:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AE8C4CEE2;
 Mon,  3 Feb 2025 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738569427;
 bh=5kJGuiN/HJ5xJyJ8CV/kCat9j7iBCMcYyia9cYykokw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mH1VjjzFMznyc23SuohffVCndcU3q/YdzYR/SqCthoRVEnF6c5vo/uyAJD4itxzmg
 AN8S1mOgDCwqjsS1IblK7xZE+IbZ4isReC2oRPp4S5ECn9tVDV+kuLpbVk+jDHR1q8
 PDXYM8hmJ6B9vMirBDkMETCUHP9yIYAeJoOFyX7yKNhKMaZL2zHqa7N0j1SnfP0TUo
 Ay1dvF6uilNs/NFgm8T705/fLAp51TEyS4Nay6Jxl6fvxUXl54ekqsNnmhaNbif2PH
 /fB60l1Zix7lnVrxmUUwFAJaFNVoMb6/foIbVFBeXGj7VlsV9cx8t4u4MVzmEhPcTk
 gV3AAAwX7rxZA==
Date: Mon, 3 Feb 2025 08:57:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
 Vivek Gautam <gautam.vivek@samsung.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 03/33] dt-bindings: clock: document exynos7870 clock
 driver CMU bindings
Message-ID: <20250203-congenial-transparent-horse-cc5d4b@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250202190924.15036-1-kauschluss@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202190924.15036-1-kauschluss@disroot.org>
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

On Mon, Feb 03, 2025 at 12:39:24AM +0530, Kaustabh Chakraborty wrote:

Subject - drop driver. Bindings are about hardware. This applies to all
your bindings patches

> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: gout_mif_cmu_mfcmscl_mfc
> +            - const: gout_mif_cmu_mfcmscl_mscl
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7870-cmu-peri
> +

Drop blank line

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_PERI bus clock (from CMU_MIF)
> +            - description: SPI0 clock (from CMU_MIF)
> +            - description: SPI1 clock (from CMU_MIF)
> +            - description: SPI2 clock (from CMU_MIF)
> +            - description: SPI3 clock (from CMU_MIF)
> +            - description: SPI4 clock (from CMU_MIF)
> +            - description: UART0 clock (from CMU_MIF)
> +            - description: UART1 clock (from CMU_MIF)
> +            - description: UART2 clock (from CMU_MIF)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: gout_mif_cmu_peri_bus
> +            - const: gout_mif_cmu_peri_spi0
> +            - const: gout_mif_cmu_peri_spi1
> +            - const: gout_mif_cmu_peri_spi2
> +            - const: gout_mif_cmu_peri_spi3
> +            - const: gout_mif_cmu_peri_spi4
> +            - const: gout_mif_cmu_peri_uart0
> +            - const: gout_mif_cmu_peri_uart1
> +            - const: gout_mif_cmu_peri_uart2
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - reg

required block is just after properties.

> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock controller node for CMU_PERI

Drop

> +  - |
> +    #include <dt-bindings/clock/exynos7870.h>
> +
> +    cmu_peri: clock-controller@101F0000 {

Lowercase hex

> +      compatible = "samsung,exynos7870-cmu-peri";
> +      reg = <0x101f0000 0x1000>;
> +      #clock-cells = <1>;
> +
> +      clock-names = "oscclk",
> +                    "gout_mif_cmu_peri_bus",
> +                    "gout_mif_cmu_peri_spi0",
> +                    "gout_mif_cmu_peri_spi1",
> +                    "gout_mif_cmu_peri_spi2",
> +                    "gout_mif_cmu_peri_spi3",
> +                    "gout_mif_cmu_peri_spi4",
> +                    "gout_mif_cmu_peri_uart0",
> +                    "gout_mif_cmu_peri_uart1",
> +                    "gout_mif_cmu_peri_uart2";
> +      clocks = <&oscclk>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_BUS>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI0>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI1>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI2>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI3>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI4>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART0>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART1>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART2>;
> +    };
> +
> +...
> -- 
> 2.48.1
> 
