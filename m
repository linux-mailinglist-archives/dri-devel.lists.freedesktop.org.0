Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ACC1A32AE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 12:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E304B6E0D5;
	Thu,  9 Apr 2020 10:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4866E0D5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 10:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id A4217FB04;
 Thu,  9 Apr 2020 12:42:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCIV4MP8K9vw; Thu,  9 Apr 2020 12:42:42 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 9B468400E9; Thu,  9 Apr 2020 12:42:42 +0200 (CEST)
Date: Thu, 9 Apr 2020 12:42:42 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v10 1/2] dt-bindings: display/bridge: Add binding for NWL
 mipi dsi host controller
Message-ID: <20200409104242.GA104945@bogon.m.sigxcpu.org>
References: <cover.1584730033.git.agx@sigxcpu.org>
 <c7fd138e00608a108dae3651ab10d583a60040fc.1584730033.git.agx@sigxcpu.org>
 <20200408173258.GA24828@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408173258.GA24828@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Wed, Apr 08, 2020 at 07:32:58PM +0200, Sam Ravnborg wrote:
> Hi Guido.
> =

> We discussed this binding briefly on IRC:
> =

> 19:28 <pinchartl> port 0 is defined as
> 19:28 <pinchartl> +          Input port node to receive pixel data from t=
he
> 19:28 <pinchartl> +          display controller. Exactly one endpoint mus=
t be
> 19:28 <pinchartl> +          specified.
> 19:28 <pinchartl> then there's two endpoints,

There's only a single one allowed due to

  https://lore.kernel.org/linux-arm-kernel/c86b7ca2-7799-eafd-c380-e4b55152=
0837@samsung.com/

Back when doing that i couldn't figure out a way how to specify this but
I've figured it out now.
Cheers,
 -- Guido

> =

> =

> On Fri, Mar 20, 2020 at 07:49:09PM +0100, Guido G=FCnther wrote:
> > The Northwest Logic MIPI DSI IP core can be found in NXPs i.MX8 SoCs.
> > =

> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > Tested-by: Robert Chiras <robert.chiras@nxp.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  .../bindings/display/bridge/nwl-dsi.yaml      | 216 ++++++++++++++++++
> >  1 file changed, 216 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/nw=
l-dsi.yaml
> > =

> > diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.y=
aml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > new file mode 100644
> > index 000000000000..ec1e7e12719d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > @@ -0,0 +1,216 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Northwest Logic MIPI-DSI controller on i.MX SoCs
> > +
> > +maintainers:
> > +  - Guido G=FAnther <agx@sigxcpu.org>
> > +  - Robert Chiras <robert.chiras@nxp.com>
> > +
> > +description: |
> > +  NWL MIPI-DSI host controller found on i.MX8 platforms. This is a dsi=
 bridge for
> > +  the SOCs NWL MIPI-DSI host controller.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx8mq-nwl-dsi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  clocks:
> > +    items:
> > +      - description: DSI core clock
> > +      - description: RX_ESC clock (used in escape mode)
> > +      - description: TX_ESC clock (used in escape mode)
> > +      - description: PHY_REF clock
> > +      - description: LCDIF clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: core
> > +      - const: rx_esc
> > +      - const: tx_esc
> > +      - const: phy_ref
> > +      - const: lcdif
> > +
> > +  mux-controls:
> > +    description:
> > +      mux controller node to use for operating the input mux
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description:
> > +      A phandle to the phy module representing the DPHY
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dphy
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    items:
> > +      - description: dsi byte reset line
> > +      - description: dsi dpi reset line
> > +      - description: dsi esc reset line
> > +      - description: dsi pclk reset line
> > +
> > +  reset-names:
> > +    items:
> > +      - const: byte
> > +      - const: dpi
> > +      - const: esc
> > +      - const: pclk
> > +
> > +  ports:
> > +    type: object
> > +    description:
> > +      A node containing DSI input & output port nodes with endpoint
> > +      definitions as documented in
> > +      Documentation/devicetree/bindings/graph.txt.
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description:
> > +          Input port node to receive pixel data from the
> > +          display controller. Exactly one endpoint must be
> > +          specified.
> > +        properties:
> > +          '#address-cells':
> > +            const: 1
> > +
> > +          '#size-cells':
> > +            const: 0
> > +
> > +          endpoint@0:
> > +            description: sub-node describing the input from LCDIF
> > +            type: object
> > +
> > +          endpoint@1:
> > +            description: sub-node describing the input from DCSS
> > +            type: object
> > +
> > +          reg:
> > +            const: 0
> > +
> > +        required:
> > +          - '#address-cells'
> > +          - '#size-cells'
> > +          - reg
> > +        additionalProperties: false
> > +
> > +      port@1:
> > +        type: object
> > +        description:
> > +          DSI output port node to the panel or the next bridge
> > +          in the chain
> > +
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    required:
> > +      - '#address-cells'
> > +      - '#size-cells'
> > +      - port@0
> > +      - port@1
> > +
> > +    additionalProperties: false
> =

