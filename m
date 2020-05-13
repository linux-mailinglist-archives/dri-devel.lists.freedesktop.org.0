Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E276D1D1071
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 13:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E13A6EA08;
	Wed, 13 May 2020 11:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093106EA01;
 Wed, 13 May 2020 11:03:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1DEF0ADCC;
 Wed, 13 May 2020 11:03:07 +0000 (UTC)
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Emil Velikov <emil.l.velikov@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1f7b3774-8724-7653-3481-9429ae991acc@suse.de>
 <CADnq5_OnoH3YhhEjD7eOrBPPqxQZ+S1cKWRBaUMVnA0V=E0i+Q@mail.gmail.com>
 <1706b8de-bf4a-e9e1-2163-e782d1c2cc19@suse.de>
 <CADnq5_P6sWt=0zkRm6ySmOb1zr-7VTwLwx+ecEKg-ntJTRfY5A@mail.gmail.com>
 <CACvgo53k72T+-WUHr2XEwcgMFh-JonQME-He5Pc6hfOk3pr+7A@mail.gmail.com>
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
Message-ID: <1da8dd54-c75a-2e7d-2afd-cfcdd2b66df6@suse.de>
Date: Wed, 13 May 2020 13:03:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACvgo53k72T+-WUHr2XEwcgMFh-JonQME-He5Pc6hfOk3pr+7A@mail.gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1611314793=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1611314793==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KDNDDltnV1PerouaFlPSJWSj7qhr6vNlI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KDNDDltnV1PerouaFlPSJWSj7qhr6vNlI
Content-Type: multipart/mixed; boundary="vkugGSq8rL6Hz2SQ48hqrANz0XJtmXEYR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Emil Velikov <emil.l.velikov@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Message-ID: <1da8dd54-c75a-2e7d-2afd-cfcdd2b66df6@suse.de>
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1f7b3774-8724-7653-3481-9429ae991acc@suse.de>
 <CADnq5_OnoH3YhhEjD7eOrBPPqxQZ+S1cKWRBaUMVnA0V=E0i+Q@mail.gmail.com>
 <1706b8de-bf4a-e9e1-2163-e782d1c2cc19@suse.de>
 <CADnq5_P6sWt=0zkRm6ySmOb1zr-7VTwLwx+ecEKg-ntJTRfY5A@mail.gmail.com>
 <CACvgo53k72T+-WUHr2XEwcgMFh-JonQME-He5Pc6hfOk3pr+7A@mail.gmail.com>
In-Reply-To: <CACvgo53k72T+-WUHr2XEwcgMFh-JonQME-He5Pc6hfOk3pr+7A@mail.gmail.com>

--vkugGSq8rL6Hz2SQ48hqrANz0XJtmXEYR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.05.20 um 11:27 schrieb Emil Velikov:
> On Tue, 12 May 2020 at 20:48, Alex Deucher <alexdeucher@gmail.com> wrot=
e:
>=20
>>>>>
>>>>> There's some AGP support code in the DRM core. Can some of that dec=
lared
>>>>> as legacy?
>>>>>
>>>>> Specifically, what about these AGP-related ioctl calls? Can they be=

>>>>> declared as legacy? It would appear to me that KMS-based drivers do=
n't
>>>>> have to manage AGP by themselves. (?)
>>>>
>>>> The old drm core AGP code is mainly (only?) for the non-KMS drivers.=

>>>> E.g., mach64, r128, sis, savage, etc.
>>>
>>> Exactly my point. There's one drm_agp_init() call left in radeon. The=

>>> rest of the AGP code is apparently for legacy non-KMS drivers. Should=

>>> the related ioctl calls be declared as legacy (i.e., listed with
>>> DRM_LEGACY_IOCTL_DEF instead of DRM_IOCTL_DEF)? If so, much of the AG=
P
>>> core code could probably be moved behind CONFIG_DRM_LEGACY as well.
>>
>> Ah, I forgot about drm_agp_init().  I was just thinking the other AGP
>> stuff.  Yeah, I think we could make it legacy.
>>
> Fwiw I've got local patches a) removing drm_agp_init() from radeon and
> b) making the core drm code legacy only.
> Will try to finish them over the weekend and send out.
>=20
> Even if AGP GART gets dropped the b) patches will be good ;-)

Fantastic! Please see one of my other comments in this thread. There's
still drm_agp_init() somewhere in radeon_drv.c. So patch a) might still
be useful.

Best regards
Thomas

>=20
> -Emil
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vkugGSq8rL6Hz2SQ48hqrANz0XJtmXEYR--

--KDNDDltnV1PerouaFlPSJWSj7qhr6vNlI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl670+cACgkQaA3BHVML
eiMhewgAkDrFMG1fV6OKme6Y+Z9n6izMnDOJ2ZHcgErg/whAPCL/hVuDSCTEd+7B
uqvFsUS7eE05tYRTese+pLDgtFoWJChMMx5pSHgBRxJ6SppTKyQQ07hLy07J8fAL
4KmrfV3Ftyh1JveNKAX1Zy6KrntnbCctRVnO7oFD1RWycBSISSiYqevvj6TGt6Xj
WQ/pg/DWT8eZl8w7wRksO2yJbusEwnzoSJ1LR5UX27YZ4CR4YGz88GCfHJJwIuiF
WuQravnSXx8z5oOckhAQNRkHrhN4eO7GokhWn6W5Sj8rch4PuVfLN8+5ntCgTfYz
FuGxE1PmhqQqlgFsyhDNTVOPcrSh1Q==
=tXWH
-----END PGP SIGNATURE-----

--KDNDDltnV1PerouaFlPSJWSj7qhr6vNlI--

--===============1611314793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1611314793==--
