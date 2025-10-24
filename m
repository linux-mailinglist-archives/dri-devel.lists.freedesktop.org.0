Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B54EC0469D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 07:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824B710E9D3;
	Fri, 24 Oct 2025 05:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDRi5PZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C4810E9D3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 05:49:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FUL2003660
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 05:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ELeV12aZMMr6spBu+mx+32yg
 kfWU2hbvBmUygn7MQ70=; b=iDRi5PZQjSxNYvgDX7o5wMDjqdUmrhr3lcHRWdY+
 FKG9iGpd61jl+P8+CwV0+nialVN3MQkERk1he7q+ChzHMzIuZtpk3/V4SwTpDK8v
 TGlxZIpwvCgFl6XTr1G43fxQ1BON81ZMybgOvowis0T3WM86lgbiXpWwKNwUH2UG
 R/JYrwHcDwq1HiJctX1e8YIb1rjIIpT0Ca6OZwkK+v7N/mw1ERUmtG35r1yf4iAK
 i4NzlzyDT0CXWs/SrPLAEPnLl9hfwmTgBQI68y6rYzHwTKaVAI38CrtPWe3OwmH8
 fLrbgUFO/3n/BNKHdB+fkRyMOxpQ1HtI/S+DN6+phnlMTg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2geawxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 05:49:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87c1cc5a75dso65554726d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761284997; x=1761889797;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ELeV12aZMMr6spBu+mx+32ygkfWU2hbvBmUygn7MQ70=;
 b=sZttVu8Ey+DxTTMcSurqwyk8UGoS6l8I3AT0W6LJB9JcOh1WFL0TXiNO6/KpcziMf6
 9bOqHUmEE1KeP7knf4lYEfGFQxUl+7KtuHrPcxYORc/91pkROoiAaA9/FfHwjBQXS8bG
 lCUkNJb2dGIeEOqQZzjl9J9dlyUxy83N5/PHLHWmDPKRDfOhOOS6KiWLCgXBFPNoHd0t
 WvHdzvS4KAZdZkIugarBwzOOgv4mYsVl5Z6L0PXFCJwIOuBDE6JhcOIsqgZA8XkCw1VW
 RLSlJGJEn8U75A/OY31w2LdhdD6iOkC74vMjMR1XghombBlfCO7DUgzmtMrnj6nwT+xw
 b4YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTkdsDFWRzFB59NjYtD/vnXh/4ZGzyY4Zia4dCkWqiho6zlu+36bewO5zlwYcPNbraoqSZ4PRDi2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwEtNiw9XOyGKDY+jAAkgn8xvNxf9GaPGzn138alDrCmxN4tLR
 XoaFT+VF+w2jXLZ4y5v5KFZEVKgw25EdZ6i37WN+6v2nMRGEegnSyXUlbULGiKcLP8liHHPicP2
 HY1lp1locbjxhzOk5dU0WENScqoh6J2JZX22PxH83CjR4lV+JxeMgRCI2juh9ibBpNhlbzpE=
X-Gm-Gg: ASbGncuGW5frbyRlJ9o06G5EJXZNRyFtsw9ZqBb3kbwGeDs2nUGZFHoxIL+fc1qhA+8
 nmJEfNt64bjd2Be/OFoXu0BAB6kwfCj/DIaYhAdpsyCkaSjhgatdYERG9UFd6Xs6Thp2I7qDDrL
 L/msxx968tVbhXlYZPgcsIxfpjELBKcFNTs58H+w1KbmiqpHMINPDDzD3bE698rK8V0Xs1HtiO7
 W0pC95/u3LgvcKJw2bS8tDoOY/wVjqECELLgIUY3HDaNXE29Z5X+RGoNCEZXA5WOqq/qg/wwueY
 VXL80JODMSuQbZGmRCeogGon1jk1tPQCKsme+iIQdQOcC8LUZJ+YN5l9D6oOgeAR4sPNzu5YgXp
 v4md7npD4K7iIKNbsWgQP71MEJrIjUnyw457IWtiOPtfL8Jt+pyQizEFz5Her
