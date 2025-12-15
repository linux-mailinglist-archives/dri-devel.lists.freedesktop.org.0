Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6F9CBFABC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 21:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECDF10E273;
	Mon, 15 Dec 2025 20:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFLcJktV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQruqzlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FD310E265
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 20:08:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFE3pEL4174124
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 20:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wLpY6r+77aTfEEKFwAtfiX1M
 lApcWe4XaD8rl58R34Y=; b=lFLcJktVpIE9M1bvN/uGIEyXbof44pTiNuD/qsr8
 LlFgn1DMu2kbXnhAMDzp7Bjthlbu9t1RXUATJXEr5wk8qyPZCMF4UsJ2s2udqrga
 k00VpcNuGu4uqKsw0Wca3so4JyQ4L0dya/Yunb+rHRMe5mA7k3+e1EbUPneG7cUP
 v7omoS0ndeSNKvPD3u9FQKA/lvKRW3TCu5Ro/h7iPgxCzW+q7pRqanjDXWXlyeCe
 r7qfhtd/JLteNgsyxDv9xTakYir1dOGciiBI+ciaBbNFcmgiYg/8x5D71iRH7CkO
 8IuyHBNS9ZgyFGEnEdqmp+g+/byah6vfTtX647+foHHOIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ks013n1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 20:08:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed6855557aso78758281cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 12:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765829306; x=1766434106;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wLpY6r+77aTfEEKFwAtfiX1MlApcWe4XaD8rl58R34Y=;
 b=BQruqzlC2cB1EzM0YMkboX1G4I4fhGiPLo/nJy+tWnbekDISg+oDi4wZxGIGaHsnt3
 1etmKhJI8pEpWKDQPuWuhKkepi4Bhw+0pLWrfanAM9FlQ95QclkvNJNhK6qs/wf/aJVw
 ybGhoHVlw10B3Se5HLjnIeXgaxTYQYvVcEy0l7i1yfEtCaAcIQb0rCV7i+2bsBScuPrR
 l+cnSwPT7F7hJQt0e++kvvwGRrfwD3IBKX5owU4WkVEPOK9u6CJT5DNF8rGIbXf5cyAt
 fz3KeUzZ1lpiNXWPlbmXuEjJNIy0DZ1iw/J0u2vOJ1K6jbRw4poPBp9av8d7bWOoKtjW
 PqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765829306; x=1766434106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wLpY6r+77aTfEEKFwAtfiX1MlApcWe4XaD8rl58R34Y=;
 b=CVhW6jJmmVlvDSI6tXhM67jpnVSG5F2ndKZnd8Cx7NAeRnFaclMfnl0udNzdRPYQX8
 oo9IovkXAu4pco8juSF9OmG9lbu3xyszFDn9jN1DTKU5Vu7kM+9REV7CS7+tu8CRprFx
 shHI8JNCQv6itW1yQXZbFZMA0B+Z8g8ZhejGyTV4oArnTi4xvMhnTmUb3UsOLCg0LqWJ
 34SfwiSNzgDqWc9ZKLg3vlYuQXV+x7/uJYaH/bJACtn4c9YjyFn1gtTFXoiR9wz5EJso
 ZfZVkTQtS4qEf1aq8ledofcuDmcmyn7YiveSmTkQkVyTNAdh+cB/5Cy+sff1+ou22gg+
 ekGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWj5+MyojhIOS2eNCAprZHIi0q9tqhC0xA4tENtO7LtVvNNoY2Kd5oFJSlHtFsP9//xoWke23VHx4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpIYIX1OX0U16yyAfU1hr4Qv+wLkqzioykVY3rso5qi0yIJG4g
 zaql6rJDDIf2eEAaIG3LnZL7EBjyQNdhNe/cwB2dLc1i6YchZeOzTeI7aXbDUQJaXRvjdkKx0eI
 0vj/GtiYWDLpxxhpZShp3OT2/QBznPGZafgsJx9vRW5WDoAo6/64TbsAjM14PoOoP1zRFKNs=
