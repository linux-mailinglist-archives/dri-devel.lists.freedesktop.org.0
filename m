Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5EEAF6C95
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 10:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6037810E7E7;
	Thu,  3 Jul 2025 08:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lSGgorJH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDCA10E7E7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 08:16:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDAB15C5AD6;
 Thu,  3 Jul 2025 08:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A4BC4CEEE;
 Thu,  3 Jul 2025 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751530571;
 bh=YnaamuzunNzzeN0I+lf1KDJOUZP5jsYMg30vKpS7EAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lSGgorJHfDQozzVwYACb1QSdkyfSjblxRKVesP//XUBayx293Ci40H5vR965jZlW7
 qNRagdf78hY69xthX2oyvxiMzAu5+F6m85ieKFsei4bUlIIrOzkBXDySc7rNXiTMcY
 vmWsQk9f+qujoYyq+fH3dlp+y4NRYZRCyxmS4MRLUxJOD7bfRBW73GkqjkSJDcZ6qF
 CKfvdOjUKCgARUms7v/6tyQE6tkGie4gxFrPm2pCJ7kXT8STLu3dGzeKVQ9AkqJrsW
 RnYvlI6IvkKseNboZ+uE2sogldN114BjmYkFrV+9k0R+RtLYPrXnEqNeCWa2fIeGK7
 vBJLvys8bLzYQ==
Date: Thu, 3 Jul 2025 10:16:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, dri-devel@lists.freedesktop.org, 
 lumag@kernel.org, Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
Message-ID: <20250703-passionate-peacock-of-grandeur-5dae71@houat>
References: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
 <20250630-venomous-sheep-of-control-dece32@houat>
 <CAFEp6-3UVNfHo3s1MOXw88bAMVh=3QzF7H2N2UoVXyV6R3BBpw@mail.gmail.com>
 <20250630-angelic-macaque-of-spirit-fadc59@houat>
 <CAFEp6-2N4G0J+Fmke369t7zsnHDpi4zPuRx_Xn-hXAWN7URoJA@mail.gmail.com>
 <77a6722549f3bb5d5e22a11762bf55bf16935e85@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2qorqnwrencuob3g"
Content-Disposition: inline
In-Reply-To: <77a6722549f3bb5d5e22a11762bf55bf16935e85@intel.com>
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


--2qorqnwrencuob3g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
MIME-Version: 1.0

On Tue, Jul 01, 2025 at 11:56:23AM +0300, Jani Nikula wrote:
> On Tue, 01 Jul 2025, Loic Poulain <loic.poulain@oss.qualcomm.com> wrote:
> > On Mon, Jun 30, 2025 at 10:40=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org> wrote:
> >>
> >> On Mon, Jun 30, 2025 at 09:46:40AM +0200, Loic Poulain wrote:
> >> > Hi Maxime,
> >> >
> >> > On Mon, Jun 30, 2025 at 9:07=E2=80=AFAM Maxime Ripard <mripard@kerne=
l.org> wrote:
> >> > > On Sun, Jun 29, 2025 at 04:38:36AM +0200, Loic Poulain wrote:
> >> > > > DRM checks EDID block count against allocated size in drm_edid_v=
alid
> >> > > > function. We have to allocate the right EDID size instead of the=
 max
> >> > > > size to prevent the EDID to be reported as invalid.
> >> > > >
> >> > > > Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid m=
ore")
> >> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >> > > > ---
> >> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
> >> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> > > >
> >> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers=
/gpu/drm/bridge/analogix/anx7625.c
> >> > > > index 8a9079c2ed5c..5a81d1bfc815 100644
> >> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >> > > > @@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid=
_read(struct anx7625_data *ctx)
> >> > > >               return NULL;
> >> > > >       }
> >> > > >
> >> > > > -     ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, FOUR_BLO=
CK_SIZE);
> >> > > > +     ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, edid_num=
 * ONE_BLOCK_SIZE);
> >> > > >       kfree(edid_buf);
> >> > >
> >> > > Do we need to cache the whole EDIDs? AFAIU, it's only ever used to=
 get
> >> > > the manufacturer name, which fits into a u32 / 4 u8. We should pro=
bably
> >> > > just cache that.
> >> >
> >> > While the cached EDID is indeed used internally to retrieve the
> >> > product ID, its content is also returned via the DRM read_edid
> >> > callback. This value is then used by the DRM core to enumerate
> >> > available display modes, and likely also when reading EDID from sysf=
s.
> >>
> >> You still don't need to allocate and store a copy of the EDIDs in your
> >> driver to implement what you listed so far.
> >
> > Right, we could change how the driver behaves on callback and just
> > cache what we need for internal usage. That change was initially a
> > pure fix, do you recommend changing all of this in this change, or in
> > a follow-up one.
>=20
> If there's a follow-up, I really *really* think it should be to rewrite
> EDID reading in anx7625.c altogether. The current thing is busted in
> more ways than I have time to enumerate right now. And it's not because
> I'm in a huge rush. Just look at sp_tx_edid_read() and the functions it
> calls.
>=20
> The end result should be based on providing a straightforward read_block
> callback for drm_edid_read_custom().
>=20
> I've actually started this a few times myself, but it's a bit much for
> someone without the hardware to test it, nor skin in the game. The
> current code is too complex to trivially refactor.

Given the extent of Jani's suggested rework, I'm fine with doing it as a
follow-up.

Maxime

--2qorqnwrencuob3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGY8SAAKCRAnX84Zoj2+
dsDTAYDMBvkRJb5p4f4KOMCPbOgqlMHZKgOHk4jq6uLI/uEk9X+KAxasdnkCjFmZ
uWt4tngBfjHJHTjlDrtRY1v8QbVo/YCjN/wWvZ6tdibOq9DxEo+S6HaN4P/dl9RY
qo3XBXE1/w==
=pDH5
-----END PGP SIGNATURE-----

--2qorqnwrencuob3g--
