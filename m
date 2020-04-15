Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0D01A9740
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 10:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF4B6E266;
	Wed, 15 Apr 2020 08:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D676E1F9;
 Wed, 15 Apr 2020 08:46:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 27335AC12;
 Wed, 15 Apr 2020 08:46:26 +0000 (UTC)
Subject: Re: [PATCH 37/59] drm/cirrus: Move to drm/tiny
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-38-daniel.vetter@ffwll.ch>
 <fe4fdf57-b039-02d3-ae89-24953304c79d@suse.de>
 <CAKMK7uHKqmUDMwsZ9OufZE-ZHqUHscmgiZ_HvRyr9TbH3UcYFQ@mail.gmail.com>
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
Message-ID: <1d8288b5-883c-fcda-0108-b1fecc5637e6@suse.de>
Date: Wed, 15 Apr 2020 10:46:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHKqmUDMwsZ9OufZE-ZHqUHscmgiZ_HvRyr9TbH3UcYFQ@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1016104600=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1016104600==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nyXfRRKUSNJFSss05h7E4qmPW4psHqZj5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nyXfRRKUSNJFSss05h7E4qmPW4psHqZj5
Content-Type: multipart/mixed; boundary="8FplsbkvjG1J7atIv627aY0FKM93Herzb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <1d8288b5-883c-fcda-0108-b1fecc5637e6@suse.de>
Subject: Re: [PATCH 37/59] drm/cirrus: Move to drm/tiny
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-38-daniel.vetter@ffwll.ch>
 <fe4fdf57-b039-02d3-ae89-24953304c79d@suse.de>
 <CAKMK7uHKqmUDMwsZ9OufZE-ZHqUHscmgiZ_HvRyr9TbH3UcYFQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHKqmUDMwsZ9OufZE-ZHqUHscmgiZ_HvRyr9TbH3UcYFQ@mail.gmail.com>

--8FplsbkvjG1J7atIv627aY0FKM93Herzb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 15.04.20 um 10:19 schrieb Daniel Vetter:
> On Wed, Apr 15, 2020 at 10:01 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>
>>
>>
>> Am 15.04.20 um 09:40 schrieb Daniel Vetter:
>>> Because it is. Huge congrats to everyone who made this kind of
>>> refactoring happen!
>>
>> Every other week, I felt an urge to send out this patch. Thank you so
>> much, Daniel! There are more candidates for tiny/. They are all <20k
>> LOCs and all we'd have to do is to move their code into a single file.=


I meant <20k file size, not LOCs.

>> bochs or arc come into my mind.
>=20
> arc I have (later in the series), bochs I feel like is maybe a bit too
> big. I'd put the limit for tiny well below 1kloc including whitespace
> and all that. bochs might be a candidate once we've helperized a few
> more things perhaps.

True. The largest tiny driver is repaper with ~1.1k LOCS. Reading this
code, it seems like it has reached an upper bound of what is feasible.

Best regards
Thomas

>=20
> btw I drmm_ version of vram helpers would help a bunch of these drivers=
 I think.
