Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8F566EE9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 15:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7405910F321;
	Tue,  5 Jul 2022 13:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8597910F321
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 13:06:42 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 265D6Klx008413;
 Tue, 5 Jul 2022 08:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1657026380;
 bh=OCLl2efvQJbg1gKEYvQy4DKv/FH6mV4UXDxc5GoIxbU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=r/vESOEpmSALGb4RS/Cr1gJCQz7PkXc427MeGgwqNDvPmLpaoJcCrxciM2GCZhWSA
 5FlY2p4H5zsdxJ9VeG6sV4xXrYHGFL5TLv5ykFOAbk7jZDA4ayr6m68i0lJk81WAX4
 4Xn2mfmxI4SR2aXHP/s/3NI4YZpOAg5mumtgxLII=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 265D6JvG091840
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Jul 2022 08:06:19 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Jul 2022 08:06:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Jul 2022 08:06:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 265D6ION101572;
 Tue, 5 Jul 2022 08:06:19 -0500
Date: Tue, 5 Jul 2022 18:36:18 +0530
From: Rahul T R <r-ravikumar@ti.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: Convert
 cdns,dsi.txt to yaml
Message-ID: <20220705130617.whrs2icf4bvs7zwg@uda0490373>
References: <20220620205403.31744-1-r-ravikumar@ti.com>
 <20220620205403.31744-2-r-ravikumar@ti.com>
 <7768c848-e91d-12d2-d960-196b47778e85@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7768c848-e91d-12d2-d960-196b47778e85@linaro.org>
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
 krzysztof.kozlowski+dt@linaro.org, a-bhatia1@ti.com, narmstrong@baylibre.com,
 airlied@linux.ie, tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 vigneshr@ti.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com, jpawar@cadence.com,
 lee.jones@linaro.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On 17:43-20220624, Krzysztof Kozlowski wrote:
> On 20/06/2022 22:54, Rahul T R wrote:
> > Convert cdns,dsi.txt binding to yaml format
> > 
> > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > ---
> >  .../bindings/display/bridge/cdns,dsi.txt      | 112 ----------
> >  .../bindings/display/bridge/cdns,dsi.yaml     | 193 ++++++++++++++++++
> >  2 files changed, 193 insertions(+), 112 deletions(-)
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
> > index 000000000000..3da47c01dca8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> > @@ -0,0 +1,193 @@
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
> > +      - ti,j721e-dsi
> 
> It wasn't here before, so this is not a conversion. Split adding new
> compatibles and features from actual conversion.
> 
> > +
> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description:
> > +          Register block for controller's registers.
> > +      - description:
> > +          Register block for wrapper settings registers in case of TI J7 SoCs.
> 
> This needs allOf with if:then:else constraining number of items per variant.
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
> > +    minItems: 1
> 
> instead maxItems: 1
> 
> > +    description: phandle link to the MIPI D-PHY controller.
> > +
> > +  phy-names:
> > +    const: dphy
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    minItems: 1
> 
> instead maxItems: 1
> 
> > +    description: PHY reset.
> > +
> > +  reset-names:
> > +    const: dsi_p_rst
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> 
> additionalProperties: false
> 
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Output port representing the DSI output. It can have
> > +          most 4 endpoints. The endpoint number is directly encoding
> > +          the DSI virtual channel used by this device.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Input port representing the DP bridge input.
> > +
> > +    required:
> > +      - port@1
> > +
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
> > +allOf:
> > +  - $ref: ../dsi-controller.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    dsi@fd0c0000 {
> > +        compatible = "cdns,dsi";
> > +        reg = <0x0 0xfd0c0000 0x0 0x1000>;
> > +        clocks = <&pclk>, <&sysclk>;
> > +        clock-names = "dsi_p_clk", "dsi_sys_clk";
> > +        interrupts = <1>;
> > +        phys = <&dphy0>;
> > +        phy-names = "dphy";
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                endpoint {
> > +                    remote-endpoint = <&xxx_dpi_output>;
> > +                };
> > +            };
> > +        };
> > +
> > +        panel@0 {
> > +            compatible = "panasonic,vvx10f034n00";
> > +            reg = <0>;
> > +            power-supply = <&vcc_lcd_reg>;
> > +        };
> > +    };
> > +
> > +  - |
> > +    dsi@fd0c0000 {
> > +        compatible = "cdns,dsi";
> > +        reg = <0x0 0xfd0c0000 0x0 0x1000>;
> > +        clocks = <&pclk>, <&sysclk>;
> > +        clock-names = "dsi_p_clk", "dsi_sys_clk";
> > +        interrupts = <1>;
> > +        phys = <&dphy1>;
> > +        phy-names = "dphy";
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                dsi0_output: endpoint@0 {
> > +                    reg = <0>;
> > +                    remote-endpoint = <&dsi_panel_input>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                endpoint {
> > +                    remote-endpoint = <&xxx_dpi_output>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        bridge@2d {
> > +            compatible = "ti,sn65dsi86";
> > +            reg = <0x2d>;
> > +
> > +            vpll-supply = <&src_pp1800_s4a>;
> > +            vccio-supply = <&src_pp1800_s4a>;
> > +            vcca-supply = <&src_pp1200_l2a>;
> > +            vcc-supply = <&src_pp1200_l2a>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    dsi_panel_input: endpoint {
> > +                        remote-endpoint = <&dsi0_output>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +                    endpoint {
> > +                        remote-endpoint = <&panel_in_edp>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
Thanks for the review !
I have set a v4 addressing the comments
please review

Regards
Rahul T R
> 
> 
> Best regards,
> Krzysztof
