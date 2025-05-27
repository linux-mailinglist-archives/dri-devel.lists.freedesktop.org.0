Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88402AC52A5
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 18:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0BF10E17B;
	Tue, 27 May 2025 16:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DdDdvhdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F9010E193
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 16:06:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6BC7A5C060A;
 Tue, 27 May 2025 16:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE95C4CEED;
 Tue, 27 May 2025 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748361979;
 bh=fhnpy/PYcHEwPlpDVydVWjvf/DFa7I6kqd+DrbMW9HA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DdDdvhdl9/WhALce1PvLBmS1u06oCNqHo4C0LhFURX+uCMKDsSKDEWA9HYUjD4PHD
 b+ap64mjxk50hj4TuCL1/9+0ZI7s0FQqKGl0gJGoxZh/paZm9Z2dMCUzUu+mccXC5I
 P9k8WEvtzyItIvWj0Gtyv/ZZ5HGC6Gp/3KxaSI7hOx3HeBr6sjVgi+G2m98bBhTVd4
 ekfvvJ3ruqpVHIiRk3TJI/EEPFIukiDv3xgtXrSvevoiz6M4NbCrJ9PZmV1jyYiLxo
 luMSEb4AUsV5pS7EuZtQ7s2o2aFBMg2H6lqx8OqslM3FoGa0PEcRzjhbBN1SZtiGNh
 NXEnRzsNQsSsA==
Date: Tue, 27 May 2025 18:06:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] drm/tests: bridge: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250527-light-classic-raptor-d81327@houat>
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
 <20250516-drm-bridge-alloc-doc-test-v8-1-7e356fd58ba5@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wuleouispyfh5nea"
Content-Disposition: inline
In-Reply-To: <20250516-drm-bridge-alloc-doc-test-v8-1-7e356fd58ba5@bootlin.com>
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


--wuleouispyfh5nea
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 1/3] drm/tests: bridge: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Fri, May 16, 2025 at 06:48:37PM +0200, Luca Ceresoli wrote:
> Use the new DRM bridge allocation API, which is the only supported now, f=
or
> the kunit tests.
>=20
> This change is more massive than for the typical DRM bridge driver because
> struct drm_bridge_init_priv currently embeds a struct drm_bridge, which is
> not supported anymore. We new have to use devm_drm_bridge_alloc() to
> dynamically allocate a "private driver struct", which is a bit awkward he=
re
> because there is no real bridge driver. Thus let's add a "dummy" DRM brid=
ge
> struct to represent it.
>=20
> As a nice cleanup we can now move the enable_count and disable_count
> members, which are counting bridge-specific events, into the new "private
> driver struct" (and avoid adding new unnecessary indirections).
>=20
> Also add a trivial bridge_to_dummy_bridge() just like many drivers do.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v8.
> ---
>  drivers/gpu/drm/tests/drm_bridge_test.c | 95 +++++++++++++++++++--------=
------
>  1 file changed, 55 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/te=
sts/drm_bridge_test.c
> index ff88ec2e911c9cc9a718483f09d4c764f45f991a..f3a625c536f610dc8560b5653=
1056df7c613f564 100644
> --- a/drivers/gpu/drm/tests/drm_bridge_test.c
> +++ b/drivers/gpu/drm/tests/drm_bridge_test.c
> @@ -10,31 +10,45 @@
> =20
>  #include <kunit/test.h>
> =20
> +/*
> + * Mimick the typical struct defined by a bridge driver, which embeds a
> + * bridge plus other fields.
> + *
> + * Having at least one member before @bridge ensures we test non-zero
> + * @bridge offset.
> + */
> +struct dummy_drm_bridge {
> +	unsigned int enable_count;
> +	unsigned int disable_count;
> +	struct drm_bridge bridge;
> +};
> +

If we want to remain consistent with the rest of the names, I guess
drm_bridge_priv would be a better choice.

>  struct drm_bridge_init_priv {
>  	struct drm_device drm;
>  	struct drm_plane *plane;
>  	struct drm_crtc *crtc;
>  	struct drm_encoder encoder;
> -	struct drm_bridge bridge;
> +	struct dummy_drm_bridge *test_bridge;
>  	struct drm_connector *connector;
> -	unsigned int enable_count;
> -	unsigned int disable_count;
>  };
> =20
> +static struct dummy_drm_bridge *bridge_to_dummy_bridge(struct drm_bridge=
 *bridge)

bridge_to_priv

