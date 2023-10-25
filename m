Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D147D706C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CCA10E5BA;
	Wed, 25 Oct 2023 15:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3162C10E5BA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 15:09:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9501761C06;
 Wed, 25 Oct 2023 15:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14098C433C7;
 Wed, 25 Oct 2023 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698246569;
 bh=W6eMqmJu2i7+X5vCTerZzPjRq4mMj0LGLTibg6/IZD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dyItO9VLHyCkWPMcRChCS1/lN+7HBseB2qoeYTNq5ZkAhJEg6a8NRg5be+pRQGqng
 GqBaLq3VyaBHWvcGm/uOj9p3m4Ni6mxD5PZ+MZveZ605GcfqIkuhFF32iuo4jVKQrF
 McUeUcDn9AXRWz73wAGflD/QgRDF43oeV8ZuhVlTsjd6Hib70gUH5RUNvaJZZFrm6g
 Vtqcr+4EtmcVsGKvB3PYNo7h05vFDSUTVZZyMEZ7OzYcJNaZNiKEsB6+NjQ6iCdQ6d
 oDzr6bLfF06xqkhBjGUvXVojh5M6MLHmsAiIQsnxPENzcxUziW4iYPuAyLNOQZ+Kkz
 koGYyBMohnWOQ==
Date: Wed, 25 Oct 2023 17:09:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH v2 09/11] drm/tests: Add test for drm_framebuffer_free()
Message-ID: <cudx6xhcsdfgtpa2ko76ourrbfdjhbhtzcyp7fajrjl7rj2ruj@e2g4vc3qlnyl>
References: <20231024191002.1620-1-gcarlos@disroot.org>
 <20231024191002.1620-10-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="go4ixvpyy45y4xvl"
Content-Disposition: inline
In-Reply-To: <20231024191002.1620-10-gcarlos@disroot.org>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--go4ixvpyy45y4xvl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 04:10:00PM -0300, Carlos Eduardo Gallo Filho wrote:
> Add a single KUnit test case for the drm_framebuffer_free function.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
> v2:
>   - Reorder kunit cases alphabetically.
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 49 ++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index eedd5e920279..dbe412d0dca4 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -602,10 +602,59 @@ static void drm_test_framebuffer_init(struct kunit =
*test)
>  	drm_framebuffer_cleanup(&fb1);
>  }
> =20
> +static void destroy_free_mock(struct drm_framebuffer *fb)
> +{
> +	struct drm_framebuffer_test_priv *priv =3D container_of(fb->dev, typeof=
(*priv), dev);
> +	int *buffer_freed =3D priv->private;
> +	*buffer_freed =3D 1;
> +}

Yeah, definitely not a fan of a pointer being used for multiple things
depending on the caller.

Just add another boolean to drm_framebuffer_test_priv, that way it will
be obvious to anyone, and it will be simpler if we ever rework that part
of the tests.

> +static struct drm_framebuffer_funcs framebuffer_funcs_free_mock =3D {
> +	.destroy =3D destroy_free_mock,
> +};
> +
> +static void drm_test_framebuffer_free(struct kunit *test)

I'm sure you get the idea now :)

> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_device *dev =3D &priv->dev;
> +	struct drm_mode_object *obj;
> +	struct drm_framebuffer fb =3D {
> +		.dev =3D dev,
> +		.funcs =3D &framebuffer_funcs_free_mock,
> +	};
> +	int buffer_freed =3D 0;
> +	int id, ret;
> +
> +	priv->private =3D &buffer_freed;
> +
> +	/*
> +	 * Case where the fb isn't registered. Just test if
> +	 * drm_framebuffer_free calls fb->funcs->destroy
> +	 */
> +	drm_framebuffer_free(&fb.base.refcount);
> +	KUNIT_EXPECT_EQ(test, buffer_freed, 1);
> +
> +	buffer_freed =3D 0;
> +
> +	ret =3D drm_mode_object_add(dev, &fb.base, DRM_MODE_OBJECT_FB);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	id =3D fb.base.id;
> +
> +	/* Now, test with the fb registered, that must end unregistered */
> +	drm_framebuffer_free(&fb.base.refcount);
> +	KUNIT_EXPECT_EQ(test, fb.base.id, 0);
> +	KUNIT_EXPECT_EQ(test, buffer_freed, 1);
> +
> +	/* Test if the old id of the fb was really removed from the idr pool */
> +	obj =3D drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_FB);
> +	KUNIT_EXPECT_PTR_EQ(test, obj, NULL);
> +}

And for that as well, these should all be separate tests.

Maxime

--go4ixvpyy45y4xvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkvpgAKCRDj7w1vZxhR
xcNcAQDjoK0+SvtTmOFrFffyYpAipwDGhqsnY6jam4iHWNpg9wEA2jYu8oIPmihL
Mu8XtuZ957OgV7zErkYQOdkeDCZ8fw4=
=DfNQ
-----END PGP SIGNATURE-----

--go4ixvpyy45y4xvl--
