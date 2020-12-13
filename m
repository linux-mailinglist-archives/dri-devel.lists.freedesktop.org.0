Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B32D8EDA
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 17:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D24189D7D;
	Sun, 13 Dec 2020 16:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4ED89D7D
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 16:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id BF448FB05;
 Sun, 13 Dec 2020 17:45:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9o5ZzOY7uUL2; Sun, 13 Dec 2020 17:45:13 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id BDA8543FDC; Sun, 13 Dec 2020 17:45:12 +0100 (CET)
Date: Sun, 13 Dec 2020 17:45:12 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: Convert mixel,mipi-dsi-phy to
 json-schema
Message-ID: <20201213164512.GC28272@bogon.m.sigxcpu.org>
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
 <1607651182-12307-4-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607651182-12307-4-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 martin.kepplinger@puri.sm, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Dec 11, 2020 at 09:46:20AM +0800, Liu Ying wrote:
> This patch converts the mixel,mipi-dsi-phy binding to
> DT schema format using json-schema.
> =

> Comparing to the plain text version, the new binding adds
> the 'assigned-clocks', 'assigned-clock-parents' and
> 'assigned-clock-rates' properites, otherwise 'make dtbs_check'
> would complain that there are mis-matches.  Also, the new
> binding requires the 'power-domains' property since all potential
> SoCs that embed this PHY would provide a power domain for it.
> The example of the new binding takes reference to the latest
> dphy node in imx8mq.dtsi.
> =

> Cc: Guido G=FCnther <agx@sigxcpu.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * Improve the 'clock-names' property by dropping 'items:'.
> =

> v1->v2:
> * Newly introduced in v2.  (Guido)
> =

>  .../devicetree/bindings/phy/mixel,mipi-dsi-phy.txt | 29 ---------
>  .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 72 ++++++++++++++++=
++++++
>  2 files changed, 72 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-=
phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-=
phy.yaml
> =

> diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt=
 b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
> deleted file mode 100644
> index 9b23407..00000000
> --- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Mixel DSI PHY for i.MX8
> -
> -The Mixel MIPI-DSI PHY IP block is e.g. found on i.MX8 platforms (along =
the
> -MIPI-DSI IP from Northwest Logic). It represents the physical layer for =
the
> -electrical signals for DSI.
> -
> -Required properties:
> -- compatible: Must be:
> -  - "fsl,imx8mq-mipi-dphy"
> -- clocks: Must contain an entry for each entry in clock-names.
> -- clock-names: Must contain the following entries:
> -  - "phy_ref": phandle and specifier referring to the DPHY ref clock
> -- reg: the register range of the PHY controller
> -- #phy-cells: number of cells in PHY, as defined in
> -  Documentation/devicetree/bindings/phy/phy-bindings.txt
> -  this must be <0>
> -
> -Optional properties:
> -- power-domains: phandle to power domain
> -
> -Example:
> -	dphy: dphy@30a0030 {
> -		compatible =3D "fsl,imx8mq-mipi-dphy";
> -		clocks =3D <&clk IMX8MQ_CLK_DSI_PHY_REF>;
> -		clock-names =3D "phy_ref";
> -		reg =3D <0x30a00300 0x100>;
> -		power-domains =3D <&pd_mipi0>;
> -		#phy-cells =3D <0>;
> -        };
> diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yam=
l b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> new file mode 100644
> index 00000000..c34f2e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mixel,mipi-dsi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mixel DSI PHY for i.MX8
> +
> +maintainers:
> +  - Guido G=FCnther <agx@sigxcpu.org>
> +
> +description: |
> +  The Mixel MIPI-DSI PHY IP block is e.g. found on i.MX8 platforms (alon=
g the
> +  MIPI-DSI IP from Northwest Logic). It represents the physical layer fo=
r the
> +  electrical signals for DSI.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-mipi-dphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: phy_ref
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents
> +  - assigned-clock-rates
> +  - "#phy-cells"
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    dphy: dphy@30a0030 {
> +        compatible =3D "fsl,imx8mq-mipi-dphy";
> +        reg =3D <0x30a00300 0x100>;
> +        clocks =3D <&clk IMX8MQ_CLK_DSI_PHY_REF>;
> +        clock-names =3D "phy_ref";
> +        assigned-clocks =3D <&clk IMX8MQ_CLK_DSI_PHY_REF>;
> +        assigned-clock-parents =3D <&clk IMX8MQ_VIDEO_PLL1_OUT>;
> +        assigned-clock-rates =3D <24000000>;
> +        #phy-cells =3D <0>;
> +        power-domains =3D <&pgc_mipi>;
> +    };


Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>

Thanks for the conversion!
 -- Guido



> -- =

> 2.7.4
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
