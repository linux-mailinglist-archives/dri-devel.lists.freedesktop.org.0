Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A34B1FCD6B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 14:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F324E6E0DB;
	Wed, 17 Jun 2020 12:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25A36E0DB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 12:29:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 74BCAAAC7;
 Wed, 17 Jun 2020 12:29:29 +0000 (UTC)
Subject: Re: [PATCH] drm/mgag200: Don't set <rammapen> in MISC
To: Rong Chen <rong.a.chen@intel.com>
References: <20200616142630.20129-1-tzimmermann@suse.de>
 <CACvgo52NY98wQ4Pm3LozSmdewQf_ftX4cYZbx=t6=s9CNE27kA@mail.gmail.com>
 <ea09692a-5a8f-d315-3bce-d416e8a01c7a@suse.de>
 <20200617092252.GA5279@shao2-debian>
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
Message-ID: <f888c170-ee0f-5efa-768d-908ce2507a5b@suse.de>
Date: Wed, 17 Jun 2020 14:29:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200617092252.GA5279@shao2-debian>
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============1785341194=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1785341194==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7aOpJjOiKoSNpWSStPzSO67kkW7Yk7luY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7aOpJjOiKoSNpWSStPzSO67kkW7Yk7luY
Content-Type: multipart/mixed; boundary="2qBU6WNIBNCzjfYIfwMXXOOvFznc7Tgbk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rong Chen <rong.a.chen@intel.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 John Donnelly <john.p.donnelly@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Message-ID: <f888c170-ee0f-5efa-768d-908ce2507a5b@suse.de>
Subject: Re: [PATCH] drm/mgag200: Don't set <rammapen> in MISC
References: <20200616142630.20129-1-tzimmermann@suse.de>
 <CACvgo52NY98wQ4Pm3LozSmdewQf_ftX4cYZbx=t6=s9CNE27kA@mail.gmail.com>
 <ea09692a-5a8f-d315-3bce-d416e8a01c7a@suse.de>
 <20200617092252.GA5279@shao2-debian>
In-Reply-To: <20200617092252.GA5279@shao2-debian>

--2qBU6WNIBNCzjfYIfwMXXOOvFznc7Tgbk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.06.20 um 11:22 schrieb Rong Chen:
> On Wed, Jun 17, 2020 at 08:28:02AM +0200, Thomas Zimmermann wrote:
>> Hi Emil
>>
>> Am 16.06.20 um 17:14 schrieb Emil Velikov:
>>> Hi Thomas,
>>>
>>> On Tue, 16 Jun 2020 at 15:26, Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>>>
>>>> The original modesetting code set MISC to 0x2d, which is <hpgoddev>,=

>>>> <clksel> and <ioaddsel>
>>>>
>>>> With the conversion to atomic modesetting, <rammapen> accidentally
>>>> got enabled as well. Revert this change and initialize MISC with a
>>>> constant value of <hgoddev> and <ioaddsel>. The <clksel> bits are se=
t
>>>> in mga_crtc_set_plls(), sync flags are set in mgag200_set_mode_regs(=
).
>>>>
>>>
>>> Let's keep the remove (restoring original functionality) and rename
>>> (cosmetics) separate patches. The read has also disappeared, which
>>> should be safe although might be better on it's own.
>>
>> I'm waiting for Rong Chen's performance results on this patch. Moving
>> the rename into a separate patch makes sense, but removing the read is=

>> part of restoring the original behavior. I think it should be in this
>> patch. Maybe I can write a better commit message to highlight the chan=
ge.
>>
>=20
> Hi Thomas,
>=20
> I tested the patch based on previous patch series, it seems doesn't tak=
e
> effect, and commit 39fb72816c4ee brings a larger regression when
> comparing to commit caac4dda44f37:

Thanks for testing!

I still don't understand these numbers, but are you sure that
e44e907dd8f93 is really the regression?

It would make sense that 39fb72816c4ee has an impact on performance, as
it changes memory management and the way the driver updates the display.
I'll take a closer look at that patch and maybe send out an update.

Best regards
Thomas

>=20
> 4606edf870927 drm/mgag200: Don't set <rammapen> in MISC                =
                              3 3 3
> 39fb72816c4ee drm/mgag200: Replace VRAM helpers with SHMEM helpers     =
                              3 22
> caac4dda44f37 drm/mgag200: Convert to simple KMS helper                =
                              238 233 240 234 239
> 4b11c90431108 drm/mgag200: Use simple-display data structures          =
                              35 34 34 34
> db22c903c9322 drm/mgag200: Remove out-commented suspend/resume helpers =
                              34 34
> 87d4880d2aeb5 drm/mgag200: Move register initialization into separate f=
unction                       35
> 0c51726f95396 drm/mgag200: Move hiprilvl setting into separate function=
s                             35
> 8078e8b182e73 drm/mgag200: Set primary plane's format in separate helpe=
r function                    35
> 19f7b409d95b7 drm/mgag200: Set pitch in a separate helper function     =
                              35 34
> 9b9a363828c60 drm/mgag200: Update mode registers after plane registers =
                              34
> e44e907dd8f93 drm/mgag200: Split MISC register update into PLL selectio=
n, SYNC and I/O               34 34 34 34
> bef2303526adb drm/mgag200: Move mode-setting code into separate helper =
function                      97 97
> 5cd8460e81e8f drm/mgag200: Clean up mga_crtc_do_set_base()             =
                              96
> 0671ca8c559ba drm/mgag200: Clean up mga_set_start_address()
> e82c8969a2474 drm/mgag200: Remove HW cursor                            =
                              96
>=20
> Best Regards,
> Rong Chen
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--2qBU6WNIBNCzjfYIfwMXXOOvFznc7Tgbk--

--7aOpJjOiKoSNpWSStPzSO67kkW7Yk7luY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7qDKAACgkQaA3BHVML
eiPr6gf9ERkfiQPzfg9+V9c4agiiKbWQdRBNVrBlrTeNAyhPk9Jb16kGTQ6xRBe7
skMFAh6WQYHAqTmUtj3s8RDbABU5UcmMDlH2m6IFLzksisbIhrBcaJg4MxDgYFh+
A6UQajCqGQXot++9njFq6719rmjR86Tfki3SLydlonq/s+eEfUB11cQmsAEfWmNe
Ua8QBgOEDNtQLTKgve+9pRlQCMAOxaZmIckTHn84TaLNIOLkdPD9AjKjdc2qpdbU
12supGSXr3zudpME/huoDUElN0BDUNpku15YG5f/QuLDMALGdvoN1p/nEhrycGHg
utaseoXT0dxIAmGeZoERUS45xyUWWw==
=SZw9
-----END PGP SIGNATURE-----

--7aOpJjOiKoSNpWSStPzSO67kkW7Yk7luY--

--===============1785341194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1785341194==--
