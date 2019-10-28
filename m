Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E14E72B7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 14:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6FE6E86E;
	Mon, 28 Oct 2019 13:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94A6E86E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 13:38:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7EE02B2A4;
 Mon, 28 Oct 2019 13:38:11 +0000 (UTC)
Subject: Re: [PATCH] drm/vboxvideo: Use drm_gem_fb_create_with_dirty instead
 of drm_gem_fb_create
To: Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20191028133159.236550-1-hdegoede@redhat.com>
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
Message-ID: <7b86d793-645a-0d49-065f-3eb0a3e884a9@suse.de>
Date: Mon, 28 Oct 2019 14:38:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028133159.236550-1-hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0928950758=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0928950758==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UrhTLwfWwoEnDCKxC4UUaM6RGTjfTHfg7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UrhTLwfWwoEnDCKxC4UUaM6RGTjfTHfg7
Content-Type: multipart/mixed; boundary="T2yRABaraP4hZRlPq1RIS9MZaMRGV2KQ4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <7b86d793-645a-0d49-065f-3eb0a3e884a9@suse.de>
Subject: Re: [PATCH] drm/vboxvideo: Use drm_gem_fb_create_with_dirty instead
 of drm_gem_fb_create
References: <20191028133159.236550-1-hdegoede@redhat.com>
In-Reply-To: <20191028133159.236550-1-hdegoede@redhat.com>

--T2yRABaraP4hZRlPq1RIS9MZaMRGV2KQ4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Am 28.10.19 um 14:31 schrieb Hans de Goede:
> Commit 7d79aa8628fe ("drm/vboxvideo: Replace struct vram_framebuffer
> with generic implemenation") removed the diy framebuffer code from
> the vboxvideo driver, resulting in a nice cleanup.
>=20
> But since the vboxvideo driver needs the generic dirty tracking code,
> it's drm_mode_config_funcs.fb_create should be set to
> drm_gem_fb_create_with_dirty not drm_gem_fb_create.
>=20
> This commit fixes this, fixing the framebuffer not always updating.
>=20
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: Commit 7d79aa8628fe ("drm/vboxvideo: Replace struct vram_framebu=
ffer with generic implemenation")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vb=
oxvideo/vbox_mode.c
> index d9818a8a32fa..f15ed2272205 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -838,7 +838,7 @@ static int vbox_connector_init(struct drm_device *d=
ev,
>  }
> =20
>  static const struct drm_mode_config_funcs vbox_mode_funcs =3D {
> -	.fb_create =3D drm_gem_fb_create,
> +	.fb_create =3D drm_gem_fb_create_with_dirty,
>  	.atomic_check =3D drm_atomic_helper_check,
>  	.atomic_commit =3D drm_atomic_helper_commit,
>  };
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--T2yRABaraP4hZRlPq1RIS9MZaMRGV2KQ4--

--UrhTLwfWwoEnDCKxC4UUaM6RGTjfTHfg7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl227z8ACgkQaA3BHVML
eiOzEwgAtqnnur40oA7l5I4w2jYSZ0KbcnShg8SezP4J0gVMEAKp3c1zrjiPU/0y
xCYfXmQQ+ZJW7P93vcq5CQXl5XcrEYkoPV5tC/xdyFWj43vKum5lRS4yytBf7ezZ
8deL15V2VvR0tdUARCviycNC9aqwdHoBHREIpPoVs/XsyHKhJ6s/MIVq1H8HX6Dc
Y+S0LRy8jEkXLLYuFwFSesSHybKf29HC640u+iFcoNx/tUmh6cdJwy7y+HTSru0Y
Ofx/iC5nIy4ebgRMg/uChKT/LKp3sUwBhYvd0itYP6ei0CE6j99N8fOp6JvBSyHB
0OlUXNoovHzSebFlu4arwGB1j3XJNg==
=C9ZT
-----END PGP SIGNATURE-----

--UrhTLwfWwoEnDCKxC4UUaM6RGTjfTHfg7--

--===============0928950758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0928950758==--
