Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA1C8A80E4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 12:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28CA10F56F;
	Wed, 17 Apr 2024 10:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="tPS1FpQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC63E10F56F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713349674;
 bh=igKb1+9ORijlEOAngHwdjRu6XCuUhCp5tx6ifK5ZhJ8=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=tPS1FpQidS4mEjupwQSkrvh2Y6jR4RzXxnuepn5ZYhPUzrkfgh745SW8jSLZOpipc
 LE9QeKfi+Lo9+GTROFU3kPxkj8Zfwb88avWezJd53YL2GPyhLZuj2DdxtA81SNb6Tc
 EZqBPLN3V7uORWjUGhaMUBunnYpjHTiggdyNwGASrDPosz/oI/gKB9pVXbglAbrhJ6
 YGLkBRi49WHgYgbImowDqeO2rQnCHgFLIAz1hm+JDX4S5ldmA62HUxSaYQOQJl3ARX
 vooHjnOmZjlJ8wD0ViSg+FvddinMn3KMKxHLPASKMxD8SLIY/5/knuxXtSA2U5pTYC
 Jb1WTtJWHNJpw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D7E9D37820F1;
 Wed, 17 Apr 2024 10:27:52 +0000 (UTC)
Message-ID: <37ffdb00-8d7a-4305-8814-6794c755c190@collabora.com>
Date: Wed, 17 Apr 2024 12:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 17/18] arm64: dts: mediatek: add display blocks support
 for the MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-17-33ce8864b227@baylibre.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-17-33ce8864b227@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
> - Add aliases for each display components to help display drivers.
> - Add the Display Pulse Width Modulation (DISP_PWM) to provide PWM signals
>    for the LED driver of mobile LCM.
> - Add the MIPI Display Serial Interface (DSI) PHY support. (up to 4-lane
>    output)
> - Add the display mutex support.
> - Add the following display component support:
>    - OVL0 (Overlay)
>    - RDMA0 (Data Path Read DMA)
>    - Color0
>    - CCorr0 (Color Correction)
>    - AAL0 (Adaptive Ambient Light)
>    - GAMMA0
>    - Dither0
>    - DSI0 (Display Serial Interface)
>    - RDMA1 (Data Path Read DMA)
>    - DPI0 (Display Parallel Interface)
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 146 +++++++++++++++++++++++++++++++
>   1 file changed, 146 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 24581f7410aa..a95f90da4491 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -8,6 +8,7 @@
>   #include <dt-bindings/clock/mediatek,mt8365-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mediatek,mt8365-power.h>
>   
> @@ -17,6 +18,19 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> +	aliases {
> +		aal0 = &aal0;
> +		ccorr0 = &ccorr0;
> +		color0 = &color0;
> +		dither0 = &dither0;
> +		dpi0 = &dpi0;
> +		dsi0 = &dsi0;
> +		gamma0 = &gamma0;
> +		ovl0 = &ovl0;
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
> +	};
> +
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> @@ -607,6 +621,17 @@ spi: spi@1100a000 {
>   			status = "disabled";
>   		};
>   
> +		disp_pwm: pwm@1100e000 {
> +			compatible = "mediatek,mt8365-disp-pwm",
> +				     "mediatek,mt8183-disp-pwm";

Fits in a single line

> +			reg = <0 0x1100e000 0 0x1000>;
> +			clock-names = "main", "mm";
> +			clocks = <&topckgen CLK_TOP_DISP_PWM_SEL>,
> +				 <&infracfg CLK_IFR_DISP_PWM>;

same

> +			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +			#pwm-cells = <2>;
> +		};
> +
>   		i2c3: i2c@1100f000 {
>   			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
>   			reg = <0 0x1100f000 0 0xa0>, <0 0x11000200 0 0x80>;
> @@ -703,6 +728,15 @@ ethernet: ethernet@112a0000 {
>   			status = "disabled";
>   		};
>   
> +		mipi_tx0: dsi-phy@11c00000 {
> +			compatible = "mediatek,mt8365-mipi-tx", "mediatek,mt8183-mipi-tx";
> +			reg = <0 0x11c00000 0 0x800>;
> +			clock-output-names = "mipi_tx0_pll";
> +			clocks = <&clk26m>;
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +		};
> +
>   		u3phy: t-phy@11cc0000 {
>   			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
>   			#address-cells = <1>;
> @@ -732,6 +766,13 @@ mmsys: syscon@14000000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		mutex: mutex@14001000 {
> +			compatible =  "mediatek,mt8365-disp-mutex";
> +			reg = <0 0x14001000 0 0x1000>;
> +			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +		};
> +
>   		smi_common: smi@14002000 {
>   			compatible = "mediatek,mt8365-smi-common";
>   			reg = <0 0x14002000 0 0x1000>;
> @@ -755,6 +796,111 @@ larb0: larb@14003000 {
>   			mediatek,larb-id = <0>;
>   		};
>   
> +		ovl0: ovl@1400b000 {
> +			compatible = "mediatek,mt8365-disp-ovl",
> +				     "mediatek,mt8192-disp-ovl";

single line

> +			reg = <0 0x1400b000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MM_DISP_OVL0>;
> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_DISP_OVL0>;
> +			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +		};
> +
> +		rdma0: rdma@1400d000 {
> +			compatible = "mediatek,mt8365-disp-rdma",
> +				     "mediatek,mt8183-disp-rdma";

ditto

> +			reg = <0 0x1400d000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MM_DISP_RDMA0>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
> +			mediatek,rdma-fifo-size = <5120>;
> +			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +		};
> +
> +		color0: color@1400f000 {
> +			compatible = "mediatek,mt8365-disp-color",
> +				     "mediatek,mt8173-disp-color";

...and all the others too (maybe not all, it's fine until 100 cols anyway)


Cheers,
Angelo

