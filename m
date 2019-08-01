Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27B7D8E4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 11:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F84D6E43F;
	Thu,  1 Aug 2019 09:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2256E43F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 09:57:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A74F9ADC4;
 Thu,  1 Aug 2019 09:57:37 +0000 (UTC)
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Rong Chen <rong.a.chen@intel.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, "Huang, Ying" <ying.huang@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
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
Message-ID: <c3253583-9441-8d95-c39b-990e73643b6c@suse.de>
Date: Thu, 1 Aug 2019 11:57:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c1944c76-c07c-411b-7929-00df387c6369@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKP <lkp@01.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0161715688=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0161715688==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GUE5qiGimKsGCaHn7nNCWi1CM3wLMU7dD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GUE5qiGimKsGCaHn7nNCWi1CM3wLMU7dD
Content-Type: multipart/mixed; boundary="7uPm1IO8zBy3Y9oLZV7rtLLfCAOcWYW0Z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rong Chen <rong.a.chen@intel.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, "Huang, Ying" <ying.huang@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKP <lkp@01.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <c3253583-9441-8d95-c39b-990e73643b6c@suse.de>
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
In-Reply-To: <c1944c76-c07c-411b-7929-00df387c6369@intel.com>

--7uPm1IO8zBy3Y9oLZV7rtLLfCAOcWYW0Z
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.08.19 um 08:19 schrieb Rong Chen:
> Hi,
>=20
> On 7/31/19 6:21 PM, Michel D=C3=A4nzer wrote:
>> On 2019-07-31 11:25 a.m., Huang, Ying wrote:
>>> Hi, Daniel,
>>>
>>> Daniel Vetter <daniel@ffwll.ch> writes:
>>>
>>>> On Tue, Jul 30, 2019 at 10:27 PM Dave Airlie <airlied@gmail.com> wro=
te:
>>>>> On Wed, 31 Jul 2019 at 05:00, Daniel Vetter <daniel@ffwll.ch> wrote=
:
>>>>>> On Tue, Jul 30, 2019 at 8:50 PM Thomas Zimmermann
>>>>>> <tzimmermann@suse.de> wrote:
>>>>>>> Hi
>>>>>>>
>>>>>>> Am 30.07.19 um 20:12 schrieb Daniel Vetter:
>>>>>>>> On Tue, Jul 30, 2019 at 7:50 PM Thomas Zimmermann
>>>>>>>> <tzimmermann@suse.de> wrote:
>>>>>>>>> Am 29.07.19 um 11:51 schrieb kernel test robot:
>>>>>>>>>> Greeting,
>>>>>>>>>>
>>>>>>>>>> FYI, we noticed a -18.8% regression of vm-scalability.median
>>>>>>>>>> due to commit:>
>>>>>>>>>>
>>>>>>>>>> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4
>>>>>>>>>> ("drm/mgag200: Replace struct mga_fbdev with generic
>>>>>>>>>> framebuffer emulation")
>>>>>>>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/=
linux-next.git
>>>>>>>>>> master
>>>>>>>>> Daniel, Noralf, we may have to revert this patch.
>>>>>>>>>
>>>>>>>>> I expected some change in display performance, but not in VM.
>>>>>>>>> Since it's
>>>>>>>>> a server chipset, probably no one cares much about display
>>>>>>>>> performance.
>>>>>>>>> So that seemed like a good trade-off for re-using shared code.
>>>>>>>>>
>>>>>>>>> Part of the patch set is that the generic fb emulation now maps=

>>>>>>>>> and
>>>>>>>>> unmaps the fbdev BO when updating the screen. I guess that's
>>>>>>>>> the cause
>>>>>>>>> of the performance regression. And it should be visible with ot=
her
>>>>>>>>> drivers as well if they use a shadow FB for fbdev emulation.
>>>>>>>> For fbcon we should need to do any maps/unamps at all, this is
>>>>>>>> for the
>>>>>>>> fbdev mmap support only. If the testcase mentioned here tests fb=
dev
>>>>>>>> mmap handling it's pretty badly misnamed :-) And as long as you
>>>>>>>> don't
>>>>>>>> have an fbdev mmap there shouldn't be any impact at all.
>>>>>>> The ast and mgag200 have only a few MiB of VRAM, so we have to
>>>>>>> get the
>>>>>>> fbdev BO out if it's not being displayed. If not being mapped, it=

>>>>>>> can be
>>>>>>> evicted and make room for X, etc.
>>>>>>>
>>>>>>> To make this work, the BO's memory is mapped and unmapped in
>>>>>>> drm_fb_helper_dirty_work() before being updated from the shadow
>>>>>>> FB. [1]
>>>>>>> That fbdev mapping is established on each screen update, more or
>>>>>>> less.
>>>>>>> =C2=A0From my (yet unverified) understanding, this causes the per=
formance
>>>>>>> regression in the VM code.
>>>>>>>
>>>>>>> The original code in mgag200 used to kmap the fbdev BO while it's=

>>>>>>> being
>>>>>>> displayed; [2] and the drawing code only mapped it when necessary=

>>>>>>> (i.e.,
>>>>>>> not being display). [3]
>>>>>> Hm yeah, this vmap/vunmap is going to be pretty bad. We indeed sho=
uld
>>>>>> cache this.
>>>>>>
>>>>>>> I think this could be added for VRAM helpers as well, but it's
>>>>>>> still a
>>>>>>> workaround and non-VRAM drivers might also run into such a
>>>>>>> performance
>>>>>>> regression if they use the fbdev's shadow fb.
>>>>>> Yeah agreed, fbdev emulation should try to cache the vmap.
>>>>>>
>>>>>>> Noralf mentioned that there are plans for other DRM clients
>>>>>>> besides the
>>>>>>> console. They would as well run into similar problems.
>>>>>>>
>>>>>>>>> The thing is that we'd need another generic fbdev emulation for=

>>>>>>>>> ast and
>>>>>>>>> mgag200 that handles this issue properly.
>>>>>>>> Yeah I dont think we want to jump the gun here.=C2=A0 If you can=
 try to
>>>>>>>> repro locally and profile where we're wasting cpu time I hope th=
at
>>>>>>>> should sched a light what's going wrong here.
>>>>>>> I don't have much time ATM and I'm not even officially at work un=
til
>>>>>>> late Aug. I'd send you the revert and investigate later. I agree
>>>>>>> that
>>>>>>> using generic fbdev emulation would be preferable.
>>>>>> Still not sure that's the right thing to do really. Yes it's a
>>>>>> regression, but vm testcases shouldn run a single line of fbcon or=

>>>>>> drm
>>>>>> code. So why this is impacted so heavily by a silly drm change is
>>>>>> very
>>>>>> confusing to me. We might be papering over a deeper and much more
>>>>>> serious issue ...
>>>>> It's a regression, the right thing is to revert first and then work=

>>>>> out the right thing to do.
>>>> Sure, but I have no idea whether the testcase is doing something
>>>> reasonable. If it's accidentally testing vm scalability of fbdev and=

>>>> there's no one else doing something this pointless, then it's not a
>>>> real bug. Plus I think we're shooting the messenger here.
>>>>
>>>>> It's likely the test runs on the console and printfs stuff out
>>>>> while running.
>>>> But why did we not regress the world if a few prints on the console
>>>> have such a huge impact? We didn't get an entire stream of mails abo=
ut
>>>> breaking stuff ...
>>> The regression seems not related to the commit.=C2=A0 But we have ret=
ested
>>> and confirmed the regression.=C2=A0 Hard to understand what happens.
>> Does the regressed test cause any output on console while it's
>> measuring? If so, it's probably accidentally measuring fbcon/DRM code =
in
>> addition to the workload it's trying to measure.
>>
>=20
> Sorry, I'm not familiar with DRM, we enabled the console to output logs=
,
> and attached please find the log file.

I have a patch set for fixing this problem. But I cannot reproduce the
issue locally, because my machine is not for testing scalability.

If I send you the patches, could you run them on the machine to test
whether they solve the problem?

Best regards
Thomas

>=20
> "Command line: ... console=3Dtty0 earlyprintk=3DttyS0,115200
> console=3DttyS0,115200 vga=3Dnormal rw"
>=20
> Best Regards,
> Rong Chen
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
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--7uPm1IO8zBy3Y9oLZV7rtLLfCAOcWYW0Z--

--GUE5qiGimKsGCaHn7nNCWi1CM3wLMU7dD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1Ct3wACgkQaA3BHVML
eiPYOAf+IJeFtAz7cx12hkNkT0voXTA9mnlt6+WtMdxwiEt9q6XjmlItgmWR5ne+
FQkBnd9DvQALyvT0xSm5EKJnK4rPKIMOBKUuY8SlOWAH4vjZV5L1VHjcByH/vvS2
Q3Mre19VhJfc1/irpShuMAdo24qQChAEuhYtJ1NOtR3pyEnCEDlSLxx14njvu37v
vAoMsUxoRaaPjG23pwNgsxeHUzMt69O0xm2AfOMrAUZfCEGlNuWNYrBoOMWf1SVo
v9AMtZFURRUQUhDm3XAPyP0xQkYE9qb26q3/pRigZW3Vev4WjeMyuN+cHIsbN4MA
E1xbvO8KlV0YGSm7T8EF1D994BEUaQ==
=4Kd9
-----END PGP SIGNATURE-----

--GUE5qiGimKsGCaHn7nNCWi1CM3wLMU7dD--

--===============0161715688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0161715688==--
