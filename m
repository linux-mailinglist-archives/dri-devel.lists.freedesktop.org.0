Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A169FE6D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 23:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D7910E457;
	Wed, 22 Feb 2023 22:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C946210E458
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 22:24:04 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f16so9346142ljq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 14:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NFsXN2BkZ/RtolezxjM7dDKYfNV11Lc1vqUvttS4mlw=;
 b=EO7o8Ns9MEY+Vh5cokgOBBxNj0LOGUUYcFICQVhp94Yyl/rbGVY6JsxxpSqQ9DmxLm
 KuFYfQEZqvQXaxTjCQ6PcGQxC7f/qfK3gJpn2KBX722q1z0bqaHnd2Y1lcBCZaArBZVk
 LahoDPCcvm0KugK8P2WJ9yfZORyBnvAguWxw7SuuFiuFUL0wQslMP/jvZvgml0jmk27y
 X+YokOiuB7vQ3gKr5g2vruW9CbqsYfdy38JaO+1VlaA9Zscp+sQH1/og58sig5BeYcy/
 THU/NLvjGzXflybeX6PAofpwP6xRL3Y9Q4UKnwXHxtzN1HmEvslzcegyuutNMkrJ6IV6
 x1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NFsXN2BkZ/RtolezxjM7dDKYfNV11Lc1vqUvttS4mlw=;
 b=glB4duwqNh75QxO8GX83hBiYPgTyZ2tIzpeborfCSUM6pA3iyPmsePZ4/ASs91FXjn
 tYrmjt7db5vdvBGYwCqhFoRNGMs924x2U5ORLHark9+bCOPjFDQtd0SHlTeZHhqXyUc5
 6JLOVtuH23fF5z8tQX+jdClJ2T7NKhF3zZQ3F1rzxiE4xTQ48nqL973kQDswhSFIPMFc
 f3yLYfpDrjlJKTZVrY55SRuP5RlpmGAhjS9QDsWC0qPbhxPwfc8clPQvMyrD3/pi4fZG
 230jf0WgxphtEHabLeGvjn5l4IsC2zmyT5DkTgWC8BBWB55ikobFEQEG66ofk7IsgYxh
 IM6g==
X-Gm-Message-State: AO0yUKWV2CuiLWfuviXoEDYGbZP72/sLuYUNHvk9s5plGe7JYbbdpyxD
 lTzot2VgyYNW6x8dKdn8H76X3Q==
X-Google-Smtp-Source: AK7set8qGhDntQjNsikMcGB/gQgCeoI7Q4nEM7aJGrr9UfpLQLCdYcTNNDqbEPkyDenS/LcmAzpDRg==
X-Received: by 2002:a2e:a99b:0:b0:293:42b2:5f4f with SMTP id
 x27-20020a2ea99b000000b0029342b25f4fmr3537269ljq.17.1677104642948; 
 Wed, 22 Feb 2023 14:24:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a2e9d4c000000b00295945c9d69sm455080ljj.50.2023.02.22.14.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:24:02 -0800 (PST)
Message-ID: <9b535af0-7159-14b3-560f-197c7153b78c@linaro.org>
Date: Thu, 23 Feb 2023 00:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/5] drm/msm/a2xx: Implement .gpu_busy
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-2-01021425781b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-2-01021425781b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2023 23:47, Konrad Dybcio wrote:
> Implement gpu_busy based on the downstream msm-3.4 code [1]. This
> allows us to use devfreq on this old old old hardware!
> 
> [1] https://github.com/LineageOS/android_kernel_sony_apq8064/blob/lineage-16.0/drivers/gpu/msm/adreno_a2xx.c#L1975
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index c67089a7ebc1..6258c98e5a88 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -481,6 +481,33 @@ a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>   	return aspace;
>   }
>   
> +/* While the precise size of this field is unknown, it holds at least these three values.. */
> +#define PERF_MODE_CNT		GENMASK(2, 0)
> + #define PERF_STATE_RESET	0x0
> + #define PERF_STATE_ENABLE	0x1
> + #define PERF_STATE_FREEZE	0x2

These should go into a2xx.xml.h

LGTM otherwise.

> +static u64 a2xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
> +{
> +	u64 busy_cycles;
> +
> +	/* Freeze the counter */
> +	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, FIELD_PREP(PERF_MODE_CNT, PERF_STATE_FREEZE));
> +
> +	busy_cycles = gpu_read64(gpu, REG_A2XX_RBBM_PERFCOUNTER1_LO);
> +
> +	/* Reset the counter */
> +	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, FIELD_PREP(PERF_MODE_CNT, PERF_STATE_RESET));
> +
> +	/* Re-enable the performance monitors */
> +	gpu_rmw(gpu, REG_A2XX_RBBM_PM_OVERRIDE2, BIT(6), BIT(6));
> +	gpu_write(gpu, REG_A2XX_RBBM_PERFCOUNTER1_SELECT, 1);
> +	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, FIELD_PREP(PERF_MODE_CNT, PERF_STATE_ENABLE));
> +
> +	*out_sample_rate = clk_get_rate(gpu->core_clk);
> +
> +	return busy_cycles;
> +}
> +
>   static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>   {
>   	ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
> @@ -502,6 +529,7 @@ static const struct adreno_gpu_funcs funcs = {
>   #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
>   		.show = adreno_show,
>   #endif
> +		.gpu_busy = a2xx_gpu_busy,
>   		.gpu_state_get = a2xx_gpu_state_get,
>   		.gpu_state_put = adreno_gpu_state_put,
>   		.create_address_space = a2xx_create_address_space,
> 

-- 
With best wishes
Dmitry

