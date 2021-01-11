Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1931F2F22FC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 23:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B2E89DEC;
	Mon, 11 Jan 2021 22:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3D889DEC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 22:49:23 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id d8so479007otq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:49:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wz2MH7ykMU5ONDsoSmTo3zznpsQj7T/MGyT3Jo+3L1Y=;
 b=qeRBYBH1nAniz5pH65CK9GtVhkhc+9bre9MZ+b0EoIZZSQPbaOFzU5REBw99wxacCy
 fsaetOwmR0mgUTf0eJnhVr6KMFsJpYSBFzmZBligx+u+HAo2Zapn5+7wlC5wQldV8Vqy
 4jINWvA2fY/797tcvsD7sySN3zB2ZgAEVs3e/yvAcv6LrWoSr4yBtfzzxt20h/9+w7pz
 Z0DsGQhsx/EDgzObEiz+VElPs1zOxO06wQh+koo4VQpqbsPsr3aurhxFWcCTducZhP/F
 Tv3b//uXJe86Z9FneEWvharXlbiLbySx9iCwr3xznr4kTfUbCFqrf+sma9rczj8QWRe9
 V22g==
X-Gm-Message-State: AOAM532wXescLaX60OUvKdBLw1CnLShd8k3HXsqzyPq2ejPJA2C836n5
 r9DTgHLGWhC3pZLUpM7KlA==
X-Google-Smtp-Source: ABdhPJyBD7ogYMfPGa69CMq4BaPiZMdTamezawFqriooXplzKySGfkAeETHZrifDjiKlF3HVyY9mfw==
X-Received: by 2002:a05:6830:1d58:: with SMTP id
 p24mr941223oth.286.1610405362536; 
 Mon, 11 Jan 2021 14:49:22 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k3sm200383oor.19.2021.01.11.14.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 14:49:21 -0800 (PST)
Received: (nullmailer pid 3202128 invoked by uid 1000);
 Mon, 11 Jan 2021 22:49:20 -0000
Date: Mon, 11 Jan 2021 16:49:20 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: bridge: renesas,dw-hdmi:
 Convert binding to YAML
