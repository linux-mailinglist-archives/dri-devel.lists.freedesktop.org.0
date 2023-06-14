Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC4730286
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 16:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F9B10E463;
	Wed, 14 Jun 2023 14:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822FB10E462
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 14:58:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 646E363C7F;
 Wed, 14 Jun 2023 14:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4926DC433C8;
 Wed, 14 Jun 2023 14:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686754692;
 bh=M43zCogb2TgR3NGCTSmd6SWNuq1Py6JOKg+spF6oX8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cNw9rSh1gHsTYWsp4q89nLmWouBaNxbCzQivzaKHJtgqwpcSsE+lgkPNWp8wKrMwZ
 IudoAXC9Au7NB/nUOijeSY6I6hCPfgrhlNa0hy6ElGi89Hqis4auvEQ83VPdSARdYE
 JgMIysObCWwdit8dOzvkIMn5tCv3DCVogL5BGymvyfOLCYPJPOwOBoZeR5nlXmpsX8
 7uCQKipOWxka9Yjyfzr+aYrxNvRRK9Js57IT91VjpTsRpyvgcHF4L6GsdN8a9V/af5
 dobOZ8YPTsQJElaYOC0IMMm9he/TkXny5f8xnqU0vex4yyhTg9SniWg+ppfNnMkkaZ
 0huW+Le0XZAXg==
Date: Wed, 14 Jun 2023 15:58:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH 1/9] dt-bindings: mfd: Add bindings for SAM9X7 LCD
 controller
Message-ID: <20230614-headset-ability-e4d90eeda5ed@spud>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-2-manikandan.m@microchip.com>
 <a0b059d1-df4d-10ce-fb7c-7acea0a20793@linaro.org>
 <20230613-slider-coherent-d508d67afc91@spud>
 <423eef3c-54f0-5c88-9bc9-82c0198b6da6@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vm86L/VjnDury6D6"
Content-Disposition: inline
In-Reply-To: <423eef3c-54f0-5c88-9bc9-82c0198b6da6@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, Nayabbasha.Sayed@microchip.com,
 dri-devel@lists.freedesktop.org, Hari.PrasathGE@microchip.com,
 krzysztof.kozlowski+dt@linaro.org, Varshini.Rajendran@microchip.com,
 Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 Balamanikandan.Gunasundar@microchip.com, lee@kernel.org,
 Dharma.B@microchip.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 robh+dt@kernel.org, Durai.ManickamKR@microchip.com,
 linux-arm-kernel@lists.infradead.org, Balakrishnan.S@microchip.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vm86L/VjnDury6D6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 04:40:50PM +0200, Nicolas Ferre wrote:
> On 13/06/2023 at 20:21, Conor Dooley wrote:
> > On Tue, Jun 13, 2023 at 08:17:13PM +0200, Krzysztof Kozlowski wrote:
> > > On 13/06/2023 09:04, Manikandan Muralidharan wrote:
> > > > Add new compatible string for the XLCD controller on SAM9X7 SoC.
> > > >=20
> > > > Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>
> > > > ---
> > > >   Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt =
b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> > > > index 5f8880cc757e..7c77b6bf4adb 100644
> > > > --- a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> > > > +++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
> > > > @@ -8,6 +8,7 @@ Required properties:
> > > >      "atmel,sama5d3-hlcdc"
> > > >      "atmel,sama5d4-hlcdc"
> > > >      "microchip,sam9x60-hlcdc"
> > > > +   "microchip,sam9x7-xlcdc"
> > > Google says sam9x7 is a series, not a SoC. Please add compatibles for
> > > specific SoCs, not for series.
> > We had this one a few weeks ago, see
> > https://lore.kernel.org/all/add5e49e-8416-ba9f-819a-da944938c05f@microc=
hip.com/
> > and its parents. Outcome of that seemed to be that using "sam9x7" was f=
ine.
>=20
> And it's where it begins to be funny, as the LCD is precisely one aspect
> where we differentiate between sam9x75, sam9x72 and sam9x70...

Oh dear, just my luck...

> So please Manikandan sort this out if difference between these chips will=
 be
> better handled with different compatibility string, in particular about /=
/,
> LVDS and MIPI-DSI variants!

Yeah, providing some information about what the differences actually are
would be good, for the same of the actually-knowledgeable-about-displays
folk in the audience (IOW, not me).
Probably then the display/atmel/hlcdc-dc.txt binding needs an update too?

--vm86L/VjnDury6D6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZInVfQAKCRB4tDGHoIJi
0t+QAP98ZK1V7j86/YMu7RoLTY1KeXiemdt0SzR3FdJiE/LX5wD8D7rmXmPM2Q2u
I+1APY8ZTJDKVahjB3NLEdDAi3STkA4=
=HLvp
-----END PGP SIGNATURE-----

--vm86L/VjnDury6D6--
