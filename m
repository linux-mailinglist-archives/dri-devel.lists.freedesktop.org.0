Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CAB568BFE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 16:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D4911273A;
	Wed,  6 Jul 2022 14:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF6C1127CA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 14:58:12 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id p128so14245631iof.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 07:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vx9EKWNYpcHBOsFbrprMQU719uQis38dKdcJXfbwAb4=;
 b=hN4zG2q1MP5lutJ4Q0wH4iQveV/fXY9iH7zQESzD+v/eBMNTuGUeBuO2EsQlEdMZO0
 oOY+PFn143dLWful2GT9tVbcaRgcP+VK0Juw23z9GT6clnZwCUETwv8pmhcSFpJntU1k
 nlZyu5IIgL74TxpUud0uIUeDa3L18JeRr2RGDxfjMULSN2jeMnx/JFkXJpG3ppN37r00
 nSkaXfUzTgxnGn6vdHeo0Nck6I0aBi4x5sUVji9VRchR0++o5PihkUZV5iWywYlaSPNH
 v/RlvagA4xJCCNEQyhwUE0AAW6F7Rv2Jzy4NrQGXLCYBsd4qlx+64WMbuYg+55cYLRD+
 x4KQ==
X-Gm-Message-State: AJIora84Z7g+vj0InmcE3uodrrl+77JESUv/uXRoigPvw4ATM5ezcnDb
 pLfg1lSa7ZfRnOIK6kxiMg==
X-Google-Smtp-Source: AGRyM1udQ5XczJ1KHQSlRVuFA63BJs50eNEvdvNtfvmCm02Cs9+9gEXCy7woVdpj6J2kIFqyxJ2AXw==
X-Received: by 2002:a6b:f206:0:b0:675:544d:45ec with SMTP id
 q6-20020a6bf206000000b00675544d45ecmr21193391ioh.96.1657119492022; 
 Wed, 06 Jul 2022 07:58:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a02a98f000000b0033ee1e67c6esm2876600jam.79.2022.07.06.07.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 07:58:11 -0700 (PDT)
Received: (nullmailer pid 35182 invoked by uid 1000);
 Wed, 06 Jul 2022 14:58:07 -0000
Date: Wed, 6 Jul 2022 08:58:07 -0600
From: Rob Herring <robh@kernel.org>
To: Rahul T R <r-ravikumar@ti.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: display: bridge: Convert
 cdns,dsi.txt to yaml
Message-ID: <20220706145807.GA22662-robh@kernel.org>
References: <20220706114053.3454-1-r-ravikumar@ti.com>
 <20220706114053.3454-2-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706114053.3454-2-r-ravikumar@ti.com>
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
Cc: mparab@cadence.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, a-bhatia1@ti.com, jonas@kwiboo.se,
 airlied@linux.ie, tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 vigneshr@ti.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andrzej.hajda@intel.com, jpawar@cadence.com, lee.jones@linaro.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 06, 2022 at 05:10:49PM +0530, Rahul T R wrote:
