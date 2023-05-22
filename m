Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AC570C13C
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 16:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7C410E343;
	Mon, 22 May 2023 14:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD6710E341
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:37:15 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f60804faf4so4190175e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 07:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684766234; x=1687358234;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zdvnVwXgfNIrQu1ouYczIi6HAW+S+m4cU0rmicGDt34=;
 b=uSbpJXtyH5RlNwRfmJX+il8tst9dzv5/H9xjSbTjLTwP/5GQN1dHRA1GmXDpk5aCHN
 B6DUpYf4WHupYYm149I26jWPAt39q0cwFxSbVmzRbqvVSqa9PMuRCoWCJCqzILlrMfOB
 o0muvgVT5p2B2ZlF4SfOnfOvTdeiowWEj+FuywHIIo6U/8WdQ4A4jECSpzhH3bl/JnQw
 OQYATM9De6zFJjAunPB6qL/VLI8i9LTZkeVCcnUI7rpxhSaNe5cC3B96Yu5nVpLxfY4m
 kXn18c0bj/4C2hJ4ce1K9qARMCZu/hLnIGRoA54Hg56C3uT97qYe46l3PuUchsTk9trb
 Vxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684766234; x=1687358234;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdvnVwXgfNIrQu1ouYczIi6HAW+S+m4cU0rmicGDt34=;
 b=EqIJfSBr4WfagrraPG1v37csyoDho00QuVlm2VxkKraNSQfX2RDhkC8srkpKeZyHJ0
 QEf5DoxniSE+dpl5F7rlyy9MSYM7gaxTahDIkHqt4mHwZUB0qzjmzuAvLFjBvjk7D4io
 6yAxtBbb8Wg4SrCQzSqtUMMH/+uDm/ucMmCm2Y7UdRg+i6pFmojzU7j/riFXUGrchbhd
 GhwfX804d3t8k9apoJXt1A6vfKrVSFyqQcns8q1F+KQt+VhI9E2HiY6GKMzRQHGI3iR8
 88iMwFvf2SZthtxFrKuXJHLkO+4pzm0DpcRRtkJ4WV6yehla6x6tak4REi5D/q98109D
 fPMQ==
X-Gm-Message-State: AC+VfDyUTyWUI1Ymr33J8H8UxJzjpKKCc7uu5ELEg+mYU2L0mv4Dc9lO
 Pl1s7ThmKbPzdUS72pkJCSgriQ==
X-Google-Smtp-Source: ACHHUZ4NPnSFsxk/nimmDrGyNkeLNKKPnjiITR4ePa5lAHi8Hb449dSFiRhXa5mYv0fQR26dEcw9mg==
X-Received: by 2002:a7b:c013:0:b0:3f1:9b85:e305 with SMTP id
 c19-20020a7bc013000000b003f19b85e305mr8152288wmb.34.1684766233879; 
 Mon, 22 May 2023 07:37:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a478:d61d:5bb5:7df?
 ([2a01:e0a:982:cbb0:a478:d61d:5bb5:7df])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05600c231600b003f421979398sm11630824wmo.26.2023.05.22.07.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 07:37:13 -0700 (PDT)
Message-ID: <a1896fcf-c52d-ee79-6394-8667d6163cb9@linaro.org>
Date: Mon, 22 May 2023 16:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 6/6] drm/msm/dpu: drop compatibility INTR defines
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
 <20230522004227.134501-7-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230522004227.134501-7-dmitry.baryshkov@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2023 02:42, Dmitry Baryshkov wrote:
> While reworking interrupts masks, it was easier to keep old
> MDP_INTFn_7xxx_INTR and MDP_INTFn_7xxx_TEAR_INTR symbols. Now it is time
> to drop them and use unified symbol names.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  2 +-
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h   | 13 -------------
>   6 files changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index f9e5f252ae54..c64b6a7a30af 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -160,11 +160,11 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
>   	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>   	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>   	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index dede8cb2d784..98623388badc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -106,7 +106,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>   	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>   	INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 79ab2d015a44..fde9204c2c8e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -150,11 +150,11 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>   	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>   	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index b0bc88136e86..3821cc465c47 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -168,11 +168,11 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
>   	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>   	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>   	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index afed62e44f90..f35671d1f2b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -172,11 +172,11 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
>   	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> -			DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>   	INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> -			DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
> +			DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>   	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index f0b92c9e3b09..4a46c0900e04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -39,19 +39,6 @@ enum dpu_hw_intr_reg {
>   				   intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
>   				   -1)
>   
> -/* compatibility */
> -#define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
> -#define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
> -#define MDP_INTF2_7xxx_INTR MDP_INTF2_INTR
> -#define MDP_INTF3_7xxx_INTR MDP_INTF3_INTR
> -#define MDP_INTF4_7xxx_INTR MDP_INTF4_INTR
> -#define MDP_INTF5_7xxx_INTR MDP_INTF5_INTR
> -#define MDP_INTF6_7xxx_INTR MDP_INTF6_INTR
> -#define MDP_INTF7_7xxx_INTR MDP_INTF7_INTR
> -#define MDP_INTF8_7xxx_INTR MDP_INTF8_INTR
> -#define MDP_INTF1_7xxx_TEAR_INTR MDP_INTF1_TEAR_INTR
> -#define MDP_INTF2_7xxx_TEAR_INTR MDP_INTF2_TEAR_INTR
> -
>   #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
>   
>   /**

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
