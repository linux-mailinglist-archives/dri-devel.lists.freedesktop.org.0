Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB87D6FB2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3EF10E689;
	Wed, 25 Oct 2023 14:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7462210E689
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:50:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 757BDB81F4A;
 Wed, 25 Oct 2023 14:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D459C433CC;
 Wed, 25 Oct 2023 14:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698245456;
 bh=jGHAMGU5gmrm9c24tQYlSJkpvLflK2SbOVmUVQRb5dU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZkiFDcMzP8lUwZs1L9rPyGGULZlHHIpPyQ4GnU8zVbZ/D+x67nwExqd81MUip4lGz
 6xUiV2Y09KSxYQzJdUNk3y+r5Q6dvaAo/RbUqmqqs1BcQhsWqktP/Hf9g2JA9bG4Zn
 xshT301V6p5NxSwW7+dm9mb7kmddetRSo+ThlDmzZIiXDlKG5j3gMH68/ttIK2rys0
 P3RJGRpsKDyDWed4PpjB4mYa8toq525Ctl8hGKMl762WA2PNzTJaJoHVTtJN1CF95J
 c9EbB+YcSRT13PWy1/OSW60Z7qiqBdQAAWp4vrh+xsLA+H1Nrnk3ZbPsONxslFU1yI
 8DGm3el7DuN/g==
Date: Wed, 25 Oct 2023 16:50:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH v2 07/11] drm/tests: Add test for drm_framebuffer_lookup()
Message-ID: <u5gccr5ckqyp4wrtlhhfptynffd6idnlrcx4uaxdy5kxba4ams@zsakliegvwgo>
References: <20231024191002.1620-1-gcarlos@disroot.org>
 <20231024191002.1620-8-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y4nlj6k7np3jo44c"
Content-Disposition: inline
In-Reply-To: <20231024191002.1620-8-gcarlos@disroot.org>
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


--y4nlj6k7np3jo44c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 24, 2023 at 04:09:58PM -0300, Carlos Eduardo Gallo Filho wrote:
> Add a single KUnit test case for the drm_framebuffer_lookup function.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
> v2:
>   - Reorder kunit cases alphabetically.
>   - Replace drm_mode_object_add() call to drm_framebuffer_init().
>   - Rely on drm_kunit_helper_alloc_device() for mock initialization.
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 26 ++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index a63f30985f75..fb9589dd8aed 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -526,10 +526,36 @@ static void drm_test_framebuffer_cleanup(struct kun=
it *test)
>  	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 0);
>  }
> =20
> +static void drm_test_framebuffer_lookup(struct kunit *test)

Again, documentation.

> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_device *dev =3D &priv->dev;
> +	struct drm_format_info format =3D { };
> +	struct drm_framebuffer fb1 =3D { .dev =3D dev, .format =3D &format };
> +	struct drm_framebuffer *fb2;
> +	uint32_t id =3D 0;
> +	int ret;
> +
> +	ret =3D drm_framebuffer_init(dev, &fb1, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	id =3D fb1.base.id;
> +
> +	/* Looking for fb1 */
> +	fb2 =3D drm_framebuffer_lookup(dev, NULL, id);
> +	KUNIT_EXPECT_PTR_EQ(test, fb2, &fb1);

I would rename the variables to expected_fb and fb (or returned_fb);

You also need to call drm_framebuffer_put on fb2.

> +	/* Looking for an inexistent framebuffer */
> +	fb2 =3D drm_framebuffer_lookup(dev, NULL, id + 1);
> +	KUNIT_EXPECT_NULL(test, fb2);

This should be a separate test

Maxime

--y4nlj6k7np3jo44c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkrTgAKCRDj7w1vZxhR
xbavAP9/V/N3zeJtmK1MKxtvAbFOa9+hatNWpK5T+XN94O6SEgD+MRRjGvg7YnH0
AosN/UlAMD+TKaSXjQKJtYzB5Zr6mw4=
=zRkI
-----END PGP SIGNATURE-----

--y4nlj6k7np3jo44c--
