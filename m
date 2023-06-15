Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB6E7313A0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A217810E4A5;
	Thu, 15 Jun 2023 09:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A5C810E4A1;
 Thu, 15 Jun 2023 09:23:01 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxDetz2Ipk3oAFAA--.11846S3;
 Thu, 15 Jun 2023 17:22:59 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxC8pz2IpkHM0bAA--.4347S3; 
 Thu, 15 Jun 2023 17:22:59 +0800 (CST)
Message-ID: <a12e9921-5542-8b73-02e4-f8611b2c8dc8@loongson.cn>
Date: Thu, 15 Jun 2023 17:22:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/etnaviv: disable MLCG and pulse eater on GPU reset
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
References: <20230607125841.3518385-1-l.stach@pengutronix.de>
 <b154bee4-9129-8f21-06d4-d86e3b5234f7@loongson.cn>
 <58362294c70476e54abc29d7591a328b1e92a617.camel@pengutronix.de>
 <9ca50a8e-5e56-14a2-7ae7-988340ee8c81@loongson.cn>
 <5eda22a30113abd46ebdbab40ca54233868f5bfe.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <5eda22a30113abd46ebdbab40ca54233868f5bfe.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxC8pz2IpkHM0bAA--.4347S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr48KFWUurWUKrWkArW3CFX_yoW7GryxpF
 WUJF1YkF4kAr1jv34IqFn5XF9Ivw47JryfZrn8Gr1Yvwn0vF1IgF1UKrW5WF97Zr1rGw42
 vr1jkr9rZF1YyrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jY
 38nUUUUU=
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OK,

On 2023/6/15 17:14, Lucas Stach wrote:
> Am Donnerstag, dem 15.06.2023 um 01:49 +0800 schrieb Sui Jingfeng:
>> Hi
>>
>> On 2023/6/14 15:45, Lucas Stach wrote:
>>> Hi,
>>>
>>> Am Mittwoch, dem 14.06.2023 um 00:42 +0800 schrieb Sui Jingfeng:
>>>> Hi, Lucas
>>>>
>>>>
>>>> I love your patch, perhaps something to improve:
>>>>
>>>> The MLCG stand for "Module Level Clock Gating",
>>>>
>>>> without reading the commit message, I guess there may have people don't
>>>> know its meaning.
>>>>
>>> Yea, I expect people to read the commit message and not just the
>>> subject if they want to know what a patch does. The MLCG abbreviation
>>> is already well established within the driver code.
>> Yeah, I agree with you that the reviewer should read the commit message
>> and the patch itself(code)
>>
>> But after look the code quite a while, I'm wondering that
>>
>> 1) is the "Module Level" absolutely needed ?
>>
>> 2) is it accurate enough ?
>>
>>
>> For question in 1),  I meant that is it better by saying: "drm/etnaviv:
>> disable clock gating and pulse eater on GPU reset"
>>
>> For question in 2),  I mean that the code inside the
>> etnaviv_hw_reset(struct etnaviv_gpu *gpu) function are per GPU instance
>> level.
>>
>>
>> Every GPU instance managed by the drm/etnaviv will run those clock
>> gating related code.
>>
>> So it is per GPU instance level.
>>
>>
>> As far as I can understand, the "Module Level" stand for the
>> drm/etnaviv(etnaviv.ko) as a whole
>>
>> Nearly all patches for the gpu/drm/drivers are module level by default,
>>
>> What's you really want to emphasize?
>>
>>
>> I think you probably want to drop the "ML",  and replace the "MLCG" with
>> "clock gating".
>>
>> explain the "ML" in the commit message should be enough.
>>
> No "module level" here has nothing to do with the kernel module at
> all.
>
> MLCG is the GPU internal clock gating mechanism implemented in the
> Vivante GPU cores. The module level here means that the GPU can gate
> individual modules of the core like the texture engine, pixel engine,
> etc. when the they are either idle or stalled. It's a fine grained
> clock gating mechanism, in contrast to the more coarse-grained platform
> level mechanisms, which may be able to gate the clock for the GPU as a
> whole.
>
> So in essence MLCG is the absolutely right and most specific term that
> need to be used here to describe what is being done in this patch.

OK, that sound fine then  If no other experts come here to battle.

Since you are more profession in this domain, I  choose to believe what 
you have said.

Thanks for the educating.

> Regards,
> Lucas
>
>>>> There are still more thing in this patch can only be understand relay on
>>>> guessing... :-)
>>>>
>>> That's unfortunately true. I don't know exactly what the pulse eater
>>> control bits mean either. I've taken them verbatim from the reset
>>> sequence in the Vivante kernel driver, which is also why I didn't try
>>> to assign some meaning by giving them a name, but keep them as BITs in
>>> the driver code.
>>>
>>> Regards,
>>> Lucas
>>>
>>>> But drm/etnaviv drvier still works with this patch applied, so
>>>>
>>>>
>>>> On 2023/6/7 20:58, Lucas Stach wrote:
>>>>> Module level clock gating and the pulse eater might interfere with
>>>>> the GPU reset, as they both have the potential to stop the clock
>>>>> and thus reset propagation to parts of the GPU.
>>>>>
>>>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>>>> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
>>>> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>
>>>>
>>>>> ---
>>>>> I'm not aware of any cases where this would have been an issue, but
>>>>> it is what the downstream driver does and fundametally seems like
>>>>> the right thing to do.
>>>>> ---
>>>>>     drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 13 ++++++++++++-
>>>>>     1 file changed, 12 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>>>> index de8c9894967c..41aab1aa330b 100644
>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>>>> @@ -505,8 +505,19 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
>>>>>     	timeout = jiffies + msecs_to_jiffies(1000);
>>>>>     
>>>>>     	while (time_is_after_jiffies(timeout)) {
>>>>> -		/* enable clock */
>>>>>     		unsigned int fscale = 1 << (6 - gpu->freq_scale);
>>>>> +		u32 pulse_eater = 0x01590880;
>>>>> +
>>>>> +		/* disable clock gating */
>>>>> +		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
>>>>> +
>>>>> +		/* disable pulse eater */
>>>>> +		pulse_eater |= BIT(17);
>>>>> +		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>>>>> +		pulse_eater |= BIT(0);
>>>>> +		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>>>>> +
>>>>> +		/* enable clock */
>>>>>     		control = VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
>>>>>     		etnaviv_gpu_load_clock(gpu, control);
>>>>>     

-- 
Jingfeng

