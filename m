Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D4C629ACB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8396110E3F0;
	Tue, 15 Nov 2022 13:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB8310E3F0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:40:46 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id c25so17547289ljr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WVmKFkci/3+AxskHpOlnI4prrtp9CiSe8JG/YJYX1Hk=;
 b=eBNf26hYmiiaMWwOQpLupdlRO9rTBtMrwnDwQlnSvMbTRgp9CGewFM5DmiFzWKbg/E
 6K14MpUuY8Mt8Ok+xPUddrfFViWr2o1k4l6/GSfbe94YsXFc8JKH1Drk/p8Pv0i6/oIe
 AG82+hOcwy/LdkY8F/VnVH5cP7jVA98dl/iGbiMlUTA96d2SxhrGUh2UMI1S1YnQ7DpH
 XNhoL3jrSTfe7nCmE3znw1iFKXMFAMBwRx9pe6GLrfIPqmN456mUcQ+CpTjs+l2jwCFG
 CCUDXbE9Jc33wN3KGHUNof0JDVYUiJkTHJYxnnbYbTViMGOVYuBjYcxjhQdjgcXhaY3m
 +9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WVmKFkci/3+AxskHpOlnI4prrtp9CiSe8JG/YJYX1Hk=;
 b=jGNxURk0bpzf+taWUvDYOI4j7F2zWzxPkHLA6x2eH1FeKGp6/chl3jUEL80k7qsijt
 iurvADZcXRjxTJAEmms85QXT/bhtGcVBjd5xZAB8xzNFT0XgGCbIzLI2UAz7IkZjhltL
 +sJ5ZFkXZnA3k0rxH+fhSNBl4YGC+7M84uVXvfUpgBFU0j9oCG7aDIEjDPCZJuRe8FtX
 L7aXW6Dse71hFF7K66Ldkz+Mr8b7j3Ppdk3wNVI13q0iU7xyo3ZwWH8IQFYxnGruy22C
 yikQIrU+2b3v5bPT+K4uftAs31uuE97oJaaRiSi5V8q3irCBG2vbeimPT3O3ExtRUC0S
 teGg==
X-Gm-Message-State: ANoB5pmhoFp7AILIz6VbphoLih41mhOqGx2gqa8Xyo1MYRDOFKWPkgJc
 lUHvObp7d4H3WHa3i574tasE+w==
X-Google-Smtp-Source: AA0mqf7kZjz/AX3c9+vEsF3iR/Nb148Eg9a5htmF2Jolr5xZ62zK/8RvCnMezw0dFwsw4JOpkNszTQ==
X-Received: by 2002:a2e:8052:0:b0:278:f5b8:82c8 with SMTP id
 p18-20020a2e8052000000b00278f5b882c8mr4314905ljg.228.1668519644729; 
 Tue, 15 Nov 2022 05:40:44 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 w30-20020a197b1e000000b0048a9e18ae67sm2214212lfc.84.2022.11.15.05.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:40:44 -0800 (PST)
Message-ID: <6991c8d8-cbcf-b459-bd3b-ba82a330d18a@linaro.org>
Date: Tue, 15 Nov 2022 14:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 04/12] drm/msm/dpu: Add SM8350 to hw catalog
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-5-robert.foss@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221115133105.980877-5-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/11/2022 14:30, Robert Foss wrote:
> Add compatibility for SM8350 display subsystem, including
> required entries in DPU hw catalog.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 196 ++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>   2 files changed, 197 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 8f2d634f7b6b..e21ef7d912a0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -112,6 +112,15 @@
>   			 BIT(MDP_INTF3_INTR) | \
>   			 BIT(MDP_INTF4_INTR))
>   
> +#define IRQ_SM8350_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_7xxx_INTR) | \
> +			 BIT(MDP_INTF1_7xxx_INTR) | \
> +			 BIT(MDP_INTF2_7xxx_INTR) | \
> +			 BIT(MDP_INTF3_7xxx_INTR) | \
> +			 0)
> +
>   #define IRQ_SC8180X_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>   			  BIT(MDP_SSPP_TOP0_INTR2) | \
>   			  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -375,6 +384,20 @@ static const struct dpu_caps sm8250_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_caps sm8350_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.ubwc_version = DPU_HW_UBWC_VER_40,
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = 4096,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
>   static const struct dpu_caps sm8450_dpu_caps = {
>   	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.max_mixer_blendstages = 0xb,
> @@ -526,6 +549,33 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>   	},
>   };
>   
> +static const struct dpu_mdp_cfg sm8350_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = 0,
> +	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +			.reg_off = 0x2AC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x2B4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> +			.reg_off = 0x2BC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> +			.reg_off = 0x2C4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x2AC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> +			.reg_off = 0x2B4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +			.reg_off = 0x2BC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +			.reg_off = 0x2C4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> +			.reg_off = 0x2BC, .bit_off = 20},
> +	},
Let's try not adding more uppercase hex.

