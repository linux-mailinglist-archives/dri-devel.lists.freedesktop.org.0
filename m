Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C721397B035
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 14:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3EE10E172;
	Tue, 17 Sep 2024 12:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VA62icZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423C810E172
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 12:38:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5DC6BA40D24;
 Tue, 17 Sep 2024 12:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C48DC4CEC5;
 Tue, 17 Sep 2024 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726576737;
 bh=maSK1OgwsKWRvPfQb5VczaaoTzCXMMHf/Tq0oc2KJzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VA62icZmpFrzbUEM3IxefZIaJI/qGAG1z/srKb87QW5ghC3UQUcxoC+Tbidi50Map
 yRaH4rgaHyGh8RF18PtIVmkGFejla/47sQK712HwmswqxRpYvF8nR66B5MCrQ5woSt
 BDfnkdNcR2B0m4ifi8mPEGJWYbbv/KNLqbT07ODr4sHo2TcuQFJnFD+HnXbLqZUcWC
 OENywgkpzuRdu8p1WCec1PDI0XLBne2WUPPPIG9mrqD6DTzGrJqDeaInVlH19ODtzI
 scyc/dNP/7qeryisNiUJAIG4KifrJJSGq/E8oTFY4vBv9YAbs+/B6VgjG9NdgBYI5v
 lF8Qlye6waJDQ==
Date: Tue, 17 Sep 2024 13:38:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan.M@microchip.com
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux@armlinux.org.uk,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, arnd@arndb.de, geert+renesas@glider.be,
 mpe@ellerman.id.au, rdunlap@infradead.org, Dharma.B@microchip.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: add
 sam9x75-mipi-dsi binding
Message-ID: <20240917-verdict-nativity-3b84cc3457cc@squawk>
References: <20240814105256.177319-1-manikandan.m@microchip.com>
 <20240814105256.177319-2-manikandan.m@microchip.com>
 <20240814-anaerobic-unpainted-532b8b117b79@spud>
 <5cb63b40-9710-4a6d-984d-1be1394dcb63@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rMc90JzuwC/4yxf9"
Content-Disposition: inline
In-Reply-To: <5cb63b40-9710-4a6d-984d-1be1394dcb63@microchip.com>
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


--rMc90JzuwC/4yxf9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 03:16:53AM +0000, Manikandan.M@microchip.com wrote:
> Hi Conor,
>=20
> On 14/08/24 7:29 pm, Conor Dooley wrote:
> > On Wed, Aug 14, 2024 at 04:22:53PM +0530, Manikandan Muralidharan wrote:
> >> Add the 'sam9x75-mipi-dsi' compatible binding, which describes the
> >> Microchip's specific wrapper for the Synopsys DesignWare MIPI DSI HOST
> >> Controller for the sam9x75 series System-on-Chip (SoC) devices.
> >>
> >> Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>
> >> ---
> >> changes in v3:
> >> - Describe the clocks used
> >>
> >> changes in v2:
> >> - List the clocks with description
> >> - remove describing 'remove-endpoint' properties
> >> - remove unused label, node and fix example DT indentation
> >> - cosmetic fixes
> >> ---
> >>   .../bridge/microchip,sam9x75-mipi-dsi.yaml    | 116 ++++++++++++++++=
++
> >>   1 file changed, 116 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/display/bridge/=
microchip,sam9x75-mipi-dsi.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/microchi=
p,sam9x75-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/=
microchip,sam9x75-mipi-dsi.yaml
> >> new file mode 100644
> >> index 000000000000..3c86f0cd49e9
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x=
75-mipi-dsi.yaml
> >> @@ -0,0 +1,116 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id:http://devicetree.org/schemas/display/bridge/microchip,sam9x75-mi=
pi-dsi.yaml#
> >> +$schema:http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Microchip SAM9X75 MIPI DSI Controller
> >> +
> >> +maintainers:
> >> +  - Manikandan Muralidharan<manikandan.m@microchip.com>
> >> +
> >> +description:
> >> +  Microchip specific extensions or wrapper to the Synopsys Designware=
 MIPI DSI.
> >> +  The MIPI Display Serial Interface (DSI) Host Controller implements =
all
> >> +  protocol functions defined in the MIPI DSI Specification.The DSI Ho=
st
> >> +  provides an interface between the LCD Controller (LCDC) and the MIP=
I D-PHY,
> >> +  allowing communication with a DSI-compliant display.
> >> +
> >> +allOf:
> >> +  - $ref: /schemas/display/dsi-controller.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: microchip,sam9x75-mipi-dsi
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    items:
> >> +      - description:
> >> +          Peripheral Bus Clock between LCDC and MIPI DPHY
> >> +      - description:
> >> +          MIPI DPHY Interface reference clock for PLL block
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: pclk
> >> +      - const: refclk
> >> +
> >> +  microchip,sfr:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to Special Function Register (SFR) node.To enable the D=
SI/CSI
> >> +      selection bit in SFR's ISS Configuration Register.
> > I'm curious - why is this phandle required? How many SFR nodes are there
> > on the platform?
> This phandle is to map the memory region of SFR node and configure the=20
> DSI bit in the SFR's ISS configuration register.
> currently there is only one SFR node in this platform.

What does "currently" mean? The platform either has one or it does not,
currently makes it sound like it has more than one but the dts only has
one.

--rMc90JzuwC/4yxf9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZul4XgAKCRB4tDGHoIJi
0nZ/AP9aLqBeUuJ8fMf/s14ERgmuItLkqNmSjkDKOW5UR/SHWgD/VV2AXV6v3fuD
QGO4xz8WldHlKQxBViH903LPQX/eUAw=
=pKG/
-----END PGP SIGNATURE-----

--rMc90JzuwC/4yxf9--
