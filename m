Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541617D6E70
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622E810E668;
	Wed, 25 Oct 2023 14:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFA2310E667
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 14:08:11 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxJugEITllwo00AA--.43726S3;
 Wed, 25 Oct 2023 22:07:02 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx_y_zIDllYjMyAA--.40980S3; 
 Wed, 25 Oct 2023 22:06:57 +0800 (CST)
Message-ID: <34d1858c-5b31-474a-80bd-129f3123a71f@loongson.cn>
Date: Wed, 25 Oct 2023 22:06:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20230608024207.581401-1-suijingfeng@loongson.cn>
 <ZIGAEZTJvq1GqFVD@aptenodytes>
 <50fbc003-fd3c-c7c4-9c6b-76d14a0babfc@loongson.cn>
 <ZTjp65yjul76zKWm@aptenodytes>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <ZTjp65yjul76zKWm@aptenodytes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Dx_y_zIDllYjMyAA--.40980S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Aw4fWw1DZFWxJr4xGF48GrX_yoW8CFyxpF
 48t3W2kF4IvrWYyr12yF1aqFyYqwn7KrWfWF12kwn8W3s0kF1DZFZ3ZrW5ur98XrZrAF40
 qrn3KFy3JF47A3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
 Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWU
 JVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
 AIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2MKZDUUUU
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/10/25 18:11, Paul Kocialkowski wrote:
> Hi,
>
> On Tue 20 Jun 23, 11:56, Sui Jingfeng wrote:
>> Hi,
>>
>> On 2023/6/8 15:15, Paul Kocialkowski wrote:
>>> Hi,
>>>
>>> On Thu 08 Jun 23, 10:42, Sui Jingfeng wrote:
>>>> drm/logicvc driver is depend on REGMAP and REGMAP_MMIO, should select this
>>>> two kconfig option, otherwise the driver failed to compile on platform
>>>> without REGMAP_MMIO selected:
>>>>
>>>> ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/gpu/drm/logicvc/logicvc-drm.ko] undefined!
>>>> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
>>>> make: *** [Makefile:1978: modpost] Error 2
>>>>
>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>> Thanks for the fix, looks good to me!
>>>
>>> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>> Thanks a lot,
>>
>> Please don't forget to push this to drm-misc or drm-tip if you has the time,
>> as (even though trivial) it's precious for me.
> So I totally forgot about this and only pushed it to drm-misc-fixes now.
> Sincere apologies for this.
>
> Thanks again for spotting this issue and submitting the fix.
>
> Paul


Nice, thanks your reply.


>>
>>> Cheers,
>>>
>>> Paul
>>>
>>>> ---
>>>>    drivers/gpu/drm/logicvc/Kconfig | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
>>>> index fa7a88368809..1df22a852a23 100644
>>>> --- a/drivers/gpu/drm/logicvc/Kconfig
>>>> +++ b/drivers/gpu/drm/logicvc/Kconfig
>>>> @@ -5,5 +5,7 @@ config DRM_LOGICVC
>>>>    	select DRM_KMS_HELPER
>>>>    	select DRM_KMS_DMA_HELPER
>>>>    	select DRM_GEM_DMA_HELPER
>>>> +	select REGMAP
>>>> +	select REGMAP_MMIO
>>>>    	help
>>>>    	  DRM display driver for the logiCVC programmable logic block from Xylon
>>>> -- 
>>>> 2.25.1
>>>>
>> -- 
>> Jingfeng
>>

