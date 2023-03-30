Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C34D6D04A8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EDC10E2C6;
	Thu, 30 Mar 2023 12:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8696910E2C6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:27:19 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y15so24272577lfa.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680179237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ajg+Ow3guC3qmD9ltJQQ/qpcwXPjWBWk66w6LzjOyc=;
 b=e8s7PLeHztUwWtVS9lK5ENZUmLabsRe84+y7W5+EVLiREZYOp+jO7L9nRPyAZcfP2Q
 NF4eQdwlSz/Ex3cMEEf5E7wRT4MEvBysKCYFnTP9fqobGGdC305vIzDXnDxicJ0/pEl0
 kxs8B/6uvhxfVSw0dLR+ipwDHFzqXfam5q4NyQGTX8RrGDKanN+Rrw+Zpi4bPFRpn2z3
 llcFAfva1+3u2mn8yWIyumN3oB4/RDyWyyAs6+3XjICML5LdcXUtIDUA2jpisrUwThbV
 qtpCxgfSf8Nl11QttrQc03LJH52P9lNTi2HPy7DhFO0blyftGDHNaUMnjYwST3UOQ7UQ
 A6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ajg+Ow3guC3qmD9ltJQQ/qpcwXPjWBWk66w6LzjOyc=;
 b=ptMXoZz3q+UiuhX0Dedu285C/IyjL6t2oCiBzMjZYLednPLzCEvjdCs6Iuy4xAzxmg
 Qv4J3cxZv8JsD9TYaG0QoyQ3A30qrJe/ezTcYGqLZ6PvJANuYG4HPdAMbimfFNJYbBjg
 aq54FdRINQbIeGOzxbZVb8c4hSvXXs1zym0oXiTqoWyxwOyLTiiOzuEflypFQdQkcnny
 qwK1ZsZoj2cElF31GNm2pvnYTab1xHMp/VjTj5SB73yl5yFWBtRtyFAng3yl6OC9Yego
 7dlNXUV3pX4jT/AT72efORjXxHFuL09NJFKCKrnPR8D/chGBXeWDKR0+9AVAJYMV54D8
 GVHA==
X-Gm-Message-State: AAQBX9d5MuJLb0Z6pFLLzQ6rM1sW3g5mPuvWoSLhLTKCL21XvFCy+6ZD
 6gsap+vrCJW/89ArA4BaIzi7kntvUHMVOYeZkUg=
X-Google-Smtp-Source: AKy350a1ePYekgS4apQXRW83eXljH82vSN6O8eqRECd7itzHhQoORQ5JmffHG43FiBCqFs9ooNUTzQ==
X-Received: by 2002:ac2:50c5:0:b0:4db:2c28:8974 with SMTP id
 h5-20020ac250c5000000b004db2c288974mr6841672lfm.12.1680179237676; 
 Thu, 30 Mar 2023 05:27:17 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 i17-20020ac25231000000b004eafa77e435sm3343664lfl.146.2023.03.30.05.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:27:17 -0700 (PDT)
Message-ID: <663f6933-d532-37e4-e78b-9bd665c24e54@linaro.org>
Date: Thu, 30 Mar 2023 14:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,34/50] drm/msm/dpu: duplicate sm8250 catalog entries
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-35-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-35-dmitry.baryshkov@linaro.org>
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
> Duplicate some of sm8250 catalog entries to remove dependencies between
> DPU major generations.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index d723a690bd41..b27f6c528a1f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -81,6 +81,25 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
>  	},
>  };
>  
> +static const struct dpu_sspp_cfg sm8350_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
> +		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
> +		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
> +		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
> +		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> +};
> +
>  static const struct dpu_lm_cfg sm8350_lm[] = {
>  	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>  		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> @@ -178,8 +197,8 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
>  	.mdp = sm8350_mdp,
>  	.ctl_count = ARRAY_SIZE(sm8350_ctl),
>  	.ctl = sm8350_ctl,
> -	.sspp_count = ARRAY_SIZE(sm8250_sspp),
> -	.sspp = sm8250_sspp,
> +	.sspp_count = ARRAY_SIZE(sm8350_sspp),
> +	.sspp = sm8350_sspp,
>  	.mixer_count = ARRAY_SIZE(sm8350_lm),
>  	.mixer = sm8350_lm,
>  	.dspp_count = ARRAY_SIZE(sm8350_dspp),
