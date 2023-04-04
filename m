Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB8B6D7007
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 00:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D523410E21D;
	Tue,  4 Apr 2023 22:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521F010E21D;
 Tue,  4 Apr 2023 22:19:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 334IGA56017424; Tue, 4 Apr 2023 22:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5UP3PnizDARsD7LVQdJvu+uQZRbZm8krDkBG1NOoNjI=;
 b=N3h0VwBdCuZvU+KIjPNo/bKE6W2zPo0n7aLH1uAlXKltTdne9TUoEkB5Xfa85IkNXjla
 bHnABCuBZgx1Bbu3agL8dtoGLp1cohZC2aglM2YpQmbHwG3cnTfKDpzh5334m90BALek
 sW8t/hE2frh584fmn3sTlaR7wdRCCA9+J5v6/dCbVhWeH5DjwQE5Re+h+baUWhexd0Gx
 VgseTc0XTBBWeNyMXVtEP/wVYezO+6dVU2hHTKPxdUx2XZr9pLak2BqChEJEn4sDyd3U
 ecl91ppBDhk8GupX/zz3fJkwOatmhLF4wkqaog2q3MAcamllwKEiBh0RRc93dFhbEnKW vw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prmkmsdnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Apr 2023 22:19:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 334MJFuN027423
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Apr 2023 22:19:15 GMT
Received: from [10.110.66.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 4 Apr 2023
 15:19:15 -0700
Message-ID: <72915d9e-dbba-7391-28d8-cbbca479da76@quicinc.com>
Date: Tue, 4 Apr 2023 15:19:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 02/42] drm/msm/dpu: Allow variable SSPP_BLK size
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230404130622.509628-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 73AnYCUG2eva8sxp42nfPfdy8QRaskpi
X-Proofpoint-ORIG-GUID: 73AnYCUG2eva8sxp42nfPfdy8QRaskpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_12,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040202
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> These blocks are of variable length on different SoCs. Set the
> correct values where I was able to retrieve it from downstream
> DTs and leave the old defaults (0x1c8) otherwise.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [DB: fixed some of lengths, split the INTF changes away]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Everything is fine except sm8450. As I already wrote in the previous 
version's review, it should be 0x32c for sm8450.

> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 146 +++++++++---------
>   1 file changed, 73 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 83f8f83e2b29..9e20ab6acbd2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1172,11 +1172,11 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
>   static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK("10", 3);
>   static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>   
> -#define SSPP_BLK(_name, _id, _base, _features, \
> +#define SSPP_BLK(_name, _id, _base, _len, _features, \
>   		_sblk, _xinid, _type, _clkctrl) \
>   	{ \
>   	.name = _name, .id = _id, \
> -	.base = _base, .len = 0x1c8, \
> +	.base = _base, .len = _len, \
>   	.features = _features, \
>   	.sblk = &_sblk, \
>   	.xin_id = _xinid, \
> @@ -1185,40 +1185,40 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>   	}
>   
>   static const struct dpu_sspp_cfg msm8998_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1ac, VIG_MSM8998_MASK,
>   		msm8998_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1ac, VIG_MSM8998_MASK,
>   		msm8998_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1ac, VIG_MSM8998_MASK,
>   		msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_MSM8998_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1ac, VIG_MSM8998_MASK,
>   		msm8998_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_MSM8998_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1ac, DMA_MSM8998_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1ac, DMA_MSM8998_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
>   static const struct dpu_sspp_cfg sdm845_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1c8, VIG_SDM845_MASK_SDMA,
>   		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1c8, VIG_SDM845_MASK_SDMA,
>   		sdm845_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1c8, VIG_SDM845_MASK_SDMA,
>   		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1c8, VIG_SDM845_MASK_SDMA,
>   		sdm845_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1c8, DMA_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1c8, DMA_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1c8, DMA_CURSOR_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1c8, DMA_CURSOR_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
> @@ -1229,13 +1229,13 @@ static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
>   			_VIG_SBLK_ROT("0", 4, DPU_SSPP_SCALER_QSEED4, &dpu_rot_sc7280_cfg_v2);
>   
>   static const struct dpu_sspp_cfg sc7180_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>   		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   };
>   
> @@ -1243,9 +1243,9 @@ static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
>   				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED4);
>   
>   static const struct dpu_sspp_cfg sm6115_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>   		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   };
>   
> @@ -1259,21 +1259,21 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
>   				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>   
>   static const struct dpu_sspp_cfg sm8250_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK_SDMA,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK_SDMA,
>   		sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK_SDMA,
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK_SDMA,
>   		sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK_SDMA,
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK_SDMA,
>   		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK_SDMA,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK_SDMA,
>   		sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
> @@ -1287,21 +1287,21 @@ static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
>   				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>   
>   static const struct dpu_sspp_cfg sm8450_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> +		sm8450_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> +		sm8450_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
>   		sm8450_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> +		sm8450_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_CURSOR_SDM845_MASK,
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_CURSOR_SDM845_MASK,
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
> @@ -1317,36 +1317,36 @@ static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>   
>   static const struct dpu_sspp_cfg sm8550_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> -		sm8550_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
> -		sm8550_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x344, VIG_SC7180_MASK,
> +		sm8550_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x344, VIG_SC7180_MASK,
> +		sm8550_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x344, VIG_SC7180_MASK,
>   		sm8550_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
> -		sm8550_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x344, VIG_SC7180_MASK,
> +		sm8550_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x344, DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x344, DMA_SDM845_MASK,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x344, DMA_SDM845_MASK,
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x344, DMA_SDM845_MASK,
>   		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> -	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, 0x344, DMA_CURSOR_SDM845_MASK,
>   		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
> -	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, 0x344, DMA_CURSOR_SDM845_MASK,
>   		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
>   };
>   
>   static const struct dpu_sspp_cfg sc7280_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK_SDMA,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK_SDMA,
>   		sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK_SDMA,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
>   		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>   };
>   
> @@ -1360,21 +1360,21 @@ static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
>   				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>   
>   static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x2ac, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x2ac, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x2ac, VIG_SC7180_MASK,
>   		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x2ac, VIG_SC7180_MASK,
> +		 sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x2ac, DMA_SDM845_MASK,
>   		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x2ac, DMA_SDM845_MASK,
>   		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x2ac, DMA_CURSOR_SDM845_MASK,
>   		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x2ac, DMA_CURSOR_SDM845_MASK,
>   		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>   };
>   
> @@ -1395,9 +1395,9 @@ static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE("0"
>   static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
>   
>   static const struct dpu_sspp_cfg qcm2290_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_QCM2290_MASK,
>   		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>   		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   };
>   
