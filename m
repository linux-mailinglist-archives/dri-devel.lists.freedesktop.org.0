Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D81718768
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 18:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744A710E151;
	Wed, 31 May 2023 16:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FA0910E151;
 Wed, 31 May 2023 16:32:56 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxGvK4dndkcAQDAA--.6694S3;
 Thu, 01 Jun 2023 00:32:56 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxddG3dndkiaOCAA--.14887S3; 
 Thu, 01 Jun 2023 00:32:55 +0800 (CST)
Message-ID: <6668b162-5de1-8b2e-06d3-577f098e6ed4@loongson.cn>
Date: Thu, 1 Jun 2023 00:32:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 5/6] drm/etnaviv: add driver support for the PCI devices
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Bjorn Helgaas <helgaas@kernel.org>
References: <ZHZIXZPuCkFSMF4H@bhelgaas>
 <950fdaaa-b62c-7f36-a499-9eca71c8bc47@loongson.cn>
 <5e0b34054ca6fa540e481d93f3c1d9fbdd2defcd.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <5e0b34054ca6fa540e481d93f3c1d9fbdd2defcd.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxddG3dndkiaOCAA--.14887S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJFyxtw13WF4DGr1UJFy5urg_yoW5GF18pF
 Wa9a1SyF4vgr1Fyw17tw45XF1ay3yftFy5Jrn8tF1kCr90v343Gr1rtr4Y9F9xur1xGa12
 vay2kFW29Fn8CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 ba8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I
 3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
 WUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
 cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
 AFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
 Xa7IU8I38UUUUUU==
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
Cc: Li Yi <liyi@loongson.cn>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/1 00:23, Lucas Stach wrote:
> Hi Sui Jingfeng,
>
> Am Donnerstag, dem 01.06.2023 um 00:08 +0800 schrieb Sui Jingfeng:
>> Hi,
>>
>> On 2023/5/31 03:02, Bjorn Helgaas wrote:
>>> On Wed, May 31, 2023 at 12:06:42AM +0800, Sui Jingfeng wrote:
>>>> This patch adds PCI driver support on top of what already have. Take the
>>>> GC1000 in LS7A1000/LS2K1000 as the first instance of the PCI device driver.
>>>> There is only one GPU core for the GC1000 in the LS7A1000 and LS2K1000.
>>>> Therefore, component frameworks can be avoided. Because we want to bind the
>>>> DRM driver service to the PCI driver manually.
>>>> +	 * Loongson Mips and LoongArch CPU(ls3a5000, ls3a4000, ls2k1000la)
>>>> +	 * maintain cache coherency by hardware
>>>> +	 */
>>>> +	if (IS_ENABLED(CONFIG_CPU_LOONGSON64) || IS_ENABLED(CONFIG_LOONGARCH))
>>>> +		priv->has_cached_coherent = true;
>>> This looks like something that should be a runtime check, not a
>>> compile-time check.
>>>
>>> If it's possible to build a single kernel image that runs on Loongson
>>> MIPS or LoongArch CPU and, in addition, runs on other platforms, you
>>> cannot assume that all the others maintain this cache coherency.
>> Nice catch! I don't even realize this!
>>
>>
>> LS3A4000 is mips64r2 with MSA SIMD, while LS3A5000 is LoongArch,
>>
>> instruction set, compiler, and binary interface are totally changed.
>>
>> Therefore, it's impossible to build a single kernel image that runs on
>> all Loongson CPUs.
>>
>> Currently, I can guarantee that this works on the Loongson platform.
>>
>> My initial intent here is to let priv->has_cached_coherent be *true* on
>> the Loongson platform (both mips and loongarch).
>>
>> I do know there are some other vendors who bought GPU IP from Vivante.
>>
>> say GC7000, and integrate it into their discrete GPU product.
>>
>> But it is also a PCI device, but this is another story; it deserves
>> another patch.
>>
>> I don't know if Etnaviv folk find some similar hardware on Arm Arch,
>>
>> Some Arm CPUs do not maintain cached coherency on hardware.
>>
>> The has_cached_coherent member can be set to false on such hardware.
>>
>> For us, it seems that there is no need to do runtime checking,
>>
>> because they are all cached coherent by default.
>>
>>
>> Can I improve this in the future, currently I don't have a good idea.
> I think I mentioned before that this needs to be a runtime check. What
> does dev_is_dma_coherent() return for the Vivante GPU device on your
> platform?

Yes, you have told me so.

I will try it, and I will answer your question tomorrow.

> Regards,
> Lucas

-- 
Jingfeng

