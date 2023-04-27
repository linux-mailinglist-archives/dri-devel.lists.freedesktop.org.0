Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A26F08DD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 17:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FD010EBA2;
	Thu, 27 Apr 2023 15:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5B710E00D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 15:57:30 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-957dbae98b4so1066902166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 08:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682611049; x=1685203049;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZLGlH+T2fjU4T6lhxmZEwqY6pXWUkubYT9KEtdeRnhQ=;
 b=Lx2MO7hwEgubSt7jBh5opm5oY3swh/5Q91sn49Iron6Zd69KhSRgsiGUIb/T+wPvaK
 CK6gzr42knzX/C+lbqjRH9wtHa3Fcd1CkmuH+Cs48QavafuBCWfahn/INfnS34ed/W+W
 3Sq9m/aOshi+j/omm5uGlk+F4xnuJVkGiKDGRSGj8Z8D3jRmHHBAxUkAEvQdSOMpJFjN
 hx2R57sY+uOKP/NcU0+YepaXiVi4flygCZJ0eJXlUiMz5kX6KIsMyxNnBeDjc3KpBNfD
 IEoN6NJnosFX8vsfFJsiU3l+0B0r57agINmVGyzzXmgA4VhGUfO1FiNrvgHUJJFBVeol
 53Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682611049; x=1685203049;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLGlH+T2fjU4T6lhxmZEwqY6pXWUkubYT9KEtdeRnhQ=;
 b=d5D1GkNIhVoKuvcXml4kqNMS7TplySKzyhL0HGLBTSR0eVsMlafCIwpbD87vfAr1tU
 cCSiF4Cgt9GXNt1TjOqW6Uo4cR4OUzlPZPVX9rFPClENNRbqYrxObfJ1XB3WU99pun8y
 s9tnfKuMr2U+ZXDW4h++fg3cuPRXhJZUkEohtlfH8UttrBDBfm0lNcp2J63DxTih2Ua5
 csshs9168l8zsr+2FiVioSb+2WkWil45G4gBQ8EoElJ5NDboCHIKjElWrxwWQzJ0tTp+
 tbtZTPINVviW0dDKPMHyje1Lr+gMmw97Kvm3wFCQfh2ENN4Feexers14RfSCYJaXr5jk
 DZSg==
X-Gm-Message-State: AC+VfDzmk70AX6jeBtr/V0CgUBM5dGADIWJs7A+uJkEbM7qNjI5KaO0l
 1Oe3mK0LiYTX/6jhk6SeiKh+XA==
X-Google-Smtp-Source: ACHHUZ5ng0m/bjG83RfQXfWcg608zuGJFMPzf7hkRgBQpApiE9pLag/zs0fHIXpFyYd0om4aXI6jmw==
X-Received: by 2002:a17:906:fd84:b0:94e:d72b:d10c with SMTP id
 xa4-20020a170906fd8400b0094ed72bd10cmr2276022ejb.40.1682611049258; 
 Thu, 27 Apr 2023 08:57:29 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a1709062bd900b0094fa472a7c4sm9905981ejg.161.2023.04.27.08.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 08:57:28 -0700 (PDT)
Message-ID: <a1a4f31e-b591-498d-d99e-872661d154d1@linaro.org>
Date: Thu, 27 Apr 2023 18:57:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: remove GC related code from dpu
 catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230426192246.5517-1-quic_abhinavk@quicinc.com>
 <20230426192246.5517-3-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230426192246.5517-3-quic_abhinavk@quicinc.com>
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
Cc: quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/04/2023 22:22, Abhinav Kumar wrote:
> Since Gamma Correction (GC) block is currently unused, drop
> related code from the dpu hardware catalog otherwise this
> becomes a burden to carry across chipsets in the catalog.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Link: https://lore.kernel.org/r/20230421224721.12738-2-quic_abhinavk@quicinc.com
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
>   2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 03f162af1a50..badfc3680485 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -91,7 +91,7 @@
>   
>   #define MERGE_3D_SM8150_MASK (0)
>   
> -#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
> +#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC)
>   
>   #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
>   
> @@ -449,8 +449,6 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>   static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
>   	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
>   		.len = 0x90, .version = 0x10007},
> -	.gc = { .id = DPU_DSPP_GC, .base = 0x17c0,
> -		.len = 0x90, .version = 0x10007},
>   };
>   
>   static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71584cd56fd7..e0dcef04bc61 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -127,12 +127,10 @@ enum {
>   /**
>    * DSPP sub-blocks
>    * @DPU_DSPP_PCC             Panel color correction block
> - * @DPU_DSPP_GC              Gamma correction block
>    * @DPU_DSPP_IGC             Inverse gamma correction block
>    */
>   enum {
>   	DPU_DSPP_PCC = 0x1,
> -	DPU_DSPP_GC,
>   	DPU_DSPP_IGC,

Don't we need to remove this one too (in the previous patch)?

>   	DPU_DSPP_MAX
>   };
> @@ -433,22 +431,18 @@ struct dpu_sspp_sub_blks {
>    * @maxwidth:               Max pixel width supported by this mixer
>    * @maxblendstages:         Max number of blend-stages supported
>    * @blendstage_base:        Blend-stage register base offset
> - * @gc: gamma correction block
>    */
>   struct dpu_lm_sub_blks {
>   	u32 maxwidth;
>   	u32 maxblendstages;
>   	u32 blendstage_base[MAX_BLOCKS];
> -	struct dpu_pp_blk gc;
>   };
>   
>   /**
>    * struct dpu_dspp_sub_blks: Information of DSPP block
> - * @gc : gamma correction block
>    * @pcc: pixel color correction block
>    */
>   struct dpu_dspp_sub_blks {
> -	struct dpu_pp_blk gc;
>   	struct dpu_pp_blk pcc;
>   };
>   

-- 
With best wishes
Dmitry

