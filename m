Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE688088CB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 14:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CD110E8A0;
	Thu,  7 Dec 2023 13:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D5310E8A0;
 Thu,  7 Dec 2023 13:06:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 962F9620D4;
 Thu,  7 Dec 2023 13:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F4FC433C8;
 Thu,  7 Dec 2023 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701954409;
 bh=cdODJaI1yPtS5TrsLt19LYe3ZIYIbuoZRInUdScutck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S0zDgvNSXCq1UFtncuNUEddrExHieQfPP0gVdgteYC0REE7bvePRILczRMqQaR6Uh
 a3dM4+ZMTastgT84A5h6Jd4+6Tgq0zVFN8m1hiQMag+OTApFiZnX1/nZmQvBm1ufya
 U0gYMRqRwIUNza4DGuNw+0ntgMkW7Rismfnb7GgB/FzNIpXVKF8ZI4rGWr9H2SayWI
 VpfInMOEhn1XdILKPK/V6+0Ngwzdh6uUp4uSAL8IGHMPcGJVgYTjJfdPkXeuoQ7p3i
 ACjX3pMXypSX2eqox33enritzJ6OcrPtNh+Bk6O/X2XxesBMmJtuN/HRcob3005l5F
 Ht/5UzhpBGeTw==
Date: Thu, 7 Dec 2023 14:06:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH RESEND AGAIN v2 0/2] Add drm_dbg_ratelimited()
Message-ID: <ufj4jvcynrpvreveh5yzlzscvxip4ec7qhwkskb55bbdbuge3f@qqqbkmwwikp3>
References: <20231206210948.106238-1-andi.shyti@linux.intel.com>
 <yudbwuyc2pbuj744yd53q3kgygeqiaz6fhd7cgkzyjzj6ounkk@q5q6n4zpdh52>
 <ZXGO_KadNq0AML2k@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6nkpyxfqijsadfh3"
Content-Disposition: inline
In-Reply-To: <ZXGO_KadNq0AML2k@ashyti-mobl2.lan>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, John Harrison <John.C.Harrison@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6nkpyxfqijsadfh3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 10:23:08AM +0100, Andi Shyti wrote:
> Hi Thomas and Maxime,
>=20
> thanks for the answer,
>=20
> On Thu, Dec 07, 2023 at 10:10:55AM +0100, Maxime Ripard wrote:
> > On Wed, Dec 06, 2023 at 10:09:46PM +0100, Andi Shyti wrote:
> > > This is the second time I am resending this series in its v2. It
> > > has been reviewd, acked, blessed, discussed, rectified, assessed,
> > > authorized, validated, glorified, praised, demanded, approved,
> > > and yet, I don't understand why no one is merging it.
> >=20
> > $ ./scripts/get_maintainer.pl -f drivers/gpu/drm/i915/
> > Jani Nikula <jani.nikula@linux.intel.com> (supporter:INTEL DRM DRIVERS =
(excluding Poulsbo, Moorestow...)
> > Joonas Lahtinen <joonas.lahtinen@linux.intel.com> (supporter:INTEL DRM =
DRIVERS (excluding Poulsbo, Moorestow...)
> > Rodrigo Vivi <rodrigo.vivi@intel.com> (supporter:INTEL DRM DRIVERS (exc=
luding Poulsbo, Moorestow...)
> > Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> (supporter:INTEL DRM DR=
IVERS (excluding Poulsbo, Moorestow...)
> > David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
> > Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
> > intel-gfx@lists.freedesktop.org (open list:INTEL DRM DRIVERS (excluding=
 Poulsbo, Moorestow...)
> > dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
> > linux-kernel@vger.kernel.org (open list)
> >=20
> > You've Cc'd none of the i915 maintainers, that's why it's been stuck.
> >=20
> > Jani, Joonas, Rodrigo, Tvrtko, could you have a look at this?
>=20
> The main change here is in drm_print.h, though and there is just
> an example of usage in i915. I though this should go through the
> drm branch.
>=20
> Is it OK if I push it in drm-intel-next?

Sure, and you can add my acked-by on the first

Maxime

--6nkpyxfqijsadfh3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXHDZgAKCRDj7w1vZxhR
xfAEAQDfKBJLJYkt8ZlAr68r/ESEIiIfZja8OcKY+/an9tXkoAEA7ILTqMnHvF0u
rlkl7UlwmNKnf8AdQjqnN3uWrX00SwI=
=uhDa
-----END PGP SIGNATURE-----

--6nkpyxfqijsadfh3--
