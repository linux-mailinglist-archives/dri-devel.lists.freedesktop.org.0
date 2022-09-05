Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206185ADAF4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 23:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D7210E2A0;
	Mon,  5 Sep 2022 21:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D3C10E2A0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 21:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nx8GC4zN2UaS3+tECFgfy6WKVxCM6mTL9dQUXjF+T3Q=; b=M0ATbBO9CN61zp3BbLXp0ZX0LO
 UN3bwSN1/zDGlG32X08F0/wj4wtlKZmOa8/bcyZHsgnjUi9NLeOmvt7kmZlQ5C3Ez5GxQ/1xFC5LP
 Yj24BDFQ7bjtLvB4p7CFZIA74JJIFDTevQhIDANA9jHELUuf0XOZMd7qNsAgb+U6Xm0NFkGULld8K
 etgGqYwsl3hL44KYLIrtv+z+ZH8eZv52Z+Au7O9pd/JCv5+Di7A9sHA8APz1x2FIdSALtmveo/IL3
 pjXcw44brCbtz1VjQUZJCrwzZQh4dHAy5rA9CurW0oaflBmwkQ//U0EY4MZkIoviP9K7EILBeE+zd
 JCJqMquw==;
Received: from [38.44.74.92] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oVJuu-00BJS1-Qm; Mon, 05 Sep 2022 23:46:04 +0200
Date: Mon, 5 Sep 2022 20:45:51 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v7 0/9] Add new formats support to vkms
Message-ID: <20220905214551.re6lc47svocoesyf@mail.igalia.com>
References: <20220905190811.25024-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jizrtriizn25xenx"
Content-Disposition: inline
In-Reply-To: <20220905190811.25024-1-igormtorrente@gmail.com>
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


--jizrtriizn25xenx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/05, Igor Torrente wrote:
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
Hi Igor,

Thanks for this great work!
I just applied to drm-misc-next (I did some minor code-style fixes when
applying too).

Best Regards,

Melissa

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
> Alpha channel output for XRGB formats
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> There's still an open question about which value the writeback alpha chan=
nel
> should be for XRGB formats.
> The current igt test implementation is expecting the channel to not be ch=
ange.
> But it's not entirely clear if this should be the behavior followed by vk=
ms
> (or any other driver).
>=20
> Open issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/118
> ---
> Igor Torrente (9):
>   drm: vkms: Replace hardcoded value of `vkms_composer.map` to
>     DRM_FORMAT_MAX_PLANES
>   drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
>   drm: drm_atomic_helper: Add a new helper to deal with the writeback
>     connector validation
>   drm: vkms: get the reference to `drm_framebuffer` instead if coping it
>   drm: vkms: Add fb information to `vkms_writeback_job`
>   drm: vkms: Refactor the plane composer to accept new formats
>   drm: vkms: Supports to the case where primary plane doesn't match the
>     CRTC
>   drm: vkms: Adds XRGB_16161616 and ARGB_1616161616 formats
>   drm: vkms: Add support to the RGB565 format
>=20
>  Documentation/gpu/vkms.rst            |   7 +-
>  drivers/gpu/drm/drm_atomic_helper.c   |  39 ++++
>  drivers/gpu/drm/vkms/Makefile         |   1 +
>  drivers/gpu/drm/vkms/vkms_composer.c  | 314 ++++++++++++--------------
>  drivers/gpu/drm/vkms/vkms_drv.h       |  33 ++-
>  drivers/gpu/drm/vkms/vkms_formats.c   | 302 +++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c     |  50 ++--
>  drivers/gpu/drm/vkms/vkms_writeback.c |  39 +++-
>  include/drm/drm_atomic_helper.h       |   3 +
>  10 files changed, 580 insertions(+), 220 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>=20
> --=20
> 2.30.2
>=20

--jizrtriizn25xenx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMWbgUACgkQwqF3j0dL
ehxFcA/8Dcg0cvKSTeymDCtb9XVSPaDhSlO7wxrMo3JB5ymF2NlMcHZN1gsk7t+P
i3VY6AtqbXII2+vmArnyj8SHcgFSyhj4BmigaIhwDwxureUcJP+HAsWs4ozvc2Tc
mbfUKxqH2XA6OnJsw57GJEUXeeAYwa+41ZWZE0GsYkUjOUTY9cRyiuiduaMJUpq5
Q6+VUZWjFZns0H+Qt/yC3jIRV3aZJDFLObg6ArX0bph6m4zZ9Nir+jRtgUJ+4zZe
ue82Y4NlltkyB1UADsmUbEh+3UsCaOJ27EuODPLLYAi+ROo3BGCVEPQSHLECBJJG
KnV6kwrurOqp2mRL1Zfmg30qptu3bsKvi2j8Mtv+R0xgMDsf0A6jsQjXwHp35Pdy
ud9ZOW/NkgAWWqqS+H7ql9+3JX5/KzCZRrdJlXe1T3VemK713ONAxN9tnZ6I8wOc
K0dSKwem/iquM4ge0OA0L03JFk0ZqnE8lw4j7SUj2QW1jqguuazLN6K+s3/cpbjE
7UgzLwfb1XFZ8I2prHQBRzN7UG5Tu0DDwOftGZGzrgo+aq3Fp5zsRsUqNPa5+0od
iMxIQJ6CragNjJWlgKieLLli/ELqWqPgAMZ09fyMdH6AwsTauvZXT9Qk6AzSXr8C
vr1/v8Z/scRMHRSZUNDckxYIWSr4QPI80VDuGWjPzion9wqH1Os=
=jkGA
-----END PGP SIGNATURE-----

--jizrtriizn25xenx--