Message-ID: <20210111224920.GA3197768@robh.at.kernel.org>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210105060818.24158-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105060818.24158-3-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <markyao0591@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 05, 2021 at 08:08:14AM +0200, Laurent Pinchart wrote:
> Convert the Renesas R-Car DWC HDMI TX text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Update MAINTAINERS
> 
> Changes since v1:
> 
> - Drop the part numbers in comments, only keep the SoC names
> - Use unevaluatedProperties instead of additionalProperties
> - Only specify maxItems for clocks and clock-names
> - Drop reg, interrupts, #address-cells and #size-cells as they're
>   checked in the base schema
> - Use one size and address cell in example
> - Rebase on top of OF graph schema, dropped redundant properties
> - Fix identation for enum entries
> ---
>  .../display/bridge/renesas,dw-hdmi.txt        |  88 ------------
>  .../display/bridge/renesas,dw-hdmi.yaml       | 128 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 129 insertions(+), 89 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> deleted file mode 100644
> index 3f6072651182..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -Renesas Gen3 DWC HDMI TX Encoder
> -================================
> -
> -The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> -with a companion PHY IP.
> -
> -These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> -Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
> -following device-specific properties.
> -
> -
> -Required properties:
> -
> -- compatible : Shall contain one or more of
> -  - "renesas,r8a774a1-hdmi" for R8A774A1 (RZ/G2M) compatible HDMI TX
> -  - "renesas,r8a774b1-hdmi" for R8A774B1 (RZ/G2N) compatible HDMI TX
> -  - "renesas,r8a774e1-hdmi" for R8A774E1 (RZ/G2H) compatible HDMI TX
> -  - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
> -  - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
> -  - "renesas,r8a77961-hdmi" for R8A77961 (R-Car M3-W+) compatible HDMI TX
> -  - "renesas,r8a77965-hdmi" for R8A77965 (R-Car M3-N) compatible HDMI TX
> -  - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 and RZ/G2 compatible
> -			     HDMI TX
> -
> -    When compatible with generic versions, nodes must list the SoC-specific
> -    version corresponding to the platform first, followed by the
> -    family-specific version.
> -
> -- reg: See dw_hdmi.txt.
> -- interrupts: HDMI interrupt number
> -- clocks: See dw_hdmi.txt.
> -- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> -- ports: See dw_hdmi.txt. The DWC HDMI shall have one port numbered 0
> -  corresponding to the video input of the controller and one port numbered 1
> -  corresponding to its HDMI output, and one port numbered 2 corresponding to
> -  sound input of the controller. Each port shall have a single endpoint.
> -
> -Optional properties:
> -
> -- power-domains: Shall reference the power domain that contains the DWC HDMI,
> -  if any.
> -
> -
> -Example:
> -
> -	hdmi0: hdmi@fead0000 {
> -		compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
> -		reg = <0 0xfead0000 0 0x10000>;
> -		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
> -		clock-names = "iahb", "isfr";
> -		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			port@0 {
> -				reg = <0>;
> -				dw_hdmi0_in: endpoint {
> -					remote-endpoint = <&du_out_hdmi0>;
> -				};
> -			};
> -			port@1 {
> -				reg = <1>;
> -				rcar_dw_hdmi0_out: endpoint {
> -					remote-endpoint = <&hdmi0_con>;
> -				};
> -			};
> -			port@2 {
> -				reg = <2>;
> -				rcar_dw_hdmi0_sound_in: endpoint {
> -					remote-endpoint = <&hdmi_sound_out>;
> -				};
> -			};
> -		};
> -	};
> -
> -	hdmi0-out {
> -		compatible = "hdmi-connector";
> -		label = "HDMI0 OUT";
> -		type = "a";
> -
> -		port {
> -			hdmi0_con: endpoint {
> -				remote-endpoint = <&rcar_dw_hdmi0_out>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> new file mode 100644
> index 000000000000..23b940c3aff6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car DWC HDMI TX Encoder
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> +  with a companion PHY IP.
> +
> +allOf:
> +  - $ref: synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a774a1-hdmi # for RZ/G2M compatible HDMI TX
> +          - renesas,r8a774b1-hdmi # for RZ/G2N compatible HDMI TX
> +          - renesas,r8a774e1-hdmi # for RZ/G2H compatible HDMI TX
> +          - renesas,r8a7795-hdmi # for R-Car H3 compatible HDMI TX
> +          - renesas,r8a7796-hdmi # for R-Car M3-W compatible HDMI TX
> +          - renesas,r8a77961-hdmi # for R-Car M3-W+ compatible HDMI TX
> +          - renesas,r8a77965-hdmi # for R-Car M3-N compatible HDMI TX
> +      - const: renesas,rcar-gen3-hdmi
> +
> +  reg-io-width:
> +    const: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    maxItems: 2
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

This should be '#/properties/port' instead. '#/$defs/port-base' is if 
you have additional port or endpoint properties.

> +        unevaluatedProperties: false

And you can then drop this.

With those fixes,

Reviewed-by: Rob Herring <robh@kernel.org>

> +        description: Parallel RGB input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: HDMI output port
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Sound input port
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - port@2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    hdmi@fead0000 {
> +        compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
> +        reg = <0xfead0000 0x10000>;
> +        interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
> +        clock-names = "iahb", "isfr";
> +        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                dw_hdmi0_in: endpoint {
> +                    remote-endpoint = <&du_out_hdmi0>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                rcar_dw_hdmi0_out: endpoint {
> +                    remote-endpoint = <&hdmi0_con>;
> +                };
> +            };
> +            port@2 {
> +                reg = <2>;
> +                rcar_dw_hdmi0_sound_in: endpoint {
> +                    remote-endpoint = <&hdmi_sound_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +    hdmi0-out {
> +        compatible = "hdmi-connector";
> +        label = "HDMI0 OUT";
> +        type = "a";
> +
> +        port {
> +            hdmi0_con: endpoint {
> +                remote-endpoint = <&rcar_dw_hdmi0_out>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 22663c2cb3a8..e83a867d96d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5903,7 +5903,7 @@ L:	dri-devel@lists.freedesktop.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://linuxtv.org/pinchartl/media drm/du/next
> -F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
>  F:	Documentation/devicetree/bindings/display/renesas,du.yaml
>  F:	drivers/gpu/drm/rcar-du/
> -- 
> Regards,
> 
> Laurent Pinchart
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
