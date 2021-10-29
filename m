Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7535B43F435
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 03:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5D36E9A3;
	Fri, 29 Oct 2021 01:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A14A6E9A3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 01:01:17 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 x135-20020a4a418d000000b002b961605657so2098039ooa.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 18:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s/bvLs9mqqyq/Nkejz5YshWRhSRVN2kAc0CQCFs4s5E=;
 b=Whz9FBVqEKxXc44PAly5D0wlfOpVFGC0zuRKGlEO1OgQv0LDxnJJyF0FlBRIliw0Sp
 eKx/YcW3SxlK9Vvv1LBS1btXKHNXij99rb8T7C3ATmE9eenjc2XZlCjeUEywd2MyKfK1
 2xT1rMcFEGElqtjLrZh82/Dznm9jrc9TcImjFlyfY7SB/1xrHqromY6I+yLgIAp2nEtE
 k7oRn+9jRR7LvgelwtUaSgHV84uwoRFGZE+fBrXtt8+nhh2mDaqr6OQMymRQZaIJmqu4
 WGmB0ArS3fvWW3XljUK9fGpXnXwZL7kh243Ip/aVmYBYklBqQyghC9t2GJ8BjAP5CLpq
 DcuA==
X-Gm-Message-State: AOAM533Gu128RP3VIsv2JRK2u1YAckZGw+bCOMvd3qPgsdZBXr2KW7hL
 SXkbaj7gN951tGalkCaGqzy2SdSHdg==
X-Google-Smtp-Source: ABdhPJwmZ0vDLZkUkvyUrdQRjYbZAZN9phAOoVoTfCNXXR3MyJ9dHuuULu5PIQUxaOe8XmoOuVc0dg==
X-Received: by 2002:a4a:51c1:: with SMTP id s184mr5535965ooa.69.1635469276757; 
 Thu, 28 Oct 2021 18:01:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j23sm1403641oou.5.2021.10.28.18.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:01:16 -0700 (PDT)
Received: (nullmailer pid 918442 invoked by uid 1000);
 Fri, 29 Oct 2021 01:01:15 -0000
Date: Thu, 28 Oct 2021 20:01:15 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] [RFC] dt-bindings: display: bridge: sil, sii9022: Convert
 to json-schema
