Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499E6E64EF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C561B10E798;
	Tue, 18 Apr 2023 12:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEF010E750
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:53:37 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2a8aea2a610so20731001fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681822415; x=1684414415;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bs9Ou57XnyuZS2nX1xCivIna6QooBrBE3CjDl6orL5s=;
 b=qda26wLZH2KkO8oDTJlsPiEiQ0sigU4uLUTJQ4nD1Rb0h76dm52grDbpr9oI9nx5LK
 uQgazmmvLx7ZhtNMeZnH+8p1VvyCR2gJt2hHkRv43+fAkSRk+0jLmfMcep5Mk0LZPWeM
 HRgTgvi83PiuB3fheiTV4k+cR8ld6wSUfYrnZcPzswDTbJu1khWxpDF1IXSnn/0y5svE
 gbprxT5zQUR+3UVu8PVCnssbmdBVI1cYkVgTThYw19HnMEKFZNSdzsuH1DWWpqEe6biG
 9zbzTf2Ga5L8xL1UbBsllmPYZBkH1Pjv/a9ASsH0t05qAKMLegrihQ8DIB/hlfx8mzf1
 erfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681822415; x=1684414415;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bs9Ou57XnyuZS2nX1xCivIna6QooBrBE3CjDl6orL5s=;
 b=X0ywtKiHW/ND99qoe0axtB0hnIY/MvYC2fohpJys6uc/51IFbm05c3bci1NXs8qacH
 Vd4IBTRFoUzG/8X9v/sHZzo0+iPchFyy5mA2WCGTTs++l1DFoWtMqJzYWOSHthbW4Ic8
 TpQ50jo+w0zIXC1GgjtcUbHURTxVCHKYubPAkQ8TyK8SsfGpFvJNpBM2G/z4VXpaMPu4
 Vrb4tTAPyqk4E/Q7omVMd/VatsrSxASNLMQTAbL+QK+h9jaXOaxrFbSu2lMO+OdUJud/
 mD2X3fm0FjyCEe9kQFEmUX+z5Aj/R5XOvHTVSTQbnYfs9jDr8oipPv3RLjE2MqBcGswz
 0VCg==
X-Gm-Message-State: AAQBX9fyAtAmpMDAo9A0l+RMU1lA8WoQwyOHqL4PiqwsbLVBvC056pRx
 gWxZk/trbBVyYmmcaSlT2VdO7g==
X-Google-Smtp-Source: AKy350a+VAQAONHlvU2alG6Ry/Z+XJfSNn2hqii73ueQlIzRYi7SFDBjZRqRFVZ2bmGfMVPJgYkj3w==
X-Received: by 2002:ac2:4834:0:b0:4ed:3436:ccd6 with SMTP id
 20-20020ac24834000000b004ed3436ccd6mr2573867lft.20.1681822415492; 
 Tue, 18 Apr 2023 05:53:35 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a197618000000b004edd2e04d81sm166767lff.31.2023.04.18.05.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 05:53:35 -0700 (PDT)
