Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A53A9210CA7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 15:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914976E055;
	Wed,  1 Jul 2020 13:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EB36E055
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 13:48:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25D22AAF1;
 Wed,  1 Jul 2020 13:48:44 +0000 (UTC)
Subject: Re: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Hans de Goede <hdegoede@redhat.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, sam@ravnborg.org,
 emil.l.velikov@gmail.com, noralf@tronnes.org, geert+renesas@glider.be
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
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
Message-ID: <3f1082d6-7268-097f-8bbd-6d9c97f35f1f@suse.de>
Date: Wed, 1 Jul 2020 15:48:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0541461031=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0541461031==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="P2dxRnG47qNr50w5yfUv3ii6bcRu5qZU9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--P2dxRnG47qNr50w5yfUv3ii6bcRu5qZU9
Content-Type: multipart/mixed; boundary="sxCpWnNrqYuiRITIZWGqMLO4fsGlIy9pj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, sam@ravnborg.org,
 emil.l.velikov@gmail.com, noralf@tronnes.org, geert+renesas@glider.be
Cc: dri-devel@lists.freedesktop.org
Message-ID: <3f1082d6-7268-097f-8bbd-6d9c97f35f1f@suse.de>
Subject: Re: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
In-Reply-To: <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>

--sxCpWnNrqYuiRITIZWGqMLO4fsGlIy9pj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Hans

Am 29.06.20 um 11:38 schrieb Hans de Goede:
> Hi,
>=20
> On 6/25/20 2:00 PM, Thomas Zimmermann wrote:
>> This patchset adds support for simple-framebuffer platform devices and=

>> a handover mechanism for native drivers to take-over control of the
>> hardware.
>>
>> The new driver, called simplekms, binds to a simple-frambuffer platfor=
m
>> device. The kernel's boot code creates such devices for firmware-provi=
ded
>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boo=
t
>> loader sets up the framebuffers. Description via device tree is also a=
n
>> option.
>>
>> Simplekms is small enough to be linked into the kernel. The driver's m=
ain
>> purpose is to provide graphical output during the early phases of the
>> boot
>> process, before the native DRM drivers are available. Native drivers a=
re
>> typically loaded from an initrd ram disk. Occationally simplekms can a=
lso
>> serve as interim solution on graphics hardware without native DRM driv=
er.
>=20
> Cool, thank you for doing this, this is a very welcome change,
> but ... (see below).
>=20
>> So far distributions rely on fbdev drivers, such as efifb, vesafb or
>> simplefb, for early-boot graphical output. However fbdev is deprecated=

>> and
>> the drivers do not provide DRM interfaces for modern userspace.
>>
>> Patches 1 and 2 prepare the DRM format helpers for simplekms.
>>
>> Patches 3 to 7 add the simplekms driver. It's build on simple DRM help=
ers
>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. Dur=
ing
>> pageflips, SHMEM buffers are copied into the framebuffer memory, simil=
ar
>> to cirrus or mgag200. The code in patches 6 and 7 handles clocks and
>> regulators. It's based on the simplefb drivers, but has been modified =
for
>> DRM.
>>
>> Patches 8 and 9 add a hand-over mechanism. Simplekms acquires it's
>> framebuffer's I/O-memory range and provides a callback function to be
>> removed by a native driver. The native driver will remove simplekms
>> before
>> taking over the hardware. The removal is integrated into existing
>> helpers,
>> so drivers use it automatically.
>>
>> I tested simplekms with x86 EFI and VESA framebuffers, which both work=

>> reliably. The fbdev console and Weston work automatically. Xorg requir=
es
>> manual configuration of the device. Xorgs current modesetting driver d=
oes
>> not work with both, platform and PCI device, for the same physical
>> hardware. Once configured, X11 works.
>=20
> Ugh, Xorg not working OOTB is a bit of a showstopper, we cannot just go=

> around and break userspace. OTOH this does seem like an userspace issue=

> and not something which we can (or should try to) fix in the kernel.

Xorg is an important use case, but simplekms does not "break userspace."
If you're not using simplekms, nothing changes; if simplekms is replaced
by the native driver, nothing changes. Simplekms works with Xorg of the
device is auto-configured. Xorg is not able to auto-configure simplekms
devices ATM.

>=20
> I guess the solution will have to be to have this default to N for now
> in Kconfig and clearly mention in the Kconfig help text that this needs=

> a fixed Xorg modesetting driver before it can be enabled.

Sure, but simplekms is just a driver. Shouldn't it default to N anyway?

>=20
> Any chance you have time to work on fixing the Xorg modesetting driver
> so that this will just work with the standard Xorg autoconfiguration
> stuff?

I'll do if somehow possible. See my reply to Daniel for a description of
the problem.

>=20
>> One cosmetical issue is that simplekms's device file is card0 and the
>> native driver's device file is card1. After simplekms has been kicked
>> out,
>> only card1 is left. This does not seem to be a practical problem howev=
er.
>>
>> TODO/IDEAS:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0* provide deferred takeover
>=20
> I assume you mean akin to CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER =
?
> I don't think you need to do anything for that, as long as you just
> leave the fb contents intact until requested to change it.

Great. If it's that easy; even better.

