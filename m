Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E975C3DAD87
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 22:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8736EE53;
	Thu, 29 Jul 2021 20:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238D66EE53
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 20:25:25 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id h11so9097567ljo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 13:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pr0DaHa/zY3zZ7CWN2sL39UmzN4TMNfowFEuDM2tCjs=;
 b=gx3Fwfl0kR+A+jdmsZn+Cideu/W+gxBz1EunOngbrIyTKw1jqFAKeF5zpFr7lNh7hj
 2ZXxi/1mN27bS9Q4FbBg4JrVsWyN8pwTNH6aVIO/uwm3xJTlYC80kHrMd5tZjbhi6WG3
 3JYraHp6i+RNXlVCibdKUBCswW5HGwyZQqEwUeS17n7QV5cpf8A6njVRkeFN8Yw1TAL2
 sx4ZxZ5atm8+5Gd5Yq2O11iocL//9LTHwQC1YhcfQ8TRtbWTuB4AHx3l21ef3hjUjQS3
 2fj4n0pKghMbBhKZNGy4sx635NpTF3G06COaCPvHAc9dZZFpGJEoD9HbQrqsYh10fo7M
 l5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pr0DaHa/zY3zZ7CWN2sL39UmzN4TMNfowFEuDM2tCjs=;
 b=b8MBvs3th4C2DSBqrqtRB0IjBD4CpZViWfx5VjuLPyyosEA+rOD30/L2PkwigjrQQb
 BlahbgpxqIrfN2x9F4HueVLS1EBaMlOgi/Ac8RdFvKL3Ff2STnpvIbeTJrNiXEZ9QKhZ
 Cu93mfqT6olKVG/H6ev55gh+oOEumjLvCD3CTWBOfJC0ZuLXt6vy7wVXdJEbepQchKHR
 oXEOX+raQzvy49I+V2XPE3XyIbg13jIENwwPAYKqRm6btE4A+KEsNR9ab490kWwWV5OI
 JveW/CKmYP82R/JLAE70eprmWpO/Gtyn2ybuTfO2PZxBp3iBJnBPCKnxSkzBYT4mAN4Y
 qIDA==
X-Gm-Message-State: AOAM5306eOkK/2z3ygRQsewL+LqRTAkK6+/Ms2PrByOnRNXUbqcQsXox
 2bzbKXVR1DB/iqtcPI1fsMU7wA==
X-Google-Smtp-Source: ABdhPJwyM2eZLESycIDVkF/4Q765O0et6SvtERZZzVMCg0jlcdmg9fr7pyjU7i3soWJJCAKPbBlUXQ==
X-Received: by 2002:a05:651c:d5:: with SMTP id
 21mr3885237ljr.135.1627590323582; 
 Thu, 29 Jul 2021 13:25:23 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u26sm387852lfi.305.2021.07.29.13.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 13:25:23 -0700 (PDT)
Subject: Re: [PATCH 05/11] drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-6-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <927826ce-eae5-0089-6874-eb14d8e16169@linaro.org>
Date: Thu, 29 Jul 2021 23:25:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210715065203.709914-6-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/07/2021 09:51, Vinod Koul wrote:
> This add SDM845 DSC blocks into hw_catalog
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since RFC:
>   - use BIT values from MASK
> 
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b569030a0847..b45a08303c99 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -40,6 +40,8 @@
>   
>   #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
>   
> +#define DSC_SDM845_MASK BIT(1)
> +

This does not seem used. You can pass (0) as the feature mask.

>   #define PINGPONG_SDM845_SPLIT_MASK \
>   	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>   
> @@ -751,6 +753,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk),
>   	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk),
>   };
> +
> +/*************************************************************
> + * DSC sub blocks config
> + *************************************************************/
> +#define DSC_BLK(_name, _id, _base) \
> +	{\
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = 0x140, \
> +	.features = DSC_SDM845_MASK, \
> +	}
> +
> +static struct dpu_dsc_cfg sdm845_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400),
> +	DSC_BLK("dsc_2", DSC_2, 0x80800),
> +	DSC_BLK("dsc_3", DSC_3, 0x80c00),
> +};
> +
>   /*************************************************************
>    * INTF sub blocks config
>    *************************************************************/
> @@ -1053,6 +1073,8 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.mixer = sdm845_lm,
>   		.pingpong_count = ARRAY_SIZE(sdm845_pp),
>   		.pingpong = sdm845_pp,
> +		.dsc_count = ARRAY_SIZE(sdm845_dsc),
> +		.dsc = sdm845_dsc,
>   		.intf_count = ARRAY_SIZE(sdm845_intf),
>   		.intf = sdm845_intf,
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> 


-- 
With best wishes
Dmitry
