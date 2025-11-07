Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF3C40FE6
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7388710EB22;
	Fri,  7 Nov 2025 17:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ch4WLeyk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B4B10EB22
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 17:14:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6353F42AA3;
 Fri,  7 Nov 2025 17:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A450C19423;
 Fri,  7 Nov 2025 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762535685;
 bh=iZ+FrXmrNg9m+vRphS3VtQYquQLEkFINHFmKNJIzHf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ch4WLeykxW0UEitLCeqR5iRGkb3N1IvMlWvvO2kVip+YATE5uJqoryTiLs1VKE1c4
 fOC0t29HS+RHFklWe+3LyA7a2BxHfqj3W1RwbHeiDrm/5kyIwLpXQsc1sHJi+hz/L2
 vMfcZjUHYTkie+9w5AnCxlBH3l9a/hJtW2aRHmw3f09supzpeDBGKKuebZ3AeNUO4n
 bnTFhrXQcQZR6jKAAMjVav+lmBCLgNqK38earv+Fl7ngPVI5a4XpHWqO2bPI/E2p4y
 Zr56knLQp23Wfz/chOhb1p5d7lCZnOBVSzohujEStOWZO2oZ92kNvv6n4lXkqFvMpi
 DqPmX21yGYLLQ==
Date: Fri, 7 Nov 2025 17:14:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: backlight: Add max25014 supporty
Message-ID: <20251107-estimator-flap-158b1dc054af@spud>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-1-9a6aa57306bf@gocontroll.com>
 <aQ4RqNiGsngOWrV5@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s6RySbGPqQzAw7m8"
Content-Disposition: inline
In-Reply-To: <aQ4RqNiGsngOWrV5@lizhi-Precision-Tower-5810>
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


--s6RySbGPqQzAw7m8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 10:35:04AM -0500, Frank Li wrote:
> On Fri, Nov 07, 2025 at 01:49:58PM +0100, Maud Spierings via B4 Relay wro=
te:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > with integrated boost controller.
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>


> > +  led@0:
> > +    type: object
> > +    description: Properties for a string of connected LEDs.
> > +    $ref: common.yaml#
> > +
> > +    properties:
> > +      reg:
> > +        const: 0
>=20
> If reg is const 0, why need use led@0?

> > In the current implementation the control registers for channel 1,
> > control all channels. So only one led subnode with led-sources is
> > supported right now. If at some point the driver functionality is
> > expanded the bindings can be easily extended with it.

--s6RySbGPqQzAw7m8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4o/gAKCRB4tDGHoIJi
0jIvAQD0+hh9svmOHdU5hyVROE565agXP34VdWQ0eWMxVyOYNAD9GBNH6x0Xyw93
6zQVoS9McvIgls8VBa4UvQeukIIKJg4=
=JBJl
-----END PGP SIGNATURE-----

--s6RySbGPqQzAw7m8--
