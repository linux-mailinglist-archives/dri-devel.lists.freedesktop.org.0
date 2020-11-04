Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2232A6D92
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 20:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FA56E235;
	Wed,  4 Nov 2020 19:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC1E6E235
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 19:11:23 +0000 (UTC)
Received: by mail-oo1-f65.google.com with SMTP id j6so5344978oot.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 11:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kUkrGaIC+6uDuIfeuIQSYAIatv4vnLAo8WozxbkcPyg=;
 b=iiA+3L0H2eccpRAeXW3/BWu0gACBy1aiBIEJzeE9VPa+3owEOkHHpdt0W+rMcvpQc9
 csWmXdVh9/HFT2iXYBY7g0FrnnYwZOIUFDJBJC6MOTgIcZ4LNCJBlM1C/rT/TRLCJRNZ
 J2mmdPyhxFLdX9/9+3y54FwJdBdnBsq/hHW/RZ3xI9/Q8poTKLFaxkAbs6Dm6+uVBznZ
 0YpsU8aWBlhL9cX6mYgChB1Jh93oEZQPDmaSZNUCx7zefn2LCXb55bB4K1FjUeff57w3
 +p1v+gD64xY9II4mN1/9zkdhSV+Fp/IUsX2FR+ayMAx0OUZpfdiV7T9jo0uwZhLkMAoX
 id7Q==
X-Gm-Message-State: AOAM532892EQn6R7TJr/0cExeR6z0h74L96sftiO+eTjC7x3MeJqmIYO
 Ds93UzyLCjXWsFE0TMTeIw==
X-Google-Smtp-Source: ABdhPJwFpwgersXSX2VXXaLS/A62lNSk2a3yZJe/Z7StU7lSSV+EQ+vj3vr9ZP1nuOtuWwdQH2P4Lg==
X-Received: by 2002:a4a:b601:: with SMTP id z1mr19874936oon.83.1604517082404; 
 Wed, 04 Nov 2020 11:11:22 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h3sm722686oom.18.2020.11.04.11.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 11:11:21 -0800 (PST)
Received: (nullmailer pid 3966731 invoked by uid 1000);
 Wed, 04 Nov 2020 19:11:21 -0000
