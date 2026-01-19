Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EBD3A64D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 12:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EDB10E3F7;
	Mon, 19 Jan 2026 11:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIG1/21O";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTyEj3vK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB09810E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:08:12 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JAR5xO1661032
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Tky/0tzFXXgd+VBA9iRUinx9WsYhxcSfTbVi/+M0TDU=; b=aIG1/21OQDOyiHix
 78VEX7SrggziNpb98bxSAFpUWIhY+2/S1LNuq15NmNtgHOReqQa0PE55ijZHrrNQ
 w52YiSAHw5mAL3FToNBA3WamGWdbbIgfTZEyfVFmijfXbpDZTaXFKPZdcSCHftiN
 UrXUl14ZMaIVaH94hNstYliW4BSxR67weOMiyQkChyxH1S1FZq8GtVYMiSN/9fTX
 UvdAL2o2wUXmhTtPV2bMJt9fHZwK3FUo5S6tuJC+zydEvZ1bSSNSUWIVCvWBqCnB
 5YJBjtfE4gt7qXgG2GgcQkaUaqR67THCpT3Iic4qeV+ZRl2VBv2E4oznLPG78nvP
 3PWtjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjvdr424-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:08:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5014549e7d6so15913011cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768820891; x=1769425691;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tky/0tzFXXgd+VBA9iRUinx9WsYhxcSfTbVi/+M0TDU=;
 b=YTyEj3vK+WKOq91c23VNk0klTzOveYdVw4VAyvyVdQyKJp3Wg5o4UMP9NC+TpWhjcT
 9NFp7N0RSicg/le52Kou9TpClp2jxOr76VhUiMInxnGK0RxtqLfVVkkVEqBxED22h/jv
 KtyF3V4qxDlqTKEwDcCgI/oyL1aOzZtM9YAUjRKIUGG+GHOdH2ZtEs5MyRNxHjdhvFyQ
 2a7O0kfqBcf7NwsaecXr1h8eZB7B/z45b91EE4HpyJ9am5BRJXrGWpKr0X+UBjRQ4M8J
 PDXNrcWPieyIa69jDfst8onxEvD9To9x3+8uuAlMmCFIeoUjtTrpMOjj7FeEoh/mcDPs
 JQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768820891; x=1769425691;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tky/0tzFXXgd+VBA9iRUinx9WsYhxcSfTbVi/+M0TDU=;
 b=J20iY4tu6NTxvnlPnmYL+d6v+uXFX2gvtYykEiNUDD0CfKjFmX371T9d2a/9mDoLlF
 tl2+dMNZ+lT0XIJ4PzL6Totckd2MYFcvTqBLMeBX4Hl3I/EpeOvAz6GUTihupSaErTHj
 xB9O9SRc2AVdgL9tPcSUI5DnE3lU/hBRzOxftkeg2g15Ol+Ac1G05WJhBLzC/nH2IriU
 18rNb28uQc7erXDTMg3PoNWxUT455Xy5xhJ03wLPU/9O735LsTdCx7gDw13txT0WWixP
 EihCxok3jM/KmNy1wsG4oX5fQYGRLrpLmmU/mrxWKmn/6LM+iyUdPtCxcPrw/EYmL96L
 uVoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3beaBPnJ5n8KM4+6LGylYZRbmJF6I4uhSY+LF9l84N4oq5613hxSJlSQKqJd8gZzu2arZHAmIahk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLWeN5yrx/kkzA3Um6VKUYODMDwrlhFfc/E8kYoLMvPbu3mJwW
 x5hqdXT1P+a2rAxlqnbmj+iBEGf630p9+J0S2VvwKEDfqVszVuhWp+fcpCf/mEDaUJQZZmjqJ8p
 3zq4o3mNw47g9tQuyUlBjpVCsLCNznZWeETQcPDvsquNpcboRistQPUm79AhgDDUf1Z5qEmk=
