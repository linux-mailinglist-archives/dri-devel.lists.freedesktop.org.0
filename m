Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D85122F2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 21:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D442E10E0F8;
	Wed, 27 Apr 2022 19:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F38510E0F8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 19:39:04 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 d16-20020a056830139000b00605e13c23c9so1166580otq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 12:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k2qu3IfO2BGyu9pXjoOmUHytDS0HPdlISOjfH5qkP1o=;
 b=hdhnkbyyDbR2XAUblLmRS4FsL1Cz52PABob7Kw/qFlJMfasksPh5Y3gvfZQ15ww5ud
 UH4W1/swru7WI4VdduM3VM5mwIGcY0FFl7Largqiglsp/w9VkAU/otHFVg/YOzhHOSUP
 boMVitvuFRvFTwUCqDUU87r4ALPm9YBDTUOnIbCMjzBugL0Ld7f6J94J+iT1du0j8hBO
 Ae/1LeYOX82TvJizIi1HZ8AW7uW5SjbY6DPPavNrmjtUPkDH+WLev5g53Jvxv80GgSQy
 qWLwtyV0hHD7ikzs3uICJrRvpnn7o0XG2CmAefdNFi+OCBnNJdEVdew0zij3najytkzy
 DpkQ==
X-Gm-Message-State: AOAM530g7SaC3bITaeiR1OTP5jbnJnEQ/Ky0udgvX9gsX20xcDTfpY/V
 MSCyT42ESoV8KTyPYQKmvw==
X-Google-Smtp-Source: ABdhPJx+VTz86AeLcrTPD0c4dx4H5uFQNa2N6Nrs59vLUzxymOSynTGFHDPfu+o9rs+YUKaSIgYoFA==
X-Received: by 2002:a9d:6e83:0:b0:605:4a01:1d8c with SMTP id
 a3-20020a9d6e83000000b006054a011d8cmr10617915otr.174.1651088343607; 
 Wed, 27 Apr 2022 12:39:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e3-20020a9d6e03000000b0060553db58bbsm6273790otr.36.2022.04.27.12.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 12:39:03 -0700 (PDT)
Received: (nullmailer pid 538852 invoked by uid 1000);
 Wed, 27 Apr 2022 19:39:02 -0000
Date: Wed, 27 Apr 2022 14:39:02 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 09/11] dt-bindings: display: convert Arm HDLCD to DT schema
Message-ID: <Ymmb1p6rAIDtpc/X@robh.at.kernel.org>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
 <20220427112528.4097815-10-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427112528.4097815-10-andre.przywara@arm.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 12:25:26PM +0100, Andre Przywara wrote:
