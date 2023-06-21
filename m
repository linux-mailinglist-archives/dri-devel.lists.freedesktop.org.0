Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F3E738A2E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3392310E08F;
	Wed, 21 Jun 2023 15:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB8D410E08F;
 Wed, 21 Jun 2023 15:54:48 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxR8VHHZNksS4AAA--.344S3;
 Wed, 21 Jun 2023 23:54:47 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxrM5GHZNk7+EAAA--.5168S3; 
 Wed, 21 Jun 2023 23:54:46 +0800 (CST)
Message-ID: <3911d448-5613-23a8-cfcb-5ae418677338@loongson.cn>
Date: Wed, 21 Jun 2023 23:54:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 07/11] drm/etnaviv: Add support for the dma coherent
 device
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Sui Jingfeng <18949883232@163.com>, 
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-8-18949883232@163.com>
 <8f74f0962c8bab6c832919a5340667c54e1a7ddc.camel@pengutronix.de>
 <2249b895-84b9-adea-531b-bf190e9c866f@loongson.cn>
 <030d44e2753b9b2eea0107cdee6c20e2bc2d3efe.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <030d44e2753b9b2eea0107cdee6c20e2bc2d3efe.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxrM5GHZNk7+EAAA--.5168S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr43uw1kurW5AFyrZr18Zwc_yoW5XFy7pF
 W3tFWakrWDXrWIkwn2vr4rZFyaqrWSkr15ZFn5J34Yy3s8ta9xGF48KFWUuF9xWw1fWr4a
 y3yUtFy3Cas8ArXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
 14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
 xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
 xVAFwI0_Wrv_ZF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
 C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_
 Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
 WUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JbIYCTnIWIevJa73UjIFyTuYvjxU7NtxDUUUU
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/21 23:33, Lucas Stach wrote:
> Am Mittwoch, dem 21.06.2023 um 23:00 +0800 schrieb Sui Jingfeng:
>> On 2023/6/21 18:00, Lucas Stach wrote:
>>>>    static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
>>>> @@ -369,6 +381,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
>>>>    {
>>>>    	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>>>>    	struct drm_device *dev = obj->dev;
>>>> +	struct etnaviv_drm_private *priv = dev->dev_private;
>>>>    	bool write = !!(op & ETNA_PREP_WRITE);
>>>>    	int ret;
>>>>    
>>>> @@ -395,7 +408,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
>>>>    			return ret == 0 ? -ETIMEDOUT : ret;
>>>>    	}
>>>>    
>>>> -	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
>>>> +	if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CACHED) {
>>> Why do you need this? Isn't dma_sync_sgtable_for_cpu a no-op on your
>>> platform when the device is coherent?
>>>
>> I need this to show that our hardware is truly dma-coherent!
>>
>> I have tested that the driver still works like a charm without adding
>> this code '!priv->dma_coherent'.
>>
>>
>> But I'm expressing the idea that a truly dma-coherent just device don't
>> need this.
>>
>> I don't care if it is a no-op.
>>
>> It is now, it may not in the future.
> And that's exactly the point. If it ever turns into something more than
> a no-op on your platform, then that's probably for a good reason and a
> driver should not assume that it knows better than the DMA API
> implementation what is or is not required on a specific platform to
> make DMA work.
>
>> Even it is, the overhead of function call itself still get involved.
>>
> cpu_prep/fini aren't total fast paths, you already synchronized with
> the GPU here, potentially waiting for jobs to finish, etc. If your
> platform no-ops this then the function call will be in the noise.
>   
>> Also, we want to try flush the write buffer with the CPU manually.
>>
>>
>> Currently, we want the absolute correctness in the concept,
>>
>> not only the rendering results.
> And if you want absolute correctness then calling dma_sync_sgtable_* is
> the right thing to do, as it can do much more than just manage caches.

For our hardware, cached mapping don't need calling dma_sync_sgtable_*.

This is the the right thing to do. The hardware already guarantee it for 
use.


We may only want to call it for WC mapping BO,  please don't tangle all 
of this together.

We simply want to do the right thing.

> Right now it also provides SWIOTLB translation if needed.

SWIOTLB introduce the bounce buffer, slower the performance.

We don't need it. It should be avoid.

  I know you know everything. No sugar-coated bullets please.

>
> Regards,
> Lucas

-- 
Jingfeng

