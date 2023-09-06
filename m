Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE407937BA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B39A10E5AE;
	Wed,  6 Sep 2023 09:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id CBE3D10E1A5;
 Wed,  6 Sep 2023 09:08:14 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxVuh8Qfhk0EAgAA--.29532S3;
 Wed, 06 Sep 2023 17:08:12 +0800 (CST)
Received: from [0.0.0.0] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxvM56QfhkpFxuAA--.3166S3; 
 Wed, 06 Sep 2023 17:08:10 +0800 (CST)
Message-ID: <b51d49f3-e3de-6b8d-9cb4-df5c03f3cdc0@loongson.cn>
Date: Wed, 6 Sep 2023 17:08:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxvM56QfhkpFxuAA--.3166S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxArWruw1kuFW8Ar4UKF1xJFc_yoWrJw1rpF
 4YqFyUtr4kGr1rAr4Skw48WFZ5AFsFqFy5GF1vgr1Fv398Xr1Fvr9rtF4UCa4UXrn7Z3W0
 9rWFqrW7GF4DZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
 Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUU
 U==
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/9/6 14:45, Christian König wrote:
> Am 05.09.23 um 15:30 schrieb suijingfeng:
>> Hi,
>>
>>
>> On 2023/9/5 18:45, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 04.09.23 um 21:57 schrieb Sui Jingfeng:
>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>
>>>> On a machine with multiple GPUs, a Linux user has no control over 
>>>> which
>>>> one is primary at boot time. This series tries to solve above 
>>>> mentioned
>>>
>>> If anything, the primary graphics adapter is the one initialized by 
>>> the firmware. I think our boot-up graphics also make this assumption 
>>> implicitly.
>>>
>>
>> Yes, but by the time of DRM drivers get loaded successfully,the 
>> boot-up graphics already finished.
>
> This is an incorrect assumption.
>
> drm_aperture_remove_conflicting_pci_framebuffers() and co don't kill 
> the framebuffer, 

Well, my original description to this technique point is that

1) "Firmware framebuffer device already get killed by the drm_aperture_remove_conflicting_pci_framebuffers() function (or its siblings)"
2) "By the time of DRM drivers get loaded successfully, the boot-up graphics already finished."

The word "killed" here is rough and coarse description about
how does the drm device driver take over the firmware framebuffer.
Since there seems have something obscure our communication,
lets make the things clear. See below for more elaborate description.


> they just remove the current framebuffer driver to avoid further updates.
>
This statement doesn't sound right, for UEFI environment,
a correct description is that they remove the platform device, not the framebuffer driver.
For the machines with the UEFI firmware, framebuffer driver here definitely refer to the efifb.
The efifb still reside in the system(linux kernel).

Please see the aperture_detach_platform_device() function in video/aperture.c

> So what happens (at least for amdgpu) is that we take over the 
> framebuffer,

This statement here is also not an accurate description.

Strictly speaking, drm/amdgpu takes over the device (the VRAM hardware),
not the framebuffer.

The word "take over" here is also dubious, because drm/amdgpu takes over nothing.

 From the perspective of device-driver model, the GPU hardware *belongs* to the amdgpu drivers.
Why you need to take over a thing originally and belong to you?

If you could build the drm/amdgpu into the kernel and make it get loaded
before the efifb. Then, there no need to use the firmware framebuffer (
the talking is limited to the display boot graphics purpose here).
On such a case, the so-called "take over" will not happen.

The truth is that the efifb create a platform device, which *occupy*
part of the VRAM hardware resource. Thus, the efifb and the drm/amdgpu
form the conflict. There are conflict because they share the same
hardware resource. It is the hardware resources(address ranges) used
by two different driver are conflict. Not the efifb driver itself
conflict with drm/amdgpu driver.

Thus, drm_aperture_remove_conflicting_xxxxxx() function have to kill
one of the device are conflicting. Not to kill the driver. Therefore,
the correct word would be the "reclaim".
drm/amdgpu *reclaim* the hardware resource (vram address range) originally belong to you.

The modeset state (including the framebuffer content) still reside in the amdgpu device.
You just get the dirty framebuffer image in the framebuffer object.
But the framebuffer object already dirty since it in the UEFI firmware stage.

In conclusion, *reclaim* is more accurate than the "take over".
And as far as I'm understanding, the drm/amdgpu take over nothing, no gains.

Well, welcome to correct me if I'm wrong.

