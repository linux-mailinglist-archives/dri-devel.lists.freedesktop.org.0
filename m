Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2D51CFE05
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 21:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD056E1EE;
	Tue, 12 May 2020 19:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2876E1EE;
 Tue, 12 May 2020 19:10:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21EB8AC4A;
 Tue, 12 May 2020 19:10:40 +0000 (UTC)
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Alex Deucher <alexdeucher@gmail.com>
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1f7b3774-8724-7653-3481-9429ae991acc@suse.de>
 <CADnq5_OnoH3YhhEjD7eOrBPPqxQZ+S1cKWRBaUMVnA0V=E0i+Q@mail.gmail.com>
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
Message-ID: <1706b8de-bf4a-e9e1-2163-e782d1c2cc19@suse.de>
Date: Tue, 12 May 2020 21:10:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_OnoH3YhhEjD7eOrBPPqxQZ+S1cKWRBaUMVnA0V=E0i+Q@mail.gmail.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0958269223=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0958269223==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Vmmmv1n9OLJKVsFf1F1O9GzQ6b413Fnph"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Vmmmv1n9OLJKVsFf1F1O9GzQ6b413Fnph
Content-Type: multipart/mixed; boundary="PQzEX6CqGcJoIxw1Y5dt8OA6spM7RpE55";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Message-ID: <1706b8de-bf4a-e9e1-2163-e782d1c2cc19@suse.de>
Subject: Re: [Nouveau] [RFC] Remove AGP support from Radeon/Nouveau/TTM
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <1f7b3774-8724-7653-3481-9429ae991acc@suse.de>
 <CADnq5_OnoH3YhhEjD7eOrBPPqxQZ+S1cKWRBaUMVnA0V=E0i+Q@mail.gmail.com>
In-Reply-To: <CADnq5_OnoH3YhhEjD7eOrBPPqxQZ+S1cKWRBaUMVnA0V=E0i+Q@mail.gmail.com>

--PQzEX6CqGcJoIxw1Y5dt8OA6spM7RpE55
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Alex

Am 12.05.20 um 20:32 schrieb Alex Deucher:
> On Tue, May 12, 2020 at 2:29 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
>>
>> Hi
>>
>> Am 11.05.20 um 19:17 schrieb Christian K=C3=B6nig:
>>> Hi guys,
>>>
>>> Well let's face it AGP is a total headache to maintain and dead for a=
t least 10+ years.
>>>
>>> We have a lot of x86 specific stuff in the architecture independent g=
raphics memory management to get the caching right, abusing the DMA API o=
n multiple occasions, need to distinct between AGP and driver specific pa=
ge tables etc etc...
>>>
>>> So the idea here is to just go ahead and remove the support from Rade=
on and Nouveau and then drop the necessary code from TTM.
>>>
>>> For Radeon this means that we just switch over to the driver specific=
 page tables and everything should more or less continue to work.
>>>
>>> For Nouveau I'm not 100% sure, but from the code it of hand looks lik=
e we can do it similar to Radeon.
>>>
>>> Please comment what you think about this.
>>
>> There's some AGP support code in the DRM core. Can some of that declar=
ed
>> as legacy?
>>
>> Specifically, what about these AGP-related ioctl calls? Can they be
>> declared as legacy? It would appear to me that KMS-based drivers don't=

>> have to manage AGP by themselves. (?)
>=20
> The old drm core AGP code is mainly (only?) for the non-KMS drivers.
> E.g., mach64, r128, sis, savage, etc.

Exactly my point. There's one drm_agp_init() call left in radeon. The
rest of the AGP code is apparently for legacy non-KMS drivers. Should
the related ioctl calls be declared as legacy (i.e., listed with
DRM_LEGACY_IOCTL_DEF instead of DRM_IOCTL_DEF)? If so, much of the AGP
core code could probably be moved behind CONFIG_DRM_LEGACY as well.

Best regards
Thomas

>=20
> Alex
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--PQzEX6CqGcJoIxw1Y5dt8OA6spM7RpE55--

--Vmmmv1n9OLJKVsFf1F1O9GzQ6b413Fnph
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl669KkACgkQaA3BHVML
eiMySggAwTliMh1nnsIQnm4GXtUXKTQb49mfHeGpaXDg/qoU7bzcohlwa/xoFXc/
lYVjt6Q9rl/1cr8bnE0hv5ZSI+abQbXqVfMIcxX4eVq+5TB3nMVDGULR+dZwXwh9
CPGMDNvPNgS8kjCq77G8s1pm1QQvbMa+GxQNBMxhe3lL0fcXSvgdUfXKnAs2mXnV
MWzM92vov0JU2VHaBhCLrBk2Gqi5fy9dEDbRDXLjyqXHxdohEF4adQz42KAjGt3h
jpeeQPIs+1IsN/NUtsBey5cGbCfGhFW+ucd/nPsIPZW9qzoTIQA49YQ7eM7qYUio
81gjdvToEeM+D2kmmrbnH03aOdx/Jw==
=1KwA
-----END PGP SIGNATURE-----

--Vmmmv1n9OLJKVsFf1F1O9GzQ6b413Fnph--

--===============0958269223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0958269223==--
