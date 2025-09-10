Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8962CB51166
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 10:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CFE10E27D;
	Wed, 10 Sep 2025 08:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LbIX6kPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5059E10E27D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:34:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5FE1160226;
 Wed, 10 Sep 2025 08:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6918C4CEF0;
 Wed, 10 Sep 2025 08:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757493241;
 bh=TIzmDeWrxXGOrqQJgO1ho+rcXE2ljlXUJJkwn0dTGHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LbIX6kPfTWCHRwzEHakmKpRsdirCgbhj3mfsmYjdto68chBZ0Fh+gQtHYghhqYKCo
 AgGn1wp585shNvcF3d78F4ZtsXXVIaFM+3isuN27vcRFcYbDQJ97PJgjnY6zDtSjl0
 LsRME7H3a8o651quDGsb8TlQjZk8vT4hFX9vAtoZLeoiQiQvrsqwq0fQ+MgDPQCvIk
 fk8jjcIEQHra+jlXYLK8jAFkM89HFNhJFTAhSaTWKjHgO/hi3JI86bcvkN91cSDGXp
 QDzJfUZeXVD/FIgW5Ub8GAgNs7dl+FVt7iUUPsyegOVVnf6F/w0bxoI7Vl5hvOrR48
 CmCr0KZdmkg9A==
Date: Wed, 10 Sep 2025 10:33:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] drm/panic: Add kunit tests for drm_panic
Message-ID: <20250910-fascinating-hungry-lemur-1d9f49@houat>
References: <20250908090341.762049-1-jfalempe@redhat.com>
 <20250908090341.762049-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2gnzefsek5tf3ojl"
Content-Disposition: inline
In-Reply-To: <20250908090341.762049-3-jfalempe@redhat.com>
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


--2gnzefsek5tf3ojl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] drm/panic: Add kunit tests for drm_panic
MIME-Version: 1.0

Hi,

On Mon, Sep 08, 2025 at 11:00:30AM +0200, Jocelyn Falempe wrote:
> Add kunit tests for drm_panic.
> They check that drawing the panic screen doesn't crash, but they
> don't check the correctness of the resulting image.
>=20
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>=20
> v2:
>  * Add a few checks, and more comments in the kunit tests. (Maxime Ripard=
).
>=20
>  MAINTAINERS                            |   1 +
>  drivers/gpu/drm/drm_panic.c            |   4 +
>  drivers/gpu/drm/tests/drm_panic_test.c | 198 +++++++++++++++++++++++++
>  3 files changed, 203 insertions(+)
>  create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 402fe14091f1..e9be893d6741 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8480,6 +8480,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kern=
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
> index 000000000000..d5d20dd2aa7c
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -0,0 +1,198 @@
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
> +/* Check the framebuffer color only if the panic colors are the default =
*/
> +#if (CONFIG_DRM_PANIC_BACKGROUND_COLOR =3D=3D 0 && \
> +	CONFIG_DRM_PANIC_FOREGROUND_COLOR =3D=3D 0xffffff)
> +#define DRM_PANIC_CHECK_COLOR
> +#endif
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
> +/*
> + * Test drawing the panic screen, using a memory mapped framebuffer
> + * Set the whole buffer to 0xa5, and then check that all pixels have been
> + * written.
> + */
> +static void drm_test_panic_screen_user_map(struct kunit *test)
> +{
> +	struct drm_scanout_buffer *sb =3D test->priv;
> +	const struct drm_test_mode *params =3D test->param_value;
> +	char *fb;
> +	int fb_size;
> +
> +	sb->format =3D drm_format_info(params->format);
> +	fb_size =3D params->width * params->height * sb->format->cpp[0];
> +
> +	fb =3D vmalloc(fb_size);
> +	KUNIT_ASSERT_NOT_NULL(test, fb);
> +
> +	memset(fb, 0xa5, fb_size);
> +
> +	iosys_map_set_vaddr(&sb->map[0], fb);
> +	sb->width =3D params->width;
> +	sb->height =3D params->height;
> +	sb->pitch[0] =3D params->width * sb->format->cpp[0];
> +
> +	params->draw_screen(sb);
> +
> +#ifdef DRM_PANIC_CHECK_COLOR
> +	{
> +		int i;
> +
> +		for (i =3D 0; i < fb_size; i++)
> +			KUNIT_ASSERT_TRUE(test, fb[i] =3D=3D 0 || fb[i] =3D=3D 0xff);
> +	}
> +#endif

I'm not really fond of the ifdef here. Could you turn this into a
function, and return that it's valid if the colors don't match what you
expect?

> +	vfree(fb);
> +}
> +
> +/*
> + * Test drawing the panic screen, using a list of pages framebuffer
> + * No checks are performed

What are you testing then if you aren't checking anything?

> + */
> +static void drm_test_panic_screen_user_page(struct kunit *test)
> +{
> +	struct drm_scanout_buffer *sb =3D test->priv;
> +	const struct drm_test_mode *params =3D test->param_value;
> +	int fb_size;
> +	struct page **pages;
> +	int i;
> +	int npages;
> +
> +	sb->format =3D drm_format_info(params->format);
> +	fb_size =3D params->width * params->height * sb->format->cpp[0];
> +	npages =3D DIV_ROUND_UP(fb_size, PAGE_SIZE);
> +
> +	pages =3D kmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, pages);
> +
> +	for (i =3D 0; i < npages; i++) {
> +		pages[i] =3D alloc_page(GFP_KERNEL);
> +		KUNIT_ASSERT_NOT_NULL(test, pages[i]);

KUNIT_ASSERT_* return immediately, so you're leaking the pages array
here.

Maxime

--2gnzefsek5tf3ojl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaME36wAKCRAnX84Zoj2+
dsRiAYC5khdLWr61N0wCIL8Z0JdvL2/H6uiHCllT4PmoI/zN8feUSsQrKc3Mwbnm
ukk1xOYBfRMVwXLBUjztbTGCJ/K1ZXzEalXG0mgCIXfc7CJem8tyRIkib58DPHIe
NGLgHovX6g==
=du/g
-----END PGP SIGNATURE-----

--2gnzefsek5tf3ojl--