> The Arm HDLCD is a display controller that scans out a framebuffer and
> hands a signal to a digital encoder to generate a DVI or HDMI signal.
> 
> Convert the existing DT binding to DT schema.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/display/arm,hdlcd.txt | 79 ----------------
>  .../bindings/display/arm,hdlcd.yaml           | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 79 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/arm,hdlcd.txt
>  create mode 100644 Documentation/devicetree/bindings/display/arm,hdlcd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/arm,hdlcd.txt b/Documentation/devicetree/bindings/display/arm,hdlcd.txt
> deleted file mode 100644
> index 78bc24296f3e4..0000000000000
> --- a/Documentation/devicetree/bindings/display/arm,hdlcd.txt
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -ARM HDLCD
> -
> -This is a display controller found on several development platforms produced
> -by ARM Ltd and in more modern of its' Fast Models. The HDLCD is an RGB
> -streamer that reads the data from a framebuffer and sends it to a single
> -digital encoder (DVI or HDMI).
> -
> -Required properties:
> -  - compatible: "arm,hdlcd"
> -  - reg: Physical base address and length of the controller's registers.
> -  - interrupts: One interrupt used by the display controller to notify the
> -    interrupt controller when any of the interrupt sources programmed in
> -    the interrupt mask register have activated.
> -  - clocks: A list of phandle + clock-specifier pairs, one for each
> -    entry in 'clock-names'.
> -  - clock-names: A list of clock names. For HDLCD it should contain:
> -      - "pxlclk" for the clock feeding the output PLL of the controller.
> -
> -Required sub-nodes:
> -  - port: The HDLCD connection to an encoder chip. The connection is modeled
> -    using the OF graph bindings specified in
> -    Documentation/devicetree/bindings/graph.txt.
> -
> -Optional properties:
> -  - memory-region: phandle to a node describing memory (see
> -    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt) to be
> -    used for the framebuffer; if not present, the framebuffer may be located
> -    anywhere in memory.
> -
> -
> -Example:
> -
> -/ {
> -	...
> -
> -	hdlcd@2b000000 {
> -		compatible = "arm,hdlcd";
> -		reg = <0 0x2b000000 0 0x1000>;
> -		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&oscclk5>;
> -		clock-names = "pxlclk";
> -		port {
> -			hdlcd_output: endpoint@0 {
> -				remote-endpoint = <&hdmi_enc_input>;
> -			};
> -		};
> -	};
> -
> -	/* HDMI encoder on I2C bus */
> -	i2c@7ffa0000 {
> -		....
> -		hdmi-transmitter@70 {
> -			compatible = ".....";
> -			reg = <0x70>;
> -			port@0 {
> -				hdmi_enc_input: endpoint {
> -					remote-endpoint = <&hdlcd_output>;
> -				};
> -
> -				hdmi_enc_output: endpoint {
> -					remote-endpoint = <&hdmi_1_port>;
> -				};
> -			};
> -		};
> -
> -	};
> -
> -	hdmi1: connector@1 {
> -		compatible = "hdmi-connector";
> -		type = "a";
> -		port {
> -			hdmi_1_port: endpoint {
> -				remote-endpoint = <&hdmi_enc_output>;
> -			};
> -		};
> -	};
> -
> -	...
> -};
> diff --git a/Documentation/devicetree/bindings/display/arm,hdlcd.yaml b/Documentation/devicetree/bindings/display/arm,hdlcd.yaml
> new file mode 100644
> index 0000000000000..1fe8e07334152
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/arm,hdlcd.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/arm,hdlcd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm HDLCD display controller binding
> +
> +maintainers:
> +  - Liviu Dudau <Liviu.Dudau@arm.com>
> +  - Andre Przywara <andre.przywara@arm.com>
> +
> +description: |+
> +  The Arm HDLCD is a display controller found on several development platforms
> +  produced by ARM Ltd and in more modern of its Fast Models. The HDLCD is an
> +  RGB streamer that reads the data from a framebuffer and sends it to a single
> +  digital encoder (DVI or HDMI).
> +
> +properties:
> +  compatible:
> +    const: arm,hdlcd
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: pxlclk
> +
> +  clocks:
> +    maxItems: 1
> +    description: The input reference for the pixel clock.
> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to a node describing memory to be used for the framebuffer.
> +      If not present, the framebuffer may be located anywhere in memory.
> +
> +  iommus:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base

If no custom properties in port or endpoint:

$ref: /schemas/graph.yaml#/properties/port

> +    unevaluatedProperties: false
> +    description:
> +      Output endpoint of the controller, connecting the LCD panel signals.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - port
> +
> +examples:
> +  - |
> +    hdlcd@2b000000 {
> +            compatible = "arm,hdlcd";
> +            reg = <0x2b000000 0x1000>;
> +            interrupts = <0 85 4>;
> +            clocks = <&oscclk5>;
> +            clock-names = "pxlclk";
> +            port {
> +                    hdlcd_output: endpoint {
> +                            remote-endpoint = <&hdmi_enc_input>;
> +                    };
> +            };
> +    };
> +
> +    /* HDMI encoder on I2C bus */
> +    i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            hdmi-transmitter@70 {
> +                    compatible = "nxp,tda998x";
> +                    reg = <0x70>;
> +                    port {
> +                            hdmi_enc_input: endpoint {
> +                                    remote-endpoint = <&hdlcd_output>;
> +                            };
> +                    };
> +            };
> +
> +    };
> +
> +...
> -- 
> 2.25.1
> 
> 
