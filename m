Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB6D3A8A9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A19810E42B;
	Mon, 19 Jan 2026 12:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G568nbUz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RkW3s7M4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8550E10E423
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:25:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J91HdL748402
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AS4+y5Ixt5ikr4pYFKf10f+qp8yuyDl61gKWxxUFT6k=; b=G568nbUz3mTLaxzL
 fvKXILX8yDmVLj8GAkG5rA7IscY1QEbXGXjd1uwfjOmcL15avGUcK4nUVAaDo0ye
 WAQNUwdXnjylWQtjLotCVPuFYtuVFmMv8faSuH1YnILIhSGUmdzU1DI4PK+bxtm0
 Cz/Ioqya8TnrEMgbmHu1pK4L1S1C0mxC8YmjZVNl6uTyzkjO6k/Lc2OEAT72bwIo
 fDJBbkJv1pRIqJfxVDTQYM9Qxi0VD4SwaU/pdvxbEvMBIBNw0ys0BmMKSxFbdwVU
 7Nwek3Cc74F3hxYMBF71nlq4pIRHxMYHefPnnnd3gth3yZk94miW0FUAZCbJIJTV
 HjFJrg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t750m3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:25:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88fd7ddba3fso19233316d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 04:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768825502; x=1769430302;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AS4+y5Ixt5ikr4pYFKf10f+qp8yuyDl61gKWxxUFT6k=;
 b=RkW3s7M4TjlBCpTCgS55xggtrcDC5LkLMjWRAUCdE9Dlq/cg9cRQSvQmr+34LeYwMd
 nI2yNSSz0qAszghBXVhyZfrQEbGKUb1J8jVJ/zk6kIEcDR7qtMrHpoQQI/zusqLlpZO4
 EUs0cP7c2YlJ/mYhOK9TU6nEP2qXWVK/D0RTk+arcfpqhYIPDiwYHfjNW/Ia4cq+WcYv
 elXHK+ZUt2OpDY4NYAO76mmkw1fUn2bOURCf7mDR011WUTcTxb+ouDsuUW+dx7dwogWl
 kAubvzhiSWwZTWPn90xY4DFEYUig/NwDnE1rJE1OaTssYeySg24ELsL8pZ1o9cIgVdpf
 3Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825502; x=1769430302;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AS4+y5Ixt5ikr4pYFKf10f+qp8yuyDl61gKWxxUFT6k=;
 b=ACaI6d9sc5FnJhMln9jIRfGg2O3dbkrctXzAS13c2UBo1hCvBhls8FUDDQCkHW8y1q
 Fgy+mmygfCXP4FEjUkg8X5Car/oiXANCvy+x9scnyz84ooHZsjumK64yRwZS3gC4wEvb
 RxqVFPURsPphyYFWreWu89IzKBGqubowno1F9JDUO7cYtpGxJ8qJL3AmnBqpNlfxJwTQ
 CgpCao1lY11Izm6NN20JqkUnsiNcBsBFoAdqgUgdS3joKY9H7aYaOx/luYvqNTmzy+oj
 Dlswp3mke2oCIabYEGj/TUEnfqpxW/H+ufEifHbZ3v+62khrasbcXSqsiOkrPL5qmmld
 vaGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmgTv5q2ZiuB/LAq7c3wC271VY66eMijSWkw83mkk8zROUqv39ekJhOs8PoI5vb696YH+m/OFscVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUqmLAtIL8vVGgK77dmuMwfn6or151Z08Usv5kSkvWmOp/e1nM
 zZwjhJ/SdM8mUgsAiMog25YdM0g7oiiSJ3U1HNUf7nQp4JQqspz6EAWZfUQTybnmeDNePxPg73w
 36hXNndL5r9btg/bgPSoETCG9pN2GOHyeL2JWK0qACrLobwC5rDmXKpCHBB3mgRT20oYSivU=
X-Gm-Gg: AY/fxX5XMDlCu2tkiJA+ZqX/KHcIjjk2cdC7ZhspFc/y9bTlNcxMwrenU2DCyY20pNz
 VgqBOTn9hYSSVtFd+VhGzu1YNZnfsn27p1Qxl7SNH+uaRUvRf8V+IKCnlTuADsWmTk5xl0YxXbV
 EGH3lf3iEACZenx398xXEjlH1ksjol7amVoZxYEzo8koff0u6eEtQvRaZtn4VK+HEeQYEQDneJA
 S3uFzvJmIflhiC/wCJqoOjQLX2Ce5u0N5mG1gTWXrotOJRTJsznZd3dVKYR4bJ32ws+GvToulmX
 My7yuhh4fGjbeZ5G8fwopLG1Oq7OoPyZBGd8wmcwIPEO3WeSisdQrELzybJi4mBs65PBTM61r2N
 23P4sH4xxriyyGM1cYTkhGUtrqBoXlE71d7GDF8iO8dvslru/RVuABD5IapDGL0a/spw=
X-Received: by 2002:a05:620a:2947:b0:8b2:ec2f:cb3d with SMTP id
 af79cd13be357-8c6a67cb0bbmr1154158485a.10.1768825501845; 
 Mon, 19 Jan 2026 04:25:01 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8b2:ec2f:cb3d with SMTP id
 af79cd13be357-8c6a67cb0bbmr1154156385a.10.1768825501296; 
 Mon, 19 Jan 2026 04:25:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959c9fbbsm1114310366b.38.2026.01.19.04.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 04:25:00 -0800 (PST)
Message-ID: <35fababe-11ec-48a8-a6a1-d1aa1ab95dca@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 13:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
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
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696e229e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s51bjNJNeX3feSWTtREA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 4xGxbx4bAIZizJfTpDg1040mN3N8lafL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX5PVO9vgkPiSX
 u8aK/e1yT6WYtWCmEV+WolG2KzI03/XWSadWF/C1lBR4oaYLHzBxq5mhjUuvtILaIlFMNqI8Jyx
 EG9mvhzRJcWBj0LjV6BpEnVcwRK6pRSNXF3dqG7C/EEWhy48R6C0gXjolAyo6pG13wJhSPaWvJr
 clVoLvIZ8yxK80hdkXClzChFfRcys49FALac1plm4SIJbIsr/Um1SJyQ3lin0+94Jnc8kJnuF5u
 BM/Pk5Sjv+0NzOnWTRZpBgFDxKoba0cZoyQSew/mL4clVlghdeuwaJo+n/mXqPo/fKEuOHM4Dw/
 jbxcKmnEkTVog6EIerItRGu8dkq9H0WERa32hpQyCIAqegR/qMcevRq4TwedA2GoU9pbz+m3cHR
 58Rfi7tgovDZm4HMHHIIgnAHjFzcqmLNCyi2VGgLfQdl5pcJnjJxAxO8qUCe8cy27cBEwg+4Epu
 11qGbFs1733+N0EX28g==
X-Proofpoint-GUID: 4xGxbx4bAIZizJfTpDg1040mN3N8lafL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102
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

On 1/19/26 1:16 PM, Dmitry Baryshkov wrote:
> Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> than 4.0. Replace switch-case with if-else checks, making sure that the
> register is initialized on UBWC 5.x (and later) hosts.
> 
> Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> -					BIT(8) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_2_0:
> +			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> +				BIT(8) | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_3_0:
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_4_0:
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> -			break;
> +			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
> +			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);

This is pre-existing, but BIT(30) is not unconditional in SDE for v3

For this patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

