Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8707EF17
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51A76ED40;
	Fri,  2 Aug 2019 08:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738096ED40
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:23:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 02C37B022;
 Fri,  2 Aug 2019 08:23:27 +0000 (UTC)
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
To: Rong Chen <rong.a.chen@intel.com>, Feng Tang <feng.tang@intel.com>
References: <CAKMK7uHLrt4T73PB3+H2+=Ye-8UEAWpACsctqRzAoACstK9YMw@mail.gmail.com>
 <c5be23ad-3069-ac4c-df7f-d13ab1f45813@suse.de>
 <CAKMK7uGKH7uTZ1bjUi+cyxmJEfEgmsWgqnP9iNgUNSVsDsfVPg@mail.gmail.com>
 <CAPM=9txDY7ROKkoLsc1bEaTnEZ+y5p7=EFoibcuy9uoTvsE75g@mail.gmail.com>
 <CAKMK7uEbLP7j38VhdX9qniwqLfSc0_LrcrCD1R8m4kihbxePUA@mail.gmail.com>
 <87wofyzhbm.fsf@yhuang-dev.intel.com>
 <721a5338-a6b7-4bfb-9d33-d68554451954@daenzer.net>
 <c1944c76-c07c-411b-7929-00df387c6369@intel.com>
 <20190801083721.GA3141@shbuild999.sh.intel.com>
 <2eefa08e-2560-b2c1-6df0-f2e81babb41e@suse.de>
 <20190801112535.GA70068@shbuild999.sh.intel.com>
 <afd7d401-143c-b121-740c-9a50d34bbd29@suse.de>
 <95c677b9-bdf7-28e1-b196-9d9dcac63bb3@intel.com>
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
Message-ID: <875512c4-af43-6693-3270-b0e6ea843ec7@suse.de>
Date: Fri, 2 Aug 2019 10:23:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <95c677b9-bdf7-28e1-b196-9d9dcac63bb3@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0938846721=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0938846721==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vYbyc3cN2rBtpvY8AZOikYou7XNZNXKll"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vYbyc3cN2rBtpvY8AZOikYou7XNZNXKll
Content-Type: multipart/mixed; boundary="WIRqV19KJIK6PgRVoGtx2iFAB3HXE7P8N";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rong Chen <rong.a.chen@intel.com>, Feng Tang <feng.tang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Huang, Ying" <ying.huang@intel.com>, LKP <lkp@01.org>
Message-ID: <875512c4-af43-6693-3270-b0e6ea843ec7@suse.de>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
References: <CAKMK7uHLrt4T73PB3+H2+=Ye-8UEAWpACsctqRzAoACstK9YMw@mail.gmail.com>
 <c5be23ad-3069-ac4c-df7f-d13ab1f45813@suse.de>
 <CAKMK7uGKH7uTZ1bjUi+cyxmJEfEgmsWgqnP9iNgUNSVsDsfVPg@mail.gmail.com>
 <CAPM=9txDY7ROKkoLsc1bEaTnEZ+y5p7=EFoibcuy9uoTvsE75g@mail.gmail.com>
 <CAKMK7uEbLP7j38VhdX9qniwqLfSc0_LrcrCD1R8m4kihbxePUA@mail.gmail.com>
 <87wofyzhbm.fsf@yhuang-dev.intel.com>
 <721a5338-a6b7-4bfb-9d33-d68554451954@daenzer.net>
 <c1944c76-c07c-411b-7929-00df387c6369@intel.com>
 <20190801083721.GA3141@shbuild999.sh.intel.com>
 <2eefa08e-2560-b2c1-6df0-f2e81babb41e@suse.de>
 <20190801112535.GA70068@shbuild999.sh.intel.com>
 <afd7d401-143c-b121-740c-9a50d34bbd29@suse.de>
 <95c677b9-bdf7-28e1-b196-9d9dcac63bb3@intel.com>
In-Reply-To: <95c677b9-bdf7-28e1-b196-9d9dcac63bb3@intel.com>

