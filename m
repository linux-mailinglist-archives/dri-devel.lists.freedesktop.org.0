Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F70BB95595
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB6B10E5D8;
	Tue, 23 Sep 2025 09:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eoSoaQgv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE6D10E5D7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:57:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CBEBC60007;
 Tue, 23 Sep 2025 09:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11446C116C6;
 Tue, 23 Sep 2025 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758621448;
 bh=PmQj01fq68gwRFtG9+hBxQriDoWRfOd2B6z14pQfHtI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eoSoaQgvD07Ya3O1XBoSovaJEKnjj/DOYJxgjDCOT29Y0FfNB/JeVkXnhDVRU8Ipk
 3AiuTyKT3jdWLmPnc/BIuiWejajczlw53lueX+5W6Zl6H364xc35EXF9RsqmbejjKa
 3NV5iEKHEwCR3Sm5icxulcbt9H4HW6So8A/Ynv7AcjvszjK2e9Oqjey7SoIuy8RUa4
 pQUKseLCsaH9duLZaqIlKcjrR5p8okEX2nUQKjhtfQJyp9v4j9ZAfhzpgfcUPOhAYC
 gdxK7DFD1MdW+D1mWuYmrQVBzljzIOVa+TS9JcjYCnTRR2LmM8wo5zV2aFnHDzzzrW
 9wNSWoy9z2YfA==
Date: Tue, 23 Sep 2025 11:57:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] drm/panic: Add kunit tests for drm_panic
Message-ID: <20250923-silent-mole-of-luxury-9feabc@penduick>
References: <20250908090341.762049-1-jfalempe@redhat.com>
 <20250908090341.762049-3-jfalempe@redhat.com>
 <20250910-fascinating-hungry-lemur-1d9f49@houat>
 <5e9dc5b5-9671-4a72-b926-8b526ebf9059@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fd6k3xj7eipdo577"
Content-Disposition: inline
In-Reply-To: <5e9dc5b5-9671-4a72-b926-8b526ebf9059@redhat.com>
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


--fd6k3xj7eipdo577
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] drm/panic: Add kunit tests for drm_panic
MIME-Version: 1.0

