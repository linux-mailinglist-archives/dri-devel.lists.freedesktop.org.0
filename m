Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B01A8CD7F8
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 17:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9C910E446;
	Thu, 23 May 2024 15:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="M5lX2l1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9217610E446;
 Thu, 23 May 2024 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1716479980; x=1717084780; i=w_armin@gmx.de;
 bh=5HlhaVisKVamffaEv++/huqUeNpWkHnMVrAo9Vu5FM4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=M5lX2l1zdQ0DVY4ZX3AYBb7/XGrnLWCkWD++L+5Mh364U+dAwszes5rBWAHhb0LU
 hh8iqZuoX4RQwFOBLADau9g4MtofAlxBYwTI5wVmHD2WEPfUvYSmqLRoryxhBRfvp
 ZJvkPFEyOFUh9/RSobysd7vZNP53MFvmVXmxMOVHhrt8CmEGKMsjEjZw5YsQKFFiw
 +dmYdHqmCCSGDGqFhnjq5u/q+nmhe6/jghzIoTtMocr+hl9JIqt+mX+CccpohqHbA
 qkPq5GVtxmIT3xLMQVgCvbzDfThXmbWbdc0aoaQTR6s2bQsz2l7ljvwmbnowKIJNM
 Qa3Y9nVPA+QTP2SB4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26r3-1s7hsQ434b-002WSG; Thu, 23
 May 2024 17:59:40 +0200
Message-ID: <7ec6faf8-d9c1-436b-98c8-473e7ff395b3@gmx.de>
Date: Thu, 23 May 2024 17:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 5.15.150 black screen with AMD Raven/Picasso GPU
To: Barry Kauler <bkauler@gmail.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, Yifan Zhang <yifan1.zhang@amd.com>, 
 Prike Liang <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, stable@vger.kernel.org
References: <CABWT5yiejGABNXicsS7u-daKnBBjK6YTDVgaQOqwGYn8P20D8Q@mail.gmail.com>
 <6580c2d4-b084-470f-80a0-aa09f1ab880d@gmx.de>
 <CABWT5yiD110qmJcRsoGVMevULAVmYpyiW4w9MtmNjp7E0rDQ8A@mail.gmail.com>
 <CABWT5yg5jG7eMiDp7QN2yhFj6983qF9zN7eHOprH4eEjwQJLBQ@mail.gmail.com>
 <c3205455-7ad2-487e-8954-52102754e154@gmx.de>
 <CADnq5_PM_FuBE4913Z4bxiMTDYtRS+VJgLW6gfDU1qnQQ=FDzA@mail.gmail.com>
 <d04105ea-0f8a-4f0b-b4f2-bc8407d37c73@gmx.de>
 <CABWT5yibc52CTUWeCWxYQb4ooi4dsbvBWxJAJCDrG+8405RPTg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CABWT5yibc52CTUWeCWxYQb4ooi4dsbvBWxJAJCDrG+8405RPTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CVQLpDXT0By1e1CKa7ZKRSdTDbToVGPsmA1swDIrsMgbDvIgOnm
 A8IorigLyklbt88BuOCoEUW44dXLQsEj8Q7WdnQEs2oT+Joq7xFk+z7169OAlqkSnkZj1v5
 hu8Uy3uIgleKNiwF+mX7vVLn9EvAQLLakcvs3fp9gZtgJkXkj3N4Yv/+S/xmxDTDfm3Wvp5
 McLAPWg3QLQoKaYeRmCrQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LyOt50Zb6uE=;Y0lrtnAFTLe7AUTa5lDL3W/j1q3
 mfdL9yhqEDHyrUhmnsCYERnAKW51ZY/wR3qX3a9rP7ab5MoQGuY3stPuHs/7mTalTwUmKhmXm
 hRR93mb1Z/ckWsUHzc1vxDrVs8ySbgBGSDDOZal1+8Uo9uaZHztkh07YF9NKiwr5lKBxd1rI8
 te3735+nKLugtUFxpveTLVoM9Wh2IzKU+g9TI0iyi1I63s2ngw2EOLFQ9K3JMt/k5TA3waSmc
 8n6vzOVxs0u7mZ7kuvbVmusj9W9AoOVMBpZkyo7ayEa33Vt/aIUSdDPwIO/tjiaL2mvp5DL8r
 G7+g/gY/Dj+3wkxhMMY3/XOk0JUjBL+WajYYc0VbVvfF0VzLSecZKpRbyzRqdxBGAYhsfDd4+
 HxIby+76l7QjyAW7aca9MBvnOvAt/rnOyeawdV3FxHfqva3v730F0cg3p0Hd+sTH/53fU9PsQ
 YJVUDHgamFB1NJMcS3UXN23r4x0vsWUv3pFX0HfNLO6mgRAdu+8vksRQ54kAPwGfKUbz+fRiE
 hLaL/nHbMMAmthPKzx7oVPkxbmuXiXA15EEsmyyc0C/u438Di/0zW9c0PAcrpfQnFsm5foKw0
 hbJProOvIpIXpyeGkMiUedtnLkVib6px8D5I7QY5zNDpAgfJ1hNW+l0bU4pZu0CKkAh9VqhEE
 TKS9QQIUpTYo0MlCsiITqt6NwORlWB7fwKmGn9Lr6drqZcNnHNEHsX1S8yKgTqvOLTwVw604x
 JLrvmtmr0S79J9yIO29K8AKfhVD5D/yJhMlFXRA6Yj2E+pTLmhQi7gxk8Rawk/TJqn2tjfCj5
 J+qII7Q5fQ4DoBnKK/hIYxoO5tGF2P0ur+3cGq01bq9d8=
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

