Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878A515FCE
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 20:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EC910E260;
	Sat, 30 Apr 2022 18:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D17210E44F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 18:26:37 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id x17so19128961lfa.10
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dkYWf3KrnDVewspYX28xKggp5TZ0pAk5bK0xpuaWwtc=;
 b=UM66/tdTZ8Iwt+A12HWVUjaaefldzWtJtJKnU+qMw0FAKVAsGtA2iXtCkPKX2wFbIu
 sLrQl0oLuNANXAjqC/B+PN+96MYIGPoYTVjCneJIOsJPwgnVEinCY7S7KJgwjH1WnGle
 MC1IdeFnUF2/SE5sj5MPvuFHfEXAXc3BBFdzAZw4Nv6+K2isY8GpkDtOXGDgVEwQLn6Q
 BrQLeep1Fe/q5JZ75yt0Xl+HTVmkdXmEzzwrL11Ea+ylKFEojZUNDMNZFbTKY/zX6m0j
 urWYrKYEt40CCDcUSizCd87Cx0mTNGq05/3VfOYUsKZSivZOsf3/rSYKfmgw/7525Pyo
 yLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dkYWf3KrnDVewspYX28xKggp5TZ0pAk5bK0xpuaWwtc=;
 b=OeiwlpWhfkge4fUb5Qunr3bv11grevJoLZMr/e7PwodnbyhUF6uPteNAvvF/HXZMxL
 o3JpFN5dOTx4V97w9G96I5NXlPwToEJp/nQQTzG3G2U8ONgzdrWqchIrztNfSMyTAlDD
 myapq8GEVsq6VvAkAQ6ov/A3lAoHOzXBhbkx5dL2WasCT38ytyzO83FL41grwo9bbevW
 DmU4Jdam1ab/VwyNjnUBaPBYMA85or97ovo+4VEhr0kDxD+9FQ/1e3uxrczKj692MwPI
 kRLuaeTni23tKQC5O19rPhu0kvex7sZSH7MGSYlyzttcOtuvzUco5HywQPEPIXpec+D+
 9LFA==
X-Gm-Message-State: AOAM5332OECEKPYqbpRYIZt8nimjC0Hn5ACN7iH7JtSsniI1+ek5kAe+
 SjJXkiRVUg1CgIx7rqyh2doN/OHJKARgKQ==
X-Google-Smtp-Source: ABdhPJz+LlvQDfAsnGQkcqp6uUTw6PYMz4uVOcOWd5D0VX05R5zyFxMgBOx0K+SHfFK+ce0umT87RQ==
X-Received: by 2002:ac2:5285:0:b0:472:54b8:f62e with SMTP id
 q5-20020ac25285000000b0047254b8f62emr3643942lfm.231.1651343195829; 
 Sat, 30 Apr 2022 11:26:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j15-20020ac2454f000000b0047255d210ebsm246051lfm.26.2022.04.30.11.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:26:35 -0700 (PDT)
Message-ID: <a7ec67be-da0a-e6f0-ee9d-f257027063b8@linaro.org>
Date: Sat, 30 Apr 2022 21:26:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] drm/msm/disp: dpu1: Add MSM8996 support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220430161529.605843-1-konrad.dybcio@somainline.org>
 <20220430161529.605843-2-konrad.dybcio@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220430161529.605843-2-konrad.dybcio@somainline.org>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Loic Poulain <loic.poulain@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jamipkettunen@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 martin.botka@somainline.org, Robert Foss <robert.foss@linaro.org>,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/04/2022 19:15, Konrad Dybcio wrote:
> Add support for MSM8996, which - fun fact - was the SoC that this driver
> (or rather SDE, its downstream origin) was meant for and first tested on.
> 
> It has some hardware that differs from the modern SoCs, so not a lot of
> current structs could have been reused. It's also seemingly the only SoC
> supported by DPU that uses RGB pipes.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 268 ++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>   drivers/gpu/drm/msm/msm_drv.c                 |   1 +
>   3 files changed, 270 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 3ac425c0ad82..0a217b5172bd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -16,6 +16,11 @@
>   	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
>   
> +#define VIG_MSM8996_MASK \
> +	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
> +	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_TS_PREFILL) |\
> +	BIT(DPU_SSPP_SCALER_QSEED3))

I think it has QSEED2 (yes, currently unsupported by DPU).

