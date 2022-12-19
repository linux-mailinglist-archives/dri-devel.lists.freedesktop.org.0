Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FC7650C26
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 13:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED94710E298;
	Mon, 19 Dec 2022 12:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2645D10E298
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TcMj++DKHDSnsJKiF0RSWDsYZGHGKELK4tpk0ddOw10=; b=IzWW/+eF8On48ZVOSFqbkAuVxU
 0k9+br5SyUceFfM5cw5mTlBu2tcxoUKNgLUSHOdvVnnSdFp3vbRr+nmgnG37oeQ6EYSdj0zEwcuXa
 QzxDBEiq/xIZPrPDV50izFsScGe2D6mvqlAQCuh5sz6DoRAKSkMBRmf6qLEggrjzKAshs6JJrCLso
 PZyGDH56U8YM8SQuCV7pm5nEnYisuyUswSACw8UojApgNpRnWfFfMDk/CTJYUWT3eIWjvbi86CyLN
 THkSU7S7yzQYRuFvIhCKtKviGij0RPO1rfK7x0YImxtL0XEf8IYtqGDnEQNBH1v60CO/MhDJJYDv2
 TmbP68nw==;
Received: from [41.74.137.107] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p7Fag-006Ime-KV; Mon, 19 Dec 2022 13:49:58 +0100
Date: Mon, 19 Dec 2022 11:49:47 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v4 0/7] Introduce debugfs device-centered functions
Message-ID: <20221219124947.vk5y3o2tdxhqu7s5@mail.igalia.com>
References: <20221219120621.15086-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="e6l5q2x5nl7lwfcm"
Content-Disposition: inline
In-Reply-To: <20221219120621.15086-1-mcanal@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Wambui Karuga <wambui@karuga.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--e6l5q2x5nl7lwfcm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/19, Ma=EDra Canal wrote:
> This series introduces the initial structure to make DRM debugfs more
> device-centered and it is the first step to drop the
> drm_driver->debugfs_init hooks in the future [1].
>=20
> Currently, DRM debugfs files are created using drm_debugfs_create_files()
> on request. The first patch of this series makes it possible for DRM devi=
ces
> for creating debugfs files during drm_dev_register(). For it, it introduc=
es
> two new functions that can be used by the drivers: drm_debugfs_add_files()
> and drm_debugfs_add_file(). The requests are added to a list and are crea=
ted
> all at once during drm_dev_register(). Moreover, the first patch was base=
d on
> this RFC series [2].
>=20
> The main difference between the RFC series and the current series is the
> creation of a new fops structure to accommodate the new structs and, also,
> the creation of a new drm_debugfs_open. Moreover, the new series uses
> device-managed allocation, returns memory allocation errors, and converts
> more drivers to the new structure.
>=20
> Moreover, since v3, the ability to create debugfs files at late_register =
hooks was
> added. In previous versions, modeset components weren't able to create de=
bugfs
> files at late_register hooks as the registration of drm_minor happens bef=
ore the
> registration of the modeset abstractions. So, the third patch fixes this =
problem
> by adding a drm_debugfs_late_register() function. Thanks to Melissa Wen f=
or
> catching this problem!
>=20
> Apart from the third patch, the series looks similiar from its last versi=
on.
>=20
> [1] https://cgit.freedesktop.org/drm/drm/tree/Documentation/gpu/todo.rst#=
n506
> [2] https://lore.kernel.org/dri-devel/20200513114130.28641-2-wambui.karug=
ax@gmail.com/
>=20
> Best Regards,
> - Ma=EDra Canal
>=20
> ---
>=20
> v1 -> v2: https://lore.kernel.org/dri-devel/20221122190314.185015-1-mcana=
l@igalia.com/T/#t
>=20
> - Fix compilation errors in the second patch (kernel test robot).
> - Drop debugfs_init hook from vkms (Ma=EDra Canal).
> - Remove return values and error handling to debugfs related
> functions (Jani Nikula).
> - Remove entry from list after the file is created, so that drm_debugfs_i=
nit
> can be called more than once (Ma=EDra Canal).
>=20
> v2 -> v3: https://lore.kernel.org/dri-devel/20221123220725.1272155-1-mcan=
al@igalia.com/
>=20
> - Rebase on top of drm-misc-next
>=20
> v3 -> v4: https://lore.kernel.org/dri-devel/20221207132325.140393-1-mcana=
l@igalia.com/
>=20
> - Add Maxime's Reviewed-by tags
> - Add the ability to create debugfs files at late_register hooks (Melissa=
 Wen).

