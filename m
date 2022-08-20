Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE0059AD64
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 13:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FBB10E0AE;
	Sat, 20 Aug 2022 11:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882AD10E09B
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Aug 2022 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1o02h240fDamDsQkrI6u3iO+t1i/vtuno1q+gq9LLxk=; b=QYRMwDx8e+Om46aljw5W2sgtmX
 mpgLUcBdCi9I2B1dMBBkh93SKrnZXC6G0BCs3I+OXIi9WSM8IvNhj1qDiA1GXB8Jv6nxZt/Q5s0f7
 5K/LXd322hCA0ZMZAHZY8RHL4nJUdy3+LynD6oXy5KhRbiVxrEqrZxwzupxMQn/ITdOmjs71ouoMg
 BWy03BE4TFZDLgs5VtHazqZTd0oE8UIhGnvvWVma+JiO7pfUnB+HNdrh+uMhFLwWbs5tdppyaaH/a
 Stb9RAF2TCg+5H4pqaJlJ8se+AJf9XcRaYjE6qJRbVxx1LMFO80GwncayikKHQp5E877cFWRr5APa
 bLqb20Sw==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oPMKC-00D0aU-L4; Sat, 20 Aug 2022 13:07:32 +0200
Date: Sat, 20 Aug 2022 10:07:08 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [RESEND v6 0/9] Add new formats support to vkms
Message-ID: <20220820110708.pdqau4g4mc4r54hp@mail.igalia.com>
References: <20220819182411.20246-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nm2at6cdwzjg6j4z"
Content-Disposition: inline
In-Reply-To: <20220819182411.20246-1-igormtorrente@gmail.com>
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


--nm2at6cdwzjg6j4z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/19, Igor Torrente wrote:
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

I missed it after taking some weeks off.

The entire series LGTM.
I pointed out some nitpicks, but I'll handle when applying to
drm-misc-next.

The series is:
Reviewed-by: Melissa Wen <mwen@igalia.com>

Thank you,

Melissa

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
>=20
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
>  drivers/gpu/drm/vkms/vkms_drv.h       |  39 +++-
>  drivers/gpu/drm/vkms/vkms_formats.c   | 302 +++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c     |  50 ++--
>  drivers/gpu/drm/vkms/vkms_writeback.c |  39 +++-
>  include/drm/drm_atomic_helper.h       |   3 +
>  10 files changed, 586 insertions(+), 220 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>=20
> --=20
> 2.30.2
>=20

--nm2at6cdwzjg6j4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMAwFwACgkQwqF3j0dL
ehylfxAAnIAjR1W+X5P4xTAGuHXs7bN8ApyOcaHZTcJOORvv85EhXXbYT/R5Voz1
VgYaOYTINFx5FmZy93CotLv+GAnual4M80GTYJ7LVD1yukBqoh63qtC+WHu/4JGv
PS4nUugaTfrVMYJa15jHEEwuUzzRti10kAHCzwhv6LPbKUEcrAbGdGowksXG5js3
gGTLDUKNz121TI+hr9OkUY54B7yc5WEHnFnqejDncdlU0SnOl/gK+ukYE/gmiram
UCd8NTr+/NeTQXMFhQNKXdpAifHdLanGqBCvfXBvROr+Njy5EYYpvGqzu+GbJZ6T
LPe6wbvyIeE551f+j1nuH5xhJ9ca49nzndCIFPHuw/hEc2/TlS0Uy7fguT8Qi6IW
oXs7F91/WCu7lwtI5c1vL3XxY/5WjAzGFHepZthe0PFJuBo9D4JPC6Dnwvnz3L9H
bre21SBd/M9nvTs15v5d7QNBRXy3WjJjdIrLNz/bjZTP7bUp2J4A/noGR6erM//+
8Na/uuuajdo0j8sCbdnVnqJjcg2fB7peO/q8YUaAemA0rCGEV4mUj8FM4ZLnDIFE
oN2rLOP8s4ahMJaI0PDPWIDnKxcLsQ5Wcl8rLKX5KIIVb7UOY3dRsSP1rpf6xgcb
p+iOoo9+SkXNp6UrWZ/MCA0ZPmxbXdoWBGVNqZZK2Yqz8WD3+jE=
=YqYq
-----END PGP SIGNATURE-----

--nm2at6cdwzjg6j4z--
