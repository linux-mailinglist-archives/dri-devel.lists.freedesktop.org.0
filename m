Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08B57D8E9
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 11:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1D96E446;
	Thu,  1 Aug 2019 09:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ED66E446
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 09:59:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2F13AE9A;
 Thu,  1 Aug 2019 09:59:29 +0000 (UTC)
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Feng Tang <feng.tang@intel.com>, Rong Chen <rong.a.chen@intel.com>
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <CAKMK7uHLrt4T73PB3+H2+=Ye-8UEAWpACsctqRzAoACstK9YMw@mail.gmail.com>
 <c5be23ad-3069-ac4c-df7f-d13ab1f45813@suse.de>
 <CAKMK7uGKH7uTZ1bjUi+cyxmJEfEgmsWgqnP9iNgUNSVsDsfVPg@mail.gmail.com>
 <CAPM=9txDY7ROKkoLsc1bEaTnEZ+y5p7=EFoibcuy9uoTvsE75g@mail.gmail.com>
 <CAKMK7uEbLP7j38VhdX9qniwqLfSc0_LrcrCD1R8m4kihbxePUA@mail.gmail.com>
 <87wofyzhbm.fsf@yhuang-dev.intel.com>
 <721a5338-a6b7-4bfb-9d33-d68554451954@daenzer.net>
 <c1944c76-c07c-411b-7929-00df387c6369@intel.com>
 <20190801083721.GA3141@shbuild999.sh.intel.com>
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
Message-ID: <2eefa08e-2560-b2c1-6df0-f2e81babb41e@suse.de>
Date: Thu, 1 Aug 2019 11:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801083721.GA3141@shbuild999.sh.intel.com>
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
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, LKP <lkp@01.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Huang,
 Ying" <ying.huang@intel.com>
Content-Type: multipart/mixed; boundary="===============1709137884=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1709137884==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cC3vqNwQmmpOm4QdhApmUhSI6we748g7F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cC3vqNwQmmpOm4QdhApmUhSI6we748g7F
Content-Type: multipart/mixed; boundary="yxmnXqU7yeRInhvLOpOS9ffT3fqWvbijR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Feng Tang <feng.tang@intel.com>, Rong Chen <rong.a.chen@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Huang, Ying" <ying.huang@intel.com>, LKP <lkp@01.org>
Message-ID: <2eefa08e-2560-b2c1-6df0-f2e81babb41e@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
References: <20190729095155.GP22106@shao2-debian>
 <1c0bf22b-2c69-6b45-f700-ed832a3a5c17@suse.de>
 <CAKMK7uHLrt4T73PB3+H2+=Ye-8UEAWpACsctqRzAoACstK9YMw@mail.gmail.com>
 <c5be23ad-3069-ac4c-df7f-d13ab1f45813@suse.de>
 <CAKMK7uGKH7uTZ1bjUi+cyxmJEfEgmsWgqnP9iNgUNSVsDsfVPg@mail.gmail.com>
 <CAPM=9txDY7ROKkoLsc1bEaTnEZ+y5p7=EFoibcuy9uoTvsE75g@mail.gmail.com>
 <CAKMK7uEbLP7j38VhdX9qniwqLfSc0_LrcrCD1R8m4kihbxePUA@mail.gmail.com>
 <87wofyzhbm.fsf@yhuang-dev.intel.com>
 <721a5338-a6b7-4bfb-9d33-d68554451954@daenzer.net>
 <c1944c76-c07c-411b-7929-00df387c6369@intel.com>
 <20190801083721.GA3141@shbuild999.sh.intel.com>
In-Reply-To: <20190801083721.GA3141@shbuild999.sh.intel.com>

