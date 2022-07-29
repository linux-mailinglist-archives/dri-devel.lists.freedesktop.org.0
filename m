Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D10375853B7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F55610F405;
	Fri, 29 Jul 2022 16:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3733F12B906
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I0sePq6rCVZfxouy1PxONZQBMjMeOXI8wteh+r/gn/A=; b=HWxurkv2DxU+7ybwyuSLZWFljF
 QkbcSMRl/25e9R993s3MWb3G/0c+WzjaL9cygJeq1nksguusQKWJcL4rit/6MbKMfTn4rB2BvL1pb
 G+CoLMdBn6w5+hM4kypJITdSari9sUOeTuc9ZbKsrVd96NKkOClHJy5d0DSV8iH4bjbmZ5Fjf5D4p
 CTj1j0JgLCGGQ1Ga6PO6AUowNMcO4KouA5VjR7o8xbC9wFYI1tVBLYh6yr1qqhkUMQ3bYGdEpG2ul
 DMHP/eFq97VC2AT50Fz9Y0uvFTFByhO5GkFeGQnMrVeQrV8ad7Vx0vEL9VpXlL+u6ChIJN/MmgEJ6
 p078m2Vw==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oHT41-00BAtH-OR; Fri, 29 Jul 2022 18:42:13 +0200
Date: Fri, 29 Jul 2022 15:42:00 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH v2] drm/tests: Split up test cases in
 igt_check_drm_format_min_pitch
Message-ID: <20220729164200.tigobs62ylfjk3hs@mail.igalia.com>
References: <20220729124726.748221-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="us3k4w46mzsadc3u"
Content-Disposition: inline
In-Reply-To: <20220729124726.748221-1-mairacanal@riseup.net>
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
Cc: linux-kselftest@vger.kernel.org,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 David Gow <davidgow@google.com>, siqueirajordao@riseup.net,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 tales.aparecida@gmail.com, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, kunit-dev@googlegroups.com,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--us3k4w46mzsadc3u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/29, Ma=EDra Canal wrote:
> The igt_check_drm_format_min_pitch() function had a lot of
> KUNIT_EXPECT_* calls, all of which ended up allocating and initializing
> various test assertion structures on the stack.
>=20
> This behavior was producing -Wframe-larger-than warnings on PowerPC, i386,
> and MIPS architectures, such as:
>=20
> drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_forma=
t_min_pitch':
> drivers/gpu/drm/tests/drm_format_test.c:271:1: error: the frame size of
> 3712 bytes is larger than 2048 bytes
>=20
> So, the igt_check_drm_format_min_pitch() test case was split into three
> smaller functions: one testing single plane formats, one testing
> multi-planar formats, and the other testing tiled formats.
>=20
> Fixes: 0421bb0baa84 ("drm: selftest: convert drm_format selftest to KUnit=
")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ma=EDra Canal <mairacanal@riseup.net>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Andr=E9 Almeida <andrealmeid@igalia.com>

Applied to drm-misc-next

Thanks,

Melissa
> ---
> v1 -> v2:
> - Add Guenter's Tested-by tag.
> - Add Andr=E9's Reviewed-by tag.
> - Replace "multiple planes" for "multi-planar" (Andr=E9 Almeida).
> - Add Fixes tag (Melissa Wen).
> ---
>  drivers/gpu/drm/tests/drm_format_test.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_format_test.c b/drivers/gpu/drm/te=
sts/drm_format_test.c
> index 056cb8599d6d..afb4bca72187 100644
> --- a/drivers/gpu/drm/tests/drm_format_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_test.c
> @@ -91,7 +91,7 @@ static void igt_check_drm_format_block_height(struct ku=
nit *test)
>  	KUNIT_EXPECT_FALSE(test, drm_format_info_block_height(info, -1));
>  }
> =20
> -static void igt_check_drm_format_min_pitch(struct kunit *test)
> +static void igt_check_drm_format_min_pitch_for_single_plane(struct kunit=
 *test)