> -Daniel
>=20
>>
>>>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: virtualization@lists.linux-foundation.org
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>>> ---
>>>  MAINTAINERS                               |  2 +-
>>>  drivers/gpu/drm/Kconfig                   |  2 --
>>>  drivers/gpu/drm/Makefile                  |  1 -
>>>  drivers/gpu/drm/cirrus/Kconfig            | 19 -------------------
>>>  drivers/gpu/drm/cirrus/Makefile           |  2 --
>>>  drivers/gpu/drm/tiny/Kconfig              | 19 +++++++++++++++++++
>>>  drivers/gpu/drm/tiny/Makefile             |  1 +
>>>  drivers/gpu/drm/{cirrus =3D> tiny}/cirrus.c |  0
>>>  8 files changed, 21 insertions(+), 25 deletions(-)
>>>  delete mode 100644 drivers/gpu/drm/cirrus/Kconfig
>>>  delete mode 100644 drivers/gpu/drm/cirrus/Makefile
>>>  rename drivers/gpu/drm/{cirrus =3D> tiny}/cirrus.c (100%)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 7b3255d96d1d..0a5cf105ee37 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -5397,7 +5397,7 @@ L:      virtualization@lists.linux-foundation.o=
rg
>>>  S:   Obsolete
>>>  W:   https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considere=
d-harmful/
>>>  T:   git git://anongit.freedesktop.org/drm/drm-misc
>>> -F:   drivers/gpu/drm/cirrus/
>>> +F:   drivers/gpu/drm/tiny/cirrus.c
>>>
>>>  DRM DRIVER FOR QXL VIRTUAL GPU
>>>  M:   Dave Airlie <airlied@redhat.com>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 43594978958e..4f4e7fa001c1 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -310,8 +310,6 @@ source "drivers/gpu/drm/ast/Kconfig"
>>>
>>>  source "drivers/gpu/drm/mgag200/Kconfig"
>>>
>>> -source "drivers/gpu/drm/cirrus/Kconfig"
>>> -
>>>  source "drivers/gpu/drm/armada/Kconfig"
>>>
>>>  source "drivers/gpu/drm/atmel-hlcdc/Kconfig"
>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>> index f34d08c83485..2c0e5a7e5953 100644
>>> --- a/drivers/gpu/drm/Makefile
>>> +++ b/drivers/gpu/drm/Makefile
>>> @@ -74,7 +74,6 @@ obj-$(CONFIG_DRM_I915)      +=3D i915/
>>>  obj-$(CONFIG_DRM_MGAG200) +=3D mgag200/
>>>  obj-$(CONFIG_DRM_V3D)  +=3D v3d/
>>>  obj-$(CONFIG_DRM_VC4)  +=3D vc4/
>>> -obj-$(CONFIG_DRM_CIRRUS_QEMU) +=3D cirrus/
>>>  obj-$(CONFIG_DRM_SIS)   +=3D sis/
>>>  obj-$(CONFIG_DRM_SAVAGE)+=3D savage/
>>>  obj-$(CONFIG_DRM_VMWGFX)+=3D vmwgfx/
>>> diff --git a/drivers/gpu/drm/cirrus/Kconfig b/drivers/gpu/drm/cirrus/=
Kconfig
>>> deleted file mode 100644
>>> index c6bbd988b0e5..000000000000
>>> --- a/drivers/gpu/drm/cirrus/Kconfig
>>> +++ /dev/null
>>> @@ -1,19 +0,0 @@
>>> -# SPDX-License-Identifier: GPL-2.0-only
>>> -config DRM_CIRRUS_QEMU
>>> -     tristate "Cirrus driver for QEMU emulated device"
>>> -     depends on DRM && PCI && MMU
>>> -     select DRM_KMS_HELPER
>>> -     select DRM_GEM_SHMEM_HELPER
>>> -     help
>>> -      This is a KMS driver for emulated cirrus device in qemu.
>>> -      It is *NOT* intended for real cirrus devices. This requires
>>> -      the modesetting userspace X.org driver.
>>> -
>>> -      Cirrus is obsolete, the hardware was designed in the 90ies
>>> -      and can't keep up with todays needs.  More background:
>>> -      https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-consider=
ed-harmful/
>>> -
>>> -      Better alternatives are:
>>> -        - stdvga (DRM_BOCHS, qemu -vga std, default in qemu 2.2+)
>>> -        - qxl (DRM_QXL, qemu -vga qxl, works best with spice)
>>> -        - virtio (DRM_VIRTIO_GPU), qemu -vga virtio)
>>> diff --git a/drivers/gpu/drm/cirrus/Makefile b/drivers/gpu/drm/cirrus=
/Makefile
>>> deleted file mode 100644
>>> index 0c1ed3f99725..000000000000
>>> --- a/drivers/gpu/drm/cirrus/Makefile
>>> +++ /dev/null
>>> @@ -1,2 +0,0 @@
>>> -# SPDX-License-Identifier: GPL-2.0-only
>>> -obj-$(CONFIG_DRM_CIRRUS_QEMU) +=3D cirrus.o
>>> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kcon=
fig
>>> index 4160e74e4751..2b6414f0fa75 100644
>>> --- a/drivers/gpu/drm/tiny/Kconfig
>>> +++ b/drivers/gpu/drm/tiny/Kconfig
>>> @@ -1,5 +1,24 @@
>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>
>>> +config DRM_CIRRUS_QEMU
>>> +     tristate "Cirrus driver for QEMU emulated device"
>>> +     depends on DRM && PCI && MMU
>>> +     select DRM_KMS_HELPER
>>> +     select DRM_GEM_SHMEM_HELPER
>>> +     help
>>> +      This is a KMS driver for emulated cirrus device in qemu.
>>> +      It is *NOT* intended for real cirrus devices. This requires
>>> +      the modesetting userspace X.org driver.
>>> +
>>> +      Cirrus is obsolete, the hardware was designed in the 90ies
>>> +      and can't keep up with todays needs.  More background:
>>> +      https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-consider=
ed-harmful/
>>> +
>>> +      Better alternatives are:
>>> +        - stdvga (DRM_BOCHS, qemu -vga std, default in qemu 2.2+)
>>> +        - qxl (DRM_QXL, qemu -vga qxl, works best with spice)
>>> +        - virtio (DRM_VIRTIO_GPU), qemu -vga virtio)
>>> +
>>>  config DRM_GM12U320
>>>       tristate "GM12U320 driver for USB projectors"
>>>       depends on DRM && USB
>>> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Mak=
efile
>>> index c96ceee71453..6ae4e9e5a35f 100644
>>> --- a/drivers/gpu/drm/tiny/Makefile
>>> +++ b/drivers/gpu/drm/tiny/Makefile
>>> @@ -1,5 +1,6 @@
>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>
>>> +obj-$(CONFIG_DRM_CIRRUS_QEMU)                +=3D cirrus.o
>>>  obj-$(CONFIG_DRM_GM12U320)           +=3D gm12u320.o
>>>  obj-$(CONFIG_TINYDRM_HX8357D)                +=3D hx8357d.o
>>>  obj-$(CONFIG_TINYDRM_ILI9225)                +=3D ili9225.o
>>> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/tiny/c=
irrus.c
>>> similarity index 100%
>>> rename from drivers/gpu/drm/cirrus/cirrus.c
>>> rename to drivers/gpu/drm/tiny/cirrus.c
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--8FplsbkvjG1J7atIv627aY0FKM93Herzb--

--nyXfRRKUSNJFSss05h7E4qmPW4psHqZj5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6Wyd4ACgkQaA3BHVML
eiPa+Af8CVapqi1hBYrMT47endqvJfDWOWsM7KWfjN1LisYrMDL6Hnvm65sBIzDX
fT2f3pKbuWP3clORnAUacZfKi1WIzgrGAwtx87Xql/DXABmQkOgzzYOYonNN9iB2
5Bnqx+6f1s4ObhoqZjE/S2xntRM8f3GaII6jcIVVFWytoRI0+uyOFInjB52o8gGw
5yoqNLN0Oc05Gz/Fxiwh+tqDIdYLfdv6y4iHFjMQ1UbOtc0UG1q17XXtb3RFByNW
BTs63Hzk9jiAdD06lQdlEv/rOrNAjuuXr25u4tWZvSFVS/3gC8pZI3+8buw97Q/k
ULIsfLHOX6EcG24upLy1XgD7q0aANw==
=4Hvi
-----END PGP SIGNATURE-----

--nyXfRRKUSNJFSss05h7E4qmPW4psHqZj5--

--===============1016104600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1016104600==--