On Wed, Sep 10, 2025 at 05:16:49PM +0200, Jocelyn Falempe wrote:
> On 10/09/2025 10:33, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Sep 08, 2025 at 11:00:30AM +0200, Jocelyn Falempe wrote:
> > > Add kunit tests for drm_panic.
> > > They check that drawing the panic screen doesn't crash, but they
> > > don't check the correctness of the resulting image.
> > >=20
> > > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > > ---
> > >=20
> > > v2:
> > >   * Add a few checks, and more comments in the kunit tests. (Maxime R=
ipard).
> > >=20
> > >   MAINTAINERS                            |   1 +
> > >   drivers/gpu/drm/drm_panic.c            |   4 +
> > >   drivers/gpu/drm/tests/drm_panic_test.c | 198 ++++++++++++++++++++++=
+++
> > >   3 files changed, 203 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 402fe14091f1..e9be893d6741 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -8480,6 +8480,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/=
kernel.git
> > >   F:	drivers/gpu/drm/drm_draw.c
> > >   F:	drivers/gpu/drm/drm_draw_internal.h
> > >   F:	drivers/gpu/drm/drm_panic*.c
> > > +F:	drivers/gpu/drm/tests/drm_panic_test.c
> > >   F:	include/drm/drm_panic*
> > >   DRM PANIC QR CODE
> > > diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> > > index 1e06e3a18d09..d89812ff1935 100644
> > > --- a/drivers/gpu/drm/drm_panic.c
> > > +++ b/drivers/gpu/drm/drm_panic.c
> > > @@ -986,3 +986,7 @@ void drm_panic_exit(void)
> > >   {
> > >   	drm_panic_qr_exit();
> > >   }
> > > +
> > > +#ifdef CONFIG_DRM_KUNIT_TEST
> > > +#include "tests/drm_panic_test.c"
> > > +#endif
> > > diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm=
/tests/drm_panic_test.c
> > > new file mode 100644
> > > index 000000000000..d5d20dd2aa7c
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> > > @@ -0,0 +1,198 @@
> > > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > > +/*
> > > + * Copyright (c) 2025 Red Hat.
> > > + * Author: Jocelyn Falempe <jfalempe@redhat.com>
> > > + *
> > > + * KUNIT tests for drm panic
> > > + */
> > > +
> > > +#include <drm/drm_fourcc.h>
> > > +#include <drm/drm_panic.h>
> > > +
> > > +#include <kunit/test.h>
> > > +
> > > +#include <linux/units.h>
> > > +#include <linux/vmalloc.h>
> > > +
> > > +/* Check the framebuffer color only if the panic colors are the defa=
ult */
> > > +#if (CONFIG_DRM_PANIC_BACKGROUND_COLOR =3D=3D 0 && \
> > > +	CONFIG_DRM_PANIC_FOREGROUND_COLOR =3D=3D 0xffffff)
> > > +#define DRM_PANIC_CHECK_COLOR
> > > +#endif
> > > +
> > > +struct drm_test_mode {
> > > +	const int width;
> > > +	const int height;
> > > +	const u32 format;
> > > +	void (*draw_screen)(struct drm_scanout_buffer *sb);
> > > +	const char *fname;
> > > +};
> > > +
> > > +/*
> > > + * Run all tests for the 3 panic screens: user, kmsg and qr_code
> > > + */
> > > +#define DRM_TEST_MODE_LIST(func) \
> > > +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_XRGB8888, func) \
> > > +	DRM_PANIC_TEST_MODE(300, 200, DRM_FORMAT_XRGB8888, func) \
> > > +	DRM_PANIC_TEST_MODE(1920, 1080, DRM_FORMAT_XRGB8888, func) \
> > > +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB565, func) \
> > > +	DRM_PANIC_TEST_MODE(1024, 768, DRM_FORMAT_RGB888, func) \
> > > +
> > > +#define DRM_PANIC_TEST_MODE(w, h, f, name) { \
> > > +	.width =3D w, \
> > > +	.height =3D h, \
> > > +	.format =3D f, \
> > > +	.draw_screen =3D draw_panic_screen_##name, \
> > > +	.fname =3D #name, \
> > > +	}, \
> > > +
> > > +static const struct drm_test_mode drm_test_modes_cases[] =3D {
> > > +	DRM_TEST_MODE_LIST(user)
> > > +	DRM_TEST_MODE_LIST(kmsg)
> > > +	DRM_TEST_MODE_LIST(qr_code)
> > > +};
> > > +#undef DRM_PANIC_TEST_MODE
> > > +
> > > +static int drm_test_panic_init(struct kunit *test)
> > > +{
> > > +	struct drm_scanout_buffer *priv;
> > > +
> > > +	priv =3D kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> > > +	KUNIT_ASSERT_NOT_NULL(test, priv);
> > > +
> > > +	test->priv =3D priv;
> > > +
> > > +	drm_panic_set_description("Kunit testing");
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * Test drawing the panic screen, using a memory mapped framebuffer
> > > + * Set the whole buffer to 0xa5, and then check that all pixels have=
 been
> > > + * written.
> > > + */
> > > +static void drm_test_panic_screen_user_map(struct kunit *test)
> > > +{
> > > +	struct drm_scanout_buffer *sb =3D test->priv;
> > > +	const struct drm_test_mode *params =3D test->param_value;
> > > +	char *fb;
> > > +	int fb_size;
> > > +
> > > +	sb->format =3D drm_format_info(params->format);
> > > +	fb_size =3D params->width * params->height * sb->format->cpp[0];
> > > +
> > > +	fb =3D vmalloc(fb_size);
> > > +	KUNIT_ASSERT_NOT_NULL(test, fb);
> > > +
> > > +	memset(fb, 0xa5, fb_size);
> > > +
> > > +	iosys_map_set_vaddr(&sb->map[0], fb);
> > > +	sb->width =3D params->width;
> > > +	sb->height =3D params->height;
> > > +	sb->pitch[0] =3D params->width * sb->format->cpp[0];
> > > +
> > > +	params->draw_screen(sb);
> > > +
> > > +#ifdef DRM_PANIC_CHECK_COLOR
> > > +	{
> > > +		int i;
> > > +
> > > +		for (i =3D 0; i < fb_size; i++)
> > > +			KUNIT_ASSERT_TRUE(test, fb[i] =3D=3D 0 || fb[i] =3D=3D 0xff);
> > > +	}
> > > +#endif
> >=20
> > I'm not really fond of the ifdef here. Could you turn this into a
> > function, and return that it's valid if the colors don't match what you
> > expect?
>=20
> Yes, I can rework this.
> >=20
> > > +	vfree(fb);
> > > +}
> > > +
> > > +/*
> > > + * Test drawing the panic screen, using a list of pages framebuffer
> > > + * No checks are performed
> >=20
> > What are you testing then if you aren't checking anything?
>=20
> It tests that there are no access to an unmapped page.
> But I can add the same check that with the "map" case.
> It just requires more work to map the pages.

I wasn't really arguing about adding more stuff, just that the
documentation didn't really explain what was going on. Just saying "I'm
checking that doing this succeeds" is definitely enough for me.

> >=20
> > > + */
> > > +static void drm_test_panic_screen_user_page(struct kunit *test)
> > > +{
> > > +	struct drm_scanout_buffer *sb =3D test->priv;
> > > +	const struct drm_test_mode *params =3D test->param_value;
> > > +	int fb_size;
> > > +	struct page **pages;
> > > +	int i;
> > > +	int npages;
> > > +
> > > +	sb->format =3D drm_format_info(params->format);
> > > +	fb_size =3D params->width * params->height * sb->format->cpp[0];
> > > +	npages =3D DIV_ROUND_UP(fb_size, PAGE_SIZE);
> > > +
> > > +	pages =3D kmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
> > > +	KUNIT_ASSERT_NOT_NULL(test, pages);
> > > +
> > > +	for (i =3D 0; i < npages; i++) {
> > > +		pages[i] =3D alloc_page(GFP_KERNEL);
> > > +		KUNIT_ASSERT_NOT_NULL(test, pages[i]);
> >=20
> > KUNIT_ASSERT_* return immediately, so you're leaking the pages array
> > here.
> >=20
> yes, I can fix that, but is it important to not leak when the test fails?

kunit tests can be compiled as module and run on live systems, so yes.
It can also lead to subsequent test failures if you deplete the system
of a resource the next test will need.

Maxime

--fd6k3xj7eipdo577
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNJvBQAKCRAnX84Zoj2+
dkl0AYCFocQZV3tvBiS0pm45PzS1/533CR/f6PAxB5IP8nHjkqphFpxzo1LZwDSP
P9ccxFcBfj4Nd/Ct/8HOkqjgkeyuSMLKGKA+zEeKfBrawg4Cfb7ZMWaLo+s1F9rH
SdVl80I4cg==
=2e15
-----END PGP SIGNATURE-----

--fd6k3xj7eipdo577--
