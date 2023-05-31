Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C022718834
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8401C10E37C;
	Wed, 31 May 2023 17:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id F03C810E37C;
 Wed, 31 May 2023 17:12:10 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxmPHpf3dkdgYDAA--.6716S3;
 Thu, 01 Jun 2023 01:12:09 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx08Tpf3dk+a+CAA--.16069S3; 
 Thu, 01 Jun 2023 01:12:09 +0800 (CST)
Message-ID: <8b74e484-ed41-7f14-f46b-3951e645dd6b@loongson.cn>
Date: Thu, 1 Jun 2023 01:12:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 5/6] drm/etnaviv: add driver support for the PCI devices
To: Lucas Stach <l.stach@pengutronix.de>, Bjorn Helgaas <helgaas@kernel.org>
References: <ZHZIXZPuCkFSMF4H@bhelgaas>
 <950fdaaa-b62c-7f36-a499-9eca71c8bc47@loongson.cn>
 <5e0b34054ca6fa540e481d93f3c1d9fbdd2defcd.camel@pengutronix.de>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <5e0b34054ca6fa540e481d93f3c1d9fbdd2defcd.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx08Tpf3dk+a+CAA--.16069S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJFyxtw13WF4DGr1UJFy5urg_yoW5Gw18pF
 WYka1SyFWvgr1rtwn7tw45XF1ay3yftFy5Arn5JF1kCr90vry3Gr1rtr4Y9F9xur1xWa12
 va1jkrW7uFn8CaDanT9S1TB71UUUUb7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bDAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1ln4kS
 14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
 7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jIq2NUUUUU=
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

I have tested, it return *true*.

Yeah, out hardware is dma coherent.

Then,  we switching  to  dev_is_dma_coherent(dev) ?

> Regards,
> Lucas

-- 
Jingfeng

