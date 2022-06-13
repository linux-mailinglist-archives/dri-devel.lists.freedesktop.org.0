Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C765D5483B9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 11:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BFA10E00F;
	Mon, 13 Jun 2022 09:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846A110E00F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eXBW0ddGCL1eF3f/FHluJx40z+EKC/yvlo/y3VoaFfI=; b=KL+56fEbdvN/ufJrIDP4SuR739
 t4SOI2k+FV2G0cvg7rwLwG4bkOQl/TYW85/AOTmORHz7PnGPVeT944Vgzq1lYmFFouTajtkmzi18B
 P7DZh3tUtOUQ0vl/i+AJuYH89O3svyuPLZo6epzc8nEbvMf9p0A+lwKtmekVXXLYRA1J9cQn6pnLK
 OM8c6mundatJPAFfRIGtYAidY+I9CIU5qhoVBum79Ly/EtGFqnCrl91kR7mwczk1VWwCdCFHMFr/7
 grO3eePBpFSUiaXGkxCXeD6EkRts9b3eLDZGhaRg1XaGFIo+csWXWsj0wkpA3Xj4yt5Yhl7SGRRTG
 EqD79fEA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1o0gkR-000PhH-2M; Mon, 13 Jun 2022 11:52:39 +0200
Date: Mon, 13 Jun 2022 08:52:02 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 0/9] Add new formats support to vkms
Message-ID: <20220613095202.sxlbt7aot5hid6e2@mail.igalia.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="di6pzabxuoapofhu"
Content-Disposition: inline
In-Reply-To: <20220404204515.42144-1-igormtorrente@gmail.com>
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
 tales.aparecida@gmail.com, leandro.ribeiro@collabora.com,
 melissa.srw@gmail.com, ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--di6pzabxuoapofhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/04, Igor Torrente wrote:
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
> It's running slightly faster than the current implementation.
>=20
> Results running the IGT[1] test
> `igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen` ten times:
>=20
> |                  Frametime                   |
> |:--------------------------------------------:|
> |  Implementation |  Current  |   This commit  |
> |:---------------:|:---------:|:--------------:|
> | frametime range |  9~22 ms  |     10~22 ms   |
> |     Average     |  11.4 ms  |     12.32 ms   |
>=20
> Memory consumption
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> It consumes less memory than the current implementation in
> the common case (more detail in the commit message).
>=20
> | Memory consumption (output dimensions) |
> |:--------------------------------------:|
> |       Current      |     This patch    |
> |:------------------:|:-----------------:|
> |   Width * Heigth   |     2 * Width     |
>=20
> [1] IGT commit id: bc3f6833a12221a46659535dac06ebb312490eb4
>=20
> XRGB to ARGB behavior
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> During the development, I decided to always fill the alpha channel of
> the output pixel whenever the conversion from a format without an alpha
> channel to ARGB16161616 is necessary. Therefore, I ignore the value
> received from the XRGB and overwrite the value with 0xFFFF.
>=20
> Primary plane and CRTC size
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> This patch series reworks the blend function to accept a primary plane wi=
th
> a different size and position from CRTC.
> Because now we need to fill the background, we had a loss in
> performance with this change
>=20
> ---
Hi Igor,

Thanks for this effort.

> Igor Torrente (9):
>   drm: vkms: Alloc the compose frame using vzalloc

As this first patch fixes an error on vkms, I cherry-picked it and
applied to drm-misc-next.

For remaining patches, looking forward the next version addressing
feedback and rebasing them too.

Best Regards,

Melissa

>   drm: vkms: Replace hardcoded value of `vkms_composer.map` to
>     DRM_FORMAT_MAX_PLANES
>   drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
>   drm: drm_atomic_helper: Add a new helper to deal with the writeback
>     connector validation
>   drm: vkms: Add fb information to `vkms_writeback_job`
>   drm: vkms: Refactor the plane composer to accept new formats
>   drm: vkms: Supports to the case where primary plane doesn't match the
>     CRTC
>   drm: vkms: Adds XRGB_16161616 and ARGB_1616161616 formats
>   drm: vkms: Add support to the RGB565 format
>=20
>  Documentation/gpu/vkms.rst            |  13 +-
>  drivers/gpu/drm/drm_atomic_helper.c   |  39 ++++
>  drivers/gpu/drm/vkms/Makefile         |   1 +
>  drivers/gpu/drm/vkms/vkms_composer.c  | 325 ++++++++++++--------------
>  drivers/gpu/drm/vkms/vkms_crtc.c      |   4 +
>  drivers/gpu/drm/vkms/vkms_drv.h       |  41 +++-
>  drivers/gpu/drm/vkms/vkms_formats.c   | 298 +++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c     |  50 ++--
>  drivers/gpu/drm/vkms/vkms_writeback.c |  35 ++-
>  include/drm/drm_atomic_helper.h       |   3 +
>  11 files changed, 596 insertions(+), 225 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>=20
> --=20
> 2.30.2
>=20

--di6pzabxuoapofhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmKnCLsACgkQwqF3j0dL
ehyrvBAAplWgxsmT6RJ+TOMp/LThlsdxykuF0W6Vjnqjemt06SolkY0+KOrV3GL6
ncZITOS7pg9NQOvT+EZXcOwCMiay8kMlMxSL689pzX3cg68T3ALmL9ZTG5Ij8NC1
h5+T3L+vaw/v2greQE7PDy0pvaZEXxXjRZ8lO58TISCQRs39NAdGV9TiHjhgN1vH
b0n57HAYmreRr9Czmlk2vsWOeF4ZuAK13Tsm4NYtc3ql2p/RGN9pmyvYP49GK0zo
kRlbYhWVdvpmgE9E2F4uZHDQHuFUiDzB6vYX8dJ1RHwc8ln3OGdc1JSBGkxXNkHT
hdKcOUwepMAcqpvUCF8OOMV0hUOBhxjnud1mxxhb1FhtPDGkCPjGXFcKYXtFlMZH
HOlJjAshnLeAHcLP2HdpBwtOwyuwNSS6hibPxF4xLBTqD32d01/jCd2/To8S2ipR
VqEnPcm7G4ovQ8o/5hd2Ax94SlH8gSpCYaPgFyOML3Wa7E39n08KWBGCCWZUJBOh
wt82KMhrH74AXZZVfht6mXY15Wn8mi07au2NmnNlTO64tXDzqapGRYJgKbSlXqM8
/H21vqEeL3dHjqOyc/mJyDYcsUULgRBhR0N7/wPvSKt8kUCdNBcZR6L8zQZTcYAw
cyQZIiF1xnStjsKJwvG+0LKsJXZ8ZSpvAoNJmJ3Ur9EKhv9DREU=
=jc6S
-----END PGP SIGNATURE-----

--di6pzabxuoapofhu--
