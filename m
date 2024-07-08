Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0492A126
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 13:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2C610E0D1;
	Mon,  8 Jul 2024 11:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ASTB+5bc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25AD10E0D1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 11:28:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B13B60B73;
 Mon,  8 Jul 2024 11:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB85C116B1;
 Mon,  8 Jul 2024 11:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720438088;
 bh=CdKEQf5C3oFRx8hocwyASlE9NK6yoboIRfXOu2B15kw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ASTB+5bc1hADAmXmgoWMLiJGLB7nGvmeSWJVitztu2O1w+G5urqUMzvPUTJ2F9E/D
 Ci9z/esJKByd84/SLmviqolB+C/jlJYUqCrJUuKIWY1MnwqfTT0S1qAiKis7U9f449
 ZEElBIm6Nw52hzs+MzhAaMBE5GReWxLF1XuaYIHa5bONYcqnf0sNCecRPEfU2OvwIq
 NnvtdDPIP8FUBwEwbjJ0hj4iMA0g37s43UjZWiV87RYYNSgaaicFWbqqtcKRq5ZYfJ
 /IJMveaiFJHTIVhmU7ih/P8nKDKMx+PolDsSfHNziPzrcb+psEuYu2QlsvmZR1fZeC
 YDIeO+t+xXGwQ==
Date: Mon, 8 Jul 2024 13:28:06 +0200
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
Subject: Re: [PATCH v3 4/9] drm/tests: Add test case for
 drm_internal_framebuffer_create()
Message-ID: <20240708-dark-ostrich-of-patience-c28ace@houat>
References: <20240703172228.11166-1-gcarlos@disroot.org>
 <20240703172228.11166-5-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cm34kxlj3ux5bami"
Content-Disposition: inline
In-Reply-To: <20240703172228.11166-5-gcarlos@disroot.org>
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


--cm34kxlj3ux5bami
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 02:22:23PM GMT, Carlos Eduardo Gallo Filho wrote:
> Introduce a test to cover the creation of framebuffer with
> modifier on a device that doesn't support it.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
> v2:
>   - Reorder kunit cases alphabetically.
> v3:
>   - Replace the use of void pointer on drm_framebuffer_test_priv struct.
>   - Test return value of drm_internal_framebuffer_create().
>   - Change test documentation to don't rely on another test.
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 25 ++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index 4b1884be9d7a..22966ebfe9cb 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -415,8 +415,33 @@ static void drm_framebuffer_test_to_desc(const struc=
t drm_framebuffer_test *t, c
>  KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
>  		  drm_framebuffer_test_to_desc);
> =20
> +/* Tries to create a framebuffer with modifiers without drm_device suppo=
rting it */
> +static void drm_test_framebuffer_modifiers_not_supported(struct kunit *t=
est)
> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_device *dev =3D &priv->dev;
> +	struct drm_framebuffer *fb;
> +
> +	/* A valid cmd with modifier */
> +	struct drm_mode_fb_cmd2 cmd =3D {
> +		.width =3D MAX_WIDTH, .height =3D MAX_HEIGHT,
> +		.pixel_format =3D DRM_FORMAT_ABGR8888, .handles =3D { 1, 0, 0 },
> +		.offsets =3D { UINT_MAX / 2, 0, 0 }, .pitches =3D { 4 * MAX_WIDTH, 0, =
0 },
> +		.flags =3D DRM_MODE_FB_MODIFIERS,
> +	};
> +
> +	priv->buffer_created =3D false;
> +	dev->mode_config.fb_modifiers_not_supported =3D 1;
> +
> +	fb =3D drm_internal_framebuffer_create(dev, &cmd, NULL);
> +	KUNIT_EXPECT_EQ(test, false, priv->buffer_created);
> +	KUNIT_ASSERT_EQ(test, IS_ERR(fb), true);
> +	KUNIT_EXPECT_EQ(test, PTR_ERR(fb), -EINVAL);

I'd rather have the actual and expected values always in the same order,
preferably the former first.

Also, is there a reason you assert that it's an error, and then expect
the error code? You can remove the assertion, it's already covered by
the expectation.

Maxime

--cm34kxlj3ux5bami
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZovNRQAKCRAnX84Zoj2+
dtDyAYCbic4Ln++FyJEn6/djXK8CbXgvc/pyseL81CGD+UfdoWwQmvMeDbPkibkM
Uz4QCY0BgMrVrpeg2WE19wAW9agax3SLEWj0/iH6c5vuwjutOTZ5nf8tWjR+xP36
S8mGjneDFg==
=EMCu
-----END PGP SIGNATURE-----

--cm34kxlj3ux5bami--
