Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5834985D82
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 15:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8EF10E831;
	Wed, 25 Sep 2024 13:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rpai7kFb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D0F10E0CD;
 Wed, 25 Sep 2024 13:12:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EBFD65C5D54;
 Wed, 25 Sep 2024 13:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B5AC4CEC3;
 Wed, 25 Sep 2024 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727269977;
 bh=OIMDdFTlJsnASVoAp+EsACgQsHVl7LYIUb3s9QES22A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rpai7kFbFqJK/A+vqcqiNbzZxs0SldalIRrJJmUA9Yrc9qDKst6yf4d6o2YvgNZ2J
 f2E46JrVHU2bKSaHqSOMWNrmar8Jlloba+dyEEoEslAuxAdqL8rjSe2S8ELqQuz2Ar
 8uHw1dg9ET4dgRa92IbAhmZ6cxtwsHNFQ6qSBtmmP+idnXaWsP0S9y19RH2/IfvMNs
 Sv0KQJV7tUKvwzaoqkEAI0WJDcNKxGR8OwDkH2tkneJozns29Rbtwbg16mGzzpjtII
 XCINibq//ur9JlBWBMYb+q1CJsBnv2eUkU3NgSD1Z/NplIN6nVfjX+xNTEcgJPmFzg
 wKYQ6D1lLkOug==
Date: Wed, 25 Sep 2024 15:12:53 +0200
From: Mark Brown <broonie@kernel.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Winkler, Tomas" <tomas.winkler@intel.com>,
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
Message-ID: <ZvQMVeO4ACk5BNT1@finisterre.sirena.org.uk>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-2-alexander.usyskin@intel.com>
 <ZurWk_eXSQndgA4Y@finisterre.sirena.org.uk>
 <PH7PR11MB76057D2326D436CA9749A113E5632@PH7PR11MB7605.namprd11.prod.outlook.com>
 <Zuv9qsWJQhx7rbhJ@finisterre.sirena.org.uk>
 <PH7PR11MB760505A11C7A41DAB0359184E56D2@PH7PR11MB7605.namprd11.prod.outlook.com>
 <ZvFj1zyzSYmbNwmH@finisterre.sirena.org.uk>
 <CY5PR11MB6366C8C6AB07CFEAC20323F1ED692@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IxLYBwv9klWVSM8K"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366C8C6AB07CFEAC20323F1ED692@CY5PR11MB6366.namprd11.prod.outlook.com>
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


--IxLYBwv9klWVSM8K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 25, 2024 at 12:31:34PM +0000, Usyskin, Alexander wrote:

> > It's locking/refcounting stuff that looks nothing like any other SPI
> > controller driver.  Even if it works it's obviously fragile since the
> > driver does surprising things which break assumptions that will be made
> > by people not looking at this specific driver, and causes people to have
> > to spend more effort figuring out what you're doing.  If there is any
> > benefit to doing this then open coding it in one specific driver is
> > clearly not the right place to do it.

> The reason for all this refcounting that the device itself is discrete card and
> the SPI memory backend can disappear at any moment leaving open connections dangling.
> Refcount ensures that object behind the MTD device will be freed only
> when the last user-space is disconnected.

> Is there any other model that can keep the object alive in this situation?

If devices connected to the SPI controller can be hotplugged then those
devices should be registered and unregistered like any other spi_device
would be, the driver core and relevant subsystems will deal with the
lifetime issues.  This is all invisible to the SPI controllers, the fact
that things are being open coded in the driver should be a big warning
sign.

--IxLYBwv9klWVSM8K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb0DFQACgkQJNaLcl1U
h9DEjAf/SC1Qnce4ii9z5NTgI51Ab3JxA+Hpd+Z77geEqUhtXlgSSAuXqgD/LKV1
iUxsI88Kuio6T0Lz/aQggw7O013vRdDteKwc24O1QN4EZU7XUEpDxZould5tZNT1
2QU4ALZjCmukRxO9f9Kztzrnqwc6q198uTpZ8OImX88+AaJLnJYiYlOmWE5mIquV
b6vo5T3SCpZ1w2SSoTRD15pgmKsNfkeErx1XKaRLILFW54Nixc62t5yY+vy9l+9N
p3jlZlQB3w/iHKMmsQCq5EEoFoO73AClsyRadGK25wbAVRDpCxzAWEvVHR0OSJbn
fHRwpLhklHU+xwrEBTkBbLhdlUl5Og==
=U0pV
-----END PGP SIGNATURE-----

--IxLYBwv9klWVSM8K--
