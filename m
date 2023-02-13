Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B785B694430
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB3110E54A;
	Mon, 13 Feb 2023 11:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB9210E54A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:15:23 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id qw12so30973915ejc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fgeqEXl8Xi/zqmjdMwyKazwu9YMRx74kiYLzB77dQUc=;
 b=ZOXE9ImvIj9YnIyHKqgs9RON1AgeiUEHP36Dpkd8+fS51HQJBeIlDYYFPnMwXwQ9mR
 FBj/GUfYigwautpqSQjh262+hLyqiLALvwwKcKXnf+WX9EZn+CnHrL9Oo0vRVKnsvrsB
 6ObfZZTLqKsM/OSfrdeiwd0C+D8XKLsOU3GmDxe3QYfE/ELyvN+23Y9ad2hEOP9PYdTA
 p+kDa19l80aqb8iddJN/JoyF4tZMZN4Jie6LNMLWIdPXcPsLS3q7w9R4286HXyfDASAF
 96bhx/isZU+gGbcMg9IKgnyaeK0IZtgloAPv5JrHc3ufkQAPNvlFaPoH5P8afQ/HVpzl
 ljXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fgeqEXl8Xi/zqmjdMwyKazwu9YMRx74kiYLzB77dQUc=;
 b=Rw6JsBshVCj/0w4BYYWZmpwY5BdMgY3PYNS2rI3DzqolBPVdo8oEt3kJBgicVuSTbm
 H53EaOnMFzb2LZ0Hwbq0fVGJAapoWJfpjWbNxp/ZtBoFQ0EBwVWdpB5f1DbGqUus9oEH
 oX8Mske4lb9GY1CJJVH1Cwsw+jdWwgnKyuscIBe8AGN6Jl0WzkvTyoZvDoZ6mspAOBy0
 s+ijMhzIMpPg1x2WmR5lh+5OvvDvKh+uJ2NrLpKRmsrSwTS2RUbJ5BeM1NNSNdEOZmz8
 9wYAnhrnyYYsg5se+scO0hB3Ym03wzQltU6Px1sOTQWIJ4SeKcQKsJgG/DmCq7uCQKO3
 psaA==
X-Gm-Message-State: AO0yUKXTmc2tdhTUx7qxdhdUF+FtoOEbLYjr5BZOqB6HE8bxKyhQHjIb
 iyNoiYV1Rgr2OufWIzCHalIO+w==
X-Google-Smtp-Source: AK7set/OOZOS4n7L32x8yT+kBfLV7sAhrLJBYICJXtzMbkeAunf9wZNVMBdxBCpxNMoHnyV5LmlVHQ==
X-Received: by 2002:a17:907:6e07:b0:878:7ef1:4a20 with SMTP id
 sd7-20020a1709076e0700b008787ef14a20mr31817179ejc.4.1676286922394; 
 Mon, 13 Feb 2023 03:15:22 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 kk21-20020a170907767500b0088ef3c38a52sm6733233ejc.19.2023.02.13.03.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:15:22 -0800 (PST)
Message-ID: <cc364658-478a-f239-5d17-5ca2b7f7df8b@linaro.org>
Date: Mon, 13 Feb 2023 12:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/10] drm/msm/dpu: Add SM6350 support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-7-konrad.dybcio@linaro.org>
 <a18cf663-115d-edc8-5e4b-3d19fcd9a02c@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a18cf663-115d-edc8-5e4b-3d19fcd9a02c@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Vinod Koul <vkoul@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Liu Shixin <liushixin2@huawei.com>,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11.02.2023 17:32, Dmitry Baryshkov wrote:
