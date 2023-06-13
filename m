Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772972E8B5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 18:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29AC10E0F2;
	Tue, 13 Jun 2023 16:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DF5510E0F2;
 Tue, 13 Jun 2023 16:42:19 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxL_BpnIhkv7YEAA--.10151S3;
 Wed, 14 Jun 2023 00:42:17 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxReRpnIhkuXkZAA--.7653S3; 
 Wed, 14 Jun 2023 00:42:17 +0800 (CST)
Message-ID: <b154bee4-9129-8f21-06d4-d86e3b5234f7@loongson.cn>
Date: Wed, 14 Jun 2023 00:42:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/etnaviv: disable MLCG and pulse eater on GPU reset
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
References: <20230607125841.3518385-1-l.stach@pengutronix.de>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230607125841.3518385-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxReRpnIhkuXkZAA--.7653S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryDGF1fJFWfKr4rCrWkZrc_yoW8Zw1UpF
 Z3Ja4FyrW0vF12g3s7tFn8uF98Ww13ZF93CasrGF90vws8Zw10gF10kFW5XFZxXrnxAw42
 vF1vkryUC3W2k3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnUUUU
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Lucas


I love your patch, perhaps something to improve:

The MLCG stand for "Module Level Clock Gating",

without reading the commit message, I guess there may have people don't 
know its meaning.

There are still more thing in this patch can only be understand relay on 
guessing... :-)


But drm/etnaviv drvier still works with this patch applied, so


On 2023/6/7 20:58, Lucas Stach wrote:
> Module level clock gating and the pulse eater might interfere with
> the GPU reset, as they both have the potential to stop the clock
> and thus reset propagation to parts of the GPU.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>


Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


> ---
> I'm not aware of any cases where this would have been an issue, but
> it is what the downstream driver does and fundametally seems like
> the right thing to do.
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index de8c9894967c..41aab1aa330b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -505,8 +505,19 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
>   	timeout = jiffies + msecs_to_jiffies(1000);
>   
>   	while (time_is_after_jiffies(timeout)) {
> -		/* enable clock */
>   		unsigned int fscale = 1 << (6 - gpu->freq_scale);
> +		u32 pulse_eater = 0x01590880;
> +
> +		/* disable clock gating */
> +		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
> +
> +		/* disable pulse eater */
> +		pulse_eater |= BIT(17);
> +		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> +		pulse_eater |= BIT(0);
> +		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> +
> +		/* enable clock */
>   		control = VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
>   		etnaviv_gpu_load_clock(gpu, control);
>   

-- 
Jingfeng

