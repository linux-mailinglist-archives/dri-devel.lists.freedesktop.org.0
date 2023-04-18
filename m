Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30E06E65A8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E698110E745;
	Tue, 18 Apr 2023 13:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06E210E67A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:16:29 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4ec81779f49so2124125e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681823787; x=1684415787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sgggcNwZXxbZHeP3Mj+Q6o2cKdV7dl9LMQfDCRj8a40=;
 b=VuLA4kwBkWJxCPoWIk3ZYahaoHb/XNVxbHtSUHsxlrCzRPcjeLV+ZUFn0oWz9vocdm
 KgXzzc3g5g/z12gD2TCLJ+uCMB6+smxnNk89Tz0GvhqagcYDdT5Jo2EGf1fEozhlW5ws
 5aJelw7B0itzLO9cu2jl7iTMgsfCbgAP6wCn3jiX7+mViPZYQwQ8wL+b+VxANJCf6h9G
 KNDj+zWNX46x4Ze9GF5L5AlitGkMmlOmxQ3KbLp2EHZOB8XfV68/xvV/OM5t3NHHF4nG
 ayHjfX1Vwny36jTU9QX/VsotGr7ZJmW8Tk9iYT/FUNeIxOLsqDTktHvv9N1PRQFINdOZ
 wpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681823787; x=1684415787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sgggcNwZXxbZHeP3Mj+Q6o2cKdV7dl9LMQfDCRj8a40=;
 b=k9eqg89rXpEBfRwp+RyeQPerHaygZ/tAlhTE6p5Ivtm6RSqAACaZ9R0/Vhjpr0HFEW
 004SqPatEIzl0nDqlmsGjJeZgZL2LVbjf3KEWADGvjtt4MNyz6ZNqVtBn1RdAgyMSt5r
 E1XaEK5l20u4hRMZNgSD/h42vRD6z9oH2IsqrAcLlIMhDSGMQ7dpF+QwRNV/uo8rDgST
 jvIb2rw5u52t8yiS9vXhMXGW9MKmQaTZBcHNXasfjpH6YBuRmokze6LNYf7hPD/nh7xr
 AGUQUV3TKdP14pg4N6rlwezj7I36KsuCN6w1135AGkPBX5KumLbPbvVPfWxDjCZaVMO0
 0ZmA==
X-Gm-Message-State: AAQBX9eTWQ9Qseh5dLDqCQ8W38t1V0tmXUIFnL2nGJKujuWVs+jkFwC6
 zRu8UwUb91sBpg3IS+YS+ONO/g==
X-Google-Smtp-Source: AKy350YjQozNSVtD7xe9gVWsEYAU8euckO/IZUoPxURb5KB+0cjRoKY3fF5uX/VO2rbFgZSy4kBAjA==
X-Received: by 2002:a19:520a:0:b0:4eb:4523:d2e6 with SMTP id
 m10-20020a19520a000000b004eb4523d2e6mr2915448lfb.24.1681823787229; 
 Tue, 18 Apr 2023 06:16:27 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a056512024100b004edc9e9eec5sm373340lfo.138.2023.04.18.06.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 06:16:26 -0700 (PDT)
Message-ID: <f0ceef33-47be-6c4c-175b-7202791f0890@linaro.org>
Date: Tue, 18 Apr 2023 15:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 17/17] drm/msm/dpu: Remove intr_rdptr from DPU >= 5.0.0
 pingpong config
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-17-ef76c877eb97@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-17-ef76c877eb97@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.04.2023 22:21, Marijn Suijten wrote:
> Now that newer DPU platforms use a readpointer-done interrupt on the
> INTF block, stop providing the unused interrupt on the PINGPONG block.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  |  8 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h |  8 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  |  8 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  |  8 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  | 10 +++++-----
>  7 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index e8d25a45d6b3..a6dbc4c8acb8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -130,16 +130,16 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
>  static const struct dpu_pingpong_cfg sm8150_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +			-1),
>  	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +			-1),
>  	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +			-1),
>  	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +			-1),
>  	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 62857288ad91..14d5ead8d40c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -118,16 +118,16 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>  static const struct dpu_pingpong_cfg sc8180x_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +			-1),
>  	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +			-1),
>  	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +			-1),
>  	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +			-1),
>  	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index f77329ab397d..f98ca0f1e4a9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -131,16 +131,16 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
>  static const struct dpu_pingpong_cfg sm8250_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +			-1),
>  	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +			-1),
>  	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +			-1),
>  	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +			-1),
>  	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 5509ceb5d55b..ba9de008519b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -62,7 +62,7 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
>  static const struct dpu_pingpong_cfg sm6115_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>  		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +		-1),
>  };
>  
>  static const struct dpu_intf_cfg sm6115_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 22b8a173d214..92ac348eea6b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -59,7 +59,7 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
>  static const struct dpu_pingpong_cfg qcm2290_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>  		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +		-1),
>  };
>  
>  static const struct dpu_intf_cfg qcm2290_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 220ba7bdeb20..7cec702c2429 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -129,16 +129,16 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
>  static const struct dpu_pingpong_cfg sm8350_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +			-1),
>  	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +			-1),
>  	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +			-1),
>  	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +			-1),
>  	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 5d8f381e1708..5f2ab9bcd04d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -126,20 +126,20 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
>  	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
>  		 &sm8150_dspp_sblk),
>  };
> -/* FIXME: interrupts */
> +
>  static const struct dpu_pingpong_cfg sm8450_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +			-1),
>  	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +			-1),
>  	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +			-1),
>  	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +			-1),
>  	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> 
