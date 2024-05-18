Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6D28C9319
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 01:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9758110E102;
	Sat, 18 May 2024 23:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="B9Yop37r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B330410E102;
 Sat, 18 May 2024 23:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1716076778; x=1716681578; i=w_armin@gmx.de;
 bh=NNmDE7m5bJJ2CZ7VanPERVBXNAvh55F+ivVRj6O4e7U=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=B9Yop37r5RRGid01qqfzKkPs9oiQEFrl4BFhPlBWDgDIrh76dtIynUtpXgaRcIj5
 3i9Mmrd/MObwtG2gncxnkIpk4vSdHze/14DfeSSEhf2lwxVcG4xeFooTt8O/3OZ5C
 tbFbrr6PlbHj1rjb4+jE+4GFocB7NEZNyMdeRtrmq2iyfAc+Z4kTDlR1VkkOvIBoa
 FZSO9x/Cjxb8h0ATT//l7+m2svvf29JjLHPFygdSijDx8+hLS/9k2Oi4dl0DYfCBG
 YXcwhmT8KGQjBqkfC7m7MITz/ppyyAbqCNk+cs6jnsxmwYjbu2zgaS/LZgSP0SlKB
 B3dwlwJmUeCVRvkuwg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWigq-1s1sEU2o36-00X5zD; Sun, 19
 May 2024 01:59:38 +0200
Message-ID: <c3205455-7ad2-487e-8954-52102754e154@gmx.de>
Date: Sun, 19 May 2024 01:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 5.15.150 black screen with AMD Raven/Picasso GPU
To: Barry Kauler <bkauler@gmail.com>
Cc: Yifan Zhang <yifan1.zhang@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org
References: <CABWT5yiejGABNXicsS7u-daKnBBjK6YTDVgaQOqwGYn8P20D8Q@mail.gmail.com>
 <6580c2d4-b084-470f-80a0-aa09f1ab880d@gmx.de>
 <CABWT5yiD110qmJcRsoGVMevULAVmYpyiW4w9MtmNjp7E0rDQ8A@mail.gmail.com>
 <CABWT5yg5jG7eMiDp7QN2yhFj6983qF9zN7eHOprH4eEjwQJLBQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CABWT5yg5jG7eMiDp7QN2yhFj6983qF9zN7eHOprH4eEjwQJLBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WOQGRE8vtyB4Wa+J5NaDDO33di4sCYKzFHCR8vlV4o23DaxoYzF
 ECGcggATAPYE+uyu1LAzSl31odCt/cg3wrM/3tXncWAxeaeeM5Uddu/F8h9ikMUCucQDZp0
 qZuKdelx2QHDBxcA8eBP05GHEEZZf+0gVZ1idBvCakn74TRnRuFgS11Mavmcg4bT6TWmbgw
 LM6ncspeLdvIgE94UyNiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zU5n0vUSVjQ=;zaoKM0jQXmqAQsz6mcWPxzi4I7U
 g8eoS5+8dvSHTY9VcUxkFEgmCre1DniK7sbaeUKcv1Y9ON68iZhZiF/8AzfBpaOWUHTi/6BCD
 4nW5S0as6g25sFVtitcVscxpHU6x1ojoktrWzWhY1chjJFMrVSpdf9yng7XBKiDThvki7lLcu
 rrzufDV8sV0sMK1Nl6WacZHXo61yZBxNUggiPefiSGLcyTKy58vHPFXe/cM/qnZGSA6chMiLm
 CATCnftzqyKBkWAc30J9bB0LGLrUxIcagEDp0kSE/S8OduJX/Kk81dPPbPhqhjwKnMfGAPw9c
 ghnYCTf6AbpB0WD7pZOcyPhervFvxOF9CZZtq1WYV1ykq/GD+5gjxi6Q/UqzvWAguh67FJi27
 05XCr76kIPQAi4jeWhe0GqhVjqwCCtqR2syTIAP1Dx8orrss45NGidLWoUiB3HRxzIdKIEMIC
 xSAXHDAdnvkqE9GkpXRvRyz+smwVseckzj0LMxRDYIpRT4ag/7XakXeeEppNHz6r6dcYVF7At
 BPWGiIHcL9A4oZR17Tzhl2vbkcFey/qTTRoMOw9/8oIwe61a9v7ugfePrO6roAEj/TV35Ld9+
 91VWDEAIv7kg/0c6amiWDmWb2r00pYxrO9yeWrNdWRg67mmrp7NxjT6BxpUUgypQwoQ4OJDEs
 OWzYbrJ4NjFEjajgqbquhF5hhgIWE4rw89w8NH1cUh1vI7V4MtTlyqY/3Iqvo0u46udldaVHx
 ZRwCe84hMtcZLrnCgmI95PF8b92ov7mAdB+j90Yd1qLB4ighwqRawnTPZyANGlNzZTmEu/TzQ
 PSnIYVO1ltfVt6ZDAA4ESSyNZgz0DQD1p8tO9btvOMEyk=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.05.24 um 03:30 schrieb Barry Kauler:

> Armin, Yifan, Prike,
> I will top-post, so you don't have to scroll down.
> After identifying the commit that causes black screen with my gpu, I
> posted the result to you guys, on May 9.
> It is now May 17 and no reply.
> OK, I have now created a patch that reverts Yifan's commit, compiled
> 5.15.158, and my gpu now works.
> Note, the radeon module is not loaded, so it is not a factor.
> I'm not a kernel developer. I have identified the culprit and it is up
> to you guys to fix it, Yifan especially, as you are the person who has
> created the regression.
> I will attach my patch.
> Regards,
> Barry Kauler

Hi,

sorry for not responding to your findings. I normally do not work with GPU=
 drivers,
so i hoped one of the amdgpu developers would handle this.

I CCeddri-devel@lists.freedesktop.org  and amd-gfx@lists.freedesktop.org s=
o that other
amdgpu developers hear from this issue.

Thanks you for you persistence in finding the offending commit.
Armin Wolf

>
> On Thu, May 9, 2024 at 4:08=E2=80=AFPM Barry Kauler <bkauler@gmail.com> =
wrote:
>> On Fri, May 3, 2024 at 9:03=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>>>> ...
>>>> # lspci | grep VGA
>>>> 05:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
>>>> [AMD/ATI] Picasso/Raven 2 [Radeon Vega Series / Radeon Vega Mobile
>>>> Series] (rev c2)
>>>> 05:00.7 Non-VGA unclassified device: Advanced Micro Devices, Inc.
>>>> [AMD] Raven/Raven2/Renoir Non-Sensor Fusion Hub KMDF driver
>>>>
>>>> # lspci -n -k
>>>> ...
>>>> 05:00.0 0300: 1002:15d8 (rev c2)
>>>> Subsystem: 1025:1456
>>>> Kernel driver in use: amdgpu
>>>> Kernel modules: amdgpu
>>>> ...
>>> thanks for informing us of this regression. Since there are four commi=
ts affecting
>>> amdgpu in 5.15.150, i suggest that you use "git bisect" to find the fa=
ulty commits,
>>> see https://docs.kernel.org/admin-guide/bug-bisect.html for details.
>>>
>>> I think you can speed up the bisecting process by limiting yourself to=
 the AMD DRM
>>> driver directory with "git bisect start -- drivers/gpu/drm/amd", take =
a look at the
>>> man page of "git bisect" for details.
>>>
>>> Thanks,
>>> Armin Wolf
>> Armin,
>> Thanks for the advice. I am unfamiliar with git on the commandline.
>> Previously only used SmartGit gui.
>> EasyOS requires aufs patch, and for a few days tried to figure out how
>> to use that with git bisect, then gave up. Changed to testing with my
>> "QV" distro, which is more conventional, doesn't need any kernel
>> patches. Managed to get it down to one commit. Here are the steps I
>> followed:
>>
>> # git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable.git
>> # cd linux-stable
>> # git tag -l | grep '5\.15\.150'
>> v5.15.150
>> # git checkout -b my5.15.150 v5.15.150
>> Updating files: 100% (65776/65776), done.
>> Switched to a new branch 'my5.15.150'
>>
>> Copied in my .config then...
>>
>> # make menuconfig
>> # git bisect start -- drivers/gpu/drm/amd
>> # git bisect bad
>> # git bisect good v5.15.149
>> Bisecting: 1 revision left to test after this (roughly 1 step)
>> [b9a61ee2bb2704e42516e3da962f99dfa98f3b20] drm/amdgpu: reset gpu for
>> s3 suspend abort case
>> # make
>> # rm -rf /boot2
>> # mkdir -p /boot2/lib/modules
>> # make INSTALL_MOD_STRIP=3D1 INSTALL_MOD_PATH=3D/boot2 modules_install
>> # cp arch/x86/boot/bzImage /boot2/vmlinuz
>> # sync
>> ...QV on Acer laptop, with amdgpu, works!
>> # git bisect good
>> Bisecting: 0 revisions left to test after this (roughly 0 steps)
>> [56b522f4668167096a50c39446d6263c96219f5f] drm/amdgpu: init iommu
>> after amdkfd device init
>> # make
>> # mkdir -p /boot2/lib/modules
>> # make INSTALL_MOD_STRIP=3D1 INSTALL_MOD_PATH=3D/boot2 modules_install
>> # cp arch/x86/boot/bzImage /boot2/vmlinuz
>> # sync
>> ...QV on Acer laptop, black screen!
>>
>> # git bisect bad
>> 56b522f4668167096a50c39446d6263c96219f5f is the first bad commit
>> commit 56b522f4668167096a50c39446d6263c96219f5f
>> Author: Yifan Zhang <yifan1.zhang@amd.com>
>> Date:   Tue Sep 28 15:42:35 2021 +0800
>>
>>      drm/amdgpu: init iommu after amdkfd device init
>>
>>      [ Upstream commit 286826d7d976e7646b09149d9bc2899d74ff962b ]
>>
>>      This patch is to fix clinfo failure in Raven/Picasso:
>>
>>      Number of platforms: 1
>>        Platform Profile: FULL_PROFILE
>>        Platform Version: OpenCL 2.2 AMD-APP (3364.0)
>>        Platform Name: AMD Accelerated Parallel Processing
>>        Platform Vendor: Advanced Micro Devices, Inc.
>>        Platform Extensions: cl_khr_icd cl_amd_event_callback
>>
>>        Platform Name: AMD Accelerated Parallel Processing Number of dev=
ices: 0
>>
>>      Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
>>      Reviewed-by: James Zhu <James.Zhu@amd.com>
>>      Tested-by: James Zhu <James.Zhu@amd.com>
>>      Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>      Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> Anything else I should do, to identify what in this commit is the
>> likely culprit?
>> Regards,
>> Barry Kauler
