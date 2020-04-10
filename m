Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075081A4676
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 14:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7847F6ECD6;
	Fri, 10 Apr 2020 12:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4EC6ECD6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 12:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 5F938FB03;
 Fri, 10 Apr 2020 14:45:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MpJ0efOYkIFJ; Fri, 10 Apr 2020 14:45:16 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 5573540601; Fri, 10 Apr 2020 14:45:16 +0200 (CEST)
Date: Fri, 10 Apr 2020 14:45:16 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: display/bridge: Add binding for NWL
 mipi dsi host controller
Message-ID: <20200410124516.GA27532@bogon.m.sigxcpu.org>
References: <cover.1586427783.git.agx@sigxcpu.org>
 <147ffc1e4dee3a623e5dca25d84565d386a34112.1586427783.git.agx@sigxcpu.org>
 <20200410112342.GB4751@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410112342.GB4751@pendragon.ideasonboard.com>
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
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,
On Fri, Apr 10, 2020 at 02:23:42PM +0300, Laurent Pinchart wrote:
> Hi Guido,
> =

> Thank you for the patch.
> =

> On Thu, Apr 09, 2020 at 12:42:01PM +0200, Guido G=FCnther wrote:
> > The Northwest Logic MIPI DSI IP core can be found in NXPs i.MX8 SoCs.
> > =

> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > Tested-by: Robert Chiras <robert.chiras@nxp.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Reviewed-by: Fabio Estevam <festevam@gmail.com>
> > ---
> >  .../bindings/display/bridge/nwl-dsi.yaml      | 226 ++++++++++++++++++
> >  1 file changed, 226 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/nw=
l-dsi.yaml
> > =

> > diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.y=
aml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > new file mode 100644
> > index 000000000000..8aff2d68fc33
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > @@ -0,0 +1,226 @@
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
> =

> This models the two inputs to the IP core, that are connected to a mux
> internally, controlled through mux-controls, right ? Why is a single
> endpoint supported then, if there are two connections at the hardware
> level, and why is this using endpoints instead of ports as there are
> really two input ports ?

That came out of

https://lore.kernel.org/linux-arm-kernel/c86b7ca2-7799-eafd-c380-e4b5515208=
37@samsung.com/

# If the ip has separate lines for DCSS and LCDIF you should distinguish
# by port number. If they are shared
# you can use endpoint number to specify DCSS or LCDIF, in both cases
# bindings should be adjusted.

I read that as

- distinguish by endpoint number:

    eLCDIF--\    |
             ----| nwl
    DCSS----/    |

- distinguish by port number:

    eLCDIF-------|
                 | nwl
    DCSS --------|

From the imx8mq ref manual i didn't see separate input lines for DCSS vs
eLCDIF the the NWL IP so i went with endpoints instead of ports.  I'm
happy to change that if i got it wrong.

Cheers,
 -- Guido

> =

> Apart from that the bindings look ok to me.
> =

> > +
> > +          reg:
> > +            const: 0
> > +
> > +        required:
> > +          - '#address-cells'
> > +          - '#size-cells'
> > +          - reg
> > +
> > +        oneOf:
> > +          - required:
> > +              - endpoint@0
> > +          - required:
> > +              - endpoint@1
> > +
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
> > +                      #address-cells =3D <1>;
> > +                      #size-cells =3D <0>;
> > +                      compatible =3D "rocktech,jh057n00900";
> > +                      reg =3D <0>;
> > +                      port@0 {
> > +                           reg =3D <0>;
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
> =

> -- =

> Regards,
> =

> Laurent Pinchart
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
