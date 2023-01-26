Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CEC67D8E2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 23:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E8210E3D3;
	Thu, 26 Jan 2023 22:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A2C10E3D3;
 Thu, 26 Jan 2023 22:55:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30QLxpMD025809; Thu, 26 Jan 2023 22:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=aPIT2gsM50RFbKoT2CdBg87JC5Jou7d+blO8EGa8aRc=;
 b=iDVSZpx+uRigLOuRhLXRcGnjfBnEP5uYO5rJy5vq8JYxVwR7YwRY+ACL05uiMlKIsQ03
 /EG/VEQbyaGXQ3qqSs9Rx9Ci51FZJHRD+4i7Sc9EAh+ulRsoEZeWMD1VeB2tzByQNN1K
 YGSyqV2+uCbS6WVrpE5j/3n+ms+t3s48qOHrgUYjAQd3HmUoWNQhtxCQZjN9zEHihZ94
 1hQ62gRLv+WUMwOCBfmjurQGA+a/I+c0ChUvQEG0D87lrXgwvEOzkp+7cRcvhVAjMxdt
 RE9oBqGIuk8UfKhwl/YKhK/8S18q+z7lbB/8EmSRWB2BXm9jIpVlMkTdU7vJY3nQm9W+ Gg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nb6jcb4ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 22:55:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30QMtQd4002418
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 22:55:26 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 14:55:25 -0800
Message-ID: <5d8350e9-cb95-adc3-f93a-5b7791fe2654@quicinc.com>
Date: Thu, 26 Jan 2023 14:55:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 02/27] drm/msm/dpu: rename struct dpu_hw_pipe to
 dpu_hw_sspp
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221229191856.3508092-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4k5k3viisnDIgioavcO2-rgcDjN82-9o
X-Proofpoint-GUID: 4k5k3viisnDIgioavcO2-rgcDjN82-9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260214
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> For all hardware blocks except SSPP the corresponding struct is named
> after the block. Rename dpu_hw_pipe (SSPP structure) to dpu_hw_sspp.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Idea seems okay but then we should also rename dpu_hw_pipe_cfg to 
dpu_hw_sspp_cfg.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 42 ++++++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 42 ++++++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  2 +-
>   3 files changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 691c471b08c2..93f01f767fd8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -136,7 +136,7 @@
>   #define TS_CLK			19200000
>   
>   
> -static int _sspp_subblk_offset(struct dpu_hw_pipe *ctx,
> +static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
>   		int s_id,
>   		u32 *idx)
>   {
> @@ -168,7 +168,7 @@ static int _sspp_subblk_offset(struct dpu_hw_pipe *ctx,
>   	return rc;
>   }
>   
> -static void dpu_hw_sspp_setup_multirect(struct dpu_hw_pipe *ctx,
> +static void dpu_hw_sspp_setup_multirect(struct dpu_hw_sspp *ctx,
>   		enum dpu_sspp_multirect_index index,
>   		enum dpu_sspp_multirect_mode mode)
>   {
> @@ -197,7 +197,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_hw_pipe *ctx,
>   	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx, mode_mask);
>   }
>   
> -static void _sspp_setup_opmode(struct dpu_hw_pipe *ctx,
> +static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
>   		u32 mask, u8 en)
>   {
>   	u32 idx;
> @@ -218,7 +218,7 @@ static void _sspp_setup_opmode(struct dpu_hw_pipe *ctx,
>   	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_OP_MODE + idx, opmode);
>   }
>   
> -static void _sspp_setup_csc10_opmode(struct dpu_hw_pipe *ctx,
> +static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
>   		u32 mask, u8 en)
>   {
>   	u32 idx;
> @@ -239,7 +239,7 @@ static void _sspp_setup_csc10_opmode(struct dpu_hw_pipe *ctx,
>   /*
>    * Setup source pixel format, flip,
>    */
> -static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
> +static void dpu_hw_sspp_setup_format(struct dpu_hw_sspp *ctx,
>   		const struct dpu_format *fmt, u32 flags,
>   		enum dpu_sspp_multirect_index rect_mode)
>   {
> @@ -356,7 +356,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
>   	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS + idx, BIT(31));
>   }
>   
> -static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
> +static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>   		struct dpu_hw_pixel_ext *pe_ext)
>   {
>   	struct dpu_hw_blk_reg_map *c;
> @@ -414,7 +414,7 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
>   			tot_req_pixels[3]);
>   }
>   
> -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
> +static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
>   		struct dpu_hw_pipe_cfg *sspp,
>   		void *scaler_cfg)
>   {
> @@ -430,7 +430,7 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
>   			sspp->layout.format);
>   }
>   
> -static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
> +static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
>   {
>   	u32 idx;
>   
> @@ -443,7 +443,7 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
>   /*
>    * dpu_hw_sspp_setup_rects()
>    */
> -static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
> +static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
>   		struct dpu_hw_pipe_cfg *cfg,
>   		enum dpu_sspp_multirect_index rect_index)
>   {
> @@ -512,7 +512,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
>   	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>   }
>   
> -static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
> +static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_sspp *ctx,
>   		struct dpu_hw_pipe_cfg *cfg,
>   		enum dpu_sspp_multirect_index rect_mode)
>   {
> @@ -539,7 +539,7 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
>   	}
>   }
>   
> -static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
> +static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
>   		const struct dpu_csc_cfg *data)
>   {
>   	u32 idx;
> @@ -556,7 +556,7 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
>   	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
>   }
>   
> -static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_pipe *ctx, u32 color, enum
> +static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_sspp *ctx, u32 color, enum
>   		dpu_sspp_multirect_index rect_index)
>   {
>   	u32 idx;
> @@ -571,7 +571,7 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_pipe *ctx, u32 color, enum
>   				color);
>   }
>   
> -static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
> +static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_sspp *ctx,
>   			u32 danger_lut,
>   			u32 safe_lut)
>   {
> @@ -584,7 +584,7 @@ static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
>   	DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, safe_lut);
>   }
>   
> -static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
> +static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
>   			u64 creq_lut)
>   {
>   	u32 idx;
> @@ -601,7 +601,7 @@ static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
>   	}
>   }
>   
> -static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
> +static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>   		struct dpu_hw_pipe_qos_cfg *cfg)
>   {
>   	u32 idx;
> @@ -626,7 +626,7 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
>   	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL + idx, qos_ctrl);
>   }
>   
> -static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
> +static void dpu_hw_sspp_setup_cdp(struct dpu_hw_sspp *ctx,
>   		struct dpu_hw_cdp_cfg *cfg,
>   		enum dpu_sspp_multirect_index index)
>   {
> @@ -657,7 +657,7 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
>   	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
>   }
>   
> -static void _setup_layer_ops(struct dpu_hw_pipe *c,
> +static void _setup_layer_ops(struct dpu_hw_sspp *c,
>   		unsigned long features)
>   {
>   	if (test_bit(DPU_SSPP_SRC, &features)) {
> @@ -695,7 +695,7 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
>   }
>   
>   #ifdef CONFIG_DEBUG_FS
> -int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry)
> +int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms, struct dentry *entry)
>   {
>   	const struct dpu_sspp_cfg *cfg = hw_pipe->cap;
>   	const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
> @@ -779,10 +779,10 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
>   	return ERR_PTR(-ENOMEM);
>   }
>   
> -struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
> +struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
>   		void __iomem *addr, const struct dpu_mdss_cfg *catalog)
>   {
> -	struct dpu_hw_pipe *hw_pipe;
> +	struct dpu_hw_sspp *hw_pipe;
>   	const struct dpu_sspp_cfg *cfg;
>   
>   	if (!addr || !catalog)
> @@ -808,7 +808,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
>   	return hw_pipe;
>   }
>   
> -void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx)
> +void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx)
>   {
>   	kfree(ctx);
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 0c95b7e64f6c..651621b9794f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -10,7 +10,7 @@
>   #include "dpu_hw_util.h"
>   #include "dpu_formats.h"
>   
> -struct dpu_hw_pipe;
> +struct dpu_hw_sspp;
>   
>   /**
>    * Flags
> @@ -214,7 +214,7 @@ struct dpu_hw_sspp_ops {
>   	 * @flags: Extra flags for format config
>   	 * @index: rectangle index in multirect
>   	 */
> -	void (*setup_format)(struct dpu_hw_pipe *ctx,
> +	void (*setup_format)(struct dpu_hw_sspp *ctx,
>   			const struct dpu_format *fmt, u32 flags,
>   			enum dpu_sspp_multirect_index index);
>   
> @@ -224,7 +224,7 @@ struct dpu_hw_sspp_ops {
>   	 * @cfg: Pointer to pipe config structure
>   	 * @index: rectangle index in multirect
>   	 */
> -	void (*setup_rects)(struct dpu_hw_pipe *ctx,
> +	void (*setup_rects)(struct dpu_hw_sspp *ctx,
>   			struct dpu_hw_pipe_cfg *cfg,
>   			enum dpu_sspp_multirect_index index);
>   
> @@ -233,7 +233,7 @@ struct dpu_hw_sspp_ops {
>   	 * @ctx: Pointer to pipe context
>   	 * @pe_ext: Pointer to pixel ext settings
>   	 */
> -	void (*setup_pe)(struct dpu_hw_pipe *ctx,
> +	void (*setup_pe)(struct dpu_hw_sspp *ctx,
>   			struct dpu_hw_pixel_ext *pe_ext);
>   
>   	/**
> @@ -242,7 +242,7 @@ struct dpu_hw_sspp_ops {
>   	 * @cfg: Pointer to pipe config structure
>   	 * @index: rectangle index in multirect
>   	 */
> -	void (*setup_sourceaddress)(struct dpu_hw_pipe *ctx,
> +	void (*setup_sourceaddress)(struct dpu_hw_sspp *ctx,
>   			struct dpu_hw_pipe_cfg *cfg,
>   			enum dpu_sspp_multirect_index index);
>   
> @@ -251,7 +251,7 @@ struct dpu_hw_sspp_ops {
>   	 * @ctx: Pointer to pipe context
>   	 * @data: Pointer to config structure
>   	 */
> -	void (*setup_csc)(struct dpu_hw_pipe *ctx, const struct dpu_csc_cfg *data);
> +	void (*setup_csc)(struct dpu_hw_sspp *ctx, const struct dpu_csc_cfg *data);
>   
>   	/**
>   	 * setup_solidfill - enable/disable colorfill
> @@ -260,7 +260,7 @@ struct dpu_hw_sspp_ops {
>   	 * @flags: Pipe flags
>   	 * @index: rectangle index in multirect
>   	 */
> -	void (*setup_solidfill)(struct dpu_hw_pipe *ctx, u32 color,
> +	void (*setup_solidfill)(struct dpu_hw_sspp *ctx, u32 color,
>   			enum dpu_sspp_multirect_index index);
>   
>   	/**
> @@ -270,7 +270,7 @@ struct dpu_hw_sspp_ops {
>   	 * @mode: parallel fetch / time multiplex multirect mode
>   	 */
>   
> -	void (*setup_multirect)(struct dpu_hw_pipe *ctx,
> +	void (*setup_multirect)(struct dpu_hw_sspp *ctx,
>   			enum dpu_sspp_multirect_index index,
>   			enum dpu_sspp_multirect_mode mode);
>   
> @@ -279,7 +279,7 @@ struct dpu_hw_sspp_ops {
>   	 * @ctx: Pointer to pipe context
>   	 * @cfg: Pointer to config structure
>   	 */
> -	void (*setup_sharpening)(struct dpu_hw_pipe *ctx,
> +	void (*setup_sharpening)(struct dpu_hw_sspp *ctx,
>   			struct dpu_hw_sharp_cfg *cfg);
>   
>   	/**
> @@ -289,7 +289,7 @@ struct dpu_hw_sspp_ops {
>   	 * @safe_lut: LUT for generate safe level based on fill level
>   	 *
>   	 */
> -	void (*setup_danger_safe_lut)(struct dpu_hw_pipe *ctx,
> +	void (*setup_danger_safe_lut)(struct dpu_hw_sspp *ctx,
>   			u32 danger_lut,
>   			u32 safe_lut);
>   
> @@ -299,7 +299,7 @@ struct dpu_hw_sspp_ops {
>   	 * @creq_lut: LUT for generate creq level based on fill level
>   	 *
>   	 */
> -	void (*setup_creq_lut)(struct dpu_hw_pipe *ctx,
> +	void (*setup_creq_lut)(struct dpu_hw_sspp *ctx,
>   			u64 creq_lut);
>   
>   	/**
> @@ -308,7 +308,7 @@ struct dpu_hw_sspp_ops {
>   	 * @cfg: Pointer to pipe QoS configuration
>   	 *
>   	 */
> -	void (*setup_qos_ctrl)(struct dpu_hw_pipe *ctx,
> +	void (*setup_qos_ctrl)(struct dpu_hw_sspp *ctx,
>   			struct dpu_hw_pipe_qos_cfg *cfg);
>   
>   	/**
> @@ -316,7 +316,7 @@ struct dpu_hw_sspp_ops {
>   	 * @ctx: Pointer to pipe context
>   	 * @cfg: Pointer to histogram configuration
>   	 */
> -	void (*setup_histogram)(struct dpu_hw_pipe *ctx,
> +	void (*setup_histogram)(struct dpu_hw_sspp *ctx,
>   			void *cfg);
>   
>   	/**
> @@ -325,7 +325,7 @@ struct dpu_hw_sspp_ops {
>   	 * @pipe_cfg: Pointer to pipe configuration
>   	 * @scaler_cfg: Pointer to scaler configuration
>   	 */
> -	void (*setup_scaler)(struct dpu_hw_pipe *ctx,
> +	void (*setup_scaler)(struct dpu_hw_sspp *ctx,
>   		struct dpu_hw_pipe_cfg *pipe_cfg,
>   		void *scaler_cfg);
>   
> @@ -333,7 +333,7 @@ struct dpu_hw_sspp_ops {
>   	 * get_scaler_ver - get scaler h/w version
>   	 * @ctx: Pointer to pipe context
>   	 */
> -	u32 (*get_scaler_ver)(struct dpu_hw_pipe *ctx);
> +	u32 (*get_scaler_ver)(struct dpu_hw_sspp *ctx);
>   
>   	/**
>   	 * setup_cdp - setup client driven prefetch
> @@ -341,13 +341,13 @@ struct dpu_hw_sspp_ops {
>   	 * @cfg: Pointer to cdp configuration
>   	 * @index: rectangle index in multirect
>   	 */
> -	void (*setup_cdp)(struct dpu_hw_pipe *ctx,
> +	void (*setup_cdp)(struct dpu_hw_sspp *ctx,
>   			struct dpu_hw_cdp_cfg *cfg,
>   			enum dpu_sspp_multirect_index index);
>   };
>   
>   /**
> - * struct dpu_hw_pipe - pipe description
> + * struct dpu_hw_sspp - pipe description
>    * @base: hardware block base structure
>    * @hw: block hardware details
>    * @catalog: back pointer to catalog
> @@ -356,7 +356,7 @@ struct dpu_hw_sspp_ops {
>    * @cap: pointer to layer_cfg
>    * @ops: pointer to operations possible for this pipe
>    */
> -struct dpu_hw_pipe {
> +struct dpu_hw_sspp {
>   	struct dpu_hw_blk base;
>   	struct dpu_hw_blk_reg_map hw;
>   	const struct dpu_mdss_cfg *catalog;
> @@ -378,7 +378,7 @@ struct dpu_kms;
>    * @addr: Mapped register io address of MDP
>    * @catalog : Pointer to mdss catalog data
>    */
> -struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
> +struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
>   		void __iomem *addr, const struct dpu_mdss_cfg *catalog);
>   
>   /**
> @@ -386,10 +386,10 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
>    * should be called during Hw pipe cleanup.
>    * @ctx:  Pointer to SSPP driver context returned by dpu_hw_sspp_init
>    */
> -void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
> +void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx);
>   
>   void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);
> -int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry);
> +int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms, struct dentry *entry);
>   
>   #endif /*_DPU_HW_SSPP_H */
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index bfd5be89e8b8..e1cdd71716f0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -104,7 +104,7 @@ struct dpu_plane {
>   
>   	enum dpu_sspp pipe;
>   
> -	struct dpu_hw_pipe *pipe_hw;
> +	struct dpu_hw_sspp *pipe_hw;
>   	uint32_t color_fill;
>   	bool is_error;
>   	bool is_rt_pipe;
