Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D44181DDFCF
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7146E22B;
	Fri, 22 May 2020 06:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC516E09C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 06:30:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F000ABBE;
 Fri, 22 May 2020 06:30:37 +0000 (UTC)
Subject: Re: [PATCH] drm/vblank: Fix -Wformat compile warnings on some arches
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
References: <20200521204647.2578479-1-lyude@redhat.com>
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
Message-ID: <951f6bcc-49f5-ceae-c3a3-7b0a52f9fa2d@suse.de>
Date: Fri, 22 May 2020 08:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521204647.2578479-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============0660438221=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0660438221==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qXvrIStwO1M2q642iYF63eAzxDoe7fvSk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qXvrIStwO1M2q642iYF63eAzxDoe7fvSk
Content-Type: multipart/mixed; boundary="vO0ySq7Bw8jBAuXnAOrNHBRiJXDIaFxBS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Message-ID: <951f6bcc-49f5-ceae-c3a3-7b0a52f9fa2d@suse.de>
Subject: Re: [PATCH] drm/vblank: Fix -Wformat compile warnings on some arches
References: <20200521204647.2578479-1-lyude@redhat.com>
In-Reply-To: <20200521204647.2578479-1-lyude@redhat.com>

--vO0ySq7Bw8jBAuXnAOrNHBRiJXDIaFxBS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 21.05.20 um 22:46 schrieb Lyude Paul:
> On some architectures like ppc64le and aarch64, compiling with
> -Wformat=3D1 will throw the following warnings:
>=20
>   In file included from drivers/gpu/drm/drm_vblank.c:33:
>   drivers/gpu/drm/drm_vblank.c: In function 'drm_update_vblank_count':
>   drivers/gpu/drm/drm_vblank.c:273:16: warning: format '%llu' expects
>   argument of type 'long long unsigned int', but argument 4 has type
>   'long int' [-Wformat=3D]
>     DRM_DEBUG_VBL("updating vblank count on crtc %u:"
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ./include/drm/drm_print.h:407:22: note: in definition of macro
>   'DRM_DEBUG_VBL'
>     drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
>                         ^~~
>   drivers/gpu/drm/drm_vblank.c:274:22: note: format string is defined h=
ere
>            " current=3D%llu, diff=3D%u, hw=3D%u hw_last=3D%u\n",
>                      ~~~^
>                      %lu
>=20
> So, fix that with a typecast.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

> ---
>  drivers/gpu/drm/drm_vblank.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.=
c
> index acb3c3f65b579..1a96db2dd16fa 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -342,7 +342,7 @@ static void drm_update_vblank_count(struct drm_devi=
ce *dev, unsigned int pipe,
> =20
>  	DRM_DEBUG_VBL("updating vblank count on crtc %u:"
>  		      " current=3D%llu, diff=3D%u, hw=3D%u hw_last=3D%u\n",
> -		      pipe, atomic64_read(&vblank->count), diff,
> +		      pipe, (unsigned long long)atomic64_read(&vblank->count), diff,=

>  		      cur_vblank, vblank->last);
> =20
>  	if (diff =3D=3D 0) {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vO0ySq7Bw8jBAuXnAOrNHBRiJXDIaFxBS--

--qXvrIStwO1M2q642iYF63eAzxDoe7fvSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7HcYkACgkQaA3BHVML
eiNIBAgAi4NqxVlu1Y6OH32hzo33lnkALwxIFbzsPWKpxCbB/ignVxYdDpdsnhL9
FW4+NfXnnROvZ2zGiKjwB5D6/RI+vM6d7KhB5ivlT7lYsRBZCA4lPrJ6bRzJKLuD
OZXAFFeBEXjWlqc3PmyMIbpn9gCK/7pMMybfmWhQn7jxakMDMHDoyMITSXPWoESy
Kpf0ICh6ypxPYfy1f+cUj0FBqeQb7MiesQHG4lFOfhT9UY6NBFZyWVNGLFb3wcyh
+E1jwRwei/dP4yMldPoUQFqS1xuIi8/IK212UbCzFg58mRHRTW9cp6Vr+B4BK8fA
iKdo1xnFrNUsksZ9Ew7X2OgR2k/+qw==
=n6OO
-----END PGP SIGNATURE-----

--qXvrIStwO1M2q642iYF63eAzxDoe7fvSk--

--===============0660438221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0660438221==--
