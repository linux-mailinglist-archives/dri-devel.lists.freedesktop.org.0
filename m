Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CCA7D7043
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8F010E692;
	Wed, 25 Oct 2023 15:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B0510E693
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 15:01:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 59F5B61E63;
 Wed, 25 Oct 2023 15:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A8BC433C8;
 Wed, 25 Oct 2023 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698246078;
 bh=2iUIq0wuVIWry95uCN7Elk2KHxDhWdBL7pLv299oZ44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwWV2TD8tT17qmt2w5iP3D5Txgbgw5m5Ux/hU+IQPZT/XensGfcfEBOQqvv1MhHIx
 ZkkY20AUxu1oGA6doxos7+cP31prp8Q4eZ3PrkdoaHQCLlHJKzBi8kRaAocwmTk5Xk
 DxFH9EL1S+olP21dZTkf7oZS1hKknJo6LFhgXjaeZ15RetWKBD58AJ1sF4Z4QcEbeP
 kC46qIFozEQGwdF5xpksVYR8Ao1h7FZFHJpgBhZqcjP49RxKAPV5pxUl3rPLDXjbw5
 6dHcM+XqMV7EQKGDQ9uiGu9dVy70V+x5IqKmbu1d/hw2vwhD7pwGHEBhk4l4uNR5EL
 hB3e46rxySq1A==
Date: Wed, 25 Oct 2023 17:01:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH v2 08/11] drm/tests: Add test for drm_framebuffer_init()
Message-ID: <gc2axttxhyl5odx7bovlqqukwhac5cbo5hjes3dg3aaql3xujj@a47psbjg3epd>
References: <20231024191002.1620-1-gcarlos@disroot.org>
 <20231024191002.1620-9-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b3uue7na4ztvzedf"
Content-Disposition: inline
In-Reply-To: <20231024191002.1620-9-gcarlos@disroot.org>
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


--b3uue7na4ztvzedf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 04:09:59PM -0300, Carlos Eduardo Gallo Filho wrote:
> Add a single KUnit test case for the drm_framebuffer_init function.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
> v2:
>   - Reorder kunit cases alphabetically.
>   - Let fb1.dev unset instead of set it to wrong_drm to test mismatched
>     drm_device passed as drm_framebuffer_init() argument.
>   - Clean the framebuffer object.
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 52 ++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index fb9589dd8aed..eedd5e920279 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -551,10 +551,62 @@ static void drm_test_framebuffer_lookup(struct kuni=
t *test)
>  	drm_framebuffer_cleanup(&fb1);
>  }
> =20
> +static void drm_test_framebuffer_init(struct kunit *test)

Documentation

> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_device *dev =3D &priv->dev;
> +	struct drm_format_info format =3D { };
> +	struct drm_framebuffer fb1 =3D { .format =3D &format };
> +	struct drm_framebuffer *fb2;
> +	struct drm_framebuffer_funcs funcs =3D { };
> +	int ret;
> +
> +	/* Fails if fb->dev doesn't point to the drm_device passed on first arg=
 */
> +	ret =3D drm_framebuffer_init(dev, &fb1, &funcs);
> +	KUNIT_ASSERT_EQ(test, ret, -EINVAL);
> +	fb1.dev =3D dev;
> +
> +	/* Fails if fb.format isn't set */
> +	fb1.format =3D NULL;
> +	ret =3D drm_framebuffer_init(dev, &fb1, &funcs);
> +	KUNIT_ASSERT_EQ(test, ret, -EINVAL);
> +	fb1.format =3D &format;
> +
> +	ret =3D drm_framebuffer_init(dev, &fb1, &funcs);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	/*
> +	 * Check if fb->funcs is actually set to the drm_framebuffer_funcs
> +	 * passed to it
> +	 */
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
> +	/* Checks if the fb is really published and findable */
> +	fb2 =3D drm_framebuffer_lookup(dev, NULL, fb1.base.id);
> +	KUNIT_EXPECT_PTR_EQ(test, fb2, &fb1);
> +
> +	/* There must be just that one fb initialized */
> +	KUNIT_EXPECT_EQ(test, dev->mode_config.num_fb, 1);
> +	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.prev, &fb1.head);
> +	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.next, &fb1.head);
> +
> +	drm_framebuffer_cleanup(&fb1);
> +}

You're testing different failure cases, so these should all be their own
tests. Otherwise, you'll just get a single test failure that doesn't
really provide any feedback on what went wrong.

Maxime

--b3uue7na4ztvzedf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTktuwAKCRDj7w1vZxhR
xWS0AP46ILyMalGP5XZH5VVKOLxHxOm/NjUrVM4ClDJUasDQggEA6w7KXO3QiGAL
qsF5VhPTPNdjMZD3CR5Slm7aCcul1As=
=hyv2
-----END PGP SIGNATURE-----

--b3uue7na4ztvzedf--
