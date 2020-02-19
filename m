Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A02163CD5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 07:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F2E6EB0F;
	Wed, 19 Feb 2020 06:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BE06EB0F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 06:00:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 541D3AE0F;
 Wed, 19 Feb 2020 06:00:06 +0000 (UTC)
Subject: Re: [PATCH] drm/vram-helper: make drm_vram_mm_debugfs_init return 0
To: Wambui Karuga <wambui.karugax@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
 <20200218172821.18378-9-wambui.karugax@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <30ad58ad-bc1c-bcbb-ef82-0308f5e2594d@suse.de>
Date: Wed, 19 Feb 2020 07:00:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218172821.18378-9-wambui.karugax@gmail.com>
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1529052278=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1529052278==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="neiXT7A2TQh7Yba93ieRLenJs3LBBQsRi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--neiXT7A2TQh7Yba93ieRLenJs3LBBQsRi
Content-Type: multipart/mixed; boundary="lEUoRsUYxFmFKhlCCP1VdqGmLZM6cyXlM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wambui Karuga <wambui.karugax@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org
Message-ID: <30ad58ad-bc1c-bcbb-ef82-0308f5e2594d@suse.de>
Subject: Re: [PATCH] drm/vram-helper: make drm_vram_mm_debugfs_init return 0
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
 <20200218172821.18378-9-wambui.karugax@gmail.com>
In-Reply-To: <20200218172821.18378-9-wambui.karugax@gmail.com>

--lEUoRsUYxFmFKhlCCP1VdqGmLZM6cyXlM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 18.02.20 um 18:28 schrieb Wambui Karuga:
> As drm_debugfs_create_files() should return 0, remove its use as the
> return value of drm_vram_mm_debugfs_init(), and have the function retur=
n
> 0 directly.
>=20
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 92a11bb42365..77b36a2286f9 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1043,19 +1043,16 @@ static const struct drm_info_list drm_vram_mm_d=
ebugfs_list[] =3D {
>   * @minor: drm minor device.
>   *
>   * Returns:
> - * 0 on success, or
> - * a negative error code otherwise.
> + * 0
>   */
>  int drm_vram_mm_debugfs_init(struct drm_minor *minor)
>  {
> -	int ret =3D 0;
> -
>  #if defined(CONFIG_DEBUG_FS)
> -	ret =3D drm_debugfs_create_files(drm_vram_mm_debugfs_list,
> -				       ARRAY_SIZE(drm_vram_mm_debugfs_list),
> -				       minor->debugfs_root, minor);
> +	drm_debugfs_create_files(drm_vram_mm_debugfs_list,
> +				 ARRAY_SIZE(drm_vram_mm_debugfs_list),
> +				 minor->debugfs_root, minor);
>  #endif
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lEUoRsUYxFmFKhlCCP1VdqGmLZM6cyXlM--

--neiXT7A2TQh7Yba93ieRLenJs3LBBQsRi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5MzuQACgkQaA3BHVML
eiO2mAgAlF6b2VDAr15WInESQxTDVelSgxblRxPgN4GtsPvNuNk54xkNqnLsBgUL
wqQBSf+eb6R7CCllltpEBv7cwhvzMQRYakODpDjJ1VFUcMGCJQFwC1yCYQh5hrWy
A1Vm2pKaxatR4gZ00SWKW7Qo2KavfjXmmpQ82VrMhJ4ewqXxt9n3lrE0xZmWoMfw
rxfB8zIkY7P1shJe6O3Gj24OUQY1moEmA/7I3MP/7EvzjNXCdxJvuSL1TxiZfC4D
Ho4DeJmSgQDPWAOixFGA44DKROu2tlw5LZWrHvtwHj3i9xr2WEN1mbBe84KaYm2H
h2q3B2ZXuTF68bvjllmMWHqHI00GnQ==
=7nlY
-----END PGP SIGNATURE-----

--neiXT7A2TQh7Yba93ieRLenJs3LBBQsRi--

--===============1529052278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1529052278==--
