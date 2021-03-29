Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB234D014
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 14:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C0A6E0C1;
	Mon, 29 Mar 2021 12:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975446E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 12:31:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E207B470;
 Mon, 29 Mar 2021 12:31:14 +0000 (UTC)
To: Hans de Goede <hdegoede@redhat.com>, daniel@ffwll.ch, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, kraxel@redhat.com,
 corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org, sam@ravnborg.org,
 robh@kernel.org, emil.l.velikov@gmail.com, geert+renesas@glider.be,
 bluescreen_avenger@verizon.net
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <d0ac63b3-dec5-58dc-2ce6-13cdef0399aa@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/10] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <c88e9322-4bf1-e303-c1f1-b2b433aa439f@suse.de>
Date: Mon, 29 Mar 2021 14:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d0ac63b3-dec5-58dc-2ce6-13cdef0399aa@redhat.com>
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
Cc: virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1930900506=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1930900506==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="n37YAzLws1rUjwvmIZHSmeVcN22DA3v9E"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--n37YAzLws1rUjwvmIZHSmeVcN22DA3v9E
Content-Type: multipart/mixed; boundary="AfeYgHXs7LRUnmo18KrSjYX3OEFWzA9bv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, daniel@ffwll.ch, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, kraxel@redhat.com,
 corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org, sam@ravnborg.org,
 robh@kernel.org, emil.l.velikov@gmail.com, geert+renesas@glider.be,
 bluescreen_avenger@verizon.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Message-ID: <c88e9322-4bf1-e303-c1f1-b2b433aa439f@suse.de>
Subject: Re: [PATCH v2 00/10] drm: Support simple-framebuffer devices and
 firmware fbs
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <d0ac63b3-dec5-58dc-2ce6-13cdef0399aa@redhat.com>
In-Reply-To: <d0ac63b3-dec5-58dc-2ce6-13cdef0399aa@redhat.com>

--AfeYgHXs7LRUnmo18KrSjYX3OEFWzA9bv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.03.21 um 12:29 schrieb Hans de Goede:
> Hi,
>=20
> On 3/18/21 11:29 AM, Thomas Zimmermann wrote:
>> This patchset adds support for simple-framebuffer platform devices and=

>> a handover mechanism for native drivers to take-over control of the
>> hardware.
>>
>> The new driver, called simpledrm, binds to a simple-frambuffer platfor=
m
>> device. The kernel's boot code creates such devices for firmware-provi=
ded
>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boo=
t
>> loader sets up the framebuffers. Description via device tree is also a=
n
>> option.
>>
>> Simpledrm is small enough to be linked into the kernel. The driver's m=
ain
>> purpose is to provide graphical output during the early phases of the =
boot
>> process, before the native DRM drivers are available. Native drivers a=
re
>> typically loaded from an initrd ram disk. Occationally simpledrm can a=
lso
>> serve as interim solution on graphics hardware without native DRM driv=
er.
>>
>> So far distributions rely on fbdev drivers, such as efifb, vesafb or
>> simplefb, for early-boot graphical output. However fbdev is deprecated=
 and
>> the drivers do not provide DRM interfaces for modern userspace.
>>
>> Patches 1 and 2 prepare the DRM format helpers for simpledrm.
>>
>> Patches 3 and 4 add a hand-over mechanism. Simpledrm acquires it's
>> framebuffer's I/O-memory range and provides a callback function to be
>> removed by a native driver. The native driver will remove simpledrm be=
fore
>> taking over the hardware. The removal is integrated into existing help=
ers,
>> so drivers use it automatically.
>>
>> Patches 5 to 10 add the simpledrm driver. It's build on simple DRM hel=
pers
>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. Dur=
ing
>> pageflips, SHMEM buffers are copied into the framebuffer memory, simil=
ar
>> to cirrus or mgag200. The code in patches 8 and 9 handles clocks and
>> regulators. It's based on the simplefb drivers, but has been modified =
for
>> DRM.
>=20
> Thank you for your work on this, this is very interesting.
>=20
>> I've also been working on fastboot support (i.e., flicker-free booting=
).
>> This requires state-readout from simpledrm via generic interfaces, as
>> outlined in [1]. I do have some prototype code, but it will take a whi=
le
>> to get this ready. Simpledrm will then support it.
>>
>> I've tested simpledrm with x86 EFI and VESA framebuffers, which both w=
ork
>> reliably. The fbdev console and Weston work automatically. Xorg requir=
es
>> manual configuration of the device. Xorgs current modesetting driver d=
oes
>> not work with both, platform and PCI device, for the same physical
>> hardware. Once configured, X11 works. I looked into X11, but couldn't =
see
>> an easy way of fixing the problem. With the push towards Wayland+Xwayl=
and
>> I expect the problem to become a non-issue soon. Additional testing ha=
s
>> been reported at [2].
>>
>> One cosmetical issue is that simpledrm's device file is card0 and the
>> native driver's device file is card1. After simpledrm has been kicked =
out,
>> only card1 is left. This does not seem to be a practical problem howev=
er.
>>
>> TODO/IDEAS:
>>
>> 	* provide deferred takeover
>=20
> I'm not sure what you mean with this ?  Currently deferred-takeover is
> handled in the fbcon code. Current flickerfree boot works like this
> (assuming a single LCD panel in a laptop):
>=20
> 1. EFI/GOP sets up the framebuffer, draws a vendor logo
> 2. The bootloader runs in silent mode and does not touch anything gfx r=
elated
> 3. kernel boots, with a loglevel of 3 so only CRIT/EMERG messages are s=
hown
> 2. efifb loads; and tells fbcon that a framebuffer is now available for=
 it to "bind"
