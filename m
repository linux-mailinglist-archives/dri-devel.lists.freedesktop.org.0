Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAC24A6E64
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 11:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D3D10E1FA;
	Wed,  2 Feb 2022 10:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1994F10E2ED
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 10:09:59 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B372C320209C;
 Wed,  2 Feb 2022 05:09:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 02 Feb 2022 05:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=5DbPeJMozNaU240qUNLzxx93csQDF44f90Lclb
 ERxnQ=; b=tfnzbixzjf+jgcPCPk134Q8KdrbexefMlV1Er7CiED/iV1g8npAQSA
 d0X0QLQHhyHwyLwnveR8c3hH9V1I+qp5aTrKHbebvv+pHZ2BkZfhSsl9bVwbetp8
 /0H+VJh2ieuQreR1C29ghNTkJMdLrMGEPTtM98tJuZQUuDmGtPmD/Hj4M0yn67BM
 8uS3IulIf/6zh1wOH7NKWUiiORbE0/hOfQOtCwmyJ58zWjFjNb2N5ZiqY3gfDb6i
 ozKIgufoDPppiFd87QZoV5VoEYiJtRFhwIW7FNd41dB33Cr7VXPMOHzcu9goErT1
 ubBasUArqNAtw6OP9dtK1pf3wHQoxB5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5DbPeJMozNaU240qU
 NLzxx93csQDF44f90LclbERxnQ=; b=NIyzfVAyRece//qIcauOxUGapQPlxr+GC
 l4ZIvb1rf0/U2Ceq4UP6rc+ZG3BemKQJvWI93o+UFkADzeCJFe/YVQ+uE6cG2zUK
 XqVgfanhvLe9qjVl/aj1zatArwJe5CAkNP1pErPGOPXmaOzsd+MegstfNzk1Pr76
 iGZ5A3gsC2oQjo2XFK00/enjCLQDgtEtFiW7ZNdObutu5DRJ8sQ6LGig4jm0lgru
 iP5pHUcSMYxea2KtdFb/oZIh5f+2CAAJrkdwAWg2T/JXgVl5YP8BZNyt23qPhYMP
 d4V9VBmY11NE/Ldnp/hp517qWdh4FT0YH/BHYIhzqE4UmkI1Z/91A==
X-ME-Sender: <xms:c1j6YYyEomhAKVR9GkgSbUvDB32b1m6q-eoDMObTEsUtskWnwbiX7A>
 <xme:c1j6YcRTTnGIbC81Ce_NmJkkPi3D0ka98gpZjjc5Zwh_LH79t7Qd-K7d1Pfcj0EXD
 7PoC1gKHt0m_97VMKA>
X-ME-Received: <xmr:c1j6YaUarMW9xAePok6XxvcCbapzSD4t6qUjSxaLtOs3CaXpbjoxFs__p65EwT1p4EBMm71TMINKw5Mys5kHyIIo3sEPMKLExWKyEz8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeehgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:c1j6YWgCN7WtE5kTGGyPXNBZfCiINeVyogv7Fnuot99XXwwxW5i3Dg>
 <xmx:c1j6YaA6uTggvy6re-AI9jwCIcROjakPqIxiDj7Uz9_t5Pztum5Gsg>
 <xmx:c1j6YXJS8N3MEWAqYjgosjKe6QhLpjY9hqMoYiYIHjocm9bLa1omdg>
 <xmx:dFj6Yc0kKhE4fsYLnqfZ4PNQeWZGmX7grZcIsGxsAaLx_flwxSMFHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 05:09:55 -0500 (EST)
Date: Wed, 2 Feb 2022 11:09:53 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 3/3] drm/panel: Add MIPI DBI compatible SPI driver
Message-ID: <20220202100953.pymb6blsqlaw7jv6@houat>
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-4-noralf@tronnes.org>
 <20220127100452.bmxcgf6ye3nxrgtq@houat>
 <fff71d01-e1c9-2b0f-e4b2-9abb107f7770@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k7kodxa7vws5utl3"
