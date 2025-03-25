Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B0A7078B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EC010E0BB;
	Tue, 25 Mar 2025 17:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jgosEb7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081FF10E0BB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 17:00:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BA0505C59CE;
 Tue, 25 Mar 2025 16:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C353EC4CEEA;
 Tue, 25 Mar 2025 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742922024;
 bh=fMDCIrknMga52tByCYAzlgDLTGxj2rqO7TMXOqtzQTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jgosEb7TUdFofoFDLjNEd3EDRk6cnWxqTccGPnhqNG6KThpdqe22/0ZCNvKHAqrZ6
 +jMfoUUeKiqp1qdg2lE0wDlndMPhil5VDNBPCOw4823uTyGhCi2uGoh4y6KdRmasL+
 +/+mZcenkT1sTWLI+inIZOcxaBKZCGEdgDHruP2WCqXeXIGlWu8f9bG/S8wWq2ugk6
 Tr/NBzXEIBAZv6xg1GMAv0ajnO7xpQ80yR/r3lmaUG4MBMBc57rzm6RzucVWDD7LrV
 I4DQ0wXi0oJx0eFM29sDvY4U7HAwFxo0sqmqHwxxY+R0+AwHG2LuWNLNtMJWrBtAOx
 wQka+Hbk83u8Q==
Date: Tue, 25 Mar 2025 18:00:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: devbrones <jonas.cronholm@protonmail.com>, 
 maarten.lankhorst@linux.intel.com, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/edid: Add non-desktop quirk for Playstation VR
 Headsets with Product ID 0xB403
Message-ID: <20250325-crouching-benevolent-serval-fd54b8@houat>
References: <20250322122048.28677-1-jonas.cronholm@protonmail.com>
 <875xjxa2rk.fsf@intel.com>
 <20250325-inquisitive-ebony-mouse-bdf185@houat>
 <87pli58jze.fsf@intel.com>
 <20250325-annoying-precise-uakari-6b6438@houat>
 <87h63h884t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vutrervm6fjxn5pl"
Content-Disposition: inline
In-Reply-To: <87h63h884t.fsf@intel.com>
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


--vutrervm6fjxn5pl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/edid: Add non-desktop quirk for Playstation VR
 Headsets with Product ID 0xB403
MIME-Version: 1.0

On Tue, Mar 25, 2025 at 05:03:46PM +0200, Jani Nikula wrote:
> On Tue, 25 Mar 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Mar 25, 2025 at 12:47:49PM +0200, Jani Nikula wrote:
> >> On Tue, 25 Mar 2025, Maxime Ripard <mripard@kernel.org> wrote:
> >> > On Tue, Mar 25, 2025 at 11:16:47AM +0200, Jani Nikula wrote:
> >> >> On Sat, 22 Mar 2025, devbrones <jonas.cronholm@protonmail.com> wrot=
e:
> >> >> > This fixes a bug where some Playstation VR Headsets would not be =
assigned
> >> >> > the EDID_QUIRK_NON_DESKTOP quirk, causing them to be inaccessible=
 by
> >> >> > certain software under Wayland.
> >> >>=20
> >> >> Please file a bug over at [1], and attach the EDID on that bug, so =
we
> >> >> have some clue what's going on.
> >> >>
> >> >> [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/new
> >> >
> >> > I'd rather have them in the commit log. Nobody uses gitlab issues for
> >> > drm-misc, and those kind of issues are just lingering around and
> >> > becoming stale.
> >>=20
> >> For this one, it's fine as long as we preserve the raw EDID for
> >> posterity. Unless the EDID does indicate VR and we need to dig deeper,
> >> that is.
> >
> > What I was trying to say is if "posterity" means "a forever open issue
> > in drm-misc", then no, sorry, that doesn't work for me.
>=20
> I want to check the EDID before we merge the quirk.
>=20
> If the EDID does not indicate VR, we can merge. I want the EDID
> preserved so we can track them down later if we need to drop or modify
> the quirks.
>=20
> If the EDID does indicate VR, either the quirk is unnecessary or there's
> a bug somewhere. This requires further debugging, and we must not merge
> the quirk.

I understand that, but I don't see why putting it in the commit log, or
as a mail reply to the patch is not a good solution for that.

Or why using drm-misc issues for this is a good one.

Maxime

--vutrervm6fjxn5pl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+LhJQAKCRDj7w1vZxhR
xf12AQCkpCIuaInNcgBVfxP39ielwCgnCH71pclDTaqRhvXwQgEAwjtHnvtxboWH
rnnPN9tQza5+KuVRKykQsWBpDDHivQk=
=Gr6x
-----END PGP SIGNATURE-----

--vutrervm6fjxn5pl--
