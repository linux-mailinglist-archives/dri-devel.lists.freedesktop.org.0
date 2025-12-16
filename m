Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91CDCC1359
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 07:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6E610E6F1;
	Tue, 16 Dec 2025 06:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cvvn/6aS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtiMkTNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9246510E6EA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 06:56:45 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BG2mbtI1682298
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 06:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Qq0o/o5mq7+GYYh0mZ6Yhmwi
 FC0Spd5O2WRdpBvbVAI=; b=Cvvn/6aS1fWlxEEenRLUS0s4I9haInDuEiH/qQP+
 DHHdpTokI1Bjix2M41K+4n/kuHof0RYJEaiDWN0boqNGbuNlEoOqEY/4btGilgKc
 /lvXq1YUK6gS9O7ImNI4aLBe0UEPnyPGA+mwz9BMBaDjYZeZcnEWG+klsgbfK/qi
 L3rhpJ6IWn7Y3bOiNX3cYwe4XwM1bOgXW+j1HASZwr4QjYN8d7YSdpFYsLAY9uDq
 533/1SOY9NF97G8ZUVQq5vC5otJmmN4haDqDE7RF3UsNCXIZ7Esb27vIhqSQ7jOW
 HOoP3pSuEU968uigP1iGmKEzmkoyUxsePTDURK0HYrVN5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2q7tjfk7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 06:56:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b22d590227so629199785a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 22:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765868204; x=1766473004;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qq0o/o5mq7+GYYh0mZ6YhmwiFC0Spd5O2WRdpBvbVAI=;
 b=FtiMkTNh6ArubwuP/AsUGIx54QY4sBHWXhxc8CVeI1EBIaMiFBWa9t3hwBFNB3dZmm
 A1HyB0oWdAk4z/tjwBYNOTLLEpOTVEtkKs1rdUx7mUqJevkodqn9UucU2BD/dWyXeOwk
 sGlpBdDOKzbyVYmr0pVRUDN5PmUhkObhv4ANtJxoKxid3kDQ1gS+tGmsMTfcqIA7WZWG
 v1o8/feUVgbL7mCA1mpS4aGvKLEzO/vW7JJ8SByTKcZWrG2BIo2RelpUE82v40Mpqo+3
 EhXZ45TbktR4/B01U1vcCju06+XtehhBSc1I2IfNgOW1Rcj9i3J1xPeURCdjoomm1kKv
 XFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765868204; x=1766473004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qq0o/o5mq7+GYYh0mZ6YhmwiFC0Spd5O2WRdpBvbVAI=;
 b=RHnwatC2Qeos19biTGazVo/ZudEIZTVt6P39PvLZJIq31eSRtdZa7oCr0D1rn1FCGP
 KJ8ZbJjD3lHWFpzjLOx04MXhTOkk4Eet4XxwX1fis7Sfy08EbGHCjMQUtTXB5N8y66e4
 4IehVIMNa5DZpT834eKhzWO4Q5srvKBCBiSWF+trHG+V4J7yKnBW2yGOYbrAWY/pQvi2
 ZgEd3K2LAHPXf2/TbKi5betiNy47OdcXx+R7e5nT3y6iNuGdA00BNwUcfY3WrJ/9CY53
 wWYz7FXhU+wTcECJRorQQp3ICVErTXmkPrNpBFIJSM1jfQhJd4etqwKvBCsISYvHUp3/
 +PNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbCISR9IMN26ZOZcMWVpmm/fYMfAaJ3L+zftId7psx1l+sFjIsdD+RHj3a+I82DRBWP5UJrOhQCV0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi/+mZX+cYABN3x64BP/lLuIgL1aBff28wkYfUCagQqBawHEvg
 Vdcdt5vBUgIY6Km/f3mq8nuqd8Rq6avgEp3wMYt2AD7NafbEIaeT2BhK4RNydMAJiP+EuCQdqRp
 x8w3DUzkpBui8s3Hwgc+Wstck9MHLKebgBod7tXYPVcpDIctfmPekSPYkTe09sQ69Vu0K4Pk=
X-Gm-Gg: AY/fxX7zdEML8cGOMTbJULqqOLjaEwhTscL2jmtcGFU0TjQswgIWl8iAiW62unXHGoa
 nMrh2zrYxZqwjCQ2a32MUf++BjUdk5x3wOVaZKw3YtqI+DhlMp044bwz4+O3WbEsBMAWNsnLeKt
 p4lBt/l6Q36ErliGlumriE5f59pYYwXjnxv2TCo0iBxaYBF7w3njx7a8af9svLMjgilZ6yPXVB5
 6xkN3PMkGeAePrbs1ikM/SNt8NYbqNgwp241QumFr8Olo86LeCzPqEp0Px/iDAWBmui+4hL+J4i
 7UVO570OjM/mxaM+obuLRQ+zN6/iHsHyOObb2XG8dVBg+l13JLf1XAG3OhqTNzOiCeWhVQa00J+
 7UrmhTRFtpe6NbGyKBUV3836/f5MBsJplHGbL2lvCaPrHmPQEmsXoGZgy5yeFRInW/7GeNBg=