X-Gm-Gg: AY/fxX4aCTUhBQlvkbSILNCSRmKzZ9PA7y9Dzhlmf1QVeJo/Jc0PLwomq90pUSA/kCf
 jAn/pS+xklSOROgr8/6/xm68yM+Xy0gigvKf6/pJKodnNj/vOa5AZVHsuoeUCWGoMsHcUEq+SGY
 hags47M+J5Se5SYYgN19kFlPb0kkEnLyfftKMe17dyAxC1KIMVFqDwkryNricWbXaGDsj1uu9NB
 RLq6MqzhBku6T9OW/pOL3Oa5NejuThjiRpF+xRF4qHkmq/l3/fdVLWsrfvsoQ8ytWF5wFr8FzdC
 kEaU1fL08XRuAmI523F5fh3cs3W7r1SrcOv0qIv4ZBijCo+hGTqxanwe5do2eSgayfb3sPCMcEk
 emheU2UL9zmxn9Gveb/1sEv7qIUXxncnnag8MSinxBmlYnfgNw8Bed5GPilkU5Bla3RI=
X-Received: by 2002:ac8:7fc3:0:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-502a1735f4fmr129192771cf.11.1768820891059; 
 Mon, 19 Jan 2026 03:08:11 -0800 (PST)
X-Received: by 2002:ac8:7fc3:0:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-502a1735f4fmr129192301cf.11.1768820890519; 
 Mon, 19 Jan 2026 03:08:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65452bce876sm10108927a12.5.2026.01.19.03.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 03:08:10 -0800 (PST)
Message-ID: <4cc944b3-8a41-45a2-95c8-c55dbcbf0830@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 12:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
 on UBWC 5.x+
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-4-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-4-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TPoce7eVdO_TT7_Sa2GkrILiUqiilLTg
X-Authority-Analysis: v=2.4 cv=U92fzOru c=1 sm=1 tr=0 ts=696e109b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XeJQKAmXQAzf4d-CZB0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: TPoce7eVdO_TT7_Sa2GkrILiUqiilLTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MiBTYWx0ZWRfX+WO77IcoymG9
 N9MCDfxnfNCfIwnBW2eiDQhWPT1KT+3Qbe0MtRW1/seOKz0AzjeFJu6ID22eWXdpftz0UoUcYWM
 dw/6uyuDkFXl4S3LsAQ4UZ2SgzDY92RGAZiJoTMv8aEtGc17sbzlKRBk3IS/jHe9fLHiY31eVyp
 PC2VZVrzRtRm8yxwwga0YEn2g/GHw6C99SG0MMwiR4ybCZco4wuyecfmN4FFrgyG69X3sELe0rk
 J0QPG+Zp4lPK03IoC6DloxMdwBxpVXZKMFFKLQeMZAq/vJzsf6apwy+bWnOwAlVYkjGbUJn1trg
 Pgkq4HnfOkfIFbtXRiFXBkEinH8bXqh9s5kexva5wCTNOwMkZoBXiZFWC9acGfA9DNSbQeJNYkY
 p6TUKYwVTO3AptP9CxbUTLqSSa0fvkRJQpMD2pnsajHl59Py8veD5ppUz9WdD1iip8lXyvORln9
 nZi5SrjDcO/kkzu+Www==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190092
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

On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> than 4.0. Replace switch-case with if-else checks, making sure that the
> register is initialized on UBWC 5.x (and later) hosts.
> 
> Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 44 +++++++++++++++--------------
>  1 file changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index a99e33230514..80a9fb76b139 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  
>  	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
>  		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
> +		u32 ctrl_val;
>  
>  		if (MSM_FORMAT_IS_UBWC(fmt))
>  			opmode |= MDSS_MDP_OP_BWC_EN;
> @@ -286,30 +287,31 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
>  			DPU_FETCH_CONFIG_RESET_VALUE |
>  			hbb << 18);
> -		switch (ctx->ubwc->ubwc_enc_version) {
> -		case UBWC_1_0:
> +
> +		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> -					BIT(8) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_2_0:
> +			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> +				BIT(8) | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_3_0:
> -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_4_0:
> -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> -			break;
> +			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
> +			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
> +			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
> +		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
> +			if (MSM_FORMAT_IS_YUV(fmt))
> +				ctrl_val = 0;
> +			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
> +				ctrl_val = BIT(30);
> +			else
> +				ctrl_val = BIT(30) | BIT(31);

Can we name these magic bits?

There's 2 more bitfields that I see downstream sets here (but it
doesn't claim to support UBWC6).. 

Konrad
