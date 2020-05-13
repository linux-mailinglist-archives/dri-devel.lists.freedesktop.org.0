Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 652891D1094
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 13:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94466EA19;
	Wed, 13 May 2020 11:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3C26EA18
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 11:06:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4CD9AF01;
 Wed, 13 May 2020 11:06:17 +0000 (UTC)
Subject: Re: [PATCH v2 00/15] drm/mgag200: Convert to atomic modesetting
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512185636.GB13949@ravnborg.org>
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
Message-ID: <d6d76b92-9676-cffa-dc41-9aa993bde6e4@suse.de>
Date: Wed, 13 May 2020 13:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512185636.GB13949@ravnborg.org>
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0827477655=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0827477655==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WVpv9mykEp9RLOnBWIRTKsHdtO5hsCRBu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WVpv9mykEp9RLOnBWIRTKsHdtO5hsCRBu
Content-Type: multipart/mixed; boundary="WCF8j8TvvAfQtlpLaZ8UwG0QBYNA26k4F";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 noralf@tronnes.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com,
 dri-devel@lists.freedesktop.org
Message-ID: <d6d76b92-9676-cffa-dc41-9aa993bde6e4@suse.de>
Subject: Re: [PATCH v2 00/15] drm/mgag200: Convert to atomic modesetting
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512185636.GB13949@ravnborg.org>
In-Reply-To: <20200512185636.GB13949@ravnborg.org>

--WCF8j8TvvAfQtlpLaZ8UwG0QBYNA26k4F
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.05.20 um 20:56 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Tue, May 12, 2020 at 10:42:43AM +0200, Thomas Zimmermann wrote:
>> This patchset converts mgag200 to atomic modesetting. It uses simple
>> KMS helpers and SHMEM.
>>
>> Patch 1 removes cursor support. The HW cursor is not usable with the
>> way universal planes work.
>>
>> Patches 2 to 11 untangle the existing modesetting code into smaller
>> functions. Specifically, mode setting and plane updates are being
>> separated from each other.
>>
>> Patch 12 to 14 convert mgag200 to simple KMS helpers and enables atomi=
c
>> mode setting.
>>
>> Atomically switching plane framebuffers, requires either source or tar=
get
>> buffer to be located at a non-0 offet. As some HW revisions seem to re=
quire
>> a framebuffer offset of 0 within the video memory, they do not work wi=
th
>> atomic modesetting. To resolve this problem, patch 15 converts mgag200=

>> from VRAM helpers to SHMEM helpers. During plane updates, the content =
of
>> the SHMEM BO is memcpy'd to VRAM. From my observation, performance is =
not
>> nuch different from the original code.
>>
>> The patchset has been tested on MGA G200EH hardware.
>>
>> v2:
>> 	* rebase patchset
>> 	* replace uint{8,32}_t with u{8,32} through-out patchset
>> 	* define additional register constants
>> 	* use helper functions around bpp-shift computations
>> 	* split conversion patch
>> 	* cleanups
> With the one comment addressed patch 1-14 are now all:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Sure, I'll add that comment. Thanks for the timely reviews.

Best regards
Thomas

>=20
> I did not look at the last patch - all the memory stuff is still beyond=

> me.
>=20
> Nice to see this driver gettting so much love and care.
> The end result is a much nicer driver implmentation.
>=20
> 	Sam
>=20
>>
>> Thomas Zimmermann (15):
>>   drm/mgag200: Remove HW cursor
>>   drm/mgag200: Clean up mga_set_start_address()
>>   drm/mgag200: Clean up mga_crtc_do_set_base()
>>   drm/mgag200: Move mode-setting code into separate helper function
>>   drm/mgag200: Split MISC register update into PLL selection, SYNC and=

>>     I/O
>>   drm/mgag200: Update mode registers after plane registers
>>   drm/mgag200: Set pitch in a separate helper function
>>   drm/mgag200: Set primary plane's format in separate helper function
>>   drm/mgag200: Move TAGFIFO reset into separate function
>>   drm/mgag200: Move hiprilvl setting into separate functions
>>   drm/mgag200: Move register initialization into separate function
>>   drm/mgag200: Remove out-commented suspend/resume helpers
>>   drm/mgag200: Use simple-display data structures
>>   drm/mgag200: Convert to simple KMS helper
>>   drm/mgag200: Replace VRAM helpers with SHMEM helpers
>>
>>  drivers/gpu/drm/mgag200/Kconfig        |   4 +-
>>  drivers/gpu/drm/mgag200/Makefile       |   2 +-
>>  drivers/gpu/drm/mgag200/mgag200_drv.c  |  51 +-
>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  41 +-
>>  drivers/gpu/drm/mgag200/mgag200_main.c |   5 -
>>  drivers/gpu/drm/mgag200/mgag200_mode.c | 871 ++++++++++++++----------=
-
>>  drivers/gpu/drm/mgag200/mgag200_reg.h  |  11 +-
>>  drivers/gpu/drm/mgag200/mgag200_ttm.c  |  28 +-
>>  8 files changed, 528 insertions(+), 485 deletions(-)
>>
>> --
>> 2.26.2

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WCF8j8TvvAfQtlpLaZ8UwG0QBYNA26k4F--

--WVpv9mykEp9RLOnBWIRTKsHdtO5hsCRBu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl671KYACgkQaA3BHVML
eiNnxAgAupubmrLjFs1YVT7gWifcpLwMPCmxmDKonlqd0ZdUzy5EdXwjMrSiFDVS
/BmKk6XFgi5sBeSYB0uXMIt0jWLdeDKNAWXzbYHmswDBJrTmBnljUU1gpfEH2TLL
WSMKX+D+KIU/Khstp+F9mG5pTEHUDuN7G0Gst3Asa6CP7lDASTowgtO5uu2b7ee8
wGERRJwfnUnt+pPHKJhzs/9ZCaDrnHkh9Ea0rBlRojNs9tsgdoha5joNfpkg5MfI
aRZzaX+FQt01UfIGquBDQLLEY8p0S4p4GoLOjeANpAT1WHMGqDdA7aeJOA5FCA11
AzG/xGM5jJ/3C1O5CtVsihd7CF5r8g==
=VK7/
-----END PGP SIGNATURE-----

--WVpv9mykEp9RLOnBWIRTKsHdtO5hsCRBu--

--===============0827477655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0827477655==--