>     to. Since CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=3Dy fbcon de=
fers taking over
>     the console and leaves the dummy-console driver in place (unless th=
ere have already
>     been kernel messages logged, which there shouldn't because loglevel=
=3D3)
> 3. i915 loads, reads out the hw state compares this to the preferred-mo=
de for the
>     panel which it would set, they match, nothing happens. i915 takes o=
wnership
>     of the scanout-buffer set up by the GOP, but leaves it in place.
>     i915 also removes the efifb /dev/fb0 and installs its own /dev/fb0 =
fbdev compat
>     device, fbcon is notified of this, but is still deferred and leaves=
 the dummy
>     console driver in place as console driver.
> 4. Plymouth loads, allocates a new scan-out buffer at the panel's prefe=
rred resolution,
>     plymouth reads the vendor-logo through the BGRT ACPI interface and =
fills the
>     scanout-buffer with the vendor-logo + a spinner. Then plymouth inst=
alls the new
>     scanout-buffer on the crtc, this is done atomically during vsync, s=
o the user
>     sees no changes, other then the spinner appearing
>     (note the active VT is now in graphical mode)
> 5. From here on not flickering is a userspace problem
>=20
> AFAICT this should work fine with simplekms too, unless it clears the s=
creen
> to black when it binds.

I forgot to add the code that clears the screen, but that's the case here=
=2E

Instead of a plane-disable operation, simpledrm can at best clear the=20
screen. This would happen during the initial mode-config reset IIRC. But =

we need to keep the display content stored in a framebuffer, so read-out =

helpers are required. There are more users of these read-out helpers.=20
Adding them at some point probably makes sense.

Other drivers might also want to read the initial config from simpledrm=20
via read-out helpers. I think only i915 currently supports something=20
like that ATM.

Best regards
Thomas

>=20
> An addition to the above sequence, if at any time either the kernel or =
userspace
> prints a message to the console; and at that time a fbdev is registered=
 then fbcon
