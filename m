Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2C4B1D98E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 16:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A3110E857;
	Thu,  7 Aug 2025 14:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="D7QTwNgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 15129 seconds by postgrey-1.36 at gabe;
 Thu, 07 Aug 2025 14:00:05 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id F25E010E857;
 Thu,  7 Aug 2025 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
 Content-Type; bh=9OMvaYlsQB9ei2gTa3pF2fpkA5fWBtdzVs9cRC7eYOU=;
 b=D7QTwNgNaOVe3GVLvX6AtSxJf5EqC4dpRGva/j5SLMNOAQ57kjYkgcwKSvTyDk
 UOtnjZy68TdNKh6FCGs8kzFRdcMBemiO5l3dMg80qj4rG70l0ZlQC7/Ni7VuGsnl
 9qNA7doBwcY6UTk3IAB11qXC4vrbzf45zXgaWOXvppQTc=
Received: from [192.168.124.10] (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wAHFxRRsZRo5XRsAQ--.41128S2; 
 Thu, 07 Aug 2025 21:59:47 +0800 (CST)
Message-ID: <ebff64f6-14dd-4f98-aac4-ad72a83db18b@163.com>
Date: Thu, 7 Aug 2025 21:59:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: skip disabling audio when device is unplugged
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Alexandre Demers <alexandre.f.demers@gmail.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250807094719.56145-1-oushixiong1025@163.com>
 <9a632900-4ebb-40af-8bf8-bf55f8e25c7b@amd.com>
 <c6cc5a81-ed5a-474d-bd2f-29d1cfde34e2@163.com>
 <93561b1e-0410-4e21-804a-bcaa8f2585a7@amd.com>
From: oushixiong <oushixiong1025@163.com>
In-Reply-To: <93561b1e-0410-4e21-804a-bcaa8f2585a7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAHFxRRsZRo5XRsAQ--.41128S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF1kJr1rWFyDAFyfGr4DJwb_yoWrWr1fpr
 1rJ3WYkw4UZw4Uta1IvasrXFnYyay7W3WrurWxJr1fWayqyr95Xa48tF18uryDJrWq9F42
 q343Ary7ZFn0qF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5DGOUUUUU=
X-Originating-IP: [120.228.96.115]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXBCiD2iUrr0pPAAAsb
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

Thanks, I get it.

Regards,
Shixiong Ou

在 2025/8/7 21:24, Christian König 写道:
> On 07.08.25 15:01, oushixiong wrote:
>> Should we move audio disabling to hw_fini()?
> Yes and when you look at the patch Alex pointed out that is pretty much exactly what it does.
>
> So still good catch from your side, but a fix is already in the pipeline.
>
> Regards,
> Christian.
>
>> Regards,
>> Shixiong Ou.
>>
>>
>> 在 2025/8/7 18:03, Christian König 写道:
>>> On 07.08.25 11:47, oushixiong1025@163.com wrote:
>>>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>>>
>>>> When Stopping lightdm and removing amdgpu driver are executed, the following
>>>> error is triggered probably:
>>>>
>>>> Unable to handle kernel paging request at virtual address 0000000000005e00
>>>> .....
>>>> [ 2] [T10084] Call trace:
>>>> [ 2] [T10084]  amdgpu_device_wreg.part.0+0x58/0x110 [amdgpu]
>>>> [ 2] [T10084]  amdgpu_device_wreg+0x20/0x38 [amdgpu]
>>>> [ 2] [T10084]  dce_v6_0_audio_endpt_wreg+0x64/0xd8 [amdgpu]
>>>> [ 2] [T10084]  dce_v6_0_sw_fini+0xa0/0x118 [amdgpu]
>>>> [ 2] [T10084]  amdgpu_device_ip_fini.isra.0+0xdc/0x1e8 [amdgpu]
>>>> [ 2] [T10084]  amdgpu_device_fini_sw+0x2c/0x220 [amdgpu]
>>>> [ 2] [T10084]  amdgpu_driver_release_kms+0x20/0x40 [amdgpu]
>>>> [ 2] [T10084]  devm_drm_dev_init_release+0x8c/0xc0 [drm]
>>>> [ 2] [T10084]  devm_action_release+0x18/0x28
>>>> [ 2] [T10084]  release_nodes+0x5c/0xc8
>>>> [ 2] [T10084]  devres_release_all+0xa0/0x130
>>>> [ 2] [T10084]  device_unbind_cleanup+0x1c/0x70
>>>> [ 2] [T10084]  device_release_driver_internal+0x1e4/0x228
>>>> [ 2] [T10084]  driver_detach+0x90/0x100
>>>> [ 2] [T10084]  bus_remove_driver+0x74/0x100
>>>> [ 2] [T10084]  driver_unregister+0x34/0x68
>>>> [ 2] [T10084]  pci_unregister_driver+0x24/0x108
>>>> [ 2] [T10084]  amdgpu_exit+0x1c/0x3270 [amdgpu]
>>>> [ 2] [T10084]  __do_sys_delete_module.constprop.0+0x1d0/0x330
>>>> [ 2] [T10084]  __arm64_sys_delete_module+0x18/0x28
>>>> [ 2] [T10084]  invoke_syscall+0x4c/0x120
>>>> [ 2] [T10084]  el0_svc_common.constprop.0+0xc4/0xf0
>>>> [ 2] [T10084]  do_el0_svc+0x24/0x38
>>>> [ 2] [T10084]  el0_svc+0x24/0x88
>>>> [ 2] [T10084]  el0t_64_sync_handler+0x134/0x150
>>>> [ 2] [T10084]  el0t_64_sync+0x14c/0x150
>>>> [ 2] [T10084] Code: f9401bf7 f9453e60 8b150000 d50332bf (b9000016)
>>>> [ 2] [T10084] ---[ end trace 0000000000000000 ]---
>>>>
>>>> The adev->rmmio has been unmmaped in amdgpu_device_fini_hw().
>>>>
>>>> So skip disabling audio when device is unplugged.
>>>>
>>>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>>>> index 276c025c4c03..48b29990da7f 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>>>> @@ -23,6 +23,7 @@
>>>>      #include <linux/pci.h>
>>>>    +#include <drm/drm_drv.h>
>>>>    #include <drm/drm_edid.h>
>>>>    #include <drm/drm_fourcc.h>
>>>>    #include <drm/drm_modeset_helper.h>
>>>> @@ -1459,8 +1460,10 @@ static void dce_v6_0_audio_fini(struct amdgpu_device *adev)
>>>>        if (!adev->mode_info.audio.enabled)
>>>>            return;
>>>>    -    for (i = 0; i < adev->mode_info.audio.num_pins; i++)
>>>> -        dce_v6_0_audio_enable(adev, &adev->mode_info.audio.pin[i], false);
>>>> +    if (!drm_dev_is_unplugged(adev_to_drm(adev))) {
>>> Good catch, but that looks like a workaround for something done in the wrong place.
>>>
>>> A *_sw_fini() function should not enable/disable HW.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> +        for (i = 0; i < adev->mode_info.audio.num_pins; i++)
>>>> +            dce_v6_0_audio_enable(adev, &adev->mode_info.audio.pin[i], false);
>>>> +    }
>>>>          adev->mode_info.audio.enabled = false;
>>>>    }

