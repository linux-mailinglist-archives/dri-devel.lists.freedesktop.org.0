Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B531A87CD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 19:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B236E507;
	Tue, 14 Apr 2020 17:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A866E507
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 17:43:41 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id w12so446153otm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 10:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CRHsdXgHa+vlx10diMU/bK8sKF7Wucha61AmLhZ8R5U=;
 b=GpxFAbXkbQnsgLYcT8UxvTp5Io9//dua264BWgcHDC4x7+er6VyjobcZHrjkKlN0z2
 s39KQ2URrR7dx/+NB7C3jE1+D2iokDYJnoS0/+APcqMeirJqJjvHrbqXCY8L4bnVrs9c
 NTE+l+NVwh9cl3+29yGbsHtrqVS0DuytRXiVITZpB8un3YIzj7wXXRhx3Tn2kM+Gqb04
 6RZXwxkkuB0Fj/WVmcJewdQ+1M9+frym+hZP6lWhg59KSkBFjpNmEn43jqUNaaWOs5za
 fCm9yIv4TM+3AL+U45IspWBBf91VtDDccZWz2arHxKAqG5L1Zlp038pCmssPK80i6hav
 6yIw==
X-Gm-Message-State: AGi0PuYTYC7Lyf9dmdWkpPgHVhRJrl+0Bn8zS9H91FO03fDIf6KI1GlI
 yYkBOmIVwCVH5w0q/h16OA==
X-Google-Smtp-Source: APiQypK2V5U3/0zVRuO5nJ300D760b8P59trd/OCGqtKVr1uSq3uAqJnaCUmN0kI3wtf0QF9nN+o7Q==
X-Received: by 2002:a9d:aa7:: with SMTP id 36mr15848070otq.142.1586886220895; 
 Tue, 14 Apr 2020 10:43:40 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i7sm5707906otl.12.2020.04.14.10.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 10:43:40 -0700 (PDT)
Received: (nullmailer pid 9697 invoked by uid 1000);
 Tue, 14 Apr 2020 17:43:38 -0000
Date: Tue, 14 Apr 2020 12:43:38 -0500
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v14 2/3] dt-bindings: display: mediatek: convert the
 document format from txt to yaml
Message-ID: <20200414174338.GA6322@bogus>
References: <20200403080350.95826-1-jitao.shi@mediatek.com>
 <20200403080350.95826-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403080350.95826-3-jitao.shi@mediatek.com>
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

On Fri, Apr 03, 2020 at 04:03:49PM +0800, Jitao Shi wrote:
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dpi.txt         | 42 --------
>  .../display/mediatek/mediatek,dpi.yaml        | 97 +++++++++++++++++++
>  2 files changed, 97 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> deleted file mode 100644
> index 77def4456706..000000000000
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
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
> -			remote-endpoint = <&hdmi0_in>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> new file mode 100644
> index 000000000000..effdaa96aec3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -0,0 +1,97 @@
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

Should be 'port'. No 'reg' property, so no unit-address.

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
