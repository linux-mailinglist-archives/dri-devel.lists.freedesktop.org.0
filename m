Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD42730651
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 19:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC11D10E12B;
	Wed, 14 Jun 2023 17:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 028B610E12B;
 Wed, 14 Jun 2023 17:49:35 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxDeus_YlkqzoFAA--.11216S3;
 Thu, 15 Jun 2023 01:49:32 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxC8qr_YlkWPUaAA--.2221S3; 
 Thu, 15 Jun 2023 01:49:31 +0800 (CST)
Message-ID: <9ca50a8e-5e56-14a2-7ae7-988340ee8c81@loongson.cn>
Date: Thu, 15 Jun 2023 01:49:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/etnaviv: disable MLCG and pulse eater on GPU reset
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
References: <20230607125841.3518385-1-l.stach@pengutronix.de>
 <b154bee4-9129-8f21-06d4-d86e3b5234f7@loongson.cn>
 <58362294c70476e54abc29d7591a328b1e92a617.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <58362294c70476e54abc29d7591a328b1e92a617.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxC8qr_YlkWPUaAA--.2221S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw17Ww18Xw4fGF15Gr48uFX_yoWrGr1kpF
 W8JF1YkF1kZF42934xtFn5XFyj9w4xXFyfAryDGrn0vws0vr1SgF10kFW5WF9rZr1rGw42
 vr4jkr9rCF1YkrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
 xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
 6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
 vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUU
 U
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

Hi

On 2023/6/14 15:45, Lucas Stach wrote:
> Hi,
>
> Am Mittwoch, dem 14.06.2023 um 00:42 +0800 schrieb Sui Jingfeng:
>> Hi, Lucas
>>
>>
>> I love your patch, perhaps something to improve:
>>
>> The MLCG stand for "Module Level Clock Gating",
>>
>> without reading the commit message, I guess there may have people don't
>> know its meaning.
>>
> Yea, I expect people to read the commit message and not just the
> subject if they want to know what a patch does. The MLCG abbreviation
> is already well established within the driver code.

Yeah, I agree with you that the reviewer should read the commit message 
and the patch itself(code)

But after look the code quite a while, I'm wondering that

1) is the "Module Level" absolutely needed ?

2) is it accurate enough ?


For question in 1),  I meant that is it better by saying: "drm/etnaviv: 
disable clock gating and pulse eater on GPU reset"

For question in 2),  I mean that the code inside the 
etnaviv_hw_reset(struct etnaviv_gpu *gpu) function are per GPU instance 
level.


Every GPU instance managed by the drm/etnaviv will run those clock 
gating related code.

So it is per GPU instance level.


As far as I can understand, the "Module Level" stand for the 
drm/etnaviv(etnaviv.ko) as a whole

Nearly all patches for the gpu/drm/drivers are module level by default,

What's you really want to emphasize?


I think you probably want to drop the "ML",  and replace the "MLCG" with 
"clock gating".

explain the "ML" in the commit message should be enough.

>> There are still more thing in this patch can only be understand relay on
>> guessing... :-)
>>
> That's unfortunately true. I don't know exactly what the pulse eater
> control bits mean either. I've taken them verbatim from the reset
> sequence in the Vivante kernel driver, which is also why I didn't try
> to assign some meaning by giving them a name, but keep them as BITs in
> the driver code.
>
> Regards,
> Lucas
>
>> But drm/etnaviv drvier still works with this patch applied, so
>>
>>
>> On 2023/6/7 20:58, Lucas Stach wrote:
>>> Module level clock gating and the pulse eater might interfere with
>>> the GPU reset, as they both have the potential to stop the clock
>>> and thus reset propagation to parts of the GPU.
>>>
>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
>>
>> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>>
>>> ---
>>> I'm not aware of any cases where this would have been an issue, but
>>> it is what the downstream driver does and fundametally seems like
>>> the right thing to do.
>>> ---
>>>    drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 13 ++++++++++++-
>>>    1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>> index de8c9894967c..41aab1aa330b 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>> @@ -505,8 +505,19 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
>>>    	timeout = jiffies + msecs_to_jiffies(1000);
>>>    
>>>    	while (time_is_after_jiffies(timeout)) {
>>> -		/* enable clock */
>>>    		unsigned int fscale = 1 << (6 - gpu->freq_scale);
>>> +		u32 pulse_eater = 0x01590880;
>>> +
>>> +		/* disable clock gating */
>>> +		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
>>> +
>>> +		/* disable pulse eater */
>>> +		pulse_eater |= BIT(17);
>>> +		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>>> +		pulse_eater |= BIT(0);
>>> +		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
>>> +
>>> +		/* enable clock */
>>>    		control = VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
>>>    		etnaviv_gpu_load_clock(gpu, control);
>>>    

-- 
Jingfeng

