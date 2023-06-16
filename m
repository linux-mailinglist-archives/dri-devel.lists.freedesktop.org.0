Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED6973372C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 19:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5DD10E66C;
	Fri, 16 Jun 2023 17:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id F071010E107;
 Fri, 16 Jun 2023 17:09:20 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxW+o+l4xkhwsGAA--.12933S3;
 Sat, 17 Jun 2023 01:09:19 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxTMo9l4xkqnsdAA--.9167S3; 
 Sat, 17 Jun 2023 01:09:17 +0800 (CST)
Message-ID: <57157e11-8aab-7181-0e8b-d336994124d9@loongson.cn>
Date: Sat, 17 Jun 2023 01:09:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v2] drm/etnaviv: slow down FE idle polling
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
References: <20230616110257.2262744-1-l.stach@pengutronix.de>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230616110257.2262744-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTMo9l4xkqnsdAA--.9167S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZry8AF45Gw15ZF15uFyxtFc_yoWrtrWUpF
 4fKFWjyryqva4jgw47JFn5XF13G3Z7WF9akayDX3s09ws8Jr1DWryUCFZ8Jr98Jr1fWrW7
 tr1YkrnrWF1jyrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8sqAU
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

Hi,


On 2023/6/16 19:02, Lucas Stach wrote:
> Currently the FE is spinning way too fast when polling for new work in
> the FE idleloop. As each poll fetches 16 bytes from memory, a GPU running
> at 1GHz with the current setting of 200 wait cycle between fetches causes
> 80 MB/s of memory traffic just to check for new work when the GPU is
> otherwise idle, which is more FE traffic than in some GPU loaded cases.
>
> Significantly increase the number of wait cycles to slow down the poll
> interval to ~30µs, limiting the FE idle memory traffic to 512 KB/s, while
> providing a max latency which should not hurt most use-cases. The FE WAIT
> command seems to have some unknown discrete steps in the wait cycles so
> we may over/undershoot the target a bit, but that should be harmless.
>
> If the GPU core base frequency is unknown keep the 200 wait cycles as
> a sane default.

Thanks for the patch, this version still works on our platform.

I add a print, the value is 200 as before.

> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
> v2: Don't speed up when the GPU core frequency is unknown.
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 11 ++++++-----
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c    |  8 ++++++++
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.h    |  1 +
>   3 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> index cf741c5c82d2..384df1659be6 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -53,11 +53,12 @@ static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
>   	OUT(buffer, VIV_FE_END_HEADER_OP_END);
>   }
>   
> -static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer)
> +static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
> +			    unsigned int waitcycles)
>   {
>   	buffer->user_size = ALIGN(buffer->user_size, 8);
>   
> -	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | 200);
> +	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
>   }
>   
>   static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
> @@ -168,7 +169,7 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
>   	/* initialize buffer */
>   	buffer->user_size = 0;
>   
> -	CMD_WAIT(buffer);
> +	CMD_WAIT(buffer, gpu->fe_waitcycles);
>   	CMD_LINK(buffer, 2,
>   		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
>   		 + buffer->user_size - 4);
> @@ -320,7 +321,7 @@ void etnaviv_sync_point_queue(struct etnaviv_gpu *gpu, unsigned int event)
>   	CMD_END(buffer);
>   
>   	/* Append waitlink */
> -	CMD_WAIT(buffer);
> +	CMD_WAIT(buffer, gpu->fe_waitcycles);
>   	CMD_LINK(buffer, 2,
>   		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
>   		 + buffer->user_size - 4);
> @@ -503,7 +504,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
>   
>   	CMD_LOAD_STATE(buffer, VIVS_GL_EVENT, VIVS_GL_EVENT_EVENT_ID(event) |
>   		       VIVS_GL_EVENT_FROM_PE);
> -	CMD_WAIT(buffer);
> +	CMD_WAIT(buffer, gpu->fe_waitcycles);
>   	CMD_LINK(buffer, 2,
>   		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
>   		 + buffer->user_size - 4);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index de8c9894967c..63b929b1e5d1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -493,6 +493,14 @@ static void etnaviv_gpu_update_clock(struct etnaviv_gpu *gpu)
>   		clock |= VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
>   		etnaviv_gpu_load_clock(gpu, clock);
>   	}
> +
> +	/*
> +	 * Choose number of wait cycles to target a ~30us (1/32768) max latency
> +	 * until new work is picked up by the FE when it polls in the idle loop.
> +	 * If the GPU base frequency is unknown use 200 wait cycles.
> +	 */
> +	gpu->fe_waitcycles = clamp(gpu->base_rate_core >> (15 - gpu->freq_scale),
> +				   200UL, 0xffffUL);
>   }
>   
>   static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 98c6f9c320fc..e1e1de59c38d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -150,6 +150,7 @@ struct etnaviv_gpu {
>   	struct clk *clk_shader;
>   
>   	unsigned int freq_scale;
> +	unsigned int fe_waitcycles;
>   	unsigned long base_rate_core;
>   	unsigned long base_rate_shader;
>   };

-- 
Jingfeng

