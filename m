Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EED7545680
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 23:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14F412B356;
	Thu,  9 Jun 2022 21:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF8512B352
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 21:33:11 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mrggc-1nN2AE3LUq-00nk8a; Thu, 09 Jun 2022 23:33:02 +0200
Message-ID: <fb2035d3-5322-7b03-e9fc-89ce1f892db6@i2se.com>
Date: Thu, 9 Jun 2022 23:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
 <3648b281-c6b0-a91c-2a4f-ddbee6988b3f@i2se.com>
 <CALeDE9OkN5Vq-_L=VzSdKK0=6dKrNBX1q3zm3ZaNX8Jy9VJ35w@mail.gmail.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <CALeDE9OkN5Vq-_L=VzSdKK0=6dKrNBX1q3zm3ZaNX8Jy9VJ35w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:LNifFNFS44PfjB/74EhGog96KMMtkvWUBmQ6XrVJD6NKNyVdIdv
 h+qd79MsqiqTLFSIDue2YEmVvasuQ5nN+44maipOJ2ZV506zO59XHNWywx5Z7x0577PdtAf
 kCwD3gTflvGA4vwphNLxsacTx0rPSXksQ9G9X1XLN6zO/3QCyWDLOX5BMVB1EcjWQyItqfZ
 DV+8HakisKNxSBdnPz8KA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FqeQ+vbFm3E=:81kB4RGk/u2CdVZ6TTwAzs
 ZPpFQNOSuyNIFB5jZUTPSuBVPW8Smzaum8zX1FOwwFk2SsLm4WxKXKl5oLbXphWCpdXkDs4lO
 LJIJyHlYLArYF0gHLSbfA/nzIa5pM777OPYaIIH5/H0nV6ECITYK9Pc0xanV5RvL/DVVlpRVE
 4c/aktRBqSmLcsQRcyGfTKryaOSUXCbuqu6yWy//asveyc/tL8PelLHYiMdk/4pl3xSK/oaR+
 dHEOQj7dmYy+BNpwPUq5zlK0Yjcth5hlhaO7laL9MuKWtXMdVrgxx+gQlMI2m+sb2ZslCpLIa
 BMzD+JZ5cQeWVEq1Z0glcGardglbHyCJfpbEhe6hs241GJejwmpC8S1T8YhlD6P+8Z8ZrDqJJ
 oLNOydzv005q1RPQdxl3uQ8ZWcQaqRFPOz/gU87F34Lq/uPIsCFosZ8LmwlIGghewnoRA/9hl
 dAyy8s3pblpnpTuG5lpyY1CCFJovJXfgjZufjpvDHM8NbIfRcbxnuEPq3ZxkHy83SP91n0zz5
 BPOCpVp9tjENT8pTBSJdr/7nlnIWmVeKfB8bGEktXegZUnzP+8neyoBTCruCLN2wqbOjJzrg7
 y5EPbbLaX89HND09FhmhXjcrlN5IgIJ7MK83aHyOwY+oDr0+3YaRKEw6OjHNsTwRfLpsIKPt3
 d1L4YUdALwyXsSsTPyvil7YPda/bzhpZceGbZZNY+Jt+OSyeINz86FH8csrL3sKVBvlKLv5gW
 QM8Uu+wylBIeyiFSiYVjQvws1LWtJnGEOgulK1ArwdJ7tYb4SuA6yDHJVXA=
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
Cc: Peter Mattern <pmattern@arcor.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter,

Am 09.06.22 um 13:52 schrieb Peter Robinson:
>>>>> As of Linux 5.18.0, module vc4 apparently isn't working on Raspberry Pi
>>>>> 3B any more.
>>>>>
>>>>> If a monitor is attached to the device, the boot messages show up as
>>>>> usual, but right when KMS starts, the screen turns black. Similarly, the
>>>>> screen also turns black when the module is blacklisted at boot time and
>>>>> loaded from the running system.
>>>>> The problem looks quite similar to the one posted some months ago in [1].
>>> If I understand you properly, it results in a blank screen if the
>>> monitor is connected, but the system is still responsive?
>>>
>>> If so, it's a very different problem than the link you provided, since
>>> it was occurring when no monitor was connected and resulted in a total
>>> system hang.
>>>
>>>>> Unfortunately, looking through systemd's journal didn't seem to yield
>>>>> any real hint. Nevertheless, the results from grepping vc4 are
>>>> I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
>>>> can confirm the regression. Maxime would know what might be up here?
>> i assume you are using the downstream DTB?
> In this case it's the one in the Linux kernel (not sure if that's
> upstream or downstream in this context) not the one provided by the
> RPi firmware.

okay thanks. I tried the kernel config but its huge.

Is it correct that the issue occurs with your kernel config, but not 
with multi_v7_defconfig?

>
>> Please provide the version/date of the GPU firmware?
> [    6.205121] raspberrypi-firmware soc:firmware: Attached to firmware
> from 2022-05-24T13:26:52
> Which is git f145afc
This is good. I had issues with older firmware which didn't implement 
RPI_FIRMWARE_NOTIFY_DISPLAY_DONE. So it must be something different.
