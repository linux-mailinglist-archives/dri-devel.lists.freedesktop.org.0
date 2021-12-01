Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FAD465088
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 15:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8D66EEA1;
	Wed,  1 Dec 2021 14:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8574B6EE9C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 14:52:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2BACD3201805;
 Wed,  1 Dec 2021 09:52:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 01 Dec 2021 09:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=97XXQ3gLcRUr43IrksH+Lte3PkG
 vGsPSg5dKT/RQncY=; b=WRXsQ1zZbZU0/hp8JVnGkjViCfc9hRM+81X2xVv5M7g
 dj/PbDX4mjWqAdN8VVq3d3VS4XO3tW+WoNRtJlVz3GOaAI0XVlNANTm67nL8qoZ1
 qozpQLBhrTUsWGteXwt9J+SN4E3w+tHd5SMsZITROhisuuTVTN014jyX9jWUGrZX
 C97TnZ1WcLtKSSvg74YsU2s5KKYyqrvoe1YRDJPjFfW2xWhPZ0CAvXmNq+ekDZJH
 DOezxZXH4xw9PnzKueCgfCOmWjKDXZ5wapOMhVLy9KnZ5vSRZnn2NJQM6GaMBL3D
 lyRHWWkWAXLHjAsDRUMTPL618cu9Ma0HIsYAyXyynNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=97XXQ3
 gLcRUr43IrksH+Lte3PkGvGsPSg5dKT/RQncY=; b=IhIlvJTcucuSqNav6zd38y
 no+ASvcpz6SxmcnKJ1mW0y7Hxx1AovCnt4K/e9C0eToF8D73Blbzds+/oyBRUqFM
 AcEmYsVdYPvyvLn/uDeNlsC2Vww7rU2Bu5xIOgKHQ1uD3YwmjrS4rFpFeqlNH7O2
 kAFIIRO70rs1qjMFDYAGzvSy6Yttcwao1kBtD4MfaHpf69A40lM1Sl2Xw2s0x/lq
 E1cbZQAqM9KEno5WkAgLq2kTK0s9UzDhAWoRdLfpm+79LvwLSAQxzZtBYR251HxC
 tsMOl2ReyoosmpeXANsQaEqVfUBVyJ6L62Vqkgg5p0VGMhr1MupRUNAVcqo8iP4w
 ==
X-ME-Sender: <xms:OYynYVnRx7P5vkZ9XxLHkTR-lbZlw2ZfYjS0dgfqAxUJuhWbvYwyFw>
 <xme:OYynYQ01LIYqvfjWQ7WFlHKX95lWwrzpzs1WMBgyCOLlzzxsfrm43wlr6qYY03p2J
 G25XK_da8VHGIX0sYU>
X-ME-Received: <xmr:OYynYbqc2P2kaLmtkBPZKUCCOCHsnEMzUgt7-LdsWcO1mSZ1ydwcCr7W0BQL_B1jxuC7_C0TqDLLNaQLFpnFB5RzN4erlObuwSTxNqsCTD9s6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieefgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OYynYVlDZb5nGbBLdXrUBy5chSiPeH7BK7VepZCxsPcSoMo7F09_Hw>
 <xmx:OYynYT1n74sfS69dwrAPM0z2lCj9i2uxMbJOyeq12PmG-9yyTaSIBw>
 <xmx:OYynYUtf0j7Rla3wGx5ZhBuGQixAD-NLiu8bB6g9NYhkmWfRBck9XQ>
 <xmx:OYynYdo-IB3nT-xP6YOc9NmzykniJohE-aVhVajLWLz3Px7QVQZ_6g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Dec 2021 09:52:40 -0500 (EST)
Date: Wed, 1 Dec 2021 15:52:37 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 0/6] drm/tiny/st7735r: Match up with staging/fbtft driver
Message-ID: <20211201145237.6ezs4pwkmku3pesv@houat>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <eba23198-5c52-6520-079b-d2d41f71dc25@lechnology.com>
 <20211129093946.xhp22mvdut3m67sc@houat>
 <ca9e432a-6b04-9935-2469-135a9b47514e@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t7h6p5wa7vue6hpy"
Content-Disposition: inline
In-Reply-To: <ca9e432a-6b04-9935-2469-135a9b47514e@tronnes.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Lechner <david@lechnology.com>, dave.stevenson@raspberrypi.com,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--t7h6p5wa7vue6hpy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

