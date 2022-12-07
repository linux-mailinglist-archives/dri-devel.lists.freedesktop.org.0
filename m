Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E8964654A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 00:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC7210E43F;
	Wed,  7 Dec 2022 23:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4F910E446;
 Wed,  7 Dec 2022 23:42:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7KdQ4p017258; Wed, 7 Dec 2022 23:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XZUGe+Ytx/JPnGJouRBI+1nSFPZjiNUa7cgEiBbV8Lw=;
 b=GaUXCp3HTPDu2US4n05aP8is8Jk2qSEvI3FYlvapCAzCWZR+CCLqMTGPS83oHfsauIF3
 UB32gNp+ovXdDG6mkX2xeuI8274luFsej1PYvcSIKeIsfkCAgvJjQ3azkQdy4yCWD9yy
 4kCJ8kXTC8fpNunWdKgXuduRP5WS3kAX+rFv7/d5X7/UXcjtaaBHUmzpLVTZKp0Ot/Uj
 m7LudVz5DiOtnSZNul9kGXSodFFs7AbCop/W2YZFrHy6rc0dA+hSEwWUaywQdf3Dxrnk
 3tDiTkxgsaKTCTqYXXnBEjoic+9vsNFNa2JLqkb4eMG+JKx1ZVruZqVL5vCbqwXsbHsN 6g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3maj5w2e5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 23:42:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B7Ngpuf019061
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 7 Dec 2022 23:42:52 GMT
Received: from [10.38.242.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 7 Dec 2022
 15:42:46 -0800
Message-ID: <0a64f18b-7291-3946-cd0a-ee55d8e60dde@quicinc.com>
Date: Wed, 7 Dec 2022 15:42:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 03/11] drm/msm/dpu: Add SM8350 to hw catalog
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <konrad.dybcio@somainline.org>,
 <quic_kalyant@quicinc.com>, <angelogioacchino.delregno@somainline.org>,
 <loic.poulain@linaro.org>, <swboyd@chromium.org>,
 <quic_vpolimer@quicinc.com>, <vkoul@kernel.org>,
 <dianders@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, <vinod.koul@linaro.org>,
 <quic_jesszhan@quicinc.com>, <andersson@kernel.org>
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-4-robert.foss@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221205163754.221139-4-robert.foss@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: V0llzPHW1OtHwLlPs2x1iPnmeVeICOWE
X-Proofpoint-ORIG-GUID: V0llzPHW1OtHwLlPs2x1iPnmeVeICOWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_11,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212070200
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



On 12/5/2022 8:37 AM, Robert Foss wrote:
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
> index 4dac90ee5b8a..ba26af73be53 100644
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
> +			.reg_off = 0x2ac, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x2b4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> +			.reg_off = 0x2bc, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> +			.reg_off = 0x2c4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x2ac, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> +			.reg_off = 0x2b4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +			.reg_off = 0x2bc, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +			.reg_off = 0x2c4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> +			.reg_off = 0x2bc, .bit_off = 20},
> +	},
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
> @@ -1294,6 +1383,27 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
>   			-1),
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
> @@ -1345,6 +1455,12 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
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

I think this was copied over from sm8250, but this is not right.

sm8350 has only 2 DSC blocks not 3. So "dsc_2" is not there.

Thats a change from sm8250.

Please fix this.

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
> +	.base = 0x400,
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
> +	.max_bw_high = 15500000,
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
