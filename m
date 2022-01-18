Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2FA492CEE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 19:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA2510E122;
	Tue, 18 Jan 2022 18:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A818A10E122
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 18:02:25 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id e3so71256352lfc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 10:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rBYED64NjVFf8MuWn3yNNXfWwrvhalUceQHRAzVC2Zc=;
 b=tmYZfE40PLFecJ50se7v3q0JW+Y1oOVzU60MdIhZQ7CijKZHNYGHLsKjmjA14i3nk1
 fsWBcYMm5ufEJsLIYtGYSnqsNTmJ2lVFzPNSxXo+BduAA2hPuw8wmIBWdBmU8ltbiEXR
 1mMsSz1xLnNwHegkTDT3r3NdmLFvmHebEig+yWtv2I3p1Gx4wKKH9HC+KzzRv5UoOJZ8
 Q2IMjzforpiEky/yzDGzQ2kIdLN79IFPamU4C9heETB1qwm5L0Yka1aEX7VJNzJ0DZGV
 3SRCGxILPVwe87iAKyB8Lq7pwKKL9/noEAOm68FoCi/J8O8G2vmqAGszx6p2hDZzxsPY
 0jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rBYED64NjVFf8MuWn3yNNXfWwrvhalUceQHRAzVC2Zc=;
 b=NBOfx5EzXWEtzczOUTkH/8yNfCBGLkpR4UNbiiKpQN/+AD/9nP4RD4SzkjcRb1PMIl
 iHR1z0RnSHux1oZxCzp434D0KaHXtr1APoOObQU/Y/oYw5DaLRZE8XbmpWIGpcZk+Uaf
 XfhOXMVMxLYBoC9BagWh/woEIN6kfkcoAmmUhe9KJwUpfQvQhJB2woFoQjUUpGW21gkx
 xhXFxQDWYU4Jfpi3C05cTeeXXmWiMuiN92l01P0rdl2FSUZ9UCSoR7p8RsegUiEMqLg/
 xNzwXl5LdsLP6k0N8XL1WSdvVMjbcn97z+KI+vKbW/wbdHQj/yUOumozzDl4hvMWOIpH
 8XoA==
X-Gm-Message-State: AOAM533QKqxTQ96kN2yFZw5kzlCwM4eehS1aidAUkTIV12vjde1tK//g
 r6jvX26RqL8c9En01hvdAUwG1AaRXHJECA==
X-Google-Smtp-Source: ABdhPJwxAIZP+/XPHTZpXI/pLdiXLbAKK42tu6sbArrF+NW5TYAoQK4YbOLYT6igW+gTxUNbL0NATA==
X-Received: by 2002:a2e:934b:: with SMTP id m11mr15764652ljh.188.1642528943796; 
 Tue, 18 Jan 2022 10:02:23 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m13sm726841lfg.98.2022.01.18.10.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 10:02:23 -0800 (PST)
Message-ID: <c37daeda-e58e-6a93-36aa-28e392bb06f2@linaro.org>
Date: Tue, 18 Jan 2022 21:02:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] drm/msm: add support for QCM2290 MDSS
Content-Language: en-GB
To: Loic Poulain <loic.poulain@linaro.org>, robdclark@gmail.com,
 sean@poorly.run, robh+dt@kernel.org
References: <1642520854-32196-1-git-send-email-loic.poulain@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1642520854-32196-1-git-send-email-loic.poulain@linaro.org>
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
Cc: devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2022 18:47, Loic Poulain wrote:
> Add compatibility for QCM2290 display subsystem, including
> required entries in DPU hw catalog.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 175 ++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
>   drivers/gpu/drm/msm/msm_drv.c                  |   1 +
>   4 files changed, 177 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index ce6f32a..7fa3fc7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -25,6 +25,8 @@
>   #define VIG_SM8250_MASK \
>   	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
>   
> +#define VIG_QCM2290_MASK VIG_MASK

| BIT(DPU_SSPP_QOS_8LVL)

> +
>   #define DMA_SDM845_MASK \
>   	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> @@ -251,6 +253,18 @@ static const struct dpu_caps sc7280_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_caps qcm2290_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0x4,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,

If there is no scaler, we probably shouldn't define it here too.

> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> +	.ubwc_version = DPU_HW_UBWC_VER_20,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.max_linewidth = 2160,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
>   static const struct dpu_mdp_cfg sdm845_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -336,6 +350,19 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg qcm2290_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.highest_bank_bit = 0x2,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +		.reg_off = 0x2AC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +		.reg_off = 0x2AC, .bit_off = 8},
> +	},
> +};
> +
>   /*************************************************************
>    * CTL sub blocks config
>    *************************************************************/
> @@ -459,6 +486,15 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>   	},
>   };
>   
> +static const struct dpu_ctl_cfg qcm2290_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x1000, .len = 0x1dc,
> +	.features = BIT(DPU_CTL_ACTIVE_CFG),
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +};
> +
>   /*************************************************************
>    * SSPP sub blocks config
>    *************************************************************/
> @@ -595,6 +631,30 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>   };
>   
> +
> +#define _QCM2290_VIG_SBLK(num, sdma_pri) \

Let's call it _VIG_SBLK_NOSCALE?

> +	{ \
> +	.maxdwnscale = SSPP_UNITY_SCALE, \
> +	.maxupscale = SSPP_UNITY_SCALE, \
> +	.smart_dma_priority = sdma_pri, \
> +	.src_blk = {.name = STRCAT("sspp_src_", num), \
> +		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \

No scaler for VIG SSPP?

> +	.format_list = plane_formats_yuv, \
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
> +	.virt_format_list = plane_formats, \
> +	.virt_num_formats = ARRAY_SIZE(plane_formats), \
> +	}
> +
> +static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _QCM2290_VIG_SBLK("0", 2);
> +static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
> +
> +static const struct dpu_sspp_cfg qcm2290_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
> +		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +};
> +
>   /*************************************************************
>    * MIXER sub blocks config
>    *************************************************************/
> @@ -679,6 +739,21 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
>   		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
>   };
>   
> +/* QCM2290 */
> +
> +static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
> +	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.maxblendstages = 4, /* excluding base layer */
> +	.blendstage_base = { /* offsets relative to mixer base */
> +		0x20, 0x38, 0x50, 0x68
> +	},
> +};
> +
> +static const struct dpu_lm_cfg qcm2290_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
> +		&qcm2290_lm_sblk, PINGPONG_0, 0, DSPP_0),
> +};
> +
>   /*************************************************************
>    * DSPP sub blocks config
>    *************************************************************/
> @@ -692,6 +767,11 @@ static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
>   		.len = 0x90, .version = 0x40000},
>   };
>   
> +static const struct dpu_dspp_sub_blks qcm2290_dspp_sblk = {
> +	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
> +		.len = 0x90, .version = 0x40000},
> +};
> +

Use sm8150_dspp_sblk here

>   #define DSPP_BLK(_name, _id, _base, _mask, _sblk) \
>   		{\
>   		.name = _name, .id = _id, \
> @@ -716,6 +796,11 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
>   		 &sm8150_dspp_sblk),
>   };
>   
> +static const struct dpu_dspp_cfg qcm2290_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &qcm2290_dspp_sblk),
> +};
> +
>   /*************************************************************
>    * PINGPONG sub blocks config
>    *************************************************************/
> @@ -736,6 +821,11 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>   	.len = 0x20, .version = 0x20000},
>   };
>   
> +static const struct dpu_pingpong_sub_blks qcm2290_pp_sblk = {
> +	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0x30e0,
> +		.len = 0x20, .version = 0x10000},
> +};
> +
You can use sdm845_pp_sblk instead.

