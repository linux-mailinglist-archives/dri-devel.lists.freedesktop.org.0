Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5994AD5E3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 12:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6115810E1E7;
	Tue,  8 Feb 2022 11:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4995D10E557
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sX3DfUMMqWn2PlopuaBfzSt4VGKdEEyvgtR1woJ2yUY=; b=H8l15wSfj7p9X7dWo1LFeB+SY1
 5MG73yi60ZlSyvNNYCf4LTJ/y7ZC/Vj+HmTjmhEC9exBBvDz/NW92GnQ5ZG/FIyBpJUZiZ+hwHIII
 r2Huu97QRAT9uNYJPCtuV16xoMwvFY5mqfaC6PugYbtQPJNDWcyXExS9igq/E08M6RadvhD1FQmmG
 m0NdshS2kAMFbNvK/PWGGhU9hZ/oZl93O0z2/9PcH0E9accksOfXpeB20UGYF7WO3xluFjmxgjin2
 pR7bxASlkXmHQR5dVI2WUFxpTi2gSrgAA2QKvA7HvVzvGAAhiUQaWPMCIGnPyDipXRvv1CUiv2A8i
 2FPoVFJQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nHOHk-0007jh-80; Tue, 08 Feb 2022 12:03:48 +0100
Date: Tue, 8 Feb 2022 10:03:28 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 0/9] Add new formats support to vkms
Message-ID: <20220208110328.4t3owc6zqjdvx7tk@mail.igalia.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ccogpb7fnstqjnox"
Content-Disposition: inline
In-Reply-To: <20220121213831.47229-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, tzimmermann@suse.de,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ccogpb7fnstqjnox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/21, Igor Torrente wrote:
> Summary
> =3D=3D=3D=3D=3D=3D=3D
> This series of patches refactor some vkms components in order to introduce
> new formats to the planes and writeback connector.
>=20
> Now in the blend function, the plane's pixels are converted to ARGB161616=
16
> and then blended together.
>=20
> The CRC is calculated based on the ARGB1616161616 buffer. And if required,
> this buffer is copied/converted to the writeback buffer format.
>=20
> And to handle the pixel conversion, new functions were added to convert
> from a specific format to ARGB16161616 (the reciprocal is also true).
Hi Igor,

Thanks a lot for your work to improve the VKMS.
Overall, lgtm. I've pointed out some minor improvements, most of them
to better describe changes.
It seems that your are using a different version of the kms_cursor_crc test
and the test results diverge. Can you update and double-check the
statictics?

I also consider important to keep the version changes in the body of
each commit message. Can you move them to a place that it will not be
ignored when applying?
>=20
> Tests
> =3D=3D=3D=3D=3D
> This patch series was tested using the following igt tests:
> -t ".*kms_plane.*"
> -t ".*kms_writeback.*"
> -t ".*kms_cursor_crc*"
> -t ".*kms_flip.*"
>=20
> New tests passing
> -------------------
> - pipe-A-cursor-size-change
> - pipe-A-cursor-alpha-transparent
>=20
> Performance
> -----------
> Further optimizing the code, now it's running slightly faster than the V2.
> And it consumes less memory than the current implementation in the common=
 case
> (more detail in the commit message).
>=20
> Results running the IGT tests `kms_cursor_crc`:
>=20
> |                             Frametime                                 |
> |:---------------:|:---------:|:--------------:|:------------:|:-------:|
> |  implmentation  |  Current  |  Per-pixel(V1) | Per-line(V2) |   V3    |
> | frametime range |  8~22 ms  |    32~56 ms    |    6~19 ms   | 5~18 ms |
> |     Average     |  10.0 ms  |     35.8 ms    |    8.6 ms    |  7.3 ms |
>=20
> | Memory consumption (output dimensions) |
> |:--------------------------------------:|
> |       Current      |     This patch    |
> |:------------------:|:-----------------:|
> |   Width * Heigth   |     2 * Width     |
>=20
> XRGB to ARGB behavior
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> During the development, I decided to always fill the alpha channel of
> the output pixel whenever the conversion from a format without an alpha
> channel to ARGB16161616 is necessary. Therefore, I ignore the value
> received from the XRGB and overwrite the value with 0xFFFF.
And you can also drop this TO-DO here (Clearing primary plane):
https://dri.freedesktop.org/docs/drm/gpu/vkms.html#add-plane-features

