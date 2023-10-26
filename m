Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6BA7D8391
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 15:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1F010E7D8;
	Thu, 26 Oct 2023 13:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E5510E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 13:28:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E9D7A6341B;
 Thu, 26 Oct 2023 13:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69134C433C8;
 Thu, 26 Oct 2023 13:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698326880;
 bh=/gWTu/JrOHR9FyVT82WepFhPqktq0leelGJD0X9fhMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TldR3zSVCodtm0taUOSY1AAQKS6R9kpHkoDxxret+gS3YjOP7NSba6X+c0QpyFRVc
 VK5N8Ztbxg/XlRKW8Rejzv8hmXp4/rYYepCa5HUT6injVbqyvVucUdNd0rqYN4aYPn
 B0xK9/fYaxd4bz7rHH52r5t7dUq6U8k5BYFLlgMmczj3kHtxXDZJumO4f2cRJRNDA8
 w6GLzWRfwVeHF23a43wV3sL+KQazeV+MZnc6YXbPSBNL2AYEHikMWTi07prq7QMp1R
 i5A/D0gt7lqLwoWLwMwRM5WeUPLYRZiVQ1HL0myA1zaX/z8o26kZ75/d/OHMo5/IyW
 jXurMVxbwuhCw==
Date: Thu, 26 Oct 2023 15:27:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: (subset) [PATCH v2] drm/doc: ci: Require more context for flaky
 tests
Message-ID: <jufk7lzskhsz4dc4iiqsuuspno2772yowokw6e75dmrh5jvdt2@g6it5xcsd45k>
References: <20231025142441.745947-1-mripard@kernel.org>
 <169831793153.896759.13985615649031607361.b4-ty@kernel.org>
 <62542ca6-d2c2-4330-8423-3edbdc3b4bd8@collabora.com>
 <22723536-dc2e-4973-984b-1504367d84a0@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ck3gb5dtix2yl5nu"
Content-Disposition: inline
In-Reply-To: <22723536-dc2e-4973-984b-1504367d84a0@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ck3gb5dtix2yl5nu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 09:08:03AM -0300, Helen Koike wrote:
>=20
>=20
> On 26/10/2023 09:01, Helen Koike wrote:
> >=20
> >=20
> > On 26/10/2023 07:58, Maxime Ripard wrote:
> > > On Wed, 25 Oct 2023 16:24:41 +0200, Maxime Ripard wrote:
> > > > Flaky tests can be very difficult to reproduce after the facts, whi=
ch
> > > > will make it even harder to ever fix.
> > > >=20
> > > > Let's document the metadata we agreed on to provide more context to
> > > > anyone trying to address these fixes.
> > > >=20
> > > >=20
> > > > [...]
> > >=20
> > > Applied to drm/drm-misc (drm-misc-next).
> >=20
> > Thanks!
> >=20
> > Could you also apply https://patchwork.kernel.org/project/dri-devel/cov=
er/20231024004525.169002-1-helen.koike@collabora.com/
> > (and the dependencies listed on it).
>=20
> For some reason, commit message 7/10 (drm/ci: increase i915 job timeout to
> 1h30m) looks incomplete in patchwork, but it looks fine in my branch:
>=20
> https://gitlab.freedesktop.org/helen.fornazier/linux/-/commits/for-drm-mi=
sc-wip/
>=20
> Let me know if you prefer that I send it again or if you could pull from =
the
> branch.

It was fine on lore.kernel.org and that's where I'm pulling from, so it all=
 worked out :)

Everything you asked for should be applied now

Maxime

--ck3gb5dtix2yl5nu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTppXgAKCRDj7w1vZxhR
xfYmAQCQxqhXSOsyE80kVCEgqzUiFp1N5+HIcMCguW+EbtKePgEA9A22rLa+LkIe
gZEOivShxGuBG6gfukcYLE9RwgddmwE=
=BQTy
-----END PGP SIGNATURE-----

--ck3gb5dtix2yl5nu--
