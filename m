Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA17DBBB1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 15:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE1A10E2CF;
	Mon, 30 Oct 2023 14:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 278C410E0E1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 14:25:52 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxEvDtvD9l8sA1AA--.38958S3;
 Mon, 30 Oct 2023 22:25:49 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxni_pvD9lzAU3AA--.52834S3; 
 Mon, 30 Oct 2023 22:25:47 +0800 (CST)
Message-ID: <20cd9518-fee4-4a99-86f2-a5eea9abaa57@loongson.cn>
Date: Mon, 30 Oct 2023 22:25:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/loongson: Introduce a drm bridge driver for
 it66121 HDMI transmitter
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-3-suijingfeng@loongson.cn>
 <CAA8EJprjQXcTgxnC1POaBjVBzyVBvKpmKyJcCR5ExRUhVxtYoQ@mail.gmail.com>
 <3ccb9600-6990-4ec7-81de-0d7b4e1294eb@loongson.cn>
 <CAA8EJpqCe2j3GyeutnwTB0bkGXGk0az9-w3sPHLFwMVgAS=e7g@mail.gmail.com>
 <df176548-0001-4df4-b556-6227b776cd18@loongson.cn>
 <CAA8EJprS72FUDvMrgXatLWHYNiAOhfugiWFCWuXnmzS2zmUDTA@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <CAA8EJprS72FUDvMrgXatLWHYNiAOhfugiWFCWuXnmzS2zmUDTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxni_pvD9lzAU3AA--.52834S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3JF4UJr45GrW3Kw4xXF45XFc_yoWxtF43pF
 4UKa4akrWDJr42y3yavw18CFyYy393JrWrWrnxG34F9r90934Iyr1xtFW5WF9rWr13Ca1j
 vrWDuFWxWF10yagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr
 0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07Ui
 mi_UUUUU=
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/10/30 21:48, Dmitry Baryshkov wrote:
> On Mon, 30 Oct 2023 at 15:26, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> Hi,
>>
>>
>> On 2023/10/30 18:01, Dmitry Baryshkov wrote:
>>> On Mon, 30 Oct 2023 at 11:42, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>>> Hi,
>>>>
>>>>
>>>> On 2023/10/30 06:53, Dmitry Baryshkov wrote:
>>>>> On Sun, 29 Oct 2023 at 21:46, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>>>>> The IT66121 is a DVO to HDMI converter, LS3A5000+LS7A1000 ML5A_MB use this
>>>>>> chip to support HDMI output. Thus add a drm bridge based driver for it.
>>>>>> This patch is developed with drivers/gpu/drm/bridge/ite-it66121.c as base.
>>>>> Please use the original bridge driver instead of adding a new one.
>>>> I'm agree with the spirit of code sharing, but this is nearly impossible for non-DT system.
>>>>
>>>> Because the original bridge driver(say it66121.ko) is fully dependent on the DT.
>>> I can not agree here. It doesn't depend on DT. It has fully populated
>>> i2c_device_id structures, so it will work with bare I2C buses.
>>> Most likely you will have to change of calls into fwnode calls, that's it.
>>>
>>>> UEFI+ACPI based system can not use with it.
>>>>
>>>> Our I2C adapter is created by the drm/loongson.ko on the runtime.
>>>> The potential problem is that *cyclic dependency* !
>>>>
>>>> I2C adapter driver is depend on drm/loongson
>>>> drm/loongson depend on drm bridge driver (say it66121.ko)
>>>> drm bridge driver (say it66121.ko) depend on I2C adapter to setup.
>>>>
>>>> This plus the defer probe mechanism is totally a trap,
>>>> incurring troubles and don't work.
>>> Welcome. We had this kind of issue for DP AUX buses.
>>>
>>> I can suggest the following approach:
>>> - In the root probe function you can create an i2c bus and populate it
>>> with the i2c devices.
>>> - I have not checked whether you use components or not. If not, please
>>> use an auxiliary or a platform device for the main DRM functionality.
>>> - In the subdevice probe / bind function you check for the next
>>> bridge. Then you get one of the following:drm_bridge pointer,
>>> -EPROBE_DEFER, or any other error case. Your driver can react
>>> accordingly.
>> I have similar way to solve this problem, and I have solved it one and a half years ago.
>> See [1] for a reference.
>>
>> [1] https://patchwork.freedesktop.org/patch/478998/?series=99512&rev=11
>>
>> When the PCI device get probed, we create the I2C bus first.
>> This ensure that when drm/lsdc.ko get loaded, the I2C bus is presence
>> and ready to be get by the drm_bridge driver.
>> This is basically a PCI-to-GPIO-emulated-I2C adapter,
>> then wait the display bridges driver get loaded and set up.
>>
>> I also need to create a virtual platform device for the display controller.
>> which allow the drm drivers instance for this virtual platform device
>> be able to probed due to defer probe mechanism.
>>
>> This solution made the framework of my driver distortion severely,
> I don't think I could catch this phrase. Did you see distortions on the screen?


