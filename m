Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B67013C9421
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 00:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62AF8944A;
	Wed, 14 Jul 2021 22:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903A38944A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 22:59:12 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id z11so4229692iow.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 15:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KbmmvJeOdCwoGDuIj5l12VzKcZvZF1mWFuwkSqXYzIU=;
 b=jtuPwqqM+B3sjnSzxHmphZ8HgccOE8+BxJMKRzlM2Qezzy1PZlRfruywPZavFJg80f
 078TnQsN2UmrKv0SxKi5K1mb4XnYdOyyAXfffivxf7TOFlC195JIr7fMJN3B6SwZpM1g
 /j4xuftLzeog3aoKCMgwsXUONrl/tUvfDSuz4hf46B0+8PA1JMq3Yh0TkW1SSIx/bT/r
 nScdINpkHJXCwr39k/CDTc9VMvYH0Mfh+NwSmaY7Wf99EvID/pw/kqy32pXYCRuFdzUc
 RNK7ePVM9Dvk2XvtneuZR946wag0b0Wt+ht1xMuE7pGFRHi3z+63YNdvR94G94UnCtaJ
 f32A==
X-Gm-Message-State: AOAM531GL3g7z4VKqHBTOLQ4HYoP0LS3nNw142udErDakEgUKWmc/9rr
 6ekWf4iGmwkJG/eEADxMBw==
X-Google-Smtp-Source: ABdhPJwwXy+4iyS+HLc4HV+QnkK5rCaaq570TtPqkCjQuhoTLFUejfe6LH7FZkoFaPiq9IW/aXVh9A==
X-Received: by 2002:a05:6602:2285:: with SMTP id
 d5mr391182iod.24.1626303552011; 
 Wed, 14 Jul 2021 15:59:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id g15sm744716ild.29.2021.07.14.15.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 15:59:11 -0700 (PDT)
Received: (nullmailer pid 3697302 invoked by uid 1000);
 Wed, 14 Jul 2021 22:59:08 -0000
Date: Wed, 14 Jul 2021 16:59:08 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 12/17] dt-bindings: display: bridge:
 samsung,mipi-dsim: Add i.MX8MM support
Message-ID: <20210714225908.GA3694990@robh.at.kernel.org>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-13-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704090230.26489-13-jagan@amarulasolutions.com>
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

On Sun, Jul 04, 2021 at 02:32:25PM +0530, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.
> 
> Add dt-bingings for it.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 84 ++++++++++++++++++-
>  1 file changed, 83 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> index b2970734ffd7..bd12d5706291 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> @@ -26,6 +26,7 @@ properties:
>        - samsung,exynos5410-mipi-dsi
>        - samsung,exynos5422-mipi-dsi
>        - samsung,exynos5433-mipi-dsi
> +      - fsl,imx8mm-mipi-dsim
>  
>    reg:
>      maxItems: 1
> @@ -39,6 +40,10 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true
> +  assigned-clocks: true

You don't need these. They are always allowed if 'clocks' is present.

> +
>    clocks:
>      minItems: 2
>      maxItems: 5
> @@ -102,7 +107,7 @@ properties:
>          properties:
>            endpoint@0:
>              $ref: /schemas/graph.yaml#/properties/endpoint
> -            description: sub-node describing the input from MIC
> +            description: sub-node describing the input from MIC or LCDIF
>  
>          unevaluatedProperties: false
>  
> @@ -128,6 +133,30 @@ required:
>  
>  allOf:
>    - $ref: ../dsi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mm-mipi-dsim
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
> +        ports:
> +          required:
> +            - port@0
> +            - port@1
> +
> +      required:
> +        - ports
> +
>    - if:
>        properties:
>          compatible:
> @@ -221,6 +250,59 @@ additionalProperties:
>    type: object
>  
>  examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +    #include <dt-bindings/power/imx8mm-power.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dsi@32e10000 {
> +       compatible = "fsl,imx8mm-mipi-dsim";
> +       reg = <0x32e10000 0x400>;
> +       clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +                <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +       clock-names = "bus_clk", "sclk_mipi";
> +       assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +                         <&clk IMX8MM_VIDEO_PLL1_OUT>,
> +                         <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +       assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> +                         <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> +                         <&clk IMX8MM_VIDEO_PLL1_OUT>;
> +       assigned-clock-rates = <266000000>, <594000000>, <27000000>;
> +       interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +       phys = <&mipi_phy 0>;
> +       phy-names = "dsim";
> +       power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DSI>;
> +       samsung,burst-clock-frequency = <891000000>;
> +       samsung,esc-clock-frequency = <54000000>;
> +       samsung,pll-clock-frequency = <27000000>;
> +       status = "disabled";
> +
> +       ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +             reg = <0>;
> +             #address-cells = <1>;
> +             #size-cells = <0>;
> +
> +             dsi_in_lcdif: endpoint@0 {
> +                reg = <0>;
> +                remote-endpoint = <&lcdif_out_dsi>;
> +             };
> +          };
> +
> +          port@1 {
> +             reg = <1>;
> +
> +             dsi_out_panel: endpoint {
> +                remote-endpoint = <&panel_in_dsi>;
> +             };
> +          };
> +       };
> +    };
> +
>    - |
>      #include <dt-bindings/clock/exynos5433.h>
>      #include <dt-bindings/gpio/gpio.h>
> -- 
> 2.25.1
> 
> 
