Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A51A1CE0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475196E992;
	Wed,  8 Apr 2020 07:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D67D6E995
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 07:55:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4012CAD27;
 Wed,  8 Apr 2020 07:55:56 +0000 (UTC)
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
To: Jani Nikula <jani.nikula@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <20200406200051.GA26582@ravnborg.org>
 <fe7d4cbb-5e44-60fb-c54a-6cb975154ad7@suse.de> <87blo3lpwv.fsf@intel.com>
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
Message-ID: <148cf6dd-4e53-2d3a-1819-a56d3a945d57@suse.de>
Date: Wed, 8 Apr 2020 09:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87blo3lpwv.fsf@intel.com>
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
Cc: chunkuang.hu@kernel.org, hdegoede@redhat.com, airlied@linux.ie,
 puck.chen@hisilicon.com, jsarha@ti.com, dri-devel@lists.freedesktop.org,
 paul@crapouillou.net, xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 tomi.valkeinen@ti.com, kraxel@redhat.com, zourongrong@gmail.com,
 matthias.bgg@gmail.com, tiantao6@hisilicon.com, sean@poorly.run,
 emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============1259973337=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1259973337==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rvgUsSglKqt2W1gJMIbLQEBUNvZpHv9si"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rvgUsSglKqt2W1gJMIbLQEBUNvZpHv9si
Content-Type: multipart/mixed; boundary="WCE4tNWUisLqabkTsTwoHhwYAhHnXt0NQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 kraxel@redhat.com, emil.velikov@collabora.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 chunkuang.hu@kernel.org, puck.chen@hisilicon.com, hdegoede@redhat.com,
 jsarha@ti.com, matthias.bgg@gmail.com, sean@poorly.run,
 zourongrong@gmail.com, tiantao6@hisilicon.com
Message-ID: <148cf6dd-4e53-2d3a-1819-a56d3a945d57@suse.de>
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <20200406200051.GA26582@ravnborg.org>
 <fe7d4cbb-5e44-60fb-c54a-6cb975154ad7@suse.de> <87blo3lpwv.fsf@intel.com>
In-Reply-To: <87blo3lpwv.fsf@intel.com>

--WCE4tNWUisLqabkTsTwoHhwYAhHnXt0NQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Jani

Am 07.04.20 um 09:24 schrieb Jani Nikula:
> On Tue, 07 Apr 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi Sam
>>
>> Am 06.04.20 um 22:00 schrieb Sam Ravnborg:
>>> Hi Thomas.
>>>
>>> On Mon, Apr 06, 2020 at 03:43:55PM +0200, Thomas Zimmermann wrote:
>>>> Generic fbdev emulation is a DRM client. If possible, it should beha=
ve
>>>> like userspace clients. Therefore it should not run before the drive=
r
>>>> registered the new DRM device. If the setup function fails, the driv=
er
>>>> should not report an error.
>>>
>>> Thanks for taking the time to refactor all the relevant drivers.
>>>
>>> I have received some push-back in the past when suggesting this,
>>> but cannot remember from who.
>>> Let's see what review comments you get.
>>>
>>> As the rule is that the fbdev setup shall be setup after registering
>>> the DRM device - it would be nice to have this included in the
>>> documentation of drm_fbdev_generic_setup
>>>
>>> Could you try to to update the documentation to cover this?
>>
>> Good idea. I'll add this to patchset's next iteration.
>=20
> How about something like:
>=20
> 	drm_WARN_ON(dev, !dev->registered);
>=20
> (Not sure if that needs to be !dev->driver->load && !dev->registered).

I added such a warning to the patch. Only radeon uses load(), but it has
its own fbdev code. So the original test should be fine.

Best regards
Thomas

>=20
> This can be a follow-up patch later too.
>=20
> BR,
> Jani.
>=20
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> I will get back to the patches later this week.
>>>
>>> 	Sam
>>>
>>>>
>>>> This is a follow-up patchset to the discussion at [1].  I went
>>>> through all calls to drm_fbdev_generic_setup(), moved them to the
>>>> final operation of their driver's probe function, and removed the
>>>> return value.
>>>>
>>>> Built-tested on x86-64, aarch64 and arm.
>>>>
>>>> [1] https://lore.kernel.org/dri-devel/20200403135828.2542770-1-danie=
l.vetter@ffwll.ch/T/#m216b5b37aeeb7b28d55ad73b7a702b3d1d7bf867
>>>>
>>>> Thomas Zimmermann (10):
>>>>   drm/ast: Set up fbdev after registering device; remove error check=
s
>>>>   drm/hibmc: Remove error check from fbdev setup
>>>>   drm/kirin: Set up fbdev after fully registering device
>>>>   drm/ingenic: Remove error check from fbdev setup
>>>>   drm/mediathek: Remove error check from fbdev setup
>>>>   drm/mgag200: Set up fbdev after registering device; remove error
>>>>     checks
>>>>   drm/tilcdc: Set up fbdev after fully registering device
>>>>   drm/udl: Remove error check from fbdev setup
>>>>   drm/vboxvideo: Set up fbdev after registering device; remove error=

>>>>     checks
>>>>   drm/fb-helper: Remove return value from drm_fbdev_generic_setup()
>>>>
>>>>  drivers/gpu/drm/ast/ast_drv.c                  |  3 +++
>>>>  drivers/gpu/drm/ast/ast_main.c                 |  5 -----
>>>>  drivers/gpu/drm/drm_fb_helper.c                | 18 ++++++++-------=
---
>>>>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |  6 +-----
>>>>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  4 ++--
>>>>  drivers/gpu/drm/ingenic/ingenic-drm.c          |  4 +---
>>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  4 +---
>>>>  drivers/gpu/drm/mgag200/mgag200_drv.c          |  2 ++
>>>>  drivers/gpu/drm/mgag200/mgag200_main.c         |  4 ----
>>>>  drivers/gpu/drm/tilcdc/tilcdc_drv.c            |  3 +--
>>>>  drivers/gpu/drm/udl/udl_drv.c                  |  6 +-----
>>>>  drivers/gpu/drm/vboxvideo/vbox_drv.c           |  6 ++----
>>>>  include/drm/drm_fb_helper.h                    |  5 +++--
>>>>  13 files changed, 25 insertions(+), 45 deletions(-)
>>>>
>>>> --
>>>> 2.26.0
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WCE4tNWUisLqabkTsTwoHhwYAhHnXt0NQ--

--rvgUsSglKqt2W1gJMIbLQEBUNvZpHv9si
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6Ng4MACgkQaA3BHVML
eiPuVAf7BlAwDVJHiVIF28oWwxF0eA7gLBYX872wkJ68g6JUGIBHDXamLTeOGdBD
A3CNeVWbb5xSn5D5I+uYq6yJhltdSWFf8LBsSB1zsEFGHjPL90sQnOzAFSAD6wyW
gmgIu3iKJCK1w3OYtFp/gyFBnpPo9ojApy9MZYev4nFZ71P8low9bmn48vC8A3jr
MTsxHUHIBw4hIeWrMzqIgFopXOW9cYZIAhM/78WgPffjh0AgG9k0n7TjrIOTjePb
Od0fRwrgtRKlFKQeBOU14IlxP+8xJDuYQq8a27VGg4075XVkuQ7AXzGodanxa6Ym
KvWnw81ywvGAuWck5BiCX4bc9U3Faw==
=oBWK
-----END PGP SIGNATURE-----

--rvgUsSglKqt2W1gJMIbLQEBUNvZpHv9si--

--===============1259973337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1259973337==--
