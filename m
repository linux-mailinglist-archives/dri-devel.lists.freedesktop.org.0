Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45391661A26
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 22:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F20610E205;
	Sun,  8 Jan 2023 21:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB1910E205
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 21:47:18 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j17so10242093lfr.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 13:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v3RujMElUPln53WNJTGm1Z6auTJqmKJP8ruqNbR32j8=;
 b=zcRCQtIaL4RHhg3ffNo54cGY5QNiCG4g5IkljBvUcWfiSfTL7MEK0BamL5jeiQm8J9
 ucfrSbjvkEdLNi73hH/20SfOd9lfuiD2HjmrQT9au17gsW38xgn0jOKbEV/Qxx+tGU4m
 cr9Z9AG8m1KR3upbzP11mlqpmJTAIdmESw66XX4E5a1LOxiJg9MlxlxSWmZ4iELvaYLW
 QsjFKJdyxIfq7aYEb1IL6Lv8yV2tn0bUPqD+PbqTwQ+HAf5kEuhVhNo8Yib6Y0Cb25gL
 QFhtieJMECCu537tIpym8FoOBzdkfCVEamqludbYDamBYCTUr5MiP8Sa4YG1doOWid/W
 YkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v3RujMElUPln53WNJTGm1Z6auTJqmKJP8ruqNbR32j8=;
 b=eE0g0AlFoQP/phZ8IzLcvyAW4/KrFT+TpNFnb1KOCqMbqDWEihvu5kcLTMljoPbIT5
 KR3sRhez0Tw8nDeFlm5IJrHXghEAwkrh0dYHAidTMDH7WRiF3W2N/gaTjJANMBQ1+WKK
 BZAlMQLNWJFHlfnhV4DGNw11j66pntSEuonEtSkWiYvfaNTO/JIVt0+TitRqVhOqJMEZ
 RCR59eJHsTMR2e+vTUEWdsEpHtsjAvjCuOvrjvj4jY+myGhH1RBZNSv17UIjAwpTbKJJ
 QqD75d3Wdk7x3Vj20Fba33QwgQQinSRqnhuHpIDUaPgdBYk2mvlW8Yuc05gimf0HdEdg
 GzfQ==
X-Gm-Message-State: AFqh2kpem35ACblO9JV6lboWdyFZZ1yLQLom/qKYBYw1AAe8adC8NEoP
 fAhs6foti+IlErKE419EupbhA2VbGgA/35QB
X-Google-Smtp-Source: AMrXdXvCqi9DixystR12G7XG9R68nQ7P5GCShNT+tALqO8l0zIhVmd3/AMosT73VC6Yw/qipSmzGMQ==
X-Received: by 2002:a05:6512:e8f:b0:4ca:ffe0:e754 with SMTP id
 bi15-20020a0565120e8f00b004caffe0e754mr17028527lfb.18.1673214436731; 
 Sun, 08 Jan 2023 13:47:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a05651220c400b004b4b600c093sm1236523lfr.92.2023.01.08.13.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 13:47:16 -0800 (PST)
Message-ID: <3796d2c4-6d14-79d3-4dcf-aed59b99ceca@linaro.org>
Date: Sun, 8 Jan 2023 23:47:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 02/12] drm/msm/dpu: Introduce SC8280XP
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-3-quic_bjorande@quicinc.com>
 <849fd3a3-9399-c5b5-53e0-0063acad5ace@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <849fd3a3-9399-c5b5-53e0-0063acad5ace@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2022 01:31, Kuogee Hsieh wrote:
