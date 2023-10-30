Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640E7DB579
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 09:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D036D10E24B;
	Mon, 30 Oct 2023 08:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D464210E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 08:51:21 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Dxl+iFbj9lVLQ1AA--.3507S3;
 Mon, 30 Oct 2023 16:51:17 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx7tyBbj9lBuU2AA--.52806S3; 
 Mon, 30 Oct 2023 16:51:15 +0800 (CST)
Message-ID: <292f7c44-a19a-4e0d-a73d-ca621ec26813@loongson.cn>
Date: Mon, 30 Oct 2023 16:50:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/loongson: Support to infer DC reversion from
 CPU's PRID value
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-8-suijingfeng@loongson.cn>
 <CAA8EJpqrWV1f_pFqZt1Evo+WrZfy1mOynaTQ85uY9o4tVPZJPw@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <CAA8EJpqrWV1f_pFqZt1Evo+WrZfy1mOynaTQ85uY9o4tVPZJPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Bx7tyBbj9lBuU2AA--.52806S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF13Gr15XrW7AFykKry5WrX_yoWrZrykpF
 W3AF1FkryDGw12k3sxZr18AF1aya4fXFWfuFs7Kw1qk34DAw17WFyUAF4Y9rZxZryxAry2
 vr95KFWY9anIk3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
 x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
 8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
 0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2DUUUUUUU
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

On 2023/10/30 07:19, Dmitry Baryshkov wrote:
> On Sun, 29 Oct 2023 at 21:46, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> Due to the fact that the same display IP core has been integrated into
>> different platform, there is a need to differentiate them on the runtime.
>> The DC in LS7A1000/LS2K1000 has the PCI vendor & device ID of 0x0014:0x7A06
>> The DC in LS7A2000/LS2K2000 has the PCI vendor & device ID of 0x0014:0x7A36
>>
>> Because the output ports and host platform of the DC IP varies, without a
>> revision information we can't achieve fine-grained controls. The canonical
>> approach to do such a thing is to read reversion register from the PCIe
>> device. But LS2K1000 SoC was taped out at 2017, it is rather old. Our BIOS
>> engineer don't assign a different revision ID to it, probably because of
>> ignorance.
>>
>> LS2K2000 SoC was newly taped on 2023, we strictly force the BIOS engineer
>> assign a different revision ID(0x10) to it. But the problem is that it is
>> too casual, there is no formal convention or public documented rule
>> established. For Loongson LS2K series SoC, the display controller IP is
>> taped togather with the CPU core. For Loongson LS7A series bridge chips,
>> the display controller IP is taped togather with the bridge chips itself.
>> Consider the fact the all Loongson CPU has a unique PRID, this patch choose
>> to infer DC reversion from CPU's PRID value.
>>
>>   - LS3A4000/LS3A5000 has 0xC0 as its processor ID.
>>   - LS2K2000 has 0xB0 as its processor ID.
>>   - LS2K2000LA has 0xA0 as its processor ID.
>>
>> The provided approach has no dependency on DT or ACPI, thus is preferfed.
>> Besides, this approach can be used to acquire more addtional HW features.
>> So the provided method has the potential to bring more benifits.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/loongson/lsdc_drv.h   |  2 ++
>>   drivers/gpu/drm/loongson/lsdc_probe.c | 35 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/loongson/lsdc_probe.h |  2 ++
>>   3 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
>> index 46ba9b88a30d..e1f4a2db2a0a 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_drv.h
>> +++ b/drivers/gpu/drm/loongson/lsdc_drv.h
>> @@ -42,6 +42,8 @@
>>   enum loongson_chip_id {
>>          CHIP_LS7A1000 = 0,
>>          CHIP_LS7A2000 = 1,
>> +       CHIP_LS2K1000 = 2,
>> +       CHIP_LS2K2000 = 3,
>>          CHIP_LS_LAST,
>>   };
>>
>> diff --git a/drivers/gpu/drm/loongson/lsdc_probe.c b/drivers/gpu/drm/loongson/lsdc_probe.c
>> index 48ba69bb8a98..f49b642d8f65 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_probe.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_probe.c
>> @@ -54,3 +54,38 @@ unsigned int loongson_cpu_get_prid(u8 *imp, u8 *rev)
>>
>>          return prid;
>>   }
>> +
>> +enum loongson_chip_id loongson_chip_id_fixup(enum loongson_chip_id chip_id)
>> +{
>> +       u8 impl;
>> +
>> +       if (loongson_cpu_get_prid(&impl, NULL)) {
>> +               /*
>> +                * LS2K2000 only has the LoongArch edition.
>> +                */
>> +               if (chip_id == CHIP_LS7A2000) {
>> +                       if (impl == LOONGARCH_CPU_IMP_LS2K2000)
>> +                               return CHIP_LS2K2000;
>> +               }
>> +
>> +               /*
>> +                * LS2K1000 has the LoongArch edition(with two LA264 CPU core)
>> +                * and the Mips edition(with two mips64r2 CPU core), Only the
>> +                * instruction set of the CPU are changed, the peripheral
>> +                * devices are basically same.
>> +                */
>> +               if (chip_id == CHIP_LS7A1000) {
>> +#if defined(__loongarch__)
>> +                       if (impl == LOONGARCH_CPU_IMP_LS2K1000)
>> +                               return CHIP_LS2K1000;
>> +#endif
>> +
>> +#if defined(__mips__)
>> +                       if (impl == LOONGSON_CPU_MIPS_IMP_LS2K)
>> +                               return CHIP_LS2K1000;
>> +#endif
> Can you drop the ifdefs here? The code blocks do not seem to conflict
> with each other.

OK, no problem. Will be fixed at the next version.

>> +               }
>> +       }
>> +
>> +       return chip_id;
>> +}
>> diff --git a/drivers/gpu/drm/loongson/lsdc_probe.h b/drivers/gpu/drm/loongson/lsdc_probe.h
>> index 8bb6de2e3c64..8c630c5c90ce 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_probe.h
>> +++ b/drivers/gpu/drm/loongson/lsdc_probe.h
>> @@ -9,4 +9,6 @@
>>   /* Helpers for chip detection */
>>   unsigned int loongson_cpu_get_prid(u8 *impl, u8 *rev);
>>
>> +enum loongson_chip_id loongson_chip_id_fixup(enum loongson_chip_id chip_id);
>> +
>>   #endif
>> --
>> 2.34.1
>>
>

