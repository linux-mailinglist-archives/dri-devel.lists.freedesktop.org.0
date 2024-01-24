Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AC783AE82
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 17:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CA610F45A;
	Wed, 24 Jan 2024 16:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2B810F45A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 16:39:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA7AF61D74;
 Wed, 24 Jan 2024 16:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFABC433F1;
 Wed, 24 Jan 2024 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706114361;
 bh=0fZCQavj1U8K5GunvCZvb1epaEQ0wifItVZGRlFzcRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VXNYJeaPQZLz7X9MQ9wSR96fooLL/NCtqDx8tRKMakIvPmgnjQEEyZdTweVs5+lxp
 qQv7eWa2Fyc2Sw3VhrpukiV7fxxneNWbEN8iLFWWYE4m6DEM3qvKJ0IHh8DGoi3pV8
 7Q/B5Ba/fv7zlO0+u3NFXb8wldm0mVKjPYRQUMRKiBer9ks2JWAnP4pNIUNRqBqiSa
 s5U+76LwRpNnYQX3OixDdRv33l93W4gKBsd36Oj+bDPz9IkWXaiksJYbSWZNIulywF
 BBUCPurh9LUy3Mx9ayhOcKzobR7VPLMxyeEjdXFDdJamlzrnV746zUuhJpowYAQlb0
 vaL5cmybxcDPw==
Date: Wed, 24 Jan 2024 16:39:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma.B@microchip.com
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Message-ID: <20240124-lend-emerald-1028fe65cc39@spud>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-4-dharma.b@microchip.com>
 <20240118-recent-glorified-fd35d72e006e@spud>
 <c33868c8-dc42-4800-885c-5e5f24c2044e@microchip.com>
 <20240119-character-mardi-43571d7fe7d5@wendy>
 <da60f9f3-f955-4a87-a020-5710185953c0@microchip.com>
 <20240122-stark-duress-2f59294dcf27@spud>
 <4906b7e2-0ddb-4d3c-a48b-e16278f2d649@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ujchoulqKTbrEzob"
Content-Disposition: inline
In-Reply-To: <4906b7e2-0ddb-4d3c-a48b-e16278f2d649@microchip.com>
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


--ujchoulqKTbrEzob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 05:18:26AM +0000, Dharma.B@microchip.com wrote:
> Hi Conor & All,
>=20
> On 22/01/24 2:46 pm, Conor Dooley wrote:
> > On Mon, Jan 22, 2024 at 03:38:41AM +0000,Dharma.B@microchip.com  wrote:
> >> Hi Conor,
> >> On 19/01/24 5:33 pm, Conor Dooley - M52691 wrote:
> >>> On Fri, Jan 19, 2024 at 03:32:49AM +0000,Dharma.B@microchip.com  wrot=
e:
> >>>> On 18/01/24 9:10 pm, Conor Dooley wrote:
> >>>>> On Thu, Jan 18, 2024 at 02:56:12PM +0530, Dharma Balasubiramani wro=
te:
> >>>>>> Convert the atmel,hlcdc binding to DT schema format.
> >>>>>>
> >>>>>> Adjust the clock-names property to clarify that the LCD controller=
 expects
> >>>>>> one of these clocks (either sys_clk or lvds_pll_clk to be present =
but not
> >>>>>> both) along with the slow_clk and periph_clk. This alignment with =
the actual
> >>>>>> hardware requirements will enable accurate device tree configurati=
on for
> >>>>>> systems using the HLCDC IP.
> >>>>>>
> >>>>>> Signed-off-by: Dharma Balasubiramani<dharma.b@microchip.com>
> >>>>>> ---
> >>>>>> changelog
> >>>>>> v2 -> v3
> >>>>>> - Rename hlcdc-display-controller and hlcdc-pwm to generic names.
> >>>>>> - Modify the description by removing the unwanted comments and '|'.
> >>>>>> - Modify clock-names simpler.
> >>>>>> v1 -> v2
> >>>>>> - Remove the explicit copyrights.
> >>>>>> - Modify title (not include words like binding/driver).
> >>>>>> - Modify description actually describing the hardware and not the =
driver.
> >>>>>> - Add details of lvds_pll addition in commit message.
> >>>>>> - Ref endpoint and not endpoint-base.
> >>>>>> - Fix coding style.
> >>>>>> ...
> >>>>>>     .../devicetree/bindings/mfd/atmel,hlcdc.yaml  | 97 +++++++++++=
++++++++
> >>>>>>     .../devicetree/bindings/mfd/atmel-hlcdc.txt   | 56 -----------
> >>>>>>     2 files changed, 97 insertions(+), 56 deletions(-)
> >>>>>>     create mode 100644 Documentation/devicetree/bindings/mfd/atmel=
,hlcdc.yaml
> >>>>>>     delete mode 100644 Documentation/devicetree/bindings/mfd/atmel=
-hlcdc.txt
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yam=
l b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..eccc998ac42c
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> >>>>>> @@ -0,0 +1,97 @@
> >>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>>>>> +%YAML 1.2
> >>>>>> +---
> >>>>>> +$id:http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
> >>>>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
> >>>>>> +
> >>>>>> +title: Atmel's HLCD Controller
> >>>>>> +
> >>>>>> +maintainers:
> >>>>>> +  - Nicolas Ferre<nicolas.ferre@microchip.com>
> >>>>>> +  - Alexandre Belloni<alexandre.belloni@bootlin.com>
> >>>>>> +  - Claudiu Beznea<claudiu.beznea@tuxon.dev>
> >>>>>> +
> >>>>>> +description:
> >>>>>> +  The Atmel HLCDC (HLCD Controller) IP available on Atmel SoCs ex=
poses two
> >>>>>> +  subdevices, a PWM chip and a Display Controller.
> >>>>>> +
> >>>>>> +properties:
> >>>>>> +  compatible:
> >>>>>> +    enum:
> >>>>>> +      - atmel,at91sam9n12-hlcdc
> >>>>>> +      - atmel,at91sam9x5-hlcdc
> >>>>>> +      - atmel,sama5d2-hlcdc
> >>>>>> +      - atmel,sama5d3-hlcdc
> >>>>>> +      - atmel,sama5d4-hlcdc
> >>>>>> +      - microchip,sam9x60-hlcdc
> >>>>>> +      - microchip,sam9x75-xlcdc
> >>>>>> +
> >>>>>> +  reg:
> >>>>>> +    maxItems: 1
> >>>>>> +
> >>>>>> +  interrupts:
> >>>>>> +    maxItems: 1
> >>>>>> +
> >>>>>> +  clocks:
> >>>>>> +    maxItems: 3
> >>>>> Hmm, one thing I probably should have said on the previous version,=
 but
