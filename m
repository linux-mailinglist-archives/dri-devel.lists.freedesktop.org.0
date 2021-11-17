Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8AE453E34
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 03:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C4C89B98;
	Wed, 17 Nov 2021 02:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57DF89B98
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 02:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=4tWYtMZGixA+wvOSftKSlvk/VgodDRuuv8NOVBgK9qA=; b=Adq4v/KWTEM2FdczXpvjs80tIS
 X+RI8WudlJAsHrDPGPuCobzpS7CFDimDgP4hUO57ijSq+gK2r7RjaX+5aWCUI+kHE5HNNvxAiArb8
 MS2goqmoJTX+p9hyEsHktic/NtZxDWhf2p4O9b5k/d/KvN0wUtcmJsD2XP8KiNZU8zHfrCWygGZbf
 8nS638cYMetvY08LkJYRSgyJFQ4rl780l7P9YO3hEfXv1iAyk81Ac9opUIOH1J54gT/anfierRXVH
 MxYlvXhSFH2WpfGppH4xw+r0EETjY+4Yny/3LELXc9fz8PIP5eqaU39lCpGtN1ivyUo+nWcfxcO6p
 5wtu7BXA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnAKU-0035bi-Ao; Wed, 17 Nov 2021 02:05:44 +0000
Subject: Re: Build regressions/improvements in v5.16-rc1
To: Nick Terrell <terrelln@fb.com>, Helge Deller <deller@gmx.de>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
 <480CE37B-FE60-44EE-B9D2-59A88FDFE809@fb.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <78b2d093-e06c-ba04-9890-69f948bfb937@infradead.org>
Date: Tue, 16 Nov 2021 18:05:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <480CE37B-FE60-44EE-B9D2-59A88FDFE809@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 11/16/21 5:59 PM, Nick Terrell wrote:
> 
> 
>> On Nov 15, 2021, at 8:44 AM, Helge Deller <deller@gmx.de> wrote:
>>
>> On 11/15/21 17:12, Geert Uytterhoeven wrote:
>>> On Mon, Nov 15, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>> Below is the list of build error/warning regressions/improvements in
>>>> v5.16-rc1[1] compared to v5.15[2].
>>>>
>>>> Summarized:
>>>>   - build errors: +20/-13
>>>>   - build warnings: +3/-28
>>>>
>>>> Happy fixing! ;-)
>>>>
>>>> Thanks to the linux-next team for providing the build service.
>>>>
>>>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf/  (all 90 configs)
>>>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8bb7eca972ad531c9b149c0a51ab43a417385813/  (all 90 configs)
>>>>
>>>>
>>>> *** ERRORS ***
>>>>
>>>> 20 error regressions:
>>>>   + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: expected ':' before '__stringify':  => 33:4, 18:4
>>>>   + /kisskb/src/arch/parisc/include/asm/jump_label.h: error: label 'l_yes' defined but not used [-Werror=unused-label]:  => 38:1, 23:1
>>>
>>>     due to static_branch_likely() in crypto/api.c
>>>
>>> parisc-allmodconfig
>>
>> fixed now in the parisc for-next git tree.
>>
>>
>>>>   + /kisskb/src/drivers/gpu/drm/msm/msm_drv.h: error: "COND" redefined [-Werror]:  => 531
>>>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 3252 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 47:1
>>>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 3360 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 499:1
>>>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 5344 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 334:1
>>>>   + /kisskb/src/lib/zstd/compress/zstd_double_fast.c: error: the frame size of 5380 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 354:1
>>>>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of 1824 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 372:1
>>>>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of 2224 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 204:1
>>>>   + /kisskb/src/lib/zstd/compress/zstd_fast.c: error: the frame size of 3800 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]:  => 476:1
>>>
>>> parisc-allmodconfig
>>
>> parisc needs much bigger frame sizes, so I'm not astonished here.
>> During the v5.15 cycl I increased it to 1536 (from 1280), so I'm simply tempted to
>> increase it this time to 4096, unless someone has a better idea....
> 
> This patch set should fix the zstd stack size warnings [0]. I’ve
> verified the fix using the same tooling: gcc-8-hppa-linux-gnu.
> 
> I’ll send the PR to Linus tomorrow. I’ve been informed that it
> isn't strictly necessary to send the patches to the mailing list
> for bug fixes, but its already done, so I’ll wait and see if there
> is any feedback.

IMO several (or many more) people would disagree with that.

"strictly?"  OK, it's probably possible that almost any patch
could be merged without being on a mailing list, but it's not
desirable (except in the case of "security" patches).

-- 
~Randy
