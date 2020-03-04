Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E60421794B7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 17:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A236E039;
	Wed,  4 Mar 2020 16:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EA16E039
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 16:15:39 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id r16so2625213oie.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 08:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G/m9Dnt93HLh8ZZeYopXZOgJzRYkBJrpgZdowTke/ZA=;
 b=SS3q8yW81QRq/l7tuxTCHetPpBaQeTc1h16nmWi81KvlDgFmhyWdHjLiiERUpKR3XA
 8qelH+4Xibh/AsoUq8APMwS3+dDZy5I6IoR0qWzGdFRjqGUBS4ikOdFiD6e2QB9lVw3z
 3xAgxcU2D+L8Y2FadyMttokUMSG72ccA0sWDJHXMZrnD7jL3aowbT/rbA2zvJcO+mrVh
 DZUv5lVVTjB7RWEScyBWoXZwhRn8BD5oi0vALAb9ZG6tpN6XuIKUyjDeB6MsqEAh4mhm
 kIN8aVyUy1/xH+3/hHoiQSLgdLiGRLZNcnTJs63cpGAh960O0wE0gtcLbCFbriE4+BOw
 77/w==
X-Gm-Message-State: ANhLgQ0/G31h/ZOpRML7i7exYGkOIuCqHl6JuNuc9SuGsFXAr1Rv7FrI
 +JXFJSXIXdPqLjFzPq4iQ0gZFtM=
X-Google-Smtp-Source: ADFU+vvQPKn3HTHYpHagUTruHe80jgRcAKAs1iIPLjepLVEiIsroKoDtfMT7OCsZXUt/LNxDyx47Yw==
X-Received: by 2002:aca:a9d4:: with SMTP id s203mr2347678oie.106.1583338538421; 
 Wed, 04 Mar 2020 08:15:38 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v65sm965478oib.17.2020.03.04.08.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 08:15:37 -0800 (PST)
Received: (nullmailer pid 26064 invoked by uid 1000);
 Wed, 04 Mar 2020 16:15:36 -0000
Date: Wed, 4 Mar 2020 10:15:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v12 4/6] dt-bindings: display: mediatek: convert the
 document format from txt to yaml
Message-ID: <20200304161536.GA20736@bogus>
References: <20200303052722.94795-1-jitao.shi@mediatek.com>
 <20200303052722.94795-5-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303052722.94795-5-jitao.shi@mediatek.com>
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

On Tue, Mar 03, 2020 at 01:27:20PM +0800, Jitao Shi wrote:
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dpi.txt         | 45 ---------
>  .../display/mediatek/mediatek,dpi.yaml        | 92 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml

You need to run 'make dt_binding_check' on this and fix the errors.

[...]

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> new file mode 100644
> index 000000000000..eb2b0cb5eb5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -0,0 +1,92 @@
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
> +  pinctrl-names:
> +    items:
> +      - const: default
> +      - const: sleep

Doesn't match what you just added to the binding...

> +
> +  port:
> +    type: object
> +    description:
> +      Output port node with endpoint definitions as described in
> +      Documentation/devicetree/bindings/graph.txt. This port should be connected
> +      to the input port of an attached HDMI or LVDS encoder chip.
> +
> +    properties:
> +      pclk-sample:
> +      description: refer Documentation/devicetree/bindings/media/video-interfaces.txt.

This is wrong in multiple ways. 'description' is missing indentation, so 
you are defining 'description' to be a property.

And 'pclk-sample' is not a property of 'port' node, but 'endpoint'.

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

Examples are built now and you need to add includes for these defines.

> +        clock-names = "pixel", "engine", "pll";
> +        pinctrl-names = "default", "sleep";
> +        pinctrl-0 = <&dpi_pin_func>;
> +        pinctrl-1 = <&dpi_pin_idle>;
> +
> +        port {
> +            reg = <0>;

Drop 'reg'.

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
