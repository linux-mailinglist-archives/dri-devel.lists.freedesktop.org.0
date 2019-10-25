Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D33E4A31
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 13:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C046E9BD;
	Fri, 25 Oct 2019 11:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5615C6E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 11:44:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ACCD9AE4D;
 Fri, 25 Oct 2019 11:44:16 +0000 (UTC)
Subject: Re: [PATCH 5/5] drm/udl: Replace fbdev code with generic emulation
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-6-tzimmermann@suse.de>
 <20191025074746.GR11828@phenom.ffwll.local>
 <20191025080059.GS11828@phenom.ffwll.local>
 <5242a6a7-1af7-6dbe-3f8e-69d45ce0eb63@tronnes.org>
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
Message-ID: <6cd28734-dc25-2c98-74ad-023b9c314c27@suse.de>
Date: Fri, 25 Oct 2019 13:44:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <5242a6a7-1af7-6dbe-3f8e-69d45ce0eb63@tronnes.org>
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
Cc: airlied@redhat.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1298191734=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1298191734==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sCx6TmW4ey6ygoUYt6w9h92csKkhLN7qt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sCx6TmW4ey6ygoUYt6w9h92csKkhLN7qt
Content-Type: multipart/mixed; boundary="2I1FIo3guOteLzqkj8JrcylIXA9JuLCzN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@redhat.com, sean@poorly.run, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Message-ID: <6cd28734-dc25-2c98-74ad-023b9c314c27@suse.de>
Subject: Re: [PATCH 5/5] drm/udl: Replace fbdev code with generic emulation
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-6-tzimmermann@suse.de>
 <20191025074746.GR11828@phenom.ffwll.local>
 <20191025080059.GS11828@phenom.ffwll.local>
 <5242a6a7-1af7-6dbe-3f8e-69d45ce0eb63@tronnes.org>
In-Reply-To: <5242a6a7-1af7-6dbe-3f8e-69d45ce0eb63@tronnes.org>

--2I1FIo3guOteLzqkj8JrcylIXA9JuLCzN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Noralf

