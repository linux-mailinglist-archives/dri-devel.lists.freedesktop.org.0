Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3126B8A15
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 06:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EFA10E6EB;
	Tue, 14 Mar 2023 05:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA0410E6E7;
 Tue, 14 Mar 2023 05:08:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32E3XKT4029473; Tue, 14 Mar 2023 05:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hMKASWMV2TuYsze+u4jJwfp2+7R568oFMF2LP+P5Q8U=;
 b=XMWsnAmROAYoQbzCtvQs21V2kaKnlD4dGl/6s9reNzLX5E4MRzn1EPtuOrnDA8DNqkaz
 dGmoIr3Zoia0woVTgdCqToimIMXtGNWZq2IntxtOrPekoFnhBLORq8bA0WglgUKJwHIW
 Y5kO6fifgxMUgifW5tIeFNTPraj34/XYrPBX4OZqkTQI2mCHuX+bebkY3aCkiF+vUQsk
 wwKnAh8CMtiwlRKzi73HFox3ctg1udwGKC0whHRKbU5mjl/6mlvbh1QLL6WLfMp6JsMZ
 DvRC6GD3mdamGqo0O2r3Pk2zwIlSO0VSy33XIOYUfzmwxC+NlBTbIP0e25PsZgYXD6cS UA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pa9gfh70m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 05:08:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32E58H8L020868
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 05:08:17 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 22:08:16 -0700
Message-ID: <ec51367b-db01-9922-baeb-3233f56f056f@quicinc.com>
Date: Mon, 13 Mar 2023 22:08:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 29/32] drm/msm/dpu: enable SmartDMA for the rest of the
 platforms
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
 <20230310005704.1332368-30-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230310005704.1332368-30-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6603skfV9lC6tfIP50GAOXPDeAh8CG1D
X-Proofpoint-ORIG-GUID: 6603skfV9lC6tfIP50GAOXPDeAh8CG1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140045
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



On 3/9/2023 4:57 PM, Dmitry Baryshkov wrote:
> Enable SmartDMA features for the rest of the platforms where it is
> supposed to work.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I am so glad we split this. Without visual validation check we wouldnt 
have caught the issues and would have ended up with a blank half screen 
on our sc7280 CBs on DP.

For sc7280, I validated the foll cases:

1) Basic Chrome UI comes up
2) Validated some browser use-cases and played some youtube videos
3) Validated multiple plug-in/plug-out cases with DP connected
4) IGT test cases with DP connected:
	- kms_atomic
	- kms_atomic_transition
	- kms_pipe_basic_crc

Some notes:

1) I wanted to test 4k with this too but my monitor only supports 4k@60 
which is not possible with 24bpp with 2 lanes and due to the HBR3 black 
screen issue I could not test that so far. But since I have that issue 
even with 1080P and without these changes, it should have no effect due 
to this series.

2) I wanted to test some YUV overlay cases but I still cannot find one 
on chrome. Its always using RGB. Will check with others.

With these two noted, this change and this series has my

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Only for sc7280 device.

I still cannot give my R-b on this change till others validate visually 
and ensure things arent broken for them.

If we don't get enough validation and if only sc7280 remains in this 
change, please re-post it with only that and I will give my R-b too.

> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 54 ++++++++-----------
>   1 file changed, 23 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 1fc0dfbebb7e..fc818b0273e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -21,19 +21,16 @@
>   	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>   
>   #define VIG_SDM845_MASK \
> -	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
> -
> -#define VIG_SDM845_MASK_SDMA \
> -	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
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
> -
> -#define VIG_SM8250_MASK_SDMA \
> -	(VIG_SM8250_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> +	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
> +	BIT(DPU_SSPP_SMART_DMA_V2))
>   
>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>   
> @@ -48,17 +45,12 @@
>   #define DMA_SDM845_MASK \
>   	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
> +	BIT(DPU_SSPP_SMART_DMA_V2) |\
>   	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>   
>   #define DMA_CURSOR_SDM845_MASK \
>   	(DMA_SDM845_MASK | BIT(DPU_SSPP_CURSOR))
>   
> -#define DMA_SDM845_MASK_SDMA \
> -	(DMA_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> -
> -#define DMA_CURSOR_SDM845_MASK_SDMA \
> -	(DMA_CURSOR_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> -
>   #define DMA_CURSOR_MSM8998_MASK \
>   	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
>   
> @@ -1208,21 +1200,21 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>   };
>   
>   static const struct dpu_sspp_cfg sdm845_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
>   		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
>   		sdm845_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
>   		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
>   		sdm845_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>   };
>   
> @@ -1263,21 +1255,21 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
>   				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
>   
>   static const struct dpu_sspp_cfg sm8250_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK_SDMA,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
>   		sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK_SDMA,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
>   		sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK_SDMA,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
>   		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK_SDMA,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
>   		sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>   };
>   
