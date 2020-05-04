Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934621C3B69
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 15:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6976E3FC;
	Mon,  4 May 2020 13:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB586E3FC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 13:39:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EF95EACD8;
 Mon,  4 May 2020 13:39:51 +0000 (UTC)
Subject: Re: [PATCH 00/17] drm/mgag200: Convert to atomic modesetting
To: John Donnelly <John.P.Donnelly@Oracle.com>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org, sam@ravnborg.org
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <793986e2-eb08-db03-689f-db4442b0e872@Oracle.com>
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
Message-ID: <aa14e291-5ddf-bd02-ceb7-5cb291a20858@suse.de>
Date: Mon, 4 May 2020 15:39:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <793986e2-eb08-db03-689f-db4442b0e872@Oracle.com>
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
Content-Type: multipart/mixed; boundary="===============0978519954=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0978519954==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EfMke12jTdgUTwED9f2bMr2cw67lXz1Rt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EfMke12jTdgUTwED9f2bMr2cw67lXz1Rt
Content-Type: multipart/mixed; boundary="eei8CfIvjzq0B59QfFMJjXMHgvzm978Jk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Donnelly <John.P.Donnelly@Oracle.com>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <aa14e291-5ddf-bd02-ceb7-5cb291a20858@suse.de>
Subject: Re: [PATCH 00/17] drm/mgag200: Convert to atomic modesetting
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <793986e2-eb08-db03-689f-db4442b0e872@Oracle.com>
In-Reply-To: <793986e2-eb08-db03-689f-db4442b0e872@Oracle.com>

--eei8CfIvjzq0B59QfFMJjXMHgvzm978Jk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi John

Am 30.04.20 um 02:11 schrieb John Donnelly:
> On 4/29/20 9:32 AM, Thomas Zimmermann wrote:
>> This patchset converts mgag200 to atomic modesetting. It uses simple
>> KMS helpers and SHMEM.
>>
>> Patches 1 to 4 simplifies the driver before the conversion. For exampl=
e,
>> the HW cursor is not usable with the way universal planes work. A few
>> data structures can be cleaned up.
>>
>> Patches 5 to 15 untangle the existing modesetting code into smaller
>> functions. Specifically, mode setting and plane updates are being
>> separated from each other.
>>
>> Patch 16 converts mgag200 to simple KMS helpers and enables atomic
>> mode setting.
>>
>> As some HW seems to require a framebuffer offset of 0 within the video=

>> memory, it does not work with atomic modesetting. Atomically switching=

>> plane framebuffers, requires either source or target buffer to be loca=
ted
>> at a non-0 offet. To resolve this problem, patch 17 converts mgag200 f=
rom
>> VRAM helpers to SHMEM helpers. During plane updates, the content of th=
e
>> SHMEM BO is memcpy'd to VRAM. From my subjective obersation, performan=
ce
>> is not nuch different from the original code.
>>
>> The patchset has been tested on MGA G200EH hardware.
>>
>> Thomas Zimmermann (17):
>> =C2=A0=C2=A0 drm/mgag200: Remove HW cursor
>> =C2=A0=C2=A0 drm/mgag200: Remove unused fields from struct mga_device
>> =C2=A0=C2=A0 drm/mgag200: Embed connector instance in struct mga_devic=
e
>> =C2=A0=C2=A0 drm/mgag200: Use managed mode-config initialization
>> =C2=A0=C2=A0 drm/mgag200: Clean up mga_set_start_address()
>> =C2=A0=C2=A0 drm/mgag200: Clean up mga_crtc_do_set_base()
>> =C2=A0=C2=A0 drm/mgag200: Move mode-setting code into separate helper =
function
>> =C2=A0=C2=A0 drm/mgag200: Split MISC register update into PLL selectio=
n, SYNC and
>> =C2=A0=C2=A0=C2=A0=C2=A0 I/O
>> =C2=A0=C2=A0 drm/mgag200: Update mode registers after plane registers
>> =C2=A0=C2=A0 drm/mgag200: Set pitch in a separate helper function
>> =C2=A0=C2=A0 drm/mgag200: Set primary plane's format in separate helpe=
r function
>> =C2=A0=C2=A0 drm/mgag200: Move TAGFIFO reset into separate function
>> =C2=A0=C2=A0 drm/mgag200: Move hiprilvl setting into separate function=
s
>> =C2=A0=C2=A0 drm/mgag200: Move register initialization into separate f=
unction
>> =C2=A0=C2=A0 drm/mgag200: Remove waiting from DPMS code
>> =C2=A0=C2=A0 drm/mgag200: Convert to simple KMS helper
>> =C2=A0=C2=A0 drm/mgag200: Replace VRAM helpers with SHMEM helpers
>>
>> =C2=A0 drivers/gpu/drm/mgag200/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
>> =C2=A0 drivers/gpu/drm/mgag200/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/mgag200/mgag200_cursor.c | 319 --------
>> =C2=A0 drivers/gpu/drm/mgag200/mgag200_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 51 +-
>> =C2=A0 drivers/gpu/drm/mgag200/mgag200_drv.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 43 +-
>> =C2=A0 drivers/gpu/drm/mgag200/mgag200_main.c=C2=A0=C2=A0 |=C2=A0 28 -=