> On 11/02/2023 14:26, Konrad Dybcio wrote:
>> Add SM6350 support to the DPU1 driver to enable display output.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 187 ++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>>   drivers/gpu/drm/msm/msm_mdss.c                |   2 +
>>   4 files changed, 193 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index d9ef1e133c1e..ba0bc795e5ff 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -364,6 +364,25 @@ static const struct dpu_caps sm6115_dpu_caps = {
>>       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>   };
>>   +static const struct dpu_caps sm6350_dpu_caps = {
>> +    .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +    .max_mixer_blendstages = 0x7,
>> +    .qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
> 
> QSEED4
Confirmed with a register write at 0x0ae05a00
(mdp_base + 0x4000 + 0xa00) => 0x3000 (QSEED4)

> 
>> +    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>> +    .ubwc_version = DPU_HW_UBWC_VER_20,
>> +    .has_src_split = true,
>> +    .has_dim_layer = true,
>> +    .has_idle_pc = true,
>> +    /*
>> +     * There is *NO* 3DMERGE hw, but we *need* to set this property to true,
>> +     * because SM6350 includes newer hardware that requires a different reset
>> +     * sequence and it is executed based on this confusingly named variable..
>> +     */
> 
> Which reset sequence is that? Is it something that was not posted yet?
Hm.. this patch came to life about 1.5y ago so it's hard to tell..

Grepping for 3dmerge I found that there is some legacy reset sequence
which should not be executed for anything >=8150 (probably related
to the intf te moving), but currently it's only evaluated in
disp/dpu1/dpu_encoder.c : dpu_encoder_get_topology(). Interestingly
enough, that legacy reset sequence is not implemented upstream, so
there was really no way to hit it..

Downstream has a has_3d_merge_reset flag for that and I'm not sure
how relevant the check we have upstream in dpu_encoder is to anything
newer than 845.

While testing on PDX213 is near impossible (the panel is acting up
and only initializes once in like 10 boots, otherwise it comes to life
after $random minutes; this is a panel-specific issue though..), Luca
reported no regressions after settings this to false on his Fairphone 4.


> 
>> +    .has_3d_merge = true,
>> +    .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +    .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +};
>> +
>>   static const struct dpu_caps sm8150_dpu_caps = {
>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>       .max_mixer_blendstages = 0xb,
>> @@ -554,6 +573,25 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>>       },
>>   };
>>   +static const struct dpu_mdp_cfg sm6350_mdp[] = {
>> +    {
>> +    .name = "top_0", .id = MDP_TOP,
>> +    .base = 0x0, .len = 0x494,
>> +    .features = 0,
>> +    .highest_bank_bit = 0x1,
>> +    .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>> +        .reg_off = 0x2ac, .bit_off = 0},
>> +    .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>> +        .reg_off = 0x2ac, .bit_off = 8},
>> +    .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> 
> DPU_CLK_CTRL_DMA1
> 
>> +        .reg_off = 0x2b4, .bit_off = 8},
>> +    .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> 
> DPU_CLK_CTRL_DMA2
> 
>> +        .reg_off = 0x2c4, .bit_off = 8},
>> +    .clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
>> +        .reg_off = 0x2bc, .bit_off = 20},
>> +    },
> 
> Please fit them into a single line
Ack x3

> 
>> +};
>> +
>>   static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>>       {
>>       .name = "top_0", .id = MDP_TOP,
>> @@ -888,6 +926,33 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>>       },
>>   };
>>   +static const struct dpu_ctl_cfg sm6350_ctl[] = {
> 
> We need to fix sc7180_ctl[].len, then we can use it here instead.
Yep, good find!

> 
>> +    {
>> +    .name = "ctl_0", .id = CTL_0,
>> +    .base = 0x1000, .len = 0x1dc,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>> +    },
>> +    {
>> +    .name = "ctl_1", .id = CTL_1,
>> +    .base = 0x1200, .len = 0x1dc,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>> +    },
>> +    {
>> +    .name = "ctl_2", .id = CTL_2,
>> +    .base = 0x1400, .len = 0x1dc,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>> +    },
>> +    {
>> +    .name = "ctl_3", .id = CTL_3,
>> +    .base = 0x1600, .len = 0x1dc,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>> +    },
>> +};
>> +
>>   static const struct dpu_ctl_cfg sm8150_ctl[] = {
>>       {
>>       .name = "ctl_0", .id = CTL_0,
>> @@ -1244,6 +1309,20 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
>>           sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>>   };
>>   +static const struct dpu_sspp_sub_blks sm6350_vig_sblk_0 =
>> +                _VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED3LITE);
> 
> QSEED4
Confirmed with a register read.

