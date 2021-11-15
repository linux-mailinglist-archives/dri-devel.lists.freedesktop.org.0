Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A58B4509EE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 17:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170EE6EA02;
	Mon, 15 Nov 2021 16:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB606EA02
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 16:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636994693;
 bh=7X7opVIFUZ9gt0W6u/76B1ZJuHVq3lm9XgLe9rJcqwk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZNp1vsR/IplK0McopUH6C9jjdWtYM8pRYTQT99IpfdIkJP6hIuJ3Bav6Jp/Fsql+W
 pLeR4/Z2W5PlvaQlcoPw4WL++4hpx8bykreafnukKnhlmV8BRQXi+yt9oC9xkdHG47
 Egny6rJ6PkZPUuAGgL1D6QlCFuBICxSP/3OxGkDo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.172.2]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1mUiZj3MMl-00rlU4; Mon, 15
 Nov 2021 17:44:52 +0100
Message-ID: <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
Date: Mon, 15 Nov 2021 17:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Build regressions/improvements in v5.16-rc1
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5BKtXEDuts0Z1GbTQQwbacSZ6Qy1U07fZEMQSQLpuPBBQDGFGvS
 jgmRgNw/0/YxGtzSDq/AyZLFtskYKCywXQ3lO2wtd3EGePe4Ixvqqh7DUZZeoRxCsQMl6GA
 by16J3GCpzXn/Msq8wegCjeZkFLZeq3tCjI3WXTxmaGR5bFXZPJKjDTbupJilCqt5Bs35DE
 Rw+BaHR8OgV3ewoQytQig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b77E2Nv2HWU=:1iEuQwORGxqm+Wxgophchs
 kJUQQ6hBkiYPbKA0OD9YByp1bHssWrVkeWRGKN5pykYEH3l7dN0ijgUMSWJcN0GfQUbeMrT1b
 YaGdtm1k4/pCbjVfG0S149Z9y49SItZL4ZWtdlVE+CRAqawiC7KOmFHtqeN0Y3JmBhRIOjqfA
 uwpF6echOB0lej0vS99fwoOz3DbzQCS0D+iIZnjK/55BLHi1EdS59b+xe3FYn1MbOzW1sOTXh
 U2NPD4g+VaVZuUlI+pmHPQ4wNk3aQQ/0v2vADxHoqHF8G6ISUZLs6qLqK4AmJFA1E1A4aLtz/
 7huNRwSazAtuaLdZpRe6Qeys5FuaWNHQLsONPwXczWfhlS5ZxxU4znt96t19rKNnOB44icruu
 FpfCnxAIbKLuFgiiE4TBO4D3tcK6iDuh4gsXT/0L9E/QB26kjEtSHA3QP7ACtzqYu1Bdzxu0+
 neK0u+MJdKV7sSNcTbjG+E0D8+rAJZz5NjcCzEg57aRJ+O5YgbDkAoaLXcR3+ihlZml9NHl8I
 nyqs3iFoo+U5FZS6xEAjtRTd3kjOJpcutf95kWK5s5mTRo34ItK4k/Ad0JVdO0Qk94Gly7dd3
 EPRvkD3IvjVdIAoJ1rGqrCJLxNWP9OskTwtxtnvl4HqpjswTECMXMjjUHePuirpU/wbanGDjZ
 gLkqWwbit6L+/MF8j/WgH0uEf54Q4Ym1PEHqdoCmTAevhGPZZD49/diYSKX8c4baXWRjKyRYu
 jCjMhrQJFRiCXP70cHBPZPB5ov1LUhDv5uzdeyGBDdFbsha0M6M8zmtIj9jngXvAp7jjclHY2
 Q4keWlRsrozLDEB86NArf/fA+BNKh5UekNeLQ1k9csmoAntQei+GfSJl/SL76lPfgp0jAHfUg
 TvygG2oE3WZk43TGud0mvrvuC5RIjSTvIVbkSX5eI/GUxeqOuV5DaO80y8DDA1+oswXNTMVJ9
 VPSs3miXxGYDwZ+8z0E8DZ8Q1eG6CZDbs4b5ClRtuiPMJX76ARaXEeTlPpAffiH/ptsUKt03s
 zF15t5hKeMRpsZJ9fldqE2/ud15ANfqT6CXGMZfxXhHhIa0Hc9jQPkvTp1cVZRTJtChK318IW
 JWFtnZlRQXGilk=
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stan Skowronek <stan@corellium.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Nick Terrell <terrelln@fb.com>, Joey Gouly <joey.gouly@arm.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-ntfs-dev@lists.sourceforge.net, Hector Martin <marcan@marcan.st>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/15/21 17:12, Geert Uytterhoeven wrote:
> On Mon, Nov 15, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>> Below is the list of build error/warning regressions/improvements in
>> v5.16-rc1[1] compared to v5.15[2].
>>
>> Summarized:
>>   - build errors: +20/-13
>>   - build warnings: +3/-28
>>
>> Happy fixing! ;-)
>>
>> Thanks to the linux-next team for providing the build service.
>>
>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fa55b7dcdc43c=
1aa1ba12bca9d2dd4318c2a0dbf/ (all 90 configs)
>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8bb7eca972ad5=
31c9b149c0a51ab43a417385813/ (all 90 configs)
>>
>>
>> *** ERRORS ***
>>
>> 20 error regressions:
>>   + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: expected '=
:' before '__stringify':  =3D> 33:4, 18:4
>>   + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: label 'l_y=
es' defined but not used [-Werror=3Dunused-label]:  =3D> 38:1, 23:1
>
>     due to static_branch_likely() in crypto/api.c
>
> parisc-allmodconfig

