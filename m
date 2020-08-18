Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF00B247F9F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2337989C27;
	Tue, 18 Aug 2020 07:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AFC89C27
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:42:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA283ABCC;
 Tue, 18 Aug 2020 07:42:28 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon 0/4] Use drv_err instead of DRM_ERROR in
 hibmc driver
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1597733504-30812-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ddeac968-cbea-9441-2fe5-d1223aa4d5f2@suse.de>
Date: Tue, 18 Aug 2020 09:41:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597733504-30812-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============0975698412=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0975698412==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="csRgyoghWyrutzR6kOCvUjcF7OhhuwMjJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--csRgyoghWyrutzR6kOCvUjcF7OhhuwMjJ
Content-Type: multipart/mixed; boundary="WxrrzYJaIrqhxDw9UDVpkbavTe5rN0CrA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <ddeac968-cbea-9441-2fe5-d1223aa4d5f2@suse.de>
Subject: Re: [PATCH drm/hisilicon 0/4] Use drv_err instead of DRM_ERROR in
 hibmc driver
References: <1597733504-30812-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1597733504-30812-1-git-send-email-tiantao6@hisilicon.com>

--WxrrzYJaIrqhxDw9UDVpkbavTe5rN0CrA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.08.20 um 08:51 schrieb Tian Tao:
> patch #1 is using the drv_err instead of DRM_ERROR in hibmc_ttm.c
> patch #2 is using the drv_err instead of DRM_ERROR in hibmc_drm_vdac.c
> patch #3 is using the drv_err and drm_dbg_atomic  instead of DRM_ERROR
> and DRM_DEBUG_ATOMIC  in hibmc_drm_de.c
> patch #4 is using the drv_err and drm_warn instead of DRM_ERROR and
> DRM_WARN in hibmc_drm_drv.c
>=20
> Tian Tao (4):
>   drm/hisilicon: Use drv_err instead of DRM_ERROR in hibmc_ttm
>   drm/hisilicon: Use drv_err instead of DRM_ERROR in hibmc_drm_vdac
>   drm/hisilicon: Use drv_err instead of DRM_ERROR in hibmc_drm_de
>   drm/hisilicon: Use drv_err instead of DRM_ERROR in hibmc_drm_drv

Series is

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

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


--WxrrzYJaIrqhxDw9UDVpkbavTe5rN0CrA--

--csRgyoghWyrutzR6kOCvUjcF7OhhuwMjJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl87hkoUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiP5fQf+NLJld/8hS8rL0w7LexD93Kjje1Gp
yeaT/2rZDTZ//vC9+BZBNDdSKYwO1WAlhNILfJO12j8zXkVsa1NQEOLlL/dy8pFc
KKBSoVQEeWxHPjbFnIMOXzj5NbNOYQGXNyWeY8LA2PdbgNRtvjO3RbqeI067Q/z8
nAxS/md+SyKXQafqzZNQCpW9DDT/07ktrNeRWCoNsbrEmVkzwUA4nOOGhGUR/YoJ
1k6TFxdyRHfyJKvxxnE5ehpAFGDfKTDuCeMPF5ghX7/PAiJDQwjatH2YlbBIpuxO
KMj1B6q+Vt5iobC4HnSC1Q7qcpmVL3eScntTFN8Q33SKTpPRcceyTgYSUA==
=8YPe
-----END PGP SIGNATURE-----

--csRgyoghWyrutzR6kOCvUjcF7OhhuwMjJ--

--===============0975698412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0975698412==--