> +{
> +	return container_of(bridge, struct dummy_drm_bridge, bridge);
> +}
> +
>  static void drm_test_bridge_enable(struct drm_bridge *bridge)
>  {
> -	struct drm_bridge_init_priv *priv =3D
> -		container_of(bridge, struct drm_bridge_init_priv, bridge);
> +	struct dummy_drm_bridge *dummy_br =3D bridge_to_dummy_bridge(bridge);

and priv for the variable name is enough here too.

> =20
> -	priv->enable_count++;
> +	dummy_br->enable_count++;
>  }
> =20
>  static void drm_test_bridge_disable(struct drm_bridge *bridge)
>  {
> -	struct drm_bridge_init_priv *priv =3D
> -		container_of(bridge, struct drm_bridge_init_priv, bridge);
> +	struct dummy_drm_bridge *dummy_br =3D bridge_to_dummy_bridge(bridge);
> =20
> -	priv->disable_count++;
> +	dummy_br->disable_count++;
>  }
> =20
>  static const struct drm_bridge_funcs drm_test_bridge_legacy_funcs =3D {
> @@ -45,19 +59,17 @@ static const struct drm_bridge_funcs drm_test_bridge_=
legacy_funcs =3D {
>  static void drm_test_bridge_atomic_enable(struct drm_bridge *bridge,
>  					  struct drm_atomic_state *state)
>  {
> -	struct drm_bridge_init_priv *priv =3D
> -		container_of(bridge, struct drm_bridge_init_priv, bridge);
> +	struct dummy_drm_bridge *dummy_br =3D bridge_to_dummy_bridge(bridge);
> =20
> -	priv->enable_count++;
> +	dummy_br->enable_count++;
>  }
> =20
>  static void drm_test_bridge_atomic_disable(struct drm_bridge *bridge,
>  					   struct drm_atomic_state *state)
>  {
> -	struct drm_bridge_init_priv *priv =3D
> -		container_of(bridge, struct drm_bridge_init_priv, bridge);
> +	struct dummy_drm_bridge *dummy_br =3D bridge_to_dummy_bridge(bridge);
> =20
> -	priv->disable_count++;
> +	dummy_br->disable_count++;
>  }
> =20
>  static const struct drm_bridge_funcs drm_test_bridge_atomic_funcs =3D {
> @@ -102,6 +114,10 @@ drm_test_bridge_init(struct kunit *test, const struc=
t drm_bridge_funcs *funcs)
>  	if (IS_ERR(priv))
>  		return ERR_CAST(priv);
> =20
> +	priv->test_bridge =3D devm_drm_bridge_alloc(dev, struct dummy_drm_bridg=
e, bridge, funcs);
> +	if (IS_ERR(priv->test_bridge))
> +		return ERR_CAST(priv->test_bridge);
> +
>  	drm =3D &priv->drm;
>  	priv->plane =3D drm_kunit_helper_create_primary_plane(test, drm,
>  							    NULL,
> @@ -125,9 +141,8 @@ drm_test_bridge_init(struct kunit *test, const struct=
 drm_bridge_funcs *funcs)
> =20
>  	enc->possible_crtcs =3D drm_crtc_mask(priv->crtc);
> =20
> -	bridge =3D &priv->bridge;
> +	bridge =3D &priv->test_bridge->bridge;
>  	bridge->type =3D DRM_MODE_CONNECTOR_VIRTUAL;
> -	bridge->funcs =3D funcs;
> =20
>  	ret =3D drm_kunit_bridge_add(test, bridge);
>  	if (ret)
> @@ -173,7 +188,7 @@ static void drm_test_drm_bridge_get_current_state_ato=
mic(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> =20
>  retry_commit:
> -	bridge =3D &priv->bridge;
> +	bridge =3D &priv->test_bridge->bridge;
>  	bridge_state =3D drm_atomic_get_bridge_state(state, bridge);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bridge_state);
> =20
> @@ -228,7 +243,7 @@ static void drm_test_drm_bridge_get_current_state_leg=
acy(struct kunit *test)
>  	 * locking. The function would return NULL in all cases anyway,
>  	 * so we don't really have any concurrency to worry about.
>  	 */
> -	bridge =3D &priv->bridge;
> +	bridge =3D &priv->test_bridge->bridge;
>  	KUNIT_EXPECT_NULL(test, drm_bridge_get_current_state(bridge));
>  }
> =20
> @@ -253,7 +268,7 @@ static void drm_test_drm_bridge_helper_reset_crtc_ato=
mic(struct kunit *test)
>  	struct drm_modeset_acquire_ctx ctx;
>  	struct drm_bridge_init_priv *priv;
>  	struct drm_display_mode *mode;
> -	struct drm_bridge *bridge;
> +	struct dummy_drm_bridge *dummy_br;

and bridge_priv here.

The rest looks good
Maxime

--wuleouispyfh5nea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDXi+AAKCRAnX84Zoj2+
dtRQAYDbjcMaz/8a550fi6QrsmkycaBeqok8lCpS4EJHUCa65ELnuaOeziWPUXSd
t+ioaMEBgI4d1Ql+qCvefbH9zjs3Kkq12Z72QFk7GqUPV1nhjMp2f6k78btttSf7
HhKh2tDiew==
=WOE7
-----END PGP SIGNATURE-----

--wuleouispyfh5nea--