>> =C2=A0 drivers/gpu/drm/mgag200/mgag200_mode.c=C2=A0=C2=A0 | 948 ++++++=
++++++-----------
>> =C2=A0 drivers/gpu/drm/mgag200/mgag200_reg.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 5 +-
>> =C2=A0 drivers/gpu/drm/mgag200/mgag200_ttm.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 35 +-
>> =C2=A0 9 files changed, 563 insertions(+), 872 deletions(-)
>> =C2=A0 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c
>>
>> --=20
>> 2.26.0
>>
>=20
>=20
> =C2=A0Hi Thomas ,
>=20
> =C2=A0I would like to test this on hardware that uses this device integ=
rated
> into as BMC=C2=A0 ( iLo ) that I have ran into problems before. Can you=
 post
> your staging URL so I can clone it ?

I uploaded the patches at


https://gitlab.freedesktop.org/tzimmermann/linux/-/tree/mgag200-simplekms=
-20200504

You can clone them with

  git clone git@gitlab.freedesktop.org:tzimmermann/linux.git

and checkout the mgag200-simplekms-20200405 branch afterwards.

Best regards
Thomas

>=20
>=20
> ( Thank you for CC'ing me. I removed my email from on dlist recently) .=

>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eei8CfIvjzq0B59QfFMJjXMHgvzm978Jk--

--EfMke12jTdgUTwED9f2bMr2cw67lXz1Rt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6wGyIACgkQaA3BHVML
eiMWPggAv+q5FEGmKnE7hkt1KiWkgzAF8uTZLPMpbXfYH+WKl18+HNncfXL6GuBo
V5uV3otvn6cuH8aC7QVc2S0a1nSvNbEKxfBtHjDnhLAe5HPAkZx8/dgvwX/jF8Yv
WcRC6goaa2s5uPlIcy9u6LTHberq8+V/1BeVuGYdAJ9Zd81fNkp3XPLk2HyhmFGb
GcBay0lIFJyVnxnkNLVYY36K/v/t0ze+QACZM7ErliQDwXxk0/2mH277tJbr4SrH
nfdTnjf5QdhEafXVOcx0cicR2VMi77NYb4ZlEBg8eUHm9JMC8uaEK6tXqtZlK1f2
4qdsYj+D/peKz6ihHlq/Sdj8f0y7rQ==
=cuyd
-----END PGP SIGNATURE-----

--EfMke12jTdgUTwED9f2bMr2cw67lXz1Rt--

--===============0978519954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0978519954==--
