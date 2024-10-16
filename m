Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66CA9A059B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C3110E6E4;
	Wed, 16 Oct 2024 09:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jWqL2wnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F23A10E6E4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:35:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4D129A439F1;
 Wed, 16 Oct 2024 09:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D1AC4CEC5;
 Wed, 16 Oct 2024 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729071316;
 bh=F8dkLZRR87Zpj8p9AJe6Uu5JRoeHMVT25dJvUmt3ymE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jWqL2wnXDBx6Dx7PRTp2mTzR+Xn3SrjmC2l1JIsS6TZrxn9glL8/v4cijINnA5pA2
 cnPCTvdYFz1d9lpCG6jjCa+unKrmFEdX7df85hrIXBqBcVlF0DbO29QXnwZIxW/x6s
 2r0jJq70Ss9A3RHgu5DyJXMpYoZmUKDw5uvdE3uwxFKPqonHvzWiqrMcRlpke3A8Xy
 7BxZBhtivo1FvF23KJe4O/LQbG+WFqQ33nt7BVfxVwTFdRGM5AiRCLxrsJQmNFzHi0
 8L0KTtBF2NgJesmG4SwyUVbcoVJb93f2yb3GlBDnRZKzKOE2jXdkCvr9vhaib1GEte
 xkxSSPsW20sAw==
Date: Wed, 16 Oct 2024 11:35:13 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, christian.koenig@amd.com, ray.huang@amd.com,
 dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com, mcanal@igalia.com,
 quic_jjohnson@quicinc.com, skhan@linuxfoundation.org, davidgow@google.com, 
 karolina.stolarek@intel.com, Arunpravin.PaneerSelvam@amd.com, 
 thomas.hellstrom@linux.intel.com, asomalap@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/tests: helpers: Add helper for
 drm_display_mode_from_cea_vic()
Message-ID: <20241016-poised-athletic-adder-ef2998@houat>
References: <20241014125204.1294934-1-ruanjinjie@huawei.com>
 <20241014125204.1294934-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jt25227utkuyjm4u"
Content-Disposition: inline
In-Reply-To: <20241014125204.1294934-2-ruanjinjie@huawei.com>
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


--jt25227utkuyjm4u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 08:52:01PM GMT, Jinjie Ruan wrote:
> As Maxime suggested, add a new helper
> drm_kunit_helper_display_mode_from_cea_vic(), it can replace
> the direct call of drm_display_mode_from_cea_vic(), and it will
> help solving the `mode` memory leaks.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 40 +++++++++++++++++++++++
>  include/drm/drm_kunit_helpers.h           |  6 ++++
>  2 files changed, 46 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/=
tests/drm_kunit_helpers.c
> index aa62719dab0e..dc70bafcd394 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -311,6 +311,46 @@ drm_kunit_helper_create_crtc(struct kunit *test,
>  }
>  EXPORT_SYMBOL_GPL(drm_kunit_helper_create_crtc);
> =20
> +static void kunit_action_drm_mode_destroy(void *ptr)
> +{
> +	struct drm_display_mode *mode =3D ptr;
> +
> +	drm_mode_destroy(NULL, mode);
> +}
> +
> +/**
> + * drm_kunit_helper_display_mode_from_cea_vic() - return a mode for CEA =
VIC
> +						  for a KUnit test
> + * @test: The test context object
> + * @dev: DRM device
> + * @video_code: CEA VIC of the mode
> + *
> + * Creates a new mode matching the specified CEA VIC for a KUnit test.
> + *
> + * Resources will be cleaned up automatically.
> + *
> + * Returns: A new drm_display_mode on success or NULL on failure
> + */
> +struct drm_display_mode *
> +drm_kunit_helper_display_mode_from_cea_vic(struct kunit *test,
> +					   struct drm_device *dev,
> +					   u8 video_code)
> +{
> +	struct drm_display_mode *mode;
> +	int ret;
> +
> +	mode =3D drm_display_mode_from_cea_vic(dev, video_code);
> +
> +	ret =3D kunit_add_action_or_reset(test,
> +					kunit_action_drm_mode_destroy,
> +					mode);
> +	if (ret)
> +		return NULL;
> +
> +	return mode;
> +}
> +EXPORT_SYMBOL_GPL(drm_kunit_helper_display_mode_from_cea_vic);
> +

I think you can drop the "helper" name there, it's usually reserved for
blanket implementation of DRM hooks. This one isn't a hook, so just
calling it drm_kunit_display_mode_from_cea_vic makes a bit more sense to
me.

>  MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
>  MODULE_DESCRIPTION("KUnit test suite helper functions");
>  MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_help=
ers.h
> index e7cc17ee4934..1e7fd4be550c 100644
> --- a/include/drm/drm_kunit_helpers.h
> +++ b/include/drm/drm_kunit_helpers.h
> @@ -4,6 +4,7 @@
>  #define DRM_KUNIT_HELPERS_H_
> =20
>  #include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
>
>  #include <linux/device.h>
> =20
> @@ -120,4 +121,9 @@ drm_kunit_helper_create_crtc(struct kunit *test,
>  			     const struct drm_crtc_funcs *funcs,
>  			     const struct drm_crtc_helper_funcs *helper_funcs);
> =20
> +struct drm_display_mode *
> +drm_kunit_helper_display_mode_from_cea_vic(struct kunit *test,
> +					   struct drm_device *dev,
> +					   u8 video_code);

It's not clear to me what you need the drm_edid header, you just return
a drm_display_mode pointer so you can just forward declare the structure

Once fixed
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--jt25227utkuyjm4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZw+IzAAKCRAnX84Zoj2+
dm8KAYCpUBGl0F8vsxxXZYqq9HJtXd+BOY2mJo6Ll/KhbldHuFEF/Vc+IpBzOCC7
5uxQ26oBgLvvctDjOw/Aw+k4wBjK5dMPRSPvk7VDBLAqwwbOv03rkZpckTNu5qzh
WoCQVJNCoA==
=BcMk
-----END PGP SIGNATURE-----

--jt25227utkuyjm4u--
