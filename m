Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494DFB37F1F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 11:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1D310E03B;
	Wed, 27 Aug 2025 09:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K2C1AzYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EA210E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 09:44:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E9E7A4464B;
 Wed, 27 Aug 2025 09:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E06FC4CEEB;
 Wed, 27 Aug 2025 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756287898;
 bh=IQmmmnOV4AonCKd4nzcG4Jt17mDk0i/CU33Y9/xne9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K2C1AzYi48LmBNWRPCk61Qt80s0JK11EZ7aefmNSO3cxpCsbX5Yzw0ITbrSP/cnlV
 Wdmwh99ycI8zE/7KWcn5mxTwO2gdfWZvDPGKiTSXQ60xuzvcY30G39xvfaB5A95Egc
 xs45MhmLybsAOnN5/Q01O4fkdKYlV3/EkeJGNnnx2tI556QS9VUrIdemGHAttZTLY5
 5TWgNEh07lBTmoYEJLNuwudtgY+fPlKnyjg8Yvqw54qlytSi+QHPwSkoOnqxMcyufS
 L3loxfeKqV/gfU+LH7624V4FavYH0aWjy2lHuqkRoM5Ms1Y/l0k4lVQMGPyfUanBiR
 swQ3L6pZP8h9A==
Date: Wed, 27 Aug 2025 11:44:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/panic: Add kunit tests for drm_panic
Message-ID: <20250827-wooden-kakapo-of-defense-0c4273@houat>
References: <20250821095228.648156-1-jfalempe@redhat.com>
 <20250821095228.648156-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="howmumtkmtde4tfb"
Content-Disposition: inline
In-Reply-To: <20250821095228.648156-3-jfalempe@redhat.com>
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


--howmumtkmtde4tfb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] drm/panic: Add kunit tests for drm_panic
MIME-Version: 1.0

Hi,

On Thu, Aug 21, 2025 at 11:49:06AM +0200, Jocelyn Falempe wrote:
> Add kunit tests for drm_panic.
> They check that drawing the panic screen doesn't crash, but they
> don't check the correctness of the resulting image.
>=20
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  MAINTAINERS                            |   1 +
>  drivers/gpu/drm/drm_panic.c            |   4 +
>  drivers/gpu/drm/tests/drm_panic_test.c | 164 +++++++++++++++++++++++++
>  3 files changed, 169 insertions(+)
>  create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cfa28b3470ab..285d1e27734f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8465,6 +8465,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kern=
el.git
>  F:	drivers/gpu/drm/drm_draw.c
>  F:	drivers/gpu/drm/drm_draw_internal.h
>  F:	drivers/gpu/drm/drm_panic*.c
> +F:	drivers/gpu/drm/tests/drm_panic_test.c
>  F:	include/drm/drm_panic*
> =20
>  DRM PANIC QR CODE
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 1e06e3a18d09..d89812ff1935 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -986,3 +986,7 @@ void drm_panic_exit(void)
>  {
>  	drm_panic_qr_exit();
>  }
> +
> +#ifdef CONFIG_DRM_KUNIT_TEST
> +#include "tests/drm_panic_test.c"
> +#endif
> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tes=
ts/drm_panic_test.c
> new file mode 100644
> index 000000000000..46ff3e5e0e5d
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/*
> + * Copyright (c) 2025 Red Hat.
> + * Author: Jocelyn Falempe <jfalempe@redhat.com>
> + *
> + * KUNIT tests for drm panic
> + */
> +
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_panic.h>
> +
> +#include <kunit/test.h>
> +
> +#include <linux/units.h>
> +#include <linux/vmalloc.h>
> +
> +struct drm_test_mode {
> +	const int width;
> +	const int height;
> +	const u32 format;
> +	void (*draw_screen)(struct drm_scanout_buffer *sb);
> +	const char *fname;
> +};
> +
> +/*
> + * Run all tests for the 3 panic screens: user, kmsg and qr_code
> + */
> +#define DRM_TEST_MODE_LIST(func) \
> +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_XRGB8888, func) \
> +	DRM_PANIC_TEST_MODE(300, 200, DRM_FORMAT_XRGB8888, func) \
> +	DRM_PANIC_TEST_MODE(1920, 1080, DRM_FORMAT_XRGB8888, func) \
> +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB565, func) \
> +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB888, func) \
> +
> +#define DRM_PANIC_TEST_MODE(w, h, f, name) { \
> +	.width =3D w, \
> +	.height =3D h, \
> +	.format =3D f, \
> +	.draw_screen =3D draw_panic_screen_##name, \
> +	.fname =3D #name, \
> +	}, \
> +
> +static const struct drm_test_mode drm_test_modes_cases[] =3D {
> +	DRM_TEST_MODE_LIST(user)
> +	DRM_TEST_MODE_LIST(kmsg)
> +	DRM_TEST_MODE_LIST(qr_code)
> +};
> +#undef DRM_PANIC_TEST_MODE
> +
> +static int drm_test_panic_init(struct kunit *test)
> +{
> +	struct drm_scanout_buffer *priv;
> +
> +	priv =3D kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	test->priv =3D priv;
> +
> +	drm_panic_set_description("Kunit testing");
> +
> +	return 0;
> +}
> +
> +static void drm_test_panic_screen_user_map(struct kunit *test)
> +{
> +	struct drm_scanout_buffer *sb =3D test->priv;
> +	const struct drm_test_mode *params =3D test->param_value;
> +	void *fb;
> +	int fb_size;
> +
> +	sb->format =3D drm_format_info(params->format);
> +	fb_size =3D params->width * params->height * sb->format->cpp[0];
> +
> +	fb =3D vmalloc(fb_size);
> +	KUNIT_ASSERT_NOT_NULL(test, fb);
> +
> +	iosys_map_set_vaddr(&sb->map[0], fb);
> +	sb->width =3D params->width;
> +	sb->height =3D params->height;
> +	sb->pitch[0] =3D params->width * sb->format->cpp[0];
> +
> +	params->draw_screen(sb);
> +	vfree(fb);
> +}

You need to document what you're testing, and what the expected result
is.

Maxime

--howmumtkmtde4tfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK7TlwAKCRAnX84Zoj2+
dlG7AX9KdrHTzAhHPfeWF3SuY9pZwJOBNx61rGiIuFzhB6mEWf+wF2mBSuNWN+ZI
EANpL90BgO2BFiQVMoJRJ7+wdlEyfbcNiJ61jntwEAwnRqe5+cDJUU/b5gkNMIWx
1XLFgWTXbg==
=ej9Q
-----END PGP SIGNATURE-----

--howmumtkmtde4tfb--