>   #define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>   	{\
>   	.name = _name, .id = _id, \
> @@ -798,6 +888,12 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
>   			-1),
>   };
>   
> +static struct dpu_pingpong_cfg qcm2290_pp[] = {
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, qcm2290_pp_sblk,
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +};
> +
>   /*************************************************************
>    * MERGE_3D sub blocks config
>    *************************************************************/
> @@ -861,6 +957,11 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>   	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>   };
>   
> +static const struct dpu_intf_cfg qcm2290_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
> +	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +};
> +
>   /*************************************************************
>    * VBIF sub blocks config
>    *************************************************************/
> @@ -931,6 +1032,10 @@ static const struct dpu_qos_lut_entry sm8150_qos_linear[] = {
>   	{.fl = 0, .lut = 0x0011222222223357 },
>   };
>   
> +static const struct dpu_qos_lut_entry qcm2290_qos_linear[] = {
> +	{.fl = 0, .lut = 0x0011222222335777},
> +};
> +
>   static const struct dpu_qos_lut_entry sdm845_qos_macrotile[] = {
>   	{.fl = 10, .lut = 0x344556677},
>   	{.fl = 11, .lut = 0x3344556677},
> @@ -1102,6 +1207,42 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_perf_cfg qcm2290_perf_data = {
> +	.max_bw_low = 2700000,
> +	.max_bw_high = 2700000,
> +	.min_core_ib = 1300000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 1600000,
> +	.min_prefill_lines = 24,
> +	.danger_lut_tbl = {0xff, 0x0, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0x0, 0x0},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(qcm2290_qos_linear),
> +		.entries = qcm2290_qos_linear
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
> +static const struct dpu_vbif_cfg qcm2290_vbif[] = {
> +	{
> +	.name = "vbif_0", .id = VBIF_0,
> +	.base = 0, .len = 0x1040,
> +	.features = BIT(DPU_VBIF_QOS_REMAP),
> +	.xin_halt_timeout = 0x4000,
> +	.qos_rt_tbl = {
> +		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
> +		.priority_lvl = sdm845_rt_pri_lvl,
> +		},
> +	.memtype_count = 14,
> +	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
> +	},
> +};

The only difference from sdm845_vbif is the lack of .qos_nrt_tbl. Is 
this on purpose?

>   /*************************************************************
>    * Hardware catalog init
>    *************************************************************/
> @@ -1255,6 +1396,38 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   	};
>   }
>   
> +
> +/*
> + * qcm2290_cfg_init(): populate qcm2290 dpu sub-blocks reg offsets
> + * and instance counts.
> + */
> +static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
> +{
> +	*dpu_cfg = (struct dpu_mdss_cfg){
> +		.caps = &qcm2290_dpu_caps,
> +		.mdp_count = ARRAY_SIZE(qcm2290_mdp),
> +		.mdp = qcm2290_mdp,
> +		.ctl_count = ARRAY_SIZE(qcm2290_ctl),
> +		.ctl = qcm2290_ctl,
> +		.sspp_count = ARRAY_SIZE(qcm2290_sspp),
> +		.sspp = qcm2290_sspp,
> +		.mixer_count = ARRAY_SIZE(qcm2290_lm),
> +		.mixer = qcm2290_lm,
> +		.dspp_count = ARRAY_SIZE(qcm2290_dspp),
> +		.dspp = qcm2290_dspp,
> +		.pingpong_count = ARRAY_SIZE(qcm2290_pp),
> +		.pingpong = qcm2290_pp,
> +		.intf_count = ARRAY_SIZE(qcm2290_intf),
> +		.intf = qcm2290_intf,
> +		.vbif_count = ARRAY_SIZE(qcm2290_vbif),
> +		.vbif = qcm2290_vbif,
> +		.reg_dma_count = 1,
> +		.dma_cfg = sdm845_regdma,
> +		.perf = qcm2290_perf_data,
> +		.mdss_irqs = IRQ_SC7180_MASK,
> +	};
> +}
> +
>   static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
> @@ -1262,6 +1435,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
> +	{ .hw_rev = DPU_HW_VER_650, .cfg_init = qcm2290_cfg_init},
>   	{ .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
>   };
>   
> @@ -1291,4 +1465,3 @@ struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
>   	dpu_hw_catalog_deinit(dpu_cfg);
>   	return ERR_PTR(-ENODEV);
>   }
> -
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4ade44b..6d4eb46f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -41,6 +41,7 @@
>   #define DPU_HW_VER_501	DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
>   #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
>   #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
> +#define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>   #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
>   
>   #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index a15b264..7e8d8a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1286,6 +1286,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>   };
>   
>   static const struct of_device_id dpu_dt_match[] = {
> +	{ .compatible = "qcom,qcm2290-dpu", },
>   	{ .compatible = "qcom,sdm845-dpu", },
>   	{ .compatible = "qcom,sc7180-dpu", },
>   	{ .compatible = "qcom,sc7280-dpu", },
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7936e8d..ebd5266 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1434,6 +1434,7 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
>   static const struct of_device_id dt_match[] = {
>   	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
>   	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> +	{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
>   	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },


-- 
With best wishes
Dmitry