With these points addressed, you can add my r-b to the entire series:
Reviewed-by: Melissa Wen <mwen@igalia.com>

>=20
> ---
> Igor Torrente (9):
>   drm: vkms: Replace the deprecated drm_mode_config_init
>   drm: vkms: Alloc the compose frame using vzalloc
>   drm: vkms: Replace hardcoded value of `vkms_composer.map` to
>     DRM_FORMAT_MAX_PLANES
>   drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
>   drm: vkms: Add fb information to `vkms_writeback_job`
>   drm: drm_atomic_helper: Add a new helper to deal with the writeback
>     connector validation
>   drm: vkms: Refactor the plane composer to accept new formats
>   drm: vkms: Adds XRGB_16161616 and ARGB_1616161616 formats
>   drm: vkms: Add support to the RGB565 format
>=20
>  drivers/gpu/drm/drm_atomic_helper.c   |  39 +++
>  drivers/gpu/drm/vkms/Makefile         |   1 +
>  drivers/gpu/drm/vkms/vkms_composer.c  | 336 +++++++++++++-------------
>  drivers/gpu/drm/vkms/vkms_drv.c       |   6 +-
>  drivers/gpu/drm/vkms/vkms_drv.h       |  20 +-
>  drivers/gpu/drm/vkms/vkms_formats.c   | 279 +++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.h   |  49 ++++
>  drivers/gpu/drm/vkms/vkms_plane.c     |  47 ++--
>  drivers/gpu/drm/vkms/vkms_writeback.c |  32 ++-
>  include/drm/drm_atomic_helper.h       |   3 +
>  10 files changed, 600 insertions(+), 212 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>=20
> --=20
> 2.30.2
>=20

--ccogpb7fnstqjnox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmICTfwACgkQwqF3j0dL
ehzF9w//Sx9EAeijI28NKpDAxOQod4QhFaC8Gm9k/oS2cDhLya16qqcYlnhbHzCC
zTZYZFSYcLCqGaHSy9trtUarnXrZnEX050KCchM93n/AZPJYFdAR4Pdpv3yr5VOQ
m1wQDjP4Yp9zmqBXmbYKH4MvdDF5W1TB3pK36/4hCUnZwYPTOH8XBvrqraxNLb8G
fgHqLUXgabs7xXKrSkprVjByNbwk5Zryu3p9Vi+qRMm5aLAjcsLRYXkA+lY9FqW7
PN9DMqg+DgD+JFqdiQXe97zO/zWsRc/nCniALOFV+SJe+DdT+gsBtgzR2vK/GESh
9w+SJ5L4yVsYUO99EAYnaYLBdikx9o0LVkwbahii4eVEqfOOp8JdbFmAHVNVSjwo
u+CSIPYz933oygFZUGpSYrWzjdsfD0IwMsl8LsbzQ7G6dOgtgo6kgzMvFOXyfVgh
ZcGBWSpazk3vJQLSwCy8bzCMZJKaW650ekYdImjFLvL+pZHLCHqAjaM7VL4snAdq
FLTzIpPNNvrdJ2gATdfR02Z45AkGbXRmmdtV63u6vFxrvYEHrICz+3vGMXKcCf33
giYd5Q2bl96DoUVUHMRP9a2Kl8fJfgWEuWd7ezk7EfWUONJn2X/nErXN5QUStVkV
VzCwz0YF+OV2dKwWb1DlU6x92xDIGS1esPSAXHKxtZXWMKAGI5o=
=7bT2
-----END PGP SIGNATURE-----

--ccogpb7fnstqjnox--
