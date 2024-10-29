Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E79B43FD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F6E10E243;
	Tue, 29 Oct 2024 08:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nqNA6yGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368FF10E243
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 08:16:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 67EB5A41836;
 Tue, 29 Oct 2024 08:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A66EC4CECD;
 Tue, 29 Oct 2024 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730189815;
 bh=YmQNvxmK5RMc5JsiMCTdPL/gUTolAxPMN/OjbyiJdwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nqNA6yGyvcLvqFX7erSi4zzSe4czvfB6He9L8wk/jyc/30AfzsKHhr+J560CbndD+
 3wycuWU3fhkJSZrg7iQR/UzsV3lt22f47tvTXxjT1HE31x177KorEuDPh4Mdke6i+0
 Jqs0AN9S6jesTuWcN+S/SS44BsPFrMMP8KN4BlC8IXZc9VafRoRb4NZMuAIzFc6P83
 1INJI5vrQwOooPFY62lIdzG/N12R8PQSdm/fXmAxbe3OKYGgtvktUPetH/ptAskjxn
 ZFYvVwWOWskFgzJyNxto9ceWuuZcnrq06kTdMmbc7trHlhu86GwKD2BOl+imSjbyyO
 1St45850YtX+A==
Date: Tue, 29 Oct 2024 09:16:51 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, christian.koenig@amd.com, ray.huang@amd.com,
 dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com,
 quic_jjohnson@quicinc.com, 
 mcanal@igalia.com, davidgow@google.com, skhan@linuxfoundation.org, 
 karolina.stolarek@intel.com, Arunpravin.PaneerSelvam@amd.com, 
 thomas.hellstrom@linux.intel.com, asomalap@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] drm/tests: helpers: Add helper for
 drm_display_mode_from_cea_vic()
Message-ID: <20241029-dancing-hissing-bullfrog-b6d0ed@houat>
References: <20241017063125.3080347-1-ruanjinjie@huawei.com>
 <20241017063125.3080347-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gd4nwnw2w5oddwj7"
Content-Disposition: inline
In-Reply-To: <20241017063125.3080347-2-ruanjinjie@huawei.com>
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


--gd4nwnw2w5oddwj7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/4] drm/tests: helpers: Add helper for
 drm_display_mode_from_cea_vic()
MIME-Version: 1.0

On Thu, Oct 17, 2024 at 02:31:22PM +0800, Jinjie Ruan wrote:
> As Maxime suggested, add a new helper
> drm_kunit_display_mode_from_cea_vic(), it can replace the direct call
> of drm_display_mode_from_cea_vic(), and it will help solving
> the `mode` memory leaks.
>=20
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v3:
> - Adjust drm/drm_edid.h header to drm_kunit_helpers.c.
> - Drop the "helper" in the helper name.
> - Add Acked-by.
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 40 +++++++++++++++++++++++
>  include/drm/drm_kunit_helpers.h           |  4 +++
>  2 files changed, 44 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/=
tests/drm_kunit_helpers.c
> index aa62719dab0e..565172990044 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -3,6 +3,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_kunit_helpers.h>
>  #include <drm/drm_managed.h>
> @@ -311,6 +312,45 @@ drm_kunit_helper_create_crtc(struct kunit *test,
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
> + * drm_kunit_display_mode_from_cea_vic() - return a mode for CEA VIC
> +					   for a KUnit test
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
> +drm_kunit_display_mode_from_cea_vic(struct kunit *test, struct drm_devic=
e *dev,
> +				    u8 video_code)
> +{
> +	struct drm_display_mode *mode;
> +	int ret;
> +
> +	mode =3D drm_display_mode_from_cea_vic(dev, video_code);

I'd rather return directly if mode is NULL here...

> +	ret =3D kunit_add_action_or_reset(test,
> +					kunit_action_drm_mode_destroy,
> +					mode);
> +	if (ret)
> +		return NULL;

Because it doesn't really make much sense to register a cleanup action
if we know that it's going to be useless, and possibly be executed right
away.

Maxime

--gd4nwnw2w5oddwj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyCZ8gAKCRAnX84Zoj2+
dj88AX44T7qs4+7hHDIHjECakB6HxSMDoYmzqFmAdPUJ63qBP0sJ/5E904G/mXb6
wxQMP6gBf0PDE8oks2WQSd/fVRua9R6cwNxQohJik93r42zKr0tHNozc8Kk/Aj3l
vLPFdyjHWQ==
=Xz8X
-----END PGP SIGNATURE-----

--gd4nwnw2w5oddwj7--
