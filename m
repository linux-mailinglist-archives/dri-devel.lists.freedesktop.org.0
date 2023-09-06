Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4037933C9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 04:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEF010E568;
	Wed,  6 Sep 2023 02:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0098B10E55F;
 Wed,  6 Sep 2023 02:34:56 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxEvBN5fdkjQggAA--.63656S3;
 Wed, 06 Sep 2023 10:34:53 +0800 (CST)
Received: from [0.0.0.0] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx3yNM5fdkBeZtAA--.27326S3; 
 Wed, 06 Sep 2023 10:34:52 +0800 (CST)
Message-ID: <6d1d8acc-5140-f710-ac00-cb423d7fce78@loongson.cn>
Date: Wed, 6 Sep 2023 10:34:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <773be4c6-0b3d-be39-7857-b3e2942007d9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Bx3yNM5fdkBeZtAA--.27326S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw18Kry8Zr4kKw17ZryrGrX_yoW8Aw1rpF
 WYgFWqkrWkGr4rAF4FyF1Fgr1Fqw4kJFWFgr48ZrZayF90v34avrWxtan0ga4UJrnxX3W5
 GrZIgryxGFyDZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxYiiDU
 UUU
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


On 2023/9/5 23:05, Thomas Zimmermann wrote:
> Hi
>
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
>> Firmware framebuffer device already get killed by the 
>> drm_aperture_remove_conflicting_pci_framebuffers()
>> function (or its siblings). So, this series is definitely not to 
>> interact with the firmware framebuffer
>
> Yes and no. The helpers you mention will attempt to remove the 
> firmware framebuffer on the given PCI device. If you have multiple PCI 
> devices, the other devices would not be affected.
>
Yes and no.


For the yes part: drm_aperture_remove_conflicting_pci_framebuffers() only kill the conflict one.
But for a specific machine with the modern UEFI firmware,
there should be only one firmware framebuffer driver.
That shoudd be the EFIFB(UEFI GOP). I do have multiple PCI devices,
but I don't understand when and why a system will have more than one firmware framebuffer.

Even for the machines with the legacy BIOS, the fixed VGA aperture address range
can only be owned by one firmware driver. It is just that we need to handle the
routing, the ->set_decode() callback of vga_client_register() is used to do such
work. Am I correct?