X-Received: by 2002:a05:620a:2688:b0:85c:bb2:ad9c with SMTP id
 af79cd13be357-8906fd1829bmr3212955385a.53.1761284997213; 
 Thu, 23 Oct 2025 22:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+bvdb2Ztx3JOXK8k50pLVIsAQwD3KBn5rU0kP1PX59/aTIyRkHbOXLNuAEyfSZQwCWswsGg==
X-Received: by 2002:a05:620a:2688:b0:85c:bb2:ad9c with SMTP id
 af79cd13be357-8906fd1829bmr3212951485a.53.1761284996542; 
 Thu, 23 Oct 2025 22:49:56 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c1169b1bcsm316719385a.29.2025.10.23.22.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 22:49:55 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:49:44 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <aPsTeJ7/JefLfERa@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <jq4p2f7qug5ryh5vvupetczuz7whpams5cthjvjpbrmhlob57l@b4l2ecxw2j7q>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jq4p2f7qug5ryh5vvupetczuz7whpams5cthjvjpbrmhlob57l@b4l2ecxw2j7q>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX4r6oB0zyMm2C
 ba5LPbRpOK7nTImR6y0etBCT8OYBX9jZB0CdohQpjX+Znm/3C6YMzwEQYMJe5YGD4Vc3ug3Xo5O
 LnPdBy7LEMKJmaZQcLywvVhBnbVpitOh4kuLZ/Uekdrd71I1Voim4FU1jeQxa0DDfu/z87R/G2k
 dPZqOnKQ0bQNwMnvLLCMibcff4X7xHk/inhxAP++7AN9S1moEnHOMDV+jmGZIHQXstf7q0sjp12
 y7t7O5wTz0aNOLjXoIDA9PH+zoYfDaQVzoinBdluQhpP7wUUMxWTb+BTne7RzUTFDjuU4nqp6vt
 UgvXmrEailY6euX5RaKL+kQxcD3HhJ5FmQpLiyODV7PYy0YjSWT1SR40WbBeDp+SiE3Hu1HeBxE
 jowpqqc0dLX+678l0u5V7JPV9RjdCg==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fb1386 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vhJ3zGrnDZR7MPKpnW0A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 9FTDPXjHKEME9mQrlw4jCW0tgcQf1rgG
X-Proofpoint-ORIG-GUID: 9FTDPXjHKEME9mQrlw4jCW0tgcQf1rgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
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

On Thu, Oct 23, 2025 at 03:14:00PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 04:06:03PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add support for Kaanapali platform SSPP sub-blocks, which
> > introduce structural changes including register additions,
> > removals, and relocations. Add the new common and rectangle
> > blocks, and update register definitions and handling to
> > ensure compatibility with DPU v13.0.
> 
> Merge new structures into this patch.
OK will adjust patch.


> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 474 +++++++++++++++++++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  23 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |   4 +
> >  3 files changed, 483 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index 6f1fc790ad6d..7217c952f01c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -17,6 +17,7 @@
> >  
> >  #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
> >  
> > +/* <= v12 DPU */
> >  /* SSPP registers */
> >  #define SSPP_SRC_SIZE                      0x00
> >  #define SSPP_SRC_XY                        0x08
> > @@ -74,12 +75,116 @@
> >  #define SSPP_EXCL_REC_XY                   0x1B8
> >  #define SSPP_CLK_CTRL                      0x330
> >  
> > +/* >= v13 DPU */
> > +/* CMN Registers -> Source Surface Processing Pipe Common SSPP registers */
> > +/*      Name                                        Offset */
> > +#define SSPP_CMN_CLK_CTRL                0x0
> > +#define SSPP_CMN_CLK_STATUS              0x4
> > +#define SSPP_CMN_MULTI_REC_OP_MODE       0x10
> > +#define SSPP_CMN_ADDR_CONFIG             0x14
> > +#define SSPP_CMN_CAC_CTRL                0x20
> > +#define SSPP_CMN_SYS_CACHE_MODE          0x24
> > +#define SSPP_CMN_QOS_CTRL                0x28
> > +#define SSPP_CMN_DANGER_LUT              0x2C
> > +#define SSPP_CMN_SAFE_LUT                0x30
> 
> lowercase hex.
OK will fix

