Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD4F1CE88C
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAD56E7D7;
	Mon, 11 May 2020 22:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491C96E7D7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 22:54:39 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id v17so1045346ote.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 15:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VizB9d53gOC/+qH9umA+7PsvczjrwT1z7CX57CjiKQc=;
 b=jHQaxyigU4GNoc2mIoRo+WtkIIJnX9640EsCl4FHoHYx+T1N+JANwnAcYg9jBvzoy+
 6oOvk+pE/r/R7A2umZ4hUq+sD+smsAddZMHPxX12Nf/6c+lldidT8y+e2D0DF/pqg95T
 0gWVJsaxctTJovjdxZU2i4nJ8eFxOAU+t6p0E0/RWSAt9q6MW4HUCG7tjX/fwDTAe2ah
 1pB69Ob17sUSf1R63YcdEDwfeZk5Y6Idpou0WGjSRvstO3yG+TmGYBDEAXDWWmvoTWya
 q+s2n0APFoWdmqJ9mghA6DNIur7FG0kYEFfePiS2RdNumZDCrm3HuWKDPc+RUtkJsuRZ
 6kxQ==
X-Gm-Message-State: AGi0PuZZXo4OFogfaQg78g1Da0AU93lwYlRXMAkxCh67HUvZ5X+qgkLI
 5yufS6y5i+xxHhFTE/6BmW0OWJE=
X-Google-Smtp-Source: APiQypKKLnsY+mi3s4XrlLCTUB04SAu7Bg8dIg/BXtQfuHvj8J8ILkc+35vvNiJCe8R8pqScwHrcDw==
X-Received: by 2002:a9d:6d15:: with SMTP id o21mr14268200otp.184.1589237678420; 
 Mon, 11 May 2020 15:54:38 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l89sm2479578otc.32.2020.05.11.15.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 15:54:37 -0700 (PDT)
Received: (nullmailer pid 2250 invoked by uid 1000);
 Mon, 11 May 2020 22:54:36 -0000
Date: Mon, 11 May 2020 17:54:36 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 4/8] dt-bindings: memory: Convert ingenic, jz4780-nemc.txt
 to YAML