> +};
> +
>   static const struct dpu_mdp_cfg sm8450_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
> @@ -711,6 +761,45 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
>   	},
>   };
>   
> +static const struct dpu_ctl_cfg sm8350_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x15000, .len = 0x1e8,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x16000, .len = 0x1e8,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x17000, .len = 0x1e8,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x18000, .len = 0x1e8,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x19000, .len = 0x1e8,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +	{
> +	.name = "ctl_5", .id = CTL_5,
> +	.base = 0x1a000, .len = 0x1e8,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
>   static const struct dpu_ctl_cfg sm8450_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
> @@ -1301,6 +1390,27 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
>   };
>   
> +static const struct dpu_pingpong_cfg sm8350_pp[] = {
> +	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> +	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +			-1),
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +			-1),
> +};
> +
>   static struct dpu_pingpong_cfg qcm2290_pp[] = {
>   	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>   		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -1352,6 +1462,12 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
>   	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
>   };
>   
> +static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
> +	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
> +	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> +	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
> +};
> +
>   static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>   	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
>   	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
> @@ -1376,6 +1492,12 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
>   	DSC_BLK("dsc_3", DSC_3, 0x80c00),
>   };
>   
> +static struct dpu_dsc_cfg sm8350_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000),
> +	DSC_BLK("dsc_1", DSC_1, 0x81000),
> +	DSC_BLK("dsc_2", DSC_2, 0x82000),
> +};
> +
>   /*************************************************************
>    * INTF sub blocks config
>    *************************************************************/
> @@ -1423,6 +1545,13 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>   	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>   };
>   
> +static const struct dpu_intf_cfg sm8350_intf[] = {
> +	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +	INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +};
> +
>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>   	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>   	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> @@ -1558,6 +1687,14 @@ static const struct dpu_reg_dma_cfg sm8250_regdma = {
>   	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
>   };
>   
> +static const struct dpu_reg_dma_cfg sm8350_regdma = {
> +	.base = 0x0,
qcom,sde-reg-dma-off = <0 0x400>;

> +	.version = 0x00020000,
> +	.trigger_sel_off = 0x119c,
> +	.xin_id = 7,
> +	.clk_ctrl = DPU_CLK_CTRL_REG_DMA,
> +};
> +
>   static const struct dpu_reg_dma_cfg sm8450_regdma = {
>   	.base = 0x0,
>   	.version = 0x00020000,
> @@ -1899,6 +2036,36 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_perf_cfg sm8350_perf_data = {
> +	.max_bw_low = 11800000,
> +	.max_bw_high = 18200000,
qcom,sde-max-bw-high-kbps = <15500000>;

I think the rest looks good.

Konrad
> +	.min_core_ib = 2500000,
> +	.min_llcc_ib = 0,
> +	.min_dram_ib = 800000,
> +	.min_prefill_lines = 40,
> +	/* FIXME: lut tables */
> +	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
> +	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
> +		.entries = sc7180_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> +		.entries = sc7180_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +		/* TODO: macrotile-qseed is different from macrotile */
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
>   static const struct dpu_perf_cfg qcm2290_perf_data = {
>   	.max_bw_low = 2700000,
>   	.max_bw_high = 2700000,
> @@ -2075,6 +2242,34 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
>   	.mdss_irqs = IRQ_SM8250_MASK,
>   };
>   
> +static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
> +	.caps = &sm8350_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sm8350_mdp),
> +	.mdp = sm8350_mdp,
> +	.ctl_count = ARRAY_SIZE(sm8350_ctl),
> +	.ctl = sm8350_ctl,
> +	.sspp_count = ARRAY_SIZE(sm8250_sspp),
> +	.sspp = sm8250_sspp,
> +	.mixer_count = ARRAY_SIZE(sm8150_lm),
> +	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm8350_pp),
> +	.pingpong = sm8350_pp,
> +	.dsc_count = ARRAY_SIZE(sm8350_dsc),
> +	.dsc = sm8350_dsc,
> +	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
> +	.merge_3d = sm8350_merge_3d,
> +	.intf_count = ARRAY_SIZE(sm8350_intf),
> +	.intf = sm8350_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sm8250_regdma,
> +	.perf = &sm8350_perf_data,
> +	.mdss_irqs = IRQ_SM8350_MASK,
> +};
> +
>   static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
>   	.caps = &sm8450_dpu_caps,
>   	.mdp_count = ARRAY_SIZE(sm8450_mdp),
> @@ -2158,6 +2353,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_600, .dpu_cfg = &sm8250_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_700, .dpu_cfg = &sm8350_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
>   	{ .hw_rev = DPU_HW_VER_810, .dpu_cfg = &sm8450_dpu_cfg},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 664c4876f44a..5335123a0289 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -45,6 +45,7 @@
>   #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
>   #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>   #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
> +#define DPU_HW_VER_700	DPU_HW_VER(7, 0, 0) /* sm8350 */
>   #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
>   #define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
>   
