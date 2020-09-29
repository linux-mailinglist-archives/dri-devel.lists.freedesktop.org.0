Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E26327D56F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 20:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C174A89CDB;
	Tue, 29 Sep 2020 18:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8311F89CDB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 18:08:17 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id 185so6450131oie.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 11:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sU+G8HZjDOP5MRdUHbCt+p6p/tXjsZfEXILLEXLTGKk=;
 b=fbgze4IzF2+dCdsiNRnXAmsWFNV5FDr3qxiVz5CE3ojVI87+bKWejmG4rcZSjUp13G
 aLsqFNyA5SvJiHE4YbdUTgrJ0lUOaV3sYoimIfaPV0mm7dIafU+a3nOzKsf6mT9R2jUn
 5wZrfuyND3WivprPQfyFCIxLvBY+STbokIIfg4+9mamNYA+JDsQMlsrr1/9U4gZ3Towj
 ecV1mLaFBGv0sGWCPuOLnwvmyMLGzgxwmJYmO+UJg0nHhpnn1zTEU9cSYpMxoXxb9buK
 WohWvuXTvU4oP+a+Na2om4glTwY7InFhVsjmI97Wrf7CYj6zpJdKw2AXzU+LHrBJFwfd
 nZ4A==
X-Gm-Message-State: AOAM531vmtzj5uWskaGXqlor7DWv6WeeuyXl2CSxBPN3wgDBQu5AAMCT
 PY6kKKYdhYinDNy2c0Zc5g==
X-Google-Smtp-Source: ABdhPJz56B8S1F50AdUm8skiSUxwaNOgLIFcS5ICv5Jn5u0GiuSyXnNAj4hFIR8xLsNWCl8z8U7x2g==
X-Received: by 2002:aca:f5cb:: with SMTP id t194mr3210736oih.144.1601402896731; 
 Tue, 29 Sep 2020 11:08:16 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v20sm1150556oiv.47.2020.09.29.11.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 11:08:16 -0700 (PDT)
Received: (nullmailer pid 882710 invoked by uid 1000);
 Tue, 29 Sep 2020 18:08:15 -0000
Date: Tue, 29 Sep 2020 13:08:15 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: convert phy-mtk-xsphy.txt to YAML
 schema
Message-ID: <20200929180815.GA865690@bogus>
References: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 03:55:05PM +0800, Chunfeng Yun wrote:
> Convert phy-mtk-xsphy.txt to YAML schema mediatek,xsphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../bindings/phy/mediatek,xsphy.yaml          | 203 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-xsphy.txt | 109 ----------
>  2 files changed, 203 insertions(+), 109 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> new file mode 100644
> index 000000000000..0aaa10640b5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -0,0 +1,203 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek XS-PHY Controller Device Tree Bindings
> +
> +maintainers:
> +  - Chunfeng Yun <chunfeng.yun@mediatek.com>
> +
> +description: |
> +  The XS-PHY controller supports physical layer functionality for USB3.1
> +  GEN2 controller on MediaTek SoCs.
> +
> +properties:
> +  $nodename:
> +    pattern: "^xs-phy@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt3611-xsphy
> +          - enum:
> +              - mediatek,xsphy
> +      - items:
> +          - const: mediatek,xsphy

mediatek,xsphy alone should not be valid.

> +
> +  reg:
> +    description: |
> +      Register shared by multiple U3 ports, exclude port's private register,
> +      if only U2 ports provided, shouldn't use the property.
> +    maxItems: 1
> +
> +  "#address-cells":
> +      enum: [1, 2]
> +
> +  "#size-cells":
> +      enum: [1, 2]
> +
> +  ranges: true
> +
> +  mediatek,src-ref-clk-mhz:
> +    description:
> +      Frequency of reference clock for slew rate calibrate
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 26
> +
> +  mediatek,src-coef:
> +    description:
> +      Coefficient for slew rate calibrate, depends on SoC process
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 17
> +
> +# Required child node:
> +patternProperties:
> +  "^usb-phy@[0-9a-f]+$":
> +    type: object
> +    description: |
> +      A sub-node is required for each port the controller provides.
> +      Address range information including the usual 'reg' property
> +      is used inside these nodes to describe the controller's topology.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      clocks:
> +        items:
> +          - description: Reference clock, (HS is 48Mhz, SS/P is 24~27Mhz)
> +
> +      clock-names:
> +        items:
> +          - const: ref
> +
> +      "#phy-cells":
> +        const: 1
> +        description: |
> +          The cells contain the following arguments.
> +
> +          - description: The PHY type
> +              enum:
> +                - PHY_TYPE_USB2
> +                - PHY_TYPE_USB3
> +
> +      #The following optional vendor properties are only for debug or HQA test
> +      mediatek,eye-src:
> +        description:
> +          The value of slew rate calibrate (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 7
> +
> +      mediatek,eye-vrt:
> +        description:
> +          The selection of VRT reference voltage (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 7
> +
> +      mediatek,eye-term:
> +        description:
> +          The selection of HS_TX TERM reference voltage (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 7
> +
> +      mediatek,efuse-intr:
> +        description:
> +          The selection of Internal Resistor (U2/U3 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 63
> +
> +      mediatek,efuse-tx-imp:
> +        description:
> +          The selection of TX Impedance (U3 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 31
> +
> +      mediatek,efuse-rx-imp:
> +        description:
> +          The selection of RX Impedance (U3 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 31
> +
> +    required:
> +      - reg
> +      - clocks
> +      - clock-names
> +      - "#phy-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +#Banks layout of xsphy
> +#-------------------------------------------------------------

Move this to top-level 'description'.

> +#port        offset    bank
> +#u2 port0    0x0000    MISC
> +#            0x0100    FMREG
> +#            0x0300    U2PHY_COM
> +#u2 port1    0x1000    MISC
> +#            0x1100    FMREG
> +#            0x1300    U2PHY_COM
> +#u2 port2    0x2000    MISC
> +#            ...
> +#u31 common  0x3000    DIG_GLB
> +#            0x3100    PHYA_GLB
> +#u31 port0   0x3400    DIG_LN_TOP
> +#            0x3500    DIG_LN_TX0
> +#            0x3600    DIG_LN_RX0
> +#            0x3700    DIG_LN_DAIF
> +#            0x3800    PHYA_LN
> +#u31 port1   0x3a00    DIG_LN_TOP
> +#            0x3b00    DIG_LN_TX0
> +#            0x3c00    DIG_LN_RX0
> +#            0x3d00    DIG_LN_DAIF
> +#            0x3e00    PHYA_LN
> +#            ...
> +#DIG_GLB & PHYA_GLB are shared by U31 ports.
> +
> +examples:
> +  - |
> +    #include <dt-bindings/phy/phy.h>
> +
> +    u3phy: xs-phy@11c40000 {
> +        compatible = "mediatek,mt3611-xsphy", "mediatek,xsphy";
> +        reg = <0x11c43000 0x0200>;
> +        mediatek,src-ref-clk-mhz = <26>;
> +        mediatek,src-coef = <17>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        u2port0: usb-phy@11c40000 {
> +            reg = <0x11c40000 0x0400>;
> +            clocks = <&clk48m>;
> +            clock-names = "ref";
> +            mediatek,eye-src = <4>;
> +            #phy-cells = <1>;
> +        };
> +
> +        u3port0: usb-phy@11c43000 {
> +            reg = <0x11c43400 0x0500>;
> +            clocks = <&clk26m>;
> +            clock-names = "ref";
> +            mediatek,efuse-intr = <28>;
> +            #phy-cells = <1>;
> +        };
> +    };
> +
> +...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
