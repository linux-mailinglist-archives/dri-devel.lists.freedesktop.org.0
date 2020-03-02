Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76F176848
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 00:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE54E6E183;
	Mon,  2 Mar 2020 23:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080BF6E183
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 23:37:21 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id j16so1198145otl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 15:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yFtkRGnfBiqCKQ/AHJ5vc+ttuYQAJORgEqP2QzLRI4E=;
 b=Ii05Ivn/JfgDjn5yuIzLQ13nOLjG7VOlmqgshq59wYdpshbvNn3ZsexShLQ5FukZWR
 wAvzy/gFg80JWDaN0yDttU68zZl9CxeefNsSfgaHksyvLPSQ23SBTOqzbitj2gzc8kk6
 EclinK0j1wVnAtxdfqnD+u6YAurrdqyG/f2OdSV31Go+quMP8wyA2Eq2Txy2dT54U5ep
 d3h1J7+OG7HmbDLN3zN7RPpdj7sMXEIxKQ1q+rLjS9fCUyayXDVWrbV1XREM9rIU5qMg
 fvUqixAEjH9Js3DyUPj2lBeWyq6i2BdWeAbwT7CXd8i8oWaLkaZeF6bTfp1rPlbb0LiZ
 0kPg==
X-Gm-Message-State: ANhLgQ1W+Ox0kiryo5m4BAH/9trOluM0SODhj5YBuyjmufInzuWoUd5o
 NJTKkMU+ZqwcXBYm5TWf/w==
X-Google-Smtp-Source: ADFU+vt6ffPV7eEC+tPPHGqHxdSzbQJgCj5vAUVFRez1j/cR9fGNitZz5dMCB0NLTh45Ua8HyFRokQ==
X-Received: by 2002:a9d:638f:: with SMTP id w15mr1297268otk.239.1583192240162; 
 Mon, 02 Mar 2020 15:37:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r205sm6920647oih.54.2020.03.02.15.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 15:37:19 -0800 (PST)
Received: (nullmailer pid 16189 invoked by uid 1000);
 Mon, 02 Mar 2020 23:37:18 -0000
Date: Mon, 2 Mar 2020 17:37:18 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v11 4/6] dt-bindings: display: mediatek: convert the
 document format from txt to yaml
Message-ID: <20200302233718.GA5639@bogus>
References: <20200228081441.88179-1-jitao.shi@mediatek.com>
 <20200228081441.88179-5-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228081441.88179-5-jitao.shi@mediatek.com>
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

On Fri, Feb 28, 2020 at 04:14:39PM +0800, Jitao Shi wrote:
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dpi.txt         |  45 --------
>  .../display/mediatek/mediatek,dpi.yaml        | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> deleted file mode 100644
> index 4eeead1d39db..000000000000
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
> -- pinctrl-names: Contain "gpiomode" and "dpimode".
> -  pinctrl-names see Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
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
> -	pinctrl-names = "active", "idle";
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
> index 000000000000..9878e9f2b12e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek,dpi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: mediatek DPI Controller Device Tree Bindings
> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Rob Herring <robh+dt@kernel.org>
> +  - Mark Rutland <mark.rutland@arm.com>

Should be the owner of this device/driver, not Mark or me.

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
> +	description: Physical base address and length of the controller's registers

Drop, that's every 'reg'. Plus there's an error in indentation.

> +
> +  interrupts:
> +    maxItems: 1
> +	description: The interrupt signal from the function block.

Drop 'description'.

> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3

Drop minItems/maxItems. Redundant with the items list.

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
> +  pinctrl-names:
> +    description: pinctrl-names refe Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

Drop.

> +    minItems: 2
> +    maxItems: 2

Drop.

> +    items:
> +      - const: active
> +      - const: idle

See my comment on patch 2 of v9.

> +
> +  port:
> +    type: object
> +    description:
> +      Output port node with endpoint definitions as described in
> +      Documentation/devicetree/bindings/graph.txt. This port should be connected
> +      to the input port of an attached HDMI or LVDS encoder chip.
> +
> +  pclk-sample:
> +    description: refer Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    maxItems: 1

Not an array, so maxItems isn't right. If there's no constraints on the 
values, then just drop maxItems.

This also in the wrong place. It has to be under port and endpoint.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dpi0: dpi@1401d000 {
> +        compatible = "mediatek,mt8173-dpi";
> +        reg = <0 0x1401d000 0 0x1000>;
> +        interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&mmsys CLK_MM_DPI_PIXEL>,
> +             <&mmsys CLK_MM_DPI_ENGINE>,
> +             <&apmixedsys CLK_APMIXED_TVDPLL>;
> +        clock-names = "pixel", "engine", "pll";
> +        pinctrl-names = "active", "idle";
> +        pinctrl-0 = <&dpi_pin_func>;
> +        pinctrl-1 = <&dpi_pin_idle>;
> +
> +        port {
> +			reg = <0>;

Wrong indentation.

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
