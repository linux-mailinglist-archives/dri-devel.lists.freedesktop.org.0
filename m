Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDCD133AC4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 06:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA07D6E156;
	Wed,  8 Jan 2020 05:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984D46E156
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 05:20:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9168B118;
 Wed,  8 Jan 2020 05:20:52 +0000 (UTC)
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
To: Rong Chen <rong.a.chen@intel.com>, Feng Tang <feng.tang@intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <2f524683-d9ee-77b6-1253-5645dff050a7@suse.de>
 <20190805125239.GB96155@shbuild999.sh.intel.com>
 <89eedbfc-6174-e59d-921e-b92d11a52331@suse.de>
 <654bacf5-0567-0552-5cdb-c155d96d92bf@intel.com>
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
Message-ID: <fc55325c-a7bf-a431-fdd8-0fc2af91476f@suse.de>
Date: Wed, 8 Jan 2020 06:20:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <654bacf5-0567-0552-5cdb-c155d96d92bf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, michel@daenzer.net, lkp@01.org,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com
Content-Type: multipart/mixed; boundary="===============1066691322=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1066691322==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4EKelUYPqVNFq76sSaMyEmgK65ckOiMfs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4EKelUYPqVNFq76sSaMyEmgK65ckOiMfs
Content-Type: multipart/mixed; boundary="UYWBDkO2Xfm87dA1bmuufDTNcQK8LUzfv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rong Chen <rong.a.chen@intel.com>, Feng Tang <feng.tang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, michel@daenzer.net,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com, lkp@01.org
Message-ID: <fc55325c-a7bf-a431-fdd8-0fc2af91476f@suse.de>
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <2f524683-d9ee-77b6-1253-5645dff050a7@suse.de>
 <20190805125239.GB96155@shbuild999.sh.intel.com>
 <89eedbfc-6174-e59d-921e-b92d11a52331@suse.de>
 <654bacf5-0567-0552-5cdb-c155d96d92bf@intel.com>
In-Reply-To: <654bacf5-0567-0552-5cdb-c155d96d92bf@intel.com>

--UYWBDkO2Xfm87dA1bmuufDTNcQK8LUzfv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.01.20 um 03:25 schrieb Rong Chen:
> Hi Thomas,
>=20
> The previous throughput was reduced from 43955 to 35691, and there is a=
 little increase in next-20200106,
> but there is no obvious change after the patchset:

OK, I would have hoped for some improvements. Anyway, thanks for testing.=


Best regards
Thomas

> =C2=A0
> commit:=20
>   f1f8555dfb ("drm/bochs: Use shadow buffer for bochs framebuffer conso=
le")
>   90f479ae51 ("drm/mgag200: Replace struct mga_fbdev with generic frame=
buffer emulation")
>=20
> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9=20
> ---------------- ---------------------------=20
>          %stddev     %change         %stddev
>              \          |                \ =20
>      43955 =C2=B1  2%     -18.8%      35691        vm-scalability.media=
n
>=20
> commit:=20
>=20
>   9eb1b48ca4 ("Add linux-next specific files for 20200106")
>   5f20199bac ("drm/fb-helper: Synchronize dirty worker with vblank")
>=20
>  next-20200106  5f20199bac9b2de71fd2158b90
> ----------------  --------------------------
>          %stddev      change         %stddev
>              \          |                \ =20
>      38550                       38744      =20
>      38549                       38744        vm-scalability.median
>=20
>=20
> Best Regards,
> Rong Chen
>=20
> On 1/6/20 9:19 PM, Thomas Zimmermann wrote:
>> Hi Feng,
>>
>> do you still have the test setup that produced the performance penalty=
?
>>
>> If so, could you give a try to the patchset at [1]? I think I've fixed=

>> the remaining issues in earlier versions and I'd like to see if it
>> actually improves performance.
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://lists.freedesktop.org/archives/dri-devel/2019-December/247771.=
html
>>
>> Am 05.08.19 um 14:52 schrieb Feng Tang:
>>> Hi Thomas,
>>>
>>> On Mon, Aug 05, 2019 at 12:22:11PM +0200, Thomas Zimmermann wrote:
>>>
>>> 	[snip]=20
>>>
>>>>>>   2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
>>>>>>   2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc --pr=
efault
>>>>>>     -O -U 815394406
>>>>>>   917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>>>>>   917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>>>>>   917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>>>>>   917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>>>>>
>>>>>> Rong, Feng, could you confirm this by disabling the cursor or blin=
king?
>>>>> Glad to know this method restored the drop. Rong is running the cas=
e.
>>>>>
>>>>> While I have another finds, as I noticed your patch changed the bpp=
 from
>>>>> 24 to 32, I had a patch to change it back to 24, and run the case i=
n
>>>>> the weekend, the -18% regrssion was reduced to about -5%. Could thi=
s
>>>>> be related?
>>>> In the original code, the fbdev console already ran with 32 bpp [1] =
and
>>>> 16 bpp was selected for low-end devices. [2][3] The patch only set t=
he
>>>> same values for userspace; nothing changed for the console.
>>> I did the experiment becasue I checked the commit=20
>>>
>>> 90f479ae51afa4 drm/mgag200: Replace struct mga_fbdev with generic fra=
mebuffer emulation
>>>
>>> in which there is code:
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm=
/mgag200/mgag200_main.c
>>> index b10f726..a977333 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, u=
nsigned long flags)
>>>  	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>>  		dev->mode_config.preferred_depth =3D 16;
>>>  	else
>>> -		dev->mode_config.preferred_depth =3D 24;
>>> +		dev->mode_config.preferred_depth =3D 32;
>>>  	dev->mode_config.prefer_shadow =3D 1;
>>> =20
>>> My debug patch was kind of restoring of this part.
>>>
>>> Thanks,
>>> Feng
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>> [1]
>>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag20=
0/mgag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n259
>>>> [2]
>>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag20=
0/mgag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n263
>>>> [3]
>>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag20=
0/mgag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n286
>>>>
>>>>> commit:=20
>>>>>   f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer co=
nsole
>>>>>   90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic fr=
amebuffer emulation
>>>>>   01e75fea0d5 mgag200: restore the depth back to 24
>>>>>
>>>>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c=
20ec5=20
>>>>> ---------------- --------------------------- ----------------------=
-----=20
>>>>>      43921 =C2=B1  2%     -18.3%      35884            -4.8%      4=
1826        vm-scalability.median
>>>>>   14889337           -17.5%   12291029            -4.1%   14278574 =
       vm-scalability.throughput
>>>>> =20
>>>>> commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>>>>> Author: Feng Tang <feng.tang@intel.com>
>>>>> Date:   Fri Aug 2 15:09:19 2019 +0800
>>>>>
>>>>>     mgag200: restore the depth back to 24
>>>>>    =20
>>>>>     Signed-off-by: Feng Tang <feng.tang@intel.com>
>>>>>
>>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/d=
rm/mgag200/mgag200_main.c
>>>>> index a977333..ac8f6c9 100644
>>>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev,=
 unsigned long flags)
