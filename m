Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4871C6A12
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E966389A32;
	Wed,  6 May 2020 07:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D4689A32
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 07:29:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93D1DAD93;
 Wed,  6 May 2020 07:29:52 +0000 (UTC)
Subject: Re: [PATCH 00/17] drm/mgag200: Convert to atomic modesetting
To: John Donnelly <john.p.donnelly@oracle.com>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <793986e2-eb08-db03-689f-db4442b0e872@Oracle.com>
 <aa14e291-5ddf-bd02-ceb7-5cb291a20858@suse.de>
 <8802DE27-AA22-4407-A177-17636FC6740A@oracle.com>
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
Message-ID: <02d675e0-323d-356e-6fae-ff461c5d6d29@suse.de>
Date: Wed, 6 May 2020 09:29:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <8802DE27-AA22-4407-A177-17636FC6740A@oracle.com>
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
Cc: airlied@redhat.com, sam@ravnborg.org, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1899073196=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1899073196==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tu2SAa1NYTyg59IIQ6m6ZG4tbhTgckPWm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tu2SAa1NYTyg59IIQ6m6ZG4tbhTgckPWm
Content-Type: multipart/mixed; boundary="H86qwqlsa25CyP5ERt1nPcR4ydPGmu6pc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Donnelly <john.p.donnelly@oracle.com>
Cc: dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 sam@ravnborg.org
Message-ID: <02d675e0-323d-356e-6fae-ff461c5d6d29@suse.de>
Subject: Re: [PATCH 00/17] drm/mgag200: Convert to atomic modesetting
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <793986e2-eb08-db03-689f-db4442b0e872@Oracle.com>
 <aa14e291-5ddf-bd02-ceb7-5cb291a20858@suse.de>
 <8802DE27-AA22-4407-A177-17636FC6740A@oracle.com>
In-Reply-To: <8802DE27-AA22-4407-A177-17636FC6740A@oracle.com>

--H86qwqlsa25CyP5ERt1nPcR4ydPGmu6pc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 05.05.20 um 14:20 schrieb John Donnelly:
>=20
>=20
>> On May 4, 2020, at 8:39 AM, Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>>
>> Hi John
>>
>> Am 30.04.20 um 02:11 schrieb John Donnelly:
>>> On 4/29/20 9:32 AM, Thomas Zimmermann wrote:
>>>> This patchset converts mgag200 to atomic modesetting. It uses simple=

>>>> KMS helpers and SHMEM.
>>>>
>>>> Patches 1 to 4 simplifies the driver before the conversion. For exam=
ple,
>>>> the HW cursor is not usable with the way universal planes work. A fe=
w
>>>> data structures can be cleaned up.
>>>>
>>>> Patches 5 to 15 untangle the existing modesetting code into smaller
>>>> functions. Specifically, mode setting and plane updates are being
>>>> separated from each other.
>>>>
>>>> Patch 16 converts mgag200 to simple KMS helpers and enables atomic
>>>> mode setting.
>>>>
>>>> As some HW seems to require a framebuffer offset of 0 within the vid=
eo
>>>> memory, it does not work with atomic modesetting. Atomically switchi=
ng
>>>> plane framebuffers, requires either source or target buffer to be lo=
cated
>>>> at a non-0 offet. To resolve this problem, patch 17 converts mgag200=
 from
>>>> VRAM helpers to SHMEM helpers. During plane updates, the content of =
the
>>>> SHMEM BO is memcpy'd to VRAM. From my subjective obersation, perform=
ance
>>>> is not nuch different from the original code.
>>>>
>>>> The patchset has been tested on MGA G200EH hardware.
>>>>
>>>> Thomas Zimmermann (17):
>>>>    drm/mgag200: Remove HW cursor
>>>>    drm/mgag200: Remove unused fields from struct mga_device
>>>>    drm/mgag200: Embed connector instance in struct mga_device
>>>>    drm/mgag200: Use managed mode-config initialization
>>>>    drm/mgag200: Clean up mga_set_start_address()
>>>>    drm/mgag200: Clean up mga_crtc_do_set_base()
>>>>    drm/mgag200: Move mode-setting code into separate helper function=

