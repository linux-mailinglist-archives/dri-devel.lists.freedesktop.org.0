Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1DE18BF70
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 19:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9F16EA59;
	Thu, 19 Mar 2020 18:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167B86EA59
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 18:34:03 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id e8so3171178ilc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 11:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uPWry8RY6+hi4eAi0Y1bb3DGJuUvwAMEt6jfhx00FwM=;
 b=k5rZvT0z/bWmEuUVqjQl6Ogr3qyvqRmjhpQWImsm1hauMkTuMsi6bubO/4iT/fCohO
 otAS40E3FYrspt+pVwdgMVbMzznfRlAms2tNIwX2/H9XWoY/He84v0tKheBzgVx0vNjh
 OmW6JghVzft+q/Nx4hBfoqITUVjfWQ3+IdC34JuE+yIwhBXuxv2ay7ziHH8qL5TG7Iwu
 Iv4f4sdoRxdxDtDXAKkyViNuOkXesnacU9WFXE9Pf312HpjoANQTw1hYiHDaT1Bn8r5Y
 OUXkw97rSxckGZgOSmLgL+cle4EnzCmai4GBycRavtRWIiD8moBrTRts0m8UfnfrC4TJ
 eqGg==
X-Gm-Message-State: ANhLgQ09F91ReUV3G33SgLTPm6HixGdPE4vb/Gt4XP/5gc2MUrPff+76
 9yS6krjCK2kjYcZ8PxQsVA==
X-Google-Smtp-Source: ADFU+vs1k4gpcdfKiMfAtAb7CaNrV8yNwy8ti//ggPn+OEJyJsCKN0w4f4f/ANYejiLSsUVzM5ackg==
X-Received: by 2002:a92:9149:: with SMTP id t70mr4864882ild.114.1584642842382; 
 Thu, 19 Mar 2020 11:34:02 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id z1sm1124712ilq.83.2020.03.19.11.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 11:34:01 -0700 (PDT)
Received: (nullmailer pid 24310 invoked by uid 1000);
 Thu, 19 Mar 2020 18:33:58 -0000
Date: Thu, 19 Mar 2020 12:33:58 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v13 4/6] dt-bindings: display: mediatek: convert the
 document format from txt to yaml
Message-ID: <20200319183358.GA17237@bogus>
References: <20200311071823.117899-1-jitao.shi@mediatek.com>
 <20200311071823.117899-5-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311071823.117899-5-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 03:18:21PM +0800, Jitao Shi wrote:
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dpi.txt         |  45 --------
>  .../display/mediatek/mediatek,dpi.yaml        | 103 ++++++++++++++++++
>  2 files changed, 103 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> deleted file mode 100644
> index 2dfb50a7321e..000000000000
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Mediatek DPI Device
> -===================
> -
> -The Mediatek DPI function block is a sink of the display subsystem and
> -provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -output bus.
> -
> -Required properties:
> -- compatible: "mediatek,<chip>-dpi"
> -  the supported chips are mt2701 , mt8173 and mt8183.
> -- reg: Physical base address and length of the controller's registers
> -- interrupts: The interrupt signal from the function block.
> -- clocks: device clocks
> -  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> -- clock-names: must contain "pixel", "engine", and "pll"
> -- port: Output port node with endpoint definitions as described in
> -  Documentation/devicetree/bindings/graph.txt. This port should be connected
> -  to the input port of an attached HDMI or LVDS encoder chip.
> -
> -Optional properties:
> -- pinctrl-names: Contain "default" and "sleep".
> -  pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
> -- pclk-sample: refer Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -
> -dpi0: dpi@1401d000 {
> -	compatible = "mediatek,mt8173-dpi";
> -	reg = <0 0x1401d000 0 0x1000>;
> -	interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> -	clocks = <&mmsys CLK_MM_DPI_PIXEL>,
> -		 <&mmsys CLK_MM_DPI_ENGINE>,
> -		 <&apmixedsys CLK_APMIXED_TVDPLL>;
> -	clock-names = "pixel", "engine", "pll";
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&dpi_pin_func>;
> -	pinctrl-1 = <&dpi_pin_idle>;
> -
> -	port {
> -		dpi0_out: endpoint {
> -			pclk-sample = <0>;
> -			remote-endpoint = <&hdmi0_in>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> new file mode 100644
> index 000000000000..d65543e3bf8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek DPI Controller Device Tree Bindings
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  The Mediatek DPI function block is a sink of the display subsystem and
> +  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> +  output bus.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-dpi
> +      - mediatek,mt8173-dpi
> +      - mediatek,mt8183-dpi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Pixel Clock
> +      - description: Engine Clock
> +      - description: DPI PLL
> +
> +  clock-names:
> +    items:
> +      - const: pixel
> +      - const: engine
> +      - const: pll
> +
> +  pinctrl-0: true
> +  pinctrl-1: true
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  port@0:
> +    type: object
> +    description:
> +      Output port node with endpoint definitions as described in
> +      Documentation/devicetree/bindings/graph.txt. This port should be connected
> +      to the input port of an attached HDMI or LVDS encoder chip.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          pclk-sample:
> +            items:
> +            - description: refer Documentation/devicetree/bindings/media/video-interfaces.txt.

This is not an array.

Just 'pclk-sample: true' if both values are allowed or 'const: 0|1' if 
only one value is allowed.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - port@0
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    dpi0: dpi@1401d000 {
> +        compatible = "mediatek,mt8173-dpi";
> +        reg = <0 0x1401d000 0 0x1000>;
> +        interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&mmsys CLK_MM_DPI_PIXEL>,
> +             <&mmsys CLK_MM_DPI_ENGINE>,
> +             <&apmixedsys CLK_APMIXED_TVDPLL>;
> +        clock-names = "pixel", "engine", "pll";
> +        pinctrl-names = "default", "sleep";
> +        pinctrl-0 = <&dpi_pin_func>;
> +        pinctrl-1 = <&dpi_pin_idle>;
> +
> +        port@0 {
> +            dpi0_out: endpoint {
> +                pclk-sample = <0>;
> +                remote-endpoint = <&hdmi0_in>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