X-Gm-Gg: AY/fxX7j3tu7oP1lsBzLSqBXScvq9qMq/1HMEklpgmKlMMSBM7T0Zo5kRCEb5QwP+Q2
 DyvtEsb0yxICvnNR99k/sTDaxHUoQa8E3nkyBbzBcGpqqMM1MkFQ2MYveVRW5IvJIn5068j6p0W
 OJBtWOgKcDJJcimU3u1lh1/pvJAaQtqD6W/rsezmpSxbEPdkV00zFq+0RhXKwAv6YSFn7/jQL6E
 xpITCSuTx3WVUrknPZTSku9a6FhluHwfuGSgDr5e17HomSc8dKucbqnSVtX6I5ii4tjmCfcAp5/
 95B9LD+aq1Fk+YrSmCXc8I0P0P+Fz0C3bc71qzxl62wD9aUwudAGxfYm4rfGMeS37U0ELcU/LxD
 RgAmipcz5pbU0SdKIfMAy6QyGAaoP43YPyI0KpDEOzF1n0SuwU9T8aUeWKhjDvlhhB+XBNC4QNC
 iyXIvp99r3R7KxyZkMYDitbzk=
X-Received: by 2002:a05:622a:1912:b0:4e8:916f:9716 with SMTP id
 d75a77b69052e-4f1bfe64d2dmr241799451cf.36.1765829305920; 
 Mon, 15 Dec 2025 12:08:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLWwZ9cz7Lj46fGCEyopKb/cQPg81WGyMRBT2K2brlKyQeeyzNF3rvYNBZ3xEpinp5Vh9jYA==
X-Received: by 2002:a05:622a:1912:b0:4e8:916f:9716 with SMTP id
 d75a77b69052e-4f1bfe64d2dmr241798591cf.36.1765829305155; 
 Mon, 15 Dec 2025 12:08:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da5dcdcsm97008e87.73.2025.12.15.12.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 12:08:24 -0800 (PST)
Date: Mon, 15 Dec 2025 22:08:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 10/11] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-11-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215083854.577-11-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: I4WP9KwiMqpcLwrqPOmUvCVAlDbsphaq
X-Authority-Analysis: v=2.4 cv=eZcwvrEH c=1 sm=1 tr=0 ts=69406abb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tuPIilvrXhUzXokbONcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: I4WP9KwiMqpcLwrqPOmUvCVAlDbsphaq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MyBTYWx0ZWRfXw/4iyDBWtMQP
 UQhCSivwUKYQqX/AmA6pdb8/43JmBy9/u1fBZExt8dd0U6mBhq9YU8NzajVhOGZezMzyVbtED5B
 1eOvdU9JoWhY2zUQ6BS7iJoE/Ww1yk3Q+pywFZehTrbh1E5P0TZ9R++n2mrxgBfnLq3AQU63fmh
 jSMVYeUoAgBUtzpVISsCMZ/bb1gZFBtjM6mkiHADW68rio2CKH+YvMNOc2NoW3B1eYOJr/IDeJj
 IedtWHJHJF4qr1bCL/H65Kyg+Z9GX+uIqoweujacx6TY+/qm6lsTn0h6OEMIEVRNuniJWvk1zbk
 u8HWW66MLLA439q1m/cJuTuuI8FKqeFOuH+J18Bd7/O+L73P83rv7uE8MD+TTs2wiyO3DcZIcfD
 KNOV9nsGUxsf5IB4H0icblGagn1Tkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150173
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

On Mon, Dec 15, 2025 at 04:38:53PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> DPU version 13.0.0 introduces structural changes including
> register additions, removals, and relocations.
> 
> Refactor SSPP-related code to be compatible with DPU 13.0.0
> modifications.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

We've fixed the order of the interrupts patch. Now you are adding SSPP
customization for 13.x _after_ adding the first 13.x support. Is that
supposed to work?

