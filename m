Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904DE9A21EB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 14:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5EB10E805;
	Thu, 17 Oct 2024 12:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VJ/QLe9F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAAF10E7FE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 12:13:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BC645C53E8;
 Thu, 17 Oct 2024 12:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0459C4CEC3;
 Thu, 17 Oct 2024 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729167205;
 bh=FZrh2cYXSymBvwhsnn+sY5mjJHV0HuES4LzynSZHkyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VJ/QLe9Fl2ZF0wDKwObrrbSp4f57etrtYEhUwJ1YIA1e0QCwyrTrvUYmSps+gO70M
 AIdKg7p2yNm0EwiUZsYG6sSnYcaXXzwA9wnJkdL/m7KMUvlreBvpnUReo+yy4cvtaK
 UCv7dSYUn/QGf1WlUbi32YGLXnrpdw0RMUR2j+GWP/FsPPYuN+on3WUgse2V7R2fIN
 ATyscKmNIc4RENBJhPPQrm3XlH+bjyflr+Khs+QAfUqPVkIC48hISH8WjBbcLzPLRR
 SzBLVeNSJ/st4MryBYoOHqNwAougUPuvurlJabVZ9TZN4vYuWXIK0MJXMwl2e0PGlM
 jkZB8lo7SQ5kw==
Date: Thu, 17 Oct 2024 14:13:21 +0200
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
Message-ID: <20241017-fearless-terrier-from-avalon-b9769f@houat>
References: <20241014125204.1294934-1-ruanjinjie@huawei.com>
 <20241014125204.1294934-2-ruanjinjie@huawei.com>
 <20241016-poised-athletic-adder-ef2998@houat>
 <8ddc72c9-8662-59d0-c3b6-904f2688cb29@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jr3n2neihasnwj2m"
Content-Disposition: inline
In-Reply-To: <8ddc72c9-8662-59d0-c3b6-904f2688cb29@huawei.com>
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


--jr3n2neihasnwj2m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 09:33:07AM GMT, Jinjie Ruan wrote:
> >> diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_h=
elpers.h
> >> index e7cc17ee4934..1e7fd4be550c 100644
> >> --- a/include/drm/drm_kunit_helpers.h
> >> +++ b/include/drm/drm_kunit_helpers.h
> >> @@ -4,6 +4,7 @@
> >>  #define DRM_KUNIT_HELPERS_H_
> >> =20
> >>  #include <drm/drm_drv.h>
> >> +#include <drm/drm_edid.h>
> >>
> >>  #include <linux/device.h>
> >> =20
> >> @@ -120,4 +121,9 @@ drm_kunit_helper_create_crtc(struct kunit *test,
> >>  			     const struct drm_crtc_funcs *funcs,
> >>  			     const struct drm_crtc_helper_funcs *helper_funcs);
> >> =20
> >> +struct drm_display_mode *
> >> +drm_kunit_helper_display_mode_from_cea_vic(struct kunit *test,
> >> +					   struct drm_device *dev,
> >> +					   u8 video_code);
> >=20
> > It's not clear to me what you need the drm_edid header, you just return
> > a drm_display_mode pointer so you can just forward declare the structure
>=20
>=20
> There is a compile error without the header=EF=BC=8Cbecause there is no
> "drm_display_mode_from_cea_vic()" declare.
>=20
> drivers/gpu/drm/tests/drm_kunit_helpers.c:341:16: error: implicit
> declaration of function =E2=80=98drm_display_mode_from_cea_vic=E2=80=99; =
did you mean
> =E2=80=98drm_kunit_display_mode_from_cea_vic=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>   341 |         mode =3D drm_display_mode_from_cea_vic(dev, video_code);
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                drm_kunit_display_mode_from_cea_vic
> drivers/gpu/drm/tests/drm_kunit_helpers.c:341:14: warning: assignment to
> =E2=80=98struct drm_display_mode *=E2=80=99 from =E2=80=98int=E2=80=99 ma=
kes pointer from integer
> without a cast [-Wint-conversion]
>   341 |         mode =3D drm_display_mode_from_cea_vic(dev, video_code);
>       |              ^

Right, but the error is in the C file, not the header.

Maxime

--jr3n2neihasnwj2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxD/YAAKCRAnX84Zoj2+
dgqwAX9Cl1tRywgR6t4UbBMXW2l8tdFFiFYGwo/RwCqlmNME7a2m3LOA+UEPwKMZ
h2djCgEBgOukMQIw3mWIdAEkUtuwe2MNdopAp1rNumoDvksclKfXWrBtvKH4gYad
naPhDqXd5A==
=OXLz
-----END PGP SIGNATURE-----

--jr3n2neihasnwj2m--
