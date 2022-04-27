Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A385122F6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 21:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A44410E23A;
	Wed, 27 Apr 2022 19:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB4510E23A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 19:40:01 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 t6-20020a056830224600b00605491a5cd7so1747273otd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 12:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YRHQEOJeHVUsYJGN9JmtRj/2XBLbMF4FdtpgDTrkOZ0=;
 b=c/0Hl3GfoTjkmQSjYOKnB6fEwsCX48+z4sx8a3fGQrTCpGp5zOtMG1pVI6lJR7J0+9
 4VSS7XNdtJaDiK3GPczuFRgLdZRTS8OVA2U7JrbUv7UphAj0q1fCXLUkE3eKZhxS03CR
 I8vVJ+Da/xOMLgKuBxj53Nd5V9IKEsC9je3dqxABrZIVUoXPg8JvvZUA5eXm2AZ69xU5
 2NK1KaIuP5Gd8zRebBplqNYgxnIkCYOHaVqoDjbeMd9hKVuuQyRstUT+dwrtQBzQUh7g
 F3KraX0YswKUfyjhsauhZyBTt4AO/8v+kCqI1Ll/+Nw7wS1ZMOB1lOO9fxyPlyqRQPH2
 NVcg==
X-Gm-Message-State: AOAM533RksKYnJFnclEPLv1Xu22PeOOBGWVLPYuuZAg9hJeoQzjvV+kK
 /Nt2KcAZpfl/J0NjZce13A==
X-Google-Smtp-Source: ABdhPJz2nIDxQYxPCZrHWl4bG6O9R4+laMYXSYYRQjgfy1UrgvWcjQixnE/Tv8wlogmcJRgM1QR9Cg==
X-Received: by 2002:a05:6830:12d2:b0:605:e67e:edc5 with SMTP id
 a18-20020a05683012d200b00605e67eedc5mr304412otq.326.1651088400977; 
 Wed, 27 Apr 2022 12:40:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 30-20020a9d0ba1000000b005e95b29b95dsm6132541oth.5.2022.04.27.12.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 12:40:00 -0700 (PDT)
Received: (nullmailer pid 540132 invoked by uid 1000);
 Wed, 27 Apr 2022 19:39:59 -0000
Date: Wed, 27 Apr 2022 14:39:59 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 10/11] dt-bindings: display: convert Arm Mali-DP to DT
 schema
Message-ID: <YmmcD66wjghkWXx3@robh.at.kernel.org>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
 <20220427112528.4097815-11-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427112528.4097815-11-andre.przywara@arm.com>
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

