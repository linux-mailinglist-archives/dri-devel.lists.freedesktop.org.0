Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987EB92A141
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1900A89654;
	Mon,  8 Jul 2024 11:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uWimSyQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBEE10E1F0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 11:35:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C8F460B4E;
 Mon,  8 Jul 2024 11:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7798C116B1;
 Mon,  8 Jul 2024 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720438527;
 bh=LbMTqpcED88/eFw6wAtTPK1Eb8V09yWSQ2SOkXMm1Cw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uWimSyQOfXuHMnnvP4dFQDNTKbGCrVD4nn1g7QM00XsbkpbfkLDgWbgoKZhIUo3oF
 dbRv7JUl0XX49n0ntP7ZWDDNZm2vFvydCcqTy3Wm9n2mNoFh+h74A5SNa/Bx7OluK2
 6P9AFw5YkNRzaer37Afs1CwG+3Mn5r25sDTywU5OefWQmbFURN4Y38uuzWy0K0r/75
 yEKbPMrwoIVEnMg4ch7fARtfjWsvUiITV5UdNtQUvR/NH/12rFulobp4bIGjoskG9d
 hPyt3UAkB239Xsv/62HAyGzYzI50QwsUqg6Ba61CMkdVJC6Z16tkbZ9AwkPVkeWAGV
 kxnLP06XS04BQ==
Date: Mon, 8 Jul 2024 13:35:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Subject: Re: [PATCH v3 8/9] drm/tests: Add test for drm_framebuffer_init()
Message-ID: <20240708-spaniel-of-unknown-honor-d5464e@houat>
References: <20240703172228.11166-1-gcarlos@disroot.org>
 <20240703172228.11166-9-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tw4qcikuctvcxb5a"
Content-Disposition: inline
In-Reply-To: <20240703172228.11166-9-gcarlos@disroot.org>
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


--tw4qcikuctvcxb5a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 02:22:27PM GMT, Carlos Eduardo Gallo Filho wrote:
> Add three KUnit test cases for the drm_framebuffer_init function:
>=20
> 1. Test if expected values are being set after drm_framebuffer_init() cal=
l.
> 2. Try to init a framebuffer without setting its format.
> 3. Try calling drm_framebuffer_init() with mismatch of the drm_device pas=
sed
>    at the first argument and the one pointed by fb->dev.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
> v2:
>   - Reorder kunit cases alphabetically.
>   - Let fb1.dev unset instead of set it to wrong_drm to test mismatched
>     drm_device passed as drm_framebuffer_init() argument.
>   - Clean the framebuffer object.
> v3:
>   - Split into three tests.
>   - Add documentation.
>   - Stop testing lookup here.
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 68 ++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index 54829e832c5e..73a1a3a3987e 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -569,10 +569,78 @@ static void drm_test_framebuffer_lookup_inexistent(=
struct kunit *test)
>  	KUNIT_EXPECT_NULL(test, fb);
>  }
> =20
> +/* Test if drm_framebuffer_init initializes the framebuffer with expecte=
d values */

What are those expected values?

> +static void drm_test_framebuffer_init(struct kunit *test)
> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_device *dev =3D &priv->dev;
> +	struct drm_format_info format =3D { };
> +	struct drm_framebuffer fb1 =3D { .dev =3D dev, .format =3D &format };
> +	struct drm_framebuffer_funcs funcs =3D { };
> +	int ret;
> +
> +	ret =3D drm_framebuffer_init(dev, &fb1, &funcs);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	/* Check if fb->funcs is actually set to the drm_framebuffer_funcs pass=
ed on */
> +	KUNIT_EXPECT_PTR_EQ(test, fb1.funcs, &funcs);
> +
> +	/* The fb->comm must be set to the current running process */
> +	KUNIT_EXPECT_STREQ(test, fb1.comm, current->comm);
> +
> +	/* The fb->base must be successfully initialized */
> +	KUNIT_EXPECT_NE(test, fb1.base.id, 0);
> +	KUNIT_EXPECT_EQ(test, fb1.base.type, DRM_MODE_OBJECT_FB);
> +	KUNIT_EXPECT_EQ(test, kref_read(&fb1.base.refcount), 1);
> +	KUNIT_EXPECT_PTR_EQ(test, fb1.base.free_cb, &drm_framebuffer_free);
> +
> +	/* There must be just that one fb initialized */
> +	KUNIT_EXPECT_EQ(test, dev->mode_config.num_fb, 1);
> +	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.prev, &fb1.head);
> +	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.next, &fb1.head);
> +
> +	drm_framebuffer_cleanup(&fb1);
> +}
> +
> +/* Try to init a framebuffer without setting its format */
> +static void drm_test_framebuffer_init_bad_format(struct kunit *test)
> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_device *dev =3D &priv->dev;
> +	struct drm_framebuffer fb1 =3D { .dev =3D dev, .format =3D NULL };
> +	struct drm_framebuffer_funcs funcs =3D { };
> +	int ret;
> +
> +	/* Fails if fb.format isn't set */
> +	ret =3D drm_framebuffer_init(dev, &fb1, &funcs);
> +	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +}
> +
> +/*
> + * Test calling drm_framebuffer_init() passing a framebuffer linked to a
> + * different drm_device parent from the one passed on the first argument.

What would be the expected behaviour here?

> + */
> +static void drm_test_framebuffer_init_dev_mismatch(struct kunit *test)
> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_device *dev =3D &priv->dev;
> +	struct drm_format_info format =3D { };
> +	struct drm_framebuffer fb1 =3D { .dev =3D NULL, .format =3D &format };

You're not really testing what you claim you test here, since dev is an
invalid pointer. You would need a different yet valid device here.

Maxime

--tw4qcikuctvcxb5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZovO/AAKCRAnX84Zoj2+
dqV6AX9KoryWSNYs7+7ie5Et9eWP28TU3iRWzctSvLplAXmmpcJruKwn+wtI5eZu
NIabpmMBgPduz/gTiIpfrkzgesPVXib0pnhRw47//3RUsJko4rR1QM3vmsvDrczO
7uQrOsvlQA==
=3wL3
-----END PGP SIGNATURE-----

--tw4qcikuctvcxb5a--