Am 23.05.24 um 15:13 schrieb Barry Kauler:

> On Wed, May 22, 2024 at 12:58=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wro=
te:
>> Am 20.05.24 um 18:22 schrieb Alex Deucher:
>>
>>> On Sat, May 18, 2024 at 8:17=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wr=
ote:
>>>> Am 17.05.24 um 03:30 schrieb Barry Kauler:
>>>>
>>>>> Armin, Yifan, Prike,
>>>>> I will top-post, so you don't have to scroll down.
>>>>> After identifying the commit that causes black screen with my gpu, I
>>>>> posted the result to you guys, on May 9.
>>>>> It is now May 17 and no reply.
>>>>> OK, I have now created a patch that reverts Yifan's commit, compiled
>>>>> 5.15.158, and my gpu now works.
>>>>> Note, the radeon module is not loaded, so it is not a factor.
>>>>> I'm not a kernel developer. I have identified the culprit and it is =
up
>>>>> to you guys to fix it, Yifan especially, as you are the person who h=
as
>>>>> created the regression.
>>>>> I will attach my patch.
>>>>> Regards,
>>>>> Barry Kauler
>>>> Hi,
>>>>
>>>> sorry for not responding to your findings. I normally do not work wit=
h GPU drivers,
>>>> so i hoped one of the amdgpu developers would handle this.
>>>>
>>>> I CCeddri-devel@lists.freedesktop.org  and amd-gfx@lists.freedesktop.=
org so that other
>>>> amdgpu developers hear from this issue.
>>>>
>>>> Thanks you for you persistence in finding the offending commit.
>>> Likely this patch should not have been ported to 5.15 in the first
>>> place.  The IOMMU requirements have been dropped from the driver for
>>> the last few kernel versions so it is no longer relevant on newer
>>> kernels.
>>>
>>> Alex
>> Barry, can you verify that the latest upstream kernel works on you devi=
ce?
>> If yes, then the commit itself is ok and just the backporting itself wa=
s wrong.
>>
>> Thanks,
>> Armin Wolf
> Armin,
> The unmodified 6.8.1 kernel works ok.
> I presume that patch was applied long before 6.8.1 got released and
> only got backported to 5.15.x recently.
>
> Regards,
> Barry
>
Great to hear, that means we only have to revert commit 56b522f46681 ("drm=
/amdgpu: init iommu after amdkfd device init")
from the 5.15.y series.

I CCed the stable mailing list so that they can revert the offending commi=
t.

Thanks,
Armin Wolf

>>>> Armin Wolf
>>>>
>>>>> On Thu, May 9, 2024 at 4:08=E2=80=AFPM Barry Kauler <bkauler@gmail.c=
om> wrote:
>>>>>> On Fri, May 3, 2024 at 9:03=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> =
wrote:
>>>>>>>> ...
>>>>>>>> # lspci | grep VGA
>>>>>>>> 05:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
>>>>>>>> [AMD/ATI] Picasso/Raven 2 [Radeon Vega Series / Radeon Vega Mobil=
e
>>>>>>>> Series] (rev c2)
>>>>>>>> 05:00.7 Non-VGA unclassified device: Advanced Micro Devices, Inc.
>>>>>>>> [AMD] Raven/Raven2/Renoir Non-Sensor Fusion Hub KMDF driver
>>>>>>>>
>>>>>>>> # lspci -n -k
>>>>>>>> ...
>>>>>>>> 05:00.0 0300: 1002:15d8 (rev c2)
>>>>>>>> Subsystem: 1025:1456
>>>>>>>> Kernel driver in use: amdgpu
>>>>>>>> Kernel modules: amdgpu
>>>>>>>> ...
>>>>>>> thanks for informing us of this regression. Since there are four c=
ommits affecting
>>>>>>> amdgpu in 5.15.150, i suggest that you use "git bisect" to find th=
e faulty commits,
>>>>>>> see https://docs.kernel.org/admin-guide/bug-bisect.html for detail=
s.
>>>>>>>
>>>>>>> I think you can speed up the bisecting process by limiting yoursel=
f to the AMD DRM
>>>>>>> driver directory with "git bisect start -- drivers/gpu/drm/amd", t=
ake a look at the
>>>>>>> man page of "git bisect" for details.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Armin Wolf
>>>>>> Armin,
>>>>>> Thanks for the advice. I am unfamiliar with git on the commandline.
>>>>>> Previously only used SmartGit gui.
>>>>>> EasyOS requires aufs patch, and for a few days tried to figure out =
how
>>>>>> to use that with git bisect, then gave up. Changed to testing with =
my
>>>>>> "QV" distro, which is more conventional, doesn't need any kernel
>>>>>> patches. Managed to get it down to one commit. Here are the steps I
>>>>>> followed:
>>>>>>
>>>>>> # git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/li=
nux-stable.git
>>>>>> # cd linux-stable
>>>>>> # git tag -l | grep '5\.15\.150'
>>>>>> v5.15.150
>>>>>> # git checkout -b my5.15.150 v5.15.150
>>>>>> Updating files: 100% (65776/65776), done.
>>>>>> Switched to a new branch 'my5.15.150'
>>>>>>
>>>>>> Copied in my .config then...
>>>>>>
>>>>>> # make menuconfig
>>>>>> # git bisect start -- drivers/gpu/drm/amd
>>>>>> # git bisect bad
>>>>>> # git bisect good v5.15.149
>>>>>> Bisecting: 1 revision left to test after this (roughly 1 step)
>>>>>> [b9a61ee2bb2704e42516e3da962f99dfa98f3b20] drm/amdgpu: reset gpu fo=
r
>>>>>> s3 suspend abort case
>>>>>> # make
>>>>>> # rm -rf /boot2
>>>>>> # mkdir -p /boot2/lib/modules
>>>>>> # make INSTALL_MOD_STRIP=3D1 INSTALL_MOD_PATH=3D/boot2 modules_inst=
all
>>>>>> # cp arch/x86/boot/bzImage /boot2/vmlinuz
>>>>>> # sync
>>>>>> ...QV on Acer laptop, with amdgpu, works!
>>>>>> # git bisect good
>>>>>> Bisecting: 0 revisions left to test after this (roughly 0 steps)
>>>>>> [56b522f4668167096a50c39446d6263c96219f5f] drm/amdgpu: init iommu
>>>>>> after amdkfd device init
>>>>>> # make
>>>>>> # mkdir -p /boot2/lib/modules
>>>>>> # make INSTALL_MOD_STRIP=3D1 INSTALL_MOD_PATH=3D/boot2 modules_inst=
all
>>>>>> # cp arch/x86/boot/bzImage /boot2/vmlinuz
>>>>>> # sync
>>>>>> ...QV on Acer laptop, black screen!
>>>>>>
>>>>>> # git bisect bad
>>>>>> 56b522f4668167096a50c39446d6263c96219f5f is the first bad commit
>>>>>> commit 56b522f4668167096a50c39446d6263c96219f5f
>>>>>> Author: Yifan Zhang <yifan1.zhang@amd.com>
>>>>>> Date:   Tue Sep 28 15:42:35 2021 +0800
>>>>>>
>>>>>>        drm/amdgpu: init iommu after amdkfd device init
>>>>>>
>>>>>>        [ Upstream commit 286826d7d976e7646b09149d9bc2899d74ff962b ]
>>>>>>
>>>>>>        This patch is to fix clinfo failure in Raven/Picasso:
>>>>>>
>>>>>>        Number of platforms: 1
>>>>>>          Platform Profile: FULL_PROFILE
>>>>>>          Platform Version: OpenCL 2.2 AMD-APP (3364.0)
>>>>>>          Platform Name: AMD Accelerated Parallel Processing
>>>>>>          Platform Vendor: Advanced Micro Devices, Inc.
>>>>>>          Platform Extensions: cl_khr_icd cl_amd_event_callback
>>>>>>
>>>>>>          Platform Name: AMD Accelerated Parallel Processing Number =
of devices: 0
>>>>>>
>>>>>>        Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
>>>>>>        Reviewed-by: James Zhu <James.Zhu@amd.com>
>>>>>>        Tested-by: James Zhu <James.Zhu@amd.com>
>>>>>>        Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>>        Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>        Signed-off-by: Sasha Levin <sashal@kernel.org>
>>>>>>
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
>>>>>>     1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> Anything else I should do, to identify what in this commit is the
>>>>>> likely culprit?
>>>>>> Regards,
>>>>>> Barry Kauler