> 
> > @@ -141,6 +246,12 @@
> >  /* traffic shaper clock in Hz */
> >  #define TS_CLK			19200000
> >  
> > +static inline u32 _sspp_calculate_rect_off(enum dpu_sspp_multirect_index rect_index,
> > +					   struct dpu_hw_sspp *ctx)
> > +{
> > +	return (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) ?
> > +			ctx->cap->sblk->sspp_rec0_blk.base : ctx->cap->sblk->sspp_rec1_blk.base;
> > +}
> >  
> >  static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
> >  {
> > @@ -169,6 +280,34 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
> >  	DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE, mode_mask);
> >  }
> >  
> > +static void dpu_hw_sspp_setup_multirect_v13(struct dpu_sw_pipe *pipe)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	u32 offset = ctx->cap->sblk->cmn_blk.base;
> > +	u32 mode_mask;
> > +
> > +	if (!ctx)
> > +		return;
> > +
> > +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> > +		/**
> > +		 * if rect index is RECT_SOLO, we cannot expect a
> > +		 * virtual plane sharing the same SSPP id. So we go
> > +		 * and disable multirect
> > +		 */
> > +		mode_mask = 0;
> > +	} else {
> > +		mode_mask = DPU_REG_READ(&ctx->hw, offset + SSPP_CMN_MULTI_REC_OP_MODE);
> > +		mode_mask |= pipe->multirect_index;
> > +		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
> > +			mode_mask |= BIT(2);
> > +		else
> > +			mode_mask &= ~BIT(2);
> > +	}
> > +
> > +	DPU_REG_WRITE(&ctx->hw, offset + SSPP_CMN_MULTI_REC_OP_MODE, mode_mask);
> > +}
> > +
> >  static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
> >  		u32 mask, u8 en)
> >  {
> > @@ -328,6 +467,119 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
> >  }
> >  
> > +static void dpu_hw_sspp_setup_format_v13(struct dpu_sw_pipe *pipe,
> > +		const struct msm_format *fmt, u32 flags)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	struct dpu_hw_blk_reg_map *c;
> > +	u32 chroma_samp, unpack, src_format;
> > +	u32 opmode = 0;
> > +	u32 fast_clear = 0;
> > +	u32 offset;
> > +
> > +	if (!ctx || !fmt)
> > +		return;
> > +
> > +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> > +
> > +	c = &ctx->hw;
> > +
> > +	opmode = DPU_REG_READ(c, offset + SSPP_REC_SRC_OP_MODE);
> > +	opmode &= ~(MDSS_MDP_OP_FLIP_LR | MDSS_MDP_OP_FLIP_UD |
> > +			MDSS_MDP_OP_BWC_EN | MDSS_MDP_OP_PE_OVERRIDE
> > +			| MDSS_MDP_OP_ROT_90);
> > +
> > +	if (flags & DPU_SSPP_FLIP_LR)
> > +		opmode |= MDSS_MDP_OP_FLIP_LR;
> > +	if (flags & DPU_SSPP_FLIP_UD)
> > +		opmode |= MDSS_MDP_OP_FLIP_UD;
> > +	if (flags & DPU_SSPP_ROT_90)
> > +		opmode |= MDSS_MDP_OP_ROT_90;
> > +
> > +	chroma_samp = fmt->chroma_sample;
> > +	if (flags & DPU_SSPP_SOURCE_ROTATED_90) {
> > +		if (chroma_samp == CHROMA_H2V1)
> > +			chroma_samp = CHROMA_H1V2;
> > +		else if (chroma_samp == CHROMA_H1V2)
> > +			chroma_samp = CHROMA_H2V1;
> > +	}
> > +
> > +	src_format = (chroma_samp << 23) | (fmt->fetch_type << 19) |
> > +		(fmt->bpc_a << 6) | (fmt->bpc_r_cr << 4) |
> > +		(fmt->bpc_b_cb << 2) | (fmt->bpc_g_y << 0);
> > +
> > +	if (flags & DPU_SSPP_ROT_90)
> > +		src_format |= BIT(11); /* ROT90 */
> > +
> > +	if (fmt->alpha_enable && fmt->fetch_type == MDP_PLANE_INTERLEAVED)
> > +		src_format |= BIT(8); /* SRCC3_EN */
> > +
> > +	if (flags & DPU_SSPP_SOLID_FILL)
> > +		src_format |= BIT(22);
> > +
> > +	unpack = (fmt->element[3] << 24) | (fmt->element[2] << 16) |
> > +		(fmt->element[1] << 8) | (fmt->element[0] << 0);
> > +	src_format |= ((fmt->unpack_count - 1) << 12) |
> > +		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT ? 1 : 0) << 17) |
> > +		((fmt->flags & MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB ? 1 : 0) << 18) |
> > +		((fmt->bpp - 1) << 9);
> > +
> > +	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
> > +		if (MSM_FORMAT_IS_UBWC(fmt))
> > +			opmode |= MDSS_MDP_OP_BWC_EN;
> > +		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
> > +		switch (ctx->ubwc->ubwc_enc_version) {
> > +		case UBWC_1_0:
> > +			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > +			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
> > +				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > +				      BIT(8) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> > +			break;
> > +		case UBWC_2_0:
> > +			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > +			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
> > +				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> > +			break;
> > +		case UBWC_3_0:
> > +			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
> > +				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> > +			break;
> > +		case UBWC_4_0:
> > +			DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_STATIC_CTRL,
> > +				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > +			break;
> > +		}
> > +	}
> > +
> > +	opmode |= MDSS_MDP_OP_PE_OVERRIDE;
> > +
> > +	/* if this is YUV pixel format, enable CSC */
> > +	if (MSM_FORMAT_IS_YUV(fmt))
> > +		src_format |= BIT(15);
> > +
> > +	if (MSM_FORMAT_IS_DX(fmt))
> > +		src_format |= BIT(14);
> > +
> > +	/* update scaler opmode, if appropriate */
> > +	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
> > +		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > +				   MSM_FORMAT_IS_YUV(fmt));
> > +	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
> > +		_sspp_setup_csc10_opmode(ctx,
> > +					 VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > +					 MSM_FORMAT_IS_YUV(fmt));
> 
> This function is a nice c&p of the old one. Can we abstract it at least
> a bit and let it be shared between the old code and the new one?
OK, I will try to abstract some common code into a function.