fixed now in the parisc for-next git tree.


>>   + /kisskb/src/drivers/gpu/drm/msm/msm_drv.h: error: "COND" redefined =
[-Werror]:  =3D> 531
>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame =
size of 3252 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=
=3D]:  =3D> 47:1
>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame =
size of 3360 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=
=3D]:  =3D> 499:1
>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame =
size of 5344 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=
=3D]:  =3D> 334:1
>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame =
size of 5380 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=
=3D]:  =3D> 354:1
>>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of=
 1824 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:  =
=3D> 372:1
>>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of=
 2224 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:  =
=3D> 204:1
>>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of=
 3800 bytes is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]:  =
=3D> 476:1
>
> parisc-allmodconfig

parisc needs much bigger frame sizes, so I'm not astonished here.
During the v5.15 cycl I increased it to 1536 (from 1280), so I'm simply te=
mpted to
increase it this time to 4096, unless someone has a better idea....

>>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2240 bytes is =
larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]:  =3D> 1311:1
>>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2304 bytes is =
larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]:  =3D> 1311:1
>>   + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2320 bytes is =
larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]:  =3D> 1311:1
>
> powerpc-allmodconfig
>
>>   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compi=
letime_assert_366' declared with attribute error: FIELD_PREP: value too la=
rge for the field:  =3D> 335:38
>
>     in drivers/pinctrl/pinctrl-apple-gpio.c
>
> arm64-allmodconfig (gcc8)
>
>>   + /kisskb/src/include/linux/fortify-string.h: error: call to '__read_=
overflow' declared with attribute error: detected read beyond size of obje=
ct (1st parameter):  =3D> 263:25, 277:17
>
>     in lib/test_kasan.c
>
> s390-all{mod,yes}config
> arm64-allmodconfig (gcc11)
>
>>   + error: modpost: "mips_cm_is64" [drivers/pci/controller/pcie-mt7621.=
ko] undefined!:  =3D> N/A
>>   + error: modpost: "mips_cm_lock_other" [drivers/pci/controller/pcie-m=
t7621.ko] undefined!:  =3D> N/A
>>   + error: modpost: "mips_cm_unlock_other" [drivers/pci/controller/pcie=
-mt7621.ko] undefined!:  =3D> N/A
>>   + error: modpost: "mips_cpc_base" [drivers/pci/controller/pcie-mt7621=
.ko] undefined!:  =3D> N/A
>>   + error: modpost: "mips_gcr_base" [drivers/pci/controller/pcie-mt7621=
.ko] undefined!:  =3D> N/A
>
> mips-allmodconfig
>
>> 3 warning regressions:
>>   + <stdin>: warning: #warning syscall futex_waitv not implemented [-Wc=
pp]:  =3D> 1559:2
>
> powerpc, m68k, mips, s390, parisc (and probably more)

Will someone update all of them at once?




Helge


>>   + arch/m68k/configs/multi_defconfig: warning: symbol value 'm' invali=
d for MCTP:  =3D> 322
>>   + arch/m68k/configs/sun3_defconfig: warning: symbol value 'm' invalid=
 for MCTP:  =3D> 295
>
> Yeah, that happens when symbols are changed from tristate to bool...
> Will be fixed in 5.17-rc1, with the next defconfig refresh.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m=
68k.org
>
> In personal conversations with technical people, I call myself a hacker.=
 But
> when I'm talking to journalists I just say "programmer" or something lik=
e that.
>                                 -- Linus Torvalds
>