Hi Ma=EDra,

Thanks for addressing all comments.

Maybe Danvet has some inputs for the late_register approach.

Anyway, LGTM and the entire series is:

Reviewed-by: Melissa Wen <mwen@igalia.com>

>=20
> ---
>=20
> Ma=EDra Canal (7):
>   drm/debugfs: create device-centered debugfs functions
>   drm: use new debugfs device-centered functions on DRM core files
>   drm/debugfs: create debugfs late register functions
>   drm/vc4: use new debugfs device-centered functions
>   drm/v3d: use new debugfs device-centered functions
>   drm/vkms: use new debugfs device-centered functions
>   drm/todo: update the debugfs clean up task
>=20
>  Documentation/gpu/todo.rst            |   9 +--
>  drivers/gpu/drm/drm_atomic.c          |  11 ++-
>  drivers/gpu/drm/drm_client.c          |  11 ++-
>  drivers/gpu/drm/drm_debugfs.c         | 102 +++++++++++++++++++++++---
>  drivers/gpu/drm/drm_drv.c             |   3 +
>  drivers/gpu/drm/drm_framebuffer.c     |  11 ++-
>  drivers/gpu/drm/drm_gem_vram_helper.c |  11 ++-
>  drivers/gpu/drm/drm_internal.h        |   5 ++
>  drivers/gpu/drm/drm_mode_config.c     |   2 +
>  drivers/gpu/drm/v3d/v3d_debugfs.c     |  22 +++---
>  drivers/gpu/drm/vc4/vc4_bo.c          |  10 +--
>  drivers/gpu/drm/vc4/vc4_crtc.c        |   7 +-
>  drivers/gpu/drm/vc4/vc4_debugfs.c     |  36 ++-------
>  drivers/gpu/drm/vc4/vc4_dpi.c         |   5 +-
>  drivers/gpu/drm/vc4/vc4_drv.c         |   1 -
>  drivers/gpu/drm/vc4/vc4_drv.h         |  32 ++------
>  drivers/gpu/drm/vc4/vc4_dsi.c         |   6 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c        |  12 +--
>  drivers/gpu/drm/vc4/vc4_hvs.c         |  24 ++----
>  drivers/gpu/drm/vc4/vc4_v3d.c         |  14 +---
>  drivers/gpu/drm/vc4/vc4_vec.c         |   6 +-
>  drivers/gpu/drm/vkms/vkms_drv.c       |  17 ++---
>  include/drm/drm_debugfs.h             |  41 +++++++++++
>  include/drm/drm_device.h              |  15 ++++
>  24 files changed, 233 insertions(+), 180 deletions(-)
>=20
> --=20
> 2.38.1
>=20

--e6l5q2x5nl7lwfcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOgXeIACgkQwqF3j0dL
ehynoBAAjIuD/UehebQL5BIwqEUr4hvf6XCbieGUxUyhKpf73O6hRWslSQ1ArAEG
ZC6l9soqmjLY6HqN8yBL7J7NCsu+ee8BhtF+8TDxO4OrhDGuubeBTRQdDI/y5I7y
0+lmq4dOtVtimKpt+Q2W4bZ7t+PY8QHFFBnQ1dHH4f1+eMIW8Rg9iq/b5BmdLgrq
gccL/G73jJ+ds0Qq4kukz0PiDiLpMdNRXV4FUi9pAt26cOKd7TzRpFyMCygvKTxD
byTZGUfmt+fpQwnKuN3ExAif9hw2g+GR23D+GnxtICYuEMVrRnbMYa4DdX5EwvUW
BiKrC4kOICxNAjq9EjiLShbq/AnkukCN/P28Vf3YgsM72J7ZhyfV4SxfN5S96WG2
EFR4UoBETZhNsffWs9cAMgQbD/UsnwXDxjimahFONXfcw0gUkQ98OeZzJJsE9QwO
kudAmkpLGe+vi0Q2EZu0ADnNRZK8JPwm2FtbXPBa9kKZVnvF1bqrFCh8jMfdz6W6
jsR7jDea15RRsInpTIl3/ILwagPEe+Xln9oqtKue44srK5g6ep/EocaZ8b89sJ6H
fWAyYb5BsNHIxQjjWQweK5ga79wGTssfnX2or7IfCAlzfCuseYZ/fZ2YtpZR5UFE
tkgz4wC69BvH7z2wA6fc33Wk4227cJifxOvYJbaHsj+GCxAuEhM=
=lzAJ
-----END PGP SIGNATURE-----

--e6l5q2x5nl7lwfcm--
