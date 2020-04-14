Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDBA1A73CF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 08:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEC389CF8;
	Tue, 14 Apr 2020 06:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE7689CF8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 06:43:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 02FBDAB3D;
 Tue, 14 Apr 2020 06:43:03 +0000 (UTC)
Subject: Re: [PATCH] drm: Don't return 0 from a void drm_fbdev_generic_setup
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20200408212407.4309-1-chris@chris-wilson.co.uk>
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
Message-ID: <74d1e64b-6c22-29ac-f508-aeb4364de6ec@suse.de>
Date: Tue, 14 Apr 2020 08:43:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408212407.4309-1-chris@chris-wilson.co.uk>
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1939499392=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1939499392==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jppki7syK0O0ajLzsGQuOmYWtRXflr0eZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jppki7syK0O0ajLzsGQuOmYWtRXflr0eZ
Content-Type: multipart/mixed; boundary="mu3DHdi5osr3fQRBAK8EOTeK21WsOxZFX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Message-ID: <74d1e64b-6c22-29ac-f508-aeb4364de6ec@suse.de>
Subject: Re: [PATCH] drm: Don't return 0 from a void drm_fbdev_generic_setup
References: <20200408212407.4309-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200408212407.4309-1-chris@chris-wilson.co.uk>

--mu3DHdi5osr3fQRBAK8EOTeK21WsOxZFX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 08.04.20 um 23:24 schrieb Chris Wilson:
> drm_fbdev_generic_setup() was changed to be a void return, but the stub=

> was left returning 0.
>=20
> ./include/drm/drm_fb_helper.h: In function =E2=80=98drm_fbdev_generic_s=
etup=E2=80=99:
> ./include/drm/drm_fb_helper.h:450:9: warning: =E2=80=98return=E2=80=99 =
with a value, in function returning void [-Wreturn-type]
> ./include/drm/drm_fb_helper.h:448:1: note: declared here
>   448 | drm_fbdev_generic_setup(struct drm_device *dev, unsigned int pr=
eferred_bpp)
>=20
> Fixes: 1aed9509b29a ("drm/fb-helper: Remove return value from drm_fbdev=
_generic_setup()")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  include/drm/drm_fb_helper.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index fb037be83997..306aa3a60be9 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -447,7 +447,6 @@ static inline void drm_fb_helper_output_poll_change=
d(struct drm_device *dev)
>  static inline void
>  drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred=
_bpp)
>  {
> -	return 0;
>  }

Ah, I forgot about that. Thank you so much!

Best regards
Thomas

> =20
>  #endif
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mu3DHdi5osr3fQRBAK8EOTeK21WsOxZFX--

--jppki7syK0O0ajLzsGQuOmYWtRXflr0eZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6VW3cACgkQaA3BHVML
eiNYzQgAv2t1Abo3drtCrEVq5l6bkFPuT0N6Jc/gb+3JH53o4xwerOi86uHhJzAG
XJCFgJEakOiEEz0xyaPt754EeXySD6lNKrbkHBPMYpbhc6mC8hA7ir3Q41Iy/c5x
jAX6gIFwnmVjNgvZb6vdBaEd0IzLOi1ID9QIQ3m/RELP/EC2fPCK+JeTElfGGqmf
6WBRyLt+zDZ3oNo6to+2pqPVHxyQzOnXoVl0zjLfW8xbqUqTU8xvMPtTgb8WUGwL
pC+lik7ltHT/f+cb0i1ekRikbnlvMHCjEZUZlog4gmC8+RmeBjxFeVDWyFqHrpqa
3X4A+b8i+9z3OWfB7hZeNkgA2NPGIw==
=8uUM
-----END PGP SIGNATURE-----

--jppki7syK0O0ajLzsGQuOmYWtRXflr0eZ--

--===============1939499392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1939499392==--