On Wed, Apr 27, 2022 at 12:25:27PM +0100, Andre Przywara wrote:
> The Arm Mali Display Processor (DP) 5xx/6xx is a series of IP that scans
> out a framebuffer and hands the pixels over to a digital signal encoder.
> It supports multiple layers, scaling and rotation.
> 
> Convert the existing DT binding to DT schema.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/display/arm,malidp.txt           |  68 ----------
>  .../bindings/display/arm,malidp.yaml          | 117 ++++++++++++++++++
>  2 files changed, 117 insertions(+), 68 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/arm,malidp.txt
>  create mode 100644 Documentation/devicetree/bindings/display/arm,malidp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/arm,malidp.txt b/Documentation/devicetree/bindings/display/arm,malidp.txt
> deleted file mode 100644
> index 7a97a2b48c2a2..0000000000000
> --- a/Documentation/devicetree/bindings/display/arm,malidp.txt
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -ARM Mali-DP
> -
> -The following bindings apply to a family of Display Processors sold as
> -licensable IP by ARM Ltd. The bindings describe the Mali DP500, DP550 and
> -DP650 processors that offer multiple composition layers, support for
> -rotation and scaling output.
> -
> -Required properties:
> -  - compatible: should be one of
> -	"arm,mali-dp500"
> -	"arm,mali-dp550"
> -	"arm,mali-dp650"
> -    depending on the particular implementation present in the hardware
> -  - reg: Physical base address and size of the block of registers used by
> -    the processor.
> -  - interrupts: Interrupt list, as defined in ../interrupt-controller/interrupts.txt,
> -    interrupt client nodes.
> -  - interrupt-names: name of the engine inside the processor that will
> -    use the corresponding interrupt. Should be one of "DE" or "SE".
> -  - clocks: A list of phandle + clock-specifier pairs, one for each entry
> -    in 'clock-names'
> -  - clock-names: A list of clock names. It should contain:
> -      - "pclk": for the APB interface clock
> -      - "aclk": for the AXI interface clock
> -      - "mclk": for the main processor clock
> -      - "pxlclk": for the pixel clock feeding the output PLL of the processor.
> -  - arm,malidp-output-port-lines: Array of u8 values describing the number
> -    of output lines per channel (R, G and B).
> -
> -Required sub-nodes:
> -  - port: The Mali DP connection to an encoder input port. The connection
> -    is modelled using the OF graph bindings specified in
> -    Documentation/devicetree/bindings/graph.txt
> -
> -Optional properties:
> -  - memory-region: phandle to a node describing memory (see
> -    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
> -    to be used for the framebuffer; if not present, the framebuffer may
> -    be located anywhere in memory.
> -  - arm,malidp-arqos-high-level: integer of u32 value describing the ARQoS
> -    levels of DP500's QoS signaling.
> -
> -
> -Example:
> -
> -/ {
> -	...
> -
> -	dp0: malidp@6f200000 {
> -		compatible = "arm,mali-dp650";
> -		reg = <0 0x6f200000 0 0x20000>;
> -		memory-region = <&display_reserved>;
> -		interrupts = <0 168 IRQ_TYPE_LEVEL_HIGH>,
> -			     <0 168 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names = "DE", "SE";
> -		clocks = <&oscclk2>, <&fpgaosc0>, <&fpgaosc1>, <&fpgaosc1>;
> -		clock-names = "pxlclk", "mclk", "aclk", "pclk";
> -		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> -		arm,malidp-arqos-high-level = <0xd000d000>;
> -		port {
> -			dp0_output: endpoint {
> -				remote-endpoint = <&tda998x_2_input>;
> -			};
> -		};
> -	};
> -
> -	...
> -};
> diff --git a/Documentation/devicetree/bindings/display/arm,malidp.yaml b/Documentation/devicetree/bindings/display/arm,malidp.yaml
> new file mode 100644
> index 0000000000000..86b636662f803
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/arm,malidp.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/arm,malidp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Mali Display Processor (Mali-DP) binding
> +
> +maintainers:
> +  - Liviu Dudau <Liviu.Dudau@arm.com>
> +  - Andre Przywara <andre.przywara@arm.com>
> +
> +description: |+
> +  The following bindings apply to a family of Display Processors sold as
> +  licensable IP by ARM Ltd. The bindings describe the Mali DP500, DP550 and
> +  DP650 processors that offer multiple composition layers, support for
> +  rotation and scaling output.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - arm,mali-dp500
> +      - arm,mali-dp550
> +      - arm,mali-dp650
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description:
> +          The interrupt used by the Display Engine (DE). Can be shared with
> +          the interrupt for the Scaling Engine (SE), but it will have to be
> +          listed individually.
> +      - description:
> +          The interrupt used by the Scaling Engine (SE). Can be shared with
> +          the interrupt for the Display Engine (DE), but it will have to be
> +          listed individually.
> +
> +  interrupt-names:
> +    items:
> +      - const: DE
> +      - const: SE
> +
> +  clock-names:
> +    items:
> +      - const: pxlclk
> +      - const: mclk
> +      - const: aclk
> +      - const: pclk
> +
> +  clocks:
> +    items:
> +      - description: the pixel clock feeding the output PLL of the processor
> +      - description: the main processor clock
> +      - description: the AXI interface clock
> +      - description: the APB interface clock
> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to a node describing memory to be used for the framebuffer.
> +      If not present, the framebuffer may be located anywhere in memory.
> +
> +  arm,malidp-output-port-lines:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      Number of output lines/bits for each colour channel.
> +    items:
> +      - description: number of output lines for the red channel (R)
> +      - description: number of output lines for the green channel (G)
> +      - description: number of output lines for the blue channel (B)
> +
> +  arm,malidp-arqos-high-level:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      integer describing the ARQoS levels of DP500's QoS signaling
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base

/properties/port

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
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - port
> +  - arm,malidp-output-port-lines
> +
> +examples:
> +  - |
> +    dp0: malidp@6f200000 {
> +            compatible = "arm,mali-dp650";
> +            reg = <0x6f200000 0x20000>;
> +            memory-region = <&display_reserved>;
> +            interrupts = <168>, <168>;
> +            interrupt-names = "DE", "SE";
> +            clocks = <&oscclk2>, <&fpgaosc0>, <&fpgaosc1>, <&fpgaosc1>;
> +            clock-names = "pxlclk", "mclk", "aclk", "pclk";
> +            arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> +            arm,malidp-arqos-high-level = <0xd000d000>;
> +
> +            port {
> +                    dp0_output: endpoint {
> +                            remote-endpoint = <&tda998x_2_input>;
> +                    };
> +            };
> +    };
> +
> +...
> -- 
> 2.25.1
> 
> 