> +
>   #define VIG_MSM8998_MASK \
>   	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>   
> @@ -30,6 +35,10 @@
>   
>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>   
> +#define DMA_MSM8996_MASK \
> +	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
> +	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_CDP))
> +
>   #define DMA_MSM8998_MASK \
>   	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> @@ -57,6 +66,9 @@
>   #define PINGPONG_SDM845_SPLIT_MASK \
>   	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>   
> +#define RGB_MSM8996_MSK \
> +	(VIG_MSM8996_MASK | BIT(DPU_SSPP_SCALER_RGB))
> +

Please expand the VIG_MSM8996_MASK here. Currently we have separate 
masks for VIG, separate masks for DMA. Let's keeep that for RGB.


>   #define CTL_SC7280_MASK \
>   	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
>   
> @@ -72,6 +84,14 @@
>   
>   #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>   
> +#define IRQ_MSM8996_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_INTR) | \
> +			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF2_INTR) | \
> +			 BIT(MDP_INTF3_INTR))
> +
>   #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			 BIT(MDP_SSPP_TOP0_INTR2) | \
>   			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -207,6 +227,17 @@ static const uint32_t plane_formats_yuv[] = {
>    * DPU sub blocks config
>    *************************************************************/
>   /* DPU top level caps */
> +static const struct dpu_caps msm8996_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x7,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,

QSEED2

> +	.has_src_split = true,
> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +};
> +
>   static const struct dpu_caps msm8998_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0x7,
> @@ -328,6 +359,35 @@ static const struct dpu_caps sc7280_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_mdp_cfg msm8996_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x454,
> +	.features = 0,
> +	.highest_bank_bit = 0x2,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +			.reg_off = 0x2AC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x2B4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> +			.reg_off = 0x2BC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> +			.reg_off = 0x2C4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_RGB0] = {
> +			.reg_off = 0x2AC, .bit_off = 4},
> +	.clk_ctrls[DPU_CLK_CTRL_RGB1] = {
> +			.reg_off = 0x2B4, .bit_off = 4},
> +	.clk_ctrls[DPU_CLK_CTRL_RGB2] = {
> +			.reg_off = 0x2BC, .bit_off = 4},
> +	.clk_ctrls[DPU_CLK_CTRL_RGB3] = {
> +			.reg_off = 0x2C4, .bit_off = 4},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x2AC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> +			.reg_off = 0x2B4, .bit_off = 8},
> +	},
> +};
> +
>   static const struct dpu_mdp_cfg msm8998_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -513,6 +573,39 @@ static const struct dpu_mdp_cfg qcm2290_mdp[] = {
>   /*************************************************************
>    * CTL sub blocks config
>    *************************************************************/
> +static const struct dpu_ctl_cfg msm8996_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x64,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x1200, .len = 0x64,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x1400, .len = 0x64,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x1600, .len = 0x64,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x1800, .len = 0x64,
> +	.features = 0,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +};
> +
>   static const struct dpu_ctl_cfg msm8998_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
> @@ -708,6 +801,25 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>   
>   /* SSPP common configuration */
>   
> +#define _VIG_SBLK_8996(num, sdma_pri, qseed_ver) \
> +	{ \
> +	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
> +	.maxupscale = MAX_UPSCALE_RATIO, \
> +	.smart_dma_priority = sdma_pri, \
> +	.src_blk = {.name = STRCAT("sspp_src_", num), \
> +		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
> +	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
> +		.id = qseed_ver, \
> +		.base = 0x200, .len = 0xa0,}, \
> +	.csc_blk = {.name = STRCAT("sspp_csc", num), \
> +		.id = DPU_SSPP_CSC, \
> +		.base = 0x320, .len = 0x100,}, \
> +	.format_list = plane_formats_yuv, \
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
> +	.virt_format_list = plane_formats, \
> +	.virt_num_formats = ARRAY_SIZE(plane_formats), \
> +	}
> +
>   #define _VIG_SBLK(num, sdma_pri, qseed_ver) \
>   	{ \
>   	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
> @@ -740,6 +852,15 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>   	.virt_num_formats = ARRAY_SIZE(plane_formats), \
>   	}
>   
> +static const struct dpu_sspp_sub_blks msm8996_vig_sblk_0 =
> +				_VIG_SBLK_8996("0", 0, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks msm8996_vig_sblk_1 =
> +				_VIG_SBLK_8996("1", 0, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks msm8996_vig_sblk_2 =
> +				_VIG_SBLK_8996("2", 0, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks msm8996_vig_sblk_3 =
> +				_VIG_SBLK_8996("3", 0, DPU_SSPP_SCALER_QSEED3);

Again QSEED2

> +
>   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
>   				_VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3);
>   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
> @@ -775,6 +896,30 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>   	.clk_ctrl = _clkctrl \
>   	}
>   
> +static const struct dpu_sspp_cfg msm8996_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x150, VIG_MSM8996_MASK,
> +		msm8996_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x150, VIG_MSM8996_MASK,
> +		msm8996_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x150, VIG_MSM8996_MASK,
> +		msm8996_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x150, VIG_MSM8996_MASK,
> +		msm8996_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	/* TODO: RGB blocks */

Plwease expand this to 'add dpu_sspp_sub_blks instances for RGB blocks.
Let's do it before we land this patchset.

> +	SSPP_BLK("sspp_4", SSPP_RGB0, 0x14000, 0x150, RGB_MSM8996_MSK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_RGB, DPU_CLK_CTRL_RGB0),
> +	SSPP_BLK("sspp_5", SSPP_RGB1, 0x16000, 0x150, RGB_MSM8996_MSK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_RGB, DPU_CLK_CTRL_RGB1),
> +	SSPP_BLK("sspp_6", SSPP_RGB2, 0x18000, 0x150, RGB_MSM8996_MSK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_RGB, DPU_CLK_CTRL_RGB2),
> +	SSPP_BLK("sspp_7", SSPP_RGB3, 0x1a000, 0x150, RGB_MSM8996_MSK,
> +		sdm845_dma_sblk_3, 13, SSPP_TYPE_RGB, DPU_CLK_CTRL_RGB3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x150, DMA_MSM8996_MASK,
> +		sdm845_dma_sblk_0, 2, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x150, DMA_MSM8996_MASK,
> +		sdm845_dma_sblk_1, 10, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +};
> +
>   static const struct dpu_sspp_cfg msm8998_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x184, VIG_MSM8998_MASK,
>   		msm8998_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> @@ -1100,6 +1245,11 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
>   /*************************************************************
>    * PINGPONG sub blocks config
>    *************************************************************/
> +static const struct dpu_pingpong_sub_blks msm8996_pp_sblk_te = {
> +	.te2 = {.id = DPU_PINGPONG_TE2, .base = 0x2000, .len = 0x0,
> +		.version = 0x1},
> +};
> +
>   static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
>   	.te2 = {.id = DPU_PINGPONG_TE2, .base = 0x2000, .len = 0x0,
>   		.version = 0x1},
> @@ -1138,6 +1288,21 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   	.intr_rdptr = _rdptr, \
>   	}
>   
> +static const struct dpu_pingpong_cfg msm8996_pp[] = {
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, msm8996_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, msm8996_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +};
> +
>   static const struct dpu_pingpong_cfg sdm845_pp[] = {
>   	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -1232,6 +1397,13 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   	.intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
>   	}
>   
> +static const struct dpu_intf_cfg msm8996_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x268, INTF_NONE, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x268, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x6B000, 0x268, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x6B800, 0x268, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +};
> +
>   static const struct dpu_intf_cfg msm8998_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x6A000, 0x268, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	INTF_BLK("intf_1", INTF_1, 0x6A800, 0x268, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -1308,6 +1480,33 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
>   	},
>   };
>   
> +static const struct dpu_vbif_cfg msm8996_vbif[] = {
> +	{
> +	.name = "vbif_0", .id = VBIF_0,
> +	.base = 0, .len = 0x1040,
> +	.default_ot_rd_limit = 32,
> +	.default_ot_wr_limit = 16,
> +	.features = BIT(DPU_VBIF_QOS_REMAP) | BIT(DPU_VBIF_QOS_OTLIM),
> +	.xin_halt_timeout = 0x4000,
> +	.dynamic_ot_rd_tbl = {
> +		.count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
> +		.cfg = msm8998_ot_rdwr_cfg,
> +		},
> +	.dynamic_ot_wr_tbl = {
> +		.count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
> +		.cfg = msm8998_ot_rdwr_cfg,
> +		},
> +	.qos_rt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(msm8998_rt_pri_lvl),
> +		.priority_lvl = msm8998_rt_pri_lvl,
> +		},
> +	.qos_nrt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(msm8998_nrt_pri_lvl),
> +		.priority_lvl = msm8998_nrt_pri_lvl,
> +		},
> +	},
> +};

I think this is not correct. IIRC MSM8996 had two separate VBIFs: RT and 
NRT.

At least it deserves a comment that second VBIF is not supported yet, etc.

> +
>   static const struct dpu_vbif_cfg msm8998_vbif[] = {
>   	{
>   	.name = "vbif_0", .id = VBIF_0,
> @@ -1491,6 +1690,42 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>   	{.fl = 0, .lut = 0x0},
>   };
>   
> +static const struct dpu_perf_cfg msm8996_perf_data = {
> +	.max_bw_low = 9600000,
> +	.max_bw_high = 9600000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 800000,
> +	.min_dram_ib = 800000,
> +	.undersized_prefill_lines = 2,
> +	.xtra_prefill_lines = 2,
> +	.dest_scale_prefill_lines = 3,
> +	.macrotile_prefill_lines = 4,
> +	.yuv_nv12_prefill_lines = 8,
> +	.linear_prefill_lines = 1,
> +	.downscaling_prefill_lines = 1,
> +	.amortizable_threshold = 25,
> +	.min_prefill_lines = 21,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfffc, 0xff00, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(msm8998_qos_linear),
> +		.entries = msm8998_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(msm8998_qos_macrotile),
> +		.entries = msm8998_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(msm8998_qos_nrt),
> +		.entries = msm8998_qos_nrt
> +		},
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
>   static const struct dpu_perf_cfg msm8998_perf_data = {
>   	.max_bw_low = 6700000,
>   	.max_bw_high = 6700000,
> @@ -1757,6 +1992,36 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
>    * Hardware catalog init
>    *************************************************************/
>   
> +/*
> + * msm8996_cfg_init(): populate msm8996 dpu sub-blocks reg offsets
> + * and instance counts.
> + */
> +static void msm8996_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> +{
> +	*dpu_cfg = (struct dpu_mdss_cfg){
> +		.caps = &msm8996_dpu_caps,
> +		.mdp_count = ARRAY_SIZE(msm8996_mdp),
> +		.mdp = msm8996_mdp,
> +		.ctl_count = ARRAY_SIZE(msm8996_ctl),
> +		.ctl = msm8996_ctl,
> +		.sspp_count = ARRAY_SIZE(msm8996_sspp),
> +		.sspp = msm8996_sspp,
> +		.mixer_count = ARRAY_SIZE(msm8998_lm),
> +		.mixer = msm8998_lm,
> +		.dspp_count = ARRAY_SIZE(msm8998_dspp),
> +		.dspp = msm8998_dspp,
> +		.pingpong_count = ARRAY_SIZE(msm8996_pp),
> +		.pingpong = msm8996_pp,
> +		.intf_count = ARRAY_SIZE(msm8996_intf),
> +		.intf = msm8996_intf,
> +		.vbif_count = ARRAY_SIZE(msm8996_vbif),
> +		.vbif = msm8996_vbif,
> +		.reg_dma_count = 0,
> +		.perf = msm8996_perf_data,
> +		.mdss_irqs = IRQ_MSM8996_MASK,
> +	};
> +}
> +
>   /*
>    * msm8998_cfg_init(): populate sdm845 dpu sub-blocks reg offsets
>    * and instance counts.
> @@ -2031,6 +2296,9 @@ static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   }
>   
>   static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
> +	{ .hw_rev = DPU_HW_VER_170, .cfg_init = msm8996_cfg_init},
> +	{ .hw_rev = DPU_HW_VER_171, .cfg_init = msm8996_cfg_init},
> +	{ .hw_rev = DPU_HW_VER_172, .cfg_init = msm8996_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_300, .cfg_init = msm8998_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_301, .cfg_init = msm8998_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e29796c4f27b..9ba25195838f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1321,6 +1321,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>   };
>   
>   const struct of_device_id dpu_dt_match[] = {
> +	{ .compatible = "qcom,msm8996-dpu", },

Let's discuss this separately, in the thread starting from dt-bindings.

>   	{ .compatible = "qcom,msm8998-dpu", },
>   	{ .compatible = "qcom,qcm2290-dpu", },
>   	{ .compatible = "qcom,sdm845-dpu", },
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9c36b505daab..8cd2a0fd9b5f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1305,6 +1305,7 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
>   static const struct of_device_id dt_match[] = {
>   	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
>   	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> +	{ .compatible = "qcom,msm8996-mdss", .data = (void *)KMS_DPU },

This should not be necessary after the 
https://patchwork.freedesktop.org/series/98525/. For the MDSS the driver 
can definitely continue using qcom,mdss (or "qcom,msm8996-mdss", 
"qcom,mdss") without the need to use separate compatible entry here.

>   	{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },


-- 
With best wishes
Dmitry