--yxmnXqU7yeRInhvLOpOS9ffT3fqWvbijR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.08.19 um 10:37 schrieb Feng Tang:
> On Thu, Aug 01, 2019 at 02:19:53PM +0800, Rong Chen wrote:
>>>>>>>>>>>
>>>>>>>>>>> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4 ("drm/mgag20=
0: Replace struct mga_fbdev with generic framebuffer emulation")
>>>>>>>>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next=
/linux-next.git master
>>>>>>>>>> Daniel, Noralf, we may have to revert this patch.
>>>>>>>>>>
>>>>>>>>>> I expected some change in display performance, but not in VM. =
Since it's
>>>>>>>>>> a server chipset, probably no one cares much about display per=
formance.
>>>>>>>>>> So that seemed like a good trade-off for re-using shared code.=

>>>>>>>>>>
>>>>>>>>>> Part of the patch set is that the generic fb emulation now map=
s and
>>>>>>>>>> unmaps the fbdev BO when updating the screen. I guess that's t=
he cause
>>>>>>>>>> of the performance regression. And it should be visible with o=
ther
>>>>>>>>>> drivers as well if they use a shadow FB for fbdev emulation.
>>>>>>>>> For fbcon we should need to do any maps/unamps at all, this is =
for the
>>>>>>>>> fbdev mmap support only. If the testcase mentioned here tests f=
bdev
>>>>>>>>> mmap handling it's pretty badly misnamed :-) And as long as you=
 don't
>>>>>>>>> have an fbdev mmap there shouldn't be any impact at all.
>>>>>>>> The ast and mgag200 have only a few MiB of VRAM, so we have to g=
et the
>>>>>>>> fbdev BO out if it's not being displayed. If not being mapped, i=
t can be
>>>>>>>> evicted and make room for X, etc.
>>>>>>>>
>>>>>>>> To make this work, the BO's memory is mapped and unmapped in
>>>>>>>> drm_fb_helper_dirty_work() before being updated from the shadow =
FB. [1]
>>>>>>>> That fbdev mapping is established on each screen update, more or=
 less.
>>>>>>>> From my (yet unverified) understanding, this causes the performa=
nce
>>>>>>>> regression in the VM code.
>>>>>>>>
>>>>>>>> The original code in mgag200 used to kmap the fbdev BO while it'=
s being
>>>>>>>> displayed; [2] and the drawing code only mapped it when necessar=
y (i.e.,
>>>>>>>> not being display). [3]
>>>>>>> Hm yeah, this vmap/vunmap is going to be pretty bad. We indeed sh=
ould
>>>>>>> cache this.
>>>>>>>
>>>>>>>> I think this could be added for VRAM helpers as well, but it's s=
till a
>>>>>>>> workaround and non-VRAM drivers might also run into such a perfo=
rmance
>>>>>>>> regression if they use the fbdev's shadow fb.
>>>>>>> Yeah agreed, fbdev emulation should try to cache the vmap.
>>>>>>>
>>>>>>>> Noralf mentioned that there are plans for other DRM clients besi=
des the
>>>>>>>> console. They would as well run into similar problems.
>>>>>>>>
>>>>>>>>>> The thing is that we'd need another generic fbdev emulation fo=
r ast and
>>>>>>>>>> mgag200 that handles this issue properly.
>>>>>>>>> Yeah I dont think we want to jump the gun here.  If you can try=
 to
>>>>>>>>> repro locally and profile where we're wasting cpu time I hope t=
hat
>>>>>>>>> should sched a light what's going wrong here.
>>>>>>>> I don't have much time ATM and I'm not even officially at work u=
ntil
>>>>>>>> late Aug. I'd send you the revert and investigate later. I agree=
 that
>>>>>>>> using generic fbdev emulation would be preferable.
>>>>>>> Still not sure that's the right thing to do really. Yes it's a
>>>>>>> regression, but vm testcases shouldn run a single line of fbcon o=
r drm
>>>>>>> code. So why this is impacted so heavily by a silly drm change is=
 very
>>>>>>> confusing to me. We might be papering over a deeper and much more=

>>>>>>> serious issue ...
>>>>>> It's a regression, the right thing is to revert first and then wor=
k
>>>>>> out the right thing to do.
>>>>> Sure, but I have no idea whether the testcase is doing something
>>>>> reasonable. If it's accidentally testing vm scalability of fbdev an=
d
>>>>> there's no one else doing something this pointless, then it's not a=

>>>>> real bug. Plus I think we're shooting the messenger here.
>>>>>
>>>>>> It's likely the test runs on the console and printfs stuff out whi=
le running.
>>>>> But why did we not regress the world if a few prints on the console=

>>>>> have such a huge impact? We didn't get an entire stream of mails ab=
out
>>>>> breaking stuff ...
>>>> The regression seems not related to the commit.  But we have reteste=
d
>>>> and confirmed the regression.  Hard to understand what happens.
>>> Does the regressed test cause any output on console while it's
>>> measuring? If so, it's probably accidentally measuring fbcon/DRM code=
 in
>>> addition to the workload it's trying to measure.
>>>
>>
>> Sorry, I'm not familiar with DRM, we enabled the console to output log=
s, and
>> attached please find the log file.
>>
>> "Command line: ... console=3Dtty0 earlyprintk=3DttyS0,115200
>> console=3DttyS0,115200 vga=3Dnormal rw"
>=20
> We did more check, and found this test machine does use the
> mgag200 driver.=20
>=20
> And we are suspecting the regression is caused by=20
>=20
> commit cf1ca9aeb930df074bb5bbcde55f935fec04e529
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Wed Jul 3 09:58:24 2019 +0200

Yes, that's the commit. Unfortunately reverting it would require
reverting a hand full of other patches as well.

I have a potential fix for the problem. Could you run and verify that it
resolves the problem?

Best regards
Thomas

>=20
>     drm/fb-helper: Map DRM client buffer only when required
>    =20
>     This patch changes DRM clients to not map the buffer by default. Th=
e
>     buffer, like any buffer object, should be mapped and unmapped when
>     needed.
>    =20
>     An unmapped buffer object can be evicted to system memory and does
>     not consume video ram until displayed. This allows to use generic f=
bdev
>     emulation with drivers for low-memory devices, such as ast and mgag=
200.
>    =20
>     This change affects the generic framebuffer console. HW-based conso=
les
>     map their console buffer once and keep it mapped. Userspace can mma=
p this
>     buffer into its address space. The shadow-buffered framebuffer cons=
ole
>     only needs the buffer object to be mapped during updates. While not=
 being
>     updated from the shadow buffer, the buffer object can remain unmapp=
ed.
>     Userspace will always mmap the shadow buffer.
> =20
> which may add more load when fbcon is busy printing out messages.
>=20
> We are doing more test inside 0day to confirm.
>=20
> Thanks,
> Feng
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--yxmnXqU7yeRInhvLOpOS9ffT3fqWvbijR--

--cC3vqNwQmmpOm4QdhApmUhSI6we748g7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1CuAEACgkQaA3BHVML
eiOSxwf/WpCs/26Fv/25bBqaf4CUlKaSw55jSS9DS8MTEC0V9CvjEWfN9jBvWGTK
PlrfALgKUNa0e8f5XZefghnzKS7UtGCjLXMkaGXJ3inYWkKgaNotacjBqD+J09e3
TdVkUdNeg/S0+eltAT39Yxj0LhRgGcjvBr0Ppy0V10h+FuKaUn/Diieeaia65j+X
/RBaTbdRh45OhGeg9g5B13zHffpQdvDFvz+FbAlPbr7R6tvPomsfBM2v3SuSplZJ
Xln2rLKR/dGF597DF126L9bSsMpnERh87ko7DWC0p8btuFY4lCfJSoOLgkl634d+
wAgh+RfR6ZzeW3dZWaLnLQhmNRme0g==
=hSec
-----END PGP SIGNATURE-----

--cC3vqNwQmmpOm4QdhApmUhSI6we748g7F--

--===============1709137884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1709137884==--
