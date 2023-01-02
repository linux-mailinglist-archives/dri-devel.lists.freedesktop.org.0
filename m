Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8179E65AEAB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 10:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272CD10E1A0;
	Mon,  2 Jan 2023 09:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60D210E19E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 09:31:02 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b3so40883631lfv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 01:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PTSALLKEBTqUnpQIrd3L+3yvS0l6HJ+SHJhoHUqJSak=;
 b=XmR1/v6opDEDateM8SjxPyL+62Yz/w+6FAil1KmmvGIetsofrEAglhkba5Wair0ouL
 VqTKINVV67wfnT5G1ypcVwuXEKaSPcf7BviOo7/IGt2RQio8p7s+5iv8TGfeHjDlUYRP
 w5UKZ+a1eb03qdKlol6qD8blRinv5HFvZF6F98TlcFzdvkcYALM6q6LV+25j2RCrvZjJ
 bkhWXm5GluPtf2jmfUtHudk9ayM+Vr/pJNscOG8SRk94ybrGTW1IxtWhFupgijoIKMS9
 u4EQQCsUTUWMMjF+BJvzZeNF/IvnKqJ2uBbt9bLjldgcD823X19HLjz08IOp4lpcuVlw
 +Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PTSALLKEBTqUnpQIrd3L+3yvS0l6HJ+SHJhoHUqJSak=;
 b=NoPpP+qDleP2xbPcvyev6HEyKw7ZFrnjD8WOLeQqguTXu9zFlRpjksb2zgytqnY1nz
 dthKtpxmEOKDWR/+o/aITluLXSV6uQ3y97NEb+9xjtA5POw088eoLpfoJFM70MKQGvYc
 ZJjLAlHkMb2PcFp+nHDWQ73+VXtx5tSyna2u2QL8m8OegFXU3y1yq7U7X3xGevGlKqdX
 FsnBVCg7gIhNZOQ8cVU9cdSd4kC/d9p69SypDWNmeilHzBPi1UBPkL3B1/ighEN9fjy/
 6iCEjaN6dCm7E3d04JCEBu6j/Q3WD2qb4bd2bAZsmmR2fgI5qG8hA90n2KJunzCkUoQi
 eqcA==
X-Gm-Message-State: AFqh2kpvDD1s4iFuxbVSLP2CFHKZ6cLb4OpIlyq6XtC0L2hQqdVAQ3C/
 17ZGI8YRZTV5/qTTpP6dd5ebVQ==
X-Google-Smtp-Source: AMrXdXtyC80R0GANqRwc1VRr8ZevXYK+Ed5Db+s2H7BBigi+9Cfhg/tqdr5RaSt2QNewd/L3dzBHDw==
X-Received: by 2002:a05:6512:3e0d:b0:4a9:a1f1:3f57 with SMTP id
 i13-20020a0565123e0d00b004a9a1f13f57mr16673818lfv.50.1672651860985; 
 Mon, 02 Jan 2023 01:31:00 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
 by smtp.gmail.com with ESMTPSA id
 r1-20020ac25a41000000b00494a2a0f6cfsm4414104lfn.183.2023.01.02.01.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 01:31:00 -0800 (PST)
Message-ID: <853cbc6e-ae49-b2be-fb64-43f5171b74e8@linaro.org>
Date: Mon, 2 Jan 2023 10:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 3/7] drm/msm/dpu: Disable MDP vsync source selection
 on DPU 5.0.0 and above
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kalyan Thota <quic_kalyant@quicinc.com>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-4-marijn.suijten@somainline.org>
 <20221231215254.pqaegrmldufi7ugo@SoMainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221231215254.pqaegrmldufi7ugo@SoMainline.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31.12.2022 22:52, Marijn Suijten wrote:
> On 2022-12-31 22:50:02, Marijn Suijten wrote:
>> Since hardware revision 5.0.0 the TE configuration moved out of the
>> PINGPONG block into the INTF block, including vsync source selection
>> that was previously part of MDP top.  Writing to the MDP_VSYNC_SEL
>> register has no effect anymore and is omitted downstream via the
>> DPU/SDE_MDP_VSYNC_SEL feature flag.  This flag is only added to INTF
>> blocks used by hardware prior to 5.0.0.
>>
>> The code that writes to these registers in the INTF block will follow in
>> subsequent patches.
>>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 33 ++++++++++--
>>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 52 +++++++++++++------
>>  3 files changed, 66 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 39d4b293710c..1cfe94494135 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -407,7 +407,7 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
>>  	{
>>  	.name = "top_0", .id = MDP_TOP,
>>  	.base = 0x0, .len = 0x458,
>> -	.features = 0,
>> +	.features = BIT(DPU_MDP_VSYNC_SEL),
>>  	.highest_bank_bit = 0x2,
>>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>>  			.reg_off = 0x2AC, .bit_off = 0},
>> @@ -436,7 +436,7 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
>>  	{
>>  	.name = "top_0", .id = MDP_TOP,
>>  	.base = 0x0, .len = 0x45C,
>> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>> +	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
>>  	.highest_bank_bit = 0x2,
>>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>>  			.reg_off = 0x2AC, .bit_off = 0},
>> @@ -512,6 +512,31 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
>>  	},
>>  };
>>  
>> +static const struct dpu_mdp_cfg sdm8150_mdp[] = {
> 
> Sometimes it is only possible to spot such things _after_ sending,
> probably the thing that makes us human :)
> 
> sm8150_mdp*, not sdm.
> 
> - Marijn
> 
>> +	{
>> +	.name = "top_0", .id = MDP_TOP,
>> +	.base = 0x0, .len = 0x45C,
>> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
>> +	.highest_bank_bit = 0x2,
>> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>> +			.reg_off = 0x2AC, .bit_off = 0},
Keeping the hex values lowercase would be nice.

