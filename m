Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17717D3C79
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 18:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A9D10E216;
	Mon, 23 Oct 2023 16:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF93610E216
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 16:29:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B595DB81F48;
 Mon, 23 Oct 2023 16:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A171C433C8;
 Mon, 23 Oct 2023 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698078574;
 bh=EoELWdCTU/JDbdAobvm5Pw4/PCUaGHgAI6hiMXhgaww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hZHqsj2+ChyNr5vaf7VVmbXSmQndDsvgJlS68g6cd1+34j5WaTgVvKfel+SlMDd1H
 2CeCVmDF6jFY6+ogAXsrg55Iei54pUCT9WH0pwbk7m6+vpBy1G0qdIl/cnFkUN+vih
 mRFZoyCUz4gl7Ea+r7HbnDa61j4AECSQXnD/GTEsXZnXHRLHyvDGLo87EaEfvAeHvF
 JdTxWPj5D9MKvSuWfij/qPh1js39op1qxQ0PzAqRlxlQzLR8Xl+1nCmlSjddVY/agk
 pu1g++/n/htwOrAli4nIEI+hzHH81T8BDZQK8s+pepO9z38K/8vvy5b9kPf7ytz6SP
 kW3cTFrmxoP3w==
Date: Mon, 23 Oct 2023 17:29:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH 1/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Message-ID: <20231023-anybody-silver-4548023f8f26@spud>
References: <20231020135434.2598578-1-f.suligoi@asem.it>
 <20231020135434.2598578-2-f.suligoi@asem.it>
 <20231020-moonrise-senate-86d0edb2d404@spud>
 <DU2PR01MB803498DFD93E82DD3947D72DF9D8A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1hasvoe2yijFzxL9"
Content-Disposition: inline
In-Reply-To: <DU2PR01MB803498DFD93E82DD3947D72DF9D8A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--1hasvoe2yijFzxL9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 09:28:03AM +0000, Flavio Suligoi wrote:
> > On Fri, Oct 20, 2023 at 03:54:33PM +0200, Flavio Suligoi wrote:
> > > The two properties:
> > >
> > > - max-brightness
> > > - default brightness
> > >
> > > are not really required, so they can be removed from the "required"
> > > section.
> >=20
> > Why are they not required? You need to provide an explanation.
>=20
> The "max-brightness" is not more used now in the driver (I used it in the=
 first version
> of the driver).

If it is not used any more, what happens when someone passes an old
devicetree to the kernel, that contains max-brightness, but not any of
your new properties?

> The "default-brightness", if omitted in the DT, is managed by the device =
driver,
> using a default value. This depends on the dimming mode used:

For default-brightness, has here always been support in the driver for
the property being omitted, or is this newly added?

> - for the "analog mode", via I2C commands, this value is fixed by hardwar=
e (=3D31)
> - while in case of pwm mode the default used is the last value of the=20
>   brightness-levels array.
>=20
> Also the brightness-levels array is not required; if it is omitted, the d=
river uses=20
> a default array of 0..255 and the "default-brightness" is the last one, w=
hich is "255".

Firstly, this is the sort of rationale that needs to be put into your
commit messages, rather than bullet pointed lists of what you have done.

Secondly, what about other operating systems etc, do any of those support
this platform and depend on presence of these properties?

>=20
> > > Other changes:
> > >
> > > - improve the backlight working mode description, in the "description"
> > >   section
> >=20
> > > - update the example, removing the "max-brightness" and introducing t=
he
> > >   "brightess-levels" property
> >=20
> > Why is this more useful?
>=20
> I introduced the "brightness-levels" instead of "max-brightness" for homo=
geneity,
> since the "analog mode" dimming has a brightness-levels array fixed by ha=
rdware (0..31).
> In this way also the "pwm" mode can use the same concepts of array of lev=
els.

What I would like is an explanation in the commit message as to why the
revised example is more helpful than the existing (and
must-remain-valid) one.

Cheers,
Conor.

> >=20
> > >
> > > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > > ---
> > >  .../bindings/leds/backlight/mps,mp3309c.yaml           | 10 ++++----=
--
> > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > >
> > > diff --git
> > a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > > index 4191e33626f5..527a37368ed7 100644
> > > ---
> > a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > > +++
> > b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > > @@ -14,8 +14,8 @@ description: |
> > >    programmable switching frequency to optimize efficiency.
> > >    It supports two different dimming modes:
> > >
> > > -  - analog mode, via I2C commands (default)
> > > -  - PWM controlled mode.
> > > +  - analog mode, via I2C commands, as default mode (32 dimming level=
s)
> > > +  - PWM controlled mode (optional)
> > >
> > >    The datasheet is available at:
> > >    https://www.monolithicpower.com/en/mp3309c.html
> > > @@ -50,8 +50,6 @@ properties:
> > >  required:
> > >    - compatible
> > >    - reg
> > > -  - max-brightness
> > > -  - default-brightness
> > >
> > >  unevaluatedProperties: false
> > >
> > > @@ -66,8 +64,8 @@ examples:
> > >              compatible =3D "mps,mp3309c";
> > >              reg =3D <0x17>;
> > >              pwms =3D <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10=
^9 */
> > > -            max-brightness =3D <100>;
> > > -            default-brightness =3D <80>;
> > > +            brightness-levels =3D <0 4 8 16 32 64 128 255>;
> > > +            default-brightness =3D <6>;
> > >              mps,overvoltage-protection-microvolt =3D <24000000>;
> > >          };
> > >      };
> > > --
> > > 2.34.1
> > >

--1hasvoe2yijFzxL9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTafaAAKCRB4tDGHoIJi
0ioYAPwIB9qpasFEJTxm0CGQOOzjeK4OOVT0f1QajPGRI/HW5QD+Pjff6ug25S+3
S9JumNZXeMWUTLBjBR8WBYGlldWmPgc=
=msqy
-----END PGP SIGNATURE-----

--1hasvoe2yijFzxL9--
