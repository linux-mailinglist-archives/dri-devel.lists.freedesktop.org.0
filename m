Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0268A6F1
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 00:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB69510E946;
	Fri,  3 Feb 2023 23:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD48E10E06F;
 Fri,  3 Feb 2023 23:36:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 313Mt4Fb003863; Fri, 3 Feb 2023 23:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Q4tGz9iW5glC2yZ1OxAMWTyZBh2mO/lrJ3MSdgwiAtY=;
 b=VB4uxXGf4QDiWpRqhGWaOKsMIVW8dVZTHwoxNbx/rijlhr+/tnukCp6S5pshW1NKWSeZ
 0wt2cHkSIwWBYUF0IrVRo+2ikc5lgpRY7fVflviApjecqFAPOzgKe7qoJ706bMBJlKKO
 0kNsoJaOnZXPloHCJeTeL9r5a4PFXy+KwirosQJ7oJEKxs3Nqr3BqxAb/iCGbX+fXlSm
 JPzup+ZAlQQPLxtNsTp7SSrpLKOZja4h5CN9FREF3Eber6EOH6WNONQMRnJB0LSgdiDF
 S1L5u0ZCtl5Ib57znHGNavEu3Z8ZqXsY9LKgQmpDw/e04NO265kWHYTO+Db/FGP3K9bF og== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngwt59v01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 23:35:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313NZsXv010900
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Feb 2023 23:35:54 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 15:35:53 -0800
Message-ID: <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
Date: Fri, 3 Feb 2023 15:35:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA features in hw
 catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FfEcbvCS2HRa_fzbvBOu9LwTYnvMtBER
X-Proofpoint-ORIG-GUID: FfEcbvCS2HRa_fzbvBOu9LwTYnvMtBER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030211
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



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> Downstream driver uses dpu->caps->smart_dma_rev to update
> sspp->cap->features with the bit corresponding to the supported SmartDMA
> version. Upstream driver does not do this, resulting in SSPP subdriver
> not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
> feature bits to dpu hw catalog.
> 

While reviewing this patch, I had a first hand experience of how we are 
reusing SSPP bitmasks for so many chipsets but I think overall you got 
them right here :)

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index cf053e8f081e..fc818b0273e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -21,13 +21,16 @@
>   	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>   
>   #define VIG_SDM845_MASK \
> -	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
> +	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3) |\
> +	BIT(DPU_SSPP_SMART_DMA_V2))
>   
>   #define VIG_SC7180_MASK \
> -	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
> +	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4) |\
> +	BIT(DPU_SSPP_SMART_DMA_V2))
>   
>   #define VIG_SM8250_MASK \
> -	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
> +	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
> +	BIT(DPU_SSPP_SMART_DMA_V2))
>   
>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>   
> @@ -42,6 +45,7 @@
>   #define DMA_SDM845_MASK \
>   	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> +	BIT(DPU_SSPP_SMART_DMA_V2) |\
>   	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>   
>   #define DMA_CURSOR_SDM845_MASK \

VIG_SDM845_MASK and DMA_SDM845_MASK are used for many other chipsets 
like 8250, 8450, 8550.

At the moment, for visual validation of this series, I only have 
sc7180/sc7280. We are leaving the rest for CI.

Was that an intentional approach?

If so, we will need tested-by tags from folks having 
8350/8450/8550/sc8280x,qcm2290?

I am only owning the visual validation on sc7280 atm.