>  {
>  	const struct drm_format_info *info =3D NULL;
> =20
> @@ -175,6 +175,11 @@ static void igt_check_drm_format_min_pitch(struct ku=
nit *test)
>  			(uint64_t)UINT_MAX * 4);
>  	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)=
),
>  			(uint64_t)(UINT_MAX - 1) * 4);
> +}
> +
> +static void igt_check_drm_format_min_pitch_for_multi_planar(struct kunit=
 *test)
> +{
> +	const struct drm_format_info *info =3D NULL;
> =20
>  	/* Test 2 planes format */
>  	info =3D drm_format_info(DRM_FORMAT_NV12);
> @@ -249,6 +254,11 @@ static void igt_check_drm_format_min_pitch(struct ku=
nit *test)
>  			(uint64_t)(UINT_MAX - 1) / 2);
>  	KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, (UINT_MAX - 1)=
 / 2),
>  			(uint64_t)(UINT_MAX - 1) / 2);
> +}
> +
> +static void igt_check_drm_format_min_pitch_for_tiled_format(struct kunit=
 *test)
> +{
> +	const struct drm_format_info *info =3D NULL;
> =20
>  	/* Test tiled format */
>  	info =3D drm_format_info(DRM_FORMAT_X0L2);
> @@ -273,7 +283,9 @@ static void igt_check_drm_format_min_pitch(struct kun=
it *test)
>  static struct kunit_case drm_format_tests[] =3D {
>  	KUNIT_CASE(igt_check_drm_format_block_width),
>  	KUNIT_CASE(igt_check_drm_format_block_height),
> -	KUNIT_CASE(igt_check_drm_format_min_pitch),
> +	KUNIT_CASE(igt_check_drm_format_min_pitch_for_single_plane),
> +	KUNIT_CASE(igt_check_drm_format_min_pitch_for_multi_planar),
> +	KUNIT_CASE(igt_check_drm_format_min_pitch_for_tiled_format),
>  	{ }
>  };
> =20
> --=20
> 2.37.1
>=20

--us3k4w46mzsadc3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLkDcoACgkQwqF3j0dL
ehxEEg/+OchgHJgfQDSDNvSuoU6LSFztXLcnsmVB1tAc0/mhQZGml7wGaqof2SAn
AthWTU8hPxjS6IP2xg+8GnhAagJVSDTbKr8nBGd8jguGtYAC+MeoK1ow+UYPgERH
XUFZ6IYGtEHanOfw4UXsczgUsTOsxmAsHjAlVmeikCUXTQNsyXd3D7IYBoubgef/
TRSAoa1HTCHaQLymIXNJC5HoT2W1DuUuo9nfBI5qv3F9fhCQbNTPJiZer6R1qhks
rpvQcJwJ3FvdEQ0CooH8zuyzw0CtaNPFCeA64ldeDSmhONXjHNYFSmEZ9XgO3g4z
ylOqVPDpM8/XaZ4ZOion5VP/THoOxBFKIYa3VwZ7w7sEsVSuBSGSuC5MJQXxjPeB
xDtxWY4ZiMVKGwWcfQpkgNHW/yaDVWIxtTqW++hhGzWLh9BI8PfYDmbOEshvWQKO
9Z/O4hFsF5bkj96bAwwLZtyhBayziz6rf7RheqfoRmhwfbX9e8CFRoFqTLsywD/C
3YyZTTMJHFPhhNKTPHVchfeqei18zdFDnPUCvGdQZERY3ktAzbV/ld9gFuEV2nqe
/66fxjfw//s4Pw4w4UJDZ9oj1wuVtGU4g/ZadwIl0TdVcrrK8ptKn48aJy0CQJW8
CY0rxO0pnYX4Oh/MxsR/0/5oRtoqrKj0BKOYvCq5B07f7oOX1g4=
=Jncg
-----END PGP SIGNATURE-----

--us3k4w46mzsadc3u--
