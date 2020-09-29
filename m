Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF527BDEF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA868987A;
	Tue, 29 Sep 2020 07:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE646E454
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 07:24:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6C3BACB5;
 Tue, 29 Sep 2020 07:24:42 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Delete the unused macro
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1601340326-14049-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b2e756df-a434-f60c-c5f5-0cbb43f00d5c@suse.de>
Date: Tue, 29 Sep 2020 09:24:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601340326-14049-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1737882763=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1737882763==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dpedHX0iEvgB2NKnSHVo3TnOkufMVO1jt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dpedHX0iEvgB2NKnSHVo3TnOkufMVO1jt
Content-Type: multipart/mixed; boundary="LbK2c14iWMLkJ23UetoY31dI9sdKOh1f1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <b2e756df-a434-f60c-c5f5-0cbb43f00d5c@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Delete the unused macro
References: <1601340326-14049-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1601340326-14049-1-git-send-email-tiantao6@hisilicon.com>

--LbK2c14iWMLkJ23UetoY31dI9sdKOh1f1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 29.09.20 um 02:45 schrieb Tian Tao:
> The macro PADDING is no longer used. Delete it.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/g=
pu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 4d57ec6..b3a81da 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -52,8 +52,6 @@ static const struct hibmc_dislay_pll_config hibmc_pll=
_table[] =3D {
>  	{1920, 1200, CRT_PLL1_HS_193MHZ, CRT_PLL2_HS_193MHZ},
>  };
> =20
> -#define PADDING(align, data) (((data) + (align) - 1) & (~((align) - 1)=
))
> -
>  static int hibmc_plane_atomic_check(struct drm_plane *plane,
>  				    struct drm_plane_state *state)
>  {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--LbK2c14iWMLkJ23UetoY31dI9sdKOh1f1--

--dpedHX0iEvgB2NKnSHVo3TnOkufMVO1jt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9y4TYUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMWVgf/XpTwoOEDoChu4oENFytdYK4RYxv1
k5T+qu0aR7fEz4K/7FHTAOAZls+ALTF0VGB76j9ogXVyLz36I5eMeSn12z7zn1cz
cpViwjF91y/zKIZ14O/LkLJvcYyUl/EpoX0ktC9ar767Qk5FYWQtTJMnXtquZ0Dd
i8qRBRKaqhJxgW7m2hCXsHw7Ze0L3MgHwNhjoH/yup0ybGNG2cYkp1mhzdjH8w/K
KZkTZkLMnnskk1SEDp1m86Wh3dHVhQyoeXZf18U9Rn5ao0Pr18mMsbLnNlYCU13E
O0mbDkpH8GgRhTNh6XKJVjdnx2XrooFgeGgdw2CSWXnjVJfuMd14CdsrYQ==
=exp3
-----END PGP SIGNATURE-----

--dpedHX0iEvgB2NKnSHVo3TnOkufMVO1jt--

--===============1737882763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1737882763==--
