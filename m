Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF21849E2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 12:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F90893A7;
	Wed,  7 Aug 2019 10:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9283893A7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 10:42:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 39935ACB8;
 Wed,  7 Aug 2019 10:42:15 +0000 (UTC)
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: "Chen, Rong A" <rong.a.chen@intel.com>, Feng Tang <feng.tang@intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
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
Message-ID: <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
Date: Wed, 7 Aug 2019 12:42:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>, lkp@01.org
Content-Type: multipart/mixed; boundary="===============0749356008=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0749356008==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sWGH0VNK2Gx83gWhQAZj6Cwrl9L48aysI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sWGH0VNK2Gx83gWhQAZj6Cwrl9L48aysI
Content-Type: multipart/mixed; boundary="b5ja26VlgG0Gd18eV9Hr07CQ8IXsFlMV5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Chen, Rong A" <rong.a.chen@intel.com>, Feng Tang <feng.tang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, michel@daenzer.net,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>, lkp@01.org
Message-ID: <370747ca-4dc9-917b-096c-891dcc2aedf0@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
 <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
 <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
 <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
In-Reply-To: <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>

--b5ja26VlgG0Gd18eV9Hr07CQ8IXsFlMV5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Rong

Am 06.08.19 um 14:59 schrieb Chen, Rong A:
> Hi,
>=20
> On 8/5/2019 6:25 PM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 05.08.19 um 09:28 schrieb Rong Chen:
>>> Hi,
>>>
>>> On 8/5/19 3:02 PM, Feng Tang wrote:
>>>> Hi Thomas,
>>>>
>>>> On Sun, Aug 04, 2019 at 08:39:19PM +0200, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> I did some further analysis on this problem and found that the blin=
king
>>>>> cursor affects performance of the vm-scalability test case.
>>>>>
>>>>> I only have a 4-core machine, so scalability is not really testable=
=2E Yet
>>>>> I see the effects of running vm-scalibility against drm-tip, a reve=
rt of
>>>>> the mgag200 patch and the vmap fixes that I posted a few days ago.
>>>>>
>>>>> After reverting the mgag200 patch, running the test as described in=
 the
>>>>> report
>>>>>
>>>>> =C2=A0=C2=A0 bin/lkp run job.yaml
>>>>>
>>>>> gives results like
>>>>>
>>>>> =C2=A0=C2=A0 2019-08-02 19:34:37=C2=A0 ./case-anon-cow-seq-hugetlb
>>>>> =C2=A0=C2=A0 2019-08-02 19:34:37=C2=A0 ./usemem --runtime 300 -n 4 =
--prealloc
>>>>> --prefault
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815395225
>>>>> =C2=A0=C2=A0 917319627 bytes / 756534 usecs =3D 1184110 KB/s
>>>>> =C2=A0=C2=A0 917319627 bytes / 764675 usecs =3D 1171504 KB/s
>>>>> =C2=A0=C2=A0 917319627 bytes / 766414 usecs =3D 1168846 KB/s
>>>>> =C2=A0=C2=A0 917319627 bytes / 777990 usecs =3D 1151454 KB/s
>>>>>
>>>>> Running the test against current drm-tip gives slightly worse resul=
ts,
>>>>> such as.
>>>>>
>>>>> =C2=A0=C2=A0 2019-08-03 19:17:06=C2=A0 ./case-anon-cow-seq-hugetlb
>>>>> =C2=A0=C2=A0 2019-08-03 19:17:06=C2=A0 ./usemem --runtime 300 -n 4 =
--prealloc
>>>>> --prefault
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>>>> =C2=A0=C2=A0 917318700 bytes / 871607 usecs =3D 1027778 KB/s
>>>>> =C2=A0=C2=A0 917318700 bytes / 894173 usecs =3D 1001840 KB/s
>>>>> =C2=A0=C2=A0 917318700 bytes / 919694 usecs =3D 974040 KB/s
>>>>> =C2=A0=C2=A0 917318700 bytes / 923341 usecs =3D 970193 KB/s
>>>>>
>>>>> The test puts out roughly one result per second. Strangely sending =
the
>>>>> output to /dev/null can make results significantly worse.
>>>>>
>>>>> =C2=A0=C2=A0 bin/lkp run job.yaml > /dev/null
>>>>>
>>>>> =C2=A0=C2=A0 2019-08-03 19:23:04=C2=A0 ./case-anon-cow-seq-hugetlb
>>>>> =C2=A0=C2=A0 2019-08-03 19:23:04=C2=A0 ./usemem --runtime 300 -n 4 =
--prealloc
>>>>> --prefault
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>>>> =C2=A0=C2=A0 917318700 bytes / 1207358 usecs =3D 741966 KB/s
>>>>> =C2=A0=C2=A0 917318700 bytes / 1210456 usecs =3D 740067 KB/s
>>>>> =C2=A0=C2=A0 917318700 bytes / 1216572 usecs =3D 736346 KB/s
>>>>> =C2=A0=C2=A0 917318700 bytes / 1239152 usecs =3D 722929 KB/s
>>>>>
>>>>> I realized that there's still a blinking cursor on the screen, whic=
h I
>>>>> disabled with
>>>>>
>>>>> =C2=A0=C2=A0 tput civis
>>>>>
>>>>> or alternatively
>>>>>
>>>>> =C2=A0=C2=A0 echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_bl=
ink
>>>>>
>>>>> Running the the test now gives the original or even better results,=