>=20
> Right now with flickerfree boot we have fbcon on top of efifb and
> efifb does not do anything special wrt
> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
> ATM it does draw/restore the ACPI BGRT logo since since some firmwares
> don't draw that themselves, but that is not necessary in most cases
> and other then that all the deferred takeover magic is in the fbcon
> code, it does not bind to the fbdev (and thus does not draw to it)
> until the first time the kernel tries to output text to the console,
> together with the "quiet" kernel commandline argument that ensures
> that the fb is kept unmodified until e.g. a panic happens.
>=20
> With simplekms we would replace "fbcon on top of efifb" with
> "fbcon on top of emulated-fbdev on top of simplekms" so as long
> as the emulated-fbdev and simplekms code defer from say clearing
> the screen to black, but keep it as is. Then the fb contents
> should be preserved until fbcon decides to takeover the fbdev
> and draw to it.
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0* provide bootsplash DRM client
>=20
> Hmm, I guess this might be interesting for simple cases, but
> although I would love to kill plymouth (I've become one of the
> upstream maintainers for it) I'm afraid it is not that easy,
> it does a bunch of stuff which will be tricky to do in the kernel:

The whole bootsplash thing is really a follow-up project.

What I have in mind for the bootsplash is the ACPI BGRT logo restoration
that is currently in efifb. Maybe other sources for boot logos could be
considered as well. And if nothing else, it could show a penguin. As
soon as plymouth is ready, it would take over the display and do its thin=
g.

Noralf made a prototype of an in-kernel bootsplash client that displays
a colored rectangle. That's already half of the work, I guess.

Best regards
Thomas

>=20
> 1) Ask the user for diskcrypt passwords:
> https://ic.pics.livejournal.com/hansdegoede/13347631/1496/1496_900.png
>=20
> 2) Show a nice splash + progressbar when installing updates in
> offline updates mode:
> https://ic.pics.livejournal.com/hansdegoede/13347631/899/899_900.png
>=20
> Still this would be nice for the non diskcrypt case I guess, then
> we could not use plymouth during normal boot and only use it
> for offline updates and it would also be nice for various embedded
> cases.
>=20
> Regards,
>=20
> Hans
>=20
>=20
>=20
>=20
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0* make simplekms usable with ARM-EFI fbs
>>
>> Thomas Zimmermann (9):
>> =C2=A0=C2=A0 drm/format-helper: Pass destination pitch to drm_fb_memcp=
y_dstclip()
>> =C2=A0=C2=A0 drm/format-helper: Add blitter functions
>> =C2=A0=C2=A0 drm: Add simplekms driver
>> =C2=A0=C2=A0 drm/simplekms: Add fbdev emulation
>> =C2=A0=C2=A0 drm/simplekms: Initialize framebuffer data from device-tr=
ee node
>> =C2=A0=C2=A0 drm/simplekms: Acquire clocks from DT device node
>> =C2=A0=C2=A0 drm/simplekms: Acquire regulators from DT device node
>> =C2=A0=C2=A0 drm: Add infrastructure for platform devices
>> =C2=A0=C2=A0 drm/simplekms: Acquire memory aperture for framebuffer
>>
>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
>> =C2=A0 drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
>> =C2=A0 drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 drivers/gpu/drm/drm_format_helper.c=C2=A0=C2=A0=C2=A0 |=C2=A0 9=
6 ++-
>> =C2=A0 drivers/gpu/drm/drm_platform.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 118 ++++
>> =C2=A0 drivers/gpu/drm/mgag200/mgag200_mode.c |=C2=A0=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/tiny/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 17 +
>> =C2=A0 drivers/gpu/drm/tiny/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 drivers/gpu/drm/tiny/cirrus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/tiny/simplekms.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 906 +++++++++++++++++++++++++
>> =C2=A0 include/drm/drm_fb_helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +-
>> =C2=A0 include/drm/drm_format_helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 10 +-
>> =C2=A0 include/drm/drm_platform.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 42 ++
>> =C2=A0 13 files changed, 1217 insertions(+), 8 deletions(-)
>> =C2=A0 create mode 100644 drivers/gpu/drm/drm_platform.c
>> =C2=A0 create mode 100644 drivers/gpu/drm/tiny/simplekms.c
>> =C2=A0 create mode 100644 include/drm/drm_platform.h
>>
>> --=20
>> 2.27.0
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--sxCpWnNrqYuiRITIZWGqMLO4fsGlIy9pj--

--P2dxRnG47qNr50w5yfUv3ii6bcRu5qZU9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl78lDgACgkQaA3BHVML
eiOOnQf/VozaLKrgm2e7EufVYVCeCOcwHOB2XVhdxYQXSr2zuD0H8ugeheSM5MmT
t7cuFyBsZLWM0SdF8smlyLbFfCJ0FXLw5p6uEY5+6ZH9VDK7W7sxjLy9awM4F7Tm
GxHZup9Ys3ms+bo05lUVgNGUfHjMY0kFe65ZuuGODjq9nbFirg9cv3F8SOvcn+qd
/6kxEj/zv7lJGPG3QjKrOk/PPeEAZ7sT8KNsyxPGrzZ3E4eXoke7vqTNHhaUqey8
LIxaxYz9GcPxfsu1UCp6YWZpupEBE1pRsW7Lh3yPC4q7w8nwe+Sp6ZHVaW8OqxJn
6E9R8IskNPdERJhbNRMyCdXg1axdEw==
=cAzx
-----END PGP SIGNATURE-----

--P2dxRnG47qNr50w5yfUv3ii6bcRu5qZU9--

--===============0541461031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0541461031==--
