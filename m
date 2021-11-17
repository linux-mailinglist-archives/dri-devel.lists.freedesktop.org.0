Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 297AD4545AB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 12:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DA76E372;
	Wed, 17 Nov 2021 11:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 374 seconds by postgrey-1.36 at gabe;
 Wed, 17 Nov 2021 11:30:04 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4997F6E372
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 11:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637148596;
 bh=ggLkZ223a9rE1OZ+PtXEoMzttDhYwxytr42VAXoV0yE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dBlfeknad0LmtX5kTnIv5UZpcYiH97jO3iRxeixyBEf24hA62Q0Z9Skh1UPWv66C7
 zP3UT5R1+XObSyFNSWLCYzxhfcHL9wKdFTetfjblf7gr3/+rQkCqfXKYfoj2IMoPGU
 ykNqSrKN8f+hBt07vs/WCBQ3pSRwIRBXFdT+ZDtA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.76]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mdeb5-1mEFOM2tNZ-00ZhYR; Wed, 17
 Nov 2021 12:22:59 +0100
Message-ID: <525f9914-04bd-2d8a-0bbf-daf2d0d2053d@gmx.de>
Date: Wed, 17 Nov 2021 12:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Build regressions/improvements in v5.16-rc1
Content-Language: en-US
To: Nick Terrell <terrelln@fb.com>, Randy Dunlap <rdunlap@infradead.org>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
 <480CE37B-FE60-44EE-B9D2-59A88FDFE809@fb.com>
 <78b2d093-e06c-ba04-9890-69f948bfb937@infradead.org>
 <B57193D6-1FD4-45D3-8045-8D2DE691E24E@fb.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <B57193D6-1FD4-45D3-8045-8D2DE691E24E@fb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ecyVoIRPJxDu1rgYw3do9p97wWm9wU+AYBS1tvVaJ0qieCw2VM+
 F4AcfYMJ6m/o5RfywfI4addVn5UKeIySukwDZx6nGaNJwYzhtTxzP+5Y9QaJhX+4OlwpAV1
 nMwCfILf2+U0diPU2I9nlEi9f/czGOv/sIbvk3rRkJXeX3DOr1WSt6X93xYlDMTGlwHCyLR
 l+dXL+dPRpL0TjoJpT37A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vtpl3O7ltcQ=:HlBE/VaRFI2T/zryVPtqdD
 DV1eA2ZSBPTXvBZLcdUV7r5M4qlDRPEvUtoi9IoS6Mz/qWyEnkKJn1Y4dzpC/hRHWc5zzdVE8
 +2XoNv8a696haC4gxXg7nOZvUsYp+fmQHshqSyi3qyDNQ/J9Wee9JPervBfrFhc5PTNveD+nr
 H2XbO6nWgr96z40B5SS/iMwuavbnffoQA5P+OOVDEG0+DiZpZ+1FSDktCss8riQEptoxhXXD/
 M2C4MPPHrOE+JT9USDJBc1JpJa8fgVVSs2JfgYVSVIygcjS+ZqCRcrJQjuevoQWSdHjBHLwnJ
 bjf2ym86g1IsBPeY8FtVfhsah14OraI/iK/6O/tMNI2oCsgvaU3UQh2/8gOmf6DHi+FnNdHDC
 EH062z6uBTT9xa9qy0sidm1ckiPsJFlhcUkaEwMw/aq0dr8tA57D+TDlBKpZGOLsGMOqgCevL
 LtS3ng/swg7T+Xx56u8JJBYheuMihV3zYdCqutQY19MJwW1DrLdv0Ao0yX51iJkytHaczAGVs
 jNK5C3FtViHntmYGfRw/shx/sy8+ssp6F3Tm4RsNCYFvkZM29gRSSFBZJQsEfXFR/W5AD91+9
 66E8LtxVTSM0b/GV7MB0Ee+7JXksZJX+u6QZkRtgMJ7Gl7pD5hf8WCUfeGxf0apmGjs2pRoJV
 pwLC/EaQHq+nhBmPWb5ORtJbVQGcGYZr7ghW3WCt5oFPHEkWZr9tKB1Q6W6XBoxL4UqiS4WsU
 HJGlVaVOIFNbKkkFcZkcHiMVOQpgboAAfbxrVlrSsLKUQpQ7UEeeYG4vOVNgXU4kclTfFuu6q
 v1ScEHm8IvGC0JQ7QLcNKjtzpzeJjXNr+WUQxj09sGBKU52lyFJ9gvs5CCJ/25SHmggRBEU6z
 GjcwEJXc1vFQHe5+XD6ME/hRH2VF3F3mNRQ0fr7d3p21nmAksGgJWFyD6I0HXZR8S3Da9U81V
 A2iNEGuo0cvrGrt9qHXaU/CWSbwVZmIyN875xOIZSXgIyyPVBUKp1qyPvA2wjohANxOmWXgs5
 Z1Aj3GKcWk7MNMgmwTqS6tC0/23wEqdI1phhF5dBmzDKTkQlnWeCZAtNfYPD93kknNg2J25Lg
 qDmyIfg25Ak5tI=
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stan Skowronek <stan@corellium.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Joey Gouly <joey.gouly@arm.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/17/21 03:19, Nick Terrell wrote:
>
>
>> On Nov 16, 2021, at 6:05 PM, Randy Dunlap <rdunlap@infradead.org> wrote=
:
>>
>> On 11/16/21 5:59 PM, Nick Terrell wrote:
>>>> On Nov 15, 2021, at 8:44 AM, Helge Deller <deller@gmx.de> wrote:
>>>>
>>>> On 11/15/21 17:12, Geert Uytterhoeven wrote:
>>>>> On Mon, Nov 15, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>>>>>> Below is the list of build error/warning regressions/improvements i=
n
>>>>>> v5.16-rc1[1] compared to v5.15[2].
>>>>>>
>>>>>> Summarized:
>>>>>>  - build errors: +20/-13
>>>>>>  - build warnings: +3/-28
>>>>>>
>>>>>> Happy fixing! ;-)
>>>>>>
>>>>>> Thanks to the linux-next team for providing the build service.
>>>>>>
>>>>>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fa55b7dcd=
c43c1aa1ba12bca9d2dd4318c2a0dbf/   (all 90 configs)
>>>>>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8bb7eca97=
2ad531c9b149c0a51ab43a417385813/   (all 90 configs)
>>>>>>
>>>>>>
>>>>>> *** ERRORS ***
>>>>>>
>>>>>> 20 error regressions:
>>>>>>  + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: expecte=
d ':' before '__stringify':  =3D> 33:4, 18:4
>>>>>>  + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: label '=
l_yes' defined but not used [-Werror=3Dunused-label]:  =3D> 38:1, 23:1
>>>>>
>>>>>    due to static_branch_likely() in crypto/api.c
>>>>>
>>>>> parisc-allmodconfig
>>>>
>>>> fixed now in the parisc for-next git tree.
>>>>
>>>>
>>>>>>  + /kisskb/src/drivers/gpu/drm/msm/msm_drv.h: error: "COND" redefin=
ed [-Werror]:  =3D> 531
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the fra=
me size of 3252 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-th=
an=3D]:  =3D> 47:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the fra=
me size of 3360 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-th=
an=3D]:  =3D> 499:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the fra=
me size of 5344 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-th=
an=3D]:  =3D> 334:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the fra=
me size of 5380 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-th=
an=3D]:  =3D> 354:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size=
 of 1824 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:=
  =3D> 372:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size=
 of 2224 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:=
  =3D> 204:1
