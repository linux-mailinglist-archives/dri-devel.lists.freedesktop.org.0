Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE4F23B54C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 08:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85D0890D8;
	Tue,  4 Aug 2020 06:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C782890D8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 06:58:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F9A3AC20;
 Tue,  4 Aug 2020 06:58:23 +0000 (UTC)
Subject: Re: [PATCH 18/59] drm/vram_helper: use new ttm manager init function
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-19-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <bff767d6-46bd-7c8a-b42c-76db7dc6f647@suse.de>
Date: Tue, 4 Aug 2020 08:58:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804025632.3868079-19-airlied@gmail.com>
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
Cc: linux-graphics-maintainer@vmware.com, kraxel@redhat.com, sroland@vmware.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============2074944562=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2074944562==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="d02jw5Jv77vryTaDFd70PtAvvpjrHbox5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--d02jw5Jv77vryTaDFd70PtAvvpjrHbox5
Content-Type: multipart/mixed; boundary="NuAVa2Xaf2Dsa2wESuikTFNlNF9NlliMC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Message-ID: <bff767d6-46bd-7c8a-b42c-76db7dc6f647@suse.de>
Subject: Re: [PATCH 18/59] drm/vram_helper: use new ttm manager init function
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-19-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-19-airlied@gmail.com>

--NuAVa2Xaf2Dsa2wESuikTFNlNF9NlliMC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.08.20 um 04:55 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index c20aee2fddf3..d7c0fdf82eb6 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1116,10 +1116,9 @@ static int drm_vram_mm_init(struct drm_vram_mm *=
vmm, struct drm_device *dev,
>  	if (ret)
>  		return ret;
> =20
> -	man->func =3D &ttm_bo_manager_func;
>  	man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
>  	man->default_caching =3D TTM_PL_FLAG_WC;
> -	ret =3D ttm_bo_init_mm(&vmm->bdev, TTM_PL_VRAM, vram_size >> PAGE_SHI=
FT);
> +	ret =3D ttm_range_man_init(&vmm->bdev, man, vram_size >> PAGE_SHIFT);=

>  	if (ret)
>  		return ret;
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NuAVa2Xaf2Dsa2wESuikTFNlNF9NlliMC--

--d02jw5Jv77vryTaDFd70PtAvvpjrHbox5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8pBv8UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMmOwf9HmTWboSDzjvjmwxFUbYct19Vliiz
K1gBAcxcn+8D+1JL1mRmaqtgMfeK35oTWRIPs8cjYvAFe8WyGS3NH3WEiImrvZH+
SdmKAnqn8bxMAn9ap9kd88a96lEFSKSXyfyyD9LvjrGuOefCBJ1g9xR/+j9FFq/w
VRsAzLyUID2Dw+L991fOeuIez4PmuXfCCh1ubkmHruPJvqmdFketFJnL0mNMgaAr
gdMp4NC4+cgvAmWyw7ocBBF7F8kIVqqEMnnWDOhhuTe3vHel5OU2Gt+/Gw/lupc1
eGdy3mzq9n+5A/bup8X5LqC1HM6ddJwJR+tRhUpR91TgBVIiQ2MA2SLS/A==
=3xsm
-----END PGP SIGNATURE-----

--d02jw5Jv77vryTaDFd70PtAvvpjrHbox5--

--===============2074944562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2074944562==--