> For the casual reader the above confuses.
> Assuming the binding is correct, can we have the comment updated.
> =

> 	Sam
> =

> > +
> > +patternProperties:
> > +  "^panel@[0-9]+$":
> > +    type: object
> > +
> > +required:
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - clock-names
> > +  - clocks
> > +  - compatible
> > +  - interrupts
> > +  - mux-controls
> > +  - phy-names
> > +  - phys
> > +  - ports
> > +  - reg
> > +  - reset-names
> > +  - resets
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > + - |
> > +
> > +   #include <dt-bindings/clock/imx8mq-clock.h>
> > +   #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +   #include <dt-bindings/reset/imx8mq-reset.h>
> > +
> > +   mipi_dsi: mipi_dsi@30a00000 {
> > +              #address-cells =3D <1>;
> > +              #size-cells =3D <0>;
> > +              compatible =3D "fsl,imx8mq-nwl-dsi";
> > +              reg =3D <0x30A00000 0x300>;
> > +              clocks =3D <&clk IMX8MQ_CLK_DSI_CORE>,
> > +                       <&clk IMX8MQ_CLK_DSI_AHB>,
> > +                       <&clk IMX8MQ_CLK_DSI_IPG_DIV>,
> > +                       <&clk IMX8MQ_CLK_DSI_PHY_REF>,
> > +                       <&clk IMX8MQ_CLK_LCDIF_PIXEL>;
> > +              clock-names =3D "core", "rx_esc", "tx_esc", "phy_ref", "=
lcdif";
> > +              interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> > +              mux-controls =3D <&mux 0>;
> > +              power-domains =3D <&pgc_mipi>;
> > +              resets =3D <&src IMX8MQ_RESET_MIPI_DSI_RESET_BYTE_N>,
> > +                       <&src IMX8MQ_RESET_MIPI_DSI_DPI_RESET_N>,
> > +                       <&src IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N>,
> > +                       <&src IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N>;
> > +              reset-names =3D "byte", "dpi", "esc", "pclk";
> > +              phys =3D <&dphy>;
> > +              phy-names =3D "dphy";
> > +
> > +              panel@0 {
> > +                      compatible =3D "rocktech,jh057n00900";
> > +                      reg =3D <0>;
> > +                      port@0 {
> > +                           panel_in: endpoint {
> > +                                     remote-endpoint =3D <&mipi_dsi_ou=
t>;
> > +                           };
> > +                      };
> > +              };
> > +
> > +              ports {
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    port@0 {
> > +                           #size-cells =3D <0>;
> > +                           #address-cells =3D <1>;
> > +                           reg =3D <0>;
> > +                           mipi_dsi_in: endpoint@0 {
> > +                                        reg =3D <0>;
> > +                                        remote-endpoint =3D <&lcdif_mi=
pi_dsi>;
> > +                           };
> > +                    };
> > +                    port@1 {
> > +                           reg =3D <1>;
> > +                           mipi_dsi_out: endpoint {
> > +                                         remote-endpoint =3D <&panel_i=
n>;
> > +                           };
> > +                    };
> > +              };
> > +      };
> > -- =

> > 2.23.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
