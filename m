Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F3D10FC7A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 12:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840F76E450;
	Tue,  3 Dec 2019 11:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0BA6E450
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 11:27:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3FDEB1E1;
 Tue,  3 Dec 2019 11:27:42 +0000 (UTC)
Subject: Re: [PATCH 02/12] drm/pci: Hide legacy PCI functions from non-legacy
 code
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20191203100406.9674-1-tzimmermann@suse.de>
 <20191203100406.9674-3-tzimmermann@suse.de>
 <CACvgo50oHVLgjcv=ipQq=ZuWv2=mu20VHkVRx3x6+zhp5H9YYQ@mail.gmail.com>
 <CACvgo52UvEBSYTg3nTjrHvTg2kZ_Rd9LLLtNwrLbvcJ3k9yFGA@mail.gmail.com>
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
Message-ID: <308d45f4-5f35-4376-3d43-5a4dc0d419ae@suse.de>
Date: Tue, 3 Dec 2019 12:27:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CACvgo52UvEBSYTg3nTjrHvTg2kZ_Rd9LLLtNwrLbvcJ3k9yFGA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============1085966901=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1085966901==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3CtYad2vjU34yRaH7xXxRUploCyl3NVaW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3CtYad2vjU34yRaH7xXxRUploCyl3NVaW
Content-Type: multipart/mixed; boundary="SPQAPrGJB24pN9PlxkvqOmzPrcWQLMsVx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Emil Velikov <emil.velikov@collabora.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <308d45f4-5f35-4376-3d43-5a4dc0d419ae@suse.de>
Subject: Re: [PATCH 02/12] drm/pci: Hide legacy PCI functions from non-legacy
 code
References: <20191203100406.9674-1-tzimmermann@suse.de>
 <20191203100406.9674-3-tzimmermann@suse.de>
 <CACvgo50oHVLgjcv=ipQq=ZuWv2=mu20VHkVRx3x6+zhp5H9YYQ@mail.gmail.com>
 <CACvgo52UvEBSYTg3nTjrHvTg2kZ_Rd9LLLtNwrLbvcJ3k9yFGA@mail.gmail.com>
In-Reply-To: <CACvgo52UvEBSYTg3nTjrHvTg2kZ_Rd9LLLtNwrLbvcJ3k9yFGA@mail.gmail.com>

--SPQAPrGJB24pN9PlxkvqOmzPrcWQLMsVx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Emil

Am 03.12.19 um 12:09 schrieb Emil Velikov:
> On Tue, 3 Dec 2019 at 11:06, Emil Velikov <emil.l.velikov@gmail.com> wr=
ote:
>>
>> Hi Thomas,
>>
>> On Tue, 3 Dec 2019 at 10:04, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>>>
>>> Declarations of drm_legacy_pci_{init,exit}() are being moved to
>>> drm_legacy.h. CONFIG_DRM_LEGACY protects the implementation.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>  drivers/gpu/drm/drm_pci.c |  4 ++++
>>>  include/drm/drm_legacy.h  | 29 ++++++++++++++++++++++++++++-
>>>  include/drm/drm_pci.h     | 15 ---------------
>>>  3 files changed, 32 insertions(+), 16 deletions(-)
>>>
>> How about we make this patch 01/12, this way we can avoid the current
>> case of - add code only to be moved in next patch.

I tried. But before patch [01/12] drm_legacy_pci_init() in drm_pci.c is
protected by CONFIG_PCI, while drm_legacy_pci_exit() isn't. So moving
patch [02/12] first, makes things even more ugly.

>>
>> As always - couple of ideas for follow-up cleanups.
>>  - drm_irq_by_busid() is legacy codebase (see the DRIVER_LEGACY check
>> at the top). How about we give it a _legacy_ name?
>>  - WE HAVE A FEW driver_features
>=20
> Pardon there, the last one should read:
> - We have a few instances that read driver_features directly, instead
> of using the drm_core_check_feature() helper.
> Might be a good idea to address those.

This specific patchset isn't about legacy, but PCI functions. But, yeah,
these things are good follow-up changes. If I need something quick and
simple to do before Christmas holidays... :)

Best regards
Thomas

>=20
> Just some nitpicks noticed while skimming through. It's not a
> requirement by any means.
>=20
> HTH
> Emil
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--SPQAPrGJB24pN9PlxkvqOmzPrcWQLMsVx--

--3CtYad2vjU34yRaH7xXxRUploCyl3NVaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3mRq0ACgkQaA3BHVML
eiN05gf9E61UlEfRNAjXkOBiknyvvIE05Ak+6kalPspE4FeFdJVlmnDhATdHHLZZ
I8Lwws4rQXya4cbsKnQ6xFwPGAtdHd8koIRV1PMJMZ/tu2ceuqVM4KYdw9ePtvYw
ASnaET1fsUqhHm7dmf9o3COwExWmJIbgS5/oJ/NXyltp6uKuoDy7EucR7rkLgD6S
+9d4x97i6KthAg5bm/Sv44CGyI8oXQJnNaxyKqQAoMu6GFDigXNWPQCCUTAC/O0j
kxDnrMV/1lNvsbfpPK2zeTus4kF3HyjL2TDh60+GOOyq+KOlC9HgEdyXtw5ImfsZ
TYmR8+wH1tDESbhqqjonMmVbm8Lg1A==
=bq1o
-----END PGP SIGNATURE-----

--3CtYad2vjU34yRaH7xXxRUploCyl3NVaW--

--===============1085966901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1085966901==--