Date: Wed, 4 Nov 2020 13:11:21 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: mcde: Convert to YAML schema
Message-ID: <20201104191121.GC3959462@bogus>
References: <20201104133709.1373147-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104133709.1373147-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 02:37:09PM +0100, Linus Walleij wrote:
> This moves the MCDE bindings over to using the YAML schema
> to describe the ST-Ericsson MCDE display controller,
> making use of the generic DSI controller schema.
> 
> We also add the "port" node, we will use this when adding
> LCD panels using the direct parallel interface DPI instead
> of DSI.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/display/ste,mcde.txt  | 104 -----------
>  .../devicetree/bindings/display/ste,mcde.yaml | 167 ++++++++++++++++++
>  2 files changed, 167 insertions(+), 104 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ste,mcde.txt
>  create mode 100644 Documentation/devicetree/bindings/display/ste,mcde.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ste,mcde.txt b/Documentation/devicetree/bindings/display/ste,mcde.txt
> deleted file mode 100644
> index 4c33c692bd5f..000000000000
> --- a/Documentation/devicetree/bindings/display/ste,mcde.txt
> +++ /dev/null
> @@ -1,104 +0,0 @@
> -ST-Ericsson Multi Channel Display Engine MCDE
> -
> -The ST-Ericsson MCDE is a display controller with support for compositing
> -and displaying several channels memory resident graphics data on DSI or
> -LCD displays or bridges. It is used in the ST-Ericsson U8500 platform.
> -
> -Required properties:
> -
> -- compatible: must be:
> -  "ste,mcde"
> -- reg: register base for the main MCDE control registers, should be
> -  0x1000 in size
> -- interrupts: the interrupt line for the MCDE
> -- epod-supply: a phandle to the EPOD regulator
> -- vana-supply: a phandle to the analog voltage regulator
> -- clocks: an array of the MCDE clocks in this strict order:
> -  MCDECLK (main MCDE clock), LCDCLK (LCD clock), PLLDSI
> -  (HDMI clock), DSI0ESCLK (DSI0 energy save clock),
> -  DSI1ESCLK (DSI1 energy save clock), DSI2ESCLK (DSI2 energy
> -  save clock)
> -- clock-names: must be the following array:
> -  "mcde", "lcd", "hdmi"
> -  to match the required clock inputs above.
> -- #address-cells: should be <1> (for the DSI hosts that will be children)
> -- #size-cells: should be <1> (for the DSI hosts that will be children)
> -- ranges: this should always be stated
> -
> -Required subnodes:
> -
> -The devicetree must specify subnodes for the DSI host adapters.
> -These must have the following characteristics:
> -
> -- compatible: must be:
> -  "ste,mcde-dsi"
> -- reg: must specify the register range for the DSI host
> -- vana-supply: phandle to the VANA voltage regulator
> -- clocks: phandles to the high speed and low power (energy save) clocks
> -  the high speed clock is not present on the third (dsi2) block, so it
> -  should only have the "lp" clock
> -- clock-names: "hs" for the high speed clock and "lp" for the low power
> -  (energy save) clock
> -- #address-cells: should be <1>
> -- #size-cells: should be <0>
> -
> -Display panels and bridges will appear as children on the DSI hosts, and
> -the displays are connected to the DSI hosts using the common binding
> -for video transmitter interfaces; see
> -Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -If a DSI host is unused (not connected) it will have no children defined.
> -
> -Example:
> -
> -mcde@a0350000 {
> -	compatible = "ste,mcde";
> -	reg = <0xa0350000 0x1000>;
> -	interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> -	epod-supply = <&db8500_b2r2_mcde_reg>;
> -	vana-supply = <&ab8500_ldo_ana_reg>;
> -	clocks = <&prcmu_clk PRCMU_MCDECLK>, /* Main MCDE clock */
> -		 <&prcmu_clk PRCMU_LCDCLK>, /* LCD clock */
> -		 <&prcmu_clk PRCMU_PLLDSI>; /* HDMI clock */
> -	clock-names = "mcde", "lcd", "hdmi";
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	ranges;
> -
> -	dsi0: dsi@a0351000 {
> -		compatible = "ste,mcde-dsi";
> -		reg = <0xa0351000 0x1000>;
> -		vana-supply = <&ab8500_ldo_ana_reg>;
> -		clocks = <&prcmu_clk PRCMU_DSI0CLK>, <&prcmu_clk PRCMU_DSI0ESCCLK>;
> -		clock-names = "hs", "lp";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		panel {
> -			compatible = "samsung,s6d16d0";
> -			reg = <0>;
> -			vdd1-supply = <&ab8500_ldo_aux1_reg>;
> -			reset-gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
> -		};
> -
> -	};
> -	dsi1: dsi@a0352000 {
> -		compatible = "ste,mcde-dsi";
> -		reg = <0xa0352000 0x1000>;
> -		vana-supply = <&ab8500_ldo_ana_reg>;
> -		clocks = <&prcmu_clk PRCMU_DSI1CLK>, <&prcmu_clk PRCMU_DSI1ESCCLK>;
> -		clock-names = "hs", "lp";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> -	dsi2: dsi@a0353000 {
> -		compatible = "ste,mcde-dsi";
> -		reg = <0xa0353000 0x1000>;
> -		vana-supply = <&ab8500_ldo_ana_reg>;
> -		/* This DSI port only has the Low Power / Energy Save clock */
> -		clocks = <&prcmu_clk PRCMU_DSI2ESCCLK>;
> -		clock-names = "lp";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/ste,mcde.yaml b/Documentation/devicetree/bindings/display/ste,mcde.yaml
> new file mode 100644
> index 000000000000..a00333acd9a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ste,mcde.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ste,mcde.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST-Ericsson Multi Channel Display Engine MCDE
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: ste,mcde
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: the interrupt line for the MCDE

Kind of generic description. Can drop.

> +
> +  clocks:
> +    maxItems: 3

Can drop this. Implied with 'items'.

> +    description: an array of the MCDE clocks
> +    items:
> +      - description: MCDECLK (main MCDE clock)
> +      - description: LCDCLK (LCD clock)
> +      - description: PLLDSI (HDMI clock)
> +
> +  clock-names:
> +    maxItems: 3

ditto

> +    items:
> +      - const: mcde
> +      - const: lcd
> +      - const: hdmi
> +
> +  epod-supply:
> +    description: a phandle to the EPOD regulator
> +
> +  vana-supply:
> +    description: a phandle to the analog voltage regulator
> +
> +  port:
> +    type: object
> +    description:
> +      A DPI port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^dsi@[0-9a-f]+$":
> +    description: subnodes for the three DSI host adapters
> +    type: object
> +    allOf:
> +      - $ref: dsi-controller.yaml#
> +    properties:
> +      compatible:
> +        const: ste,mcde-dsi
> +
> +      reg:
> +        maxItems: 1
> +
> +      vana-supply:
> +        description: a phandle to the analog voltage regulator
> +
> +      clocks:
> +        description: phandles to the high speed and low power (energy save) clocks
> +          the high speed clock is not present on the third (dsi2) block, so it
> +          should only have the "lp" clock
> +        minItems: 1
> +        maxItems: 2
> +
> +      clock-names:
> +        oneOf:
> +          - items:
> +              - const: hs
> +              - const: lp
> +          - items:
> +              - const: lp
> +
> +    required:
> +      - compatible
> +      - reg
> +      - vana-supply
> +      - clocks
> +      - clock-names

       unevaluatedProperties: false

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - epod-supply
> +  - vana-supply
> +
> +unevaluatedProperties: false

The meta-schema has gotten stricter recently, so this has to be 
'additionalProperties' since there's no other schema referenced. Moving 
target. :)

Rob 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