Content-Disposition: inline
In-Reply-To: <fff71d01-e1c9-2b0f-e4b2-9abb107f7770@tronnes.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--k7kodxa7vws5utl3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 06:53:48PM +0100, Noralf Tr=F8nnes wrote:
> >> +struct panel_mipi_dbi_config {
> >> +	/* Magic string: panel_mipi_dbi_magic */
> >> +	u8 magic[15];
> >> +
> >> +	/* Config file format version */
> >> +	u8 file_format_version;
> >> +
> >> +	/* Width in pixels */
> >> +	__be16 width;
> >> +	/* Height in pixels */
> >> +	__be16 height;
> >> +
> >> +	/* Width in millimeters (optional) */
> >> +	__be16 width_mm;
> >> +	/* Height in millimeters (optional) */
> >> +	__be16 height_mm;
> >> +
> >> +	/* X-axis panel offset */
> >> +	__be16 x_offset;
> >> +	/* Y-axis panel offset */
> >> +	__be16 y_offset;
> >> +
> >> +	/* 4 pad bytes, must be zero */
> >> +	u8 pad[4];
> >> +
> >> +	/*
> >> +	 * Optional MIPI commands to execute when the display pipeline is en=
abled.
> >> +	 * This can be used to configure the display controller.
> >> +	 *
> >> +	 * The commands are stored in a byte array with the format:
> >> +	 *     command, num_parameters, [ parameter, ...], command, ...
> >> +	 *
> >> +	 * Some commands require a pause before the next command can be rece=
ived.
> >> +	 * Inserting a delay in the command sequence is done by using the NO=
P command with one
> >> +	 * parameter: delay in miliseconds (the No Operation command is part=
 of the MIPI Display
> >> +	 * Command Set where it has no parameters).
> >> +	 *
> >> +	 * Example:
> >> +	 *     command 0x11
> >> +	 *     sleep 120ms
> >> +	 *     command 0xb1 parameters 0x01, 0x2c, 0x2d
> >> +	 *     command 0x29
> >> +	 *
> >> +	 * Byte sequence:
> >> +	 *     0x11 0x00
> >> +	 *     0x00 0x01 0x78
> >> +	 *     0xb1 0x03 0x01 0x2c 0x2d
> >> +	 *     0x29 0x00
> >> +	 */
> >> +	u8 commands[];
> >> +};
> >=20
> > I'm not really a fan of parsing raw data in the kernel. I guess we can't
> > really avoid the introduction of a special case to sleep, but we already
> > have dt properties for all of the other properties (but X and Y offset,
> > maybe?)
> >=20
> > Maybe we should use those instead?
>
> I don't understand your reluctance to parsing data, lots of ioctls do
> it.

The reluctance comes from the parsing itself: you need to have input
validation, and it's hard to get right. The less we have, the easier it
gets.

> And this data can only be loaded by root. What I like about having
> these properties in the config file is that the binding becomes a
> fallback binding that can actually be made to work without changing the
> Device Tree.
>=20
> For arguments sake let's say tiny/st7735r.c was not built and we had
> this node:
>=20
> display@0{
> 	compatible =3D "jianda,jd-t18003-t01", "sitronix,st7735r",
> "panel-mipi-dbi-spi";
> };
>=20
> It will still be possible to use this display without changing the
> Device Tree. Just add a firmware/config file.
>=20
> Having the properties in DT it would have to look like this for the
> fallback to work:
>=20
> display@0{
> 	compatible =3D "jianda,jd-t18003-t01", "sitronix,st7735r",
> "panel-mipi-dbi-spi";
> 	panel-timing =3D {
> 		hactive =3D <128>;
> 		vactive =3D <128>;
> 	};
> 	width-mm =3D <25>;
> 	height-mm =3D <26>;
> 	x-offset =3D <2>;
> 	y-offset =3D <3>;
> };
>=20
> Is this important, I'm not sure. What do you think?

Parts of it is ergonomics I guess. We're used to having all those
properties either in the DT or the driver, but here we introduce a new
way that isn't done anywhere else.

And I don't see any real downside to putting it in the DT? It's going to
be in an overlay, under the user's control anyway, right?

Maxime

--k7kodxa7vws5utl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfpYcQAKCRDj7w1vZxhR
xVNIAP9lqwOdLp6XqZji1ZbnVE9RmaNIYURZr+51v750hgHvcAEA30sE3FTTzbJ0
xW7ZhdmyOTEV/N5CO9/PUockqc4Y8AQ=
=c08z
-----END PGP SIGNATURE-----

--k7kodxa7vws5utl3--
