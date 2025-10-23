Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE7FC0106C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B32F10E3E1;
	Thu, 23 Oct 2025 12:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ktlic7Li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2F410E3F2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:14:08 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7cT4g027078
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=auuh20t6K0o2emjRJbBrLiYz
 hkGuqmzeXF1/zyoekbM=; b=Ktlic7LiOMRzNyN/zgcsQUr35yV3KFxlLvvx710k
 uLMbwMco4E3xS+sdahnbYtfvM/KgujU6Yv6wBMGCC9cB0ChxHyc1GxX30hvQvIiC
 VHr1/UHkyejJh4j6x/9Yu4Nj+3TQWzeSKmzRXtBmZtws7xko8afXKXxDdsq1dsIy
 1YlkoOnVJANOxvJsl4PgGMG28yCG1AjpRP14OPf3bjMSkfHHh23dZlH8IsGSFzDP
 4Iqun3mjMl45pFAvPF2vOUSMLzN2DTbPcPyKuRdPBOrBveylotGBpgf6rLtyBp6k
 j9O7usKO4Ht9g/7Kgklsoak6FiD3Gs90Cf7t4sXxTT2oxA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8jegc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:14:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e1015c48c8so47354751cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221645; x=1761826445;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=auuh20t6K0o2emjRJbBrLiYzhkGuqmzeXF1/zyoekbM=;
 b=hgEdGdSLb/owIS1eeSCSuEH+FxCaWsZPclMbGw0AkJTmfSeZaCscTOvwcxeOvnIY5y
 kdzHZvaQ1Xn6YIAKm0F9v4QXF4NC6M9hRZOjLpL8olBDy3Mq/ja2OZCPGnGfaJHp9d8g
 bAIVCCnQDmW4dr0a+zJ+Q0b/NcMXI/XA0p7xbrjYE+vSE3zQzuK11gTIvKrZ/aiiVMHx
 rkoipSTeQd4CmQ1e4VhqfCrvtiaZ16b4BAkp1WMT0s8Bq5Pj5cuX5HcS5l+3QLR9KHZD
 iHkHu8VMv57tS4i74O9/GF8X97AHxMg05PrRytS1k6/D2zejEkjvVykth2d1YMvLo6Ji
 BVYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIgeMSA6B7KDhSvW2whbX+Dutv1tPP1k9dzV5ewNwskj/EaQKXFomJV2bba0Za944kFB4mBW0nTK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYyj7f2Q59qLr4UKzRFgIq1DdT9AiSevhoAYafPdTL6daSTAj2
 PvFiXcFU3xU7Ky8CNYDWX5ztrK0IrJfP0bIM83b4+btqZl4eiRuO1eTACVj96GWAEsaMcETGLnE
 0H+eBM0w+WGBHyCxiwg7efLa/8/m2sTWHe9lOfZmCXdcZSqdcOpxUmTC2AK1FEe6AHZbYvmk=
X-Gm-Gg: ASbGnctQtCJI5Uu08D5744Wdz2/jj3qrA6oP3f1T8xlCzI1wSaougd297KfBOQ9TQq7
 vm/0RTfZV0eX9EFpo0Oz6za3aI0aL6bM62Vc01qgSi5joDUd/kl52cVSbvUZLlLxFwt6/TFpeDb
 mIitMumoJKiNZe8C7V5BznyA4UfwRB/fB9jA+aqRsfLBMr55EIXIrwotKX/Vez43LDDMFASviEO
 TO+7PYBwN/7O0kGSWPJ4Pne98ISBaXKjqz/6Cxnf66uY993P8njOq34TROHR2G5XHEVy0vEBkZY
 cqColv3chXVK1RwqVS1yUodi/ehbrZhDW/bBsJnvHxfveAF0jMPdy4jKxV+if749cOx7gthzj7x
 hlYPt//jfAAeYldhZcHoNpmbnNZxn9fXiurPlqe5MLhMYhJAidlVd0g508Jxjb4EO7VW3qeiw0E
 HB/YADO0TAaVhM
X-Received: by 2002:ac8:5a0a:0:b0:4e6:df3e:2abe with SMTP id
 d75a77b69052e-4eb7849edd2mr53771291cf.9.1761221644713; 
 Thu, 23 Oct 2025 05:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmozziHRKZuFSPtJn1IGyr5atIG95XNvMr5TwjRaFhzO/UNdo4HnUESV8DgOm1s+qsz4MKog==
