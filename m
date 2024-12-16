Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 595B99F337A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E11410E6AF;
	Mon, 16 Dec 2024 14:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d/EnnraE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8461810E6AF;
 Mon, 16 Dec 2024 14:47:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BD8A5C55D7;
 Mon, 16 Dec 2024 14:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BB8C4CED0;
 Mon, 16 Dec 2024 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734360446;
 bh=JQufBhYNhvxemBcGpIoxhHbHqphKAzJDmPsAsEkOhew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d/EnnraE9mjVdIfzyMutxmv6JeMj6ZZa2SM1/70AWS9R01elsduJ/hUY0EoG+oofQ
 /srgzi19y3pk0rUrLhWAbg/oeX9zUC/p1RRS1FYkR0g1CNJn1Nplcf6DUh6U6W+Z+X
 8zVp3nNfjHYqb6TjOKc4EXf0sZO7Q5baDuZYyu4nCZLKlx4XCxDi/Yuq8J+USAXTX1
 cxK80wiaw09FupuVy4ihLq64CoNO/88J/T1UBio85uOkJhBsThegelr2RK+VAy0Qxf
 cm/pRpM8wGueJiBuDnxN9OQPq11x7bVl/jDW/Rmd1DS8zH+XUJqVj9XztwkT+5ZRXX
 uDt9oNACU/uCA==
Date: Mon, 16 Dec 2024 15:47:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_abhinavk@quicinc.com,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 02/22] drm: Add valid clones check
Message-ID: <20241216-elated-vagabond-numbat-14fe8f@houat>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>
 <20240925-hasty-bald-caribou-eedbf5@houat>
 <80d08449-71de-4a7f-8b2a-8af565d8d701@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bbi22kupiprxbtcg"
Content-Disposition: inline
In-Reply-To: <80d08449-71de-4a7f-8b2a-8af565d8d701@quicinc.com>
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


--bbi22kupiprxbtcg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 02/22] drm: Add valid clones check
MIME-Version: 1.0

On Fri, Dec 06, 2024 at 04:48:43PM -0800, Jessica Zhang wrote:
> On 9/25/2024 12:23 AM, Maxime Ripard wrote:
> > On Tue, Sep 24, 2024 at 03:59:18PM GMT, Jessica Zhang wrote:
> > > Check that all encoders attached to a given CRTC are valid
> > > possible_clones of each other.
> > >=20
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/drm_atomic_helper.c | 23 +++++++++++++++++++++++
> > >   1 file changed, 23 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/dr=
m_atomic_helper.c
> > > index 43cdf39019a4..cc4001804fdc 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -574,6 +574,25 @@ mode_valid(struct drm_atomic_state *state)
> > >   	return 0;
> > >   }
> > > +static int drm_atomic_check_valid_clones(struct drm_atomic_state *st=
ate,
> > > +					 struct drm_crtc *crtc)
> > > +{
> > > +	struct drm_encoder *drm_enc;
> > > +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state=
(state,
> > > +									  crtc);
> > > +
> > > +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_m=
ask) {
> > > +		if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=3D
> > > +		    crtc_state->encoder_mask) {
> > > +			DRM_DEBUG("crtc%d failed valid clone check for mask 0x%x\n",
> > > +				  crtc->base.id, crtc_state->encoder_mask);
> > > +			return -EINVAL;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   /**
> > >    * drm_atomic_helper_check_modeset - validate state object for mode=
set changes
> > >    * @dev: DRM device
> > > @@ -745,6 +764,10 @@ drm_atomic_helper_check_modeset(struct drm_devic=
e *dev,
> > >   		ret =3D drm_atomic_add_affected_planes(state, crtc);
> > >   		if (ret !=3D 0)
> > >   			return ret;
> > > +
> > > +		ret =3D drm_atomic_check_valid_clones(state, crtc);
> > > +		if (ret !=3D 0)
> > > +			return ret;
> > >   	}
> >=20
> > Pretty much the same comment, we should have kunit tests for this.
>=20
> Hey Maxime,
>=20
> I'm working on the kunit test for this and had a question on the design f=
or
> the unit test:
>=20
> Since this is a static helper that returns a pretty common error code, how
> would you recommend going about making sure that
> `drm_atomic_check_valid_clones()` specifically is returning the error (and
> not a different part of check_modeset) when testing the check_valid_clone=
s()
> failure path?

There's two ways to go about it. Either you can unit test it, prepare a
series of custom states and use
EXPORT_SYMBOL_FOR_TESTS_ONLY/EXPORT_SYMBOL_IF_KUNIT, or you can go the
integration test way and just test that drm_atomic_check is rejected for
unsafe combinations.

I guess I'd prefer the former, but the latter also makes sense and
eventually, it checks what we want: to make sure that we reject such a
state. What part of the code does or with what error code is less
important imo.

Maxime

--bbi22kupiprxbtcg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2A9dAAKCRAnX84Zoj2+
dvOyAYCJ4MTDUUUPjeWVnpgIpqjsSEwawghU1myFJzpEbTpc94o9ACzrWCGWDmrQ
w7jb6WsBfRa5TaXfLn7f5pbM7JonoSiDpJxURO/cLrxjGLw/MLU1eum1wk0zjKGS
hcULQUGaAw==
=wlD1
-----END PGP SIGNATURE-----

--bbi22kupiprxbtcg--