Am 25.10.19 um 13:22 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 25.10.2019 10.00, skrev Daniel Vetter:
>> On Fri, Oct 25, 2019 at 09:47:46AM +0200, Daniel Vetter wrote:
>>> On Thu, Oct 24, 2019 at 04:42:37PM +0200, Thomas Zimmermann wrote:
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>  drivers/gpu/drm/udl/udl_drv.c     |   3 +
>>>>  drivers/gpu/drm/udl/udl_drv.h     |   4 -
>>>>  drivers/gpu/drm/udl/udl_fb.c      | 263 +--------------------------=
---
>>>>  drivers/gpu/drm/udl/udl_main.c    |   2 -
>>>>  drivers/gpu/drm/udl/udl_modeset.c |   3 +-
>>>>  5 files changed, 8 insertions(+), 267 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl=
_drv.c
>>>> index 15ad7a338f9d..6beaa1109c2c 100644
>>>> --- a/drivers/gpu/drm/udl/udl_drv.c
>>>> +++ b/drivers/gpu/drm/udl/udl_drv.c
>>>> @@ -7,6 +7,7 @@
>>>> =20
>>>>  #include <drm/drm_crtc_helper.h>
>>>>  #include <drm/drm_drv.h>
>>>> +#include <drm/drm_fb_helper.h>
>>>>  #include <drm/drm_file.h>
>>>>  #include <drm/drm_ioctl.h>
>>>>  #include <drm/drm_probe_helper.h>
>>>> @@ -62,6 +63,8 @@ static struct drm_driver driver =3D {
>>>>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM,
>>>>  	.release =3D udl_driver_release,
>>>> =20
>>>> +	.lastclose =3D drm_fb_helper_lastclose,
>>>> +
>>>>  	/* gem hooks */
>>>>  	.gem_free_object_unlocked =3D udl_gem_free_object,
>>>>  	.gem_vm_ops =3D &udl_gem_vm_ops,
>>>> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl=
_drv.h
>>>> index 12a970fd9a87..5f8a7ac084f6 100644
>>>> --- a/drivers/gpu/drm/udl/udl_drv.h
>>>> +++ b/drivers/gpu/drm/udl/udl_drv.h
>>>> @@ -50,8 +50,6 @@ struct urb_list {
>>>>  	size_t size;
>>>>  };
>>>> =20
>>>> -struct udl_fbdev;
>>>> -
>>>>  struct udl_device {
>>>>  	struct drm_device drm;
>>>>  	struct device *dev;
>>>> @@ -65,7 +63,6 @@ struct udl_device {
>>>>  	struct urb_list urbs;
>>>>  	atomic_t lost_pixels; /* 1 =3D a render op failed. Need screen ref=
resh */
>>>> =20
>>>> -	struct udl_fbdev *fbdev;
>>>>  	char mode_buf[1024];
>>>>  	uint32_t mode_buf_len;
>>>>  	atomic_t bytes_rendered; /* raw pixel-bytes driver asked to render=
 */
>>>> @@ -111,7 +108,6 @@ int udl_init(struct udl_device *udl);
>>>>  void udl_fini(struct drm_device *dev);
>>>> =20
>>>>  int udl_fbdev_init(struct drm_device *dev);
>>>> -void udl_fbdev_cleanup(struct drm_device *dev);
>>>>  void udl_fbdev_unplug(struct drm_device *dev);
>>>>  struct drm_framebuffer *
>>>>  udl_fb_user_fb_create(struct drm_device *dev,
>>>> diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_=
fb.c
>>>> index ef3504d06343..43a1da3a56c3 100644
>>>> --- a/drivers/gpu/drm/udl/udl_fb.c
>>>> +++ b/drivers/gpu/drm/udl/udl_fb.c
>>>> @@ -19,19 +19,9 @@
>>>> =20
>>>>  #include "udl_drv.h"
>>>> =20
>>>> -#define DL_DEFIO_WRITE_DELAY    (HZ/20) /* fb_deferred_io.delay in =
jiffies */
>>>> -
>>>> -static int fb_defio =3D 0;  /* Optionally enable experimental fb_de=
fio mmap support */
>>
>> Correction on my enthusiasm, this here is a problem:
>>
>> The udl defio support as-is is broken, fbdev defio and shmem are fight=

>> over the page flags. Not a problem with the old code, since disabled b=
y
>> default. But will be a problem with the new code. I guess you didn't t=
est
>> fbdev mmap? We unfortunately also lack an easy igt testcase for this .=
=2E.
>=20
> This is where the shadow buffer comes to the rescue. fbdev gets a
> vmalloc buffer and this is blitted on the shmem buffer in the defio
> callback before calling the framebuffer .dirty callback. So the defio
> internals never sees the shmem buffer. At least this worked when I was
> writing the shmem helper.

There's already a patchset on the ML, cleaning up the docs around fb
defio. Please take a look.

Best regards
Thomas

>=20
> Noralf.
>=20
>>
>> The problem is fairly tricky to solve, here's an untested idea that mi=
ght
>> work:
>>
>> https://dri.freedesktop.org/docs/drm/gpu/todo.html#generic-fbdev-defio=
-support
>>
>> Cheers, Daniel
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--2I1FIo3guOteLzqkj8JrcylIXA9JuLCzN--

--sCx6TmW4ey6ygoUYt6w9h92csKkhLN7qt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2y4AwACgkQaA3BHVML
eiPLgAf/UssvDs0BbJlOxauRlRpZ1m2PJSzl6FvUGQUOv+BmGpv+Xb5JR0VvSzTc
l4cNDX1zwmTcs1PeiqfRV27lkobtlY2SqqYz3b1Ef0XkvalXzOAIkk3O3tZCo0Ok
EuDnf0YSshplmPLHv6oU1i7CF2MNiZLHvGsCrZ6mqEQoq/NyLf02XrJRvwHpVQMm
9rd90dmUl+kCVDGPWopfHrIkCKzPr7o1exYTlkuhSo6sEjuam4X0E9uZQJlvOsbm
dtNp8wSgzSM8TE5sSRfcHTYHXZdWX/T+xIFIZOiM9/KXObYnQab0Ixc2mwz9Z5Tg
Zy8tQZHPSctSwCALxdcj3MI2AzjdDA==
=+ct1
-----END PGP SIGNATURE-----

--sCx6TmW4ey6ygoUYt6w9h92csKkhLN7qt--

--===============1298191734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1298191734==--
