Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 638277D6EE0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EF310E675;
	Wed, 25 Oct 2023 14:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAB810E675
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:39:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3FF5BB829AC;
 Wed, 25 Oct 2023 14:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3450EC433C7;
 Wed, 25 Oct 2023 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698244775;
 bh=Lno6fcjDCAroFTjIH/YqSCE4U8f0wX4P/7x7ZybgJZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DdRzEKIlE4/rJeGPDyMeLsN2dS8zK1rflBIow68HRCLd4ZcAXj6q26Ok0kVaQjoIe
 QHXSfPu+xUcyFwWc4qXOso/r9Smy3y0v8xGsZIwdDw9NcmlRdQ1U1ZcmCHvRQGqQZN
 VmxEDDiBrChtWZn9kLP9tF+/+6nCIeLFzCnv0YBgKaspRZZrP0VXLspveejY6MrEVW
 6E3AMP5qmpsN957NaG59Y0qNFEmm0byyMqA/EffIwF2DSWqmyAAA4sxFIsvlbD/9Ka
 xuVrM8J2QFTmECOfhUHlDUopOioVT1bFRoEuXEhLlf9DTAnp9GwaxgpTceAP8iW38Q
 WIMppIugO0+Rw==
Date: Wed, 25 Oct 2023 16:39:32 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH v2 04/11] drm/tests: Add test case for
 drm_internal_framebuffer_create()
Message-ID: <r62zohjnnsuebfwum7jvafttdxxvep6cbf3dskntzn5qvcieuv@e3brcfg6yx75>
References: <20231024191002.1620-1-gcarlos@disroot.org>
 <20231024191002.1620-5-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2ahs5n2bbkbkzngc"
Content-Disposition: inline
In-Reply-To: <20231024191002.1620-5-gcarlos@disroot.org>
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


--2ahs5n2bbkbkzngc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 24, 2023 at 04:09:55PM -0300, Carlos Eduardo Gallo Filho wrote:
> Introduce a test to cover the creation of framebuffer with
> modifier on a device that doesn't support it.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
> v2:
>   - Reorder kunit cases alphabetically.
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 28 ++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index eb76a71644e9..8a9b6d08d639 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -403,8 +403,36 @@ static void drm_framebuffer_test_to_desc(const struc=
t drm_framebuffer_test *t, c
>  KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
>  		  drm_framebuffer_test_to_desc);
> =20
> +/*
> + * This test is very similar to drm_test_framebuffer_create, except that=
 it

We shouldn't rely on the another test for the documentation. If
drm_test_framebuffer_create is ever removed or renamed, then the reader
won't have any clue what it was supposed to test.

We should provide a documentation that doesn't require any additional
context.

> + * set dev->mode_config.fb_modifiers_not_supported member to 1, covering
> + * the case of trying to create a framebuffer with modifiers without the
> + * device really supporting it.
> + */

So I guess something like:

Test that, if a device doesn't support modifiers, a framebuffer
allocation using them will fail.

> +static void drm_test_framebuffer_modifiers_not_supported(struct kunit *t=
est)
> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_device *dev =3D &priv->dev;
> +	int buffer_created =3D 0;
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
> +	priv->private =3D &buffer_created;
> +	dev->mode_config.fb_modifiers_not_supported =3D 1;
> +
> +	drm_internal_framebuffer_create(dev, &cmd, NULL);
> +	KUNIT_EXPECT_EQ(test, 0, buffer_created);

We should test the returned value of drm_internal_framebuffer_create here.

Maxime

--2ahs5n2bbkbkzngc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkopAAKCRDj7w1vZxhR
xa48AP9NzimuL20mg3/azBQl/VGRtXV3hMBC8+8A7YtFBHDIfQD4/rtcak0QCV+d
IivIDxk33mYYZCqbbQhRnes1L3l3Ag==
=kPAR
-----END PGP SIGNATURE-----

--2ahs5n2bbkbkzngc--
