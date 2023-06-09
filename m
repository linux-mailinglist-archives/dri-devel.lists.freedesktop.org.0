Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F472A27B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 20:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0958910E16A;
	Fri,  9 Jun 2023 18:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1655210E0AE;
 Fri,  9 Jun 2023 18:41:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359EVhqK021384; Fri, 9 Jun 2023 18:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=Q8zSGAD2ZTxMwk1bsOoAiFD2UWDzspAS6nawNtBFXyQ=;
 b=oZTWiz+5H1xGrOdw7SH/jx09hw+L4yQEGJV6+Uj0/3oWEXaMqVWkGKmMEbMW4/6bGYX0
 KvC626OOID+1BBm9YleDB/IeC9L4lJ0RqaPnxZUeZ0FfxD5af3eTdLOfyIz0+WZKspOa
 nr7+kyV7vltQ/DlAKGSxpavOPVZyzF7p9hrjxnQzT5xvOsSfdqjaweZC9qVnv5zh2Tef
 2BlEh2/R0mGs99T4p58r0uojd10///1Iu+3KeH6PpmDnJolj1+Q19I++mYO1Vt1xfAd1
 RH9CeqFJak7vXwltg+0vmJvkXOMnSnE7vmtnFa7zahXwJYYYnxruIDaX0sq16usSmkCb 6w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3uja1sbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 18:41:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 359IfBOW015495
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Jun 2023 18:41:11 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 9 Jun 2023 11:41:06 -0700
Date: Sat, 10 Jun 2023 00:11:03 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 09/18] drm/msm/a6xx: Extend and explain UBWC config
Message-ID: <zthryaxtrbvmqzkeszrub4al6t75gtebvxdbzmgswfwjmtyiff@zyyitzjwb2hh>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-9-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-9-69c68206609e@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wrcCo9IbnIWKB3UaCZvgU6LcnLnjUO4h
X-Proofpoint-ORIG-GUID: wrcCo9IbnIWKB3UaCZvgU6LcnLnjUO4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_14,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090156
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 29, 2023 at 03:52:28PM +0200, Konrad Dybcio wrote:
> 
> Rename lower_bit to hbb_lo and explain what it signifies.
> Add explanations (wherever possible to other tunables).
> 
> Port setting min_access_length, ubwc_mode and hbb_hi from downstream.
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 39 +++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index dfde5fb65eed..58bf405b85d8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -786,10 +786,25 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	u32 lower_bit = 2;
> -	u32 amsbc = 0;
> +	/* Unknown, introduced with A650 family, related to UBWC mode/ver 4 */
>  	u32 rgb565_predicator = 0;
> +	/* Unknown, introduced with A650 family */
>  	u32 uavflagprd_inv = 0;
> +	/* Whether the minimum access length is 64 bits */
> +	u32 min_acc_len = 0;
> +	/* Entirely magic, per-GPU-gen value */
> +	u32 ubwc_mode = 0;
> +	/*
> +	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
> +	 * We then subtract 13 from it (13 is the minimum value allowed by hw) and
> +	 * write the lowest two bits of the remaining value as hbb_lo and the
> +	 * one above it as hbb_hi to the hardware. This should ideally use DRAM
> +	 * type detection.
> +	 */
> +	u32 hbb_hi = 0;
> +	u32 hbb_lo = 2;
> +	/* Unknown, introduced with A640/680 */
> +	u32 amsbc = 0;
>  
>  	/* a618 is using the hw default values */
>  	if (adreno_is_a618(adreno_gpu))
> @@ -800,25 +815,31 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  
>  	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>  		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
> -		lower_bit = 3;
> +		hbb_lo = 3;
>  		amsbc = 1;
>  		rgb565_predicator = 1;
>  		uavflagprd_inv = 2;
>  	}
>  
>  	if (adreno_is_7c3(adreno_gpu)) {
> -		lower_bit = 1;
> +		hbb_lo = 1;
>  		amsbc = 1;
>  		rgb565_predicator = 1;
>  		uavflagprd_inv = 2;
>  	}
>  
>  	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> -		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
> -	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
> -	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
> -		uavflagprd_inv << 4 | lower_bit << 1);
> -	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
> +		  rgb565_predicator << 11 | hbb_hi << 10 | amsbc << 4 |
> +		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
> +
> +	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
> +		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
> +
> +	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
> +		  uavflagprd_inv << 4 | min_acc_len << 3 |
> +		  hbb_lo << 1 | ubwc_mode);
> +
> +	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | hbb_lo << 21);
>  }
>  
>  static int a6xx_cp_init(struct msm_gpu *gpu)
> 

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil
> -- 
> 2.40.1
> 