Konrad
>> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
>> +			.reg_off = 0x2B4, .bit_off = 0},
>> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
>> +			.reg_off = 0x2BC, .bit_off = 0},
>> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
>> +			.reg_off = 0x2C4, .bit_off = 0},
>> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>> +			.reg_off = 0x2AC, .bit_off = 8},
>> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>> +			.reg_off = 0x2B4, .bit_off = 8},
>> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
>> +			.reg_off = 0x2BC, .bit_off = 8},
>> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
>> +			.reg_off = 0x2C4, .bit_off = 8},
>> +	},
>> +};
>> +
>>  static const struct dpu_mdp_cfg sm8250_mdp[] = {
>>  	{
>>  	.name = "top_0", .id = MDP_TOP,
>> @@ -1901,8 +1926,8 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
>>  
>>  static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>>  	.caps = &sm8150_dpu_caps,
>> -	.mdp_count = ARRAY_SIZE(sdm845_mdp),
>> -	.mdp = sdm845_mdp,
>> +	.mdp_count = ARRAY_SIZE(sdm8150_mdp),
>> +	.mdp = sdm8150_mdp,
>>  	.ctl_count = ARRAY_SIZE(sm8150_ctl),
>>  	.ctl = sm8150_ctl,
>>  	.sspp_count = ARRAY_SIZE(sdm845_sspp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 3b645d5aa9aa..e0e153889ab7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -93,6 +93,7 @@ enum {
>>  	DPU_MDP_UBWC_1_0,
>>  	DPU_MDP_UBWC_1_5,
>>  	DPU_MDP_AUDIO_SELECT,
>> +	DPU_MDP_VSYNC_SEL,
>>  	DPU_MDP_MAX
>>  };
>>  
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> index c3110a25a30d..2e699c9ad13c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>> @@ -151,28 +151,16 @@ static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
>>  	status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x3;
>>  }
>>  
>> -static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>> +static void dpu_hw_setup_vsync_source_v1(struct dpu_hw_mdp *mdp,
>>  		struct dpu_vsync_source_cfg *cfg)
>>  {
>>  	struct dpu_hw_blk_reg_map *c;
>> -	u32 reg, wd_load_value, wd_ctl, wd_ctl2, i;
>> -	static const u32 pp_offset[PINGPONG_MAX] = {0xC, 0x8, 0x4, 0x13, 0x18};
>> +	u32 reg, wd_load_value, wd_ctl, wd_ctl2;
>>  
>> -	if (!mdp || !cfg || (cfg->pp_count > ARRAY_SIZE(cfg->ppnumber)))
>> +	if (!mdp || !cfg)
>>  		return;
>>  
>>  	c = &mdp->hw;
>> -	reg = DPU_REG_READ(c, MDP_VSYNC_SEL);
>> -	for (i = 0; i < cfg->pp_count; i++) {
>> -		int pp_idx = cfg->ppnumber[i] - PINGPONG_0;
>> -
>> -		if (pp_idx >= ARRAY_SIZE(pp_offset))
>> -			continue;
>> -
>> -		reg &= ~(0xf << pp_offset[pp_idx]);
>> -		reg |= (cfg->vsync_source & 0xf) << pp_offset[pp_idx];
>> -	}
>> -	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
>>  
>>  	if (cfg->vsync_source >= DPU_VSYNC_SOURCE_WD_TIMER_4 &&
>>  			cfg->vsync_source <= DPU_VSYNC_SOURCE_WD_TIMER_0) {
>> @@ -219,6 +207,33 @@ static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>>  	}
>>  }
>>  
>> +static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>> +		struct dpu_vsync_source_cfg *cfg)
>> +{
>> +	struct dpu_hw_blk_reg_map *c;
>> +	u32 reg, i;
>> +	static const u32 pp_offset[PINGPONG_MAX] = {0xC, 0x8, 0x4, 0x13, 0x18};
>> +
>> +	if (!mdp || !cfg || (cfg->pp_count > ARRAY_SIZE(cfg->ppnumber)))
>> +		return;
>> +
>> +	c = &mdp->hw;
>> +
>> +	reg = DPU_REG_READ(c, MDP_VSYNC_SEL);
>> +	for (i = 0; i < cfg->pp_count; i++) {
>> +		int pp_idx = cfg->ppnumber[i] - PINGPONG_0;
>> +
>> +		if (pp_idx >= ARRAY_SIZE(pp_offset))
>> +			continue;
>> +
>> +		reg &= ~(0xf << pp_offset[pp_idx]);
>> +		reg |= (cfg->vsync_source & 0xf) << pp_offset[pp_idx];
>> +	}
>> +	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
>> +
>> +	dpu_hw_setup_vsync_source_v1(mdp, cfg);
>> +}
>> +
>>  static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
>>  		struct dpu_danger_safe_status *status)
>>  {
>> @@ -266,7 +281,12 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>>  	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>>  	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>>  	ops->get_danger_status = dpu_hw_get_danger_status;
>> -	ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>> +
>> +	if (cap & BIT(DPU_MDP_VSYNC_SEL))
>> +		ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>> +	else
>> +		ops->setup_vsync_source = dpu_hw_setup_vsync_source_v1;
>> +
>>  	ops->get_safe_status = dpu_hw_get_safe_status;
>>  
>>  	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
>> -- 
>> 2.39.0
>>
