Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C86F01E7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 09:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563C710E37C;
	Thu, 27 Apr 2023 07:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149D810E252;
 Wed, 26 Apr 2023 16:54:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QFu389006811; Wed, 26 Apr 2023 16:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rUQTi5RM8MLQyyGY521FApywhipNXGZilh/H4JvF3ZQ=;
 b=Zy3h14N0ZAFN04+jMFiYuQHNC69bX5LCgT4VLON2dACbjiPL80TEa2NdqAlAhEvrC6rL
 +/JaFMNgo79xZOhi3IpYt1T557kEjssIfTrIBDgsKzFc4NNIGdxKjc4Un2Tnqzj9s7mW
 eoxpHb4pY20jI/L46uQozd3J3fCjnx2bZsWfyoXhydoTz8lWOR47mdn4JdJMCBaC8TO3
 cBJHWGAgOfrFjAigKTaUVIcWRyaFT5tRq/SVOWieopgzDhdwedAC8wYl50i4P9IHvSbB
 Ou+M2kqOS+wnTVJwAooj25Ierc+aIeRsyRcJ8BvYzjNtfdq7w4AAU0FeR8bXNB9LebYv iw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q75jyge3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 16:54:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33QGrx5x000893
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 16:53:59 GMT
Received: from [10.110.11.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 26 Apr
 2023 09:53:58 -0700
Message-ID: <118a19de-ebe0-7325-72f3-42e612bb0089@quicinc.com>
Date: Wed, 26 Apr 2023 09:53:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: drop SSPP's SRC subblock
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20230422000839.1921358-1-dmitry.baryshkov@linaro.org>
 <20230422000839.1921358-2-dmitry.baryshkov@linaro.org>
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230422000839.1921358-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HklEAqVasvH8-ckm7gv9IOeeIHMfe9mD
X-Proofpoint-ORIG-GUID: HklEAqVasvH8-ckm7gv9IOeeIHMfe9mD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_08,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=700 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260149
X-Mailman-Approved-At: Thu, 27 Apr 2023 07:38:49 +0000
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn
 Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/21/2023 5:08 PM, Dmitry Baryshkov wrote:
> The src_blk declares a lame copy of main SSPP register space. It's
> offset is always 0. It's length has been fixed to 0x150, while SSPP's
> length is now correct. Drop the src_blk and access SSPP registers
> without additional subblock lookup.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   8 --
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  10 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 114 ++++++++----------
>   3 files changed, 48 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 03f162af1a50..24bf1ae75dbf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -252,8 +252,6 @@ static const uint32_t wb2_formats[] = {
>   	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
>   	.maxupscale = MAX_UPSCALE_RATIO, \
>   	.smart_dma_priority = sdma_pri, \
> -	.src_blk = {.name = STRCAT("sspp_src_", num), \
> -		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
If you are removing the sub block for the source registers and planning 
to use the SSPP's base address, you might as well remove the macro 
DPU_SSPP_SRC and its usage in setup_layer_ops etc. It doesnt make sense 
to check explicity.


Jeykumar S.
>   	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
>   		.id = qseed_ver, \
>   		.base = 0xa00, .len = 0xa0,}, \
> @@ -272,8 +270,6 @@ static const uint32_t wb2_formats[] = {
>   	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
>   	.maxupscale = MAX_UPSCALE_RATIO, \
>   	.smart_dma_priority = sdma_pri, \
> -	.src_blk = {.name = STRCAT("sspp_src_", num), \
> -		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
>   	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
>   		.id = qseed_ver, \
>   		.base = 0xa00, .len = 0xa0,}, \
> @@ -292,8 +288,6 @@ static const uint32_t wb2_formats[] = {
>   	.maxdwnscale = SSPP_UNITY_SCALE, \
>   	.maxupscale = SSPP_UNITY_SCALE, \
>   	.smart_dma_priority = sdma_pri, \
> -	.src_blk = {.name = STRCAT("sspp_src_", num), \
> -		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
>   	.format_list = plane_formats, \
>   	.num_formats = ARRAY_SIZE(plane_formats), \
>   	.virt_format_list = plane_formats, \
> @@ -375,8 +369,6 @@ static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>   	.maxdwnscale = SSPP_UNITY_SCALE, \
>   	.maxupscale = SSPP_UNITY_SCALE, \
>   	.smart_dma_priority = sdma_pri, \
> -	.src_blk = {.name = STRCAT("sspp_src_", num), \
> -		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
>   	.format_list = plane_formats_yuv, \
>   	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
>   	.virt_format_list = plane_formats, \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71584cd56fd7..3c7585c91bc0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -278,14 +278,6 @@ enum {
>   	u32 base; \
>   	u32 len
>   
> -/**
> - * struct dpu_src_blk: SSPP part of the source pipes
> - * @info:   HW register and features supported by this sub-blk
> - */
> -struct dpu_src_blk {
> -	DPU_HW_SUBBLK_INFO;
> -};
> -
>   /**
>    * struct dpu_scaler_blk: Scaler information
>    * @info:   HW register and features supported by this sub-blk
> @@ -392,7 +384,6 @@ struct dpu_caps {
>    * @smart_dma_priority: hw priority of rect1 of multirect pipe
>    * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
>    * @qseed_ver: qseed version
> - * @src_blk:
>    * @scaler_blk:
>    * @csc_blk:
>    * @hsic:
> @@ -413,7 +404,6 @@ struct dpu_sspp_sub_blks {
>   	u32 smart_dma_priority;
>   	u32 max_per_pipe_bw;
>   	u32 qseed_ver;
> -	struct dpu_src_blk src_blk;
>   	struct dpu_scaler_blk scaler_blk;
>   	struct dpu_pp_blk csc_blk;
>   	struct dpu_pp_blk hsic_blk;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index cf70a9bd1034..fce135f010d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -149,9 +149,6 @@ static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
>   	sblk = ctx->cap->sblk;
>   
>   	switch (s_id) {
> -	case DPU_SSPP_SRC:
> -		*idx = sblk->src_blk.base;
> -		break;
>   	case DPU_SSPP_SCALER_QSEED2:
>   	case DPU_SSPP_SCALER_QSEED3:
>   	case DPU_SSPP_SCALER_RGB:
> @@ -172,9 +169,8 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>   {
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
>   	u32 mode_mask;
> -	u32 idx;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>   		return;
>   
>   	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> @@ -185,7 +181,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>   		 */
>   		mode_mask = 0;
>   	} else {
> -		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx);
> +		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE);
>   		mode_mask |= pipe->multirect_index;
>   		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
>   			mode_mask |= BIT(2);
> @@ -193,7 +189,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>   			mode_mask &= ~BIT(2);
>   	}
>   
> -	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx, mode_mask);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE, mode_mask);
>   }
>   
>   static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
> @@ -247,9 +243,8 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>   	u32 opmode = 0;
>   	u32 fast_clear = 0;
>   	u32 op_mode_off, unpack_pat_off, format_off;
> -	u32 idx;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx) || !fmt)
> +	if (!ctx || !fmt)
>   		return;
>   
>   	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> @@ -264,7 +259,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>   	}
>   
>   	c = &ctx->hw;
> -	opmode = DPU_REG_READ(c, op_mode_off + idx);
> +	opmode = DPU_REG_READ(c, op_mode_off);
>   	opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
>   			MDSS_MDP_OP_BWC_EN | MDSS_MDP_OP_PE_OVERRIDE);
>   
> @@ -352,12 +347,12 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>   			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
>   			DPU_FORMAT_IS_YUV(fmt));
>   
> -	DPU_REG_WRITE(c, format_off + idx, src_format);
> -	DPU_REG_WRITE(c, unpack_pat_off + idx, unpack);
> -	DPU_REG_WRITE(c, op_mode_off + idx, opmode);
> +	DPU_REG_WRITE(c, format_off, src_format);
> +	DPU_REG_WRITE(c, unpack_pat_off, unpack);
> +	DPU_REG_WRITE(c, op_mode_off, opmode);
>   
>   	/* clear previous UBWC error */
> -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS + idx, BIT(31));
> +	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
>   }
>   
>   static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> @@ -368,9 +363,8 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>   	u32 lr_pe[4], tb_pe[4], tot_req_pixels[4];
>   	const u32 bytemask = 0xff;
>   	const u32 shortmask = 0xffff;
> -	u32 idx;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx) || !pe_ext)
> +	if (!ctx || !pe_ext)
>   		return;
>   
>   	c = &ctx->hw;
> @@ -400,21 +394,21 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>   	}
>   
>   	/* color 0 */
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_LR + idx, lr_pe[0]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_TB + idx, tb_pe[0]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_REQ_PIXELS + idx,
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_LR, lr_pe[0]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_TB, tb_pe[0]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C0_REQ_PIXELS,
>   			tot_req_pixels[0]);
>   
>   	/* color 1 and color 2 */
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_LR + idx, lr_pe[1]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_TB + idx, tb_pe[1]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_REQ_PIXELS + idx,
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_LR, lr_pe[1]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_TB, tb_pe[1]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C1C2_REQ_PIXELS,
>   			tot_req_pixels[1]);
>   
>   	/* color 3 */
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_LR + idx, lr_pe[3]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_TB + idx, lr_pe[3]);
> -	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_REQ_PIXELS + idx,
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_LR, lr_pe[3]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_TB, lr_pe[3]);
> +	DPU_REG_WRITE(c, SSPP_SW_PIX_EXT_C3_REQ_PIXELS,
>   			tot_req_pixels[3]);
>   }
>   
> @@ -453,9 +447,8 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>   	struct dpu_hw_blk_reg_map *c;
>   	u32 src_size, src_xy, dst_size, dst_xy;
>   	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
> -	u32 idx;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx) || !cfg)
> +	if (!ctx || !cfg)
>   		return;
>   
>   	c = &ctx->hw;
> @@ -483,10 +476,10 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>   		drm_rect_width(&cfg->dst_rect);
>   
>   	/* rectangle register programming */
> -	DPU_REG_WRITE(c, src_size_off + idx, src_size);
> -	DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
> -	DPU_REG_WRITE(c, out_size_off + idx, dst_size);
> -	DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
> +	DPU_REG_WRITE(c, src_size_off, src_size);
> +	DPU_REG_WRITE(c, src_xy_off, src_xy);
> +	DPU_REG_WRITE(c, out_size_off, dst_size);
> +	DPU_REG_WRITE(c, out_xy_off, dst_xy);
>   }
>   
>   static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> @@ -495,24 +488,23 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
>   	u32 ystride0, ystride1;
>   	int i;
> -	u32 idx;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>   		return;
>   
>   	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>   		for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
> -			DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx + i * 0x4,
> +			DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + i * 0x4,
>   					layout->plane_addr[i]);
>   	} else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR,
>   				layout->plane_addr[0]);
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR,
>   				layout->plane_addr[2]);
>   	} else {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR,
>   				layout->plane_addr[0]);
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR,
>   				layout->plane_addr[2]);
>   	}
>   
> @@ -522,8 +514,8 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   		ystride1 = (layout->plane_pitch[2]) |
>   			(layout->plane_pitch[3] << 16);
>   	} else {
> -		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
> -		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
> +		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0);
> +		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1);
>   
>   		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>   			ystride0 = (ystride0 & 0xFFFF0000) |
> @@ -540,8 +532,8 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   		}
>   	}
>   
> -	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> -	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0, ystride0);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1, ystride1);
>   }
>   
>   static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> @@ -565,9 +557,8 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
>   {
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
>   	struct dpu_hw_fmt_layout cfg;
> -	u32 idx;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>   		return;
>   
>   	/* cleanup source addresses */
> @@ -576,9 +567,9 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
>   
>   	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
>   	    pipe->multirect_index == DPU_SSPP_RECT_0)
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR, color);
>   	else
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1 + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1,
>   				color);
>   }
>   
> @@ -586,39 +577,34 @@ static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_sspp *ctx,
>   			u32 danger_lut,
>   			u32 safe_lut)
>   {
> -	u32 idx;
> -
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>   		return;
>   
> -	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT + idx, danger_lut);
> -	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, safe_lut);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_DANGER_LUT, danger_lut);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT, safe_lut);
>   }
>   
>   static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
>   			u64 creq_lut)
>   {
> -	u32 idx;
> -
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>   		return;
>   
>   	if (ctx->cap && test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features)) {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0 + idx, creq_lut);
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_1 + idx,
> +		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_0, creq_lut);
> +		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT_1,
>   				creq_lut >> 32);
>   	} else {
> -		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT + idx, creq_lut);
> +		DPU_REG_WRITE(&ctx->hw, SSPP_CREQ_LUT, creq_lut);
>   	}
>   }
>   
>   static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>   		struct dpu_hw_pipe_qos_cfg *cfg)
>   {
> -	u32 idx;
>   	u32 qos_ctrl = 0;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> +	if (!ctx)
>   		return;
>   
>   	if (cfg->vblank_en) {
> @@ -634,23 +620,19 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>   	if (cfg->danger_safe_en)
>   		qos_ctrl |= SSPP_QOS_CTRL_DANGER_SAFE_EN;
>   
> -	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL + idx, qos_ctrl);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL, qos_ctrl);
>   }
>   
>   static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
>   		struct dpu_hw_cdp_cfg *cfg)
>   {
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
> -	u32 idx;
>   	u32 cdp_cntl = 0;
>   	u32 cdp_cntl_offset = 0;
>   
>   	if (!ctx || !cfg)
>   		return;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
> -		return;
> -
>   	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
>   	    pipe->multirect_index == DPU_SSPP_RECT_0)
>   		cdp_cntl_offset = SSPP_CDP_CNTL;
> @@ -728,8 +710,8 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>   	/* add register dump support */
>   	dpu_debugfs_create_regset32("src_blk", 0400,
>   			debugfs_root,
> -			sblk->src_blk.base + cfg->base,
> -			sblk->src_blk.len,
> +			cfg->base,
> +			cfg->len,
>   			kms);
>   
>   	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
