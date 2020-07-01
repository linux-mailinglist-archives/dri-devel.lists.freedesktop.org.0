Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3177210D31
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 16:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FC76E8FF;
	Wed,  1 Jul 2020 14:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C95F6E8FE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 14:10:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D924AEE8;
 Wed,  1 Jul 2020 14:10:49 +0000 (UTC)
Subject: Re: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
 <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>
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
Message-ID: <cc6021b0-d874-240e-9fda-1cec3dfe6648@suse.de>
Date: Wed, 1 Jul 2020 16:10:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1698055260=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1698055260==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NsHloHQo12iXVs0fsV9wW0U4wDSTjOwvi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NsHloHQo12iXVs0fsV9wW0U4wDSTjOwvi
Content-Type: multipart/mixed; boundary="m9oQ9JRIsLafIgf6fcnk1KdBZkVYeFIAO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <cc6021b0-d874-240e-9fda-1cec3dfe6648@suse.de>
Subject: Re: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
 <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>
In-Reply-To: <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>

--m9oQ9JRIsLafIgf6fcnk1KdBZkVYeFIAO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

thanks for reviewing most of the patchset.

Am 30.06.20 um 11:06 schrieb Daniel Vetter:
> On Mon, Jun 29, 2020 at 11:39 AM Hans de Goede <hdegoede@redhat.com> wr=
ote:
>>
>> Hi,
>>
>> On 6/25/20 2:00 PM, Thomas Zimmermann wrote:
>>> This patchset adds support for simple-framebuffer platform devices an=
d
>>> a handover mechanism for native drivers to take-over control of the
>>> hardware.
>>>
>>> The new driver, called simplekms, binds to a simple-frambuffer platfo=
rm
>>> device. The kernel's boot code creates such devices for firmware-prov=
ided
>>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or bo=
ot
>>> loader sets up the framebuffers. Description via device tree is also =
an
>>> option.
>>>
>>> Simplekms is small enough to be linked into the kernel. The driver's =
main
>>> purpose is to provide graphical output during the early phases of the=
 boot
>>> process, before the native DRM drivers are available. Native drivers =
are
>>> typically loaded from an initrd ram disk. Occationally simplekms can =
also
>>> serve as interim solution on graphics hardware without native DRM dri=
ver.
>>
>> Cool, thank you for doing this, this is a very welcome change,
>> but ... (see below).
>>
>>> So far distributions rely on fbdev drivers, such as efifb, vesafb or
>>> simplefb, for early-boot graphical output. However fbdev is deprecate=
d and
>>> the drivers do not provide DRM interfaces for modern userspace.
>>>
>>> Patches 1 and 2 prepare the DRM format helpers for simplekms.
>>>
>>> Patches 3 to 7 add the simplekms driver. It's build on simple DRM hel=
pers
>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. Du=
ring
>>> pageflips, SHMEM buffers are copied into the framebuffer memory, simi=
lar
>>> to cirrus or mgag200. The code in patches 6 and 7 handles clocks and
>>> regulators. It's based on the simplefb drivers, but has been modified=
 for
>>> DRM.
>>>
>>> Patches 8 and 9 add a hand-over mechanism. Simplekms acquires it's
>>> framebuffer's I/O-memory range and provides a callback function to be=

>>> removed by a native driver. The native driver will remove simplekms b=
efore
>>> taking over the hardware. The removal is integrated into existing hel=
pers,
>>> so drivers use it automatically.
>>>
>>> I tested simplekms with x86 EFI and VESA framebuffers, which both wor=
k
>>> reliably. The fbdev console and Weston work automatically. Xorg requi=
res
>>> manual configuration of the device. Xorgs current modesetting driver =
does
>>> not work with both, platform and PCI device, for the same physical
>>> hardware. Once configured, X11 works.
>>
>> Ugh, Xorg not working OOTB is a bit of a showstopper, we cannot just g=
o
>> around and break userspace. OTOH this does seem like an userspace issu=
e
>> and not something which we can (or should try to) fix in the kernel.
>>
>> I guess the solution will have to be to have this default to N for now=

>> in Kconfig and clearly mention in the Kconfig help text that this need=
s
>> a fixed Xorg modesetting driver before it can be enabled.
>>
>> Any chance you have time to work on fixing the Xorg modesetting driver=

>> so that this will just work with the standard Xorg autoconfiguration
>> stuff?
>=20
> Hm, why do we even have both platform and pci drivers visible at the
> same time? I thought the point of this is that simplekms is built-in,
> then initrd loads the real drm driver, and by the time Xorg is
> running, simplekms should be long gone.
>=20
> Maybe a few more details of what's going wrong and why to help unconfus=
e me?

I tested simplekms with PCI graphics cards.

Xorg does it's own scanning of the busses. It supports a platform bus,
where it finds the simple-framebuffer device that is driven by
simplekms. Xorg also scans the PCI bus, where is finds the native PCI
device; usually driven by the native driver. It's the same hardware, but
on different busses.

For each device, Xorg tries to configure a screen, the Xorg modeset
driver tried to open the DRM device file and acquire DRM master status
on it. This works for the first screen, but DRM master status can only
be acquired once, so it fails for the second screen. Xorg then aborts
and asks for manual configuration of the display device.

This can be solved by setting the platform device's bus id in the
xorg.conf device section. It just doesn't happen automatically.

I found it hard to find a solution to this. Weston just opens a DRM
device file and uses whatever it gets. Ideally, Xorg would do the same.
That whole bus-scanning exercise gives it a wrong idea on which graphics
devices are available.

One idea for a fix is to compare the device I/O-memory ranges and filter
out duplicates on the Xorg modeset driver. I don't know how reliable
this works in practice or if their are false positives.

