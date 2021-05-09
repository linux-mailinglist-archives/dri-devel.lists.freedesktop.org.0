Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F1037795D
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 01:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9292B89F99;
	Sun,  9 May 2021 23:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1499 seconds by postgrey-1.36 at gabe;
 Sun, 09 May 2021 23:52:11 UTC
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
 [192.185.149.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E19889F99
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 23:52:11 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 3CE7D721BA9
 for <dri-devel@lists.freedesktop.org>;
 Sun,  9 May 2021 18:03:55 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id fsSpl20y48uM0fsSplOLSd; Sun, 09 May 2021 18:03:55 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zDKJQW5cIvnIvm8lZyRC/G4lR2JzgQSng4VYgkLxRNM=; b=mNly2mz7dxR5U+X89Rsbc4l+Mt
 VEEyjREu/fyLvFixsrkT0KuATJlkp11ZjNaimTJJ41iGoJc4iZHfp0bjKjypvJzt+8rTGfYBiktrJ
 WAQsG4ux25EoryX2P83JQEhyt8BI9HQA9lqNb7hUuwor8sYEXYQH1DOImWTNqZ/fjnYjPPbcyIwwp
 ha1fQtjEoqOdwB0tX7Vzp8p4TZ5oFlB9UQJ73YKQvJFqLzxWOkRKg2VQLi7gvNoKKSTAEGPAV77A6
 MDYIbabcObkxttwUeX0FmOPHTOa938e3R6IZTn5v2mfsw9FbH7NHC6ih1JN5y3GarFzC5Mz8GSvCG
 02znlLmg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:58004
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lfsSk-002y5H-JC; Sun, 09 May 2021 18:03:50 -0500
Subject: Re: Radeon NI: GIT kernel with the nislands_smc commit doesn't boot
 on a Freescale P5040 board and P.A.Semi Nemo board
To: Christian Zigotzky <chzigotzky@xenosoft.de>
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
 <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <bd98c13d-6f9d-9d5d-12b9-b866e41237ab@embeddedor.com>
Date: Sun, 9 May 2021 18:04:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lfsSk-002y5H-JC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:58004
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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

Hi Christian,

On 5/8/21 06:33, Christian Zigotzky wrote:
> Hi Gustavo,
> 
> Your patch works! Thanks a lot! I tested it with my Freescale P5040 board and P.A.Semi Nemo board with a connected AMD Radeon HD6970 NI graphics cards (Cayman
> XT) today.

Awesome! :)

Thank you!
--
Gustavo

> 
> Have a nice day,
> Christian
> 
> 
> On 07 May 2021 at 08:43am, Christian Zigotzky wrote:
>> Hi Gustavo,
>>
>> Great! I will test it. Many thanks for your help.
>>
>> Cheers,
>> Christian
>>
>>
>>> On 7. May 2021, at 01:55, Gustavo A. R. Silva <gustavo@embeddedor.com> wrote:
>>>
>>> ﻿Hi Christian,
>>>
>>>> On 4/30/21 06:59, Christian Zigotzky wrote:
>>>> Hello,
>>>>
>>>> The Nemo board (A-EON AmigaOne X1000) [1] and the FSL P5040 Cyrus+ board (A-EON AmigaOne X5000) [2] with installed AMD Radeon HD6970 NI graphics cards (Cayman
>>>> XT) [3] don't boot with the latest git kernel anymore after the commit "drm/radeon/nislands_smc.h: Replace one-element array with flexible-array member in
>>>> struct NISLANDS_SMC_SWSTATE branch" [4].  This git kernel boots in a virtual e5500 QEMU machine with a VirtIO-GPU [5].
>>>>
>>>> I bisected today [6].
>>>>
>>>> Result: drm/radeon/nislands_smc.h: Replace one-element array with flexible-array member in struct NISLANDS_SMC_SWSTATE branch
>>>> (434fb1e7444a2efc3a4ebd950c7f771ebfcffa31) [4] is the first bad commit.
>>> I have a fix ready for this bug:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?h=testing/drm-nislands
>>>
>>> I wonder if you could help me to test it with your environment, please.
>>> It should be applied on top of mainline.
>>>
>>> Thank you!
>>> -- 
>>> Gustavo
>>>
>>>> I was able to revert this commit [7] and after a new compiling, the kernel boots without any problems on my AmigaOnes.
>>>>
>>>> After that I created a patch for reverting this commit for new git test kernels. [3]
>>>>
>>>> The kernel compiles and boots with this patch on my AmigaOnes. Please find attached the kernel config files.
>>>>
>>>> Please check the first bad commit.
>>>>
>>>> Thanks,
>>>> Christian
>>>>
>>>> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
>>>> [2] http://wiki.amiga.org/index.php?title=X5000
>>>> [3] https://forum.hyperion-entertainment.com/viewtopic.php?f=35&t=4377
>>>> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=434fb1e7444a2efc3a4ebd950c7f771ebfcffa31
>>>> [5] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev user,id=mynet0 -device
>>>> virtio-net-pci,netdev=mynet0 -append "rw root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci -device usb-tablet -device virtio-keyboard-pci -smp 4
>>>> -vnc :1
>>>> [6] https://forum.hyperion-entertainment.com/viewtopic.php?p=53074#p53074
>>>> [7] git revert 434fb1e7444a2efc3a4ebd950c7f771ebfcffa3
> 