>>>>> such as
>>>>>
>>>>> =C2=A0=C2=A0 bin/lkp run job.yaml > /dev/null
>>>>>
>>>>> =C2=A0=C2=A0 2019-08-03 19:29:17=C2=A0 ./case-anon-cow-seq-hugetlb
>>>>> =C2=A0=C2=A0 2019-08-03 19:29:17=C2=A0 ./usemem --runtime 300 -n 4 =
--prealloc
>>>>> --prefault
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>>>> =C2=A0=C2=A0 917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>>>> =C2=A0=C2=A0 917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>>>> =C2=A0=C2=A0 917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>>>> =C2=A0=C2=A0 917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>>>>
>>>>> Rong, Feng, could you confirm this by disabling the cursor or blink=
ing?
>>>> Glad to know this method restored the drop. Rong is running the case=
=2E
>>> I set "echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink" for=

>>> both commits,
>>> and the regression has no obvious change.
>> Ah, I see. Thank you for testing. There are two questions that come to=

>> my mind: did you send the regular output to /dev/null? And what happen=
s
>> if you disable the cursor with 'tput civis'?
>=20
> I didn't send the output to /dev/null because we need to collect data
> from the output,

You can send it to any file, as long as it doesn't show up on the
console. I also found the latest results in the file result/vm-scalabilit=
y.


> Actually we run the benchmark as a background process, do we need to
> disable the cursor and test again?

There's a worker thread that updates the display from the shadow buffer.
The blinking cursor periodically triggers the worker thread, but the
actual update is just the size of one character.

The point of the test without output is to see if the regression comes
from the buffer update (i.e., the memcpy from shadow buffer to VRAM), or
from the worker thread. If the regression goes away after disabling the
blinking cursor, then the worker thread is the problem. If it already
goes away if there's simply no output from the test, the screen update
is the problem. On my machine I have to disable the blinking cursor, so
I think the worker causes the performance drop.

Best regards
Thomas

>=20
> Best Regards,
> Rong Chen
>=20
>> If there is absolutely nothing changing on the screen, I don't see how=

>> the regression could persist.
>>
>> Best regards
>> Thomas
>>
>>
>>> commit:
>>> =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer=
 console
>>> =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic=

>>> framebuffer emulation
>>>
>>> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde testcase/testparams=
/testbox
>>> ----------------=C2=A0 -------------------------- -------------------=
--------
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %s=
tddev
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 43394=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3457=
5 =C2=B1=C2=A0 3%
>>> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
>>> =C2=A0=C2=A0=C2=A0=C2=A0 43393=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3457=
5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-MEAN
>>> vm-scalability.median
>>>
>>> Best Regards,
>>> Rong Chen
>>>
>>>> While I have another finds, as I noticed your patch changed the bpp =
from
>>>> 24 to 32, I had a patch to change it back to 24, and run the case in=