Message-ID: <e377d8e4-9335-e9b8-6000-36a8f7d79e15@linaro.org>
Date: Tue, 18 Apr 2023 14:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 13/17] drm/msm/dpu: Factor out shared interrupt
 register in INTF_BLK macro
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
 <20230411-dpu-intf-te-v2-13-ef76c877eb97@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-13-ef76c877eb97@somainline.org>
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
> As the INTF block is going to attain more interrupts that don't share
> the same MDP_SSPP_TOP0_INTR register, factor out the _reg argument for
> the caller to construct the right interrupt index (register and bit
> index) to not make the interrupt bit arguments depend on one of multiple
> interrupt register indices.  This brings us more in line with how PP_BLK
> specifies its interrupts and allows for better wrapping in the arrays.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 16 +++++++---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 16 +++++++---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 +++++++---
>  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24 +++++++++++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 16 +++++++---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  8 +++--
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  6 ++--
>  .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  6 ++--
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 16 +++++++---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 12 ++++++--
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 36 ++++++++++++++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 16 +++++++---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 +++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  6 ++--
>  14 files changed, 155 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 6906f8046b9e..c0dd4776f539 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -134,10 +134,18 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
>  };
>  
>  static const struct dpu_intf_cfg msm8998_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 25, INTF_SDM845_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 25, INTF_SDM845_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 25, INTF_SDM845_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_HDMI, 0, 25, INTF_SDM845_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>  };
>  
>  static const struct dpu_perf_cfg msm8998_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 14ce397800d5..b109757b0672 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -132,10 +132,18 @@ static const struct dpu_dsc_cfg sdm845_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sdm845_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SDM845_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x280, INTF_DSI, 0, 24, INTF_SDM845_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x280, INTF_DSI, 1, 24, INTF_SDM845_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SDM845_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>  };
>  
>  static const struct dpu_perf_cfg sdm845_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 43cf813a4766..e0f62f84b3cf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -162,10 +162,18 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm8150_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>  };
>  
>  static const struct dpu_perf_cfg sm8150_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 1313193f410b..fbcfbbd74875 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -143,13 +143,25 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
>  };
>  
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
>  	/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -	INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -	INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> +	INTF_BLK("intf_4", INTF_4, 0x6c000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21)),
> +	INTF_BLK("intf_5", INTF_5, 0x6c800, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
>  };
>  
>  static const struct dpu_perf_cfg sc8180x_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index f8378990aa25..b63d244224f0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -163,10 +163,18 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm8250_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>  };
>  
>  static const struct dpu_wb_cfg sm8250_wb[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 68d1fb988b0d..9994b3aa1bb0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -85,8 +85,12 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
>  };
>  
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>  };
>  
>  static const struct dpu_wb_cfg sc7180_wb[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index e15dc96f1286..88a0d6119ad5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -66,8 +66,10 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm6115_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0, 0),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>  };
>  
>  static const struct dpu_perf_cfg sm6115_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 2ff98ef6999f..cd6f4048f286 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -63,8 +63,10 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
>  };
>  
>  static const struct dpu_intf_cfg qcm2290_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0, 0),
> -	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
> +	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>  };
>  
>  static const struct dpu_perf_cfg qcm2290_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 6b7e1837422a..9b99ec6eb78d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -154,10 +154,18 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm8350_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>  };
>  
>  static const struct dpu_perf_cfg sm8350_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 0961fa5c3907..56bd2ec8ca54 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -94,9 +94,15 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>  };
>  
>  static const struct dpu_intf_cfg sc7280_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
>  };
>  
>  static const struct dpu_perf_cfg sc7280_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index bad1c688517d..49fa6eda9c7d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -143,15 +143,33 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>  
>  /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
>  static const struct dpu_intf_cfg sc8280xp_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -	INTF_BLK("intf_4", INTF_4, 0x38000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> -	INTF_BLK("intf_6", INTF_6, 0x3a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
> -	INTF_BLK("intf_7", INTF_7, 0x3b000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
> -	INTF_BLK("intf_8", INTF_8, 0x3c000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> +	INTF_BLK("intf_4", INTF_4, 0x38000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21)),
> +	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
> +	INTF_BLK("intf_6", INTF_6, 0x3a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17)),
> +	INTF_BLK("intf_7", INTF_7, 0x3b000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 19)),
> +	INTF_BLK("intf_8", INTF_8, 0x3c000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>  };
>  
>  static const struct dpu_perf_cfg sc8280xp_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index efd3aa6c9bc1..31fec8fc98f2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -162,10 +162,18 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm8450_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>  };
>  
>  static const struct dpu_perf_cfg sm8450_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index d0ab351b6a8b..55c72419964d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -166,11 +166,19 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>  };
>  
>  static const struct dpu_intf_cfg sm8550_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>  	/* TODO TE sub-blocks for intf1 & intf2 */
> -	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>  };
>  
>  static const struct dpu_perf_cfg sm8550_perf_data = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 2d16cdbd7d44..d3eda7192908 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -543,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  /*************************************************************
>   * INTF sub blocks config
>   *************************************************************/
> -#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _underrun, _vsync) \
>  	{\
>  	.name = _name, .id = _id, \
>  	.base = _base, .len = _len, \
> @@ -551,8 +551,8 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	.type = _type, \
>  	.controller_id = _ctrl_id, \
>  	.prog_fetch_lines_worst_case = _progfetch, \
> -	.intr_underrun = DPU_IRQ_IDX(_reg, _underrun_bit), \
> -	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
> +	.intr_underrun = _underrun, \
> +	.intr_vsync = _vsync, \
>  	}
>  
>  /*************************************************************
> 
