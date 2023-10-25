Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DAE7D70AC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEED10E5BB;
	Wed, 25 Oct 2023 15:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F75610E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 15:19:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 199A8B82CA1;
 Wed, 25 Oct 2023 15:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111D2C433C7;
 Wed, 25 Oct 2023 15:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698247189;
 bh=ZkSonPJ5FZUEGZwGckjAgKqK03KtkV8MFrWUogtWaqk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lmR1PQBVB4zfwaGm62ow9ULweOL1rTQXiI/QqO6j3zXrPeN3VlUWRG6DJ/H9OPdkV
 nv2EZ3EPRpuQQ33eR9N2BAOD/EF0KuSV7/MIG+hyBvSvX9HLD2znH6atTnlPN4013/
 n8T3tqRau9b6cBwZ637kRDuusIsBXiiYAIEKG7dWeOqqIdQgorFRcZT1xnBo4UFM3h
 yo/y/p4g16VgxY65vGnV9BtpeZYrdQnLSlxVMPaR0MkwXIii35Kz5ENHe5nX5Tq850
 7cZCxhHn5RjL/9UY/rY/NAg2TtNUi0xg/C9cpH2PD7lG8leuCOBtN3iJ8bxv+UguUs
 voUzr0BlCqhxQ==
Date: Wed, 25 Oct 2023 17:19:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH v2 10/11] drm/tests: Add test for drm_mode_addfb2()
Message-ID: <tthbwdkjwqy2giwwlieszyd2vct4wzumku4efmzsx534m5jwq3@x3bfwzvc5doj>
References: <20231024191002.1620-1-gcarlos@disroot.org>
 <20231024191002.1620-11-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tbe5qngznsdlmv63"
Content-Disposition: inline
In-Reply-To: <20231024191002.1620-11-gcarlos@disroot.org>
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


--tbe5qngznsdlmv63
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 04:10:01PM -0300, Carlos Eduardo Gallo Filho wrote:
> Add a single KUnit test case for the drm_mode_addfb2 function.
>=20
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
> v2:
>   - Reorder kunit cases alphabetically.
>   - Rely on drm_kunit_helper_alloc_device() for mock initialization.
> ---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c | 104 ++++++++++++++++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/d=
rm/tests/drm_framebuffer_test.c
> index dbe412d0dca4..149e1985e53f 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_mode.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_kunit_helpers.h>
> @@ -341,8 +342,18 @@ static const struct drm_framebuffer_test drm_framebu=
ffer_create_cases[] =3D {
>  },
>  };
> =20
> +/*
> + * This struct is intended to provide a way to mocked functions communic=
ate
> + * with the outer test when it can't be achieved by using its return val=
ue. In
> + * this way, the functions that receive the mocked drm_device, for examp=
le, can
> + * grab a reference to @private and actually return something to be used=
 on some
> + * expectation. Also having the @test member allows doing expectations f=
rom
> + * inside mocked functions.
> + */
>  struct drm_framebuffer_test_priv {
>  	struct drm_device dev;
> +	struct drm_file file_priv;
> +	struct kunit *test;
>  	void *private;
>  };
> =20
> @@ -365,14 +376,16 @@ static int drm_framebuffer_test_init(struct kunit *=
test)
>  	struct device *parent;
>  	struct drm_framebuffer_test_priv *priv;
>  	struct drm_device *dev;
> +	struct drm_file *file_priv;
> =20
>  	parent =3D drm_kunit_helper_alloc_device(test);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
> =20
>  	priv =3D drm_kunit_helper_alloc_drm_device(test, parent, typeof(*priv),
> -						 dev, 0);
> +						 dev, DRIVER_MODESET);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
>  	dev =3D &priv->dev;
> +	file_priv =3D &priv->file_priv;
> =20
>  	dev->mode_config.min_width =3D MIN_WIDTH;
>  	dev->mode_config.max_width =3D MAX_WIDTH;
> @@ -380,10 +393,22 @@ static int drm_framebuffer_test_init(struct kunit *=
test)
>  	dev->mode_config.max_height =3D MAX_HEIGHT;
>  	dev->mode_config.funcs =3D &mock_config_funcs;
> =20
> +	mutex_init(&file_priv->fbs_lock);
> +	INIT_LIST_HEAD(&file_priv->fbs);
> +

mock_drm_getfile() is what you should use there

>  	test->priv =3D priv;
> +
>  	return 0;
>  }
> =20
> +static void drm_framebuffer_test_exit(struct kunit *test)
> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_file *file_priv =3D &priv->file_priv;
> +
> +	mutex_destroy(&file_priv->fbs_lock);
> +}

and fput(file) here, which should probably be a kunit action.