>>>>>  	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>>>>  		dev->mode_config.preferred_depth =3D 16;
>>>>>  	else
>>>>> -		dev->mode_config.preferred_depth =3D 32;
>>>>> +		dev->mode_config.preferred_depth =3D 24;>  	dev->mode_config.pre=
fer_shadow =3D 1;
>>>>> =20
>>>>>  	r =3D mgag200_modeset_init(mdev);
>>>>>
>>>>> Thanks,
>>>>> Feng
>>>>>
>>>>>> The difference between mgag200's original fbdev support and generi=
c
>>>>>> fbdev emulation is generic fbdev's worker task that updates the VR=
AM
>>>>>> buffer from the shadow buffer. mgag200 does this immediately, but =
relies
>>>>>> on drm_can_sleep(), which is deprecated.
>>>>>>
>>>>>> I think that the worker task interferes with the test case, as the=

>>>>>> worker has been in fbdev emulation since forever and no performanc=
e
>>>>>> regressions have been reported so far.
>>>>>>
>>>>>>
>>>>>> So unless there's a report where this problem happens in a real-wo=
rld
>>>>>> use case, I'd like to keep code as it is. And apparently there's a=
lways
>>>>>> the workaround of disabling the cursor blinking.
>>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>> --=20
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>>>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>>>> HRB 21284 (AG N=C3=BCrnberg)
>>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--UYWBDkO2Xfm87dA1bmuufDTNcQK8LUzfv--

--4EKelUYPqVNFq76sSaMyEmgK65ckOiMfs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4VZrMACgkQaA3BHVML
eiMGzAgAkgPrHQk/na1JTgBC7UnJLtpsTza1TmqhQd00qvffFxPlgZxpgd7NBjhA
SMIUunCA5Dzgx+0seu1NVR7g9+00icf35nXpwsWC24gAKLyG4CeJHso4Xm9bMYJa
2d/jmocchIHjSCDBUY3yxnJfHqnh/CIeaWQm/fGkjNVcEtumBwo3hZPDZlNYHwfn
VGANKfHmj6wQ6NgUOr+0DkD4dR7yL6UOfBRwLhRci0Ek2Blo6D0iq4A6RJa9JZsT
e3iRet957iqtXeKsJ8T16HrFHSyM9EdoU9vvsBCFFctg3Xmc7t7uj2EOYAUn1sQT
Oi2vzpygJiZxrd3PA6jfOkKRw+ll+A==
=IFS5
-----END PGP SIGNATURE-----

--4EKelUYPqVNFq76sSaMyEmgK65ckOiMfs--

--===============1066691322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1066691322==--