I means that it destroy the my drm driver's framework.
I means that we are all-in-one driver. The solution you
mentioned have side effect also. That is because user-space
will open the PCI device first, not your created virtual platform device.



>> and in the end we still solve a easy problem by workaround.
> No workarounds for the kernel subsystems are allowed.


I means that the idea(solution) you told me is still a workaround.
bring no benifits to the drm driver itself.


>> I know how to use the component framework also, but the component framework just
>> a wrapper. Similar with above approach, it brings no gains in the end.
>> It does not make this driver better. I got trapped one years ago,
>> and I don't want to got trapped another time.
>> And I know how solve such a problem by workaround, but that's not worthy for the effort.
>>
>> I think my approach provide a solution, while still keep the bridges drivers
>> to a modular at the same time. Despite simple, it indeed solve the problem.
>> It simple because of explicit control of the loading order by myself, not by
>> rely on the framework or something else (say component)
> PCI media drivers have had this issue for ages. And all of them found
> a way to work.

I have said that PCI KMS display drivers is different,  because of user 
space open the PCI device.


>> It is not totally duplicating, I have rewrite part of them.
> This is even worse. Now one can not apply fixes to the second one.


I don't need to either, I want to maintain this by myself.


>> You can compare
>> to see what I'm changed. It is just that it66162 was upstream-ed earlier than
>> our solution. But I also have write display drivers for lt8618 and lt8619
>> completely by myself.
>>
>>
>> Even though our local drm bridges driver will not be able to enjoy the updates.
>> We will accept such a results(or pain). I can maintain our local drm bridges
>> drivers by myself.
> What happens if anybody wants to reuse your bridge driver for their
> own platform?

Copy and modify.

> Linux kernel uses driver model and frameworks to improve code sharing,
> not to reduce it.


Well I don't think my patch actually reduce something.
Please see i915, amdgpu, radeon and nouveau.
Non of them use the DRM bridge drivers.
It is just that the various DRM bridge drivers are not suitable to use for my driver.


>> Sorry, on this technique point, we will not follow your idea.
>> I'm sure that my approach is toward to right direction for our device at now.
>> If someone invent a better solution to handle this problem, which make the
>> various drm bridges drivers usable out of box, then I will follow and cooperate
>> to test.
>>
>>
>>> Basically duplicating the existing driver code is not really a way to
>>> go. Consider somebody adding a new feature or fixing a bug in your
>>> driver copy. Then they have to check if the fix applies to the driver
>>> at drivers/gpu/drm/bridge/ite-it66121.c. And vice versa. After fixing
>>> an issue in the standard driver one has to keep in mind to check your
>>> private copy.
>>>
>>> So, please, use the OF code as an inspiration and register all your
>>> devices in the device tree. Yes, this requires some effort from your
>>> side. Yes, this pays off in the longer distance.
>>>
>>>>>     If
>>>>> it needs to be changed in any way, please help everyone else by
>>>>> improving it instead of introducing new driver.
>>>>>
>>>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>> ---
>>>>>>     drivers/gpu/drm/loongson/Kconfig            |   1 +
>>>>>>     drivers/gpu/drm/loongson/Makefile           |   2 +
>>>>>>     drivers/gpu/drm/loongson/ite_it66121.c      | 749 ++++++++++++++++++++
>>>>>>     drivers/gpu/drm/loongson/ite_it66121.h      |  19 +
>>>>>>     drivers/gpu/drm/loongson/ite_it66121_regs.h | 268 +++++++
>>>>>>     5 files changed, 1039 insertions(+)
>>>>>>     create mode 100644 drivers/gpu/drm/loongson/ite_it66121.c
>>>>>>     create mode 100644 drivers/gpu/drm/loongson/ite_it66121.h
>>>>>>     create mode 100644 drivers/gpu/drm/loongson/ite_it66121_regs.h
>