>>>>>>  + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size=
 of 3800 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:=
  =3D> 476:1
>>>>>
>>>>> parisc-allmodconfig
>>>>
>>>> parisc needs much bigger frame sizes, so I'm not astonished here.
>>>> During the v5.15 cycl I increased it to 1536 (from 1280), so I'm simp=
ly tempted to
>>>> increase it this time to 4096, unless someone has a better idea....
>>> This patch set should fix the zstd stack size warnings [0]. I=E2=80=99=
ve
>>> verified the fix using the same tooling: gcc-8-hppa-linux-gnu.
>>> I=E2=80=99ll send the PR to Linus tomorrow. I=E2=80=99ve been informed=
 that it
>>> isn't strictly necessary to send the patches to the mailing list
>>> for bug fixes, but its already done, so I=E2=80=99ll wait and see if t=
here
>>> is any feedback.
>>
>> IMO several (or many more) people would disagree with that.
>>
>> "strictly?"  OK, it's probably possible that almost any patch
>> could be merged without being on a mailing list, but it's not
>> desirable (except in the case of "security" patches).
>
> Good to know! Thanks for the advice, I wasn=E2=80=99t really sure what
> the best practice is for sending patches to your own tree, as I
> didn't see anything about it in the maintainer guide.

Nick, thanks a lot for your efforts to get the frame size usage down!

I've applied your patch series to the parisc for-next tree [1], so that it
gets some testing in the upstream for-next tree.
My tests so far are good, although I'm only using gcc-11.

If you don't mind, and if it doesn't generate issues for other
platforms & architectures I could submit them upstream to Linus when
I send the next pull request.

Helge

[1] https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.gi=
t/log/?h=3Dfor-next
