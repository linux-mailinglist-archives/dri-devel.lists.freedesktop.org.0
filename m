Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5FC74D826
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4DB10E11B;
	Mon, 10 Jul 2023 13:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id E00CD10E11B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 13:50:33 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxtPCoDKxkgTEDAA--.9412S3;
 Mon, 10 Jul 2023 21:50:32 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxxsyYDKxkUGYnAA--.24416S3; 
 Mon, 10 Jul 2023 21:50:31 +0800 (CST)
Message-ID: <425f7fb4-265f-2d71-9554-eabafdd227d2@loongson.cn>
Date: Mon, 10 Jul 2023 21:50:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/loongson: Fix two warnings because of passing wrong
 type
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>
References: <20230710100931.255234-1-suijingfeng@loongson.cn>
 <87h6qcjc46.fsf@intel.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <87h6qcjc46.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxxsyYDKxkUGYnAA--.24416S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr47KFWrKr48Zr43tw13trc_yoW5WrWrpF
 45CF1jkr4DJF12yws7GF42q34Sva1SqFZaqrZrJ3Zxuw1DAF1UXF1kWFW5Kry3ZFWjy3WS
 vrs3Gay3K3WqvwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9vb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
 67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
 xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
 xVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
 C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
 JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
 WUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
 cSsGvfC2KfnxnUUI43ZEXa7IU14lk7UUUUU==
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/10 18:26, Jani Nikula wrote:
> On Mon, 10 Jul 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> When accessing I/O memory, we should pass '__iomem *' type instead of
>> 'void *' simply, otherwise sparse tests will complain. After applied
>> this patch, the following two sparse warnings got fixed.
> Usually the commit message should explain why it's okay to cast away the
> warning.
>
> Because realistically this doesn't "fix" the warning, this merely hides
> it.


The reason why we don't fix this at the very beginning is that

we are following the ttm_kmap_obj_virtual() and the ttm_bo_kmap() function.

Our lsdc_bo_kmap() is implemented with the ttm_bo_kmap() function.


Another reason is that this warning don't emerge when compile with W=1,

at least this is true on our platform.


We don't think this warning is harmful, because implicit cast will do 
the cast for us.

It is just that we need eliminate the noise as a programmer.


Again, for the code at here, before you do the de-reference operation,

As long as a address is really(originally) point to the I/O memory, cast 
it to 'void __iomem *' is OK.

As long as a address is really(originally) point to the system memory, 
cast it to 'void *' is OK.


> BR,
> Jani.
>
>> 1) drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35:
>>     sparse:     expected void volatile [noderef] __iomem *
>>     sparse:     got void *kptr
>>
>> 2) drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51:
>>     sparse:     expected void const volatile [noderef] __iomem *
>>     sparse:     got void *kptr
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202307100243.v3hv6aes-lkp@intel.com/
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/loongson/lsdc_benchmark.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/loongson/lsdc_benchmark.c b/drivers/gpu/drm/loongson/lsdc_benchmark.c
>> index b088646a2ff9..36e352820bdb 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_benchmark.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_benchmark.c
>> @@ -24,7 +24,7 @@ static void lsdc_copy_gtt_to_vram_cpu(struct lsdc_bo *src_bo,
>>   	lsdc_bo_kmap(dst_bo);
>>   
>>   	while (n--)
>> -		memcpy_toio(dst_bo->kptr, src_bo->kptr, size);
>> +		memcpy_toio((void __iomem *)dst_bo->kptr, src_bo->kptr, size);
>>   
>>   	lsdc_bo_kunmap(src_bo);
>>   	lsdc_bo_kunmap(dst_bo);
>> @@ -39,7 +39,7 @@ static void lsdc_copy_vram_to_gtt_cpu(struct lsdc_bo *src_bo,
>>   	lsdc_bo_kmap(dst_bo);
>>   
>>   	while (n--)
>> -		memcpy_fromio(dst_bo->kptr, src_bo->kptr, size);
>> +		memcpy_fromio(dst_bo->kptr, (void __iomem *)src_bo->kptr, size);
>>   
>>   	lsdc_bo_kunmap(src_bo);
>>   	lsdc_bo_kunmap(dst_bo);

