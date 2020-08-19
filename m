Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A8224A5A1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 20:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797A26E595;
	Wed, 19 Aug 2020 18:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C016E595
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 18:06:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CFDCB790;
 Wed, 19 Aug 2020 18:07:03 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon v2 0/4] Use drm_err instead of DRM_ERROR in
 hibmc driver
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1597829014-39942-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <50f37353-a4fb-9b93-c48f-897cb7c6914b@suse.de>
Date: Wed, 19 Aug 2020 20:06:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597829014-39942-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: linuxarm@huawei.com
Content-Type: multipart/mixed; boundary="===============1691388169=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1691388169==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FyvNYwAnxF6sW6L71jwt75L6wO4E6DEIv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FyvNYwAnxF6sW6L71jwt75L6wO4E6DEIv
Content-Type: multipart/mixed; boundary="WN6idnxKUAyH6JFXQUM9ADxPzxqyh6B4d";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <50f37353-a4fb-9b93-c48f-897cb7c6914b@suse.de>
Subject: Re: [PATCH drm/hisilicon v2 0/4] Use drm_err instead of DRM_ERROR in
 hibmc driver
References: <1597829014-39942-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1597829014-39942-1-git-send-email-tiantao6@hisilicon.com>

--WN6idnxKUAyH6JFXQUM9ADxPzxqyh6B4d
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 19.08.20 um 11:23 schrieb Tian Tao:
> patch #1 is using the drm_err instead of DRM_ERROR in hibmc_ttm.c
> patch #2 is using the drm_err instead of DRM_ERROR in hibmc_drm_vdac.c
> patch #3 is using the drm_err and drm_dbg_atomic instead of DRM_ERROR
> and DRM_DEBUG_ATOMIC in hibmc_drm_de.c
> patch #4 is using the drm_err and drm_warn instead of DRM_ERROR and
> DRM_WARN in hibmc_drm_drv.c
>=20
> Changes since v1:
> -Fixed spelling errors in patch name.

Just a few formal nits: it's common to also log the changes in the
patches themselves. And as I already R-b'ed the patchset, the patches
should contain the tag.

So

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

for the whole series. If no one else has comments, it should be fine to
merge the patches by the end of the week.

Best regards
Thomas

>=20
> Tian Tao (4):
>   drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_ttm
>   drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_drm_vdac
>   drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_drm_de
>   drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_drm_drv
>=20
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 14 +++++++-------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 24 ++++++++++++----=
--------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |  4 ++--
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c      |  2 +-
>  4 files changed, 22 insertions(+), 22 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WN6idnxKUAyH6JFXQUM9ADxPzxqyh6B4d--

--FyvNYwAnxF6sW6L71jwt75L6wO4E6DEIv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl89aikUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPYzAgAqN/EtFtij0zI+bAxmXk0iA2Hv10E
2GKTG7OgOOAlt7VvL09ZVqLnggFpcQy/p8UKQ3uKGiCiwyc9DHQEDTog0wbld8v8
N/nZB7iKhlqDoTPaSy/sQi0aN/ZCp9q4/W84ncnKXU9WD9M/3CYaKf4LEmRsX6b9
deLy/fVV/UIuvvUdAgSWysmPkT9pbtpB3L73nfBdKjBlv/QcgWGWFxDZ2Lv+547S
xY1xAMvZWAPtxVOUPwfA4KYzo7HV81vJnrb04LmeDzUT3AE3C5BjyPlPNJI22qZm
sCmnIJ260/5EBISqPER55V3sxARCD47xDpDIRwAT0ry1f4tuLYxHPaw3kA==
=56wm
-----END PGP SIGNATURE-----

--FyvNYwAnxF6sW6L71jwt75L6wO4E6DEIv--

--===============1691388169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1691388169==--
