Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EEA7D6EC1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4A510E678;
	Wed, 25 Oct 2023 14:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E4310E678
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:35:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 87FE8B82E55;
 Wed, 25 Oct 2023 14:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F05C433C9;
 Wed, 25 Oct 2023 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698244535;
 bh=PqPNfD4u2aDFDRFY7U9CHPnRXuHGs9UUUhHnm1wO700=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TKgcLLitF05iykKhobWjKrf8XrIaJ4F7sONwwXXg2aFsqbkrFTpfDLv3ftImVC3Gi
 Io6iB78mrpVCLoRE2Lu/fO6J+ZiVKX93o4tIGpyJeiy+igorGfPJEkJTW9F9LmZNX0
 A9i6evMF2y7SCmtzqN9ePNDCD5YXMzVh24EGNaY3SrJZ5ovjWp2cvBuNkuUCZ9aMFo
 cnaW9EXKaGi1qr2xIukjE7GwDlYwInVLq5ZhrAC+TE2vFSQGa51kucn2i7mTDktGkR
 y2veruBEuEmV11SwvyNI97ciy/j0qWksRLzZNfXKyPFCh2fF2ZB8CWh0z/E9j8An1k
 T/uqnZxsokGAw==
Date: Wed, 25 Oct 2023 16:35:33 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH v2 02/11] drm/tests: Add parameters to the
 drm_test_framebuffer_create test
Message-ID: <lxv5rmiouhdggkjpsdpf6x2fhq6gwhhd6d72mo4nvtzx6b6dlt@27ryrdxynrc4>
References: <20231024191002.1620-1-gcarlos@disroot.org>
 <20231024191002.1620-3-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6kr3xy45mkorowwl"
Content-Disposition: inline
In-Reply-To: <20231024191002.1620-3-gcarlos@disroot.org>
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


--6kr3xy45mkorowwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 24, 2023 at 04:09:53PM -0300, Carlos Eduardo Gallo Filho wrote:
> Extend the existing test case to cover:
> 1. Invalid flag atribute in the struct drm_mode_fb_cmd2.
> 2. Pixel format which requires non-linear modifier with
> DRM_FORMAT_MOD_LINEAR set.
> 3. Non-zero buffer offset for an unused plane
>=20
> Also replace strcpy to strscpy on test_to_desc for improved security
> and reliability.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
> v2:
>   - Remove strcpy to strscpy change.
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 21 ++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index 9c6170edd5f7..659cbd5a3be3 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -21,6 +21,8 @@
>  #define MIN_HEIGHT 4
>  #define MAX_HEIGHT 4096
> =20
> +#define DRM_MODE_FB_INVALID BIT(2)
> +
>  struct drm_framebuffer_test {
>  	int buffer_created;
>  	struct drm_mode_fb_cmd2 cmd;
> @@ -85,6 +87,18 @@ static const struct drm_framebuffer_test drm_framebuff=
er_create_cases[] =3D {
>  		 .pitches =3D { 4 * MAX_WIDTH, 0, 0 },
>  	}
>  },
> +{ .buffer_created =3D 0, .name =3D "ABGR8888 Non-zero buffer offset for =
unused plane",
> +	.cmd =3D { .width =3D MAX_WIDTH, .height =3D MAX_HEIGHT, .pixel_format =
=3D DRM_FORMAT_ABGR8888,
> +		 .handles =3D { 1, 0, 0 }, .offsets =3D { UINT_MAX / 2, UINT_MAX / 2, =
0 },
> +		 .pitches =3D { 4 * MAX_WIDTH, 0, 0 }, .flags =3D DRM_MODE_FB_MODIFIER=
S,
> +	}
> +},

I know that the other tests are like that too, but I'd really like a
comment that explains what corner case this test is supposed to test.

Maxime

--6kr3xy45mkorowwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkntAAKCRDj7w1vZxhR
xUbOAP9876iEWGCCJw41ilO7mZHZn450D6GtpXyT5QR04pUZagEA7TltVcguvLg8
Bl+W14lpgsD3G6EroOrPLWZmIAuLZAI=
=ybnW
-----END PGP SIGNATURE-----

--6kr3xy45mkorowwl--
