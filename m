Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D684816FC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6ED6E3E5;
	Mon,  5 Aug 2019 10:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C9A6E3E5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:25:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 82495B616;
 Mon,  5 Aug 2019 10:25:51 +0000 (UTC)
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
To: Rong Chen <rong.a.chen@intel.com>, Feng Tang <feng.tang@intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
Date: Mon, 5 Aug 2019 12:25:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, michel@daenzer.net,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com, lkp@01.org
Content-Type: multipart/mixed; boundary="===============0701935143=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0701935143==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JKMcfd2IIJZjeV1s12E6Wazk1jUW9ZrZc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JKMcfd2IIJZjeV1s12E6Wazk1jUW9ZrZc
Content-Type: multipart/mixed; boundary="BxlwVR89aQucPMm9Zpk7MBEXydMZwtu5y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rong Chen <rong.a.chen@intel.com>, Feng Tang <feng.tang@intel.com>
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 lkp@01.org, ying.huang@intel.com, michel@daenzer.net
Message-ID: <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
In-Reply-To: <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>

--BxlwVR89aQucPMm9Zpk7MBEXydMZwtu5y
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.08.19 um 09:28 schrieb Rong Chen:
> Hi,
>=20
> On 8/5/19 3:02 PM, Feng Tang wrote:
>> Hi Thomas,
>>
>> On Sun, Aug 04, 2019 at 08:39:19PM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> I did some further analysis on this problem and found that the blinki=
ng
>>> cursor affects performance of the vm-scalability test case.
>>>
>>> I only have a 4-core machine, so scalability is not really testable. =
Yet
>>> I see the effects of running vm-scalibility against drm-tip, a revert=
 of
>>> the mgag200 patch and the vmap fixes that I posted a few days ago.
>>>
>>> After reverting the mgag200 patch, running the test as described in t=
he
>>> report
>>>
>>> =C2=A0=C2=A0 bin/lkp run job.yaml
>>>
>>> gives results like
>>>
>>> =C2=A0=C2=A0 2019-08-02 19:34:37=C2=A0 ./case-anon-cow-seq-hugetlb
>>> =C2=A0=C2=A0 2019-08-02 19:34:37=C2=A0 ./usemem --runtime 300 -n 4 --=
prealloc
>>> --prefault
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815395225
>>> =C2=A0=C2=A0 917319627 bytes / 756534 usecs =3D 1184110 KB/s
>>> =C2=A0=C2=A0 917319627 bytes / 764675 usecs =3D 1171504 KB/s
>>> =C2=A0=C2=A0 917319627 bytes / 766414 usecs =3D 1168846 KB/s
>>> =C2=A0=C2=A0 917319627 bytes / 777990 usecs =3D 1151454 KB/s
>>>
>>> Running the test against current drm-tip gives slightly worse results=
,
>>> such as.
>>>
>>> =C2=A0=C2=A0 2019-08-03 19:17:06=C2=A0 ./case-anon-cow-seq-hugetlb
>>> =C2=A0=C2=A0 2019-08-03 19:17:06=C2=A0 ./usemem --runtime 300 -n 4 --=
prealloc
>>> --prefault
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>> =C2=A0=C2=A0 917318700 bytes / 871607 usecs =3D 1027778 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 894173 usecs =3D 1001840 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 919694 usecs =3D 974040 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 923341 usecs =3D 970193 KB/s
>>>
>>> The test puts out roughly one result per second. Strangely sending th=
e
>>> output to /dev/null can make results significantly worse.
>>>
>>> =C2=A0=C2=A0 bin/lkp run job.yaml > /dev/null
>>>
>>> =C2=A0=C2=A0 2019-08-03 19:23:04=C2=A0 ./case-anon-cow-seq-hugetlb
>>> =C2=A0=C2=A0 2019-08-03 19:23:04=C2=A0 ./usemem --runtime 300 -n 4 --=
prealloc
>>> --prefault
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>> =C2=A0=C2=A0 917318700 bytes / 1207358 usecs =3D 741966 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 1210456 usecs =3D 740067 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 1216572 usecs =3D 736346 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 1239152 usecs =3D 722929 KB/s
>>>
>>> I realized that there's still a blinking cursor on the screen, which =
I
>>> disabled with
>>>
>>> =C2=A0=C2=A0 tput civis
>>>
>>> or alternatively
>>>
>>> =C2=A0=C2=A0 echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blin=
k
>>>
>>> Running the the test now gives the original or even better results,
>>> such as
>>>
>>> =C2=A0=C2=A0 bin/lkp run job.yaml > /dev/null
>>>
>>> =C2=A0=C2=A0 2019-08-03 19:29:17=C2=A0 ./case-anon-cow-seq-hugetlb
>>> =C2=A0=C2=A0 2019-08-03 19:29:17=C2=A0 ./usemem --runtime 300 -n 4 --=
prealloc
>>> --prefault
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>> =C2=A0=C2=A0 917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>>
>>> Rong, Feng, could you confirm this by disabling the cursor or blinkin=
g?
>> Glad to know this method restored the drop. Rong is running the case.
>=20
> I set "echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink" for
> both commits,
> and the regression has no obvious change.

