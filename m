Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5DE73142C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E6F10E4A8;
	Thu, 15 Jun 2023 09:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCCA210E4A8;
 Thu, 15 Jun 2023 09:37:44 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxW+rl24pkTIIFAA--.11817S3;
 Thu, 15 Jun 2023 17:37:42 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax6OTl24pkp9EbAA--.13538S3; 
 Thu, 15 Jun 2023 17:37:41 +0800 (CST)
Message-ID: <b69671a6-4d4a-b1ee-784e-e21bd8f5558c@loongson.cn>
Date: Thu, 15 Jun 2023 17:37:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/etnaviv: slow down FE idle polling
Content-Language: en-US
To: Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20230607125932.3518547-1-l.stach@pengutronix.de>
 <8c36b8bc-5a0d-75f7-265c-b0191979165a@loongson.cn>
 <d17de4ebfd08faa23238ece2ad0b737bf271498b.camel@pengutronix.de>
 <36946504-45c3-f0bc-3e4a-9106d9f4a2dd@loongson.cn>
 <CAH9NwWeB-MudNvuyuH1kUNiyWQTZ5Y4fuiB4uNKtutCKL3EZPg@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <CAH9NwWeB-MudNvuyuH1kUNiyWQTZ5Y4fuiB4uNKtutCKL3EZPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax6OTl24pkp9EbAA--.13538S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuw1DJr1xJF17XFW8Zw13GFX_yoWxGw4DpF
 45KF4YyF1qvryUKw42qwn8JF13K3ZrWFyv9ryDJ3sF9ws0yF1qgr1UCFs8Wr98Ar1fWr42
 qr15Gr9rWF1YyrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUc3kuDU
 UUU
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/15 17:20, Christian Gmeiner wrote:
> Hi
>
> Am Do., 15. Juni 2023 um 11:16 Uhr schrieb Sui Jingfeng
> <suijingfeng@loongson.cn>:
>> Hi,
>>
>> On 2023/6/15 17:04, Lucas Stach wrote:
>>> Am Donnerstag, dem 15.06.2023 um 12:09 +0800 schrieb Sui Jingfeng:
>>>> Hi,
>>>>
>>>> On 2023/6/7 20:59, Lucas Stach wrote:
>>>>> Currently the FE is spinning way too fast when polling for new work in
>>>> 'way' -> 'away'
>>>>> the FE idleloop.
>>>> 'idleloop' -> 'idle loop'
>>>>>     As each poll fetches 16 bytes from memory, a GPU running
>>>>> at 1GHz with the current setting of 200 wait cycle between fetches causes
>>>>> 80 MB/s of memory traffic just to check for new work when the GPU is
>>>>> otherwise idle, which is more FE traffic than in some GPU loaded cases.
>>>>>
>>>>> Significantly increase the number of wait cycles to slow down the poll
>>>>> interval to ~30µs, limiting the FE idle memory traffic to 512 KB/s, while
>>>>> providing a max latency which should not hurt most use-cases. The FE WAIT
>>>>> command seems to have some unknown discrete steps in the wait cycles
>>>> add a comma here.
>>>>>     so
>>>>> we may over/undershoot the target a bit, but that should be harmless.
>>>> overshoot or undershoot
>>>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>>>> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
>>>>> ---
>>>>>     drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 11 ++++++-----
>>>>>     drivers/gpu/drm/etnaviv/etnaviv_gpu.c    |  7 +++++++
>>>>>     drivers/gpu/drm/etnaviv/etnaviv_gpu.h    |  1 +
>>>>>     3 files changed, 14 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
>>>>> index cf741c5c82d2..384df1659be6 100644
>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
>>>>> @@ -53,11 +53,12 @@ static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
>>>>>      OUT(buffer, VIV_FE_END_HEADER_OP_END);
>>>>>     }
>>>>>
>>>>> -static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer)
>>>>> +static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
>>>>> +                       unsigned int waitcycles)
>>>>>     {
>>>>>      buffer->user_size = ALIGN(buffer->user_size, 8);
>>>>>
>>>>> -   OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | 200);
>>>>> +   OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
>>>>>     }
>>>>>
>>>>>     static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
>>>>> @@ -168,7 +169,7 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
>>>>>      /* initialize buffer */
>>>>>      buffer->user_size = 0;
>>>>>
>>>>> -   CMD_WAIT(buffer);
>>>>> +   CMD_WAIT(buffer, gpu->fe_waitcycles);
>>>>>      CMD_LINK(buffer, 2,
>>>>>               etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
>>>>>               + buffer->user_size - 4);
>>>>> @@ -320,7 +321,7 @@ void etnaviv_sync_point_queue(struct etnaviv_gpu *gpu, unsigned int event)
>>>>>      CMD_END(buffer);
>>>>>
>>>>>      /* Append waitlink */
>>>>> -   CMD_WAIT(buffer);
>>>>> +   CMD_WAIT(buffer, gpu->fe_waitcycles);
>>>>>      CMD_LINK(buffer, 2,
>>>>>               etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
>>>>>               + buffer->user_size - 4);
>>>>> @@ -503,7 +504,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
>>>>>
>>>>>      CMD_LOAD_STATE(buffer, VIVS_GL_EVENT, VIVS_GL_EVENT_EVENT_ID(event) |
>>>>>                     VIVS_GL_EVENT_FROM_PE);
>>>>> -   CMD_WAIT(buffer);
>>>>> +   CMD_WAIT(buffer, gpu->fe_waitcycles);
>>>>>      CMD_LINK(buffer, 2,
>>>>>               etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
>>>>>               + buffer->user_size - 4);
>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>>>> index 41aab1aa330b..8c20dff32240 100644
>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>>>>> @@ -493,6 +493,13 @@ static void etnaviv_gpu_update_clock(struct etnaviv_gpu *gpu)
>>>>>              clock |= VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
>>>>>              etnaviv_gpu_load_clock(gpu, clock);
>>>>>      }
>>>>> +
>>>>> +   /*
>>>>> +    * Choose number of wait cycles to target a ~30us (1/32768) max latency
>>>>> +    * until new work is picked up by the FE when it polls in the idle loop.
>>>>> +    */
>>>>> +   gpu->fe_waitcycles = min(gpu->base_rate_core >> (15 - gpu->freq_scale),
>>>>> +                            0xffffUL);
>>>> This patch is NOT effective on our hardware GC1000 v5037 (ls7a1000 +
>>>> ls3a5000).
>>>>
>>>> As the gpu->base_rate_core is 0,  so, in the end gpu->fe_waitcycles is
>>>> also zero.
>>>>
>>> Uh, that's a problem, as the patch will then have the opposite effect
>>> on your platform by speeding up the idle loop. Thanks for catching
>>> this! I'll improve the patch to keep a reasonable amount of wait cycles
>>> in this case.
>> It's OK, no big problem as far as I can see. (it my platform's problem,
>> not your problem)
>>
> It will become a problem as it eats up the bandwidth that you want to
> spend for real graphic work.
>
>> Merge it is also OK, if we found something wrong we could fix it with a
>> another patch.
>>
> Hmm.. I think that the fix for this problem is more or less an extra
> if so I would love to see a proper fix
> before this patch gets merged.

It just no effect(at least I can't find).

I have tried, The score of glmark2 does not change, not become better, 
not become worse.

>>> Regards,
>>> Lucas
>>>
>>>> But after apply this path, the glmark2 still run happily, no influence. So
>>>>
>>>>
>>>> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>
>>>>>     }
>>>>>
>>>>>     static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>>>>> index 98c6f9c320fc..e1e1de59c38d 100644
>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
>>>>> @@ -150,6 +150,7 @@ struct etnaviv_gpu {
>>>>>      struct clk *clk_shader;
>>>>>
>>>>>      unsigned int freq_scale;
>>>>> +   unsigned int fe_waitcycles;
>>>>>      unsigned long base_rate_core;
>>>>>      unsigned long base_rate_shader;
>>>>>     };
>> --
>> Jingfeng
>>
>
-- 
Jingfeng

