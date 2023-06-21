Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9097738A88
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B668D10E236;
	Wed, 21 Jun 2023 16:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC05A10E178;
 Wed, 21 Jun 2023 16:12:09 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx68ZYIZNkSjAAAA--.326S3;
 Thu, 22 Jun 2023 00:12:08 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxvM5XIZNkouUAAA--.5363S3; 
 Thu, 22 Jun 2023 00:12:08 +0800 (CST)
Message-ID: <1f1ab625-fa99-7f0c-6d2f-e19c88b2b43b@loongson.cn>
Date: Thu, 22 Jun 2023 00:12:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 03/11] drm/etnaviv: Add dedicated functions to create
 and destroy platform device
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Sui Jingfeng <18949883232@163.com>, 
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-4-18949883232@163.com>
 <0daa7182d6600a24988d1c81cf8fe3c0c9487f52.camel@pengutronix.de>
 <1c7596fd-7e63-6719-2574-7d7820687832@loongson.cn>
 <6d287bbb1733814009dfeb7d48f08cb6f44dc56c.camel@pengutronix.de>
 <30d80802-2d9d-2816-1a02-240145f6dd3a@loongson.cn>
 <0f1095ef333da7ea103486a1121ca9038815e57c.camel@pengutronix.de>
 <ab17a1e6-c621-9a92-73fc-8b762fd0800e@loongson.cn>
 <6ef512179a4cc9ce24890e5ed50c6fabd86a18c1.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <6ef512179a4cc9ce24890e5ed50c6fabd86a18c1.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxvM5XIZNkouUAAA--.5363S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF17XF4UuryDXryUKw4rJFc_yoWrCw1DpF
 WUtFyYkrWDCF1Ivw12qw4rXr10vw4rA34Yqr15Jryjkwn0vryfXrW7t3W5CasxtF1kta10
 vr4jvrWxCFs8AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
 xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
 6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
 vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
 6rWY6Fy7MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
 CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
 0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
 AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
 Ja73UjIFyTuYvjxU7XTmDUUUU
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 2023/6/21 23:20, Lucas Stach wrote:
> Am Mittwoch, dem 21.06.2023 um 22:35 +0800 schrieb Sui Jingfeng:
>> Hi,
>>
>> On 2023/6/21 22:00, Lucas Stach wrote:
>>> Am Mittwoch, dem 21.06.2023 um 21:31 +0800 schrieb Sui Jingfeng:
>>>> On 2023/6/21 18:23, Lucas Stach wrote:
>>>>>> While back to the question you ask, I want etnaviv_create_platform_device() to be generic,
>>>>>>
>>>>>> can be used by multiple place for multiple purpose.
>>>>>>
>>>>>> I have successfully copy this to a another drm driver by simply renaming.
>>>>>>
>>>>>> The body of the function itself does not need to change.
>>>>> But it isn't shared,
>>>> This can be shared for drm/etnaviv in the future,
>>>>
>>>> currently, we just need an opportunity to use this function.
>>>>
>>> I'm not convinced, yet.
>>>
>>>> I want to create a dummy platform device,
>>>>
>>>> let this dummy platform be bound to the single PCI GPU master.
>>>>
>>>>
>>>> etnaviv_create_platform_device("dummy", &dummy_device);
>>>>
>>>>
>>>> 1) To verify the component code path on PCI case.
>>>>
>>> My favorite option would be to just always use the component path even
>>> when the GPU is on a PCI device to keep both paths mostly aligned. One
>>> could easily image both a 3D and a 2D core being made available though
>>> the same PCI device.
>> Component is for something that is possible not available. (or something
>> is optional)
>>
>> Yes it provided flexibly, but don't forget, it rely on the DT.
> The component framework itself doesn't rely on DT in any way.

Yes I know that, for example the HDMI audio stuff.

But *your implement* do rely on the DT, this is the point

> By
> providing a appropriate match function you can make it work with any
> kind of device.
Yes, you are right.
>   In fact etnaviv supports platform devices instantiated
> via board code today.
Nice,
>   They don't need to come from DT.
What about the various clock, sir?
> If we could make the PCI stuff work the same way, that would be my
> preferred option.
>
>>
>> But for the PCIe device, it always the case that all of the hardware is
>> available at the same time
>>
>> when the device driver(kernel module) is loaded.
> That isn't the issue solved by the component framework. On the existing
> SoCs all the hardware is available when the driver is probed. The
> component framework just makes sure that we only expose the DRM device
> after all GPU cores that should be managed by a single DRM device
> instance are probed.
>
> One could easily image a PCI device that containing a 2D and a 3D
> Vivante GPU that should be made available through a single DRM device.
> In that case you'll also need to use the component framework.
>
>>
>>>> 2) Possibly for create a device for some other tiny hardware logic
>>>> come with the platform
>>>>
>>> Do you have something in mind here? Until now I assumed that only the
>>> GPU core is behind the PCI abstraction. Is there something else sharing
>>> the MMIO space?
>> A display controller, HDMI phy, vga encoder etc
>>
>>
>> I have a discrete PCIe GPU card from another vendor,
>>
>> It integrated display controller and vivante GPU and unknown VPUs.
>>
>> All of the  hardware block mentioned above sharing the MMIO space.
>>
>> There are available on the same time when you mount this discrete PCIe
>> GPU card on the mother board
>>
> But they surely should not all be made available through the etnaviv
> driver. Etnaviv deals with the Vivante GPUs. If you have a PCI device
> with multiple IP cores behind the shared MMIO space you should have a
> PCI driver instantiating platform devices so the respective drivers for
> those IP cores can bind to the platform device.

I have only one PCI device, let start from the simple case, OK?

I admire your fantastic idea.

let deal with it another patch in the future if such hardware emerged.

Accept the current implement, please ?

>   Etnaviv is not that
> driver.

Yeah, but I notice that there is chipFeatures_DC defined in common.xml.h

I don't know how does this going to used, if a hardware marked it as true.

> Regards,
> Lucas
>
>>> Regards,
>>> Lucas
>>>
>>>> 3) Revival component_compare_dev_name() function.
>>>>
>>>>> in this compilation unit this function is specific
>>>>> to the etnaviv driver and I don't see why we shouldn't have etnaviv
>>>>> specifics in there if it makes the code of this driver easier to
>>>>> follow.

-- 
Jingfeng