X-Received: by 2002:ac8:5a0a:0:b0:4e6:df3e:2abe with SMTP id
 d75a77b69052e-4eb7849edd2mr53770411cf.9.1761221643927; 
 Thu, 23 Oct 2025 05:14:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d66bb394sm4101631fa.8.2025.10.23.05.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:14:01 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:14:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 06/12] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Message-ID: <jq4p2f7qug5ryh5vvupetczuz7whpams5cthjvjpbrmhlob57l@b4l2ecxw2j7q>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lCB9LoLu_6mImgQ6dAXZLCOrxnf4iQdE
X-Proofpoint-GUID: lCB9LoLu_6mImgQ6dAXZLCOrxnf4iQdE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX3ntdt2BpF1aw
 ktnfNGbBxTxfW9zAg5HCLWHx4/EmdwC5bC3X5eJhh1CsjOQAZqj44T3mqltRCBEJbrALFBE1KVt
 nNQCah4Vp0i3SIbNJl4ztSBJRoqMNapAPRqv++TGCQJgvoulMSwq496zv7hFCay7oe5958mSv70
 gJQnMKo4z/xJ8pyICmWvZkmUvp439M8ySyFvXnmum5qVZi6g5D+HmAct/dncbYqW7s09RNIF738
 V4VOraWpA6jJQa1IeSRkcvvg3QxCnC40q0VnlWz6Vx9fZ8+hVoAgVEZc+jkd4MghtFylgpXDAma
 WHKPUmvRLqN7smurs9jJRi4UDnh4F/O+1CUsHCUBBqfoYan8iUp1clh8p7q1/661KAiDNgHtUxM
 n3QbEDxF1y0uy0KHy4vJ3WeHmIr1ZQ==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fa1c0f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=HtC0RQkXRgjUUgybQskA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164
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

On Thu, Oct 23, 2025 at 04:06:03PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Kaanapali platform SSPP sub-blocks, which
> introduce structural changes including register additions,
> removals, and relocations. Add the new common and rectangle
> blocks, and update register definitions and handling to
> ensure compatibility with DPU v13.0.

Merge new structures into this patch.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 474 +++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  23 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |   4 +
>  3 files changed, 483 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 6f1fc790ad6d..7217c952f01c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -17,6 +17,7 @@
>  
>  #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
>  
> +/* <= v12 DPU */
>  /* SSPP registers */
>  #define SSPP_SRC_SIZE                      0x00
>  #define SSPP_SRC_XY                        0x08
> @@ -74,12 +75,116 @@
>  #define SSPP_EXCL_REC_XY                   0x1B8
>  #define SSPP_CLK_CTRL                      0x330
>  
> +/* >= v13 DPU */
> +/* CMN Registers -> Source Surface Processing Pipe Common SSPP registers */
> +/*      Name                                        Offset */
> +#define SSPP_CMN_CLK_CTRL                0x0
> +#define SSPP_CMN_CLK_STATUS              0x4
> +#define SSPP_CMN_MULTI_REC_OP_MODE       0x10
> +#define SSPP_CMN_ADDR_CONFIG             0x14
> +#define SSPP_CMN_CAC_CTRL                0x20
> +#define SSPP_CMN_SYS_CACHE_MODE          0x24
> +#define SSPP_CMN_QOS_CTRL                0x28
> +#define SSPP_CMN_DANGER_LUT              0x2C
> +#define SSPP_CMN_SAFE_LUT                0x30

lowercase hex.

> @@ -141,6 +246,12 @@
>  /* traffic shaper clock in Hz */
>  #define TS_CLK			19200000
>  
> +static inline u32 _sspp_calculate_rect_off(enum dpu_sspp_multirect_index rect_index,
> +					   struct dpu_hw_sspp *ctx)
> +{
> +	return (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) ?
> +			ctx->cap->sblk->sspp_rec0_blk.base : ctx->cap->sblk->sspp_rec1_blk.base;
> +}
>  
>  static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  {
> @@ -169,6 +280,34 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>  	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE, mode_mask);
>  }
>  
> +static void dpu_hw_sspp_setup_multirect_v13(struct dpu_sw_pipe *pipe)
> +{
> +	struct dpu_hw_sspp *ctx = pipe->sspp;
> +	u32 offset = ctx->cap->sblk->cmn_blk.base;
> +	u32 mode_mask;
> +
> +	if (!ctx)
> +		return;
> +
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> +		/**
> +		 * if rect index is RECT_SOLO, we cannot expect a
> +		 * virtual plane sharing the same SSPP id. So we go
> +		 * and disable multirect
> +		 */
> +		mode_mask = 0;
> +	} else {
> +		mode_mask = DPU_REG_READ(&ctx->hw, offset + SSPP_CMN_MULTI_REC_OP_MODE);
> +		mode_mask |= pipe->multirect_index;
> +		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
> +			mode_mask |= BIT(2);
> +		else
> +			mode_mask &= ~BIT(2);
> +	}
> +
> +	DPU_REG_WRITE(&ctx->hw, offset + SSPP_CMN_MULTI_REC_OP_MODE, mode_mask);
> +}
> +
>  static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
>  		u32 mask, u8 en)
>  {
> @@ -328,6 +467,119 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
>  }
>  
> +static void dpu_hw_sspp_setup_format_v13(struct dpu_sw_pipe *pipe,
> +		const struct msm_format *fmt, u32 flags)
> +{
> +	struct dpu_hw_sspp *ctx = pipe->sspp;
> +	struct dpu_hw_blk_reg_map *c;
> +	u32 chroma_samp, unpack, src_format;
> +	u32 opmode = 0;
> +	u32 fast_clear = 0;
> +	u32 offset;
> +
> +	if (!ctx || !fmt)
> +		return;
> +
> +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> +
> +	c = &ctx->hw;
> +
> +	opmode = DPU_REG_READ(c, offset + SSPP_REC_SRC_OP_MODE);
> +	opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
> +			MDSS_MDP_OP_BWC_EN | MDSS_MDP_OP_PE_OVERRIDE
> +			| MDSS_MDP_OP_ROT_90);
> +
> +	if (flags & DPU_SSPP_FLIP_LR)
> +		opmode |= MDSS_MDP_OP_FLIP_LR;
> +	if (flags & DPU_SSPP_FLIP_UD)
> +		opmode |= MDSS_MDP_OP_FLIP_UD;
> +	if (flags & DPU_SSPP_ROT_90)
> +		opmode |= MDSS_MDP_OP_ROT_90;
> +
> +	chroma_samp = fmt->chroma_sample;
> +	if (flags & DPU_SSPP_SOURCE_ROTATED_90) {
> +		if (chroma_samp == CHROMA_H2V1)
> +			chroma_samp = CHROMA_H1V2;
> +		else if (chroma_samp == CHROMA_H1V2)
> +			chroma_samp = CHROMA_H2V1;
> +	}
> +
> +	src_format = (chroma_samp << 23) | (fmt->fetch_type << 19) |
> +		(fmt->bpc_a << 6) | (fmt->bpc_r_cr << 4) |
> +		(fmt->bpc_b_cb << 2) | (fmt->bpc_g_y << 0);
> +
> +	if (flags & DPU_SSPP_ROT_90)
> +		src_format |= BIT(11); /* ROT90 */
> +
> +	if (fmt->alpha_enable && fmt->fetch_type == MDP_PLANE_INTERLEAVED)
> +		src_format |= BIT(8); /* SRCC3_EN */
> +
> +	if (flags & DPU_SSPP_SOLID_FILL)
> +		src_format |= BIT(22);
> +
> +	unpack = (fmt->element[3] << 24) | (fmt->element[2] << 16) |
> +		(fmt->element[1] << 8) | (fmt->element[0] << 0);
> +	src_format |= ((fmt->unpack_count - 1) << 12) |
> +		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
> +		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB ? 1 : 0) << 18) |
> +		((fmt->bpp - 1) << 9);
> +
> +	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
> +		if (MSM_FORMAT_IS_UBWC(fmt))
> +			opmode |= MDSS_MDP_OP_BWC_EN;
> +		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
> +		switch (ctx->ubwc->ubwc_enc_version) {
> +		case UBWC_1_0:
> +			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> +			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
> +				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> +				      BIT(8) |
> +				     (ctx->ubwc->highest_bank_bit << 4));
> +			break;
> +		case UBWC_2_0:
> +			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> +			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
> +				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
> +				     (ctx->ubwc->highest_bank_bit << 4));
> +			break;
> +		case UBWC_3_0:
> +			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
> +				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> +				     (ctx->ubwc->highest_bank_bit << 4));
> +			break;
> +		case UBWC_4_0:
> +			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
> +				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> +			break;
> +		}
> +	}
> +
> +	opmode |= MDSS_MDP_OP_PE_OVERRIDE;
> +
> +	/* if this is YUV pixel format, enable CSC */
> +	if (MSM_FORMAT_IS_YUV(fmt))
> +		src_format |= BIT(15);
> +
> +	if (MSM_FORMAT_IS_DX(fmt))
> +		src_format |= BIT(14);
> +
> +	/* update scaler opmode, if appropriate */
> +	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
> +		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> +				   MSM_FORMAT_IS_YUV(fmt));
> +	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
> +		_sspp_setup_csc10_opmode(ctx,
> +					 VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> +					 MSM_FORMAT_IS_YUV(fmt));

This function is a nice c&p of the old one. Can we abstract it at least
a bit and let it be shared between the old code and the new one?

> +
> +	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_FORMAT, src_format);
> +	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_UNPACK_PATTERN, unpack);
> +	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_OP_MODE, opmode);
> +
> +	/* clear previous UBWC error */
> +	DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_ERROR_STATUS, BIT(31));
> +}
> +
>  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>  		struct dpu_hw_pixel_ext *pe_ext)
>  {
> @@ -385,6 +637,53 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>  			tot_req_pixels[3]);
>  }
>  
> +static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
> +		struct dpu_hw_pixel_ext *pe_ext)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +	u8 color;
> +	u32 lr_pe[4], tb_pe[4], tot_req_pixels[4];
> +	const u32 bytemask = 0xff;
> +	const u32 shortmask = 0xffff;
> +	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
> +
> +	if (!ctx || !pe_ext)
> +		return;
> +
> +	c = &ctx->hw;
> +	/* program SW pixel extension override for all pipes*/
> +	for (color = 0; color < DPU_MAX_PLANES; color++) {
> +		/* color 2 has the same set of registers as color 1 */
> +		if (color == 2)
> +			continue;
> +
> +		lr_pe[color] = ((pe_ext->right_ftch[color] & bytemask) << 24) |
> +			       ((pe_ext->right_rpt[color] & bytemask) << 16) |
> +			       ((pe_ext->left_ftch[color] & bytemask) << 8) |
> +			       (pe_ext->left_rpt[color] & bytemask);
> +
> +		tb_pe[color] = ((pe_ext->btm_ftch[color] & bytemask) << 24) |
> +			       ((pe_ext->btm_rpt[color] & bytemask) << 16) |
> +			       ((pe_ext->top_ftch[color] & bytemask) << 8) |
> +			       (pe_ext->top_rpt[color] & bytemask);
> +
> +		tot_req_pixels[color] = (((pe_ext->roi_h[color] +
> +			pe_ext->num_ext_pxls_top[color] +
> +			pe_ext->num_ext_pxls_btm[color]) & shortmask) << 16) |
> +			((pe_ext->roi_w[color] +
> +			pe_ext->num_ext_pxls_left[color] +
> +			pe_ext->num_ext_pxls_right[color]) & shortmask);
> +	}

Same comment. No C&P, of a sensible code, please.

> +
> +	/* color 0 */
> +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR + offset, lr_pe[0]);
> +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB + offset, tb_pe[0]);
> +
> +	/* color 1 and color 2 */
> +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR_ODX + offset, lr_pe[1]);
> +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB_ODX + offset, tb_pe[1]);
> +}
> +
>  static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
>  		struct dpu_hw_scaler3_cfg *scaler3_cfg,
>  		const struct msm_format *format)
> @@ -443,6 +742,36 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>  	DPU_REG_WRITE(c, out_xy_off, dst_xy);
>  }
>  
> +static void dpu_hw_sspp_setup_rects_v13(struct dpu_sw_pipe *pipe,
> +					struct dpu_sw_pipe_cfg *cfg)
> +{
> +	struct dpu_hw_sspp *ctx = pipe->sspp;
> +	struct dpu_hw_blk_reg_map *c;
> +	u32 src_size, src_xy, dst_size, dst_xy;
> +	u32 offset;
> +
> +	if (!ctx || !cfg)
> +		return;
> +
> +	c = &ctx->hw;
> +
> +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
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
> +	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_SIZE, src_size);
> +	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_XY, src_xy);
> +	DPU_REG_WRITE(c, offset + SSPP_REC_OUT_SIZE, dst_size);
> +	DPU_REG_WRITE(c, offset + SSPP_REC_OUT_XY, dst_xy);
> +}
> +
>  static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>  		struct dpu_hw_fmt_layout *layout)
>  {
> @@ -497,6 +826,29 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>  	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1, ystride1);
>  }
>  
> +static void dpu_hw_sspp_setup_sourceaddress_v13(struct dpu_sw_pipe *pipe,
> +						struct dpu_hw_fmt_layout *layout)
> +{
> +	struct dpu_hw_sspp *ctx = pipe->sspp;
> +	int i;
> +	u32 addr, ystride0, ystride1;
> +
> +	if (!ctx)
> +		return;
> +
> +	addr = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> +
> +	for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
> +		DPU_REG_WRITE(&ctx->hw, addr + SSPP_REC_SRC0_ADDR + i * 0x4,
> +			      layout->plane_addr[i]);
> +
> +	ystride0 = (layout->plane_pitch[0]) | (layout->plane_pitch[2] << 16);
> +	ystride1 = (layout->plane_pitch[1]) | (layout->plane_pitch[3] << 16);
> +
> +	DPU_REG_WRITE(&ctx->hw, addr + SSPP_REC_SRC_YSTRIDE0, ystride0);
> +	DPU_REG_WRITE(&ctx->hw, addr + SSPP_REC_SRC_YSTRIDE1, ystride1);
> +}
> +
>  static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
>  		const struct dpu_csc_cfg *data)
>  {
> @@ -536,6 +888,24 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
>  				color);
>  }
>  
> +static void dpu_hw_sspp_setup_solidfill_v13(struct dpu_sw_pipe *pipe, u32 color)
> +{
> +	struct dpu_hw_sspp *ctx = pipe->sspp;
> +	struct dpu_hw_fmt_layout cfg;
> +	u32 offset;
> +
> +	if (!ctx)
> +		return;
> +
> +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> +
> +	/* cleanup source addresses */
> +	memset(&cfg, 0, sizeof(cfg));
> +	ctx->ops.setup_sourceaddress(pipe, &cfg);
> +
> +	DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC_CONSTANT_COLOR, color);
> +}
> +
>  static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
>  				      struct dpu_hw_qos_cfg *cfg)
>  {
> @@ -547,6 +917,17 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
>  			      cfg);
>  }
>  
> +static void dpu_hw_sspp_setup_qos_lut_v13(struct dpu_hw_sspp *ctx,
> +					  struct dpu_hw_qos_cfg *cfg)
> +{
> +	if (!ctx || !cfg)
> +		return;
> +
> +	_dpu_hw_setup_qos_lut_v13(&ctx->hw, 0,
> +				  ctx->mdss_ver->core_major_ver >= 4,

This is v13, of course it is >= 4.

> +				  cfg);
> +}
> +
>  static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>  				       bool danger_safe_en)
>  {
> @@ -557,6 +938,16 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>  		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
>  }
>  
> +static void dpu_hw_sspp_setup_qos_ctrl_v13(struct dpu_hw_sspp *ctx,
> +					   bool danger_safe_en)
> +{
> +	if (!ctx)
> +		return;
> +
> +	DPU_REG_WRITE(&ctx->hw, SSPP_CMN_QOS_CTRL,
> +		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
> +}
> +
>  static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
>  				  const struct msm_format *fmt,
>  				  bool enable)
> @@ -576,6 +967,20 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
>  	dpu_setup_cdp(&ctx->hw, cdp_cntl_offset, fmt, enable);
>  }
>  
> +static void dpu_hw_sspp_setup_cdp_v13(struct dpu_sw_pipe *pipe,
> +				      const struct msm_format *fmt,
> +				      bool enable)
> +{
> +	struct dpu_hw_sspp *ctx = pipe->sspp;
> +	u32 offset = 0;
> +
> +	if (!ctx)
> +		return;
> +
> +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> +	dpu_setup_cdp(&ctx->hw, offset + SSPP_REC_CDP_CNTL, fmt, enable);
> +}
> +
>  static bool dpu_hw_sspp_setup_clk_force_ctrl(struct dpu_hw_sspp *ctx, bool enable)
>  {
>  	static const struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
> @@ -586,36 +991,69 @@ static bool dpu_hw_sspp_setup_clk_force_ctrl(struct dpu_hw_sspp *ctx, bool enabl
>  	return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
>  }
>  
> +static bool dpu_hw_sspp_setup_clk_force_ctrl_v13(struct dpu_hw_sspp *ctx, bool enable)
> +{
> +	static const struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
> +		.reg_off = SSPP_CMN_CLK_CTRL,
> +		.bit_off = 0
> +	};
> +
> +	return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
> +}
> +
>  static void _setup_layer_ops(struct dpu_hw_sspp *c,
>  		unsigned long features, const struct dpu_mdss_version *mdss_rev)
>  {
> -	c->ops.setup_format = dpu_hw_sspp_setup_format;
> -	c->ops.setup_rects = dpu_hw_sspp_setup_rects;
> -	c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress;
> -	c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill;
> -	c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
> -
> -	if (test_bit(DPU_SSPP_QOS, &features)) {
> -		c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut;
> -		c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl;
> +	if (mdss_rev->core_major_ver >= 13) {
> +		c->ops.setup_format = dpu_hw_sspp_setup_format_v13;
> +		c->ops.setup_rects = dpu_hw_sspp_setup_rects_v13;
> +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> +
> +		if (test_bit(DPU_SSPP_QOS, &features)) {
> +			c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut_v13;
> +			c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl_v13;
> +		}
> +
> +		if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
> +		    test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> +			c->ops.setup_multirect = dpu_hw_sspp_setup_multirect_v13;
> +
> +		if (test_bit(DPU_SSPP_CDP, &features))
> +			c->ops.setup_cdp = dpu_hw_sspp_setup_cdp_v13;
> +
> +		c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl_v13;
> +	} else {
> +		c->ops.setup_format = dpu_hw_sspp_setup_format;
> +		c->ops.setup_rects = dpu_hw_sspp_setup_rects;
> +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress;
> +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill;
> +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
> +
> +		if (test_bit(DPU_SSPP_QOS, &features)) {
> +			c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut;
> +			c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl;
> +		}
> +
> +		if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
> +		    test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> +			c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
> +
> +		if (test_bit(DPU_SSPP_CDP, &features))
> +			c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
> +
> +		if (mdss_rev->core_major_ver >= 9)
> +			c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl;
>  	}
>  
>  	if (test_bit(DPU_SSPP_CSC, &features) ||
>  		test_bit(DPU_SSPP_CSC_10BIT, &features))
>  		c->ops.setup_csc = dpu_hw_sspp_setup_csc;
>  
> -	if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
> -		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> -		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
> -
>  	if (test_bit(DPU_SSPP_SCALER_QSEED3_COMPATIBLE, &features))
>  		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;

If the only common items are CSC and scaler (and both are already pretty
abstracted), please don't squash it in the same old file. Create new
file for the new hardware block (like we did for DSC 1.1 vs 1.2).

>  
> -	if (test_bit(DPU_SSPP_CDP, &features))
> -		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
> -
> -	if (mdss_rev->core_major_ver >= 9)
> -		c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl;
>  }
>  
>  #ifdef CONFIG_DEBUG_FS
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 486be346d40d..1acf456c425b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -81,6 +81,13 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
>  #define QOS_CREQ_LUT_0                    0x14
>  #define QOS_CREQ_LUT_1                    0x18
>  
> +/* CMN_QOS_LUT */
> +#define SSPP_CMN_DANGER_LUT                    0x2C
> +#define SSPP_CMN_SAFE_LUT                      0x30
> +#define SSPP_CMN_CREQ_LUT_0                    0x34
> +#define SSPP_CMN_CREQ_LUT_1                    0x38
> +#define SSPP_CMN_QOS_CTRL	                    0x28

Lowercase hex, sort by the address.

> +
>  /* QOS_QOS_CTRL */
>  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
>  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> @@ -475,6 +482,22 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
>  }
>  
> +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c, u32 offset,
> +			       bool qos_8lvl,
> +			       const struct dpu_hw_qos_cfg *cfg)
> +{
> +	DPU_REG_WRITE(c, offset + SSPP_CMN_DANGER_LUT, cfg->danger_lut);
> +	DPU_REG_WRITE(c, offset + SSPP_CMN_SAFE_LUT, cfg->safe_lut);
> +
> +	if (qos_8lvl) {
> +		DPU_REG_WRITE(c, offset + SSPP_CMN_CREQ_LUT_0, cfg->creq_lut);
> +		DPU_REG_WRITE(c, offset + SSPP_CMN_CREQ_LUT_1, cfg->creq_lut >> 32);
> +	}
> +
> +	DPU_REG_WRITE(c, offset + SSPP_CMN_QOS_CTRL,
> +		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> +}
> +
>  /*
>   * note: Aside from encoders, input_sel should be set to 0x0 by default
>   */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index 67b08e99335d..9d442d6fc11c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -360,6 +360,10 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>  			   bool qos_8lvl,
>  			   const struct dpu_hw_qos_cfg *cfg);
>  
> +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c, u32 offset,
> +			       bool qos_8lvl,
> +			       const struct dpu_hw_qos_cfg *cfg);
> +
>  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>  		u32 misr_ctrl_offset, u8 input_sel);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