Ah, I see. Thank you for testing. There are two questions that come to
my mind: did you send the regular output to /dev/null? And what happens
if you disable the cursor with 'tput civis'?

If there is absolutely nothing changing on the screen, I don't see how
the regression could persist.

Best regards
Thomas


> commit:
> =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer c=
onsole
> =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation
>=20
> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde testcase/testparams/t=
estbox
> ----------------=C2=A0 -------------------------- ---------------------=
------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %s=
tddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> =C2=A0=C2=A0=C2=A0=C2=A0 43394=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34575 =C2=
=B1=C2=A0 3%
> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
> =C2=A0=C2=A0=C2=A0=C2=A0 43393=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34575=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-MEAN
> vm-scalability.median
>=20
> Best Regards,
> Rong Chen
>=20
>>
>> While I have another finds, as I noticed your patch changed the bpp fr=
om
>> 24 to 32, I had a patch to change it back to 24, and run the case in
>> the weekend, the -18% regrssion was reduced to about -5%. Could this
>> be related?
>>
>> commit:
>> =C2=A0=C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs frameb=
uffer console
>> =C2=A0=C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with ge=
neric
>> framebuffer emulation
>> =C2=A0=C2=A0 01e75fea0d5 mgag200: restore the depth back to 24
>>
>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20e=
c5
>> ---------------- --------------------------- -------------------------=
--
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43921 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=
=C2=A0 -18.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35884=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -4.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
>> 41826=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm-scalability.median
>> =C2=A0=C2=A0 14889337=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -17.5%=C2=A0=C2=A0 12291029=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -4.1%=C2=A0=C2=A0
>> 14278574=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm-scalability.thro=
ughput
>> =C2=A0 commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>> Author: Feng Tang <feng.tang@intel.com>
>> Date:=C2=A0=C2=A0 Fri Aug 2 15:09:19 2019 +0800
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 mgag200: restore the depth back to 24
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Feng =
Tang <feng.tang@intel.com>
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c
>> b/drivers/gpu/drm/mgag200/mgag200_main.c
>> index a977333..ac8f6c9 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev,
>> unsigned long flags)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_G200_SE(mdev) && mdev->mc.vram_s=
ize < (2048*1024))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_confi=
g.preferred_depth =3D 16;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.preferred=
_depth =3D 32;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.preferred=
_depth =3D 24;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.prefer_shadow =3D 1;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D mgag200_modeset_init(mdev)=
;
>>
>> Thanks,
>> Feng
>>
>>>
>>> The difference between mgag200's original fbdev support and generic
>>> fbdev emulation is generic fbdev's worker task that updates the VRAM
>>> buffer from the shadow buffer. mgag200 does this immediately, but rel=
ies
>>> on drm_can_sleep(), which is deprecated.
>>>
>>> I think that the worker task interferes with the test case, as the
>>> worker has been in fbdev emulation since forever and no performance
>>> regressions have been reported so far.
>>>
>>>
>>> So unless there's a report where this problem happens in a real-world=

>>> use case, I'd like to keep code as it is. And apparently there's alwa=
ys
>>> the workaround of disabling the cursor blinking.
>>>
>>> Best regards
>>> Thomas
>>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--BxlwVR89aQucPMm9Zpk7MBEXydMZwtu5y--

--JKMcfd2IIJZjeV1s12E6Wazk1jUW9ZrZc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1IBC4ACgkQaA3BHVML
eiNoSAf8DwnVKkbapdANBRe1VKPvzBZjlvozNcFXF2f8b7nCzxsr4I59Y7D10IoQ
JRXYq9xIS1sL6B7bgITH5mWdE87m7+ArjY25eKOpzx6SGjBrUgQOTlyKfMcBiW/S
WOCdSQbGMx8YQUxcNyRcqa8Vxct8B1807jiJSMkbncdy2BCLxI76uiFaTQXuC4WY
KQ6BZAteBwyCMji7rACzxeoU+dkUFBP9zzlAua3PYaUVzsxaBlpwN1cCWyKxVCH9
MzRER3ezp8rMMbFUUezj0uhqirMSxhQKMdNF8PE4cxDWFUR0C7Sao8uY8ZqeSPay
5hKsHplKQhnWdjmjXgyLILjn1iSchw==
=J9DX
-----END PGP SIGNATURE-----

--JKMcfd2IIJZjeV1s12E6Wazk1jUW9ZrZc--

--===============0701935143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0701935143==--
