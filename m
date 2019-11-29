Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA610D350
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 10:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2386E89C;
	Fri, 29 Nov 2019 09:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AAF6E89B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 09:34:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7FA61B347;
 Fri, 29 Nov 2019 09:34:15 +0000 (UTC)
Subject: Re: [PATCH 3/3] drm/todo: Add entry for fb funcs related cleanups
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191127180035.416209-1-daniel.vetter@ffwll.ch>
 <20191127180035.416209-3-daniel.vetter@ffwll.ch>
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
Message-ID: <39e84cfd-9a06-bfad-1cc0-030a71ad1c9c@suse.de>
Date: Fri, 29 Nov 2019 10:34:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191127180035.416209-3-daniel.vetter@ffwll.ch>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0773089952=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0773089952==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lM7kUgkcSl3KGgoiiLqcziF2JfjQsd7UO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lM7kUgkcSl3KGgoiiLqcziF2JfjQsd7UO
Content-Type: multipart/mixed; boundary="Wn6l8DnA8n008bC2sK1EUr7xHXcVhf8U1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <39e84cfd-9a06-bfad-1cc0-030a71ad1c9c@suse.de>
Subject: Re: [PATCH 3/3] drm/todo: Add entry for fb funcs related cleanups
References: <20191127180035.416209-1-daniel.vetter@ffwll.ch>
 <20191127180035.416209-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20191127180035.416209-3-daniel.vetter@ffwll.ch>

--Wn6l8DnA8n008bC2sK1EUr7xHXcVhf8U1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.11.19 um 19:00 schrieb Daniel Vetter:
> We're doing a great job for really simple drivers right now, but still
> a lot of boilerplate for the bigger ones.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Just a small remark below, otherwise

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>


> ---
>  Documentation/gpu/todo.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 3ec509381fc5..2d85f37284a1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -182,6 +182,32 @@ Contact: Maintainer of the driver you plan to conv=
ert
> =20
>  Level: Intermediate
> =20
> +drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
> +-----------------------------------------------------------------
> +
> +A lot more drivers could be switched over to the drm_gem_framebuffer h=
elpers.
> +Various hold-ups:
> +
> +- Need to switch over to the generic dirty tracking code using
> +  drm_atomic_helper_dirtyfb first (e.g. qxl).
> +
> +- Need to switch to drm_fbdev_generic_setup(), otherwise a lot of the =
custom fb
> +  setup code can't be deleted.

=46rom what I remember, almost all of the obvious, low-hanging fruits hav=
e
been picked here. The remaining fbdev users either have HW acceleration
(nouveau, gma500), or use the cfb drawing functions.

The TODO item should probably mention this, with some advise to do some
extra testing for compatibility or performance after moving to generic
fbdev.

Best regards
Thomas

> +
> +- Many drivers wrap drm_gem_fb_create() only to check for valid format=
s. For
> +  atomic drivers we could check for valid formats by calling
> +  drm_plane_check_pixel_format() against all planes, and pass if any p=
lane
> +  supports the format. For non-atomic that's not possible since like t=
he format
> +  list for the primary plane is fake and we'd therefor reject valid fo=
rmats.
> +
> +- Many drivers subclass drm_framebuffer, we'd need a embedding compati=
ble
> +  version of the varios drm_gem_fb_create functions. Maybe called
> +  drm_gem_fb_create/_with_dirty/_with_funcs as needed.
> +
> +Contact: Daniel Vetter
> +
> +Level: Intermediate
> +
>  Clean up mmap forwarding
>  ------------------------
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Wn6l8DnA8n008bC2sK1EUr7xHXcVhf8U1--

--lM7kUgkcSl3KGgoiiLqcziF2JfjQsd7UO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3g5hYACgkQaA3BHVML
eiOYXgf+Iqnrl5r5mfIG1eUXKIDOsd6BaufLE5BUhpH4AGtoTG3fZBjD0VteZqRX
EUClHCLrewGbwR2Lb83kfDw0H3X/Tq7vB7qrlShsd8Qm0CKET74uuTmkn5q6mOEh
Jb9N3zyt1a0UHrIcoJb9jA6j1cVfEQZxhZn13q3GrLxfIJvCNyK7ymDKUCIXPqBq
UE4CeZgPY/YPbasEVHSD/tZFNjXoI9++09IXB/pAV9t78ddz6tGWpGkVIswyvMlC
hznkyUrdBhRzB+zIJ/XHejm09klrrRGcduz2X5gJaehbeSai7r7PSX3Pts3Kduc6
JnEC0n52cYpEk5En2FZpJGf7I8LHgw==
=HADH
-----END PGP SIGNATURE-----

--lM7kUgkcSl3KGgoiiLqcziF2JfjQsd7UO--

--===============0773089952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0773089952==--