A more fundamental solution is to introduce a DRM bus in Xorg that
enumerates all available DRM device files. If there are any, no other
busses would be scanned.

I'm still looking for something better. Idea are highly welcome.

Best regards
Thomas


>=20
>>> One cosmetical issue is that simplekms's device file is card0 and the=

>>> native driver's device file is card1. After simplekms has been kicked=
 out,
>>> only card1 is left. This does not seem to be a practical problem howe=
ver.
>>>
>>> TODO/IDEAS:
>>>
>>>       * provide deferred takeover
>>
>> I assume you mean akin to CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=
 ?
>> I don't think you need to do anything for that, as long as you just
>> leave the fb contents intact until requested to change it.
>=20
> Yeah I think fastboot support is a requirement here, otherwise all the
> deferred fb takeover should already happen automatically I think.
>=20
> Also fastboot =3D flickerfree, depending whether you care more about
> "fewer modesets to save time" or "less flickering because it's ugly"
> :-)
>=20
> Cheers, Daniel
>=20
>> Right now with flickerfree boot we have fbcon on top of efifb and
>> efifb does not do anything special wrt
>> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>> ATM it does draw/restore the ACPI BGRT logo since since some firmwares=

>> don't draw that themselves, but that is not necessary in most cases
>> and other then that all the deferred takeover magic is in the fbcon
>> code, it does not bind to the fbdev (and thus does not draw to it)
>> until the first time the kernel tries to output text to the console,
>> together with the "quiet" kernel commandline argument that ensures
>> that the fb is kept unmodified until e.g. a panic happens.
>>
>> With simplekms we would replace "fbcon on top of efifb" with
>> "fbcon on top of emulated-fbdev on top of simplekms" so as long
>> as the emulated-fbdev and simplekms code defer from say clearing
>> the screen to black, but keep it as is. Then the fb contents
>> should be preserved until fbcon decides to takeover the fbdev
>> and draw to it.
>>
>>>       * provide bootsplash DRM client
>>
>> Hmm, I guess this might be interesting for simple cases, but
>> although I would love to kill plymouth (I've become one of the
>> upstream maintainers for it) I'm afraid it is not that easy,
>> it does a bunch of stuff which will be tricky to do in the kernel:
>>
>> 1) Ask the user for diskcrypt passwords:
>> https://ic.pics.livejournal.com/hansdegoede/13347631/1496/1496_900.png=

>>
>> 2) Show a nice splash + progressbar when installing updates in
>> offline updates mode:
>> https://ic.pics.livejournal.com/hansdegoede/13347631/899/899_900.png
>>
>> Still this would be nice for the non diskcrypt case I guess, then
>> we could not use plymouth during normal boot and only use it
>> for offline updates and it would also be nice for various embedded
>> cases.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>>       * make simplekms usable with ARM-EFI fbs
>>>
>>> Thomas Zimmermann (9):
>>>    drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip=
()
>>>    drm/format-helper: Add blitter functions
>>>    drm: Add simplekms driver
>>>    drm/simplekms: Add fbdev emulation
>>>    drm/simplekms: Initialize framebuffer data from device-tree node
>>>    drm/simplekms: Acquire clocks from DT device node
>>>    drm/simplekms: Acquire regulators from DT device node
>>>    drm: Add infrastructure for platform devices
>>>    drm/simplekms: Acquire memory aperture for framebuffer
>>>
>>>   MAINTAINERS                            |   6 +
>>>   drivers/gpu/drm/Kconfig                |   6 +
>>>   drivers/gpu/drm/Makefile               |   1 +
>>>   drivers/gpu/drm/drm_format_helper.c    |  96 ++-
>>>   drivers/gpu/drm/drm_platform.c         | 118 ++++
>>>   drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
>>>   drivers/gpu/drm/tiny/Kconfig           |  17 +
>>>   drivers/gpu/drm/tiny/Makefile          |   1 +
>>>   drivers/gpu/drm/tiny/cirrus.c          |   2 +-
>>>   drivers/gpu/drm/tiny/simplekms.c       | 906 ++++++++++++++++++++++=
+++
>>>   include/drm/drm_fb_helper.h            |  18 +-
>>>   include/drm/drm_format_helper.h        |  10 +-
>>>   include/drm/drm_platform.h             |  42 ++
>>>   13 files changed, 1217 insertions(+), 8 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/drm_platform.c
>>>   create mode 100644 drivers/gpu/drm/tiny/simplekms.c
>>>   create mode 100644 include/drm/drm_platform.h
>>>
>>> --
>>> 2.27.0
>>>
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


--m9oQ9JRIsLafIgf6fcnk1KdBZkVYeFIAO--

--NsHloHQo12iXVs0fsV9wW0U4wDSTjOwvi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl78mWQACgkQaA3BHVML
eiMQNwgAmQCsdkWns9PutjXEjJzku5ZWH4zlA3VOreFnYm/vI3jb6xGHOfyyLwUy
v42n5enO1vMJX1M3vDmHCO4/g6UslxgSfXQ1pY6523jGk+YwHcpCcZc+SJbjhDOZ
jP8EOrq29jzAYxnow7O1pu3YTIrTw9dDAeTXqGvTT/Ti3Tldaqb12V73QSZaDDpS
cZd2pp72xbZ+OLd16larQYs3fe1A+SXayTVcS51DG7LDdsQ8pBbOv+0vJ9qLLaG+
iC2QHAnALKuyTzH9pm855erO9WB+SjHOOqu2oYvMEhBgBKIn96Mcf6/EgpHExMOL
r1vFROtJeIZ909lsi0y13voWdGklKA==
=hd5+
-----END PGP SIGNATURE-----

--NsHloHQo12iXVs0fsV9wW0U4wDSTjOwvi--

--===============1698055260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1698055260==--
