Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25008D3A6CA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 12:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9014A10E3FB;
	Mon, 19 Jan 2026 11:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MM31kRt3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9cgcpGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1CE10E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:27:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JA7Uur597645
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YuV0fhRi68aQUo3arYwp0jdp
 xbF2bng4GId0KIEDBMo=; b=MM31kRt3LRCi0X7MXfkvoUzuW5Liia/0wuqyKjRd
 DtQtHzrFoi/UEj7kkpM7mAzCrJusM/zWH1Tj0dWBfytE20pUGuEBZwaTeXswbi4c
 2FcrQc/SLI8t2c1CYZvQqrO2lw3zXD5azw0zvZAGH/GRauFlrpSuGtGV3ipQ7v3L
 DPr2iIrYqVgbaeDFZc1TvBF/K/+ddPQhW3sWEdcZBSIzCFnf1DDG0OhOje4uWUAi
 2simUt6wBA10a/EiOSZ/5SdO83wsoM89a/jMojHGfpcClZsZdHGP65Lyk+MRaGzZ
 +LFcMPRhY9nixmu7gUGK0ePgx0j/7W6G2ODlmj71XgjtYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7g820-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:27:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c5311864d9so903310085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768822063; x=1769426863;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YuV0fhRi68aQUo3arYwp0jdpxbF2bng4GId0KIEDBMo=;
 b=e9cgcpGEGTnbWhiXR/6PDfiZ4kNLbk4qGAXXJDZuCKobdfRl7U2u6Yg6sorsGFBfUO
 j1ZxzZohtHGyShl5QBKiIPwxnj2jhu0COF4TBbnyJ/ECA+baJdOvdcBRktyh9Q+wOAhJ
 702mp1rW/tC5Ild7Bh9uQL9h91oDVAtYQT/c3DsNJ3Wkbm8B9eJn1QtN2pp6+RKvwNrC
 u+VRERBUsI5Fk/CkJF0fGNTSfpknQrvC2BEBWVkvYLDlx+5Gpvl7ZxNjvuGoqr35iNjG
 Um2ehnf6YSzFTLolxZItUh/f5t3x1To1tM58QT2yFOh2wkDoc6Dp9373q9HYYs6aMvCj
 Ha8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768822063; x=1769426863;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YuV0fhRi68aQUo3arYwp0jdpxbF2bng4GId0KIEDBMo=;
 b=NoD0F1+uNqc/NtpHtphNb4q5XPtb6lWo5nsxwQ37wSyHV+anUYNZ+21qbFnYAKtY6c
 YEfj/tgHBty9/zEVefX8L3AYh9EXNltIc4ZejGBAD55iQIpcKaHBYGOhtD1qsB3aRzpt
 S8MmJPNyzS9Iqf1RDJjztE6oIToL6DxUv0VQZvX3R/81/6X+b7XlvdEAlhyqugc1Dd48
 AlV2hr9RMyBKoqBU0NkCwXm3T4Um/JRfEx/YT1X9tpH7UKnBpAFrvwHo8uHcKL7BtWzK
 pse6PchAVbIg96Ch70pyawVMzeVR9Cg24FMULGOKNmB/ibaHzT+j61mxSJvT6fPBqi68
 hEdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAGhGULImJ0XbQgWbHfwbV5ZM+8S23ks6/fUW7wrpJpqJWR68jjj2D1adcIPnC/BmZ4lljTYQhvrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq6kvXm53mZAHRzy/GDVg792Z+43Wm3xd46swDoAmVi0JVWHqM
 nm2726rvC42O9MeT6uBu4kSwGNEL6qsSMVx2Ma/gvxn10ZmLnACchrXtqUC//W7uJBKKks8MlrP
 Ap9r6Pm0j/lWVFlw/1CjWoWLipFA0BtcBNRYIhgR9gMki8WQMtE6x+T4xvtGfffp9EA0Aswo=
X-Gm-Gg: AY/fxX5RDMGAF8QlgoIoF3zdusJR5XaXpRKh/R/BQ6mKiBpT/6+KiTTvuy6llDFE4BQ
 eatMLSZRLkCc2DVRqZrsLaJ7uyTC6EnXTae7MD4QvNw8OwYgfXnjNN+sKRy633WX3G6XpTI1gtT
 atrQ5Og159WC8HZHI3wLabvlcJLCJqeySbz3bovtTo9k64bLoBM4+0HjJe+vc9SAOyJ/JItYfru
 1soNLuKSqi8ifb5Zi8TrQhtb1CW06iWvKa5UbTjmMTANY2Sq/iOu/OX88nWvOp7mh1lnYwMZ+eR
 iOFe5Cu5GE3P4IraUsU99O2lwH8b7uJkDlAs3O7JLBhaojpKOZZkumpn8H7hG3j1WFcXNqrroK2
 LQh09R+RWtP9ZEXtgpu9svAI5x//nWqtWW/xf+byekZnrjNuOuJtZFWvL2up1aVyM+GxegJDCmG
 YEaXC4nN3B+8Z2mkd4D9i99RI=