> will takeover as the console driver from the dummy driver and it will s=
tart drawing
> to the registered fbdev (1), destroying the framebuffer contents. Also =
if any messages
> where printend while no fbdev was registered, then fbcon will takeover =
the console
> as soon as a fbdev gets registered.
>=20
> So since we already have deferred-takeover in the fbcon code, I wonder =
what you
> mean when you are talking about "provide deferred takeover" for simplek=
ms?
>=20
> Regards,
>=20
> Hans
>=20
>=20
> 1) Except when the VT has been switched to GFX mode when this happens, =
then fbcon
> will delay using the fbdev until the VT is switched back to text mode.
>=20
>=20
> p.s.
>=20
> This has the interesting side effect then when logging into a desktop G=
UI session:
> kernel -> plymouth -> gdm -> GNOME user session
>=20
> There never is any output to the text-console and fbcon never takes-ove=
r, so on
> many Laptops running say Fedora workstation the fbcon code is actually =
unused
> until the user manually switches to another virtual-console to log in i=
n
> text-mode:
>=20
> [hans@x1 ~]$ dmesg | grep -E 'fbcon|Console:|Truecolor'
> [    0.258904] Console: colour dummy device 80x25
> [    1.274726] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
> [    1.274768] fbcon: Deferring console take-over
> [    2.540894] fbcon: i915drmfb (fb0) is primary device
> [    2.540896] fbcon: Deferring console take-over
> [hans@x1 ~]$ uptime
>   12:29:39 up  4:19,  1 user,  load average: 0.58, 0.75, 0.81
>=20
> Look mom no fbcon
>=20
>=20
>=20
>=20
>> 	* provide bootsplash DRM client
>> 	* make simplekms usable with ARM-EFI fbs
>>
>> v2:
>> 	* rename to simpledrm, aperture helpers
>> 	* reorganized patches
>> 	* use hotplug helpers for removal (Daniel)
>> 	* added DT match tables (Rob)
>> 	* use shadow-plane helpers
>> 	* lots of minor cleanups
>>
>> [1] https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra=
8CxPvJ=3D9BwmvfU-O0gg@mail.gmail.com/
>> [2] https://lore.kernel.org/dri-devel/1761762.3HQLrFs1K7@nerdopolis/
>>
>> Thomas Zimmermann (10):
>>    drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip(=
)
>>    drm/format-helper: Add blitter functions
>>    drm/aperture: Move fbdev conflict helpers into drm_aperture.h
>>    drm/aperture: Add infrastructure for aperture ownership
>>    drm: Add simpledrm driver
>>    drm/simpledrm: Add fbdev emulation
>>    drm/simpledrm: Initialize framebuffer data from device-tree node
>>    drm/simpledrm: Acquire clocks from DT device node
>>    drm/simpledrm: Acquire regulators from DT device node
>>    drm/simpledrm: Acquire memory aperture for framebuffer
>>
>>   Documentation/gpu/drm-internals.rst    |  12 +
>>   MAINTAINERS                            |   7 +
>>   drivers/gpu/drm/Kconfig                |   7 +
>>   drivers/gpu/drm/Makefile               |   1 +
>>   drivers/gpu/drm/drm_aperture.c         | 287 ++++++++
>>   drivers/gpu/drm/drm_format_helper.c    |  96 ++-
>>   drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
>>   drivers/gpu/drm/tiny/Kconfig           |  17 +
>>   drivers/gpu/drm/tiny/Makefile          |   1 +
>>   drivers/gpu/drm/tiny/cirrus.c          |   2 +-
>>   drivers/gpu/drm/tiny/simpledrm.c       | 932 +++++++++++++++++++++++=
++
>>   include/drm/drm_aperture.h             |  96 +++
>>   include/drm/drm_fb_helper.h            |  56 +-
>>   include/drm/drm_format_helper.h        |  10 +-
>>   14 files changed, 1466 insertions(+), 60 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_aperture.c
>>   create mode 100644 drivers/gpu/drm/tiny/simpledrm.c
>>   create mode 100644 include/drm/drm_aperture.h
>>
>> --
>> 2.30.1
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--AfeYgHXs7LRUnmo18KrSjYX3OEFWzA9bv--

--n37YAzLws1rUjwvmIZHSmeVcN22DA3v9E
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBhyJAFAwAAAAAACgkQlh/E3EQov+C9
ORAA0j0c4UaQGEDb4xq9MQOVDN5vy/DcLFtKbvFxOw4LsS8B5eRKSRZDMLjS7GD9za+0EZsNFN8F
9T/2K8Ck2znja4KzMFm9ePs04TQXshGHpz8wmEPVw5mWxWxUbFAA5YcI5BY0g3uAXHqaR3EzGOAA
fCotxzmI+1gJT/9kkGhvYMUeigYDqYE1RIOOGrb5FhMJrGkb5bwRXFF35lQikaxfElPs/uCy7X7d
YlnhobjT7ctkJE2qQXe/Raxf7V/FddS3I5LyI/F6mYPRGSE5A6eK7SIcdermV6YHvilMirL8a4Wi
2LZfMJJeBqu/fXOUEQezkMM4JMCjc/XSU95v9LOd3PNwPMLCtd2Rft9TAAmdrEu+5y3RyKrmyReS
ZpXBGxZAjZzPU0YzXF9ASZvAEQO/ZO2pHewdogaxHBLNxf9pJehCRzVDWPIrklhCrFZkdKEowY29
2DoDB3+WAVLjaauiFPMR4wrg99Gt6g3KPt9CqYHcTSZorGjvhGIvAvxFwkHN2XC7UvP3tubaG3Aj
egL4h2NRooVlPOgjBrqGD43duI6nEdZ1Jjr1id6KqtSYCOuU1p1O4BNKgLZlLybaYfPxqhdtTHfR
L9VltAowhlWCKI/0xZ8YkljAo+F34Zjvzmnn5SEb0I3VlYDqVte+Wsjgk1BKNcDGJLmpQvn8XVRE
xT0=
=8owV
-----END PGP SIGNATURE-----

--n37YAzLws1rUjwvmIZHSmeVcN22DA3v9E--

--===============1930900506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1930900506==--
