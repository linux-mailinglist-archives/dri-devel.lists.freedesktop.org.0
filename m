Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3E951C62
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 15:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38BF10E49C;
	Wed, 14 Aug 2024 13:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bo7J5Iya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA5810E49C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 13:59:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3810ACE1957;
 Wed, 14 Aug 2024 13:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D39C116B1;
 Wed, 14 Aug 2024 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723643958;
 bh=i2XInDiKAjKFZ/WCnSnrMBUbrC57+wTSUjcr1ZI14hU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bo7J5IyaqAZMcWE4jq4EC8jYNr+t8VU8JaJ5Bd8iOtVmU6W3X9tLeALH897enyLil
 MpSE8dU/ZQUdowOK3CPs+Gc+l93MZlzDQRiSKKrcLVnHkQqBGwQpH3BisUkMKM3k9l
 A0dkvNt7N4+IXssfHSjVGsmtKIsKal7ApNc7wJm+px5eNjgV6LoI23u+ScWNoVOYML
 ER9UyXniAiDGDTZpOJ3si8EkLMINPkneifqHka2tEOGbqAHHDo3LnMeu31ipL4ydlX
 KgeRUzXx1C1lWrTixV1g/wXxYAc0NfSBnMxapyjHORCAIAqoH74u3l2QZdMrJcT3hu
 jiqbh3rGANdyg==
Date: Wed, 14 Aug 2024 14:59:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, arnd@arndb.de, geert+renesas@glider.be,
 mpe@ellerman.id.au, rdunlap@infradead.org, dharma.b@microchip.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: add
 sam9x75-mipi-dsi binding
Message-ID: <20240814-anaerobic-unpainted-532b8b117b79@spud>
References: <20240814105256.177319-1-manikandan.m@microchip.com>
 <20240814105256.177319-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+8ausa8IKd49KxfE"
Content-Disposition: inline
In-Reply-To: <20240814105256.177319-2-manikandan.m@microchip.com>
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


--+8ausa8IKd49KxfE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 04:22:53PM +0530, Manikandan Muralidharan wrote:
> Add the 'sam9x75-mipi-dsi' compatible binding, which describes the
> Microchip's specific wrapper for the Synopsys DesignWare MIPI DSI HOST
> Controller for the sam9x75 series System-on-Chip (SoC) devices.
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v3:
> - Describe the clocks used
>=20
> changes in v2:
> - List the clocks with description
> - remove describing 'remove-endpoint' properties
> - remove unused label, node and fix example DT indentation
> - cosmetic fixes
> ---
>  .../bridge/microchip,sam9x75-mipi-dsi.yaml    | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/micr=
ochip,sam9x75-mipi-dsi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/microchip,s=
am9x75-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/mic=
rochip,sam9x75-mipi-dsi.yaml
> new file mode 100644
> index 000000000000..3c86f0cd49e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-=
mipi-dsi.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/microchip,sam9x75-mipi=
-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip SAM9X75 MIPI DSI Controller
> +
> +maintainers:
> +  - Manikandan Muralidharan <manikandan.m@microchip.com>
> +
> +description:
> +  Microchip specific extensions or wrapper to the Synopsys Designware MI=
PI DSI.
> +  The MIPI Display Serial Interface (DSI) Host Controller implements all
> +  protocol functions defined in the MIPI DSI Specification.The DSI Host
> +  provides an interface between the LCD Controller (LCDC) and the MIPI D=
-PHY,
> +  allowing communication with a DSI-compliant display.
> +
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: microchip,sam9x75-mipi-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description:
> +          Peripheral Bus Clock between LCDC and MIPI DPHY
> +      - description:
> +          MIPI DPHY Interface reference clock for PLL block
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: refclk
> +
> +  microchip,sfr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to Special Function Register (SFR) node.To enable the DSI/=
CSI
> +      selection bit in SFR's ISS Configuration Register.

I'm curious - why is this phandle required? How many SFR nodes are there
on the platform?

--+8ausa8IKd49KxfE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZry4LwAKCRB4tDGHoIJi
0jgGAQCNlJez7U3bg6KubO9BcmyXeM+Ooq60GqLPvS/jU0f6LgD/ep76NL779/5C
MBFLfGv3IMIHjffXUIBEpJSOsnvPnAI=
=UfmW
-----END PGP SIGNATURE-----

--+8ausa8IKd49KxfE--
