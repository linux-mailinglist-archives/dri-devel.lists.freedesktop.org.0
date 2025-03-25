Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D238A6EEED
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BB310E53B;
	Tue, 25 Mar 2025 11:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S+2sfBMf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA5B10E540
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 11:09:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3E59BA4A68A;
 Tue, 25 Mar 2025 11:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DF8C4CEE4;
 Tue, 25 Mar 2025 11:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742900962;
 bh=CobmH/0tT3JWCF0SNaF4cBzmKPSqoD1qNh/T1HNEiOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S+2sfBMfnmR8JC0dpPXvhhWNDDavpjxM4l26E2TvzZEqPvR3E9bNTc3jJhflVQGrt
 yxjctszY4G7Mt1u+nhj5FhbV/Ru4GUDCUBVp4XjByEoJq8DfDUaZMlBWBWFxfkzTUJ
 UoPcW8MJU2+Es2tAxSkOXkeAVgaN5iAJXQvQKli3rTYJllPZT6dVasV6TXmE+Pt6o6
 PMpHfCNY/cD4TwoP0KhEOERvp1Y5rIMVy2tK5Ubhm31WmbMs08BxjCTyE8jWr9GrxL
 HZb69P3XabAA/LKlPDNTH37VP8dKzo56fWtJ2nFrDLOk5Jft7qUzWtGxvj2nRs80ST
 99S73U2Hx+LMg==
Date: Tue, 25 Mar 2025 12:09:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: devbrones <jonas.cronholm@protonmail.com>, 
 maarten.lankhorst@linux.intel.com, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/edid: Add non-desktop quirk for Playstation VR
 Headsets with Product ID 0xB403
Message-ID: <20250325-annoying-precise-uakari-6b6438@houat>
References: <20250322122048.28677-1-jonas.cronholm@protonmail.com>
 <875xjxa2rk.fsf@intel.com>
 <20250325-inquisitive-ebony-mouse-bdf185@houat>
 <87pli58jze.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="pz5nibo4epaozvmu"
Content-Disposition: inline
In-Reply-To: <87pli58jze.fsf@intel.com>
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


--pz5nibo4epaozvmu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/edid: Add non-desktop quirk for Playstation VR
 Headsets with Product ID 0xB403
MIME-Version: 1.0

On Tue, Mar 25, 2025 at 12:47:49PM +0200, Jani Nikula wrote:
> On Tue, 25 Mar 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Mar 25, 2025 at 11:16:47AM +0200, Jani Nikula wrote:
> >> On Sat, 22 Mar 2025, devbrones <jonas.cronholm@protonmail.com> wrote:
> >> > This fixes a bug where some Playstation VR Headsets would not be ass=
igned
> >> > the EDID_QUIRK_NON_DESKTOP quirk, causing them to be inaccessible by
> >> > certain software under Wayland.
> >>=20
> >> Please file a bug over at [1], and attach the EDID on that bug, so we
> >> have some clue what's going on.
> >>
> >> [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/new
> >
> > I'd rather have them in the commit log. Nobody uses gitlab issues for
> > drm-misc, and those kind of issues are just lingering around and
> > becoming stale.
>=20
> For this one, it's fine as long as we preserve the raw EDID for
> posterity. Unless the EDID does indicate VR and we need to dig deeper,
> that is.

What I was trying to say is if "posterity" means "a forever open issue
in drm-misc", then no, sorry, that doesn't work for me.

Maxime

--pz5nibo4epaozvmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ+KO2gAKCRAnX84Zoj2+
dsU5AYCGaizukwDkQEQG1RR3QR9GHy/MuKJeY6AUltgq5hCHsaHXBRbBlbIqybM+
WZxBwqIBf3ZcvcQq+0aax2qhHJWpLBh64CC4/I06GVvaPqRNhkFT8Dk2BiUInaee
okpbQcELeQ==
=SVyr
-----END PGP SIGNATURE-----

--pz5nibo4epaozvmu--
