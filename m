Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B024073AD87
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 01:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE35F10E5C9;
	Thu, 22 Jun 2023 23:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E5410E5C9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 23:58:03 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b4745834f3so1736881fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 16:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687478281; x=1690070281;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uOJ4sVltsZ9M5KDCRJdau/4lLhZni1wjJWsBxXT5u74=;
 b=ASIuRumXYDkQltGgNoHtUsA/rJteJwjOqzHnZajaEFZxUOGDi8DanNXp/S80k4kKAn
 nbIrf5YTD7MFjT3f/qJJmDQHn+EbMfZDD9JE8npXjRrl7IBy9hJSkUcvgs3GgDOAhZ+4
 oC+1Bi4zLSU89T+pNMXLmR0qNeQughJl6dZ/KOJAuU68u/zvSosseNSohl1mJJfYAYJT
 ufN9n6SNBM8MrAGCttO+9VqB86VngPoES5DuVDx0cWDAj43ohuuu6GvWtW5JvHdJQDte
 sz/5SnHDmdKDcrNd1n+azGyu9Rf5Pb7CzkJfJalY+w/PL/CC6EcYxSWgJ4HdanepD4t/
 X4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687478281; x=1690070281;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uOJ4sVltsZ9M5KDCRJdau/4lLhZni1wjJWsBxXT5u74=;
 b=T/10HtSYFGbBhuIOIRZzGHW5dSK8yoVWPqAwMUmAOkdvmDySj9xE3kBysUaee6xD15
 vTBZPXvX+M1a6auLnffHFQnGlXsYqhyC2lxRFEeOduwaOKg2bZ7R51sCLMDZvhn0/07A
 MyeHRwbx+1kcj32ja3tmYYg1+FiSE8OIJh5b/yVEWMb6TYXdhPai7To63rLlx4+slvRm
 r3K1HGomU3MVFiYBxuZhYz7IKLhPTNR/YtmdUE/4wu8tIG3Ss6cH/GXWep9Li20/pbfe
 k650/HXsXKr+zyn8UbbuEirCbzK25asRm2HuhblQz1Z/vrFzH7x8/yEZpCfl0aQ/sVEh
 lsJg==
X-Gm-Message-State: AC+VfDx3zmsaqCxfF3W+nMgkQDb0ynzNINZ8IDgP5CNaQQPOh4TeJs/J
 lzfk8A57xpTNICcpYqj34PTjlQ==
X-Google-Smtp-Source: ACHHUZ6fZOd207OPP7+oSgoFVH/x7Q9MUNkNe/C3uYdNnlB5Kivf3drLdrRwQJOHhBZ0wIaDI8w0FA==
X-Received: by 2002:a2e:8848:0:b0:2b5:8335:a51f with SMTP id
 z8-20020a2e8848000000b002b58335a51fmr5961013ljj.11.1687478280833; 
 Thu, 22 Jun 2023 16:58:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a2e9611000000b002adb98fdf81sm1507687ljh.7.2023.06.22.16.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 16:58:00 -0700 (PDT)
Message-ID: <0d702a8d-c9fa-1fd4-1c2b-a1a10abca22f@linaro.org>
Date: Fri, 23 Jun 2023 02:57:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/6] drm/msm/dpu: Drop unused num argument from relevant
 macros
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <20230622-devcoredump_patch-v1-2-3b2cdcc6a576@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v1-2-3b2cdcc6a576@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2023 02:48, Ryan McCann wrote:
> Drop unused parameter "num" from VIG_SBLK_NOSCALE and DMA sub block
> macros. Update calls to relevant macros to reflect change.

This is not relevant for this patchset.

With https://patchwork.freedesktop.org/patch/534745/?series=116851&rev=2 
in place, VIG_SBLK and VIG_SBLK_ROT should also stop using num. But 
let's probably take another step forward and drop both arguments and use 
just a single instance of sblk per platform. I'll send a patch for it.

> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0de507d4d7b7..69200b4cf210 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -288,7 +288,7 @@ static const uint32_t wb2_formats[] = {
>   	.rotation_cfg = rot_cfg, \
>   	}
>   
> -#define _DMA_SBLK(num, sdma_pri) \
> +#define _DMA_SBLK(sdma_pri) \
>   	{ \
>   	.maxdwnscale = SSPP_UNITY_SCALE, \
>   	.maxupscale = SSPP_UNITY_SCALE, \
> @@ -323,10 +323,10 @@ static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
>   static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
>   				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3);
>   
> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK("8", 1);
> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK("10", 3);
> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
> +static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK(1);
> +static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK(2);
> +static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK(3);
> +static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK(4);
>   
>   #define SSPP_BLK(_name, _id, _base, _len, _features, \
>   		_sblk, _xinid, _type, _clkctrl) \
> @@ -365,11 +365,11 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
>   				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
> -				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
> -static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
> +				_VIG_SBLK(10, DPU_SSPP_SCALER_QSEED4);
> +static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK(5);
> +static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK(6);
>   
> -#define _VIG_SBLK_NOSCALE(num, sdma_pri) \
> +#define _VIG_SBLK_NOSCALE(sdma_pri) \
>   	{ \
>   	.maxdwnscale = SSPP_UNITY_SCALE, \
>   	.maxupscale = SSPP_UNITY_SCALE, \
> @@ -380,8 +380,8 @@ static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>   	.virt_num_formats = ARRAY_SIZE(plane_formats), \
>   	}
>   
> -static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE("0", 2);
> -static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
> +static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE(2);
> +static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK(1);
>   
>   /*************************************************************
>    * MIXER sub blocks config
> 

-- 
With best wishes
Dmitry

