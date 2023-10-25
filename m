Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900D07D6FA7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8934210E686;
	Wed, 25 Oct 2023 14:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770C910E687
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:48:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 93023CE2309;
 Wed, 25 Oct 2023 14:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAA0C433C8;
 Wed, 25 Oct 2023 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698245315;
 bh=vr/joHdBoOgyrXy5axBZK/zukZHbgXWNwRfrFiTu7WU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sgIIc8+0BmbbENG+iUs29w7PWGRzPafsGGX3Amel7m8NJbM7cqqHNvWTFj6rvAvLH
 Z56Xhq03NvRCWAM0Tiuhonxpu5Irn/HO1ymXctg4WGvylRIPbFEkqmy0mQFQnLIFD1
 HgTdP7NLIaCJK72RcpZh1BEjlwnajnE+83iVSdEIqpwi621FvcnD8vUUphv5F2Aa8k
 DDBHdtMeFj7Qv72rjMz0kwQuN7OIK818YunA8EncZIMvzObBAR2ta8dQOPmXSVNYq9
 EQKvBs7YoMS5wEq5sb2/urGoorIUslM9bhBp0aZuoiNwfGQht+9AWIJj3hqwswkHcc
 mLr2rERPs3Rdw==
Date: Wed, 25 Oct 2023 16:48:33 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH v2 06/11] drm/tests: Add test for drm_framebuffer_cleanup()
Message-ID: <agy36fjtynnlxhd3k4tue6xiiqrxwsm2ocfzq27jtjjn3sorhr@gr5b7emtfd73>
References: <20231024191002.1620-1-gcarlos@disroot.org>
 <20231024191002.1620-7-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bbweiu3bv4fhpelf"
Content-Disposition: inline
In-Reply-To: <20231024191002.1620-7-gcarlos@disroot.org>
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


--bbweiu3bv4fhpelf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 24, 2023 at 04:09:57PM -0300, Carlos Eduardo Gallo Filho wrote:
> Add a single KUnit test case for the drm_framebuffer_cleanup function.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
> v2:
>   - Reorder kunit cases alphabetically.
>   - Rely on drm_kunit_helper_alloc_device() for mock initialization.
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 37 ++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index 7b51862fb0f2..a63f30985f75 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -490,8 +490,45 @@ check_src_coords_test_to_desc(const struct drm_frame=
buffer_check_src_coords_case
>  KUNIT_ARRAY_PARAM(check_src_coords, drm_framebuffer_check_src_coords_cas=
es,
>  		  check_src_coords_test_to_desc);
> =20
> +static void drm_test_framebuffer_cleanup(struct kunit *test)

Again, we should document *what* we are testing here. Your commit says
that you're testing drm_framebuffer_cleanup(), but even after reading
that test I have no idea which tests have been covered or not.

> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_device *dev =3D &priv->dev;
> +	struct list_head *fb_list =3D &dev->mode_config.fb_list;
> +	struct drm_framebuffer fb1 =3D { .dev =3D dev };
> +	struct drm_framebuffer fb2 =3D { .dev =3D dev };
> +
> +	/* This must result on [fb_list] -> fb1 -> fb2 */
> +	list_add_tail(&fb1.head, fb_list);
> +	list_add_tail(&fb2.head, fb_list);
> +	dev->mode_config.num_fb =3D 2;
> +
> +	KUNIT_ASSERT_PTR_EQ(test, fb_list->prev, &fb2.head);
> +	KUNIT_ASSERT_PTR_EQ(test, fb_list->next, &fb1.head);
> +	KUNIT_ASSERT_PTR_EQ(test, fb1.head.prev, fb_list);
> +	KUNIT_ASSERT_PTR_EQ(test, fb1.head.next, &fb2.head);
> +	KUNIT_ASSERT_PTR_EQ(test, fb2.head.prev, &fb1.head);
> +	KUNIT_ASSERT_PTR_EQ(test, fb2.head.next, fb_list);
> +
> +	drm_framebuffer_cleanup(&fb1);

I think that for that test to be meaningful, we should first have init
the framebuffer using drm_framebuffer_init. Otherwise we will just
chasing our tail trying to mock drm_framebuffer_init. Plus, we don't
want to test if drm_framebuffer_cleanup works if we hand-crafted a
framebuffer.

Maxime

--bbweiu3bv4fhpelf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkqwQAKCRDj7w1vZxhR
xX6XAQCEUfX3O5PybY24Y1dfax9H9seRJBJHu0SilAb8EVSC+QEA1YDrkQTM4imL
BHVbXpwXUCmA+yX02dkusoTtGAIS4A4=
=OWlJ
-----END PGP SIGNATURE-----

--bbweiu3bv4fhpelf--
