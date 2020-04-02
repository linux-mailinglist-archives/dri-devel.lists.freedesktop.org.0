Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB8019BCFD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FC26E9FF;
	Thu,  2 Apr 2020 07:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EA789E41;
 Thu,  2 Apr 2020 07:46:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB164AEE1;
 Thu,  2 Apr 2020 07:46:42 +0000 (UTC)
Subject: Re: lima, panfrost: multiple definition of
 `of_devfreq_cooling_register_power'
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <83618b63-b852-9e6d-b460-001fd7900b37@suse.de>
 <CAFBinCBr8C9oinGJEJJwUDTsNaOWuajxiVVqgMMJjnNCMY8TmA@mail.gmail.com>
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
Message-ID: <f66ac1d8-6ba2-44c3-9faf-d02d1dca997d@suse.de>
Date: Thu, 2 Apr 2020 09:46:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBr8C9oinGJEJJwUDTsNaOWuajxiVVqgMMJjnNCMY8TmA@mail.gmail.com>
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
Cc: tomeu.vizoso@collabora.com, lima@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, yuq825@gmail.com
Content-Type: multipart/mixed; boundary="===============0997952672=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0997952672==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SEuOsRFs0hAs7ToMA9YTPWi4HoyI18XBS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SEuOsRFs0hAs7ToMA9YTPWi4HoyI18XBS
Content-Type: multipart/mixed; boundary="SA11pxTR4Ty86fB09Vl8qAqlESW19jvtg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: yuq825@gmail.com, lima@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <f66ac1d8-6ba2-44c3-9faf-d02d1dca997d@suse.de>
Subject: Re: lima, panfrost: multiple definition of
 `of_devfreq_cooling_register_power'
References: <83618b63-b852-9e6d-b460-001fd7900b37@suse.de>
 <CAFBinCBr8C9oinGJEJJwUDTsNaOWuajxiVVqgMMJjnNCMY8TmA@mail.gmail.com>
In-Reply-To: <CAFBinCBr8C9oinGJEJJwUDTsNaOWuajxiVVqgMMJjnNCMY8TmA@mail.gmail.com>

--SA11pxTR4Ty86fB09Vl8qAqlESW19jvtg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Martin

Am 02.04.20 um 09:39 schrieb Martin Blumenstingl:
> Hi Thomas,
>=20
> On Thu, Apr 2, 2020 at 9:26 AM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Hi,
>>
>> building lima and panfrost drivers from drm-tip, I currently get the
>> following linker error
>>
>>   > make clean
>>   > make
>>   [...]
>>   LD      vmlinux.o
>>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/panfrost
>>         /panfrost_devfreq.o: in function
>>         `of_devfreq_cooling_register_power':
>>   panfrost_devfreq.c:(.text+0x18c): multiple definition of
>>         `of_devfreq_cooling_register_power'; drivers/gpu/drm/lima
>>         /lima_devfreq.o:lima_devfreq.c:(.text+0x1a0): first defined he=
re
>>   make[1]: *** [/home/tzimmermann/Projekte/linux/Makefile:1078: vmlinu=
x]
>>         Error 1
>>   make[1]: Leaving directory '/home/tzimmermann/Projekte/linux/build-
>>         arm'
>>   make: *** [Makefile:180: sub-make] Error 2
> can you please try building again with the attached patch?

Yes, fixes the bug. Thanks for responding quickly.

>=20
>> Seems related to
>>
>>   commit 1996970773a323533e1cc1b6b97f00a95d675f32
>>   Author: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>   Date:   Thu Mar 19 21:34:27 2020 +0100
>>
>>     drm/lima: Add optional devfreq and cooling device support
>>
>> https://cgit.freedesktop.org/drm/drm-tip/commit/?id=3D1996970773a32353=
3e1cc1b6b97f00a95d675f32
> it's also possible that this was originally caused by a76caf55e5b356
> ("thermal: Add devfreq cooling") and that my commit only exposes this
> bug

True. This must have been an oversight in the original patch, as the
other placeholder functions have their static inline declared already.

Best regards
Thomas

>=20
>=20
> Thank you in advance!
> Regards
> Martin
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--SA11pxTR4Ty86fB09Vl8qAqlESW19jvtg--

--SEuOsRFs0hAs7ToMA9YTPWi4HoyI18XBS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6FmF4ACgkQaA3BHVML
eiOZQwf/WoMQVcomDtZdB+Um5A7FmI5UHazld88fi9rentuPaG/DZlZ8IDj0yJGk
168EtwsY55/PPZRl4jKHfz3nU9zGjidA5URU8LqWtAsM+/8EWgkbDphqdgl4vEUt
/TrONJg6FF8RMABmR79hi7I1RoDIGTYXEPgwQA2f580LmMnEBjiKAHLUBEUrGDtm
Gkti8tC+b+6xxeUYMgt/3gv2YzqALXKleF5RSNS5fjP8vPoCmrpJj5W82tpmrvSG
54XPhxqqGBhhQ/pcvgG8eilP4jcyiDQXq51FcE2wg89O4Z6ub9rl45IwdWja997c
jjs7k7a9zEdRLsCq6VxSkgzdIbJMhg==
=uyhm
-----END PGP SIGNATURE-----

--SEuOsRFs0hAs7ToMA9YTPWi4HoyI18XBS--

--===============0997952672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0997952672==--
