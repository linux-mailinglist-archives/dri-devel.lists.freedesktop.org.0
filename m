Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1EF5FFB41
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 18:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5AB10E09E;
	Sat, 15 Oct 2022 16:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B8510E447
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 16:37:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24972B80AEA;
 Sat, 15 Oct 2022 16:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708C0C433D7;
 Sat, 15 Oct 2022 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665851830;
 bh=uBgXXwi9mq1hGYM24KHB/LA4y7CvSaQDWZCJOLwjDkc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uf4JvNmFaQHbMmIS9+znxbdCByK1M07kKU9zSTKZHy58+JM8rC3FBdpxZsaRTydK4
 9JuwYWjy8UuVEv9NKa5d9hvn2EGJKQVDxp5ee9u1nHx0ljL8XOe7xOSYBcBR37y/K9
 cqfzCi05daR4XCL4OzowPjhth5NPC1PlK4naNfSVfhvbZWK6EORBLMPZU2047dL39/
 mSpeCVRVKCFFh1CeVQzxQgDlnh+7wE/Spra9f9UB8/yY4Oorrk8SeiBMuW0aHQVG0F
 vh0snCzLTtEZpZ3FyuMkSlYDhGDR5OIV5XaiaeyUd4dKLGch30ySZ2EMbYL1CrBBFg
 XLFX806V9jXBQ==
Date: Sat, 15 Oct 2022 17:37:31 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples, again
Message-ID: <20221015173731.0a5acc4d@jic23-huawei>
In-Reply-To: <20221014205104.2822159-1-robh@kernel.org>
References: <20221014205104.2822159-1-robh@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Rashmi A <rashmi.a@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Sumit Gupta <sumitg@nvidia.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Nandhini Srikandan <nandhini.srikandan@intel.com>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Oct 2022 15:51:04 -0500
Rob Herring <robh@kernel.org> wrote:

> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).
> 
> A meta-schema check for this is pending, so hopefully the last time to
> fix these.
> 
> Fix the indentation in intel,phy-thunderbay-emmc while we're here.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio

> ---
>  .../arm/tegra/nvidia,tegra-ccplex-cluster.yaml    |  1 -
>  .../display/tegra/nvidia,tegra124-dpaux.yaml      |  1 -
>  .../display/tegra/nvidia,tegra186-display.yaml    |  2 --
>  .../bindings/iio/addac/adi,ad74413r.yaml          |  1 -
>  .../devicetree/bindings/net/cdns,macb.yaml        |  1 -
>  .../devicetree/bindings/net/nxp,dwmac-imx.yaml    |  1 -
>  .../bindings/phy/intel,phy-thunderbay-emmc.yaml   | 15 +++++++--------
>  7 files changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
> index 711bb4d08c60..869c266e7ebc 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
> @@ -47,5 +47,4 @@ examples:
>        compatible = "nvidia,tegra234-ccplex-cluster";
>        reg = <0x0e000000 0x5ffff>;
>        nvidia,bpmp = <&bpmp>;
> -      status = "okay";
>      };
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
> index 9ab123cd2325..5cdbc527a560 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
> @@ -128,7 +128,6 @@ examples:
>          resets = <&tegra_car 181>;
>          reset-names = "dpaux";
>          power-domains = <&pd_sor>;
> -        status = "disabled";
>  
>          state_dpaux_aux: pinmux-aux {
>              groups = "dpaux-io";
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
> index 8c0231345529..ce5c673f940c 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yaml
> @@ -138,7 +138,6 @@ examples:
>                   <&bpmp TEGRA186_CLK_NVDISPLAY_DSC>,
>                   <&bpmp TEGRA186_CLK_NVDISPLAYHUB>;
>          clock-names = "disp", "dsc", "hub";
> -        status = "disabled";
>  
>          power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
>  
> @@ -227,7 +226,6 @@ examples:
>          clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_DISP>,
>                   <&bpmp TEGRA194_CLK_NVDISPLAYHUB>;
>          clock-names = "disp", "hub";
> -        status = "disabled";
>  
>          power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
>  
> diff --git a/Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml b/Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml
> index 03bb90a7f4f8..d2a9f92c0a6d 100644
> --- a/Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml
> +++ b/Documentation/devicetree/bindings/iio/addac/adi,ad74413r.yaml
> @@ -114,7 +114,6 @@ examples:
>        #size-cells = <0>;
>  
>        cs-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
> -      status = "okay";
>  
>        ad74413r@0 {
>          compatible = "adi,ad74413r";
> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> index 318f4efe7f6f..bef5e0f895be 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -203,7 +203,6 @@ examples:
>                      power-domains = <&zynqmp_firmware PD_ETH_1>;
>                      resets = <&zynqmp_reset ZYNQMP_RESET_GEM1>;
>                      reset-names = "gem1_rst";
> -                    status = "okay";
>                      phy-mode = "sgmii";
>                      phys = <&psgtr 1 PHY_TYPE_SGMII 1 1>;
>                      fixed-link {
> diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> index 4c155441acbf..0270b0ca166b 100644
> --- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> +++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
> @@ -92,5 +92,4 @@ examples:
>                       <&clk IMX8MP_CLK_ENET_QOS>;
>              clock-names = "stmmaceth", "pclk", "ptp_ref", "tx";
>              phy-mode = "rgmii";
> -            status = "disabled";
>      };
> diff --git a/Documentation/devicetree/bindings/phy/intel,phy-thunderbay-emmc.yaml b/Documentation/devicetree/bindings/phy/intel,phy-thunderbay-emmc.yaml
> index 34bdb5c4cae8..b09e5ba5e127 100644
> --- a/Documentation/devicetree/bindings/phy/intel,phy-thunderbay-emmc.yaml
> +++ b/Documentation/devicetree/bindings/phy/intel,phy-thunderbay-emmc.yaml
> @@ -36,11 +36,10 @@ additionalProperties: false
>  
>  examples:
>    - |
> -     mmc_phy@80440800 {
> -     #phy-cells = <0x0>;
> -     compatible = "intel,thunderbay-emmc-phy";
> -     status = "okay";
> -     reg = <0x80440800 0x100>;
> -     clocks = <&emmc>;
> -     clock-names = "emmcclk";
> -     };
> +    mmc_phy@80440800 {
> +        #phy-cells = <0x0>;
> +        compatible = "intel,thunderbay-emmc-phy";
> +        reg = <0x80440800 0x100>;
> +        clocks = <&emmc>;
> +        clock-names = "emmcclk";
> +    };

