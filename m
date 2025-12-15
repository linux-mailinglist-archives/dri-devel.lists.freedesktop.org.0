Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172BCBEDC2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 17:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D349310E494;
	Mon, 15 Dec 2025 16:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819DB10E494
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 16:17:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vVBG0-0000Xh-53; Mon, 15 Dec 2025 17:17:08 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vVBFz-005oIV-0T;
 Mon, 15 Dec 2025 17:17:07 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vVBFy-008z7u-30;
 Mon, 15 Dec 2025 17:17:06 +0100
Date: Mon, 15 Dec 2025 17:17:06 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>, krzk+dt@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20251215161706.2ea3wtu3xlwcxxar@pengutronix.de>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Liu,

On 25-12-08, Liu Ying wrote:
> Hi Marco,
> 
> On 12/02/2025, Marco Felsch wrote:
> > From: Liu Ying <victor.liu@nxp.com>
> > 
> > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > field. Document the Parallel Display Format Configuration(PDFC) subnode
> > and add the subnode to example.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > [m.felsch@pengutronix.de: port to v6.18-rc1]
> > [m.felsch@pengutronix.de: add bus-width]
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492bcbabc8a560d8e707cd 100644
> > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > @@ -26,6 +26,12 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 1
> > +
> >    '#power-domain-cells':
> >      const: 1
> >  
> > @@ -40,6 +46,60 @@ properties:
> >      minItems: 8
> >      maxItems: 10
> >  
> > +  bridge@60:
> 
> The dependency patch series mentioned in cover letter has two links in it's
> cover letter.  Reading the patch sets pointed by the two links, we may find
> Krzysztof's comments - the child nodes of the blk-ctrl should be completely
> documented.

Thanks for pointing this out.

@Krzysztof
Requesting to add everything seems not feasible if everything added
should be tested too.
I don't see why everything should be added in one step, since the base
.dtsi isn't added in one step too.
The different devices (parallel-out bridge, DSI bridge, LVDS bridge,
CSI) logically don't belong together, ableit all device use the same
syscon as parent.

Regards,
  Marco

> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: nxp,imx93-pdfc
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      ports:
> > +        $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +        properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: Input port node to receive pixel data.
> > +
> > +          port@1:
> > +            $ref: /schemas/graph.yaml#/$defs/port-base
> > +            unevaluatedProperties: false
> > +            description: Output port node to downstream pixel data receivers.
> > +
> > +            properties:
> > +              endpoint:
> > +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +                unevaluatedProperties: false
> > +
> > +                properties:
> > +                  bus-width:
> 
> In v1-v5, I thought the output bus format can be determined by the sink
> device(a panel or a bridge) hence properties like bus-width were not needed.
> But, if this property is really needed, then reference video-interfaces.yaml
> since bus-width is documented there.  Should we reference bus-type defined
> in video-interfaces.yaml too?
> 
> > +                    enum: [ 16, 18, 24 ]
> 
> The PARALLEL_DISP_FORMAT field of DISPLAY_MUX register says this IP supports
> below formats.  It seems that the enum here may tell RGB888, RGB666 and RGB565.
> How can we tell RGB555, YCbCr 24 bits and YUV444 then?
> 
> 000b RGB888 -> RGB888
> 001b RGB888 -> RGB666
> 010b RGB565 -> RGB565
> 011b RGB555 -> RGB555
> 100b YUV -> YCbCr 24 bits
> 101b YUV -> YUV444
> 
> > +                    description:
> > +                      Specify the physical parallel bus width.
> > +
> > +                      This property is optional if the display bus-width
> > +                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
> > +                      is connected and all 18-bit data lanes are muxed to the
> 
> Per video-interfaces.yaml, s/data lanes/data lines/.  "data lanes" is a
> value for MIPI DSI/CSI, afaik.
> 
> > +                      parallel-output pads.
> 
> How about just saying that this property is optional and by default it's 24?
> 
> > +
> > +                      This property must be set to 18 to cut only the LSBs
> > +                      instead of the MSBs in case a 24-bit RGB888 display is
> > +                      connected and only the lower 18-bit data lanes are muxed
> > +                      to the parallel-output pads.
> 
> The __lower__ 18-bit?  Isn't it the __MSB__ 6bit in each color component?
> 
> > +
> > +        required:
> > +          - port@0
> > +          - port@1
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - ports
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -81,9 +141,12 @@ allOf:
> >              - const: isi
> >              - const: csi
> >              - const: dsi
> > +
> >  required:
> >    - compatible
> >    - reg
> > +  - '#address-cells'
> > +  - '#size-cells'
> >    - power-domains
> >    - clocks
> >    - clock-names
> > @@ -112,4 +175,33 @@ examples:
> >                 clock-names = "apb", "axi", "nic", "disp", "cam",
> >                               "pxp", "lcdif", "isi", "csi", "dsi";
> >        #power-domain-cells = <1>;
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +
> > +      bridge@60 {
> > +        compatible = "nxp,imx93-pdfc";
> > +        reg = <0x60 0x4>;
> > +
> > +        ports {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          port@0 {
> > +            reg = <0>;
> > +
> > +            pdfc_from_lcdif: endpoint {
> > +              remote-endpoint = <&lcdif_to_pdfc>;
> > +            };
> > +          };
> > +
> > +          port@1 {
> > +            reg = <1>;
> > +
> > +            pdfc_to_panel: endpoint {
> > +              remote-endpoint = <&panel_from_pdfc>;
> > +              bus-width = <18>;
> > +            };
> > +          };
> > +        };
> > +      };
> >      };
> > 
> 
> 
> -- 
> Regards,
> Liu Ying
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