Message-ID: <YXtH252v1u67chri@robh.at.kernel.org>
References: <1ad70333148a473c1344a87993e795be90f355e4.1634817622.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ad70333148a473c1344a87993e795be90f355e4.1634817622.git.geert+renesas@glider.be>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 02:01:22PM +0200, Geert Uytterhoeven wrote:
> Convert the Silicon Image sii902x HDMI bridge Device Tree binding
> documentation to json-schema.
> 
> Add missing sil,sii9022-cpi and sil,sii9022-tpi compatible values.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> RFC as I do not know the meaning of the various ports subnodes.
> ---
>  .../bindings/display/bridge/sii902x.txt       |  78 ----------
>  .../bindings/display/bridge/sil,sii9022.yaml  | 133 ++++++++++++++++++
>  2 files changed, 133 insertions(+), 78 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/sii902x.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/sii902x.txt b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
> deleted file mode 100644
> index 3bc760cc31cbbeee..0000000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/sii902x.txt
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -sii902x HDMI bridge bindings
> -
> -Required properties:
> -	- compatible: "sil,sii9022"
> -	- reg: i2c address of the bridge
> -
> -Optional properties:
> -	- interrupts: describe the interrupt line used to inform the host
> -	  about hotplug events.
> -	- reset-gpios: OF device-tree gpio specification for RST_N pin.
> -	- iovcc-supply: I/O Supply Voltage (1.8V or 3.3V)
> -	- cvcc12-supply: Digital Core Supply Voltage (1.2V)
> -
> -	HDMI audio properties:
> -	- #sound-dai-cells: <0> or <1>. <0> if only i2s or spdif pin
> -	   is wired, <1> if the both are wired. HDMI audio is
> -	   configured only if this property is found.
> -	- sil,i2s-data-lanes: Array of up to 4 integers with values of 0-3
> -	   Each integer indicates which i2s pin is connected to which
> -	   audio fifo. The first integer selects i2s audio pin for the
> -	   first audio fifo#0 (HDMI channels 1&2), second for fifo#1
> -	   (HDMI channels 3&4), and so on. There is 4 fifos and 4 i2s
> -	   pins (SD0 - SD3). Any i2s pin can be connected to any fifo,
> -	   but there can be no gaps. E.g. an i2s pin must be mapped to
> -	   fifo#0 and fifo#1 before mapping a channel to fifo#2. Default
> -	   value is <0>, describing SD0 pin beiging routed to hdmi audio
> -	   fifo #0.
> -	- clocks: phandle and clock specifier for each clock listed in
> -           the clock-names property
> -	- clock-names: "mclk"
> -	   Describes SII902x MCLK input. MCLK can be used to produce
> -	   HDMI audio CTS values. This property follows
> -	   Documentation/devicetree/bindings/clock/clock-bindings.txt
> -	   consumer binding.
> -
> -	If HDMI audio is configured the sii902x device becomes an I2S
> -	and/or spdif audio codec component (e.g a digital audio sink),
> -	that can be used in configuring a full audio devices with
> -	simple-card or audio-graph-card binding. See their binding
> -	documents on how to describe the way the sii902x device is
> -	connected to the rest of the audio system:
> -	Documentation/devicetree/bindings/sound/simple-card.yaml
> -	Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> -	Note: In case of the audio-graph-card binding the used port
> -	index should be 3.
> -
> -Optional subnodes:
> -	- video input: this subnode can contain a video input port node
> -	  to connect the bridge to a display controller output (See this
> -	  documentation [1]).
> -
> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -	hdmi-bridge@39 {
> -		compatible = "sil,sii9022";
> -		reg = <0x39>;
> -		reset-gpios = <&pioA 1 0>;
> -		iovcc-supply = <&v3v3_hdmi>;
> -		cvcc12-supply = <&v1v2_hdmi>;
> -
> -		#sound-dai-cells = <0>;
> -		sil,i2s-data-lanes = < 0 1 2 >;
> -		clocks = <&mclk>;
> -		clock-names = "mclk";
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -				bridge_in: endpoint {
> -					remote-endpoint = <&dc_out>;
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
> new file mode 100644
> index 0000000000000000..4e5a8ecf87647e8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/sil,sii9022.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Silicon Image sii902x HDMI bridge
> +
> +maintainers:
> +  - Boris Brezillon <bbrezillon@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sil,sii9022-cpi
> +              - sil,sii9022-tpi
> +          - const: sil,sii9022
> +      - const: sil,sii9022
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Interrupt line used to inform the host about hotplug events.
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  iovcc-supply:
> +    description: I/O Supply Voltage (1.8V or 3.3V)
> +
> +  cvcc12-supply:
> +    description: Digital Core Supply Voltage (1.2V)
> +
> +  '#sound-dai-cells':
> +    enum: [ 0, 1 ]
> +    description: |
> +      <0> if only i2s or spdif pin is wired,
> +      <1> if both are wired.
> +      HDMI audio is configured only if this property is found.
> +      If HDMI audio is configured the sii902x device becomes an I2S and/or
> +      spdif audio codec component (e.g. a digital audio sink), that can be used
> +      in configuring a full audio devices with simple-card or audio-graph-card
> +      binding. See their binding documents on how to describe the way the
> +      sii902x device is connected to the rest of the audio system:
> +      Documentation/devicetree/bindings/sound/simple-card.yaml
> +      Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> +      Note: In case of the audio-graph-card binding the used port index should
> +      be 3.
> +
> +  sil,i2s-data-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    items:
> +      - enum: [ 0, 1, 2, 3 ]
> +      - enum: [ 0, 1, 2, 3 ]
> +      - enum: [ 0, 1, 2, 3 ]
> +      - enum: [ 0, 1, 2, 3 ]

minItems: 1
maxItems: 4
uniqueItems: true
items:
  enum: [ 0, 1, 2, 3 ]


> +    description:
> +      Each integer indicates which i2s pin is connected to which audio fifo.
> +      The first integer selects i2s audio pin for the first audio fifo#0 (HDMI
> +      channels 1&2), second for fifo#1 (HDMI channels 3&4), and so on. There
> +      are 4 fifos and 4 i2s pins (SD0 - SD3). Any i2s pin can be connected to
> +      any fifo, but there can be no gaps. E.g. an i2s pin must be mapped to
> +      fifo#0 and fifo#1 before mapping a channel to fifo#2. Default value is
> +      <0>, describing SD0 pin being routed to hdmi audio fifo #0.
> +
> +  clocks:
> +    maxItems: 1
> +    description: MCLK input. MCLK can be used to produce HDMI audio CTS values.
> +
> +  clock-names:
> +    const: mclk
> +
> +  ports:
> +    type: object
> +    properties:
> +      port@0:
> +        type: object
> +        description: FIXME

Can't help you on that, but you need graph.yaml references on ports 
and all of these.

> +
> +      port@1:
> +        type: object
> +        description: FIXME
> +
> +      port@2:
> +        type: object
> +        description: FIXME
> +
> +      port@3:
> +        type: object
> +        description: FIXME
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hdmi-bridge@39 {
> +            compatible = "sil,sii9022";
> +            reg = <0x39>;
> +            reset-gpios = <&pioA 1 0>;
> +            iovcc-supply = <&v3v3_hdmi>;
> +            cvcc12-supply = <&v1v2_hdmi>;
> +
> +            #sound-dai-cells = <0>;
> +            sil,i2s-data-lanes = < 0 1 2 >;
> +            clocks = <&mclk>;
> +            clock-names = "mclk";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    bridge_in: endpoint {
> +                        remote-endpoint = <&dc_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.25.1
> 
> 