On Tue, Nov 30, 2021 at 03:30:11PM +0100, Noralf Tr=F8nnes wrote:
> Den 29.11.2021 10.39, skrev Maxime Ripard:
> > On Wed, Nov 24, 2021 at 04:03:07PM -0600, David Lechner wrote:
> >> On 11/24/21 9:07 AM, Noralf Tr=F8nnes wrote:
> > I agree that it doesn't really fit in the DT either though. Noralf, what
> > kind of data do we need to setup a display in fbtft? The init sequence,
> > and maybe some enable/reset GPIO, plus some timing duration maybe?
> >=20
> > There's one similar situation I can think of: wifi chips. Those also
> > need a few infos from the DT (like what bus it's connected to, enable
> > GPIO, etc) and a different sequence (firmware), sometimes different from
> > one board to the other.
> >=20
> > Could we have a binding that would be something like:
> >=20
> > panel@42 {
> > 	 compatible =3D "panel-spi";
> > 	 model =3D "panel-from-random-place-42";
> > 	 enable-gpios =3D <&...>;
> > }
> >=20
> > And then, the driver would request the init sequence through the
> > firmware mechanism using a name generated from the model property.
> >=20
> > It allows to support multiple devices in a given system, since the
> > firmware name wouldn't conflict, it makes a decent binding, and users
> > can adjust the init sequence easily (maybe with a bit of tooling)
> >=20
> > Would that work?
>
> I really like this idea. An added benefit is that one driver can handle
> all MIPI DBI compatible controllers avoiding the need to do a patchset
> like this for all the various MIPI DBI controllers. The firmware will
> just contain numeric commands with parameters, so no need for different
> controller drivers to handle the controller specific command names.
>=20
> The following is a list of the MIPI DBI compatible controllers currently
> in staging/fbtft: ili9341, hx8357d, st7735r, ili9163, ili9163, ili9163,
> ili9163, ili9486, ili9481, tinylcd, s6d02a1, s6d02a1, hx8340bn, ili9340.
>=20
> The compatible needs to be a bit more specific though since there are 2
> major SPI protocols for these display: MIPI DBI and the one used by
> ILI9325 and others.
>=20
> The full binding would be something like this:
>=20
> panel@42 {
> 	compatible =3D "panel-mipi-dbi-spi";
> 	model =3D "panel-from-random-place-42";
>=20
> 	/* The MIPI DBI spec lists these powers supply pins */
> 	vdd-supply =3D <&...>;
> 	vddi-supply =3D <&...>;
>=20
> 	/* Optional gpio to drive the RESX line */
> 	reset-gpios =3D <&...>;
>=20
> 	/*
> 	 * D/CX: Data/Command, Command is active low
> 	 * Abcense: Interface option 1 (D/C embedded in 9-bit word)
> 	 * Precense: Interface option 3
> 	 */
> 	dc-gpios =3D <&...>;
>=20
> 	/*
> 	 * If set the driver won't try to read from the controller to see
> 	 * if it's already configured by the bootloader or previously by
> 	 * the driver. A readable controller avoids flicker and/or delay
> 	 * enabling the pipeline.
> 	 *
> 	 * This property might not be necessary if we are guaranteed to
> 	 * always read back all 1's or 0's when MISO is not connected.
> 	 * I don't know if all setups can guarantee that.
> 	 */
> 	write-only;
>=20
> 	/* Optional ref to backlight node */
> 	backlight =3D <&...>;
> }

It looks decent to me. We'll want Rob to give his opinion though, but it
looks in a much better shape compared to what we usually have :)

> Many of these controllers also have a RGB interface option for the
> pixels and only do configuration over SPI.
> Maybe the compatible should reflect these 2 options somehow?

I think we'll want a "real" panel for RGB, with its own compatible
though. We have a few of these drivers in tree already, so it's better
to remain consistent.

Maxime

--t7h6p5wa7vue6hpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaeMNQAKCRDj7w1vZxhR
xS9tAP97O/fE4VyFUMC/zgJm79yHc1PNoOp9KscuTXy6u8NB9QD/cXZGBJe2Qh7Y
16Qdu45H/3tqX4UKfzsOrCoz7emoRgk=
=4AhX
-----END PGP SIGNATURE-----

--t7h6p5wa7vue6hpy--
