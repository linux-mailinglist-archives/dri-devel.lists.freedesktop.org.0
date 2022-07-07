Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550BB569F7A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F40F10E3BB;
	Thu,  7 Jul 2022 10:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34661121DF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 10:20:13 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 267AJtQh094463;
 Thu, 7 Jul 2022 05:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1657189195;
 bh=Jepz6OuuyAWvwKOJycB5LtyA1jATTcmeYeTh2OeZJpE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=TgOGo7Wj8xofhJjIbdBcTEPrpu6wWKpc6iXg7SFCaiw53kxGi3aOpLWKvDuw4Uja4
 zUbxWlBRVwWQNlo2naSCGBhye3EtGYX89l91NAbqB1qK6NZ1SFi5RNKOikSOE0L0Iq
 PdgDvIEdiSz2D4o7aI6FAnSgi7NMfBpEqiLoNVD0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 267AJt4K109824
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 7 Jul 2022 05:19:55 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Jul 2022 05:19:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Jul 2022 05:19:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 267AJrXc129445;
 Thu, 7 Jul 2022 05:19:54 -0500
Date: Thu, 7 Jul 2022 15:49:53 +0530
From: Rahul T R <r-ravikumar@ti.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: display: bridge: Convert
 cdns,dsi.txt to yaml
Message-ID: <20220707101952.v5ua3k2nfdnovsjc@uda0490373>
References: <20220706114053.3454-1-r-ravikumar@ti.com>
 <20220706114053.3454-2-r-ravikumar@ti.com>
 <20220706145807.GA22662-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220706145807.GA22662-robh@kernel.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Hi Rob,

