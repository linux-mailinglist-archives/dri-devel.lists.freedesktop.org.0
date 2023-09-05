Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE18792566
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 18:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EC510E15E;
	Tue,  5 Sep 2023 16:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A86C10E0A2;
 Tue,  5 Sep 2023 16:21:14 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx77t4VfdkzbcfAA--.4929S3;
 Wed, 06 Sep 2023 00:21:12 +0800 (CST)
Received: from [0.0.0.0] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxLCN2VfdkQy9tAA--.47054S3; 
 Wed, 06 Sep 2023 00:21:10 +0800 (CST)
Message-ID: <ce81413d-4872-8804-d816-0f1ef88b82cb@loongson.cn>
Date: Wed, 6 Sep 2023 00:21:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user to select
 the primary video adapter at boot time
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <20230905085243.4b22725e.alex.williamson@redhat.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230905085243.4b22725e.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxLCN2VfdkQy9tAA--.47054S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGryfJr4xZrWrArykZF4DZFc_yoW5ZFykpF
 WSkFyFyrs5Jr18Cr9Fyws7XFWYqayrJay7Gr1vyr1vv3Z8K34vqFWftr4j93W7Jr1fCa1Y
 9r9rKr17AFWDAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
 xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UU
 UUU==
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/9/5 22:52, Alex Williamson wrote:
> On Tue,  5 Sep 2023 03:57:15 +0800
> Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> On a machine with multiple GPUs, a Linux user has no control over which
>> one is primary at boot time. This series tries to solve above mentioned
>> problem by introduced the ->be_primary() function stub. The specific
>> device drivers can provide an implementation to hook up with this stub by
>> calling the vga_client_register() function.
>>
>> Once the driver bound the device successfully, VGAARB will call back to
>> the device driver. To query if the device drivers want to be primary or
>> not. Device drivers can just pass NULL if have no such needs.
>>
>> Please note that:
>>
>> 1) The ARM64, Loongarch, Mips servers have a lot PCIe slot, and I would
>>     like to mount at least three video cards.
>>
>> 2) Typically, those non-86 machines don't have a good UEFI firmware
>>     support, which doesn't support select primary GPU as firmware stage.
>>     Even on x86, there are old UEFI firmwares which already made undesired
>>     decision for you.
>>
>> 3) This series is attempt to solve the remain problems at the driver level,
>>     while another series[1] of me is target to solve the majority of the
>>     problems at device level.
>>
>> Tested (limited) on x86 with four video card mounted, Intel UHD Graphics
>> 630 is the default boot VGA, successfully override by ast2400 with
>> ast.modeset=10 append at the kernel cmd line.
>>
>> $ lspci | grep VGA
>>
>>   00:02.0 VGA compatible controller: Intel Corporation CoffeeLake-S GT2 [UHD Graphics 630]
> In all my previous experiments with VGA routing and IGD I found that
> IGD can't actually release VGA routing and Intel confirmed the hardware
> doesn't have the ability to do so.  It will always be primary from a
> VGA routing perspective.  Was this actually tested with non-UEFI?

Yes, I have tested on my aspire e471 notebook (i5 5200U),
because that notebook using legacy firmware (also have UEFI, double firmware).
But this machine have difficult in install ubuntu under UEFI firmware in the past.
So I keep it using the legacy firmware.

It have two video card, IGD and nvidia video card(GFORCE 840M).
nvidia call its video card as 3D controller (pci->class = 0x030200)

I have tested this patch and another patch mention at [1] together.
I can tell you that the firmware framebuffer of this notebook using vesafb, not efifb.
And the framebuffer size (lfb.size) is very small. This is very strange,
but I don't have enough time to look in details. But still works.

I'm using and tesing my patch whenever and wherever possible.

> I suspect it might only work in UEFI mode where we probably don't
> actually have a dependency on VGA routing.  This is essentially why
> vfio requires UEFI ROMs when assigning GPUs to VMs, VGA routing is too
> broken to use on Intel systems with IGD.  Thanks,


What you tell me here is the side effect come with the VGA-compatible,
but I'm focus on the arbitration itself. I think there no need to keep
the VGA routing hardware features nowadays except that hardware vendor
want keep the backward compatibility and/or comply the PCI VGA compatible spec.


> Alex
>