> Convert cdns,dsi.txt binding to yaml format
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  .../bindings/display/bridge/cdns,dsi.txt      | 112 ----------
>  .../bindings/display/bridge/cdns,dsi.yaml     | 195 ++++++++++++++++++
>  2 files changed, 195 insertions(+), 112 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> deleted file mode 100644
> index 525a4bfd8634..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> +++ /dev/null
> @@ -1,112 +0,0 @@
> -Cadence DSI bridge
> -==================
> -
> -The Cadence DSI bridge is a DPI to DSI bridge supporting up to 4 DSI lanes.
> -
> -Required properties:
> -- compatible: should be set to "cdns,dsi".
> -- reg: physical base address and length of the controller's registers.
> -- interrupts: interrupt line connected to the DSI bridge.
> -- clocks: DSI bridge clocks.
> -- clock-names: must contain "dsi_p_clk" and "dsi_sys_clk".
> -- phys: phandle link to the MIPI D-PHY controller.
> -- phy-names: must contain "dphy".
> -- #address-cells: must be set to 1.
> -- #size-cells: must be set to 0.
> -
> -Optional properties:
> -- resets: DSI reset lines.
> -- reset-names: can contain "dsi_p_rst".
> -
> -Required subnodes:
> -- ports: Ports as described in Documentation/devicetree/bindings/graph.txt.
> -  2 ports are available:
> -  * port 0: this port is only needed if some of your DSI devices are
> -	    controlled through  an external bus like I2C or SPI. Can have at
> -	    most 4 endpoints. The endpoint number is directly encoding the
> -	    DSI virtual channel used by this device.
> -  * port 1: represents the DPI input.
> -  Other ports will be added later to support the new kind of inputs.
> -
> -- one subnode per DSI device connected on the DSI bus. Each DSI device should
> -  contain a reg property encoding its virtual channel.
> -
> -Example:
> -	dsi0: dsi@fd0c0000 {
> -		compatible = "cdns,dsi";
> -		reg = <0x0 0xfd0c0000 0x0 0x1000>;
> -		clocks = <&pclk>, <&sysclk>;
> -		clock-names = "dsi_p_clk", "dsi_sys_clk";
> -		interrupts = <1>;
> -		phys = <&dphy0>;
> -		phy-names = "dphy";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@1 {
> -				reg = <1>;
> -				dsi0_dpi_input: endpoint {
> -					remote-endpoint = <&xxx_dpi_output>;
> -				};
> -			};
> -		};
> -
> -		panel: dsi-dev@0 {
> -			compatible = "<vendor,panel>";
> -			reg = <0>;
> -		};
> -	};
> -
> -or
> -
> -	dsi0: dsi@fd0c0000 {
> -		compatible = "cdns,dsi";
> -		reg = <0x0 0xfd0c0000 0x0 0x1000>;
> -		clocks = <&pclk>, <&sysclk>;
> -		clock-names = "dsi_p_clk", "dsi_sys_clk";
> -		interrupts = <1>;
> -		phys = <&dphy1>;
> -		phy-names = "dphy";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				dsi0_output: endpoint@0 {
> -					reg = <0>;
> -					remote-endpoint = <&dsi_panel_input>;
> -				};
> -			};
> -
> -			port@1 {
> -				reg = <1>;
> -				dsi0_dpi_input: endpoint {
> -					remote-endpoint = <&xxx_dpi_output>;
> -				};
> -			};
> -		};
> -	};
> -
> -	i2c@xxx {
> -		panel: panel@59 {
> -			compatible = "<vendor,panel>";
> -			reg = <0x59>;
> -
> -			port {
> -				dsi_panel_input: endpoint {
> -					remote-endpoint = <&dsi0_output>;
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> new file mode 100644
> index 000000000000..865b3005c091
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> @@ -0,0 +1,195 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence DSI bridge
> +
> +maintainers:
> +  - Boris Brezillon <boris.brezillon@bootlin.com>
> +
> +description: |
> +   CDNS DSI is a bridge device which converts DPI to DSI
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,dsi
> +
> +  reg:
> +    items:
> +      - description:
> +          Register block for controller's registers.

No need for generic descriptions. Just 'maxItems: 1' when there's only 1 
entry.

> +
> +  clocks:
> +    items:
> +      - description: PSM clock, used by the IP
> +      - description: sys clock, used by the IP
> +
> +  clock-names:
> +    items:
> +      - const: dsi_p_clk
> +      - const: dsi_sys_clk
> +
> +  phys:
> +    maxItems: 1
> +    description: phandle link to the MIPI D-PHY controller.

Drop

> +
> +  phy-names:
> +    const: dphy
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +    description: PHY reset.

Drop

> +
> +  reset-names:
> +    const: dsi_p_rst
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port representing the DSI output. It can have
> +          most 4 endpoints. The endpoint number is directly encoding

at most

> +          the DSI virtual channel used by this device.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input port representing the DP bridge input.

DP?

s/DP bridge/parallel/

> +
> +    required:
> +      - port@1
> +
> +allOf:
> +  - $ref: ../dsi-controller.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        dsi@fd0c0000 {
> +            compatible = "cdns,dsi";
> +            reg = <0x0 0xfd0c0000 0x0 0x1000>;
> +            clocks = <&pclk>, <&sysclk>;
> +            clock-names = "dsi_p_clk", "dsi_sys_clk";
> +            interrupts = <1>;
> +            phys = <&dphy0>;
> +            phy-names = "dphy";
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@1 {
> +                    reg = <1>;
> +                    endpoint {
> +                        remote-endpoint = <&xxx_dpi_output>;
> +                    };
> +                };
> +            };
> +
> +            panel@0 {
> +                compatible = "panasonic,vvx10f034n00";
> +                reg = <0>;
> +                power-supply = <&vcc_lcd_reg>;
> +            };
> +        };
> +    };
> +
> +  - |
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        dsi@fd0c0000 {
> +            compatible = "cdns,dsi";
> +            reg = <0x0 0xfd0c0000 0x0 0x1000>;
> +            clocks = <&pclk>, <&sysclk>;
> +            clock-names = "dsi_p_clk", "dsi_sys_clk";
> +            interrupts = <1>;
> +            phys = <&dphy1>;
> +            phy-names = "dphy";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    dsi0_output: endpoint@0 {
> +                        reg = <0>;
> +                        remote-endpoint = <&dsi_panel_input>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    endpoint {
> +                        remote-endpoint = <&xxx_dpi_output>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            bridge@2d {
> +                compatible = "ti,sn65dsi86";
> +                reg = <0x2d>;

This device isn't relevant to the example. Drop.

> +
> +                vpll-supply = <&src_pp1800_s4a>;
> +                vccio-supply = <&src_pp1800_s4a>;
> +                vcca-supply = <&src_pp1200_l2a>;
> +                vcc-supply = <&src_pp1200_l2a>;
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    port@0 {
> +                        reg = <0>;
> +                        dsi_panel_input: endpoint {
> +                            remote-endpoint = <&dsi0_output>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg = <1>;
> +                        endpoint {
> +                            remote-endpoint = <&panel_in_edp>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.36.1
> 
> 
