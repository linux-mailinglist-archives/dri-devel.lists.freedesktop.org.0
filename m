Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A31312BB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 14:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94546E2A0;
	Mon,  6 Jan 2020 13:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1CB6E2A0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 13:19:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4DF2AC81;
 Mon,  6 Jan 2020 13:19:28 +0000 (UTC)
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
To: Feng Tang <feng.tang@intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <2f524683-d9ee-77b6-1253-5645dff050a7@suse.de>
 <20190805125239.GB96155@shbuild999.sh.intel.com>
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
Message-ID: <89eedbfc-6174-e59d-921e-b92d11a52331@suse.de>
Date: Mon, 6 Jan 2020 14:19:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20190805125239.GB96155@shbuild999.sh.intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 kernel test robot <rong.a.chen@intel.com>, michel@daenzer.net,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com, lkp@01.org
Content-Type: multipart/mixed; boundary="===============0584446452=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0584446452==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="j6PkCdKp6ZGJOjHOjtdYAqbSOmhDm4c4Y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--j6PkCdKp6ZGJOjHOjtdYAqbSOmhDm4c4Y
Content-Type: multipart/mixed; boundary="nAOfoKJlnowNOIoUP0ZZwSim9RhsNhDIG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Feng Tang <feng.tang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 kernel test robot <rong.a.chen@intel.com>, michel@daenzer.net,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com, lkp@01.org
Message-ID: <89eedbfc-6174-e59d-921e-b92d11a52331@suse.de>
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <2f524683-d9ee-77b6-1253-5645dff050a7@suse.de>
 <20190805125239.GB96155@shbuild999.sh.intel.com>
In-Reply-To: <20190805125239.GB96155@shbuild999.sh.intel.com>

--nAOfoKJlnowNOIoUP0ZZwSim9RhsNhDIG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Feng,

do you still have the test setup that produced the performance penalty?

If so, could you give a try to the patchset at [1]? I think I've fixed
the remaining issues in earlier versions and I'd like to see if it
actually improves performance.

Best regards
Thomas

[1]
https://lists.freedesktop.org/archives/dri-devel/2019-December/247771.htm=
l

Am 05.08.19 um 14:52 schrieb Feng Tang:
> Hi Thomas,
>=20
> On Mon, Aug 05, 2019 at 12:22:11PM +0200, Thomas Zimmermann wrote:
>=20
> 	[snip]=20
>=20
>>>>   2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
>>>>   2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc --pref=
ault
>>>>     -O -U 815394406
>>>>   917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>>>   917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>>>   917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>>>   917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>>>
>>>> Rong, Feng, could you confirm this by disabling the cursor or blinki=
ng?
>>>
>>> Glad to know this method restored the drop. Rong is running the case.=

>>>
>>> While I have another finds, as I noticed your patch changed the bpp f=
rom
>>> 24 to 32, I had a patch to change it back to 24, and run the case in
>>> the weekend, the -18% regrssion was reduced to about -5%. Could this
>>> be related?
>>
>> In the original code, the fbdev console already ran with 32 bpp [1] an=
d
>> 16 bpp was selected for low-end devices. [2][3] The patch only set the=

>> same values for userspace; nothing changed for the console.
>=20
> I did the experiment becasue I checked the commit=20
>=20
> 90f479ae51afa4 drm/mgag200: Replace struct mga_fbdev with generic frame=
buffer emulation
>=20
> in which there is code:
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/m=
gag200/mgag200_main.c
> index b10f726..a977333 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, uns=
igned long flags)
>  	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>  		dev->mode_config.preferred_depth =3D 16;
>  	else
> -		dev->mode_config.preferred_depth =3D 24;
> +		dev->mode_config.preferred_depth =3D 32;
>  	dev->mode_config.prefer_shadow =3D 1;
> =20
> My debug patch was kind of restoring of this part.
>=20
> Thanks,
> Feng
>=20
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/=
mgag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n259
>> [2]
>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/=
mgag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n263
>> [3]
>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/=
mgag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n286
>>
>>>
>>> commit:=20
>>>   f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer cons=
ole
>>>   90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic fram=
ebuffer emulation
>>>   01e75fea0d5 mgag200: restore the depth back to 24
>>>
>>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20=
ec5=20
>>> ---------------- --------------------------- ------------------------=
---=20
>>>      43921 =C2=B1  2%     -18.3%      35884            -4.8%      418=
26        vm-scalability.median
>>>   14889337           -17.5%   12291029            -4.1%   14278574   =
     vm-scalability.throughput
>>> =20
>>> commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>>> Author: Feng Tang <feng.tang@intel.com>
>>> Date:   Fri Aug 2 15:09:19 2019 +0800
>>>
>>>     mgag200: restore the depth back to 24
>>>    =20
>>>     Signed-off-by: Feng Tang <feng.tang@intel.com>
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm=
/mgag200/mgag200_main.c
>>> index a977333..ac8f6c9 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, u=
nsigned long flags)
>>>  	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>>  		dev->mode_config.preferred_depth =3D 16;
>>>  	else
>>> -		dev->mode_config.preferred_depth =3D 32;
>>> +		dev->mode_config.preferred_depth =3D 24;>  	dev->mode_config.prefe=
r_shadow =3D 1;
>>> =20
>>>  	r =3D mgag200_modeset_init(mdev);
>>>
>>> Thanks,
>>> Feng
>>>
>>>>
>>>>
>>>> The difference between mgag200's original fbdev support and generic
>>>> fbdev emulation is generic fbdev's worker task that updates the VRAM=

>>>> buffer from the shadow buffer. mgag200 does this immediately, but re=
lies
>>>> on drm_can_sleep(), which is deprecated.
>>>>
>>>> I think that the worker task interferes with the test case, as the
>>>> worker has been in fbdev emulation since forever and no performance
>>>> regressions have been reported so far.
>>>>
>>>>
>>>> So unless there's a report where this problem happens in a real-worl=
d
>>>> use case, I'd like to keep code as it is. And apparently there's alw=
ays
>>>> the workaround of disabling the cursor blinking.
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>> HRB 21284 (AG N=C3=BCrnberg)
>>
>=20
>=20
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


--nAOfoKJlnowNOIoUP0ZZwSim9RhsNhDIG--

--j6PkCdKp6ZGJOjHOjtdYAqbSOmhDm4c4Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4TM9sACgkQaA3BHVML
eiOj7wf7B4TQzPsX/9ot46DeUzr9G+vPbK/BiYdkZSWxCYR6j7hqiSqnF3FqasIZ
6ZifNvMD6JnGLqbuj8Js1uXtxpVi7lr0f/XRZSPpYI8jB6vDoh7UX7IJLmbkFaxI
DqtS+y2ua+d4Ld1V0DPVZRFp2EtETgNj8fNaLE8Cy6enjvSIRC02JBK2p0UmgnjD
ASBD/OPB7MqSmlqSM/Re9ysuOdMqcOLZ0+4lPF+8gs61FAhO8NYH4pgGu9A7pxKL
tQoPHO1YPYywtlleX+nxDjq9IHEaL/s7d0gxbIYviyB3abZI91ZuOfnk8hzU7Q1v
op3T6BaRXByquMmzwv8arvlOFzuLGQ==
=0huc
-----END PGP SIGNATURE-----

--j6PkCdKp6ZGJOjHOjtdYAqbSOmhDm4c4Y--

--===============0584446452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0584446452==--
