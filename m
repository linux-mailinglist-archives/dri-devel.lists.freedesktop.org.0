Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E442835DEC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 10:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C9E10EBB1;
	Mon, 22 Jan 2024 09:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B6210EBB1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 09:17:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A46861188;
 Mon, 22 Jan 2024 09:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839A7C43390;
 Mon, 22 Jan 2024 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705915020;
 bh=O0zUoL0uiBX5x9ypl74qZkXUXOnXX3J9rjb6Fig41B0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XvgfRLDTcWaxrwgqM0+Q4FJzTVBAMpxVF/SD4Jwugk3lpw2omNaK6Gpsa9xrO8jUb
 IfBMr612gRCKl0iFjt1DtBv3T64CRUOQAJ/3iGU4XJkdrqJLPaTaj+q0nU54Q5h0gH
 xgbfbEwMTwhvgxbdk/d7QDgab+Pl0bVAqF6/hILgxBlmxYox98RLOY7a3iAnFm820K
 vpI4M/HwiKbLAeRILyXkkxCUufg7APD9EmHyGBbVgR+0tojWfwo4+MpCN4u59Hf5B8
 I2itgs/7FGPMbc5wkhh3XWGv8ZeNvGFlfctHORHP2T8qNqpNqW8s+skVoyPVm5uoCM
 Y7N0kMQYmrEnA==
Date: Mon, 22 Jan 2024 09:16:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma.B@microchip.com
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Message-ID: <20240122-stark-duress-2f59294dcf27@spud>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-4-dharma.b@microchip.com>
 <20240118-recent-glorified-fd35d72e006e@spud>
 <c33868c8-dc42-4800-885c-5e5f24c2044e@microchip.com>
 <20240119-character-mardi-43571d7fe7d5@wendy>
 <da60f9f3-f955-4a87-a020-5710185953c0@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fSFFnBC92FdCkh8G"
Content-Disposition: inline
In-Reply-To: <da60f9f3-f955-4a87-a020-5710185953c0@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 Linux4Microchip@microchip.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fSFFnBC92FdCkh8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 03:38:41AM +0000, Dharma.B@microchip.com wrote:
> Hi Conor,
> On 19/01/24 5:33 pm, Conor Dooley - M52691 wrote:
> > On Fri, Jan 19, 2024 at 03:32:49AM +0000, Dharma.B@microchip.com wrote:
> >> On 18/01/24 9:10 pm, Conor Dooley wrote:
> >>> On Thu, Jan 18, 2024 at 02:56:12PM +0530, Dharma Balasubiramani wrote:
> >>>> Convert the atmel,hlcdc binding to DT schema format.
> >>>>
> >>>> Adjust the clock-names property to clarify that the LCD controller e=
xpects
> >>>> one of these clocks (either sys_clk or lvds_pll_clk to be present bu=
t not
> >>>> both) along with the slow_clk and periph_clk. This alignment with th=
e actual
> >>>> hardware requirements will enable accurate device tree configuration=
 for