--WIRqV19KJIK6PgRVoGtx2iFAB3HXE7P8N
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.08.19 um 09:11 schrieb Rong Chen:
> Hi,
>=20
> On 8/1/19 7:58 PM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 01.08.19 um 13:25 schrieb Feng Tang:
>>> Hi Thomas,
>>>
>>> On Thu, Aug 01, 2019 at 11:59:28AM +0200, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 01.08.19 um 10:37 schrieb Feng Tang:
>>>>> On Thu, Aug 01, 2019 at 02:19:53PM +0800, Rong Chen wrote:
>>>>>>>>>>>>>>> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4
>>>>>>>>>>>>>>> ("drm/mgag200: Replace struct mga_fbdev with generic
>>>>>>>>>>>>>>> framebuffer emulation")
>>>>>>>>>>>>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/=
next/linux-next.git
>>>>>>>>>>>>>>> master
>>>>>>>>>>>>>> Daniel, Noralf, we may have to revert this patch.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I expected some change in display performance, but not in
>>>>>>>>>>>>>> VM. Since it's
>>>>>>>>>>>>>> a server chipset, probably no one cares much about display=

>>>>>>>>>>>>>> performance.
>>>>>>>>>>>>>> So that seemed like a good trade-off for re-using shared
>>>>>>>>>>>>>> code.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Part of the patch set is that the generic fb emulation now=

>>>>>>>>>>>>>> maps and
>>>>>>>>>>>>>> unmaps the fbdev BO when updating the screen. I guess
>>>>>>>>>>>>>> that's the cause
>>>>>>>>>>>>>> of the performance regression. And it should be visible
>>>>>>>>>>>>>> with other
>>>>>>>>>>>>>> drivers as well if they use a shadow FB for fbdev emulatio=
n.
>>>>>>>>>>>>> For fbcon we should need to do any maps/unamps at all, this=

>>>>>>>>>>>>> is for the
>>>>>>>>>>>>> fbdev mmap support only. If the testcase mentioned here
>>>>>>>>>>>>> tests fbdev
>>>>>>>>>>>>> mmap handling it's pretty badly misnamed :-) And as long as=

>>>>>>>>>>>>> you don't
>>>>>>>>>>>>> have an fbdev mmap there shouldn't be any impact at all.
>>>>>>>>>>>> The ast and mgag200 have only a few MiB of VRAM, so we have
>>>>>>>>>>>> to get the
>>>>>>>>>>>> fbdev BO out if it's not being displayed. If not being
>>>>>>>>>>>> mapped, it can be
>>>>>>>>>>>> evicted and make room for X, etc.
>>>>>>>>>>>>
>>>>>>>>>>>> To make this work, the BO's memory is mapped and unmapped in=

>>>>>>>>>>>> drm_fb_helper_dirty_work() before being updated from the
>>>>>>>>>>>> shadow FB. [1]
>>>>>>>>>>>> That fbdev mapping is established on each screen update,
>>>>>>>>>>>> more or less.
>>>>>>>>>>>> =C2=A0From my (yet unverified) understanding, this causes th=
e
>>>>>>>>>>>> performance
>>>>>>>>>>>> regression in the VM code.
>>>>>>>>>>>>
>>>>>>>>>>>> The original code in mgag200 used to kmap the fbdev BO while=

>>>>>>>>>>>> it's being
>>>>>>>>>>>> displayed; [2] and the drawing code only mapped it when
>>>>>>>>>>>> necessary (i.e.,
>>>>>>>>>>>> not being display). [3]
>>>>>>>>>>> Hm yeah, this vmap/vunmap is going to be pretty bad. We
>>>>>>>>>>> indeed should
>>>>>>>>>>> cache this.
>>>>>>>>>>>
>>>>>>>>>>>> I think this could be added for VRAM helpers as well, but
>>>>>>>>>>>> it's still a
>>>>>>>>>>>> workaround and non-VRAM drivers might also run into such a
>>>>>>>>>>>> performance
>>>>>>>>>>>> regression if they use the fbdev's shadow fb.
>>>>>>>>>>> Yeah agreed, fbdev emulation should try to cache the vmap.
>>>>>>>>>>>
>>>>>>>>>>>> Noralf mentioned that there are plans for other DRM clients
>>>>>>>>>>>> besides the
>>>>>>>>>>>> console. They would as well run into similar problems.
>>>>>>>>>>>>
>>>>>>>>>>>>>> The thing is that we'd need another generic fbdev
>>>>>>>>>>>>>> emulation for ast and
>>>>>>>>>>>>>> mgag200 that handles this issue properly.
>>>>>>>>>>>>> Yeah I dont think we want to jump the gun here.=C2=A0 If yo=
u can
>>>>>>>>>>>>> try to
>>>>>>>>>>>>> repro locally and profile where we're wasting cpu time I
>>>>>>>>>>>>> hope that
>>>>>>>>>>>>> should sched a light what's going wrong here.
>>>>>>>>>>>> I don't have much time ATM and I'm not even officially at
>>>>>>>>>>>> work until
>>>>>>>>>>>> late Aug. I'd send you the revert and investigate later. I
>>>>>>>>>>>> agree that
>>>>>>>>>>>> using generic fbdev emulation would be preferable.
>>>>>>>>>>> Still not sure that's the right thing to do really. Yes it's =
a
>>>>>>>>>>> regression, but vm testcases shouldn run a single line of
>>>>>>>>>>> fbcon or drm
>>>>>>>>>>> code. So why this is impacted so heavily by a silly drm
>>>>>>>>>>> change is very
>>>>>>>>>>> confusing to me. We might be papering over a deeper and much
>>>>>>>>>>> more
>>>>>>>>>>> serious issue ...
>>>>>>>>>> It's a regression, the right thing is to revert first and then=

>>>>>>>>>> work
>>>>>>>>>> out the right thing to do.
>>>>>>>>> Sure, but I have no idea whether the testcase is doing somethin=
g
>>>>>>>>> reasonable. If it's accidentally testing vm scalability of
>>>>>>>>> fbdev and
>>>>>>>>> there's no one else doing something this pointless, then it's
>>>>>>>>> not a
>>>>>>>>> real bug. Plus I think we're shooting the messenger here.
>>>>>>>>>
>>>>>>>>>> It's likely the test runs on the console and printfs stuff out=

>>>>>>>>>> while running.
>>>>>>>>> But why did we not regress the world if a few prints on the
>>>>>>>>> console
>>>>>>>>> have such a huge impact? We didn't get an entire stream of
>>>>>>>>> mails about
>>>>>>>>> breaking stuff ...
>>>>>>>> The regression seems not related to the commit.=C2=A0 But we hav=
e
>>>>>>>> retested
>>>>>>>> and confirmed the regression.=C2=A0 Hard to understand what happ=
ens.
>>>>>>> Does the regressed test cause any output on console while it's
>>>>>>> measuring? If so, it's probably accidentally measuring fbcon/DRM
>>>>>>> code in
>>>>>>> addition to the workload it's trying to measure.
>>>>>>>
>>>>>> Sorry, I'm not familiar with DRM, we enabled the console to output=

>>>>>> logs, and
>>>>>> attached please find the log file.
>>>>>>
>>>>>> "Command line: ... console=3Dtty0 earlyprintk=3DttyS0,115200
>>>>>> console=3DttyS0,115200 vga=3Dnormal rw"
>>>>> We did more check, and found this test machine does use the
>>>>> mgag200 driver.
>>>>>
>>>>> And we are suspecting the regression is caused by
>>>>>
>>>>> commit cf1ca9aeb930df074bb5bbcde55f935fec04e529
>>>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Date:=C2=A0=C2=A0 Wed Jul 3 09:58:24 2019 +0200
>>>> Yes, that's the commit. Unfortunately reverting it would require
>>>> reverting a hand full of other patches as well.
>>>>
>>>> I have a potential fix for the problem. Could you run and verify
>>>> that it
>>>> resolves the problem?
>>> Sure, please send it to us. Rong and I will try it.
>> Fantastic, thank you! The patch set is available on dri-devel at
>>
>> =C2=A0=C2=A0
>> https://lists.freedesktop.org/archives/dri-devel/2019-August/228950.ht=
ml
>=20
> The patch set improves the performance slightly, but the change is not
> very obvious.
>=20
> $ git log --oneline 8f7ec6bcc7 -5
> 8f7ec6bcc75a9 drm/mgag200: Map fbdev framebuffer while it's being displ=
ayed
> abcb1cf24033a drm/ast: Map fbdev framebuffer while it's being displayed=

> a92f80044c623 drm/vram-helpers: Add kmap ref-counting to GEM VRAM objec=
ts
> 90f479ae51afa drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation
> f1f8555dfb9a7 drm/bochs: Use shadow buffer for bochs framebuffer consol=
e
>=20
> commit:
> =C2=A0 f1f8555dfb ("drm/bochs: Use shadow buffer for bochs framebuffer =
console")
> =C2=A0 90f479ae51 ("drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation")
> =C2=A0 8f7ec6bcc7 ("drm/mgag200: Map fbdev framebuffer while it's being=

> displayed")
>=20
> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde 8f7ec6bcc75a996f5c6b3=
9a9cf=C2=A0
> testcase/testparams/testbox
> ----------------=C2=A0 -------------------------- ---------------------=
-----=C2=A0
> ---------------------------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %s=
tddev=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 change %stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | \
> =C2=A0=C2=A0=C2=A0=C2=A0 43921=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35884=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -17=
% 36629
> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
> =C2=A0=C2=A0=C2=A0=C2=A0 43921=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35884=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -17=
% 36629=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> GEO-MEAN vm-scalability.median
>=20

The regression goes from -18% to -17%, if I understand this correctly.
This is strange, because the patch set restores the way that the
original code worked. The heavy map/unmap calls in the fbdev code are
gone. Performance should have been back to normal.

I'd like to prepare a patch set for entirely reverting all changes. Can
I send it to you for testing?

Best regards
Thomas

> Best Regards,
> Rong Chen
>=20
>>
>> Best regards
>> Thomas
>>
>>> Thanks,
>>> Feng
>>>
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drm/fb-helper: Map DRM client buffer only =
when required
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 This patch change=
s DRM clients to not map the buffer by
>>>>> default. The
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 buffer, like any buffer object, should be =
mapped and unmapped
>>>>> when
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 needed.
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 An unmapped buffe=
r object can be evicted to system memory
>>>>> and does
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 not consume video ram until displayed. Thi=
s allows to use
>>>>> generic fbdev
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 emulation with drivers for low-memory devi=
ces, such as ast and
>>>>> mgag200.
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 This change affec=
ts the generic framebuffer console.
>>>>> HW-based consoles
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 map their console buffer once and keep it =
mapped. Userspace
>>>>> can mmap this
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 buffer into its address space. The shadow-=
buffered framebuffer
>>>>> console
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 only needs the buffer object to be mapped =
during updates.
>>>>> While not being
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 updated from the shadow buffer, the buffer=
 object can remain
>>>>> unmapped.
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Userspace will always mmap the shadow buff=
er.
>>>>> =C2=A0 which may add more load when fbcon is busy printing out mess=
ages.
>>>>>
>>>>> We are doing more test inside 0day to confirm.
>>>>>
>>>>> Thanks,
>>>>> Feng
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>
>>>> --=C2=A0
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>>>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>>>> HRB 21284 (AG N=C3=BCrnberg)
>>>>
>>>
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
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--WIRqV19KJIK6PgRVoGtx2iFAB3HXE7P8N--

--vYbyc3cN2rBtpvY8AZOikYou7XNZNXKll
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1D8voACgkQaA3BHVML
eiMQmwf+LNC/ODdwHTgcJxwA89ri9bFLD+eSVzfHPXKmHy3qNJgXDxDrLrNI91Af
7vTSV+abQc+4gELF5RSvGB8BlA1VltotqlMlVdMpO9KgSc3qMO2jcuZHY0vqUbVI
3vhY20OqrodTIoRj/1V++XcvszFb+6UBzBmQ5T4TrKZATAOolQupAh774f5a9bhN
6+cda0XaJrPjLmNzgttxGy4lQpxGawMXCBBFpVp8nSZudfD/VvZAaUIXiTpxHaCw
9lR/NXimX4OJ5i51Mpyy6n/6iQvyfZtP4sKP6JxEBff+BQcOtyvRQ59IPno9XnAX
ui30OtDE9ch6wP52PcNBWKdMRoTt3w==
=qDWt
-----END PGP SIGNATURE-----

--vYbyc3cN2rBtpvY8AZOikYou7XNZNXKll--

--===============0938846721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0938846721==--
