Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10269377174
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 13:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9115D6E08A;
	Sat,  8 May 2021 11:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A4F6E08A
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 11:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1620473584; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=D7YuKPxXsKeFXvAYA95enHLKpMEs4t73syLyt+LYCSdEBz9la49v/3Yudpi1rCb1hb
 1jsnIZGkT/Sd2ZO4OePtlQ/z4P64RYnGzg0lB4LMNGq4EozUfHZ4E90yTOjH9g/SMWNX
 vUoNXlfxpmjebqejstQgKZ/AMj0YcoCi7OS/bm1BZQoLMjhAy8nxRSvmWjlYtVsZGUTP
 TbUBaiOIqCUVGfUBlH28znuo1uGM+OFcDUHCeNy+nDSStEoEdVviAj8vyt+eF7LCboY1
 /BmBcxV3BHkhI34a3TE5icytGX1ryNuSnSSLmSEfdP63evm33fpdKj+xY1MBkF2rgPJh
 y6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620473584;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=zXeLgkAjA9yOJQBu6A8doWAg7AhdlmEivCv++PGr85c=;
 b=SX9OzBiiTydmrGaCp1gzfZOhz9CQ3UQkNj//trriKVE0QLOWBGfI65nM9uvuLauEDX
 3fNSzP+gGLZTF5eQaWBikCHIMkqfuDvz/QLKRWUcyqv+lVs4GgLwjNSszSmG/e+EQAeZ
 Png53/FUiDnVckzDRDJuky6WLz4xsBhcLMtzI8Cck7ZBuvD2VspjsE8dNGkUlLZkPWLS
 ZHV5RPvBVNvgzHPNfrzT0gz5lUiUou6h/D+G2WZkw83bjzCNeA0oFf75vozTR2BruIz4
 PM6O2PNcNEyDtFdY0q0/x8qgrjr+CuL/z7e6lyyq2bRRR4DtNfosjYixAagKVcKuPrhd
 rOIQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620473584;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=zXeLgkAjA9yOJQBu6A8doWAg7AhdlmEivCv++PGr85c=;
 b=DLu2j0maC2+gIbVUSJlZ9sSApqnJc6Ik78gMOAx1y480UVneqAvkxk7nK4Q1MPtI5/
 Q4/gg6abZZTam9hxWxdh4/aC87gqxIbOYDIseHuqIOddwfsMXpSo3iu8A/JQyfxIinI8
 6r2i/O6Ovz1/0IPBZ2EETFLFMjtAFXEVr7sQNTCE4+Sd5ZnYD5QefBmunVlzz4qSz5K4
 Q51qKNpDDuqkSOe/frwUow6BmsAxKBN8/5Ya+H+Wj1veptLoGWNZoTtuyrFlpVvjRdmS
 ddHoVqXV/7vXgoa+b4cBjnNv92uRco++2aZ/2JgP48JOK+ecHAuTz+AD10t5owAJBjol
 oczA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhRcm65Dcd5OChdKI1UkbsHSLBp7w=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id L0ba16x48BX358r
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 8 May 2021 13:33:03 +0200 (CEST)
Subject: Re: Radeon NI: GIT kernel with the nislands_smc commit doesn't boot
 on a Freescale P5040 board and P.A.Semi Nemo board
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
Message-ID: <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
Date: Sat, 8 May 2021 13:33:02 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, gustavoars@kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, alexander.deucher@amd.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gustavo,

Your patch works! Thanks a lot! I tested it with my Freescale P5040 
board and P.A.Semi Nemo board with a connected AMD Radeon HD6970 NI 
graphics cards (Cayman
XT) today.

Have a nice day,
Christian


On 07 May 2021 at 08:43am, Christian Zigotzky wrote:
> Hi Gustavo,
>
> Great! I will test it. Many thanks for your help.
>
> Cheers,
> Christian
>
>
>> On 7. May 2021, at 01:55, Gustavo A. R. Silva <gustavo@embeddedor.com> wrote:
>>
>> ﻿Hi Christian,
>>
>>> On 4/30/21 06:59, Christian Zigotzky wrote:
>>> Hello,
>>>
>>> The Nemo board (A-EON AmigaOne X1000) [1] and the FSL P5040 Cyrus+ board (A-EON AmigaOne X5000) [2] with installed AMD Radeon HD6970 NI graphics cards (Cayman
>>> XT) [3] don't boot with the latest git kernel anymore after the commit "drm/radeon/nislands_smc.h: Replace one-element array with flexible-array member in
>>> struct NISLANDS_SMC_SWSTATE branch" [4].  This git kernel boots in a virtual e5500 QEMU machine with a VirtIO-GPU [5].
>>>
>>> I bisected today [6].
>>>
>>> Result: drm/radeon/nislands_smc.h: Replace one-element array with flexible-array member in struct NISLANDS_SMC_SWSTATE branch
>>> (434fb1e7444a2efc3a4ebd950c7f771ebfcffa31) [4] is the first bad commit.
>> I have a fix ready for this bug:
>> https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?h=testing/drm-nislands
>>
>> I wonder if you could help me to test it with your environment, please.
>> It should be applied on top of mainline.
>>
>> Thank you!
>> --
>> Gustavo
>>
>>> I was able to revert this commit [7] and after a new compiling, the kernel boots without any problems on my AmigaOnes.
>>>
>>> After that I created a patch for reverting this commit for new git test kernels. [3]
>>>
>>> The kernel compiles and boots with this patch on my AmigaOnes. Please find attached the kernel config files.
>>>
>>> Please check the first bad commit.
>>>
>>> Thanks,
>>> Christian
>>>
>>> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
>>> [2] http://wiki.amiga.org/index.php?title=X5000
>>> [3] https://forum.hyperion-entertainment.com/viewtopic.php?f=35&t=4377
>>> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=434fb1e7444a2efc3a4ebd950c7f771ebfcffa31
>>> [5] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev user,id=mynet0 -device
>>> virtio-net-pci,netdev=mynet0 -append "rw root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci -device usb-tablet -device virtio-keyboard-pci -smp 4
>>> -vnc :1
>>> [6] https://forum.hyperion-entertainment.com/viewtopic.php?p=53074#p53074
>>> [7] git revert 434fb1e7444a2efc3a4ebd950c7f771ebfcffa3