>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 155 ++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
>  6 files changed, 191 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 0eb7cdf82ff9..f2aba9bdfcd3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -208,6 +208,18 @@ struct dpu_dsc_blk {
>  	u32 len;
>  };
>  
> +/**
> + * struct dpu_sspp_v13_rec_blk - SSPP REC sub-blk information
> + * @name: string name for debug purposes
> + * @base: offset of this sub-block relative to the block offset
> + * @len: register block length of this sub-block
> + */
> +struct dpu_sspp_v13_rec_blk {
> +	char name[DPU_HW_BLK_NAME_LEN];
> +	u32 base;
> +	u32 len;
> +};
> +
>  /**
>   * enum dpu_qos_lut_usage - define QoS LUT use cases
>   */
> @@ -294,7 +306,8 @@ struct dpu_sspp_sub_blks {
>  	u32 qseed_ver;
>  	struct dpu_scaler_blk scaler_blk;
>  	struct dpu_pp_blk csc_blk;
> -
> +	struct dpu_sspp_v13_rec_blk sspp_rec0_blk;
> +	struct dpu_sspp_v13_rec_blk sspp_rec1_blk;

Empty line afterwards.

>  	const u32 *format_list;
>  	u32 num_formats;
>  	const struct dpu_rotation_cfg *rotation_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 6f1fc790ad6d..7ed28009c463 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -145,11 +145,18 @@
>  static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  {
>  	struct dpu_hw_sspp *ctx = pipe->sspp;
> -	u32 mode_mask;
>  
>  	if (!ctx)
>  		return;
>  
> +	dpu_hw_setup_multirect_impl(pipe, ctx, SSPP_MULTIRECT_OPMODE);
> +}
> +
> +void dpu_hw_setup_multirect_impl(struct dpu_sw_pipe *pipe,
> +				 struct dpu_hw_sspp *ctx, u32 op_mode_off)
> +{
> +	u32 mode_mask;
> +
>  	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>  		/**
>  		 * if rect index is RECT_SOLO, we cannot expect a
> @@ -158,7 +165,7 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  		 */
>  		mode_mask = 0;
>  	} else {
> -		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE);
> +		mode_mask = DPU_REG_READ(&ctx->hw, op_mode_off);
>  		mode_mask |= pipe->multirect_index;
>  		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
>  			mode_mask |= BIT(2);
> @@ -166,11 +173,11 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  			mode_mask &= ~BIT(2);
>  	}
>  
> -	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE, mode_mask);
> +	DPU_REG_WRITE(&ctx->hw, op_mode_off, mode_mask);
>  }
>  
> -static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
> -		u32 mask, u8 en)
> +void dpu_hw_sspp_setup_opmode(struct dpu_hw_sspp *ctx,
> +			      u32 mask, u8 en)
>  {
>  	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
>  	u32 opmode;
> @@ -189,8 +196,8 @@ static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
>  	DPU_REG_WRITE(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE, opmode);
>  }
>  
> -static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
> -		u32 mask, u8 en)
> +void dpu_hw_sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
> +				    u32 mask, u8 en)
>  {
>  	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
>  	u32 opmode;
> @@ -211,10 +218,6 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  		const struct msm_format *fmt, u32 flags)
>  {
>  	struct dpu_hw_sspp *ctx = pipe->sspp;
> -	struct dpu_hw_blk_reg_map *c;
> -	u32 chroma_samp, unpack, src_format;
> -	u32 opmode = 0;
> -	u32 fast_clear = 0;
>  	u32 op_mode_off, unpack_pat_off, format_off;
>  
>  	if (!ctx || !fmt)
> @@ -231,7 +234,25 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  		format_off = SSPP_SRC_FORMAT_REC1;
>  	}
>  
> +	dpu_hw_setup_format_impl(pipe, fmt, flags, ctx, op_mode_off,
> +				 unpack_pat_off, format_off,
> +				 SSPP_UBWC_STATIC_CTRL, SSPP_UBWC_ERROR_STATUS);
> +}
> +
> +void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
> +			      u32 flags, struct dpu_hw_sspp *ctx, u32 op_mode_off,
> +			      u32 unpack_pat_off, u32 format_off, u32 ubwc_ctrl_off,
> +			      u32 ubwc_err_off)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +	u32 chroma_samp, unpack, src_format;
> +	u32 opmode;
> +	u32 fast_clear;
> +	u8 core_major_ver;
> +
>  	c = &ctx->hw;
> +	core_major_ver = ctx->mdss_ver->core_major_ver;
> +
>  	opmode = DPU_REG_READ(c, op_mode_off);
>  	opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
>  			MDSS_MDP_OP_BWC_EN | MDSS_MDP_OP_PE_OVERRIDE);
> @@ -273,31 +294,34 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  		if (MSM_FORMAT_IS_UBWC(fmt))
>  			opmode |= MDSS_MDP_OP_BWC_EN;
>  		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
> -		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> -			DPU_FETCH_CONFIG_RESET_VALUE |
> -			ctx->ubwc->highest_bank_bit << 18);
> +
> +		if (core_major_ver < 13)
> +			DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> +				      DPU_FETCH_CONFIG_RESET_VALUE |
> +				      ctx->ubwc->highest_bank_bit << 18);
> +

This is not refactoring. Drop the conditions.

>  		switch (ctx->ubwc->ubwc_enc_version) {
>  		case UBWC_1_0:
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> -					BIT(8) |
> -					(ctx->ubwc->highest_bank_bit << 4));
> +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> +				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> +				      BIT(8) |
> +				     (ctx->ubwc->highest_bank_bit << 4));

I have asked to drop unrelated changes. You didn't. Why? You are
changing whitespaces for no reason. It's just a noise which hides the
actual change here.

>  			break;
>  		case UBWC_2_0:
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> -					(ctx->ubwc->highest_bank_bit << 4));
> +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> +				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
> +				     (ctx->ubwc->highest_bank_bit << 4));
>  			break;
>  		case UBWC_3_0:
> -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> -					(ctx->ubwc->highest_bank_bit << 4));
> +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> +				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> +				     (ctx->ubwc->highest_bank_bit << 4));
>  			break;
>  		case UBWC_4_0:
> -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> +				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
>  			break;
>  		}
>  	}
> @@ -313,19 +337,18 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  
>  	/* update scaler opmode, if appropriate */
>  	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
> -		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> -			MSM_FORMAT_IS_YUV(fmt));
> +		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> +					 MSM_FORMAT_IS_YUV(fmt));
>  	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
> -		_sspp_setup_csc10_opmode(ctx,
> -			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> -			MSM_FORMAT_IS_YUV(fmt));
> +		dpu_hw_sspp_setup_csc10_opmode(ctx,
> +					       VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> +					       MSM_FORMAT_IS_YUV(fmt));

Again, useless whitespace changes.

>  
>  	DPU_REG_WRITE(c, format_off, src_format);
>  	DPU_REG_WRITE(c, unpack_pat_off, unpack);
>  	DPU_REG_WRITE(c, op_mode_off, opmode);
> -

Why?

>  	/* clear previous UBWC error */
> -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
> +	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
>  }
>  
>  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> @@ -385,9 +408,9 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>  			tot_req_pixels[3]);
>  }
>  
> -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> -		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> -		const struct msm_format *format)
> +void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> +			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
> +			       const struct msm_format *format)

And here...

>  {
>  	if (!ctx || !scaler3_cfg)
>  		return;
> @@ -405,15 +428,11 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>  		struct dpu_sw_pipe_cfg *cfg)
>  {
>  	struct dpu_hw_sspp *ctx = pipe->sspp;
> -	struct dpu_hw_blk_reg_map *c;
> -	u32 src_size, src_xy, dst_size, dst_xy;
>  	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
>  
>  	if (!ctx || !cfg)
>  		return;
>  
> -	c = &ctx->hw;
> -
>  	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
>  	    pipe->multirect_index == DPU_SSPP_RECT_0) {
>  		src_size_off = SSPP_SRC_SIZE;
> @@ -427,20 +446,8 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>  		out_xy_off = SSPP_OUT_XY_REC1;
>  	}
>  
> -
> -	/* src and dest rect programming */
> -	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
> -	src_size = (drm_rect_height(&cfg->src_rect) << 16) |
> -		   drm_rect_width(&cfg->src_rect);
> -	dst_xy = (cfg->dst_rect.y1 << 16) | cfg->dst_rect.x1;
> -	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
> -		drm_rect_width(&cfg->dst_rect);
> -
> -	/* rectangle register programming */
> -	DPU_REG_WRITE(c, src_size_off, src_size);
> -	DPU_REG_WRITE(c, src_xy_off, src_xy);
> -	DPU_REG_WRITE(c, out_size_off, dst_size);
> -	DPU_REG_WRITE(c, out_xy_off, dst_xy);
> +	dpu_hw_setup_rects_impl(pipe, cfg, ctx, src_size_off,
> +				src_xy_off, out_size_off, out_xy_off);
>  }
>  
>  static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> @@ -497,8 +504,8 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>  	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1, ystride1);
>  }
>  
> -static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> -		const struct dpu_csc_cfg *data)
> +void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> +			   const struct dpu_csc_cfg *data)
>  {
>  	u32 offset;
>  	bool csc10 = false;
> @@ -519,21 +526,31 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
>  static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
>  {
>  	struct dpu_hw_sspp *ctx = pipe->sspp;
> -	struct dpu_hw_fmt_layout cfg;
> +	u32 const_clr_off;
>  
>  	if (!ctx)
>  		return;
>  
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> +	    pipe->multirect_index == DPU_SSPP_RECT_0)
> +		const_clr_off = SSPP_SRC_CONSTANT_COLOR;
> +	else
> +		const_clr_off = SSPP_SRC_CONSTANT_COLOR_REC1;
> +
> +	dpu_hw_setup_solidfill_impl(pipe, color, ctx, const_clr_off);
> +}
> +
> +void dpu_hw_setup_solidfill_impl(struct dpu_sw_pipe *pipe,
> +				 u32 color, struct dpu_hw_sspp *ctx,
> +				 u32 const_clr_off)
> +{
> +	struct dpu_hw_fmt_layout cfg;
> +
>  	/* cleanup source addresses */
>  	memset(&cfg, 0, sizeof(cfg));
>  	ctx->ops.setup_sourceaddress(pipe, &cfg);
>  
> -	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> -	    pipe->multirect_index == DPU_SSPP_RECT_0)
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR, color);
> -	else
> -		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1,
> -				color);
> +	DPU_REG_WRITE(&ctx->hw, const_clr_off, color);
>  }
>  
>  static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
> @@ -547,14 +564,20 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
>  			      cfg);
>  }
>  
> +void dpu_hw_sspp_setup_qos_ctrl_impl(struct dpu_hw_sspp *ctx,
> +				     bool danger_safe_en, u32 ctrl_off)
> +{
> +	DPU_REG_WRITE(&ctx->hw, ctrl_off,
> +		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
> +}
> +
>  static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>  				       bool danger_safe_en)
>  {
>  	if (!ctx)
>  		return;
>  
> -	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL,
> -		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
> +	dpu_hw_sspp_setup_qos_ctrl_impl(ctx, danger_safe_en, SSPP_QOS_CTRL);
>  }
>  
>  static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
> @@ -609,7 +632,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
>  		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
>  
>  	if (test_bit(DPU_SSPP_SCALER_QSEED3_COMPATIBLE, &features))
> -		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
> +		c->ops.setup_scaler = dpu_hw_sspp_setup_scaler3;
>  
>  	if (test_bit(DPU_SSPP_CDP, &features))
>  		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index bdac5c04bf79..c6b19cb4d158 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -331,5 +331,57 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
>  int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>  			      struct dentry *entry);
>  
> +void dpu_hw_sspp_setup_opmode(struct dpu_hw_sspp *ctx,
> +			      u32 mask, u8 en);
> +
> +void dpu_hw_sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
> +				    u32 mask, u8 en);
> +
> +void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> +			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
> +			       const struct msm_format *format);
> +
> +void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> +			   const struct dpu_csc_cfg *data);
> +
> +void dpu_hw_setup_multirect_impl(struct dpu_sw_pipe *pipe,
> +				 struct dpu_hw_sspp *ctx,
> +				 u32 op_mode_off);
> +
> +void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
> +			      u32 flags, struct dpu_hw_sspp *ctx,
> +			      u32 op_mode_off, u32 unpack_pat_off, u32 format_off,
> +			      u32 ubwc_ctrl_off, u32 ubwc_err_off);
> +
> +static inline void dpu_hw_setup_rects_impl(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *cfg,
> +					   struct dpu_hw_sspp *ctx, u32 src_size_off,
> +					   u32 src_xy_off, u32 out_size_off, u32 out_xy_off)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +	u32 src_size, src_xy, dst_size, dst_xy;
> +
> +	c = &ctx->hw;
> +
> +	/* src and dest rect programming */
> +	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
> +	src_size = (drm_rect_height(&cfg->src_rect) << 16) |
> +		   drm_rect_width(&cfg->src_rect);
> +	dst_xy = (cfg->dst_rect.y1 << 16) | cfg->dst_rect.x1;
> +	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
> +		drm_rect_width(&cfg->dst_rect);
> +
> +	/* rectangle register programming */
> +	DPU_REG_WRITE(c, src_size_off, src_size);
> +	DPU_REG_WRITE(c, src_xy_off, src_xy);
> +	DPU_REG_WRITE(c, out_size_off, dst_size);
> +	DPU_REG_WRITE(c, out_xy_off, dst_xy);
> +}
> +
> +void dpu_hw_setup_solidfill_impl(struct dpu_sw_pipe *pipe,
> +				 u32 color, struct dpu_hw_sspp *ctx, u32 const_clr_off);
> +
> +void dpu_hw_sspp_setup_qos_ctrl_impl(struct dpu_hw_sspp *ctx,
> +				     bool danger_safe_en, u32 ctrl_off);
> +
>  #endif /*_DPU_HW_SSPP_H */
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 486be346d40d..3cf22ec62792 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -81,6 +81,13 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
>  #define QOS_CREQ_LUT_0                    0x14
>  #define QOS_CREQ_LUT_1                    0x18
>  
> +/* CMN_QOS_LUT */
> +#define SSPP_CMN_QOS_CTRL                      0x28
> +#define SSPP_CMN_DANGER_LUT                    0x2c
> +#define SSPP_CMN_SAFE_LUT                      0x30
> +#define SSPP_CMN_CREQ_LUT_0                    0x34
> +#define SSPP_CMN_CREQ_LUT_1                    0x38
> +
>  /* QOS_QOS_CTRL */
>  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
>  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
>  }
>  
> +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> +			       const struct dpu_hw_qos_cfg *cfg)

It's definitely not a part of refactoring. Why is it a part of this
patch?

> +{
> +	DPU_REG_WRITE(c, SSPP_CMN_DANGER_LUT, cfg->danger_lut);
> +	DPU_REG_WRITE(c, SSPP_CMN_SAFE_LUT, cfg->safe_lut);
> +	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_0, cfg->creq_lut);
> +	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_1, cfg->creq_lut >> 32);
> +	DPU_REG_WRITE(c, SSPP_CMN_QOS_CTRL,
> +		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> +}
> +
>  /*
>   * note: Aside from encoders, input_sel should be set to 0x0 by default
>   */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index 67b08e99335d..1822ac699757 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -360,6 +360,9 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>  			   bool qos_8lvl,
>  			   const struct dpu_hw_qos_cfg *cfg);
>  
> +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> +			       const struct dpu_hw_qos_cfg *cfg);
> +
>  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>  		u32 misr_ctrl_offset, u8 input_sel);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index 478a091aeccf..006dcc4a0dcc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
>  			      cfg);
>  }
>  
> +static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
> +					struct dpu_hw_qos_cfg *cfg)
> +{
> +	if (!ctx || !cfg)
> +		return;
> +
> +	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
> +}
> +
>  static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
>  				const struct msm_format *fmt,
>  				bool enable)
> @@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
>  	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
>  		ops->setup_roi = dpu_hw_wb_roi;
>  
> -	if (test_bit(DPU_WB_QOS, &features))
> -		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
> +	if (test_bit(DPU_WB_QOS, &features)) {
> +		if (mdss_rev->core_major_ver >= 13)
> +			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
> +		else
> +			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
> +	}
>  
>  	if (test_bit(DPU_WB_CDP, &features))
>  		ops->setup_cdp = dpu_hw_wb_setup_cdp;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
