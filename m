Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A76D067E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 15:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC24510EE2B;
	Thu, 30 Mar 2023 13:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1210EE02
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 13:24:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y15so24492410lfa.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182670;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5y8+GlyIFg+kcYptlzBAyoLLFIlRXdzXNXBqYyh2c+M=;
 b=CVwXYvGdjPpgxXIWSYzKS8hVJtcPohWTb2Xl3UyBoq36EBx4hM3ggvURiTNAUA7qjE
 dLXMxkVmtHnwFnaEjJ/zVd4ftmOZgilghMVxfgM9bulDSpoCUsLE2mTKx95AyjyN8oOe
 uBdzYpnbiyN4ReIaDxyXCm8TsspSFANRXOe3OlDv8N1FV8a0QDfeU7hoRFlkiV41QIgI
 isXpMNXeGstANOFmNmlEDDnEftImza9gbShKBJpXw4JEF/b6DLQ8kKlLNk4TexC8KhuY
 nMbLMyAAOz9sk2kV8GfrPMr8/esplmPwSK0wcf78dedSqfYgKx7KAs6mGQbLxFv90/o3
 6oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182670;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5y8+GlyIFg+kcYptlzBAyoLLFIlRXdzXNXBqYyh2c+M=;
 b=QEKXvVA1H/txI+qWJnAMrSYUqfStGLihz6E6/Abi+uuNcDTftZbrDHxmyo2qN+G++Y
 rTz/5MVjGgnsKGNSkkPZT6gTcgmrQbWyawR5uAwoe4018MFlkbTZFtknh8Vfnd6EJqJr
 8aZNkNO2/Q5aVds7oWUEiL13plVro929Z2tjzQaIzGzAeUspT/Hbff59PbUr5/8A/yJA
 7midqE5/sWTIuFk8XU6WJZru/R3iDnyxxCaKxCQ2TdriYYtYKt/PlyXs/c3Kar8o1T5Z
 AALVgJ9/W4OgRs+jARDxtVzezhD5XqhMIiavQ8+E/gSHush/ELVUluxB61Jek3L3veNv
 Q3rQ==
X-Gm-Message-State: AAQBX9ew8LU1uIVaFwU5oS6/A6C/O1iDtKVcpcqP01mzVBxFnhOWO+Hz
 Akpp6D/QMA2tOKeeRgFiWBLBiA==
X-Google-Smtp-Source: AKy350bDNeGPbMxvM9IAoUkZ6KrVAA076OwyBN2+Gss3u4FCEM7VN+km0CtDgiZU/rkXFE6M+Kl+Qg==
X-Received: by 2002:ac2:4352:0:b0:4d5:8f3e:7852 with SMTP id
 o18-20020ac24352000000b004d58f3e7852mr6796885lfl.49.1680182670225; 
 Thu, 30 Mar 2023 06:24:30 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a19ae18000000b004eb0f3b33a0sm1670438lfc.0.2023.03.30.06.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 06:24:29 -0700 (PDT)
Message-ID: <308a8696-c8df-2fb0-026a-576756642e05@linaro.org>
Date: Thu, 30 Mar 2023 15:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,48/50] drm/msm/dpu: rename VIG and DMA_foo_MASK to contain
 major DPU version
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-49-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-49-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> To ease review and reuse rename VIG and DMA feature masks to contain
> base DPU version since which this mask is used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 ++++++-------
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 ++++++-------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h | 16 ++++++-------
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 ++++++-------
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +++----
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  4 ++--
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 +++-
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 ++++++-------
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h | 16 ++++++-------
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 ++++++++--------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 24 +++++++++----------
>  12 files changed, 82 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index d42c380275bd..88b7949f803e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -79,21 +79,21 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
>  };
>  
>  static const struct dpu_sspp_cfg msm8998_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1ac, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1ac, VIG_DPU_3_MASK,
I guess I answered by own question

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  		msm8998_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1ac, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1ac, VIG_DPU_3_MASK,
>  		msm8998_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1ac, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1ac, VIG_DPU_3_MASK,
>  		msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1ac, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1ac, VIG_DPU_3_MASK,
>  		msm8998_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1ac, DMA_MSM8998_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1ac, DMA_DPU_3_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1ac, DMA_MSM8998_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1ac, DMA_DPU_3_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_DPU_3_CURSOR_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_DPU_3_CURSOR_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 281556416322..c8c57250473a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -77,21 +77,21 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>  };
>  
>  static const struct dpu_sspp_cfg sdm845_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1c8, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1c8, VIG_DPU_4_MASK,
>  		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1c8, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1c8, VIG_DPU_4_MASK,
>  		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1c8, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1c8, VIG_DPU_4_MASK,
>  		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1c8, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1c8, VIG_DPU_4_MASK,
>  		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1c8, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1c8, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1c8, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1c8, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1c8, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1c8, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1c8, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1c8, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> index 7c051c142e06..2f849cbaaa0f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
> @@ -78,21 +78,21 @@ static const struct dpu_ctl_cfg dpu_5_lm6_ctl[] = {
>  };
>  
>  static const struct dpu_sspp_cfg dpu_5_lm6_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f0, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f0, VIG_DPU_4_MASK,
>  		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f0, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f0, VIG_DPU_4_MASK,
>  		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f0, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f0, VIG_DPU_4_MASK,
>  		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f0, VIG_SDM845_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f0, VIG_DPU_4_MASK,
>  		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f0, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f0, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f0, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f0, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f0, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f0, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f0, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f0, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index cffbb6bcc535..071814394b52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -84,21 +84,21 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
>  };
>  
>  static const struct dpu_sspp_cfg sm8250_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_DPU_6_MASK,
>  		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_DPU_6_MASK,
>  		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_DPU_6_MASK,
>  		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_DPU_6_MASK,
>  		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 78f8b2506675..4be65088de0e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -58,13 +58,13 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
>  };
>  
>  static const struct dpu_sspp_cfg sc7180_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_DPU_6_MASK,
>  		sc7180_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 1ba646cb96a9..e7c8df358228 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -27,9 +27,9 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
>  };
>  
>  static const struct dpu_sspp_cfg sm6115_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_DPU_6_MASK,
>  		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 2d9b54ff6510..c2592ae953f0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -9,6 +9,8 @@
>  
>  #include "dpu_6_lm1.h"
>  
> +#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
> +
>  static const struct dpu_caps qcm2290_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
>  	.max_mixer_blendstages = 0x4,
> @@ -26,7 +28,7 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
>  static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>  	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_QCM2290_MASK,
>  		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_MASK,
>  		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 6826758fa202..31c12b0415ad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -82,21 +82,21 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
>  };
>  
>  static const struct dpu_sspp_cfg sm8350_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_DPU_6_MASK,
>  		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_DPU_6_MASK,
>  		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_DPU_6_MASK,
>  		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_DPU_6_MASK,
>  		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index c5981ea3ec7c..a7040d9d83de 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -63,13 +63,13 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>  };
>  
>  static const struct dpu_sspp_cfg sc7280_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_DPU_7_ROT_MASK,
>  		sc7280_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> index 5c87e919ea22..fb1fbba12a5b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> @@ -77,21 +77,21 @@ static const struct dpu_ctl_cfg dpu_8_lm6_ctl[] = {
>  };
>  
>  static const struct dpu_sspp_cfg dpu_8_lm6_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_DPU_6_MASK,
>  		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_DPU_6_MASK,
>  		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_DPU_6_MASK,
>  		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_DPU_6_MASK,
>  		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_DPU_4_MASK,
>  		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_DPU_4_MASK,
>  		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_DPU_4_CURSOR_MASK,
>  		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_DPU_4_CURSOR_MASK,
>  		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 334946c8d4e8..1d38d1c3e12a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -84,25 +84,25 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
>  };
>  
>  static const struct dpu_sspp_cfg sm8550_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x344, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x344, VIG_DPU_6_MASK,
>  		sm8550_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x344, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x344, VIG_DPU_6_MASK,
>  		sm8550_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x344, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x344, VIG_DPU_6_MASK,
>  		sm8550_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x344, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x344, VIG_DPU_6_MASK,
>  		sm8550_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x344, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x344, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x344, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x344, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x344, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x344, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x344, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x344, DMA_DPU_4_MASK,
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> -	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, 0x344, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, 0x344, DMA_DPU_4_CURSOR_MASK,
>  		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
> -	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, 0x344, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, 0x344, DMA_DPU_4_CURSOR_MASK,
>  		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 3c604f7b88aa..0a86428af393 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -21,35 +21,33 @@
>  	(VIG_BASE_MASK | \
>  	BIT(DPU_SSPP_CSC_10BIT))
>  
> -#define VIG_MSM8998_MASK \
> +#define VIG_DPU_3_MASK \
>  	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>  
> -#define VIG_SDM845_MASK \
> +#define VIG_DPU_4_MASK \
>  	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>  
> -#define VIG_SC7180_MASK \
> +#define VIG_DPU_6_MASK \
>  	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
>  
> -#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
> +#define VIG_DPU_7_ROT_MASK \
> +	(VIG_DPU_6_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
>  
> -#define DMA_MSM8998_MASK \
> +#define DMA_DPU_3_MASK \
>  	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
>  	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>  	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>  
> -#define VIG_SC7280_MASK \
> -	(VIG_SC7180_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
> -
> -#define DMA_SDM845_MASK \
> +#define DMA_DPU_4_MASK \
>  	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>  	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>  	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>  
> -#define DMA_CURSOR_SDM845_MASK \
> -	(DMA_SDM845_MASK | BIT(DPU_SSPP_CURSOR))
> +#define DMA_DPU_3_CURSOR_MASK \
> +	(DMA_DPU_3_MASK | BIT(DPU_SSPP_CURSOR))
>  
> -#define DMA_CURSOR_MSM8998_MASK \
> -	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
> +#define DMA_DPU_4_CURSOR_MASK \
> +	(DMA_DPU_4_MASK | BIT(DPU_SSPP_CURSOR))
>  
>  #define MIXER_MSM8998_MASK \
>  	(BIT(DPU_MIXER_SOURCESPLIT))