Message-ID: <20200511225436.GB19685@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-4-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 26, 2020 at 08:58:52PM +0200, Paul Cercueil wrote:
> Convert the ingenic,jz4780-nemc.txt doc file to ingenic,nemc.yaml.
> 
> The ingenic,jz4725b-nemc compatible string was added in the process,
> with a fallback to ingenic,jz4740-nemc.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../ingenic,jz4780-nemc.txt                   | 76 ---------------
>  .../ingenic,nemc-client.yaml                  | 45 +++++++++
>  .../memory-controllers/ingenic,nemc.yaml      | 95 +++++++++++++++++++
>  3 files changed, 140 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-client.yaml
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt b/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
> deleted file mode 100644
> index 59b8dcc118ee..000000000000
> --- a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -* Ingenic JZ4780 NAND/external memory controller (NEMC)
> -
> -This file documents the device tree bindings for the NEMC external memory
> -controller in Ingenic JZ4780
> -
> -Required properties:
> -- compatible: Should be set to one of:
> -    "ingenic,jz4740-nemc" (JZ4740)
> -    "ingenic,jz4780-nemc" (JZ4780)
> -- reg: Should specify the NEMC controller registers location and length.
> -- clocks: Clock for the NEMC controller.
> -- #address-cells: Must be set to 2.
> -- #size-cells: Must be set to 1.
> -- ranges: A set of ranges for each bank describing the physical memory layout.
> -  Each should specify the following 4 integer values:
> -
> -    <cs number> 0 <physical address of mapping> <size of mapping>
> -
> -Each child of the NEMC node describes a device connected to the NEMC.
> -
> -Required child node properties:
> -- reg: Should contain at least one register specifier, given in the following
> -  format:
> -
> -    <cs number> <offset> <size>
> -
> -  Multiple registers can be specified across multiple banks. This is needed,
> -  for example, for packaged NAND devices with multiple dies. Such devices
> -  should be grouped into a single node.
> -
> -Optional child node properties:
> -- ingenic,nemc-bus-width: Specifies the bus width in bits. Defaults to 8 bits.
> -- ingenic,nemc-tAS: Address setup time in nanoseconds.
> -- ingenic,nemc-tAH: Address hold time in nanoseconds.
> -- ingenic,nemc-tBP: Burst pitch time in nanoseconds.
> -- ingenic,nemc-tAW: Access wait time in nanoseconds.
> -- ingenic,nemc-tSTRV: Static memory recovery time in nanoseconds.
> -
> -If a child node references multiple banks in its "reg" property, the same value
> -for all optional parameters will be configured for all banks. If any optional
> -parameters are omitted, they will be left unchanged from whatever they are
> -configured to when the NEMC device is probed (which may be the reset value as
> -given in the hardware reference manual, or a value configured by the boot
> -loader).
> -
> -Example (NEMC node with a NAND child device attached at CS1):
> -
> -nemc: nemc@13410000 {
> -	compatible = "ingenic,jz4780-nemc";
> -	reg = <0x13410000 0x10000>;
> -
> -	#address-cells = <2>;
> -	#size-cells = <1>;
> -
> -	ranges = <1 0 0x1b000000 0x1000000
> -		  2 0 0x1a000000 0x1000000
> -		  3 0 0x19000000 0x1000000
> -		  4 0 0x18000000 0x1000000
> -		  5 0 0x17000000 0x1000000
> -		  6 0 0x16000000 0x1000000>;
> -
> -	clocks = <&cgu JZ4780_CLK_NEMC>;
> -
> -	nand: nand@1 {
> -		compatible = "ingenic,jz4780-nand";
> -		reg = <1 0 0x1000000>;
> -
> -		ingenic,nemc-tAS = <10>;
> -		ingenic,nemc-tAH = <5>;
> -		ingenic,nemc-tBP = <10>;
> -		ingenic,nemc-tAW = <15>;
> -		ingenic,nemc-tSTRV = <100>;
> -
> -		...
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-client.yaml b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-client.yaml
> new file mode 100644
> index 000000000000..682e6f7e74fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-client.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc-client.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title:
> +  Ingenic SoCs NAND / External Memory Controller (NEMC)
> +  client-specific properties
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +description:
> +  This document lists the various properties that child nodes of the NEMC node
> +  can use.
> +
> +properties:

What about 'reg'? That should be required.

> +  ingenic,nemc-bus-width:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [8, 16]
> +    description: Specifies the bus width in bits.
> +
> +  ingenic,nemc-tAS:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Address setup time in nanoseconds.
> +
> +  ingenic,nemc-tAH:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Address hold time in nanoseconds.
> +
> +  ingenic,nemc-tBP:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Burst pitch time in nanoseconds.
> +
> +  ingenic,nemc-tAW:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Address wait time in nanoseconds.
> +
> +  ingenic,nemc-tSTRV:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Static memory recovery time in nanoseconds.

I think I'd just combine this into 1 file.

> +
> +...
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
> new file mode 100644
> index 000000000000..c7fd28462fd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs NAND / External Memory Controller (NEMC) devicetree bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  $nodename:
> +    pattern: "^memory-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - ingenic,jz4740-nemc
> +        - ingenic,jz4780-nemc
> +      - items:
> +        - const: ingenic,jz4725b-nemc
> +        - const: ingenic,jz4740-nemc
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^(nand-controller|ethernet)@[0-9]+$":

Presumably you could have other types of child nodes?

> +    type: object
> +    allOf:
> +      - $ref: ingenic,nemc-client.yaml#
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    nemc: memory-controller@13410000 {
> +      compatible = "ingenic,jz4780-nemc";
> +      reg = <0x13410000 0x10000>;
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +      ranges = <1 0 0x1b000000 0x1000000>,
> +         <2 0 0x1a000000 0x1000000>,
> +         <3 0 0x19000000 0x1000000>,
> +         <4 0 0x18000000 0x1000000>,
> +         <5 0 0x17000000 0x1000000>,
> +         <6 0 0x16000000 0x1000000>;
> +
> +      clocks = <&cgu JZ4780_CLK_NEMC>;
> +
> +      ethernet@6 {
> +        compatible = "davicom,dm9000";
> +        davicom,no-eeprom;
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pins_nemc_cs6>;
> +
> +        reg = <6 0 1>, /* addr */
> +              <6 2 1>; /* data */
> +
> +        ingenic,nemc-tAS = <15>;
> +        ingenic,nemc-tAH = <10>;
> +        ingenic,nemc-tBP = <20>;
> +        ingenic,nemc-tAW = <50>;
> +        ingenic,nemc-tSTRV = <100>;
> +
> +        reset-gpios = <&gpf 12 GPIO_ACTIVE_HIGH>;
> +        vcc-supply = <&eth0_power>;
> +
> +        interrupt-parent = <&gpe>;
> +        interrupts = <19 4>;
> +      };
> +    };
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