>>>>    drm/mgag200: Split MISC register update into PLL selection, SYNC =
and
>>>>      I/O
>>>>    drm/mgag200: Update mode registers after plane registers
>>>>    drm/mgag200: Set pitch in a separate helper function
>>>>    drm/mgag200: Set primary plane's format in separate helper functi=
on
>>>>    drm/mgag200: Move TAGFIFO reset into separate function
>>>>    drm/mgag200: Move hiprilvl setting into separate functions
>>>>    drm/mgag200: Move register initialization into separate function
>>>>    drm/mgag200: Remove waiting from DPMS code
>>>>    drm/mgag200: Convert to simple KMS helper
>>>>    drm/mgag200: Replace VRAM helpers with SHMEM helpers
>>>>
>>>>   drivers/gpu/drm/mgag200/Kconfig          |   4 +-
>>>>   drivers/gpu/drm/mgag200/Makefile         |   2 +-
>>>>   drivers/gpu/drm/mgag200/mgag200_cursor.c | 319 --------
>>>>   drivers/gpu/drm/mgag200/mgag200_drv.c    |  51 +-
>>>>   drivers/gpu/drm/mgag200/mgag200_drv.h    |  43 +-
>>>>   drivers/gpu/drm/mgag200/mgag200_main.c   |  28 -
>>>>   drivers/gpu/drm/mgag200/mgag200_mode.c   | 948 ++++++++++++-------=
----
>>>>   drivers/gpu/drm/mgag200/mgag200_reg.h    |   5 +-
>>>>   drivers/gpu/drm/mgag200/mgag200_ttm.c    |  35 +-
>>>>   9 files changed, 563 insertions(+), 872 deletions(-)
>>>>   delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c
>>>>
>>>> --=20
>>>> 2.26.0
>>>>
>>>
>>>
>>>  Hi Thomas ,
>>>
>>>  I would like to test this on hardware that uses this device integrat=
ed
>>> into as BMC  ( iLo ) that I have ran into problems before. Can you po=
st
>>> your staging URL so I can clone it ?
>>
>> I uploaded the patches at
>>
>>
>> https://gitlab.freedesktop.org/tzimmermann/linux/-/tree/mgag200-simple=
kms-20200504
>>
>> You can clone them with
>>
>>  git clone git@gitlab.freedesktop.org:tzimmermann/linux.git
>>
>> and checkout the mgag200-simplekms-20200405 branch afterwards.
>>
>> Best regards
>> Thomas
>>
>>>
>>>
>>> ( Thank you for CC'ing me. I removed my email from on dlist recently)=
 .
>>>
>>>
>>>
>=20
>      I had no issues running  these changes with gnome on a server with=
 a mgag200 integrated into a BMC .
>=20
>     Tested-by:  John Donnelly <John.p.donnelly@oracle.com>

Thanks! I'll add the tag to the patchset.

Best regards
Thomas

>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--H86qwqlsa25CyP5ERt1nPcR4ydPGmu6pc--

--tu2SAa1NYTyg59IIQ6m6ZG4tbhTgckPWm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6yZ2wACgkQaA3BHVML
eiPN8wgAkcyJ2UWhr0KO7TO9yPDLmCjJVH3ZGII+kc5McLuaNFmNpnILU2zTZqzC
YDbHMmNI5uZcivSNDDYTpT0dssH17jpJi9wTL/EXeEwnI4Bh6PKDCH5An+Fm/SfZ
PqvvS18TfvlknrilHGLLoli8pYz0lEvkk5LMlI8tOtC/0wbbezVBUa8985cydA1c
MEhEJwINSL6vEjOJv56Ss3Ay5yCyuWHRK7Dq3xGEn11deyMYruLcS17hkOfODcvo
PiOuZ2BIWGg3VwUONzzdx8c+YyifRsoVuwjR2TRftupNRI5EWsxUV7vDEPLYSX0V
IcpI2LRm3MqOc8sNpZrlA/QAYAza3Q==
=8/r2
-----END PGP SIGNATURE-----

--tu2SAa1NYTyg59IIQ6m6ZG4tbhTgckPWm--

--===============1899073196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1899073196==--