>>>> the weekend, the -18% regrssion was reduced to about -5%. Could this=

>>>> be related?
>>>>
>>>> commit:
>>>> =C2=A0=C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs fram=
ebuffer console
>>>> =C2=A0=C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with =
generic
>>>> framebuffer emulation
>>>> =C2=A0=C2=A0 01e75fea0d5 mgag200: restore the depth back to 24
>>>>
>>>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c2=
0ec5
>>>> ---------------- --------------------------- -----------------------=
----
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43921 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=
=C2=A0 -18.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35884=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -4.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
>>>> 41826=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm-scalability.media=
n
>>>> =C2=A0=C2=A0 14889337=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -17.5%=C2=A0=C2=A0 12291029=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -4.1%=C2=A0=C2=A0
>>>> 14278574=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm-scalability.th=
roughput
>>>> =C2=A0 commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>>>> Author: Feng Tang <feng.tang@intel.com>
>>>> Date:=C2=A0=C2=A0 Fri Aug 2 15:09:19 2019 +0800
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 mgag200: restore the depth back to 24
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Fen=
g Tang <feng.tang@intel.com>
>>>>
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> b/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> index a977333..ac8f6c9 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev,
>>>> unsigned long flags)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_G200_SE(mdev) && mdev->mc.vram=
_size < (2048*1024))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_con=
fig.preferred_depth =3D 16;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.preferr=
ed_depth =3D 32;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.preferr=
ed_depth =3D 24;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.prefer_shadow =3D 1;=

>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D mgag200_modeset_init(mde=
v);
>>>>
>>>> Thanks,
>>>> Feng
>>>>
>>>>> The difference between mgag200's original fbdev support and generic=

>>>>> fbdev emulation is generic fbdev's worker task that updates the VRA=
M
>>>>> buffer from the shadow buffer. mgag200 does this immediately, but r=
elies
>>>>> on drm_can_sleep(), which is deprecated.
>>>>>
>>>>> I think that the worker task interferes with the test case, as the
>>>>> worker has been in fbdev emulation since forever and no performance=

>>>>> regressions have been reported so far.
>>>>>
>>>>>
>>>>> So unless there's a report where this problem happens in a real-wor=
ld
>>>>> use case, I'd like to keep code as it is. And apparently there's al=
ways
>>>>> the workaround of disabling the cursor blinking.
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>
>> _______________________________________________
>> LKP mailing list
>> LKP@lists.01.org
>> https://lists.01.org/mailman/listinfo/lkp
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--b5ja26VlgG0Gd18eV9Hr07CQ8IXsFlMV5--

--sWGH0VNK2Gx83gWhQAZj6Cwrl9L48aysI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1KqwUACgkQaA3BHVML
eiMongf9EJAkIdJ27hCXIgBPwD2hgAM6d8AICSk2EzrPctAS7sd70jN7fUG1KRJU
1pTdzAEOr/7uQt0PVS+GTf0fpHDD6dQYpRRwvFz7exxrcev4AzTJL7uB/7X5J8Au
rZ3MNcR97j9iNK27VwGIYNhAllnn+mgFVgjvSOgB5TfK0xvR/VJNsFg0yZg+gPAE
fztZxwKeRwoI7hbvu0xjmKCOyyNKCQafpFCCT8KoQol7l12HCL3x8KizWiaeNy1t
hs8qrOPnMkLV34ov7O0wuktP4ENU0G1+kQJ8ffc9gnU2zq2i486iNYOvQsrvUM+g
8FXDfCshzGU9NRMZQ4VF9NVzlxvmzQ==
=Prop
-----END PGP SIGNATURE-----

--sWGH0VNK2Gx83gWhQAZj6Cwrl9L48aysI--

--===============0749356008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0749356008==--
