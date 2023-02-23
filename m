Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA626A010C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 03:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B6110E4B0;
	Thu, 23 Feb 2023 02:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B27A10EAC1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 02:09:30 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-536cb25982eso136021167b3.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 18:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JbYdW/CMgF/JfnnuxHnRpk02gufmOMvNHJ4zCkICzbw=;
 b=KABATLx3ol5lSbON4VucpcXvsQMb43OkNuqb3pDe0SEz78dnqNSEQBS2W7v+WyMa6J
 nqLBgarNICyveVtAPLtEN89NYd2K774BOPE/x8r2HqxYuBQ3ZTD7rS9xDH803jF72YzJ
 +QxL1sC6YoaF29LmVzjd9o9nQNeFAQ/bHXGQvWfiKHxp29+tmAYZI2ea6H0ZCNAe9HSt
 639sIfmENM0CHHj/0MQcwfgVR5S+D3VO4HNm+lgbJYFNqAhsdVflamVG7NHcQICRBZSD
 opxA6eLMj1nizCSXGRehmRqzQbNXhX6JnZ0EQHXUuJ6XbdPMrHjVaEIKjR+TX/mIrc0X
 8rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JbYdW/CMgF/JfnnuxHnRpk02gufmOMvNHJ4zCkICzbw=;
 b=iW6hKW0N1EvXL1k9EHIEi6hxUpULhGZ6Ff9jo+LVqR5Ld7BwMv00/XC0XgPTxsoejF
 evOimtrisXDD+Ryi4YY2U0I7z/AkUFLBRQbluZbCW4h/sX2dC03n41ITsLMlQzCaT8J2
 K812rmwBKrrqzzMa1H97ZgO0D0wP672YEvcDsp7XKI1HLOUP/6m8JA8+sSWAYHWKArT/
 tWtI7UL4sKgMw2vQgJco7Kf77WnND1AHw+4h6YK1cre+8pNiu2XdLGxlepAyYE/+nvrD
 S/u+/eavBnNVdz77ub0ZS1F89x6xboIB2f072CjVy0B0BIP8Yp3Knyce2U+8jHtjM7rA
 Qdhg==
X-Gm-Message-State: AO0yUKWsJaociGrVtHm9n/Io3AGUkSargDJhtidXQ5JYyQY3pcD6uNb8
 YvP5b+Pr3mg4NgX+fcH3wC6RN+x7ADzRi1oZNzzYIQ==
X-Google-Smtp-Source: AK7set/bMS3BZTkPChCYgDUTiqQu8r7v3lZPx+AN3Yludgn6OW8+Ow5/FesiZx0zsAJZUHbts9E977z481wrO3/Dwy0=
X-Received: by 2002:a81:ac60:0:b0:530:9fa8:74ab with SMTP id
 z32-20020a81ac60000000b005309fa874abmr1466785ywj.3.1677118169993; Wed, 22 Feb
 2023 18:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
 <20230223-topic-opp-v2-3-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-3-24ed24cd7358@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Feb 2023 04:09:19 +0200
Message-ID: <CAA8EJprAxKCD_bJFdaMGhnwW56u+NLN_qxBV9aSzMTRdzsh07A@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/msm/a2xx: Implement .gpu_busy
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 03:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Implement gpu_busy based on the downstream msm-3.4 code [1]. This
> allows us to use devfreq on this old old old hardware!
>
> [1] https://github.com/LineageOS/android_kernel_sony_apq8064/blob/lineage-16.0/drivers/gpu/msm/adreno_a2xx.c#L1975
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Small nit below

> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index c67089a7ebc1..6f9876b37db5 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -481,6 +481,29 @@ a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>         return aspace;
>  }
>
> +/* While the precise size of this field is unknown, it holds at least these three values.. */
> +static u64 a2xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
> +{
> +       u64 busy_cycles;
> +
> +       /* Freeze the counter */
> +       gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_FREEZE);
> +
> +       busy_cycles = gpu_read64(gpu, REG_A2XX_RBBM_PERFCOUNTER1_LO);
> +
> +       /* Reset the counter */
> +       gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_RESET);
> +
> +       /* Re-enable the performance monitors */
> +       gpu_rmw(gpu, REG_A2XX_RBBM_PM_OVERRIDE2, BIT(6), BIT(6));

It's DEBUG_PERF_SCLK_PM_OVERRIDE

See https://github.com/genesi/linux-legacy/blob/master/drivers/mxc/amd-gpu/include/reg/yamato/10/yamato_mask.h#L4428

> +       gpu_write(gpu, REG_A2XX_RBBM_PERFCOUNTER1_SELECT, 1);
> +       gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, PERF_STATE_ENABLE);
> +
> +       *out_sample_rate = clk_get_rate(gpu->core_clk);
> +
> +       return busy_cycles;
> +}
> +
>  static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  {
>         ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
> @@ -502,6 +525,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
>                 .show = adreno_show,
>  #endif
> +               .gpu_busy = a2xx_gpu_busy,
>                 .gpu_state_get = a2xx_gpu_state_get,
>                 .gpu_state_put = adreno_gpu_state_put,
>                 .create_address_space = a2xx_create_address_space,
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
