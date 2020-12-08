Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27422D2724
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 10:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D056E096;
	Tue,  8 Dec 2020 09:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0446E096
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 09:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6A30FFB03;
 Tue,  8 Dec 2020 10:07:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oKdTZMLSUwOv; Tue,  8 Dec 2020 10:07:11 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id BBC234068D; Tue,  8 Dec 2020 10:07:10 +0100 (CET)
Date: Tue, 8 Dec 2020 10:07:10 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 3/4] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel
 combo PHY support for i.MX8qxp
Message-ID: <20201208090710.GC20575@bogon.m.sigxcpu.org>
References: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
 <1607067224-15616-4-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607067224-15616-4-git-send-email-victor.liu@nxp.com>
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

Hi Liu,
Since we now gain optional properties validation would become even more
useful. Could you look into converting to YAML before adding more
values?
Cheers,
 -- Guido

On Fri, Dec 04, 2020 at 03:33:43PM +0800, Liu Ying wrote:
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
>  Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> =

> diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt=
 b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
> index 9b23407..0afce99 100644
> --- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
> @@ -4,9 +4,13 @@ The Mixel MIPI-DSI PHY IP block is e.g. found on i.MX8 p=
latforms (along the
>  MIPI-DSI IP from Northwest Logic). It represents the physical layer for =
the
>  electrical signals for DSI.
>  =

> +The Mixel PHY IP block found on i.MX8qxp is a combo PHY that can work
> +in either MIPI-DSI PHY mode or LVDS PHY mode.
> +
>  Required properties:
> -- compatible: Must be:
> +- compatible: Should be one of:
>    - "fsl,imx8mq-mipi-dphy"
> +  - "fsl,imx8qxp-mipi-dphy"
>  - clocks: Must contain an entry for each entry in clock-names.
>  - clock-names: Must contain the following entries:
>    - "phy_ref": phandle and specifier referring to the DPHY ref clock
> @@ -14,6 +18,8 @@ Required properties:
>  - #phy-cells: number of cells in PHY, as defined in
>    Documentation/devicetree/bindings/phy/phy-bindings.txt
>    this must be <0>
> +- fsl,syscon: Phandle to a system controller, as required by the PHY
> +  in i.MX8qxp SoC.
>  =

>  Optional properties:
>  - power-domains: phandle to power domain
> -- =

> 2.7.4
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
