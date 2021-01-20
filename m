Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F052FCFC2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 13:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2335F6E1D3;
	Wed, 20 Jan 2021 12:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A58B6E19A;
 Wed, 20 Jan 2021 12:14:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9536AAAE;
 Wed, 20 Jan 2021 12:14:37 +0000 (UTC)
Subject: Re: [PULL] drm-misc-fixes
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <YAgdYGNoH7pC29rz@linux-uq9g>
Message-ID: <d7d5a54a-5121-7fe9-e35f-65fb64fd30f6@suse.de>
Date: Wed, 20 Jan 2021 13:14:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YAgdYGNoH7pC29rz@linux-uq9g>
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
Cc: Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============2137889029=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2137889029==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GpSWVjwQcxv6PCzx5qVOjZtNKk0T7zqSp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GpSWVjwQcxv6PCzx5qVOjZtNKk0T7zqSp
Content-Type: multipart/mixed; boundary="NDGbK6FlkXIB0hj9nBPDKUj1oD36q2gZx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Message-ID: <d7d5a54a-5121-7fe9-e35f-65fb64fd30f6@suse.de>
Subject: Re: [PULL] drm-misc-fixes
References: <YAgdYGNoH7pC29rz@linux-uq9g>
In-Reply-To: <YAgdYGNoH7pC29rz@linux-uq9g>

--NDGbK6FlkXIB0hj9nBPDKUj1oD36q2gZx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 20.01.21 um 13:09 schrieb Thomas Zimmermann:
> Hi Dave and Daniel,
>=20
> here's this week's PR for drm-misc-next.

drm-misc-fixes

>=20
> Best regards
> Thomas
>=20
> drm-misc-fixes-2021-01-20:
> Short summary of fixes pull (less than what git shortlog provides):
>=20
>   * drm/atomic: Release state on error
>   * drm/syncobj: Fix use-after-free
>   * drm/ttm: Don't use GFP_TRANSHUGE_LIGTH
>   * drm/vc4: Unify driver naming for PCM
>   * drm/vram-helper: Fix memory leak in vmap
> The following changes since commit 19c329f6808995b142b3966301f217c831e7=
cf31:
>=20
>    Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)
>=20
> are available in the Git repository at:
>=20
>    git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-=
01-20
>=20
> for you to fetch changes up to a37eef63bc9e16e06361b539e528058146af80ab=
:
>=20
>    drm/syncobj: Fix use-after-free (2021-01-20 10:28:39 +0100)
>=20
> ----------------------------------------------------------------
> Short summary of fixes pull (less than what git shortlog provides):
>=20
>   * drm/atomic: Release state on error
>   * drm/syncobj: Fix use-after-free
>   * drm/ttm: Don't use GFP_TRANSHUGE_LIGTH
>   * drm/vc4: Unify driver naming for PCM
>   * drm/vram-helper: Fix memory leak in vmap
>=20
> ----------------------------------------------------------------
> Christian K=C3=B6nig (1):
>        drm/ttm: stop using GFP_TRANSHUGE_LIGHT
>=20
> Daniel Vetter (1):
>        drm/syncobj: Fix use-after-free
>=20
> Nicolas Saenz Julienne (1):
>        drm/vc4: Unify PCM card's driver_name
>=20
> Pan Bian (1):
>        drm/atomic: put state on error path
>=20
> Thomas Zimmermann (1):
>        drm/vram-helper: Reuse existing page mappings in vmap
>=20
>   drivers/gpu/drm/drm_atomic_helper.c   |  2 +-
>   drivers/gpu/drm/drm_gem_vram_helper.c | 14 +++++++++++---
>   drivers/gpu/drm/drm_syncobj.c         |  8 +++++---
>   drivers/gpu/drm/ttm/ttm_pool.c        | 11 ++++++-----
>   drivers/gpu/drm/vc4/vc4_hdmi.c        |  1 +
>   5 files changed, 24 insertions(+), 12 deletions(-)
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NDGbK6FlkXIB0hj9nBPDKUj1oD36q2gZx--

--GpSWVjwQcxv6PCzx5qVOjZtNKk0T7zqSp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAIHqwFAwAAAAAACgkQlh/E3EQov+CX
Fg/5AYNlKP88SL2CfbtkPL2ndrg7CVl/8+jgGjEjjS6V8Q4ltAENXLU3tjXcMwPm7HhYNNZ1lTJR
+CKATPTrwb8hy74al7lh+YHngjTLaqgA2ti/wfUtzfjCTEIlnCP1ig1QpHqH0/y5BYcuzL6pvmwD
wCleNeQx1iPNnx7ZNCzWrpXljv+8NvOZSB2tYCq9GR4+sxieGzIobeyGSJUm7Kt1S/AzdkXxq3Cj
5MMJfjufA+ThQaCvSCM7AuMYsspq1Wq9yAaF0OZpt/Wi5SaCC52tbtsBkztHSLjuDNNJtTxXjB81
GO2CXXeW0UafpO7QhjT5jtYjokv55TCcVMLCIrTYME3sq0zNyzuvyYejcXDuXpLA61hfdRk9VcG0
F8KGV866PSGfMYoMYOtKR5ZfzPSfFbRETCe+V6p+m2v+eaGUVeh1VIMNS1DDbLHyiNg3zwV2hyD+
VooY9FH2d2o+0GUpbn3Iem7JzmdfahEhvnq/Ocscu/4R0xhZcbFWVUbR6l/H9sc4M6uLF02OJUus
s7Es89Ll5T3J7Cbm7ToQK//1M+7gf3B4QnCnwGZkrLeFqxn6whAQnEloV7hxRnZ7I2tnBdx/iy8W
HUTh+BBifQFSVCBTxuiPlnmwKP5/uyTZ/xrflQRrD4Cwp/Fw0U9fLPrgBLuRWguzJH+GzTQw8FPL
Xrs=
=vn3z
-----END PGP SIGNATURE-----

--GpSWVjwQcxv6PCzx5qVOjZtNKk0T7zqSp--

--===============2137889029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2137889029==--