> +
>  static void drm_test_framebuffer_create(struct kunit *test)
>  {
>  	const struct drm_framebuffer_test *params =3D test->param_value;
> @@ -650,7 +675,83 @@ static void drm_test_framebuffer_free(struct kunit *=
test)
>  	KUNIT_EXPECT_PTR_EQ(test, obj, NULL);
>  }
> =20
> +static struct drm_framebuffer *
> +fb_create_addfb2_mock(struct drm_device *dev, struct drm_file *file_priv,
> +		      const struct drm_mode_fb_cmd2 *cmd)
> +{
> +	struct drm_framebuffer_test_priv *priv =3D container_of(dev, typeof(*pr=
iv), dev);
> +	struct drm_framebuffer *fb;
> +	struct kunit *test =3D priv->test;

kunit_get_current_test();

> +
> +	fb =3D kunit_kzalloc(test, sizeof(*fb), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fb);

That's probably a bad idea to allocate the framebuffer unit
kunit_kzalloc there. It will get freed at the end of the test but the
DRM device is still around then so it will probably result in a
use-after-free.

> +
> +	fb->base.id =3D 1;
> +
> +	priv->private =3D fb;
> +	return fb;

Again, I don't think we should fake a buffer here, we should allocate a
real one. We want to test the behaviour of add_fb2, not whether our mock
of the framebuffer creation is good enough.

> +}
> +
> +static struct drm_mode_config_funcs config_funcs_addfb2_mock =3D {
> +	.fb_create =3D fb_create_addfb2_mock,
> +};
> +
> +static void drm_test_framebuffer_addfb2(struct kunit *test)
> +{
> +	struct drm_framebuffer_test_priv *priv =3D test->priv;
> +	struct drm_device *dev =3D &priv->dev;
> +	struct drm_file *file_priv =3D &priv->file_priv;
> +	struct drm_framebuffer *fb =3D NULL;
> +	u32 driver_features;
> +	int ret;
> +
> +	/* A valid cmd */
> +	struct drm_mode_fb_cmd2 cmd =3D {
> +		.width =3D 600, .height =3D 600,
> +		.pixel_format =3D DRM_FORMAT_ABGR8888,
> +		.handles =3D { 1, 0, 0 }, .pitches =3D { 4 * 600, 0, 0 },
> +	};
> +
> +	priv->test =3D test;
> +	dev->mode_config.funcs =3D &config_funcs_addfb2_mock;
> +
> +	/* Must fail due to missing DRIVER_MODESET support */
> +	driver_features =3D dev->driver_features;
> +	dev->driver_features =3D 0u;
> +	ret =3D drm_mode_addfb2(dev, &cmd, file_priv);
> +	KUNIT_EXPECT_EQ(test, ret, -EOPNOTSUPP);
> +	KUNIT_ASSERT_PTR_EQ(test, priv->private, NULL);
> +	dev->driver_features =3D driver_features;
> +
> +	/*
> +	 * Set an invalid cmd to trigger a fail on the
> +	 * drm_internal_framebuffer_create function
> +	 */
> +	cmd.width =3D 0;
> +	ret =3D drm_mode_addfb2(dev, &cmd, file_priv);
> +	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +	KUNIT_ASSERT_PTR_EQ(test, priv->private, NULL);
> +	cmd.width =3D 600; /* restore to a valid value */
> +
> +	ret =3D drm_mode_addfb2(dev, &cmd, file_priv);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	/* The fb_create_addfb2_mock set fb id to 1 */
> +	KUNIT_EXPECT_EQ(test, cmd.fb_id, 1);
> +
> +	fb =3D priv->private;
> +
> +	/* The fb must be properly added to the file_priv->fbs list */
> +	KUNIT_EXPECT_PTR_EQ(test, file_priv->fbs.prev, &fb->filp_head);
> +	KUNIT_EXPECT_PTR_EQ(test, file_priv->fbs.next, &fb->filp_head);
> +
> +	/* There must be just one fb on the list */
> +	KUNIT_EXPECT_PTR_EQ(test, fb->filp_head.prev, &file_priv->fbs);
> +	KUNIT_EXPECT_PTR_EQ(test, fb->filp_head.next, &file_priv->fbs);
> +}
> +

All these should be separate, documented, tests.

Maxime
>

--tbe5qngznsdlmv63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkyEgAKCRDj7w1vZxhR
xecWAP9QhxqP+3+ZnE51IcbSwK8FQ99cROvsuoKzPokcZZSTdAEAs/BkpNDap1r8
NAnT8jfTJ1KSeN04F0pjL4RjPDFEiQs=
=G06y
-----END PGP SIGNATURE-----

--tbe5qngznsdlmv63--
