Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD27816ED
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BA16E3E3;
	Mon,  5 Aug 2019 10:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB0D6E3E3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:22:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3BAA3B63C;
 Mon,  5 Aug 2019 10:22:17 +0000 (UTC)
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
To: Feng Tang <feng.tang@intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
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
Message-ID: <2f524683-d9ee-77b6-1253-5645dff050a7@suse.de>
Date: Mon, 5 Aug 2019 12:22:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805070200.GA91650@shbuild999.sh.intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 kernel test robot <rong.a.chen@intel.com>, michel@daenzer.net,
 dri-devel <dri-devel@lists.freedesktop.org>, ying.huang@intel.com, lkp@01.org
Content-Type: multipart/mixed; boundary="===============0267606950=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0267606950==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iBg4RfjfUzFkCzxLDy9O4qSwqsWoKZ2cd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iBg4RfjfUzFkCzxLDy9O4qSwqsWoKZ2cd
Content-Type: multipart/mixed; boundary="2gB57OQa39IAa7UkcmObiOgGQtmwuHxEa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Feng Tang <feng.tang@intel.com>
Cc: kernel test robot <rong.a.chen@intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 lkp@01.org, ying.huang@intel.com, michel@daenzer.net
Message-ID: <2f524683-d9ee-77b6-1253-5645dff050a7@suse.de>
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <14fdaaed-51c8-b270-b46b-cba7b5c4ba52@suse.de>
 <20190805070200.GA91650@shbuild999.sh.intel.com>
In-Reply-To: <20190805070200.GA91650@shbuild999.sh.intel.com>

--2gB57OQa39IAa7UkcmObiOgGQtmwuHxEa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.08.19 um 09:02 schrieb Feng Tang:
> Hi Thomas,
>=20
> On Sun, Aug 04, 2019 at 08:39:19PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> I did some further analysis on this problem and found that the blinkin=
g
>> cursor affects performance of the vm-scalability test case.
>>
>> I only have a 4-core machine, so scalability is not really testable. Y=
et
>> I see the effects of running vm-scalibility against drm-tip, a revert =
of
>> the mgag200 patch and the vmap fixes that I posted a few days ago.
>>
>> After reverting the mgag200 patch, running the test as described in th=
e
>> report
>>
>>   bin/lkp run job.yaml
>>
>> gives results like
>>
>>   2019-08-02 19:34:37  ./case-anon-cow-seq-hugetlb
>>   2019-08-02 19:34:37  ./usemem --runtime 300 -n 4 --prealloc --prefau=
lt
>>     -O -U 815395225
>>   917319627 bytes / 756534 usecs =3D 1184110 KB/s
>>   917319627 bytes / 764675 usecs =3D 1171504 KB/s
>>   917319627 bytes / 766414 usecs =3D 1168846 KB/s
>>   917319627 bytes / 777990 usecs =3D 1151454 KB/s
>>
>> Running the test against current drm-tip gives slightly worse results,=

>> such as.
>>
>>   2019-08-03 19:17:06  ./case-anon-cow-seq-hugetlb
>>   2019-08-03 19:17:06  ./usemem --runtime 300 -n 4 --prealloc --prefau=
lt
>>     -O -U 815394406
>>   917318700 bytes / 871607 usecs =3D 1027778 KB/s
>>   917318700 bytes / 894173 usecs =3D 1001840 KB/s
>>   917318700 bytes / 919694 usecs =3D 974040 KB/s
>>   917318700 bytes / 923341 usecs =3D 970193 KB/s
>>
>> The test puts out roughly one result per second. Strangely sending the=

>> output to /dev/null can make results significantly worse.
>>
>>   bin/lkp run job.yaml > /dev/null
>>
>>   2019-08-03 19:23:04  ./case-anon-cow-seq-hugetlb
>>   2019-08-03 19:23:04  ./usemem --runtime 300 -n 4 --prealloc --prefau=
lt
>>     -O -U 815394406
>>   917318700 bytes / 1207358 usecs =3D 741966 KB/s
>>   917318700 bytes / 1210456 usecs =3D 740067 KB/s
>>   917318700 bytes / 1216572 usecs =3D 736346 KB/s
>>   917318700 bytes / 1239152 usecs =3D 722929 KB/s
>>
>> I realized that there's still a blinking cursor on the screen, which I=