> 
>> +
>> +static const struct dpu_sspp_cfg sm6350_sspp[] = {
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SM8250_MASK,
>> +        sm6350_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>> +        sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>> +        sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> 
> DPU_CLK_CTRL_DMA1
> 
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>> +        sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> 
> DPU_CLK_CTRL_DMA2
Double ack

> 
>> +};
>> +
>>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
>>                   _VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
>>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
>> @@ -1491,6 +1570,13 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
>>       LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
>>   };
>>   +static const struct dpu_lm_cfg sm6350_lm[] = {
> 
> I think we can use sc7180_lm here
Yep!

> 
>> +    LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>> +        &sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>> +    LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>> +        &sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
>> +};
>> +
>>   /* SM8150 */
>>     static const struct dpu_lm_cfg sm8150_lm[] = {
>> @@ -1572,6 +1658,11 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
>>            &sc7180_dspp_sblk),
>>   };
>>   +static const struct dpu_dspp_cfg sm6350_dspp[] = {
> 
> sc7180_dspp
Yes, but 7180 should be fixed up too, as the downstream dt
entry for both is identical: 

qcom,sde-dspp-pcc = <0x1700 0x00040000>;

(7180 sets version to 0x1000 upstream as of now)

> 
>> +    DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>> +         &sm8150_dspp_sblk),
>> +};
>> +
>>   static const struct dpu_dspp_cfg sm8150_dspp[] = {
>>       DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>>            &sm8150_dspp_sblk),
>> @@ -1674,6 +1765,15 @@ static struct dpu_pingpong_cfg sc8280xp_pp[] = {
>>             DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>>   };
>>   +static struct dpu_pingpong_cfg sm6350_pp[] = {
>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> 
> No TE support?
It's.. complicated.. With just this patch, display refreshes, albeit
not at 60fps. Marijn is working on getting it going, though

https://github.com/SoMainline/linux/commits/marijn/longbois-next/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

> 
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk,
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>> +};
>> +
>>   static const struct dpu_pingpong_cfg sm8150_pp[] = {
>>       PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> @@ -1879,6 +1979,11 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
>>       INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>   };
>>   +static const struct dpu_intf_cfg sm6350_intf[] = {
> 
> Interesting. Size is 0x2b8 for sc7180 (if I'm not mistaken), but 0x2c0 for sm6350. Do you know by chance what's the difference?
2 bytes ;)

On a more serious note, I really don't, 7180 was made with TSMC and 6350 with
"foundry ID 3" (as per socinfo on my device), if that's Samsung or some other
fab, maybe they had to make some changes. Or wild erratas.

> 
>> +    INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2c0, INTF_DP, 0, 35, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 35, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +};
>> +
>>   static const struct dpu_intf_cfg sm8150_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>       INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> @@ -2039,6 +2144,25 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
>>       },
>>   };
>>   +static const struct dpu_vbif_cfg sm6350_vbif[] = {
>> +    {
>> +    .name = "vbif_0", .id = VBIF_RT,
>> +    .base = 0, .len = 0x1044,
> 
> So, the only difference from sdm845_vbif is the len? Can we ignore it?
Won't that break/mess with at least register dumping?

> 
>> +    .features = BIT(DPU_VBIF_QOS_REMAP),
>> +    .xin_halt_timeout = 0x4000,
>> +    .qos_rt_tbl = {
>> +        .npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
>> +        .priority_lvl = sdm845_rt_pri_lvl,
>> +        },
>> +    .qos_nrt_tbl = {
>> +        .npriority_lvl = ARRAY_SIZE(sdm845_nrt_pri_lvl),
>> +        .priority_lvl = sdm845_nrt_pri_lvl,
>> +        },
>> +    .memtype_count = 14,
>> +    .memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
>> +    },
>> +};
>> +
>>   static const struct dpu_reg_dma_cfg sc8280xp_regdma = {
>>       .base = 0x0,
>>       .version = 0x00020000,
>> @@ -2128,6 +2252,11 @@ static const struct dpu_qos_lut_entry sc7180_qos_linear[] = {
>>       {.fl = 0, .lut = 0x0011222222335777},
>>   };
>>   
> 
> Two LUT entries with the same fill level sound strange. Yes, I see the same in the vendor dts. Let me check how they are parsend and used.
> 
>> +static const struct dpu_qos_lut_entry sm6350_qos_linear[] = {
>> +    {.fl = 0, .lut = 0x0011223344556677 },
>> +    {.fl = 0, .lut = 0x0011223445566777 },
>> +};
>> +
>>   static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
>>       {.fl = 0, .lut = 0x0011222222223357 },
>>   };
>> @@ -2153,6 +2282,11 @@ static const struct dpu_qos_lut_entry sc7180_qos_macrotile[] = {
>>       {.fl = 0, .lut = 0x0011223344556677},
>>   };
>>   +static const struct dpu_qos_lut_entry sm6350_qos_macrotile[] = {
>> +    {.fl = 0, .lut = 0x0011223344556677 },
>> +    {.fl = 0, .lut = 0x0011223445566777 },
>> +};
>> +
>>   static const struct dpu_qos_lut_entry sc8180x_qos_macrotile[] = {
>>       {.fl = 10, .lut = 0x0000000344556677},
>>   };
>> @@ -2298,6 +2432,34 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
>>       .bw_inefficiency_factor = 120,
>>   };
>>   +static const struct dpu_perf_cfg sm6350_perf_data = {
>> +    .max_bw_low = 4200000,
>> +    .max_bw_high = 5100000,
>> +    .min_core_ib = 2500000,
>> +    .min_llcc_ib = 0,
>> +    .min_dram_ib = 1600000,
>> +    .min_prefill_lines = 35,
>> +    /* TODO: confirm danger_lut_tbl */
>> +    .danger_lut_tbl = {0xffff, 0xffff, 0x0, 0x0, 0xffff},
>> +    .qos_lut_tbl = {
>> +        {.nentry = ARRAY_SIZE(sm6350_qos_linear),
>> +        .entries = sm6350_qos_linear
>> +        },
>> +        {.nentry = ARRAY_SIZE(sm6350_qos_macrotile),
>> +        .entries = sm6350_qos_macrotile
>> +        },
>> +        {.nentry = ARRAY_SIZE(sc7180_qos_nrt),
>> +        .entries = sc7180_qos_nrt
>> +        },
>> +    },
>> +    .cdp_cfg = {
>> +        {.rd_enable = 1, .wr_enable = 1},
>> +        {.rd_enable = 1, .wr_enable = 0}
>> +    },
>> +    .clk_inefficiency_factor = 105,
>> +    .bw_inefficiency_factor = 120,
>> +};
>> +
>>   static const struct dpu_perf_cfg sm8150_perf_data = {
>>       .max_bw_low = 12800000,
>>       .max_bw_high = 12800000,
>> @@ -2618,6 +2780,30 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
>>       .mdss_irqs = IRQ_SC7180_MASK,
>>   };
>>   +static const struct dpu_mdss_cfg sm6350_dpu_cfg = {
>> +    .caps = &sm6350_dpu_caps,
>> +    .mdp_count = ARRAY_SIZE(sm6350_mdp),
>> +    .mdp = sm6350_mdp,
>> +    .ctl_count = ARRAY_SIZE(sm6350_ctl),
>> +    .ctl = sm6350_ctl,
>> +    .sspp_count = ARRAY_SIZE(sm6350_sspp),
>> +    .sspp = sm6350_sspp,
>> +    .mixer_count = ARRAY_SIZE(sm6350_lm),
>> +    .mixer = sm6350_lm,
>> +    .dspp_count = ARRAY_SIZE(sm6350_dspp),
>> +    .dspp = sm6350_dspp,
>> +    .pingpong_count = ARRAY_SIZE(sm6350_pp),
>> +    .pingpong = sm6350_pp,
>> +    .intf_count = ARRAY_SIZE(sm6350_intf),
>> +    .intf = sm6350_intf,
>> +    .vbif_count = ARRAY_SIZE(sm6350_vbif),
>> +    .vbif = sm6350_vbif,
>> +    .reg_dma_count = 1,
>> +    .dma_cfg = &sm8250_regdma,
>> +    .perf = &sm6350_perf_data,
>> +    .mdss_irqs = IRQ_SC7180_MASK,
>> +};
>> +
>>   static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>>       .caps = &sm8150_dpu_caps,
>>       .mdp_count = ARRAY_SIZE(sdm845_mdp),
>> @@ -2861,6 +3047,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>>       { .hw_rev = DPU_HW_VER_600, .dpu_cfg = &sm8250_dpu_cfg},
>>       { .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
>>       { .hw_rev = DPU_HW_VER_630, .dpu_cfg = &sm6115_dpu_cfg},
>> +    { .hw_rev = DPU_HW_VER_640, .dpu_cfg = &sm6350_dpu_cfg},
>>       { .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
>>       { .hw_rev = DPU_HW_VER_700, .dpu_cfg = &sm8350_dpu_cfg},
>>       { .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index c7a2e6237d2b..cbf21613e121 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -45,6 +45,7 @@
>>   #define DPU_HW_VER_600    DPU_HW_VER(6, 0, 0) /* sm8250 */
>>   #define DPU_HW_VER_620    DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>>   #define DPU_HW_VER_630    DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
>> +#define DPU_HW_VER_640    DPU_HW_VER(6, 4, 0) /* sm6350 */
>>   #define DPU_HW_VER_650    DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>>   #define DPU_HW_VER_700    DPU_HW_VER(7, 0, 0) /* sm8350 */
>>   #define DPU_HW_VER_720    DPU_HW_VER(7, 2, 0) /* sc7280 */
>> @@ -352,6 +353,8 @@ enum dpu_qos_lut_usage {
>>       DPU_QOS_LUT_USAGE_LINEAR,
>>       DPU_QOS_LUT_USAGE_MACROTILE,
>>       DPU_QOS_LUT_USAGE_NRT,
>> +    DPU_QOS_LUT_USAGE_CWB,
>> +    DPU_QOS_LUT_USAGE_MACROTILE_QSEED,
>>       DPU_QOS_LUT_USAGE_MAX,
>>   };
>>   diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index a683bd9b5a04..ebfbbd2d105e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1306,6 +1306,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>       { .compatible = "qcom,sc8180x-dpu", },
>>       { .compatible = "qcom,sc8280xp-dpu", },
>>       { .compatible = "qcom,sm6115-dpu", },
>> +    { .compatible = "qcom,sm6350-dpu", },
>>       { .compatible = "qcom,sm8150-dpu", },
>>       { .compatible = "qcom,sm8250-dpu", },
>>       { .compatible = "qcom,sm8350-dpu", },
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> 
> Please split mdss to a separate patch.
Ack

Konrad
> 
>> index 02646e4bb4cd..841016f3983a 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -279,6 +279,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>>           msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
>>           break;
>>       case DPU_HW_VER_620:
>> +    case DPU_HW_VER_640:
>>           /* UBWC_2_0 */
>>           msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>>           break;
>> @@ -529,6 +530,7 @@ static const struct of_device_id mdss_dt_match[] = {
>>       { .compatible = "qcom,sc8180x-mdss" },
>>       { .compatible = "qcom,sc8280xp-mdss" },
>>       { .compatible = "qcom,sm6115-mdss" },
>> +    { .compatible = "qcom,sm6350-mdss" },
>>       { .compatible = "qcom,sm8150-mdss" },
>>       { .compatible = "qcom,sm8250-mdss" },
>>       { .compatible = "qcom,sm8350-mdss" },
> 
