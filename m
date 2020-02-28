Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B97173266
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 09:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F202C6EE35;
	Fri, 28 Feb 2020 08:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A2E6EE35
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 08:03:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 42C8CB259;
 Fri, 28 Feb 2020 08:03:24 +0000 (UTC)
Subject: Re: [PATCH 04/21] drm/vram-helper: make drm_vram_mm_debugfs_init()
 return void
To: Wambui Karuga <wambui.karugax@gmail.com>, daniel@ffwll.ch,
 airlied@linux.ie, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-5-wambui.karugax@gmail.com>
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
Message-ID: <b29cd545-7a42-54bd-cbc8-fb8610f60a1a@suse.de>
Date: Fri, 28 Feb 2020 09:03:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227120232.19413-5-wambui.karugax@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0753240964=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0753240964==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mb2UQj9WSISbmtnCzIokHUd04d4xP2L0J"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mb2UQj9WSISbmtnCzIokHUd04d4xP2L0J
Content-Type: multipart/mixed; boundary="JruvH8AbdflFJyLuRzNKAYjWEYNmwiWmB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wambui Karuga <wambui.karugax@gmail.com>, daniel@ffwll.ch,
 airlied@linux.ie, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <b29cd545-7a42-54bd-cbc8-fb8610f60a1a@suse.de>
Subject: Re: [PATCH 04/21] drm/vram-helper: make drm_vram_mm_debugfs_init()
 return void
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-5-wambui.karugax@gmail.com>
In-Reply-To: <20200227120232.19413-5-wambui.karugax@gmail.com>

--JruvH8AbdflFJyLuRzNKAYjWEYNmwiWmB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.02.20 um 13:02 schrieb Wambui Karuga:
> Since 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail), drm_debugfs_create_files() neve=
r
> fails and should return void. Therefore, remove its use as the
> return value of drm_vram_mm_debugfs_init(), and have the function
> declared as void instead.
>=20
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 14 ++++----------
>  include/drm/drm_gem_vram_helper.h     |  2 +-
>  2 files changed, 5 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 92a11bb42365..76506bedac11 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1042,20 +1042,14 @@ static const struct drm_info_list drm_vram_mm_d=
ebugfs_list[] =3D {
>   *
>   * @minor: drm minor device.
>   *
> - * Returns:
> - * 0 on success, or
> - * a negative error code otherwise.
>   */
> -int drm_vram_mm_debugfs_init(struct drm_minor *minor)
> +void drm_vram_mm_debugfs_init(struct drm_minor *minor)
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
>  }
>  EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
> =20
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vr=
am_helper.h
> index 0f6e47213d8d..b63bcd1b996d 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -196,7 +196,7 @@ static inline struct drm_vram_mm *drm_vram_mm_of_bd=
ev(
>  	return container_of(bdev, struct drm_vram_mm, bdev);
>  }
> =20
> -int drm_vram_mm_debugfs_init(struct drm_minor *minor);
> +void drm_vram_mm_debugfs_init(struct drm_minor *minor);
> =20
>  /*
>   * Helpers for integration with struct drm_device
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--JruvH8AbdflFJyLuRzNKAYjWEYNmwiWmB--

--mb2UQj9WSISbmtnCzIokHUd04d4xP2L0J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5YyUYACgkQaA3BHVML
eiMnrwgAo7SQIdu4RyxdwTSiTpr1Lf3TTUNrljqh3yM8CXZ4rmzF2sACDnKctuib
xjH5B10TmufKW39m8Ux4cK7ElAAvi7A9TMaxNEXW37W/ve3yRGGOizxgVcFbJtPD
h/L8YeRwKxn98SURmTAm33jJefaLRytIFJ8CLnp7mQv6ZRqGunlUScj04K+UJ6Rt
FZKHjLGdNRNX2X2FXH2X6QAvQy8s56um4olloZqKdKnK7T54G8s4wg4AuGIiC+CF
n0OVA516PvMYoARiokxIGeN4fU0P3KqzhYmCuHZyKl4RCF/nZJcOR7W7jNbtMSRU
eLw4/7u5dXn3bYi5QRx9Bu5njnbkMw==
=VuFC
-----END PGP SIGNATURE-----

--mb2UQj9WSISbmtnCzIokHUd04d4xP2L0J--

--===============0753240964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0753240964==--
