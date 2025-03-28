Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C9A74DBA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 16:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701BE10EA4E;
	Fri, 28 Mar 2025 15:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VuRO+xID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C9810EA4E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 15:30:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BF9C0614B5;
 Fri, 28 Mar 2025 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D230C4CEE4;
 Fri, 28 Mar 2025 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743175831;
 bh=Jl6uojou14Op0Uf3RkPACc3fPv0mAsQ6t1m1fCsEYuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VuRO+xIDsgl1mScfWOcT1sPjuNDA71B3WBhwI5gQTW9DawJT1Isbu+n/IHTmblmt3
 ay7OSJKzOSeznh1U1qDSDebmGattehbIXtE5qCg9JHxGzfobiPBd071CH29cQqlTyY
 zjUpRXRyAJk8OZam43pWsL0EQ+WuFSfmFr1RytXOjFRvm1YcxtLcq14/0TK4AOrSau
 vOK4AoDkQZe5H8f1mVT2hed61XkTX/5y6TTQlqEF1iKxmGwrkusf8XrL9XfqsZNC/3
 BMqHkxxrSRVQJhE06qitn/uGWe42fhr5OYMTIERf1aQiwqCgNiXjdXJSxcyBi+SXGf
 Ld1ROENcQYtrg==
Date: Fri, 28 Mar 2025 16:30:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/vc4: tests: Document output handling functions
Message-ID: <20250328-brave-pompous-seagull-b0f728@houat>
References: <20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org>
 <20250318-drm-vc4-kunit-failures-v1-2-779864d9ab37@kernel.org>
 <0eae371a-0677-407c-952e-fe49bd6dae6e@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tjtbep4bzdsc3nwc"
Content-Disposition: inline
In-Reply-To: <0eae371a-0677-407c-952e-fe49bd6dae6e@igalia.com>
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


--tjtbep4bzdsc3nwc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] drm/vc4: tests: Document output handling functions
MIME-Version: 1.0

On Sun, Mar 23, 2025 at 03:34:50PM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 18/03/25 11:17, Maxime Ripard wrote:
> > vc4_mock_atomic_add_output() and vc4_mock_atomic_del_output() public but
>=20
> Nit: s/public/are public

Good catch, thanks!

> > aren't documented. Let's provide the documentation.
> >=20
> > In particular, special care should be taken to deal with EDEADLK.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 26 ++++++++++++++++++++=
++++++
> >   1 file changed, 26 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/=
drm/vc4/tests/vc4_mock_output.c
> > index f0ddc223c1f839e8a14f37fdcbb72e7b2c836aa1..577d9a9563696791632aec6=
14c381a214886bf27 100644
> > --- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> > +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> > @@ -59,10 +59,23 @@ struct vc4_dummy_output *vc4_dummy_output(struct ku=
nit *test,
> >   static const struct drm_display_mode default_mode =3D {
> >   	DRM_SIMPLE_MODE(640, 480, 64, 48)
> >   };
> > +/**
> > + * vc4_mock_atomic_add_output() - Enables an output in a state
> > + * @test: The test context object
> > + * @state: Atomic state to enable the output in.
> > + * @type: Type of the output encoder
> > + *
> > + * Adds an output CRTC and connector to a state, and enables them.
> > + *
> > + * Returns:
> > + * 0 on success, a negative error code on failure. If the error is
> > + * EDEADLK, the entire atomic sequence must be restarted. All other
> > + * errors are fatal.
> > + */
> >   int vc4_mock_atomic_add_output(struct kunit *test,
> >   			       struct drm_atomic_state *state,
> >   			       enum vc4_encoder_type type)
> >   {
> >   	struct drm_device *drm =3D state->dev;
> > @@ -103,10 +116,23 @@ int vc4_mock_atomic_add_output(struct kunit *test,
> >   	crtc_state->active =3D true;
> >   	return 0;
> >   }
> > +/**
> > + * vc4_mock_atomic_del_output() - Disables an output in a state
> > + * @test: The test context object
> > + * @state: Atomic state to disable the output in.
> > + * @type: Type of the output encoder
> > + *
> > + * Adds an output CRTC and connector to a state, and disables them.
>=20
> I'm not sure if "Adds" properly expresses what the function does. How
> about "Finds an output CRTC and connector in a state, and disables
> them"?

Yeah, I see what you mean, but it doesn't really work either. The state
is empty before, we do try to find them to add a new state for them in
the global one, and that new state will disable them.

So we can't find them in that state prior to adding them, which is what
this function does.

Maxime

--tjtbep4bzdsc3nwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+bAlAAKCRDj7w1vZxhR
xfSfAP4z2GrXxDxhBaBz6BWIi44gC7iGk3mFwlpeRNv5vbyyVQD8CH7CZYyRbSc7
2iDN+9tTv6XJmS4m+38lDlI+ODt31Qk=
=d0PE
-----END PGP SIGNATURE-----

--tjtbep4bzdsc3nwc--