>> disabled with
>>
>>   tput civis
>>
>> or alternatively
>>
>>   echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink
>>
>> Running the the test now gives the original or even better results, su=
ch as
>>
>>   bin/lkp run job.yaml > /dev/null
>>
>>   2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
>>   2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc --prefau=
lt
>>     -O -U 815394406
>>   917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>   917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>   917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>   917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>
>> Rong, Feng, could you confirm this by disabling the cursor or blinking=
?
>=20
> Glad to know this method restored the drop. Rong is running the case.
>=20
> While I have another finds, as I noticed your patch changed the bpp fro=
m
> 24 to 32, I had a patch to change it back to 24, and run the case in
> the weekend, the -18% regrssion was reduced to about -5%. Could this
> be related?

In the original code, the fbdev console already ran with 32 bpp [1] and
16 bpp was selected for low-end devices. [2][3] The patch only set the
same values for userspace; nothing changed for the console.

Best regards
Thomas

[1]
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mga=
g200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n259
[2]
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mga=
g200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n263
[3]
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mga=
g200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n286

>=20
> commit:=20
>   f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer consol=
e
>   90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic frameb=
uffer emulation
>   01e75fea0d5 mgag200: restore the depth back to 24
>=20
> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20ec=
5=20
> ---------------- --------------------------- --------------------------=
-=20
>      43921 =C2=B1  2%     -18.3%      35884            -4.8%      41826=
        vm-scalability.median
>   14889337           -17.5%   12291029            -4.1%   14278574     =
   vm-scalability.throughput
> =20
> commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
> Author: Feng Tang <feng.tang@intel.com>
> Date:   Fri Aug 2 15:09:19 2019 +0800
>=20
>     mgag200: restore the depth back to 24
>    =20
>     Signed-off-by: Feng Tang <feng.tang@intel.com>
>=20
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/m=
gag200/mgag200_main.c
> index a977333..ac8f6c9 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, uns=
igned long flags)
>  	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>  		dev->mode_config.preferred_depth =3D 16;
>  	else
> -		dev->mode_config.preferred_depth =3D 32;
> +		dev->mode_config.preferred_depth =3D 24;>  	dev->mode_config.prefer_=
shadow =3D 1;
> =20
>  	r =3D mgag200_modeset_init(mdev);
>=20
> Thanks,
> Feng
>=20
>>
>>
>> The difference between mgag200's original fbdev support and generic
>> fbdev emulation is generic fbdev's worker task that updates the VRAM
>> buffer from the shadow buffer. mgag200 does this immediately, but reli=
es
>> on drm_can_sleep(), which is deprecated.
>>
>> I think that the worker task interferes with the test case, as the
>> worker has been in fbdev emulation since forever and no performance
>> regressions have been reported so far.
>>
>>
>> So unless there's a report where this problem happens in a real-world
>> use case, I'd like to keep code as it is. And apparently there's alway=
s
>> the workaround of disabling the cursor blinking.
>>
>> Best regards
>> Thomas
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--2gB57OQa39IAa7UkcmObiOgGQtmwuHxEa--

--iBg4RfjfUzFkCzxLDy9O4qSwqsWoKZ2cd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1IA1cACgkQaA3BHVML
eiOfoAf+Jh3D/y95NoEYAos8JHH9kubVSv2FgNhjwyu1txAWj9vu/w8VUVQWj38s
7FotfMudUuYKpokMwlh9BsP1hwNU1F4JIg5LFS9QXDxIUE0BCmqqgAMkEKu2aL3S
ztHQg1kwllF+gAYkyr0ok++cEXjRk+bx2NyVMEKf5muv+nc8iPRxc3PYZcp/FbE2
0RZrLu9aOYrrxZ2sgQuF3ZMIZ8+ne/IznzoZmfBnip6xTTPykfAwOYRure+6CH+o
1v9iU/ZWw+jhGhvWx9sFLwhrS6YulCkzHQY0sTM0C7yp8v7Jl22z8WlDiQmhnvlS
DT4p9KByIHVph63Biq7zvvCOBHq52w==
=P8q2
-----END PGP SIGNATURE-----

--iBg4RfjfUzFkCzxLDy9O4qSwqsWoKZ2cd--

--===============0267606950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0267606950==--