> > +
> > +	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_FORMAT, src_format);
> > +	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_UNPACK_PATTERN, unpack);
> > +	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_OP_MODE, opmode);
> > +
> > +	/* clear previous UBWC error */
> > +	DPU_REG_WRITE(c, offset + SSPP_REC_UBWC_ERROR_STATUS, BIT(31));
> > +}
> > +
> >  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> >  		struct dpu_hw_pixel_ext *pe_ext)
> >  {
> > @@ -385,6 +637,53 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> >  			tot_req_pixels[3]);
> >  }
> >  
> > +static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
> > +		struct dpu_hw_pixel_ext *pe_ext)
> > +{
> > +	struct dpu_hw_blk_reg_map *c;
> > +	u8 color;
> > +	u32 lr_pe[4], tb_pe[4], tot_req_pixels[4];
> > +	const u32 bytemask = 0xff;
> > +	const u32 shortmask = 0xffff;
> > +	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
> > +
> > +	if (!ctx || !pe_ext)
> > +		return;
> > +
> > +	c = &ctx->hw;
> > +	/* program SW pixel extension override for all pipes*/
> > +	for (color = 0; color < DPU_MAX_PLANES; color++) {
> > +		/* color 2 has the same set of registers as color 1 */
> > +		if (color == 2)
> > +			continue;
> > +
> > +		lr_pe[color] = ((pe_ext->right_ftch[color] & bytemask) << 24) |
> > +			       ((pe_ext->right_rpt[color] & bytemask) << 16) |
> > +			       ((pe_ext->left_ftch[color] & bytemask) << 8) |
> > +			       (pe_ext->left_rpt[color] & bytemask);
> > +
> > +		tb_pe[color] = ((pe_ext->btm_ftch[color] & bytemask) << 24) |
> > +			       ((pe_ext->btm_rpt[color] & bytemask) << 16) |
> > +			       ((pe_ext->top_ftch[color] & bytemask) << 8) |
> > +			       (pe_ext->top_rpt[color] & bytemask);
> > +
> > +		tot_req_pixels[color] = (((pe_ext->roi_h[color] +
> > +			pe_ext->num_ext_pxls_top[color] +
> > +			pe_ext->num_ext_pxls_btm[color]) & shortmask) << 16) |
> > +			((pe_ext->roi_w[color] +
> > +			pe_ext->num_ext_pxls_left[color] +
> > +			pe_ext->num_ext_pxls_right[color]) & shortmask);
> > +	}
> 
> Same comment. No C&P, of a sensible code, please.
OK, will do. Thanks 

> > +
> > +	/* color 0 */
> > +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR + offset, lr_pe[0]);
> > +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB + offset, tb_pe[0]);
> > +
> > +	/* color 1 and color 2 */
> > +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR_ODX + offset, lr_pe[1]);
> > +	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB_ODX + offset, tb_pe[1]);
> > +}
> > +
> >  static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> >  		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> >  		const struct msm_format *format)
> > @@ -443,6 +742,36 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
> >  	DPU_REG_WRITE(c, out_xy_off, dst_xy);
> >  }
> >  
> > +static void dpu_hw_sspp_setup_rects_v13(struct dpu_sw_pipe *pipe,
> > +					struct dpu_sw_pipe_cfg *cfg)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	struct dpu_hw_blk_reg_map *c;
> > +	u32 src_size, src_xy, dst_size, dst_xy;
> > +	u32 offset;
> > +
> > +	if (!ctx || !cfg)
> > +		return;
> > +
> > +	c = &ctx->hw;
> > +
> > +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> > +
> > +	/* src and dest rect programming */
> > +	src_xy = (cfg->src_rect.y1 << 16) | cfg->src_rect.x1;
> > +	src_size = (drm_rect_height(&cfg->src_rect) << 16) |
> > +		   drm_rect_width(&cfg->src_rect);
> > +	dst_xy = (cfg->dst_rect.y1 << 16) | cfg->dst_rect.x1;
> > +	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
> > +		drm_rect_width(&cfg->dst_rect);
> > +
> > +	/* rectangle register programming */
> > +	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_SIZE, src_size);
> > +	DPU_REG_WRITE(c, offset + SSPP_REC_SRC_XY, src_xy);
> > +	DPU_REG_WRITE(c, offset + SSPP_REC_OUT_SIZE, dst_size);
> > +	DPU_REG_WRITE(c, offset + SSPP_REC_OUT_XY, dst_xy);
> > +}
> > +
> >  static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> >  		struct dpu_hw_fmt_layout *layout)
> >  {
> > @@ -497,6 +826,29 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> >  	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1, ystride1);
> >  }
> >  
> > +static void dpu_hw_sspp_setup_sourceaddress_v13(struct dpu_sw_pipe *pipe,
> > +						struct dpu_hw_fmt_layout *layout)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	int i;
> > +	u32 addr, ystride0, ystride1;
> > +
> > +	if (!ctx)
> > +		return;
> > +
> > +	addr = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
> > +		DPU_REG_WRITE(&ctx->hw, addr + SSPP_REC_SRC0_ADDR + i * 0x4,
> > +			      layout->plane_addr[i]);
> > +
> > +	ystride0 = (layout->plane_pitch[0]) | (layout->plane_pitch[2] << 16);
> > +	ystride1 = (layout->plane_pitch[1]) | (layout->plane_pitch[3] << 16);
> > +
> > +	DPU_REG_WRITE(&ctx->hw, addr + SSPP_REC_SRC_YSTRIDE0, ystride0);
> > +	DPU_REG_WRITE(&ctx->hw, addr + SSPP_REC_SRC_YSTRIDE1, ystride1);
> > +}
> > +
> >  static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> >  		const struct dpu_csc_cfg *data)
> >  {
> > @@ -536,6 +888,24 @@ static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
> >  				color);
> >  }
> >  
> > +static void dpu_hw_sspp_setup_solidfill_v13(struct dpu_sw_pipe *pipe, u32 color)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	struct dpu_hw_fmt_layout cfg;
> > +	u32 offset;
> > +
> > +	if (!ctx)
> > +		return;
> > +
> > +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> > +
> > +	/* cleanup source addresses */
> > +	memset(&cfg, 0, sizeof(cfg));
> > +	ctx->ops.setup_sourceaddress(pipe, &cfg);
> > +
> > +	DPU_REG_WRITE(&ctx->hw, offset + SSPP_REC_SRC_CONSTANT_COLOR, color);
> > +}
> > +
> >  static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
> >  				      struct dpu_hw_qos_cfg *cfg)
> >  {
> > @@ -547,6 +917,17 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
> >  			      cfg);
> >  }
> >  
> > +static void dpu_hw_sspp_setup_qos_lut_v13(struct dpu_hw_sspp *ctx,
> > +					  struct dpu_hw_qos_cfg *cfg)
> > +{
> > +	if (!ctx || !cfg)
> > +		return;
> > +
> > +	_dpu_hw_setup_qos_lut_v13(&ctx->hw, 0,
> > +				  ctx->mdss_ver->core_major_ver >= 4,
> 
> This is v13, of course it is >= 4.
OK will fix.


> > +				  cfg);
> > +}
> > +
> >  static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
> >  				       bool danger_safe_en)
> >  {
> > @@ -557,6 +938,16 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
> >  		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
> >  }
> >  
> > +static void dpu_hw_sspp_setup_qos_ctrl_v13(struct dpu_hw_sspp *ctx,
> > +					   bool danger_safe_en)
> > +{
> > +	if (!ctx)
> > +		return;
> > +
> > +	DPU_REG_WRITE(&ctx->hw, SSPP_CMN_QOS_CTRL,
> > +		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
> > +}
> > +
> >  static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
> >  				  const struct msm_format *fmt,
> >  				  bool enable)
> > @@ -576,6 +967,20 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
> >  	dpu_setup_cdp(&ctx->hw, cdp_cntl_offset, fmt, enable);
> >  }
> >  
> > +static void dpu_hw_sspp_setup_cdp_v13(struct dpu_sw_pipe *pipe,
> > +				      const struct msm_format *fmt,
> > +				      bool enable)
> > +{
> > +	struct dpu_hw_sspp *ctx = pipe->sspp;
> > +	u32 offset = 0;
> > +
> > +	if (!ctx)
> > +		return;
> > +
> > +	offset = _sspp_calculate_rect_off(pipe->multirect_index, ctx);
> > +	dpu_setup_cdp(&ctx->hw, offset + SSPP_REC_CDP_CNTL, fmt, enable);
> > +}
> > +
> >  static bool dpu_hw_sspp_setup_clk_force_ctrl(struct dpu_hw_sspp *ctx, bool enable)
> >  {
> >  	static const struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
> > @@ -586,36 +991,69 @@ static bool dpu_hw_sspp_setup_clk_force_ctrl(struct dpu_hw_sspp *ctx, bool enabl
> >  	return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
> >  }
> >  
> > +static bool dpu_hw_sspp_setup_clk_force_ctrl_v13(struct dpu_hw_sspp *ctx, bool enable)
> > +{
> > +	static const struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
> > +		.reg_off = SSPP_CMN_CLK_CTRL,
> > +		.bit_off = 0
> > +	};
> > +
> > +	return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
> > +}
> > +
> >  static void _setup_layer_ops(struct dpu_hw_sspp *c,
> >  		unsigned long features, const struct dpu_mdss_version *mdss_rev)
> >  {
> > -	c->ops.setup_format = dpu_hw_sspp_setup_format;
> > -	c->ops.setup_rects = dpu_hw_sspp_setup_rects;
> > -	c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress;
> > -	c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill;
> > -	c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
> > -
> > -	if (test_bit(DPU_SSPP_QOS, &features)) {
> > -		c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut;
> > -		c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl;
> > +	if (mdss_rev->core_major_ver >= 13) {
> > +		c->ops.setup_format = dpu_hw_sspp_setup_format_v13;
> > +		c->ops.setup_rects = dpu_hw_sspp_setup_rects_v13;
> > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > +
> > +		if (test_bit(DPU_SSPP_QOS, &features)) {
> > +			c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut_v13;
> > +			c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl_v13;
> > +		}
> > +
> > +		if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
> > +		    test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> > +			c->ops.setup_multirect = dpu_hw_sspp_setup_multirect_v13;
> > +
> > +		if (test_bit(DPU_SSPP_CDP, &features))
> > +			c->ops.setup_cdp = dpu_hw_sspp_setup_cdp_v13;
> > +
> > +		c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl_v13;
> > +	} else {
> > +		c->ops.setup_format = dpu_hw_sspp_setup_format;
> > +		c->ops.setup_rects = dpu_hw_sspp_setup_rects;
> > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress;
> > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill;
> > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config;
> > +
> > +		if (test_bit(DPU_SSPP_QOS, &features)) {
> > +			c->ops.setup_qos_lut = dpu_hw_sspp_setup_qos_lut;
> > +			c->ops.setup_qos_ctrl = dpu_hw_sspp_setup_qos_ctrl;
> > +		}
> > +
> > +		if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
> > +		    test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> > +			c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
> > +
> > +		if (test_bit(DPU_SSPP_CDP, &features))
> > +			c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
> > +
> > +		if (mdss_rev->core_major_ver >= 9)
> > +			c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl;
> >  	}
> >  
> >  	if (test_bit(DPU_SSPP_CSC, &features) ||
> >  		test_bit(DPU_SSPP_CSC_10BIT, &features))
> >  		c->ops.setup_csc = dpu_hw_sspp_setup_csc;
> >  
> > -	if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
> > -		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> > -		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
> > -
> >  	if (test_bit(DPU_SSPP_SCALER_QSEED3_COMPATIBLE, &features))
> >  		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
> 
> If the only common items are CSC and scaler (and both are already pretty
> abstracted), please don't squash it in the same old file. Create new
> file for the new hardware block (like we did for DSC 1.1 vs 1.2).
Yes, I agree. My original idea is to make a file named dpu_hw_sspp_v13.c to include
all DPU version 13 SSPP change. Will do it in next patch.


> >  
> > -	if (test_bit(DPU_SSPP_CDP, &features))
> > -		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
> > -
> > -	if (mdss_rev->core_major_ver >= 9)
> > -		c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl;
> >  }
> >  
> >  #ifdef CONFIG_DEBUG_FS
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> > index 486be346d40d..1acf456c425b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> > @@ -81,6 +81,13 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
> >  #define QOS_CREQ_LUT_0                    0x14
> >  #define QOS_CREQ_LUT_1                    0x18
> >  
> > +/* CMN_QOS_LUT */
> > +#define SSPP_CMN_DANGER_LUT                    0x2C
> > +#define SSPP_CMN_SAFE_LUT                      0x30
> > +#define SSPP_CMN_CREQ_LUT_0                    0x34
> > +#define SSPP_CMN_CREQ_LUT_1                    0x38
> > +#define SSPP_CMN_QOS_CTRL	                    0x28
> 
> Lowercase hex, sort by the address.
OK will fix

> > +
> >  /* QOS_QOS_CTRL */
> >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > @@ -475,6 +482,22 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> >  }
> >  
> > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c, u32 offset,
> > +			       bool qos_8lvl,
> > +			       const struct dpu_hw_qos_cfg *cfg)
> > +{
> > +	DPU_REG_WRITE(c, offset + SSPP_CMN_DANGER_LUT, cfg->danger_lut);
> > +	DPU_REG_WRITE(c, offset + SSPP_CMN_SAFE_LUT, cfg->safe_lut);
> > +
> > +	if (qos_8lvl) {
> > +		DPU_REG_WRITE(c, offset + SSPP_CMN_CREQ_LUT_0, cfg->creq_lut);
> > +		DPU_REG_WRITE(c, offset + SSPP_CMN_CREQ_LUT_1, cfg->creq_lut >> 32);
> > +	}
> > +
> > +	DPU_REG_WRITE(c, offset + SSPP_CMN_QOS_CTRL,
> > +		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > +}
> > +
> >  /*
> >   * note: Aside from encoders, input_sel should be set to 0x0 by default
> >   */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> > index 67b08e99335d..9d442d6fc11c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> > @@ -360,6 +360,10 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> >  			   bool qos_8lvl,
> >  			   const struct dpu_hw_qos_cfg *cfg);
> >  
> > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c, u32 offset,
> > +			       bool qos_8lvl,
> > +			       const struct dpu_hw_qos_cfg *cfg);
> > +
> >  void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
> >  		u32 misr_ctrl_offset, u8 input_sel);
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie
