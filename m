Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842332D8ED7
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 17:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BD588E41;
	Sun, 13 Dec 2020 16:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8021A89D00
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 16:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 0A57EFB04;
 Sun, 13 Dec 2020 17:44:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6srKoaZvHBUF; Sun, 13 Dec 2020 17:44:33 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 2107743FDC; Sun, 13 Dec 2020 17:44:33 +0100 (CET)
Date: Sun, 13 Dec 2020 17:44:33 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel
 combo PHY support for i.MX8qxp
Message-ID: <20201213164433.GB28272@bogon.m.sigxcpu.org>
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
 <1607651182-12307-5-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607651182-12307-5-git-send-email-victor.liu@nxp.com>
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
On Fri, Dec 11, 2020 at 09:46:21AM +0800, Liu Ying wrote:
> Add support for Mixel MIPI DPHY + LVDS PHY combo IP
> as found on Freescale i.MX8qxp SoC.
> =

> Cc: Guido G=FCnther <agx@sigxcpu.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * No change.
> =

> v1->v2:
> * Add the binding for i.MX8qxp Mixel combo PHY based on the converted bin=
ding.
>   (Guido)
> =

>  .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 41 ++++++++++++++++=
++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yam=
l b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> index c34f2e6..786cfd7 100644
> --- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> @@ -14,10 +14,14 @@ description: |
>    MIPI-DSI IP from Northwest Logic). It represents the physical layer fo=
r the
>    electrical signals for DSI.
>  =

> +  The Mixel PHY IP block found on i.MX8qxp is a combo PHY that can work
> +  in either MIPI-DSI PHY mode or LVDS PHY mode.
> +
>  properties:
>    compatible:
>      enum:
>        - fsl,imx8mq-mipi-dphy
> +      - fsl,imx8qxp-mipi-dphy
>  =

>    reg:
>      maxItems: 1
> @@ -40,6 +44,11 @@ properties:
>    "#phy-cells":
>      const: 0
>  =

> +  fsl,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle which points to Control and Status Registers(CSR) module.
> +
>    power-domains:
>      maxItems: 1
>  =

> @@ -48,12 +57,38 @@ required:
>    - reg
>    - clocks
>    - clock-names
> -  - assigned-clocks
> -  - assigned-clock-parents
> -  - assigned-clock-rates
>    - "#phy-cells"
>    - power-domains
>  =

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8mq-mipi-dphy
> +    then:
> +      properties:
> +        fsl,syscon: false
> +
> +      required:
> +        - assigned-clocks
> +        - assigned-clock-parents
> +        - assigned-clock-rates
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qxp-mipi-dphy
> +    then:
> +      properties:
> +        assigned-clocks: false
> +        assigned-clock-parents: false
> +        assigned-clock-rates: false
> +
> +      required:
> +        - fsl,syscon
> +
>  additionalProperties: false
>  =

>  examples:

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>
Cheers,
 -- Guido

> -- =

> 2.7.4
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
