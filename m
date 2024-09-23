Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F6097EBB5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 14:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF6110E3F2;
	Mon, 23 Sep 2024 12:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sst8rmym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E88110E260;
 Mon, 23 Sep 2024 12:49:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 53AFDA41B78;
 Mon, 23 Sep 2024 12:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287D7C4CEC4;
 Mon, 23 Sep 2024 12:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727095774;
 bh=RN6cjzHoWo7KzeRWo61xbecp6Jcoh0ocYmVzmQxu00s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sst8rmym1KIpZMVpE922IY6DCc92c9SKEyh32z3FChhDrHzEjbGGx5ElG0aFTEoKO
 aWxoys4vBUlsffvSINxEFrvXvAKlReionrFgc77eCTtR5kF13ybMuo7ISnDKUblHUa
 YN8ZTvhQ+iySyZ8vd53HuK5YSKqMz/Ac2hHw1CDduijlWruv5UlEaXa1PtgQtkgnyn
 xiFwLzEUI39EZSdaCeVJzRnJ8C4UuFlDos15YCBbzHgt3u0o6S/1RsrmU9i32MrK/9
 AtT9PnO4qEhUk9K/SnB2vk0u33aX8TSv310RMdQ+IPxbjmJLQ98qDdTk0buLqGDzRp
 C9T9J3TTfcb3Q==
Date: Mon, 23 Sep 2024 14:49:27 +0200
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
Subject: Re: [PATCH v6 01/12] spi: add driver for intel graphics on-die spi
 device
Message-ID: <ZvFj1zyzSYmbNwmH@finisterre.sirena.org.uk>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-2-alexander.usyskin@intel.com>
 <ZurWk_eXSQndgA4Y@finisterre.sirena.org.uk>
 <PH7PR11MB76057D2326D436CA9749A113E5632@PH7PR11MB7605.namprd11.prod.outlook.com>
 <Zuv9qsWJQhx7rbhJ@finisterre.sirena.org.uk>
 <PH7PR11MB760505A11C7A41DAB0359184E56D2@PH7PR11MB7605.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6k/Yl5pMjIb7rFw2"
Content-Disposition: inline
In-Reply-To: <PH7PR11MB760505A11C7A41DAB0359184E56D2@PH7PR11MB7605.namprd11.prod.outlook.com>
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


--6k/Yl5pMjIb7rFw2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 21, 2024 at 01:00:52PM +0000, Winkler, Tomas wrote:
> > On Thu, Sep 19, 2024 at 09:54:24AM +0000, Winkler, Tomas wrote:
> > > > On Mon, Sep 16, 2024 at 04:49:17PM +0300, Alexander Usyskin wrote:

> > Just do normal open coded allocations, the reference counting is just
> > obscure.

> The kref here is for reason so we don't need to hunt the close open, I fr=
ankly don't understand
> what is wrong with it,=20

It's locking/refcounting stuff that looks nothing like any other SPI
controller driver.  Even if it works it's obviously fragile since the
driver does surprising things which break assumptions that will be made
by people not looking at this specific driver, and causes people to have
to spend more effort figuring out what you're doing.  If there is any
benefit to doing this then open coding it in one specific driver is
clearly not the right place to do it.

> > > > > +static void intel_dg_spi_remove(struct auxiliary_device *aux_dev=
) {
> > > > > +	struct intel_dg_spi *spi =3D dev_get_drvdata(&aux_dev->dev);

> > > > > +	if (!spi)
> > > > > +		return;

> > > > > +	dev_set_drvdata(&aux_dev->dev, NULL);

> > > > If the above is doing anything there's a problem...
> > o
> > > It makes sure the data is set to NULL.

> > Which is needed because...?

> This is a boilerplate part, the content is consequent patches.=20

Which would come back to the issues created by the random splitting of
the series were it not for the fact that if anything tries to look at
the driver data of a removed device it's buggy, the reference is gone
and the device may have been deallocated and it's certainly freed from
the perspective of this user.  Notice how other drivers don't do this.
The driver core will also overwrite the driver data of released
devices...

At a high level a lot of the issues with this series is that both in
terms of how it's been sent and what it's doing there's a bunch of
things that look nothing like how we normally handle things.  At best
this means that problems are being solved at the wrong level, but it's
hard to see that this is the case.

--6k/Yl5pMjIb7rFw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbxY9AACgkQJNaLcl1U
h9BFsAf/ehMj/p+H4ADxV87IKVdY07z0di6q7euT4MTbH/WOB6XOKpN1Oj1FHsSB
v1VhH+buYMk50UT6BKOTtL3naCweQGxZPGrbmwj8ny1ge1MGVMNyZDKuAIZciO+O
M7fqs6fzTHSsxO97j7Rtw8FponO3u3rifubo1K2+zNiPfhqdJo2B+L5AcLkFbpyn
ysP7QDcEC1Nljp5BwYr2iVPynGEHHU8ZI2Ql+F504yOcYLOAJZAm38FJogVct1x9
z2kTT2na9/or4xAvarDW/4OnALdrV+Zrmq4wvQ5BqimyDz3UciBgIfxzyGxj7CUy
1c5xIQ9lVIVLndjsAzj6oKcPNTBmqA==
=OAaN
-----END PGP SIGNATURE-----

--6k/Yl5pMjIb7rFw2--
