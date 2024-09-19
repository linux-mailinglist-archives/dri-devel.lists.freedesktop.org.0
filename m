Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E63997C5E2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 10:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB4510E69E;
	Thu, 19 Sep 2024 08:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yg7mcCNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C7A10E69F;
 Thu, 19 Sep 2024 08:31:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1E825C5CA4;
 Thu, 19 Sep 2024 08:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E005C4CEC5;
 Thu, 19 Sep 2024 08:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726734695;
 bh=XUDUjYx1n5EqHbXvR2UutCS29aT+iofPiEWLkzpEESU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yg7mcCNket5MY6e7spHe7os8VSA0YVWaIfkeHVRwo8YP9tm8Q2oOLq+V0WpwMZK04
 3du/zC5+G86zIQxBUi/TlX5XGt/w0mtFCBlnMpYSn+VvfSecUJ+JlAWXk3HMvkRwyW
 g/wgqbyj2LmXr5tZGaerXsr1g1GaaYeI+RcQlY5kkb9UafZuSxmwdyb0OPI820CxGr
 imu2LGwVGtou5ILxiTX96mk3T1pM11yRFiCwuGFOKlvrFcPbnlJTFxqXMLddGcztbu
 ar1GHJnRSLmZa1VVnzUp+bgAnL1LSNxsjIZuT4PxPRA41LXlxnu/56yqleUoXH2Qpf
 m+RqUOdAQvgJg==
Date: Thu, 19 Sep 2024 10:31:31 +0200
From: Mark Brown <broonie@kernel.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Winkler, Tomas" <tomas.winkler@intel.com>,
 "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 00/12] spi: add driver for Intel discrete graphics
Message-ID: <ZuvhY3SX7ZwEfkgq@finisterre.sirena.org.uk>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <ZurZZ1pzmbWifjAD@finisterre.sirena.org.uk>
 <CY5PR11MB63661407645579333EFFED35ED632@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Pq7754Zke+ES0h8H"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB63661407645579333EFFED35ED632@CY5PR11MB6366.namprd11.prod.outlook.com>
X-Cookie: Editing is a rewording activity.
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


--Pq7754Zke+ES0h8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 06:56:39AM +0000, Usyskin, Alexander wrote:
> > On Mon, Sep 16, 2024 at 04:49:16PM +0300, Alexander Usyskin wrote:

> > As far as I can tell this does not actually provide a SPI driver, there
> > is no call to any SPI API that I've noticed here.  The SPI framework
> > does have support for SPI controllers with specific flash support via
> > spi_controller_mem_ops but this does not appear to use them.  Either it
> > should do that or it should just be a MTD driver.

> I have had some talks with Miquel on this and he was not sure where this =
driver belongs.
> Miquel - can this driver be put in drivers/mtd, as spi cleanly do not wan=
t it?

To be clear, it's not that this hardware shouldn't be supported in the
SPI subsystem it's that if the driver is in the SPI subsystem it should
be written in terms of the relevant APIs.  Simply taking a MTD driver
and dropping it in a random other directory with no further updates
is clearly not the way forwards.

> > The series is also split up into too many patches with minimal
> > explanation, making it hard to follow what's going on.  I would
> > recommend making the first patch be a minimal functional driver and then
> > building on top of that.

> As I understand, better to have small amount of big patches
> than big list of smaller patches?=20

The patches should be individually standalone and useful, the problem
here is that it's difficult to review any of the patches by themselves
because they've not been split up with a clear goal.

--Pq7754Zke+ES0h8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbr4WIACgkQJNaLcl1U
h9CDpgf/bWF1XGCKsAy88Qyo9dxO3VrRQizlslkgTjx+7bLuR/ygkVm6hDnV6F7O
ibdWqnfvNAEKEJ/cvxrbU45V6cTsczMgTrww3tGKkJf+aEr4jaEeOojGGO5pbOaR
br8UEpR7GnhpaHBY/YyTQOSOIo8IYpf9JP1sw1V+IpK43D7eaeekfT3uvnVqelXY
JsCohtROEEYQRWxYRpktkd53/eSypHhaFxassblKSCTXuxG7xXbTXBF8xNkQID5e
t6V9ZTbwt/fNeIw+PUOQoBVNz0QwzHXorJF376/wR2xHH5agfk+Gun3j/K7aSTTO
hOZIkFf9byF5NdyttU2DfOsP3YXH6g==
=tT2r
-----END PGP SIGNATURE-----

--Pq7754Zke+ES0h8H--