> >>>> systems using the HLCDC IP.
> >>>>
> >>>> Signed-off-by: Dharma Balasubiramani<dharma.b@microchip.com>
> >>>> ---
> >>>> changelog
> >>>> v2 -> v3
> >>>> - Rename hlcdc-display-controller and hlcdc-pwm to generic names.
> >>>> - Modify the description by removing the unwanted comments and '|'.
> >>>> - Modify clock-names simpler.
> >>>> v1 -> v2
> >>>> - Remove the explicit copyrights.
> >>>> - Modify title (not include words like binding/driver).
> >>>> - Modify description actually describing the hardware and not the dr=
iver.
> >>>> - Add details of lvds_pll addition in commit message.
> >>>> - Ref endpoint and not endpoint-base.
> >>>> - Fix coding style.
> >>>> ...
> >>>>    .../devicetree/bindings/mfd/atmel,hlcdc.yaml  | 97 ++++++++++++++=
+++++
> >>>>    .../devicetree/bindings/mfd/atmel-hlcdc.txt   | 56 -----------
> >>>>    2 files changed, 97 insertions(+), 56 deletions(-)
> >>>>    create mode 100644 Documentation/devicetree/bindings/mfd/atmel,hl=
cdc.yaml
> >>>>    delete mode 100644 Documentation/devicetree/bindings/mfd/atmel-hl=
cdc.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml =
b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..eccc998ac42c
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> >>>> @@ -0,0 +1,97 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id:http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
> >>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Atmel's HLCD Controller
> >>>> +
> >>>> +maintainers:
> >>>> +  - Nicolas Ferre<nicolas.ferre@microchip.com>
> >>>> +  - Alexandre Belloni<alexandre.belloni@bootlin.com>
> >>>> +  - Claudiu Beznea<claudiu.beznea@tuxon.dev>
> >>>> +
> >>>> +description:
> >>>> +  The Atmel HLCDC (HLCD Controller) IP available on Atmel SoCs expo=
ses two
> >>>> +  subdevices, a PWM chip and a Display Controller.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    enum:
> >>>> +      - atmel,at91sam9n12-hlcdc
> >>>> +      - atmel,at91sam9x5-hlcdc
> >>>> +      - atmel,sama5d2-hlcdc
> >>>> +      - atmel,sama5d3-hlcdc
> >>>> +      - atmel,sama5d4-hlcdc
> >>>> +      - microchip,sam9x60-hlcdc
> >>>> +      - microchip,sam9x75-xlcdc
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  interrupts:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  clocks:
> >>>> +    maxItems: 3
> >>> Hmm, one thing I probably should have said on the previous version, b=
ut
> >>> I missed somehow: It would be good to add an items list to the clocks
> >>> property here to explain what the 3 clocks are/are used for - especia=
lly
> >>> since there is additional complexity being added here to use either t=
he
> >>> sys or lvds clocks.
> >> May I inquire if this approach is likely to be effective?
> >>
> >>     clocks:
> >>       items:
> >>         - description: peripheral clock
> >>         - description: generic clock or lvds pll clock
> >>             Once the LVDS PLL is enabled, the pixel clock is used as t=
he
> >>             clock for LCDC, so its GCLK is no longer needed.
> >>         - description: slow clock
> >>       maxItems: 3
> >=20
> > Hmm that sounds very suspect to me. "Once the lvdspll is enabled the
> > generic clock is no longer needed" sounds like both clocks can be provi=
ded
> > to the IP on different pins and their provision is not mutually
> > exclusive, just that the IP will only actually use one at a time. If
> > that is the case, then this patch is nott correct and the binding should
> > allow for 4 clocks, with both the generic clock and the lvds pll being
> > present in the DT at the same time.
> >=20
> > I vaguely recall internal discussion about this problem some time back
> > but the details all escape me.
>=20
> Let's delve deeper into the clock configuration for LCDC_PCK.
>=20
> Considering the flexibility of the design, it appears that both clocks,=
=20
> sys_clk (generic clock) and lvds_pll_clk, can indeed be provided to the=
=20
> IP simultaneously. The crucial aspect, however, is that the IP will=20
> utilize only one of these clocks at any given time. This aligns with the=
=20
> specific requirements of the application, where the choice of clock=20
> depends on whether the LVDS interface or MIPI/DSI is in use.

If both clocks can physically be provided to the IP then both of them
should be in the dt. The hcldc appears to me to be a part of the SoC and
the clock routing to the IP is likely fixed.

> To ensure proper configuration of the pixel clock period, we need to=20
> distinctly identify which clocks are being utilized. For instance, in=20
> the LVDS interface scenario, the lvds_pll_clk is essential, resulting in=
=20
> LCDC_PCK being set to the source clock. Conversely, in the MIPI/DSI=20
> case, the LCDC GCLK is required, leading to LCDC_PCK being defined as=20
> source clock/CLKDIV+2.
>=20
> Considering the potential coexistence of sys_clk and lvds_pll_clk in the=
=20
> Device Tree (DT), we may need to introduce an additional flag in the DT.=
=20
> This flag could serve as a clear indicator of whether the LVDS interface=
=20
> or MIPI/DSI is being employed. As we discussed to drop this flag and=20
> just have any one of the clocks I believe that this approach provides a=
=20
> sensible and scalable solution, allowing for a comprehensive=20
> representation of the clocking configuration.

This is probably a question for the folks on the DRM or media side of
things, but is it not possible to determine based on the endpoint what
protocol is required?
I know that on the media side of things there's an endpoint property
that can be used to specific the bus-type - is there an equivalent
property for DRM stuff?

Cheers,
Conor.

--fSFFnBC92FdCkh8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa4yhQAKCRB4tDGHoIJi
0sMDAP0c3HEL+1Ig0hd1OqjdKgyyXhWgUHymexBR+pGPnteR8AEArSSf7rMlOQn2
Mx+/ZN+8H7ncpBa1xwIKSYBKhCK7sQk=
=l0SJ
-----END PGP SIGNATURE-----

--fSFFnBC92FdCkh8G--
