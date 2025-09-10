Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4480EB5157D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417A410E8E6;
	Wed, 10 Sep 2025 11:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Unew0oVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F013C10E2CE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E5854601A8;
 Wed, 10 Sep 2025 11:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B486C4CEF0;
 Wed, 10 Sep 2025 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757503565;
 bh=wUeNAc2fEuH8FTq46hWFXFIBfl5LUKjn12PIBFgqPmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Unew0oVVo/u8Injo6sBZj3N+shEwsVP0uXYhEibA0dc1s8Z4l0qDvvr4cnxVPGDkF
 DEjzqAewL7LBG+keOgFx1nV2mwanDO4TQCElTYxpmK/I0tElUQU7wGLa30aZ9ZB42g
 l42GbOuZXQWqhcAwobzWvJ15qlpvGV4qeo+qY45GiNYU+SyldNZTwGDU94p6yDPYfx
 NJS/cukQuV3z9BuIGK5ZaULxMeU8cpf7I3hhxGBZQv05S7/EXMf8rjl0eP3Ds36qVQ
 7QVlJEt7qhhEG7CHsAol8s5oiJ2a/ja4bkwuADltgo9wAu2ED/eLBMHhhpq368v6h9
 17Z5XFNQQJfQg==
Date: Wed, 10 Sep 2025 13:26:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
Message-ID: <20250910-magnetic-hot-lizard-cfecd2@houat>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
 <20250909-drm-no-more-existing-state-v3-37-1c7a7d960c33@kernel.org>
 <aMAxEjIJOvxmOj2D@intel.com>
 <3d9058a503d6b852756476490f091e43358c21ba.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="thlrckery7x3nejr"
Content-Disposition: inline
In-Reply-To: <3d9058a503d6b852756476490f091e43358c21ba.camel@crapouillou.net>
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


--thlrckery7x3nejr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 04:45:27PM +0200, Paul Cercueil wrote:
> Hi Ville,
>=20
> Le mardi 09 septembre 2025 =E0 16:52 +0300, Ville Syrj=E4l=E4 a =E9crit=
=A0:
> > On Tue, Sep 09, 2025 at 01:27:56PM +0200, Maxime Ripard wrote:
> > > The ingenic CRTC atomic_enable() implementation will indirectly
> > > call
> > > drm_atomic_get_private_obj_state() through
> > > ingenic_drm_get_priv_state().
> > >=20
> > > drm_atomic_get_private_obj_state() will either return the new state
> > > for
> > > the object in the global state if it exists, or will allocate a new
> > > one
> > > and add it to the global state.
> > >=20
> > > atomic_enable() however isn't allowed to modify the global state.
> > > So
> > > what the implementation should use is the
> > > drm_atomic_get_new_private_obj_state() helper to get the new state
> > > for
> > > the CRTC, without performing an extra allocation.
> > >=20
> > > The ingenic driver has a wrapper around that helper with
> > > ingenic_drm_get_new_priv_state(), so let's use that instead.
> > >=20
> > > Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > >=20
> > > ---
> > > To: Paul Cercueil <paul@crapouillou.net>
> > > Cc: linux-mips@vger.kernel.org
> > > ---
> > > =A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
> > > =A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > index
> > > 05faed933e5619c796f2a4fa1906e0eaa029ac68..a1b641d63fc500dc169d0b0e2
> > > 2f93168c343a242 100644
> > > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > @@ -245,11 +245,11 @@ static void
> > > ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> > > =A0{
> > > =A0	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> > > =A0	struct ingenic_drm_private_state *priv_state;
> > > =A0	unsigned int next_id;
> > > =A0
> > > -	priv_state =3D ingenic_drm_get_priv_state(priv, state);
> > > +	priv_state =3D ingenic_drm_get_new_priv_state(priv, state);
> > > =A0	if (WARN_ON(IS_ERR(priv_state)))
> >=20
> > get_new_state() will never return an error pointer. It's either
> > a valid pointer or NULL.
>=20
> Good catch.

Yeah, thanks.

> > To me it looks like this could potentially be NULL here as the
> > get_pvi_state() call is done from the plane .atomic_check()
> > whereas this gets called for the crtc. So if the plane is
> > disabled there might not be any private state included in the
> > commit.
> >=20
> > Not sure how this driver/hardware is supposed to work so not
> > sure what the proper fix for that is...
>=20
> Would it be just a matter of calling drm_atomic_get_private_obj_state()
> in the crtc's .atomic_check() to make sure the object is created?

It's really not clear to me what that private object stores in the first
place. It looks like it's about toggling a bit in the crtc DMA
descriptors, but it's only set by planes?

Can you expand a bit on the hw design and why you're using a private
object to store that?

Maxime

--thlrckery7x3nejr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMFgSgAKCRAnX84Zoj2+
diJRAX9fcpba9/W+SMbpLJe4gnHyqcWysphVT9iElaJ5QNlFFttPf7cLEqI1+m1z
iFNZzaYBgO//Llh0Llyawy4DiqGxShBh8CPsjK7fEqsFNtT06bcLFq/m0He6c03/
pjb2rSqgrw==
=yhcu
-----END PGP SIGNATURE-----

--thlrckery7x3nejr--