> >>>>> I missed somehow: It would be good to add an items list to the cloc=
ks
> >>>>> property here to explain what the 3 clocks are/are used for - espec=
ially
> >>>>> since there is additional complexity being added here to use either=
 the
> >>>>> sys or lvds clocks.
> >>>> May I inquire if this approach is likely to be effective?
> >>>>
> >>>>      clocks:
> >>>>        items:
> >>>>          - description: peripheral clock
> >>>>          - description: generic clock or lvds pll clock
> >>>>              Once the LVDS PLL is enabled, the pixel clock is used a=
s the
> >>>>              clock for LCDC, so its GCLK is no longer needed.
> >>>>          - description: slow clock
> >>>>        maxItems: 3
> >>> Hmm that sounds very suspect to me. "Once the lvdspll is enabled the
> >>> generic clock is no longer needed" sounds like both clocks can be pro=
vided
> >>> to the IP on different pins and their provision is not mutually
> >>> exclusive, just that the IP will only actually use one at a time. If
> >>> that is the case, then this patch is nott correct and the binding sho=
uld
> >>> allow for 4 clocks, with both the generic clock and the lvds pll being
> >>> present in the DT at the same time.
> >>>
> >>> I vaguely recall internal discussion about this problem some time back
> >>> but the details all escape me.
> >> Let's delve deeper into the clock configuration for LCDC_PCK.
> >>
> >> Considering the flexibility of the design, it appears that both clocks,
> >> sys_clk (generic clock) and lvds_pll_clk, can indeed be provided to the
> >> IP simultaneously. The crucial aspect, however, is that the IP will
> >> utilize only one of these clocks at any given time. This aligns with t=
he
> >> specific requirements of the application, where the choice of clock
> >> depends on whether the LVDS interface or MIPI/DSI is in use.
> > If both clocks can physically be provided to the IP then both of them
> > should be in the dt. The hcldc appears to me to be a part of the SoC and
> > the clock routing to the IP is likely fixed.
> >=20
> >> To ensure proper configuration of the pixel clock period, we need to
> >> distinctly identify which clocks are being utilized. For instance, in
> >> the LVDS interface scenario, the lvds_pll_clk is essential, resulting =
in
> >> LCDC_PCK being set to the source clock. Conversely, in the MIPI/DSI
> >> case, the LCDC GCLK is required, leading to LCDC_PCK being defined as
> >> source clock/CLKDIV+2.
> >>
> >> Considering the potential coexistence of sys_clk and lvds_pll_clk in t=
he
> >> Device Tree (DT), we may need to introduce an additional flag in the D=
T.
> >> This flag could serve as a clear indicator of whether the LVDS interfa=
ce
> >> or MIPI/DSI is being employed. As we discussed to drop this flag and
> >> just have any one of the clocks I believe that this approach provides a
> >> sensible and scalable solution, allowing for a comprehensive
> >> representation of the clocking configuration.
> > This is probably a question for the folks on the DRM or media side of
> > things, but is it not possible to determine based on the endpoint what
> > protocol is required?
> > I know that on the media side of things there's an endpoint property
> > that can be used to specific the bus-type - is there an equivalent
> > property for DRM stuff?
>=20
> Yes, it can be done.
> I will have the lvds pll in the lvds DT node.
> I will just convert the existing text binding to yaml without this=20
> additonal lvds pll clock.

If the lvds pll is an input to the hlcdc, you need to add it here.
=46rom your description earlier it does sound like it is an input to
the hlcdc, but now you are claiming that it is not.

I don't know your hardware, so I have no idea which of the two is
correct, but it sounds like the former. Without digging into how this
works my assumption about the hardware here looks like is that the lvds
controller is a clock provider, and that the lvds controller's clock is
an optional input for the hlcdc.

Can you please explain what provides the lvds pll clock and show an
example of how you think the devictree would look with "the lvds pll in
the lvds dt node"?

Thanks,
Conor.


--ujchoulqKTbrEzob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbE9MgAKCRB4tDGHoIJi
0ginAQDiTOcxYcOB4iMLmpd9gCY1MXm8q9z9ZLXEzCR0Mi9zBQD9GyZo+5NvRMAU
GyiMoV1ckQa6rAM/ANP7lVTdT0RY7AA=
=3FDx
-----END PGP SIGNATURE-----

--ujchoulqKTbrEzob--
