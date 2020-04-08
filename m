Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F61A1BE4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D076E952;
	Wed,  8 Apr 2020 06:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E476E952
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 06:28:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC0CFABBE;
 Wed,  8 Apr 2020 06:28:22 +0000 (UTC)
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <879068d4-3920-b8ee-2a3c-6cd4fe9d9f88@tronnes.org>
 <eedb5061-56b5-d8c8-6cfa-0ead5e65aaff@suse.de>
 <20200407165002.GC2220@ravnborg.org>
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
Message-ID: <264fa76a-a2f6-a9c6-15c5-891fd7f645ac@suse.de>
Date: Wed, 8 Apr 2020 08:28:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407165002.GC2220@ravnborg.org>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 kraxel@redhat.com, emil.velikov@collabora.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, chunkuang.hu@kernel.org,
 puck.chen@hisilicon.com, hdegoede@redhat.com, jsarha@ti.com,
 matthias.bgg@gmail.com, sean@poorly.run, zourongrong@gmail.com,
 tiantao6@hisilicon.com
Content-Type: multipart/mixed; boundary="===============1531992779=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1531992779==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="H7Dbp4mmgbh8YMOVjOXed0I60164AYNLB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--H7Dbp4mmgbh8YMOVjOXed0I60164AYNLB
Content-Type: multipart/mixed; boundary="rL5p6N7XDHeAEKvq6pGN1jOvk2LdfNUHb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul@crapouillou.net, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sean@poorly.run, hdegoede@redhat.com, kraxel@redhat.com,
 emil.velikov@collabora.com, yc_chen@aspeedtech.com, tiantao6@hisilicon.com,
 dri-devel@lists.freedesktop.org
Message-ID: <264fa76a-a2f6-a9c6-15c5-891fd7f645ac@suse.de>
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <879068d4-3920-b8ee-2a3c-6cd4fe9d9f88@tronnes.org>
 <eedb5061-56b5-d8c8-6cfa-0ead5e65aaff@suse.de>
 <20200407165002.GC2220@ravnborg.org>
In-Reply-To: <20200407165002.GC2220@ravnborg.org>

--rL5p6N7XDHeAEKvq6pGN1jOvk2LdfNUHb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 07.04.20 um 18:50 schrieb Sam Ravnborg:
> Hi Thomas/Noralf.
>=20
>>> Having DRM core take care of fbdev emulation was an idea Laurent had
>>> which was the spark that set me off making the generic fbdev emulatio=
n.
>>>
>>> Maybe it's still too early to make this move, I don't know.
>>
>> I think we should wait a bit. As you mentioned, there are drivers that=

>> have an fbdev bpp that differs from the preferred one. There might als=
o
>> be a chicken-and-egg problem with core and fb-helper modules.
>=20
> Noralf - you had analyzed what drivers are (yet) to migrate to
> to the common fbdev emulation.
> Link: https://lore.kernel.org/dri-devel/34e654ae-0cc9-e393-ac02-e4ac6ed=
a60f6@tronnes.org/
>=20
> armada

This one looks like its convertible to common infrastructure. Not just
the fbdev console, but quite a bit of the framebuffer and GEM code. But
I don't have the HW to test any patches.

> gma500

I have a patch for replacing some of the gma500 code with common
infrastructure. It currently fails and I haven't found time to look close=
r.

> amd
> omapdrm
> nouveau
> i915
> msm
> tegra
> exynos
> radeon
> rockchip
>=20
> Maybe add this list to todo.rst - and if someone knows about it
> we could have a small description what is required before a
> driver can migrate.
> I can cook up the patch if anyone thinks this is useful.

I thought there already was such an entry in the TODO list. Some of
these drivers have HW acceleration of some kind; although the benefits
might be debatable. And there where 2 or 3 drivers with a design that is
incompatible with generic fbdev. There's also some information at [1].

In any case, we should consider initializing each driver's fb console
after registering the device. All console implementations would than act
like DRM clients and less like driver components.

Best regards
Thomas

[1]
https://lore.kernel.org/dri-devel/7016126a-f498-1a4a-4721-c6305a961457@su=
se.de/

>=20
> 	Sam
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rL5p6N7XDHeAEKvq6pGN1jOvk2LdfNUHb--

--H7Dbp4mmgbh8YMOVjOXed0I60164AYNLB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6NbwEACgkQaA3BHVML
eiPMEQf/TyL+t7N3zZFc2U0mv3zbv3e81/Wcwvu2csBioVlfIk3wFOQ726FT6uxf
JmC4wE1rhnbHUAjgZ+rY/42XVVHg7FAvKoJsYCVxDPKKBBM5BJkcXwZ5ZUSshp/y
HWuXlv94wQsOWvZMlELKt+lTeVaKOa0X/dZIRgaL3ybym8AAaqWsR9jhTgLLxWSQ
U5knCZU1t6HTtQ2brI2cOis53I3E8EIqphOq/xfZsRVp4PdtAUc0hQtGeDVM1ckC
UkZc/mDYs1gflCVbKOZRXAaubEmdkaB3slVypQjYRcHkkYrPQ2Y3Xkjuq+NwH/vp
6mJ16cTrUeOZzQ0rF6M4q7AuFKBVCw==
=ZwwY
-----END PGP SIGNATURE-----

--H7Dbp4mmgbh8YMOVjOXed0I60164AYNLB--

--===============1531992779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1531992779==--