On 08:58-20220706, Rob Herring wrote:
> On Wed, Jul 06, 2022 at 05:10:49PM +0530, Rahul T R wrote:
> > Convert cdns,dsi.txt binding to yaml format
> > 
> > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > ---
> >  .../bindings/display/bridge/cdns,dsi.txt      | 112 ----------
> >  .../bindings/display/bridge/cdns,dsi.yaml     | 195 ++++++++++++++++++
> >  2 files changed, 195 insertions(+), 112 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> > deleted file mode 100644
> > index 525a4bfd8634..000000000000
> > --- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
> > +++ /dev/null
> > @@ -1,112 +0,0 @@
> > -Cadence DSI bridge
> > -==================
> > -
> > -The Cadence DSI bridge is a DPI to DSI bridge supporting up to 4 DSI lanes.
> > -
> > -Required properties:
> > -- compatible: should be set to "cdns,dsi".
> > -- reg: physical base address and length of the controller's registers.
> > -- interrupts: interrupt line connected to the DSI bridge.
> > -- clocks: DSI bridge clocks.
> > -- clock-names: must contain "dsi_p_clk" and "dsi_sys_clk".
> > -- phys: phandle link to the MIPI D-PHY controller.
> > -- phy-names: must contain "dphy".
> > -- #address-cells: must be set to 1.
> > -- #size-cells: must be set to 0.
> > -
> > -Optional properties:
> > -- resets: DSI reset lines.
> > -- reset-names: can contain "dsi_p_rst".
> > -
> > -Required subnodes:
> > -- ports: Ports as described in Documentation/devicetree/bindings/graph.txt.
> > -  2 ports are available:
> > -  * port 0: this port is only needed if some of your DSI devices are
> > -	    controlled through  an external bus like I2C or SPI. Can have at
> > -	    most 4 endpoints. The endpoint number is directly encoding the
> > -	    DSI virtual channel used by this device.
> > -  * port 1: represents the DPI input.
> > -  Other ports will be added later to support the new kind of inputs.
> > -
> > -- one subnode per DSI device connected on the DSI bus. Each DSI device should
> > -  contain a reg property encoding its virtual channel.
> > -
> > -Example:
> > -	dsi0: dsi@fd0c0000 {
> > -		compatible = "cdns,dsi";
> > -		reg = <0x0 0xfd0c0000 0x0 0x1000>;
> > -		clocks = <&pclk>, <&sysclk>;
> > -		clock-names = "dsi_p_clk", "dsi_sys_clk";
> > -		interrupts = <1>;
> > -		phys = <&dphy0>;
> > -		phy-names = "dphy";
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -
> > -		ports {
> > -			#address-cells = <1>;
> > -			#size-cells = <0>;
> > -
> > -			port@1 {
> > -				reg = <1>;
> > -				dsi0_dpi_input: endpoint {
> > -					remote-endpoint = <&xxx_dpi_output>;
> > -				};
> > -			};
> > -		};
> > -
> > -		panel: dsi-dev@0 {
> > -			compatible = "<vendor,panel>";
> > -			reg = <0>;
> > -		};
> > -	};
> > -
> > -or
> > -
> > -	dsi0: dsi@fd0c0000 {
> > -		compatible = "cdns,dsi";
> > -		reg = <0x0 0xfd0c0000 0x0 0x1000>;
> > -		clocks = <&pclk>, <&sysclk>;
> > -		clock-names = "dsi_p_clk", "dsi_sys_clk";
> > -		interrupts = <1>;
> > -		phys = <&dphy1>;
> > -		phy-names = "dphy";
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -
> > -		ports {
> > -			#address-cells = <1>;
> > -			#size-cells = <0>;
> > -
> > -			port@0 {
> > -				reg = <0>;
> > -				#address-cells = <1>;
> > -				#size-cells = <0>;
> > -
> > -				dsi0_output: endpoint@0 {
> > -					reg = <0>;
> > -					remote-endpoint = <&dsi_panel_input>;
> > -				};
> > -			};
> > -
> > -			port@1 {
> > -				reg = <1>;
> > -				dsi0_dpi_input: endpoint {
> > -					remote-endpoint = <&xxx_dpi_output>;
> > -				};
> > -			};
> > -		};
> > -	};
> > -
> > -	i2c@xxx {
> > -		panel: panel@59 {
> > -			compatible = "<vendor,panel>";
> > -			reg = <0x59>;
> > -
> > -			port {
> > -				dsi_panel_input: endpoint {
> > -					remote-endpoint = <&dsi0_output>;
> > -				};
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> > new file mode 100644
> > index 000000000000..865b3005c091
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> > @@ -0,0 +1,195 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/cdns,dsi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Cadence DSI bridge
> > +
> > +maintainers:
> > +  - Boris Brezillon <boris.brezillon@bootlin.com>
> > +
> > +description: |
> > +   CDNS DSI is a bridge device which converts DPI to DSI
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - cdns,dsi
> > +
> > +  reg:
> > +    items:
> > +      - description:
> > +          Register block for controller's registers.
> 
> No need for generic descriptions. Just 'maxItems: 1' when there's only 1 
> entry.
> 
> > +
> > +  clocks:
> > +    items:
> > +      - description: PSM clock, used by the IP
> > +      - description: sys clock, used by the IP
> > +
> > +  clock-names:
> > +    items:
> > +      - const: dsi_p_clk
> > +      - const: dsi_sys_clk
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: phandle link to the MIPI D-PHY controller.
> 
> Drop
> 
> > +
> > +  phy-names:
> > +    const: dphy
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +    description: PHY reset.
> 
> Drop
> 
> > +
> > +  reset-names:
> > +    const: dsi_p_rst
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Output port representing the DSI output. It can have
> > +          most 4 endpoints. The endpoint number is directly encoding
> 
> at most
> 
> > +          the DSI virtual channel used by this device.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Input port representing the DP bridge input.
> 
> DP?
> 
> s/DP bridge/parallel/
> 
> > +
> > +    required:
> > +      - port@1
> > +
> > +allOf:
> > +  - $ref: ../dsi-controller.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - phys
> > +  - phy-names
> > +  - ports
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    bus {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        dsi@fd0c0000 {
> > +            compatible = "cdns,dsi";
> > +            reg = <0x0 0xfd0c0000 0x0 0x1000>;
> > +            clocks = <&pclk>, <&sysclk>;
> > +            clock-names = "dsi_p_clk", "dsi_sys_clk";
> > +            interrupts = <1>;
> > +            phys = <&dphy0>;
> > +            phy-names = "dphy";
> > +
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +                    endpoint {
> > +                        remote-endpoint = <&xxx_dpi_output>;
> > +                    };
> > +                };
> > +            };
> > +
> > +            panel@0 {
> > +                compatible = "panasonic,vvx10f034n00";
> > +                reg = <0>;
> > +                power-supply = <&vcc_lcd_reg>;
> > +            };
> > +        };
> > +    };
> > +
> > +  - |
> > +    bus {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        dsi@fd0c0000 {
> > +            compatible = "cdns,dsi";
> > +            reg = <0x0 0xfd0c0000 0x0 0x1000>;
> > +            clocks = <&pclk>, <&sysclk>;
> > +            clock-names = "dsi_p_clk", "dsi_sys_clk";
> > +            interrupts = <1>;
> > +            phys = <&dphy1>;
> > +            phy-names = "dphy";
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +
> > +                    dsi0_output: endpoint@0 {
> > +                        reg = <0>;
> > +                        remote-endpoint = <&dsi_panel_input>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +                    endpoint {
> > +                        remote-endpoint = <&xxx_dpi_output>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +
> > +        i2c {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            bridge@2d {
> > +                compatible = "ti,sn65dsi86";
> > +                reg = <0x2d>;
> 
> This device isn't relevant to the example. Drop.
>

Thanks for the review !
I have sent a v6 with the fixes
please review

Regards
Rahul T R

> > +
> > +                vpll-supply = <&src_pp1800_s4a>;
> > +                vccio-supply = <&src_pp1800_s4a>;
> > +                vcca-supply = <&src_pp1200_l2a>;
> > +                vcc-supply = <&src_pp1200_l2a>;
> > +
> > +                ports {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +
> > +                    port@0 {
> > +                        reg = <0>;
> > +                        dsi_panel_input: endpoint {
> > +                            remote-endpoint = <&dsi0_output>;
> > +                        };
> > +                    };
> > +
> > +                    port@1 {
> > +                        reg = <1>;
> > +                        endpoint {
> > +                            remote-endpoint = <&panel_in_edp>;
> > +                        };
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.36.1
> > 
> > 
