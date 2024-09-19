Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7853397C807
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 12:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73BE10E6C1;
	Thu, 19 Sep 2024 10:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t5VXr1wj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C6810E190;
 Thu, 19 Sep 2024 10:34:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 394C1A43BE1;
 Thu, 19 Sep 2024 10:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E183C4CEC4;
 Thu, 19 Sep 2024 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726742060;
 bh=trYvMAs/Gw/lBCc+f0IDoClnkLEb0Xc1bSVKX8cCUrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t5VXr1wjp45AUjMmUnN5AkGkcGRlD37Gin3198e0//oOK/zuj2wvrhP7YfKf/kqL4
 mAwPZ0MCnwQfoqpv0n4VbDK1L8mzN0uy9F6GP4R8Jo6NKDFzEwW4atH0v7DuPyhDJI
 e3uBWUvnonvJMbVrQfkrDA2JFoiATR+bOFcyxapyBZtor7T2QuOqlKg/CQczFjODa2
 e0RhJKDwiUgk6Rhb6n4lovtVDtIaTTYCz5/YTQZi5+/CCh0TqEn+GOa/J/WDRbdX8w
 BIFEEUUrtKrFU3lukrfqHu9GbSXqlWf088ZKFAnXuXLaperLJ2MvVWLWzrozWPVcvX
 yjQXFzTm+Ff/w==
Date: Thu, 19 Sep 2024 12:34:17 +0200
From: Mark Brown <broonie@kernel.org>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
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
 "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 02/12] spi: intel-dg: implement region enumeration
Message-ID: <Zuv-KTq6WP-7E34Z@finisterre.sirena.org.uk>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-3-alexander.usyskin@intel.com>
 <ZurXI2g00duqMUjo@finisterre.sirena.org.uk>
 <PH7PR11MB7605BC90FB95AC2CE807C86FE5632@PH7PR11MB7605.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PCQlvpyTA31roP2W"
Content-Disposition: inline
In-Reply-To: <PH7PR11MB7605BC90FB95AC2CE807C86FE5632@PH7PR11MB7605.namprd11.prod.outlook.com>
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


--PCQlvpyTA31roP2W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 09:55:54AM +0000, Winkler, Tomas wrote:
> > On Mon, Sep 16, 2024 at 04:49:18PM +0300, Alexander Usyskin wrote:

> > > In intel-dg spi, there is no access to the spi controller, the
> > > information is extracted from the descriptor region.

> > Which information?  I can't tell what this patch is supposed to do; as =
with the
> > first patch this shouldn't be standalone.

> The patch series was built for review, it adds functionality on top of ea=
ch other.=20

That's not worked out well here - like I say I can't tell what the patch
is supposed to be doing.  What information is supposed to be read here,
why?

> > > +static inline u32 spi_error(struct intel_dg_spi *spi) {

> > > +static inline u32 spi_read32(struct intel_dg_spi *spi, u32 address) {

> > At least these names are too generic, please use driver specific prefix=
es.

> Can be done but those functions are local to the driver not part of the A=
PI.

Sure, the issue is that a core API with the same name could reasonably
be added at which point it'll collide with the driver internals.

--PCQlvpyTA31roP2W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbr/igACgkQJNaLcl1U
h9DHLgf+OJ2VWjM3IHaziCQB7VGoBxWzadl4NtdIeLwKT1ypB1ixWiVDyiFlW40H
6vzrQr5PIb04/fUq0ucrwHJrKyQVDn1gEnLRsQR97FfAbOQwsZdcr/W78UnJ8Y76
UuII4bmKE8spbwRIr40BCKaE1GEZppG0hmGy9OMgIcHvauOgwY4tnbVA8uJhVWpj
75lCT/hkIjPV+pjra/+Ktnyykt+ZeJQ0xw3lQ8mQwXNPSaaNwRu+n6xZLSWPxhQc
lDluEthqamN8IctoxNzHBdYsXcAVHCpjydFwUUq+ywmK44UdoRN8Q3coAxqm8VE7
eyUHNuLL+bd6WJqbhzp+M31pazKHQw==
=CHq4
-----END PGP SIGNATURE-----

--PCQlvpyTA31roP2W--