X-Received: by 2002:a05:620a:4492:b0:8b2:76c6:a7ae with SMTP id
 af79cd13be357-8c6a67703f7mr1563567985a.50.1768822063437; 
 Mon, 19 Jan 2026 03:27:43 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8b2:76c6:a7ae with SMTP id
 af79cd13be357-8c6a67703f7mr1563564785a.50.1768822062959; 
 Mon, 19 Jan 2026 03:27:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf33ed36sm3270117e87.18.2026.01.19.03.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 03:27:42 -0800 (PST)
Date: Mon, 19 Jan 2026 13:27:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL
 programming on UBWC 5.x+
Message-ID: <fnlkcpf4dfgcy4cshl6g3ibjoon7pvdxyvmejokqygfyc2b2v3@og2xzf6fzuhj>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-4-34aaa672c829@oss.qualcomm.com>
 <4cc944b3-8a41-45a2-95c8-c55dbcbf0830@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cc944b3-8a41-45a2-95c8-c55dbcbf0830@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX5q3fCxP3olxZ
 WQJxXvzVUUaS8In0PBKwhZdZpWcxKngPjdpod3V9H84h1WuBZfBogWCoV7wq7fBKEAG22sxSvZl
 /XJEJlGHgHg0JYOw1UkAk02nP5i7VxodBvfFc9RBFb/vlaq5HhgT64YQNHQvoYXL8kVdFRfgZfD
 OP+6Q3IIYNVTB3n6VQ8jTc0Pzc6qxkhyvX7kn1twv6/v+bg66d0PbRULHdc7l8bsJgGY4gYf9oB
 WN+gJP/o6IELUkV/TWkl74ZZucZtyRqaVrQvcxve5c9NlYcoLV6SMTV7LiMXikFOvURV8e3vjFX
 sBy4Xua8xhrfJeuFAy4ZdMpv7dNjfNYSg1ii2/G4HRJ4TVdN3BfjQVFWGM/XtsJZiIgASt3oUrB
 vg98GON41eNHg1+LYb5s86SYVsF78ZwzzBPfVNo6fQh0IU32jkUns1dCfqVOazdTnJM+VyKQNy6
 c+f8D6hQEjXFpPuZQ8w==
X-Proofpoint-ORIG-GUID: w7t7XTWdrQ4LJuExBFmSvlEbYi0tumsg
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e1530 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_JD9MDjJDg31YIc5yKYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: w7t7XTWdrQ4LJuExBFmSvlEbYi0tumsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190094
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

On Mon, Jan 19, 2026 at 12:08:07PM +0100, Konrad Dybcio wrote:
> On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> > Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> > than 4.0. Replace switch-case with if-else checks, making sure that the
> > register is initialized on UBWC 5.x (and later) hosts.
> > 
> > Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
> > Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 44 +++++++++++++++--------------
> >  1 file changed, 23 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index a99e33230514..80a9fb76b139 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  
> >  	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
> >  		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
> > +		u32 ctrl_val;
> >  
> >  		if (MSM_FORMAT_IS_UBWC(fmt))
> >  			opmode |= MDSS_MDP_OP_BWC_EN;
> > @@ -286,30 +287,31 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> >  			DPU_FETCH_CONFIG_RESET_VALUE |
> >  			hbb << 18);
> > -		switch (ctx->ubwc->ubwc_enc_version) {
> > -		case UBWC_1_0:
> > +
> > +		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > -					BIT(8) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_2_0:
> > +			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > +				BIT(8) | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_3_0:
> > -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_4_0:
> > -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > -			break;
> > +			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
> > +			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
> > +			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
> > +		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
> > +			if (MSM_FORMAT_IS_YUV(fmt))
> > +				ctrl_val = 0;
> > +			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
> > +				ctrl_val = BIT(30);
> > +			else
> > +				ctrl_val = BIT(30) | BIT(31);
> 
> Can we name these magic bits?

I will raise the question internally. In general, I'd like to start
shifting towards generated reg descriptions, but it will take some time
to implement.

> 
> There's 2 more bitfields that I see downstream sets here (but it
> doesn't claim to support UBWC6).. 

For the formats which we don't support upstream. I'll add a comment
here (and I probably should send another iteration anyway, fixing the
error register too).

-- 
With best wishes
Dmitry
