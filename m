Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B68CB28E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 18:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B1410E166;
	Tue, 21 May 2024 16:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="Mh6pHEyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B374310E166;
 Tue, 21 May 2024 16:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1716310696; x=1716915496; i=w_armin@gmx.de;
 bh=Ms/zIrzl5yOvhmDxuDCcGJGG49R0KscBWVcfdO7wNvk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Mh6pHEylfmRxvT/Cg/u1135aMbkKAOz6/SXuo5pbAEVkyrX+rdxopi/JkYTx4e1h
 Obr6agwVQDeGV2YwCyfS9xFQIUuWFmXZb2/q6Ii9iG97BSXDp1H019ckPShlOF4Fk
 D667NijcqkmPI5mGUNmG7qixChLyw9aM48HNSEIcBzzwT8kBeyj+2Z7xv9QYP0kJO
 cB4EXrvaI+sHkfN7BHxDvb8/3rXpzxO9+i7/S7hWOhKAJIJAnnwcnXy3pjax3TTtV
 8iX5iYzNsti9mvZ1qPVthbT2ky3rBoYAaqkMsHgVYo2phD/VZaiTZvLSsbdpUBFfw
 bPIJZoyl0Fzpik2ABg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f9h-1s706h1dhH-000ujx; Tue, 21
 May 2024 18:58:16 +0200
Message-ID: <d04105ea-0f8a-4f0b-b4f2-bc8407d37c73@gmx.de>
Date: Tue, 21 May 2024 18:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 5.15.150 black screen with AMD Raven/Picasso GPU
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Barry Kauler <bkauler@gmail.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Prike Liang <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org
References: <CABWT5yiejGABNXicsS7u-daKnBBjK6YTDVgaQOqwGYn8P20D8Q@mail.gmail.com>
 <6580c2d4-b084-470f-80a0-aa09f1ab880d@gmx.de>
 <CABWT5yiD110qmJcRsoGVMevULAVmYpyiW4w9MtmNjp7E0rDQ8A@mail.gmail.com>
 <CABWT5yg5jG7eMiDp7QN2yhFj6983qF9zN7eHOprH4eEjwQJLBQ@mail.gmail.com>
 <c3205455-7ad2-487e-8954-52102754e154@gmx.de>
 <CADnq5_PM_FuBE4913Z4bxiMTDYtRS+VJgLW6gfDU1qnQQ=FDzA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CADnq5_PM_FuBE4913Z4bxiMTDYtRS+VJgLW6gfDU1qnQQ=FDzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:riRQ/6nrB6lhMVdgxf1lnHLHTuUmXaNQAX3pjgP/QZ+UB+aV0H5
 mgGIG+fKsRHLPTRUSaBugCSonrzkmUlznFv8DuKBWPMQFKn/8e68as48f4Sd0gdUZSeUa6u
 R4blnANdgX/MMf7sPJ9M1PGJVVwG2uoTXgGrOcmkncBWy3bjGevL7Ql3dIpp4nAk+tCPcw1
 h1PuH52exPOzkDLbo6wHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4woLhGxGYg8=;r+egAWGT7cVzDmKL0ggim2QRhXt
 98XeZBQUD5ipQUENX3oSNqRGeIppynHxs8/AkbgfXCLEK5aHZuYUpsTA02s+2XZaaQylVyrDN
 U6KXeQHOKGHjOOyE1Je9AYx9LMO/727fONehxC3ziqUTacgnJFoCURxK3+ofeaT2LkUiUIFmC
 fA1nGXXPmag2y3wY+yor+T6NHrjcdHeQ+HI+jZt/UymjJviGZR73UKqx6fxjLG58Jb7kN4ZbR
 1WyRn0UKIxeKCr/R6h8vnZvHWpdIE1PdDDnRdHXfXghdAN8I3oT46q0BBka4jd5cx0i9oidKn
 HwYUXo5Lc/0o0xSx10hjcxDpZ3EgFgd+ceId6tAvQ5nMxykvNmRlUJL3HK3X2AaOzskAhQNvd
 Z55esP5F89n9GbWxz+1TzC6+00aBV3dHNg9tGht9fhnNHO9I+adrhILuq3OzHJNnKWTrRDYUw
 vubDg5NVLIYZHvO0dczpoCrnQD6nPGhWgasvUF7f7se/XdcVi6gK9OxS9LLFUUbzem6buWhXp
 5BMTlCY8Gf8DUSH0rphJvQ/yNmUhJl+FhW46TbseUBJGwHbI0jv0U7lvGRWI64nB7s+Ll5pY3
 m7Nd1lTfJc5JaMkzYhN/9Rzp0IQ2/zdux8TS02+rC8tn77utQeSM1KtwHJlcp1ZFtbioJx2dl
 2bf4d6ZCbarBkClwqsv+dXbPCHl6Fa2BrY4dd4mr+Px2BgK+P5Cw18ufZthUga2ujhwoupblZ
 zkRIYLBXSarYS/b4jGhEsviJPsyEGhMuuNgOhRRTItIYYe4Q4XNRlIWLJqqhn64uzQuWDJTow
 a7+hpSWFHAjilSN9G/c7mJJ9flPawWEaVKTUR27IlScBc=
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

Am 20.05.24 um 18:22 schrieb Alex Deucher:

> On Sat, May 18, 2024 at 8:17=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 17.05.24 um 03:30 schrieb Barry Kauler:
>>
>>> Armin, Yifan, Prike,
>>> I will top-post, so you don't have to scroll down.
>>> After identifying the commit that causes black screen with my gpu, I
>>> posted the result to you guys, on May 9.
>>> It is now May 17 and no reply.
>>> OK, I have now created a patch that reverts Yifan's commit, compiled
>>> 5.15.158, and my gpu now works.
>>> Note, the radeon module is not loaded, so it is not a factor.
>>> I'm not a kernel developer. I have identified the culprit and it is up
>>> to you guys to fix it, Yifan especially, as you are the person who has
>>> created the regression.
>>> I will attach my patch.
>>> Regards,
>>> Barry Kauler
>> Hi,
>>
>> sorry for not responding to your findings. I normally do not work with =
GPU drivers,
>> so i hoped one of the amdgpu developers would handle this.
>>
>> I CCeddri-devel@lists.freedesktop.org  and amd-gfx@lists.freedesktop.or=
g so that other
>> amdgpu developers hear from this issue.
>>
>> Thanks you for you persistence in finding the offending commit.
> Likely this patch should not have been ported to 5.15 in the first
> place.  The IOMMU requirements have been dropped from the driver for
> the last few kernel versions so it is no longer relevant on newer
> kernels.
>
> Alex

Barry, can you verify that the latest upstream kernel works on you device?
If yes, then the commit itself is ok and just the backporting itself was w=
rong.

Thanks,
Armin Wolf

>> Armin Wolf
>>
>>> On Thu, May 9, 2024 at 4:08=E2=80=AFPM Barry Kauler <bkauler@gmail.com=
> wrote:
>>>> On Fri, May 3, 2024 at 9:03=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wr=
ote:
>>>>>> ...
>>>>>> # lspci | grep VGA
>>>>>> 05:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
>>>>>> [AMD/ATI] Picasso/Raven 2 [Radeon Vega Series / Radeon Vega Mobile
>>>>>> Series] (rev c2)
>>>>>> 05:00.7 Non-VGA unclassified device: Advanced Micro Devices, Inc.
>>>>>> [AMD] Raven/Raven2/Renoir Non-Sensor Fusion Hub KMDF driver
>>>>>>
>>>>>> # lspci -n -k
>>>>>> ...
>>>>>> 05:00.0 0300: 1002:15d8 (rev c2)
>>>>>> Subsystem: 1025:1456
>>>>>> Kernel driver in use: amdgpu
>>>>>> Kernel modules: amdgpu
>>>>>> ...
>>>>> thanks for informing us of this regression. Since there are four com=
mits affecting
>>>>> amdgpu in 5.15.150, i suggest that you use "git bisect" to find the =
faulty commits,
>>>>> see https://docs.kernel.org/admin-guide/bug-bisect.html for details.
>>>>>
>>>>> I think you can speed up the bisecting process by limiting yourself =
to the AMD DRM
>>>>> driver directory with "git bisect start -- drivers/gpu/drm/amd", tak=
e a look at the
>>>>> man page of "git bisect" for details.
>>>>>
>>>>> Thanks,
>>>>> Armin Wolf
>>>> Armin,
>>>> Thanks for the advice. I am unfamiliar with git on the commandline.
>>>> Previously only used SmartGit gui.
>>>> EasyOS requires aufs patch, and for a few days tried to figure out ho=
w
>>>> to use that with git bisect, then gave up. Changed to testing with my
>>>> "QV" distro, which is more conventional, doesn't need any kernel
>>>> patches. Managed to get it down to one commit. Here are the steps I
>>>> followed:
>>>>
>>>> # git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x-stable.git
>>>> # cd linux-stable
>>>> # git tag -l | grep '5\.15\.150'
>>>> v5.15.150
>>>> # git checkout -b my5.15.150 v5.15.150
>>>> Updating files: 100% (65776/65776), done.
>>>> Switched to a new branch 'my5.15.150'
>>>>
>>>> Copied in my .config then...
>>>>
>>>> # make menuconfig
>>>> # git bisect start -- drivers/gpu/drm/amd
>>>> # git bisect bad
>>>> # git bisect good v5.15.149
>>>> Bisecting: 1 revision left to test after this (roughly 1 step)
>>>> [b9a61ee2bb2704e42516e3da962f99dfa98f3b20] drm/amdgpu: reset gpu for
>>>> s3 suspend abort case
>>>> # make
>>>> # rm -rf /boot2
>>>> # mkdir -p /boot2/lib/modules
>>>> # make INSTALL_MOD_STRIP=3D1 INSTALL_MOD_PATH=3D/boot2 modules_instal=
l
>>>> # cp arch/x86/boot/bzImage /boot2/vmlinuz
>>>> # sync
>>>> ...QV on Acer laptop, with amdgpu, works!
>>>> # git bisect good
>>>> Bisecting: 0 revisions left to test after this (roughly 0 steps)
>>>> [56b522f4668167096a50c39446d6263c96219f5f] drm/amdgpu: init iommu
>>>> after amdkfd device init
>>>> # make
>>>> # mkdir -p /boot2/lib/modules
>>>> # make INSTALL_MOD_STRIP=3D1 INSTALL_MOD_PATH=3D/boot2 modules_instal=
l
>>>> # cp arch/x86/boot/bzImage /boot2/vmlinuz
>>>> # sync
>>>> ...QV on Acer laptop, black screen!
>>>>
>>>> # git bisect bad
>>>> 56b522f4668167096a50c39446d6263c96219f5f is the first bad commit
>>>> commit 56b522f4668167096a50c39446d6263c96219f5f
>>>> Author: Yifan Zhang <yifan1.zhang@amd.com>
>>>> Date:   Tue Sep 28 15:42:35 2021 +0800
>>>>
>>>>       drm/amdgpu: init iommu after amdkfd device init
>>>>
>>>>       [ Upstream commit 286826d7d976e7646b09149d9bc2899d74ff962b ]
>>>>
>>>>       This patch is to fix clinfo failure in Raven/Picasso:
>>>>
>>>>       Number of platforms: 1
>>>>         Platform Profile: FULL_PROFILE
>>>>         Platform Version: OpenCL 2.2 AMD-APP (3364.0)
>>>>         Platform Name: AMD Accelerated Parallel Processing
>>>>         Platform Vendor: Advanced Micro Devices, Inc.
>>>>         Platform Extensions: cl_khr_icd cl_amd_event_callback
>>>>
>>>>         Platform Name: AMD Accelerated Parallel Processing Number of =
devices: 0
>>>>
>>>>       Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
>>>>       Reviewed-by: James Zhu <James.Zhu@amd.com>
>>>>       Tested-by: James Zhu <James.Zhu@amd.com>
>>>>       Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>       Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>       Signed-off-by: Sasha Levin <sashal@kernel.org>
>>>>
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> Anything else I should do, to identify what in this commit is the
>>>> likely culprit?
>>>> Regards,
>>>> Barry Kauler
