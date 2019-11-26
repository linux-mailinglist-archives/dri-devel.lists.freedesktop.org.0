Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9341E109A7F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B36C6E288;
	Tue, 26 Nov 2019 08:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1116E288
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 08:49:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE157ADE0;
 Tue, 26 Nov 2019 08:49:27 +0000 (UTC)
Subject: Re: [PATCH 0/5] drm/udl: Convert to GEM framebuffer helpers
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191114141025.32198-1-tzimmermann@suse.de>
 <20191125183954.GA17436@ravnborg.org>
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
Message-ID: <5a189d7e-fe10-c2c4-0f8c-b2a04e1497dc@suse.de>
Date: Tue, 26 Nov 2019 09:49:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191125183954.GA17436@ravnborg.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 sean@poorly.run, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============1720783360=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1720783360==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bP6q77B5RMeOl4tNJk26oKosFzUVQXJGK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bP6q77B5RMeOl4tNJk26oKosFzUVQXJGK
Content-Type: multipart/mixed; boundary="PNRWddHDP1H7oObFKgnALSfcfs4OeCe65";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org
Message-ID: <5a189d7e-fe10-c2c4-0f8c-b2a04e1497dc@suse.de>
Subject: Re: [PATCH 0/5] drm/udl: Convert to GEM framebuffer helpers
References: <20191114141025.32198-1-tzimmermann@suse.de>
 <20191125183954.GA17436@ravnborg.org>
In-Reply-To: <20191125183954.GA17436@ravnborg.org>

--PNRWddHDP1H7oObFKgnALSfcfs4OeCe65
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 25.11.19 um 19:39 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Thu, Nov 14, 2019 at 03:10:20PM +0100, Thomas Zimmermann wrote:
>> Udl uses struct udl_framebuffer for representing its framebuffer. The
>> type can be replaced by the standard DRM framebuffer structure.
>>
>> Patches 1 to 4 prepare the driver for the conversion. Patch 5 replaces=

>> the structure.
>>
>> The patchset has been tested by running the fb console, X11 and Weston=

>> on a DisplayLink adapter.
>=20
> Series looks good, with some nice cleanup to prepare for the
> removal of udl_framebuffer.
>=20
> Whole series is:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks!

>=20
>>
>> Thomas Zimmermann (5):
>>   drm/udl: Unmap buffer object after damage update
>>   drm/udl: Remove udl implementation of GEM's free_object()
>>   drm/udl: Store active framebuffer in device structure
>>   drm/udl: Call udl_handle_damage() with DRM framebuffer
>>   drm/udl: Replace struct udl_framebuffer with generic implementation
>>
>>  drivers/gpu/drm/udl/udl_drv.h     |  14 ++--
>>  drivers/gpu/drm/udl/udl_fb.c      | 131 +++++++++++------------------=
-
>>  drivers/gpu/drm/udl/udl_gem.c     |  18 +---
>>  drivers/gpu/drm/udl/udl_main.c    |   3 +
>>  drivers/gpu/drm/udl/udl_modeset.c |  31 +++----
>>  5 files changed, 70 insertions(+), 127 deletions(-)
>>
>> --
>> 2.23.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--PNRWddHDP1H7oObFKgnALSfcfs4OeCe65--

--bP6q77B5RMeOl4tNJk26oKosFzUVQXJGK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3c5xYACgkQaA3BHVML
eiOy9QgAvuT8YX8Oy30HDu64S/M4+ZX90Pua7WjnQEsj5HGq8dHQmLsuYjrX6qdr
FND0/c2QKtcKDdeAXw6/8CKduCutey7e96YmFGjMYAU6YytpnSKJeEovISZKtbqY
Z+9ba/uTsNk30e6nmmOmsuebk8st2jRGdH5Q3F/ZSZ4NmEu0mT2r6ZcwvDbqdN89
XdcB6F+yoUvBCPo0rqLVTs7bXRmHGovo9v5trYS5MGngJ088m/yVut4g+uJiFXSg
znWmiuj21s5NYRlkMTyhcbDAzp/p++0Tr2NyDs8ACy1TuL8pFWALx344gQJfO/BA
eKlwcgbUifrIT1Wuvm/xDPc4nV06Kg==
=BmRe
-----END PGP SIGNATURE-----

--bP6q77B5RMeOl4tNJk26oKosFzUVQXJGK--

--===============1720783360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1720783360==--
