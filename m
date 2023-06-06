Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CC1724B98
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 20:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DE610E11E;
	Tue,  6 Jun 2023 18:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id E9DF710E0C1;
 Tue,  6 Jun 2023 18:43:31 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxPutRfn9kLEsAAA--.1101S3;
 Wed, 07 Jun 2023 02:43:29 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxFORPfn9kJvACAA--.11400S3; 
 Wed, 07 Jun 2023 02:43:27 +0800 (CST)
Message-ID: <234586a0-995c-b4c4-3b7b-35afeea1a797@loongson.cn>
Date: Wed, 7 Jun 2023 02:43:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 7/7] drm/etnaviv: add support for the dma coherent
 device
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <15330273260@189.cn>
References: <20230606165624.GA1127373@bhelgaas>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230606165624.GA1127373@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxFORPfn9kJvACAA--.11400S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtr47Jw45Xr1rWryDCr15trc_yoWxGw43pF
 W5CFWYyrWDXry8Kw1xuw48uFyFv3yfJayFyryDt3W7Z398ZryFqrW8AF4Y9r98Ar4SgF4Y
 vr4DKFyUZF98ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5WrAU
 UUUU=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, I love your reviews


On 2023/6/7 00:56, Bjorn Helgaas wrote:
> On Sat, Jun 03, 2023 at 06:59:43PM +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> Loongson CPUs maintain cache coherency by hardware, which means that the
>> data in the CPU cache is identical to the data in main system memory. As
>> for the peripheral device, most of Loongson chips chose to define the
>> peripherals as DMA coherent by default, device drivers do not need to
>> maintain the coherency between a processor and an I/O device manually.
>>
>> There are exceptions, for LS2K1000 SoC, part of peripheral device can be
>> configured as dma non-coherent. But there is no released version of such
>> firmware exist in the market. Peripherals of older ls2k1000 is also DMA
>> non-conherent, but they are nearly outdated. So, those are trivial cases.
> s/dma/DMA/
> s/non-conherent/non-coherent/
> s/ls2k1000/LS2K1000/

So sharpen eyes, as before. :-)


> I guess when you say these are "trivial cases," you mean you don't
> care about supporting those devices?

Not exactly, Its just that its kernel side thing.

the kernel side should tell us whether a peripheral device is dma 
coherent or not.


I do try to support the LSDC/GC1000 as DMA non-coherent peripheral 
device in the past,

It's no fun, Only helps to study knowledge, experiment, testing and 
comparison(with the dma coherent case).


It requires me compile the PMON firmware on myself. And flash it to the 
ROM the board.

change firmware is complex, there a lot of address windows and cross 
bar(control

a access either go the cached path or go the non cached path) setting which

only firmware engineer know about.


If there a user want ask me to do it, I will try to test this driver on 
such old chip again.

Now, I believe that the support is *already* there.

As etnaviv already works on DMA non-coherent platform originally.


The DC in Loongson Mips/LoongArch SoC can scanout from cached system RAM.

low-end application relay on CPU software rendering only.

There no need to do something like flush cache(write the data in the cache

back to system ram), invalid the cache. This is pretty convenient.


The old Ingenic SoC(jz4770 for example, mips32) also has vivante gpu 
integrated.

but  they are dma non-coherent,  see more addition material at [1].

Therefore, still need to consider the support from cross(various) 
devices perspective.


[1]  https://lkml.org/lkml/2021/5/15/177

>> Nevertheless, kernel space still need to do probe work, because vivante GPU
>> IP has been integrated into various platform. Hence, this patch add runtime
>> detection code to probe if a specific gpu is DMA coherent, If the answer is
>> yes, we are going to utilize such features. On Loongson platfform, When a
>> buffer is accesed by both the GPU and the CPU, The driver should prefer
>> ETNA_BO_CACHED over ETNA_BO_WC.
> s/gpu/GPU/
> s/platfform/platform/
> s/accesed/accessed/

OK, will be fixed at next version,

I don't find this on myself. :-(

> I guess the only way to discover this coherency attribute is via the
> DT "vivante,gc" property?  Seems a little weird but I'm really not a
> DT person.

I'm not sure it is *only*, but it is very convenient to achieve such a 
thing with DT.

Just need to put the "dma-coherent;"  or "dma-noncoherent" inside the  
"vivante,gc" node.

see of_dma_is_coherent() function.

DT is flexible. But this is just used to describe the hardware, it don't 
not changing the hardware.

Put any property only has a influence to the software or driver side. 
The hardware still as it is.

Changing hardware to a different working mode probably still need the 
firmware(uefi, uboot, pmon etc) to do it


>> This patch also add a new parameter: etnaviv_param_gpu_coherent, which
>> allow userspace to know if such a feature is available. Because
>> write-combined BO is still preferred in some case, especially where don't
>> need CPU read, for example, uploading shader bin.
>> ...
>> +static struct device_node *etnaviv_of_first_available_node(void)
>> +{
>> +	struct device_node *core_node;
>> +
>> +	for_each_compatible_node(core_node, NULL, "vivante,gc") {
>> +		if (!of_device_is_available(core_node))
>> +			continue;
>> +
>> +		return core_node;
>> +	}
>> +
>> +	return NULL;
> Seems like this would be simpler as:
>
>    for_each_compatible_node(core_node, NULL, "vivante,gc") {
>      if (of_device_is_available(core_node))
>        return core_node;
>    }
>
>    return NULL;
Indeed, I don't realize this when I create this patch.
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/dma-fence.h>
>>   #include <linux/dma-mapping.h>
>> +#include <linux/dma-map-ops.h>
> It looks like this #include might not be needed?

No,

the dev_is_dma_coherent() function is declared and defined in dma-map-ops.h.


if remove it, gcc will complain:


drivers/gpu/drm/etnaviv/etnaviv_drv.c: In function 
‘etnaviv_is_dma_coherent’:
drivers/gpu/drm/etnaviv/etnaviv_drv.c:56:14: error: implicit declaration 
of function ‘dev_is_dma_coherent’; did you mean 
‘etnaviv_is_dma_coherent’? [-Werror=implicit-function-declaration]
    56 |   coherent = dev_is_dma_coherent(dev);
       |              ^~~~~~~~~~~~~~~~~~~


>   You're only adding a
> new reference to priv->dma_coherent, which looks like it was added to
> etnaviv_drv.h.
>
>>   #include <linux/module.h>
>>   #include <linux/of_device.h>
>>   #include <linux/platform_device.h>
>> @@ -164,6 +165,10 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
>>   		*value = gpu->identity.eco_id;
>>   		break;
>>   
>> +	case ETNAVIV_PARAM_GPU_COHERENT:
>> +		*value = priv->dma_coherent;
>> +		break;
>> +
>>   	default:
>>   		DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
>>   		return -EINVAL;
>> @@ -1861,7 +1866,7 @@ static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
>>   
>>   	gpu->irq = irq;
>>   
>> -	dev_info(dev, "IRQ handler registered, irq = %d\n", irq);
>> +	dev_info(dev, "irq(%d) handler registered\n", irq);
> Looks possibly unnecessary, or at least unrelated to this patch.

Indeed, catched by you again.

>>   	return 0;
>>   }

-- 
Jingfeng

