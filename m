Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50EDAA3F9C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 02:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D917A10E15E;
	Wed, 30 Apr 2025 00:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jOxYpXB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FA810E15E;
 Wed, 30 Apr 2025 00:42:43 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLaaOi032198;
 Wed, 30 Apr 2025 00:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FUwhFGiC+eN9tmNWeLuNSBUdTaRec4Y4VeuZ45/kY1g=; b=jOxYpXB3yvyzCsIG
 ch6LVTTBLAgzgiqOaWvmTchijYMQ2aj2gEjjRMGKS7/CBK6X9gAqHfdSmR0u37xH
 kwhKGG26iXYAl/KcWhp9QZjtsYfvGGDlntCKNFEQJs/iWxGHU3Fni9D8/ko53hJW
 EEPYMmjQ/VRq9juB1yMhhDTbnrtvS2QKfzkjtIaDeag+MRF02ZEgDMbZGgj3+Muv
 TDqEi2aVCXtjEuWsuZDi+xhf0w96UYg14EAxpR1Rn0rjXhiF/6W+iORknZHyfCev
 Yw8O09fNpzRb0Pd1U5Q6MKS7x+x7i/KzguRoedqGOxVBdQT+UQ5cxO85GZrIevgt
 KFQH6Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u70avp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 00:42:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U0gXMM004096
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Apr 2025 00:42:33 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 17:42:32 -0700
Message-ID: <b1b034a0-3f28-49af-9c87-1684409dcdeb@quicinc.com>
Date: Tue, 29 Apr 2025 17:42:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL
 blocks on DPU >= 5.0
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
 <20250307-dpu-active-ctl-v3-7-5d20655f10ca@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250307-dpu-active-ctl-v3-7-5d20655f10ca@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAwMyBTYWx0ZWRfX9kl3fuo/hnUE
 CWvezkC/v4gtjVU43DVUn0DXkuiHXp/8u3ZCfBKFbSzhwi7QudGcWu8zXFMIz6x/dY8YUDb8mEA
 0d9rFWBVQcSVZq6lHR/aOOBHoW2onnsC3BkJiojW/l541Lu/DPHAG6cCn4Txb58S+7YgvrX+uqU
 gvSYa2m2YsfRlJvTcG8kXQJwJWfN/AdYhVNDWpM+4S4KD+e0pbq04nUjXJp08HmP01ygGNuEdnS
 QlF8L4VksZhPi0Q5wDdkX5lo2qbTfwbcaqIeyRnwl6Q/MUv67UJzGPVuvNGqsfe8QWz9hTaP4KA
 WYUNR2G3UFKkNL2ohBCJ/A3RDnmWGoK9THFJowjrx4lsHe4O8bAG83xFEZ/JNNk3JPOGScFKDeA
 ON4AI1eMWAY7qtGr8pBZZiHtqk8SpLnntYBNfCYsCAF10aLY7iqsK6kOPU1O0ltvgSOm4ryO
X-Proofpoint-GUID: PdsdLsPOK1d8R5xwYQqiq0f5b32yCUzx
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=681171f9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=tVI0ZWmoAAAA:8 a=COk6AnOGAAAA:8
 a=2JfERfvxAdRcI9qkB6IA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PdsdLsPOK1d8R5xwYQqiq0f5b32yCUzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300003
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



On 3/6/2025 10:24 PM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Since DPU 5.0 CTL blocks do not require DPU_CTL_SPLIT_DISPLAY, as single
> CTL is used for both interfaces. As both RM and encoder now handle
> active CTLs, drop that feature bit.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 5 ++---
>   11 files changed, 22 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index 85fde7243dd4d011ed1e3a5719fd6c98cf7d6e77..e7639f3d187cbe606a66af1b2fd6306cdb044972 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sm8650_mdp = {
>   	},
>   };
>   
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg sm8650_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x1000,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x1000,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 23188290001ffb45563a9953a9f710bacb4dac89..9b7884d7695c700b39860db207171802beaa93d8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -37,17 +37,16 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
>   	},
>   };
>   
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg sm8150_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index de8ccf589f1fe026ca0697d48f9533befda4659d..745b4e701c2d13b25a78d29b767b26b8a06dd006 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -41,12 +41,12 @@ static const struct dpu_ctl_cfg sc8180x_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index b2ebf76e386718b95292e119d53e67f5d9f0743a..9b63e4a44449aeba998fc0cceb21c88acbaf8499 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -38,12 +38,12 @@ static const struct dpu_ctl_cfg sm7150_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 47e01c3c242f9a2ecb201b04be5effd7ff0d04b1..a86fdb33ebddc7f2a9914ef04899397e3271b79e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -35,17 +35,16 @@ static const struct dpu_mdp_cfg sm8250_mdp = {
>   	},
>   };
>   
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg sm8250_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 795e9ebf8c11dcc7d7cae7444fc3e386ced5792d..977af601b4decefbee4b5f1f2b24f3d7fe6ed18a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -35,17 +35,16 @@ static const struct dpu_mdp_cfg sm8350_mdp = {
>   	},
>   };
>   
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg sm8350_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x1e8,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x1e8,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index fcee1c3665f88a9defca4fec38dd76d56c97297e..426a8d76c707f3fe1d95faf2183cb16e565940b3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -35,17 +35,16 @@ static const struct dpu_mdp_cfg sc8280xp_mdp = {
>   	},
>   };
>   
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 048dfb9dbb601bdbbf6a1326a7af8680f2777b5d..767b8e7866c6a32bf5fa7eb85f9039eede32742c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -36,17 +36,16 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
>   	},
>   };
>   
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg sm8450_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 4d96ce71746f2595427649d0fdb73dae0c18be60..c248b3b55c410d8e374b8b659eeddbb657bbe854 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -35,17 +35,16 @@ static const struct dpu_mdp_cfg sa8775p_mdp = {
>   	},
>   };
>   
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg sa8775p_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x204,
> -		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index a5b90e5e31202900c0bb5bc4a705a6b269005474..65cdf95a02c7634dcc364d5b3b7990e3d6210829 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sm8550_mdp = {
>   	},
>   };
>   
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg sm8550_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index 8977fa48926b40d486110424f70344c4d29abe80..beadfa0c0daef9ef352847d6fd1cf5b8763a17b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -26,17 +26,16 @@ static const struct dpu_mdp_cfg x1e80100_mdp = {
>   	},
>   };
>   
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>   static const struct dpu_ctl_cfg x1e80100_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
> 