X-Received: by 2002:a05:620a:472c:b0:8b2:e469:39e8 with SMTP id
 af79cd13be357-8bb3a24892amr1820306485a.42.1765868203471; 
 Mon, 15 Dec 2025 22:56:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2K7PBJaFBU9kaEhxjqCZE/yPyO7uDfeLt4ijLUUf+oDfLGzKbgQUNi501dluGkE3z4Y2BZg==
X-Received: by 2002:a05:620a:472c:b0:8b2:e469:39e8 with SMTP id
 af79cd13be357-8bb3a24892amr1820303485a.42.1765868203010; 
 Mon, 15 Dec 2025 22:56:43 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8be31c75b45sm123526485a.52.2025.12.15.22.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 22:56:42 -0800 (PST)
Date: Tue, 16 Dec 2025 14:56:31 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <aUECnz+INNuLjHR6@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-11-yuanjie.yang@oss.qualcomm.com>
 <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
X-Proofpoint-GUID: WbrmJrKMwnTYJyFcXRcg7WgD-ot13o72
X-Proofpoint-ORIG-GUID: WbrmJrKMwnTYJyFcXRcg7WgD-ot13o72
X-Authority-Analysis: v=2.4 cv=Qo1THFyd c=1 sm=1 tr=0 ts=694102ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PnxoWNhBm_jaqvFsFIIA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1NiBTYWx0ZWRfX+RDacGjfQgf/
 NAuaNtAkUsnXCl+NmcL84+GnvnjLOeJniKEQPmLs5ACA3GvuoJPUFWWOHPTFbI0kqq3T7N5njXm
 eoK62Pfl9PZ33W/nxb+UiJatVp5mwau4GtvxQHo9Dc1r+ScW3t8O0fk/pxNcKFNzSGLRZAhp9Yo
 ib4cqo3lZJ1iX/GG8esClkIhCXuzUAJ4+RJDIWgnjPPMiuPQhkLFaoBcFsTMtq6FLvX9c48KxUI
 J7W7O4khH3jM6CzX2wCPpbe6l01C0JztFkc9muL/gRz3GdRAfQMOCDfrzqrDqWJXQKTeA5imqWV
 NuQRJdHSXTo0UKFbQ7iu0Yj9wT26cF2FEq/N/k/d0LHJV3/w+Onh7qiEekXGfybYJnJwHfwQWAc
 TjlokaWyaNZKhLprB9482HUBg5q+3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160056
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

On Mon, Dec 15, 2025 at 10:08:22PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 15, 2025 at 04:38:53PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > DPU version 13.0.0 introduces structural changes including
> > register additions, removals, and relocations.
> > 
> > Refactor SSPP-related code to be compatible with DPU 13.0.0
> > modifications.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> 
> We've fixed the order of the interrupts patch. Now you are adding SSPP
> customization for 13.x _after_ adding the first 13.x support. Is that
> supposed to work?

Yes, will reorganize order.

 
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 155 ++++++++++--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 ++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> >  6 files changed, 191 insertions(+), 69 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >  		switch (ctx->ubwc->ubwc_enc_version) {
> >  		case UBWC_1_0:
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > -					BIT(8) |
> > -					(ctx->ubwc->highest_bank_bit << 4));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > +				      BIT(8) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> 
> I have asked to drop unrelated changes. You didn't. Why? You are
> changing whitespaces for no reason. It's just a noise which hides the
> actual change here.

here ubwc reg layout change in DPU 13.

ubwc_ctrl_off
veriosn < 13 
reg: SSPP_UBWC_STATIC_CTRL
verison >= 13 
reg: SSPP_REC_UBWC_STATIC_CTRL

So I do some fix.

> >  			break;
> >  		case UBWC_2_0:
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > -					(ctx->ubwc->highest_bank_bit << 4));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> >  			break;
> >  		case UBWC_3_0:
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > -					(ctx->ubwc->highest_bank_bit << 4));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > +				     (ctx->ubwc->highest_bank_bit << 4));
> >  			break;
> >  		case UBWC_4_0:
> > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > +				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> >  			break;
> >  		}
> >  	}
> > @@ -313,19 +337,18 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  
> >  	/* update scaler opmode, if appropriate */
> >  	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
> > -		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > -			MSM_FORMAT_IS_YUV(fmt));
> > +		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > +					 MSM_FORMAT_IS_YUV(fmt));
> >  	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
> > -		_sspp_setup_csc10_opmode(ctx,
> > -			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > -			MSM_FORMAT_IS_YUV(fmt));
> > +		dpu_hw_sspp_setup_csc10_opmode(ctx,
> > +					       VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > +					       MSM_FORMAT_IS_YUV(fmt));
> 
> Again, useless whitespace changes.
checkpatch.pl says here is alignment issuse, so I do this fix.

> >  
> >  	DPU_REG_WRITE(c, format_off, src_format);
> >  	DPU_REG_WRITE(c, unpack_pat_off, unpack);
> >  	DPU_REG_WRITE(c, op_mode_off, opmode);
> > -
> 
> Why?

yes, will drop "-" diff.

> >  	/* clear previous UBWC error */
> > -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
> > +	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
> >  }
> >  
> >  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > @@ -385,9 +408,9 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> >  			tot_req_pixels[3]);
> >  }
> >  
> > -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > -		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > -		const struct msm_format *format)
> > +void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > +			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > +			       const struct msm_format *format)
> 
> And here...
checkpatch.pl says here is alignment issuse, so I do this fix.



Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry
