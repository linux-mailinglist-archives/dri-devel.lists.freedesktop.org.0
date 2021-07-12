Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B53C5EE5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 17:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16DB89CAD;
	Mon, 12 Jul 2021 15:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5097189CAD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 15:13:26 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id g22so23156971iom.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 08:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ywEGSSGnXYgQreUoGAWNVHwZEeeGGdOlrzirLAGyzSI=;
 b=s4eiMQCs4B1WemS2IxIoSZGp6mkJYZ++QUSeGNNIPtNmy4eoyBGEPDrWpX/BRIeJTy
 E/7OcXxQSLwhHDQ9h0SuxeugJIW1BSdlE67JDCyOwp8ggMhm2v1nwsCT/HdSZYX7cW98
 W/9iMskPEhXuilka3hnJL21SrTa4PxjT0T9ORv6VA49AFFJZW9X94VRnHPnjv4KfqWiN
 +aO1Gl1PFCYe0o7FK7P5D8bFPL4VliEJd0FoiDhhP6AAmJOcRe9L2Qv3nwIqHpG/6njF
 vS6t07a8Oz6y57siyHozO6W5QJ0lZ39UpuGltA4K/wuCI86vaAeS7cPlIV5UdzBi3L9Q
 eecg==
X-Gm-Message-State: AOAM531hmbolRxJDbIS0jVjefYAhWIiGhUNdrVbfGGpiiN5yaqNPmkTu
 hUDvIMEX4ju7L85yPRLF/g==
X-Google-Smtp-Source: ABdhPJwGzyduDXgO004wRTI2OMhmKNmAtIUZJZ3h6v1x6kCyzkOGf6zAO5Eneh4pVkn0cPr+MFqPKw==
X-Received: by 2002:a02:a68e:: with SMTP id j14mr26364562jam.104.1626102805452; 
 Mon, 12 Jul 2021 08:13:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id d205sm7749793iof.31.2021.07.12.08.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:13:24 -0700 (PDT)
Received: (nullmailer pid 1943556 invoked by uid 1000);
 Mon, 12 Jul 2021 15:13:22 -0000
Date: Mon, 12 Jul 2021 09:13:22 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 08/17] dt-bindings: display: bridge: Add Samsung MIPI
 DSIM bridge
Message-ID: <20210712151322.GA1931925@robh.at.kernel.org>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-9-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704090230.26489-9-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 04, 2021 at 02:32:21PM +0530, Jagan Teki wrote:
> Samsing MIPI DSIM bridge can be found on Exynos and NXP's
> i.MX8M Mini and Nano SoC's.
> 
> This dt-bindings replaces legacy exynos_dsim.txt.
> 
> Used the example node from latest Exynos SoC instead of
> the one used in legacy exynos_dsim.txt.
> 
> Add dt-bingings for it.

typo

> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 278 ++++++++++++++++++
>  .../bindings/display/exynos/exynos_dsim.txt   |  90 ------
>  MAINTAINERS                                   |   1 +
>  3 files changed, 279 insertions(+), 90 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> new file mode 100644
> index 000000000000..b2970734ffd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> @@ -0,0 +1,278 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung MIPI DSIM bridge controller
> +
> +maintainers:
> +  - Inki Dae <inki.dae@samsung.com>
> +  - Joonyoung Shim <jy0922.shim@samsung.com>
> +  - Seung-Woo Kim <sw0312.kim@samsung.com>
> +  - Kyungmin Park <kyungmin.park@samsung.com>
> +  - Andrzej Hajda <a.hajda@samsung.com>
> +  - Jagan Teki <jagan@amarulasolutions.com>
> +
> +description: |
> +  Samsung MIPI DSIM bridge controller can be found it on Exynos
> +  and i.MX8M Mini and Nano SoC's.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos3250-mipi-dsi
> +      - samsung,exynos4210-mipi-dsi
> +      - samsung,exynos5410-mipi-dsi
> +      - samsung,exynos5422-mipi-dsi
> +      - samsung,exynos5433-mipi-dsi

What about i.MX compatibles?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 5
> +
> +  phys:
> +    maxItems: 1
> +    description: phandle to the phy module representing the DPHY

Drop

> +
> +  phy-names:
> +    items:
> +      - const: dsim
> +
> +  samsung,phy-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: phandle to the samsung phy-type
> +
> +  power-domains:
> +    description: phandle to the associated power domain

Drop

> +    maxItems: 1
> +
> +  samsung,power-domain:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the associated samsung power domain
> +    maxItems: 1
> +
> +  vddcore-supply:
> +    description: MIPI DSIM Core voltage supply (e.g. 1.1V)
> +
> +  vddio-supply:
> +    description: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
> +
> +  samsung,burst-clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DSIM high speed burst mode frequency.
> +
> +  samsung,esc-clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DSIM escape mode frequency.
> +
> +  samsung,pll-clock-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DSIM oscillator clock frequency.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

If there are no extra endpoint properties, then use 
'/schemas/graph.yaml#/properties/port'.

> +        description:
> +          Input port node to receive pixel data from the
> +          display controller. Exactly one endpoint must be
> +          specified.
> +        properties:
> +          endpoint@0:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description: sub-node describing the input from MIC

I'd assume i.MX has a different input than MIC?

> +
> +        unevaluatedProperties: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          DSI output port node to the panel or the next bridge
> +          in the chain
> +
> +required:
> +  - '#address-cells'
> +  - '#size-cells'
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interrupts
> +  - phy-names
> +  - phys
> +  - reg
> +  - samsung,burst-clock-frequency
> +  - samsung,esc-clock-frequency
> +  - samsung,pll-clock-frequency
> +
> +allOf:
> +  - $ref: ../dsi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos5433-mipi-dsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +
> +        clock-names:
> +          items:
> +            - const: bus_clk
> +            - const: phyclk_mipidphy0_bitclkdiv8
> +            - const: phyclk_mipidphy0_rxclkesc0
> +            - const: sclk_rgb_vclk_to_dsim0
> +            - const: sclk_mipi
> +
> +        ports:
> +          required:
> +            - port@0
> +
> +      required:
> +        - ports
> +        - vddcore-supply
> +        - vddio-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos5410-mipi-dsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: bus_clk
> +            - const: pll_clk
> +
> +      required:
> +        - vddcore-supply
> +        - vddio-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos4210-mipi-dsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: bus_clk
> +            - const: sclk_mipi
> +
> +      required:
> +        - vddcore-supply
> +        - vddio-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos3250-mipi-dsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: bus_clk
> +            - const: pll_clk
> +
> +      required:
> +        - vddcore-supply
> +        - vddio-supply
> +        - samsung,phy-type
> +
> +additionalProperties:
> +  type: object
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/exynos5433.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dsi@13900000 {
> +       compatible = "samsung,exynos5433-mipi-dsi";
> +       reg = <0x13900000 0xC0>;
> +       interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +       phys = <&mipi_phy 1>;
> +       phy-names = "dsim";
> +       clocks = <&cmu_disp CLK_PCLK_DSIM0>,
> +                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8>,
> +                <&cmu_disp CLK_PHYCLK_MIPIDPHY0_RXCLKESC0>,
> +                <&cmu_disp CLK_SCLK_RGB_VCLK_TO_DSIM0>,
> +                <&cmu_disp CLK_SCLK_DSIM0>;
> +       clock-names = "bus_clk",
> +                     "phyclk_mipidphy0_bitclkdiv8",
> +                     "phyclk_mipidphy0_rxclkesc0",
> +                     "sclk_rgb_vclk_to_dsim0",
> +                     "sclk_mipi";
> +       power-domains = <&pd_disp>;
> +       vddcore-supply = <&ldo6_reg>;
> +       vddio-supply = <&ldo7_reg>;
> +       samsung,burst-clock-frequency = <512000000>;
> +       samsung,esc-clock-frequency = <16000000>;
> +       samsung,pll-clock-frequency = <24000000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&te_irq>;
> +       status = "disabled";
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       panel@0 {
> +          compatible = "samsung,s6e3ha2";
> +          reg = <0>;
> +          vdd3-supply = <&ldo27_reg>;
> +          vci-supply = <&ldo28_reg>;
> +          reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
> +          enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +             reg = <0>;
> +
> +             dsi_to_mic: endpoint {
> +                remote-endpoint = <&mic_to_dsi>;
> +             };
> +          };
> +       };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> deleted file mode 100644
> index be377786e8cd..000000000000
> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -Exynos MIPI DSI Master
> -
> -Required properties:
> -  - compatible: value should be one of the following
> -		"samsung,exynos3250-mipi-dsi" /* for Exynos3250/3472 SoCs */
> -		"samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
> -		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
> -		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
> -		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
> -  - reg: physical base address and length of the registers set for the device
> -  - interrupts: should contain DSI interrupt
> -  - clocks: list of clock specifiers, must contain an entry for each required
> -    entry in clock-names
> -  - clock-names: should include "bus_clk"and "sclk_mipi" entries
> -		 the use of "pll_clk" is deprecated
> -  - phys: list of phy specifiers, must contain an entry for each required
> -    entry in phy-names
> -  - phy-names: should include "dsim" entry
> -  - vddcore-supply: MIPI DSIM Core voltage supply (e.g. 1.1V)
> -  - vddio-supply: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
> -  - samsung,pll-clock-frequency: specifies frequency of the oscillator clock
> -  - #address-cells, #size-cells: should be set respectively to <1> and <0>
> -    according to DSI host bindings (see MIPI DSI bindings [1])
> -  - samsung,burst-clock-frequency: specifies DSI frequency in high-speed burst
> -    mode
> -  - samsung,esc-clock-frequency: specifies DSI frequency in escape mode
> -
> -Optional properties:
> -  - power-domains: a phandle to DSIM power domain node
> -
> -Child nodes:
> -  Should contain DSI peripheral nodes (see MIPI DSI bindings [1]).
> -
> -Video interfaces:
> -  Device node can contain following video interface port nodes according to [2]:
> -  0: RGB input,
> -  1: DSI output
> -
> -[1]: Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> -[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -
> -	dsi@11c80000 {
> -		compatible = "samsung,exynos4210-mipi-dsi";
> -		reg = <0x11C80000 0x10000>;
> -		interrupts = <0 79 0>;
> -		clocks = <&clock 286>, <&clock 143>;
> -		clock-names = "bus_clk", "sclk_mipi";
> -		phys = <&mipi_phy 1>;
> -		phy-names = "dsim";
> -		vddcore-supply = <&vusb_reg>;
> -		vddio-supply = <&vmipi_reg>;
> -		power-domains = <&pd_lcd0>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		samsung,pll-clock-frequency = <24000000>;
> -
> -		panel@1 {
> -			reg = <0>;
> -			...
> -			port {
> -				panel_ep: endpoint {
> -					remote-endpoint = <&dsi_ep>;
> -				};
> -			};
> -		};
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -				decon_to_mic: endpoint {
> -					remote-endpoint = <&mic_to_decon>;
> -				};
> -			};
> -
> -			port@1 {
> -				reg = <1>;
> -				dsi_ep: endpoint {
> -					reg = <0>;
> -					samsung,burst-clock-frequency = <500000000>;
> -					samsung,esc-clock-frequency = <20000000>;
> -					remote-endpoint = <&panel_ep>;
> -				};
> -			};
> -		};
> -	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 733c2ebc0393..e571fc7792aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5873,6 +5873,7 @@ M:	Andrzej Hajda <a.hajda@samsung.com>
>  M:	Jagan Teki <jagan@amarulasolutions.com>
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>  F:	drivers/gpu/drm/bridge/samsung-dsim.c
>  
>  DRM DRIVER FOR SITRONIX ST7703 PANELS
> -- 
> 2.25.1
> 
> 
