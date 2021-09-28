Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09E941B40A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 18:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A9389CB8;
	Tue, 28 Sep 2021 16:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADA489CB8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 16:39:17 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id i4so95273729lfv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G7Nu624BHA+ciBaAN51wOEprdQ45Szw6B8+mMioIzMU=;
 b=cetdKQLhcnBhXSFEllvSJ8rYG6P547knd8cgm9LIqgEBIpZbimxBdLyGX5CLabrDi2
 uiLSxpnHuOhVwpOg/pWAfEVtMdG1dS4PBMGIF/oy7GAyQ2xf9y+1EtWxxId3s9NIlvao
 v/lb3+AibTbQAIj+2DJu5cdBrkKvqBEJFLvTBlh7QM7HcrmdXH635oioXiHj26pFw8dM
 MyoltSzyCbx8X6MgoyFB6SyYgw0itqm+KK7oSR1GwxcRZaXXKr8syeTCWFN1RSwjaMLB
 FCicBfESaEPfPJszwJV0M43V04uc7L4ayKKK1LQ+VahfpNjLioeyiqxoyysoOv+kXDVE
 TeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G7Nu624BHA+ciBaAN51wOEprdQ45Szw6B8+mMioIzMU=;
 b=0OP4DzknkK7wyItfmaYcvxELXCIVeB1JY4MNl01ghcvwICIODFIFqQ6oQjotw1aNcO
 bp8Vs54W+7D6osZpLLHTPU3jshuMXYrt3IHW0s4gA8Dc4E4/GLyzXLtHg4BTbUTtG/A9
 PO6vLO6RWNk4NA2nyEu3WiYb7SvnnkABmtjOBld8Clri0nVLExBevxmZWoJkVE9Dkr6r
 DxGXlYjsY8oQfxNEZ+8K+w02Z0leeOie+CBXTKpOgw/0FZ+Gs4fUVsOMa/idS+tBFbYy
 O0ulm5QOcs++TnWY1GGJp12t5R8e8Cd8kel37cmhuiYV+7n7C29j/mN3UyRau42aXZC5
 z36g==
X-Gm-Message-State: AOAM5305r1Jkk9rbf4Wb0Hwcqa2DUKnKUq32TjB0WtdqpLD00zdcGgue
 aWmAxw2PEmdpxB+w4/O6oyGVNw==
X-Google-Smtp-Source: ABdhPJyCj8nkgVuxflTeFioAAJwZAukYxUdj8p/t666Q+NKGnuf9aDbO0HpPK9CHZhyIDATH2r/4Lg==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr6633392lfq.596.1632847155514; 
 Tue, 28 Sep 2021 09:39:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u10sm1970336lfl.87.2021.09.28.09.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 09:39:14 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dpu: Remove some nonsense
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Lee Jones
 <lee.jones@linaro.org>, open list <linux-kernel@vger.kernel.org>
References: <20210928162903.1104847-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <dbefd596-4382-3822-fdec-486cf3df1560@linaro.org>
Date: Tue, 28 Sep 2021 19:39:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928162903.1104847-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/09/2021 19:28, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> These aren't used.  And if we add use for them later, we should probably
> do something a bit more structured than string parsing.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
>   2 files changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b131fd376192..e32dbb06aad1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -958,12 +958,6 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
>   	.min_core_ib = 2400000,
>   	.min_llcc_ib = 800000,
>   	.min_dram_ib = 800000,
> -	.core_ib_ff = "6.0",
> -	.core_clk_ff = "1.0",
> -	.comp_ratio_rt =
> -	"NV12/5/1/1.23 AB24/5/1/1.23 XB24/5/1/1.23",
> -	.comp_ratio_nrt =
> -	"NV12/5/1/1.25 AB24/5/1/1.25 XB24/5/1/1.25",
>   	.undersized_prefill_lines = 2,
>   	.xtra_prefill_lines = 2,
>   	.dest_scale_prefill_lines = 3,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d2a945a27cfa..4ade44bbd37e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -676,10 +676,6 @@ struct dpu_perf_cdp_cfg {
>    * @min_core_ib        minimum mnoc ib vote in kbps
>    * @min_llcc_ib        minimum llcc ib vote in kbps
>    * @min_dram_ib        minimum dram ib vote in kbps
> - * @core_ib_ff         core instantaneous bandwidth fudge factor
> - * @core_clk_ff        core clock fudge factor
> - * @comp_ratio_rt      string of 0 or more of <fourcc>/<ven>/<mod>/<comp ratio>
> - * @comp_ratio_nrt     string of 0 or more of <fourcc>/<ven>/<mod>/<comp ratio>
>    * @undersized_prefill_lines   undersized prefill in lines
>    * @xtra_prefill_lines         extra prefill latency in lines
>    * @dest_scale_prefill_lines   destination scaler latency in lines
> @@ -702,10 +698,6 @@ struct dpu_perf_cfg {
>   	u32 min_core_ib;
>   	u32 min_llcc_ib;
>   	u32 min_dram_ib;
> -	const char *core_ib_ff;
> -	const char *core_clk_ff;
> -	const char *comp_ratio_rt;
> -	const char *comp_ratio_nrt;
>   	u32 undersized_prefill_lines;
>   	u32 xtra_prefill_lines;
>   	u32 dest_scale_prefill_lines;
> 


-- 
With best wishes
Dmitry