> 
> On 12/7/2022 2:00 PM, Bjorn Andersson wrote:
>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
>> The Qualcomm SC8280XP platform contains DPU version 8.0.0, has 9
>> interfaces, 2 DSI controllers and 4 DisplayPort controllers. Extend the
>> necessary definitions and describe the DPU in the SC8280XP.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>
>> Changes since v4:
>> - Fix highest_bank_bit, based on downstream
>> - Add ubwc_swizzle
>> - Use CTL_SC7280_MASK instead of listing the bits directly
>>
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 217 ++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  18 ++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   3 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>>   drivers/gpu/drm/msm/msm_drv.h                 |   1 +
>>   7 files changed, 243 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 2196e205efa5..0315fe68af2f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -124,6 +124,19 @@
>>                 BIT(MDP_AD4_0_INTR) | \
>>                 BIT(MDP_AD4_1_INTR))
>> +#define IRQ_SC8280XP_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>> +               BIT(MDP_SSPP_TOP0_INTR2) | \
>> +               BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> +               BIT(MDP_INTF0_7xxx_INTR) | \
>> +               BIT(MDP_INTF1_7xxx_INTR) | \
>> +               BIT(MDP_INTF2_7xxx_INTR) | \
>> +               BIT(MDP_INTF3_7xxx_INTR) | \
>> +               BIT(MDP_INTF4_7xxx_INTR) | \
>> +               BIT(MDP_INTF5_7xxx_INTR) | \
>> +               BIT(MDP_INTF6_7xxx_INTR) | \
>> +               BIT(MDP_INTF7_7xxx_INTR) | \
>> +               BIT(MDP_INTF8_7xxx_INTR))
>> +
>>   #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>                BIT(DPU_WB_UBWC) | \
>>                BIT(DPU_WB_YUV_CONFIG) | \
>> @@ -365,6 +378,20 @@ static const struct dpu_caps sc8180x_dpu_caps = {
>>       .max_vdeci_exp = MAX_VERT_DECIMATION,
>>   };
>> +static const struct dpu_caps sc8280xp_dpu_caps = {
>> +    .max_mixer_width = 2560,
>> +    .max_mixer_blendstages = 11,
>> +    .qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
>> +    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>> +    .ubwc_version = DPU_HW_UBWC_VER_40,
>> +    .has_src_split = true,
>> +    .has_dim_layer = true,
>> +    .has_idle_pc = true,
>> +    .has_3d_merge = true,
>> +    .max_linewidth = 5120,
>> +    .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +};
>> +
>>   static const struct dpu_caps sm8250_dpu_caps = {
>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>       .max_mixer_blendstages = 0xb,
>> @@ -545,6 +572,25 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
>>       },
>>   };
>> +static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
>> +    {
>> +    .name = "top_0", .id = MDP_TOP,
>> +    .base = 0x0, .len = 0x494,
>> +    .features = 0,
>> +    .highest_bank_bit = 2,
>> +    .ubwc_swizzle = 6,
>> +    .clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
>> +    .clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
>> +    .clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},
>> +    .clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0},
>> +    .clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8},
>> +    .clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8},
>> +    .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = { .reg_off = 0x2bc, .bit_off = 
>> 8},
>> +    .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = { .reg_off = 0x2c4, .bit_off = 
>> 8},
>> +    .clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 
>> 20},
>> +    },
>> +};
>> +
>>   static const struct dpu_mdp_cfg qcm2290_mdp[] = {
>>       {
>>       .name = "top_0", .id = MDP_TOP,
>> @@ -648,6 +694,45 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
>>       },
>>   };
>> +static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>> +    {
>> +    .name = "ctl_0", .id = CTL_0,
>> +    .base = 0x15000, .len = 0x204,
>> +    .features = CTL_SC7280_MASK,
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>> +    },
>> +    {
>> +    .name = "ctl_1", .id = CTL_1,
>> +    .base = 0x16000, .len = 0x204,
>> +    .features = CTL_SC7280_MASK,
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>> +    },
>> +    {
>> +    .name = "ctl_2", .id = CTL_2,
>> +    .base = 0x17000, .len = 0x204,
>> +    .features = CTL_SC7280_MASK,
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>> +    },
>> +    {
>> +    .name = "ctl_3", .id = CTL_3,
>> +    .base = 0x18000, .len = 0x204,
>> +    .features = CTL_SC7280_MASK,
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>> +    },
>> +    {
>> +    .name = "ctl_4", .id = CTL_4,
>> +    .base = 0x19000, .len = 0x204,
>> +    .features = CTL_SC7280_MASK,
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>> +    },
>> +    {
>> +    .name = "ctl_5", .id = CTL_5,
>> +    .base = 0x1a000, .len = 0x204,
>> +    .features = CTL_SC7280_MASK,
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>> +    },
>> +};
>> +
>>   static const struct dpu_ctl_cfg sm8150_ctl[] = {
>>       {
>>       .name = "ctl_0", .id = CTL_0,
>> @@ -926,6 +1011,33 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>>           sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>>   };
>> +static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
>> +                _VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
>> +static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
>> +                _VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
>> +static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
>> +                _VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
>> +static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
>> +                _VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
>> +
>> +static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
>> +         sc8280xp_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> +    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
>> +         sc8280xp_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>> +    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
>> +         sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>> +    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
>> +         sc8280xp_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
>> +         sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
>> +         sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
>> +         sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
>> +    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
>> +         sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>> +};
>>   #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
>>       { \
>> @@ -1034,6 +1146,17 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
>>           &sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
>>   };
>> +/* SC8280XP */
>> +
>> +static const struct dpu_lm_cfg sc8280xp_lm[] = {
>> +    LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, 
>> PINGPONG_0, LM_1, DSPP_0),
>> +    LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, 
>> PINGPONG_1, LM_0, DSPP_1),
>> +    LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, 
>> PINGPONG_2, LM_3, DSPP_2),
>> +    LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, 
>> PINGPONG_3, LM_2, DSPP_3),
>> +    LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, 
>> PINGPONG_4, LM_5, 0),
>> +    LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, 
>> PINGPONG_5, LM_4, 0),
>> +};
>> +
>>   /* SM8150 */
>>   static const struct dpu_lm_cfg sm8150_lm[] = {
>> @@ -1192,6 +1315,21 @@ static struct dpu_pingpong_cfg sc7180_pp[] = {
>>       PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, 
>> sdm845_pp_sblk_te, -1, -1),
>>   };
>> +static struct dpu_pingpong_cfg sc8280xp_pp[] = {
>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, 
>> sdm845_pp_sblk_te,
>> +          DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, 
>> sdm845_pp_sblk_te,
>> +          DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
>> +    PP_BLK_TE("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, 
>> sdm845_pp_sblk_te,
>> +          DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
>> +    PP_BLK_TE("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, 
>> sdm845_pp_sblk_te,
>> +          DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
>> +    PP_BLK_TE("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, 
>> sdm845_pp_sblk_te,
>> +          DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
>> +    PP_BLK_TE("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, 
>> sdm845_pp_sblk_te,
>> +          DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>> +};
>> +
>>   static const struct dpu_pingpong_cfg sm8150_pp[] = {
>>       PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, 
>> sdm845_pp_sblk_te,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> @@ -1243,6 +1381,12 @@ static const struct dpu_merge_3d_cfg 
>> sm8150_merge_3d[] = {
>>       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
>>   };
>> +static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>> +    MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
>> +    MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
>> +    MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
>> +};
>> +
>>   /*************************************************************
>>    * DSC sub blocks config
>>    *************************************************************/
>> @@ -1317,6 +1461,19 @@ static const struct dpu_intf_cfg sc8180x_intf[] 
>> = {
>>       INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, 
>> MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>>   };
>> +/* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for 
>> now */
>> +static const struct dpu_intf_cfg sc8280xp_intf[] = {
>> +    INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> +    INTF_BLK("intf_3", INTF_3, 0x37000, INTF_NONE, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> +    INTF_BLK("intf_4", INTF_4, 0x38000, INTF_DP, MSM_DP_CONTROLLER_1, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
>> +    INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_3, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>> +    INTF_BLK("intf_6", INTF_6, 0x3a000, INTF_DP, MSM_DP_CONTROLLER_2, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
>> +    INTF_BLK("intf_7", INTF_7, 0x3b000, INTF_NONE, 
>> MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
>> +    INTF_BLK("intf_8", INTF_8, 0x3c000, INTF_NONE, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
>> +};
>> +
>>   static const struct dpu_intf_cfg qcm2290_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
>>       INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> @@ -1419,6 +1576,14 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
>>       },
>>   };
>> +static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
>> +    .base = 0x0,
>> +    .version = 0x00020000,
>> +    .trigger_sel_off = 0x119c,
>> +    .xin_id = 7,
>> +    .clk_ctrl = DPU_CLK_CTRL_REG_DMA,
>> +};
>> +
>>   static const struct dpu_reg_dma_cfg sdm845_regdma = {
>>       .base = 0x0, .version = 0x1, .trigger_sel_off = 0x119c
>>   };
>> @@ -1690,6 +1855,33 @@ static const struct dpu_perf_cfg 
>> sc8180x_perf_data = {
>>       .min_llcc_ib = 800000,
>>       .min_dram_ib = 800000,
>>       .danger_lut_tbl = {0xf, 0xffff, 0x0},
>> +    .qos_lut_tbl = {
>> +        {.nentry = ARRAY_SIZE(sc7180_qos_linear),
>> +        .entries = sc7180_qos_linear
>> +        },
>> +        {.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
>> +        .entries = sc7180_qos_macrotile
>> +        },
>> +        {.nentry = ARRAY_SIZE(sc7180_qos_nrt),
>> +        .entries = sc7180_qos_nrt
>> +        },
>> +        /* TODO: macrotile-qseed is different from macrotile */
>> +    },
>> +    .cdp_cfg = {
>> +        {.rd_enable = 1, .wr_enable = 1},
>> +        {.rd_enable = 1, .wr_enable = 0}
>> +    },
>> +    .clk_inefficiency_factor = 105,
>> +    .bw_inefficiency_factor = 120,
>> +};
>> +
>> +static const struct dpu_perf_cfg sc8280xp_perf_data = {
>> +    .max_bw_low = 13600000,
>> +    .max_bw_high = 18200000,
>> +    .min_core_ib = 2500000,
>> +    .min_llcc_ib = 0,
>> +    .min_dram_ib = 800000,
>> +    .danger_lut_tbl = {0xf, 0xffff, 0x0},
>>       .qos_lut_tbl = {
>>           {.nentry = ARRAY_SIZE(sc8180x_qos_linear),
>>           .entries = sc8180x_qos_linear

It seems this chunk got wrong somehow during rebases. It changes sc8180x 
to use sc7280 QoS settings. I'll update it to keep the sc8180x data 
intact while applying.

>> @@ -1937,6 +2129,30 @@ static const struct dpu_mdss_cfg 
>> sc8180x_dpu_cfg = {
>>       .mdss_irqs = IRQ_SC8180X_MASK,
>>   };
>> +static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
>> +    .caps = &sc8280xp_dpu_caps,
>> +    .mdp_count = ARRAY_SIZE(sc8280xp_mdp),
>> +    .mdp = sc8280xp_mdp,
>> +    .ctl_count = ARRAY_SIZE(sc8280xp_ctl),
>> +    .ctl = sc8280xp_ctl,
>> +    .sspp_count = ARRAY_SIZE(sc8280xp_sspp),
>> +    .sspp = sc8280xp_sspp,
>> +    .mixer_count = ARRAY_SIZE(sc8280xp_lm),
>> +    .mixer = sc8280xp_lm,
>> +    .dspp_count = ARRAY_SIZE(sm8150_dspp),
>> +    .dspp = sm8150_dspp,
>> +    .pingpong_count = ARRAY_SIZE(sc8280xp_pp),
>> +    .pingpong = sc8280xp_pp,
>> +    .merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
>> +    .merge_3d = sc8280xp_merge_3d,
>> +    .intf_count = ARRAY_SIZE(sc8280xp_intf),
>> +    .intf = sc8280xp_intf,
>> +    .vbif_count = ARRAY_SIZE(sdm845_vbif),
>> +    .vbif = sdm845_vbif,
>> +    .perf = &sc8280xp_perf_data,
>> +    .mdss_irqs = IRQ_SC8280XP_MASK,
>> +};
>> +
>>   static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
>>       .caps = &sm8250_dpu_caps,
>>       .mdp_count = ARRAY_SIZE(sm8250_mdp),
>> @@ -2024,6 +2240,7 @@ static const struct dpu_mdss_hw_cfg_handler 
>> cfg_handler[] = {
>>       { .hw_rev = DPU_HW_VER_630, .dpu_cfg = &sm6115_dpu_cfg},
>>       { .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
>>       { .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
>> +    { .hw_rev = DPU_HW_VER_800, .dpu_cfg = &sc8280xp_dpu_cfg},
>>   };
>>   const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 3b645d5aa9aa..6897b35c18fa 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -47,6 +47,7 @@
>>   #define DPU_HW_VER_630    DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
>>   #define DPU_HW_VER_650    DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>>   #define DPU_HW_VER_720    DPU_HW_VER(7, 2, 0) /* sc7280 */
>> +#define DPU_HW_VER_800    DPU_HW_VER(8, 0, 0) /* sc8280xp */
>>   #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), 
>> DPU_HW_VER_170)
>>   #define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), 
>> DPU_HW_VER_300)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> index cf1b6d84c18a..27d74c4d8a98 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> @@ -35,6 +35,9 @@
>>   #define MDP_INTF_3_OFF_REV_7xxx             0x37000
>>   #define MDP_INTF_4_OFF_REV_7xxx             0x38000
>>   #define MDP_INTF_5_OFF_REV_7xxx             0x39000
>> +#define MDP_INTF_6_OFF_REV_7xxx             0x3a000
>> +#define MDP_INTF_7_OFF_REV_7xxx             0x3b000
>> +#define MDP_INTF_8_OFF_REV_7xxx             0x3c000
>>   /**
>>    * struct dpu_intr_reg - array of DPU register sets
>> @@ -139,6 +142,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>>           MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
>>           MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_STATUS
>>       },
>> +    [MDP_INTF6_7xxx_INTR] = {
>> +        MDP_INTF_6_OFF_REV_7xxx+INTF_INTR_CLEAR,
>> +        MDP_INTF_6_OFF_REV_7xxx+INTF_INTR_EN,
>> +        MDP_INTF_6_OFF_REV_7xxx+INTF_INTR_STATUS
>> +    },
>> +    [MDP_INTF7_7xxx_INTR] = {
>> +        MDP_INTF_7_OFF_REV_7xxx+INTF_INTR_CLEAR,
>> +        MDP_INTF_7_OFF_REV_7xxx+INTF_INTR_EN,
>> +        MDP_INTF_7_OFF_REV_7xxx+INTF_INTR_STATUS
>> +    },
>> +    [MDP_INTF8_7xxx_INTR] = {
>> +        MDP_INTF_8_OFF_REV_7xxx+INTF_INTR_CLEAR,
>> +        MDP_INTF_8_OFF_REV_7xxx+INTF_INTR_EN,
>> +        MDP_INTF_8_OFF_REV_7xxx+INTF_INTR_STATUS
>> +    },
>>   };
>>   #define DPU_IRQ_REG(irq_idx)    (irq_idx / 32)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>> index 46443955443c..425465011c80 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>> @@ -31,6 +31,9 @@ enum dpu_hw_intr_reg {
>>       MDP_INTF3_7xxx_INTR,
>>       MDP_INTF4_7xxx_INTR,
>>       MDP_INTF5_7xxx_INTR,
>> +    MDP_INTF6_7xxx_INTR,
>> +    MDP_INTF7_7xxx_INTR,
>> +    MDP_INTF8_7xxx_INTR,
>>       MDP_INTR_MAX,
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> index d3b0ed0a9c6c..d595096a4b1f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> @@ -214,6 +214,8 @@ enum dpu_intf {
>>       INTF_4,
>>       INTF_5,
>>       INTF_6,
>> +    INTF_7,
>> +    INTF_8,
>>       INTF_MAX
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index b71199511a52..30f894864cca 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1292,6 +1292,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>       { .compatible = "qcom,sc7180-dpu", },
>>       { .compatible = "qcom,sc7280-dpu", },
>>       { .compatible = "qcom,sc8180x-dpu", },
>> +    { .compatible = "qcom,sc8280xp-dpu", },
>>       { .compatible = "qcom,sm6115-dpu", },
>>       { .compatible = "qcom,sm8150-dpu", },
>>       { .compatible = "qcom,sm8250-dpu", },
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>> b/drivers/gpu/drm/msm/msm_drv.h
>> index d4e0ef608950..b2789efd59e8 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -61,6 +61,7 @@ enum msm_dp_controller {
>>       MSM_DP_CONTROLLER_0,
>>       MSM_DP_CONTROLLER_1,
>>       MSM_DP_CONTROLLER_2,
>> +    MSM_DP_CONTROLLER_3,
>>       MSM_DP_CONTROLLER_COUNT,
>>   };

-- 
With best wishes
Dmitry

