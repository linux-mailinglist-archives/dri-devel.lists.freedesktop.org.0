Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE23710630
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 09:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C176D10E12D;
	Thu, 25 May 2023 07:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB7F10E6A1;
 Wed, 24 May 2023 22:05:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34OLogxT024046; Wed, 24 May 2023 22:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8t3nrEenpvpNdqNgDbj2dS5oJc4ywW4RI502eHu0V6Q=;
 b=CVYubd5i9Aa1dSdjrMzYCMpr2fBea2VFXFMwypIOz85fc2iOMGJtj8c6euZbVMwY51zW
 j3eNG2YkC6y5ouTWyKUHY0368U+J2njUbMFx++Id6cyocGhMn4uhOlE07OaCOALWWzBl
 yV1m+CfI/m9iQBJEUUMIsyXcc/GnGfVOWe3ROU2FRWEatGoe/NBPBC8dWAChYfyXmOFE
 CSHgkvWscg+z7JuHxWWyk6lqk4FrdMl4hso4CoGv46hRgjmmjLyg1xgudHWur75qyqke
 KjXY3MH6Inrw3q++uxuMlfdaBpUcmlAX2PU2U3S7RDHQ1zVOr0hM5nrKjZJ4CJKcUCyt yw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsqqj8d45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 22:05:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34OM5aAc018914
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 22:05:36 GMT
Received: from [10.110.33.8] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 15:05:35 -0700
Message-ID: <2142e4cd-ac1c-3a17-a14d-76a3672e7d9b@quicinc.com>
Date: Wed, 24 May 2023 15:05:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/9] drm/msm/dpu: fix SSPP register definitions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
 <20230518222238.3815293-2-dmitry.baryshkov@linaro.org>
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230518222238.3815293-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: avwOsohci7pkt_I44X8t8CAVdU9aaYsH
X-Proofpoint-ORIG-GUID: avwOsohci7pkt_I44X8t8CAVdU9aaYsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_15,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240185
X-Mailman-Approved-At: Thu, 25 May 2023 07:22:59 +0000
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



On 5/18/2023 3:22 PM, Dmitry Baryshkov wrote:
> Reorder SSPP register definitions to sort them in the ascending order.
> Move register bitfields after the register definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 64 ++++++++++-----------
>   1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 6b68ec5c7a5a..08098880b7d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -26,45 +26,18 @@
>   #define SSPP_SRC_FORMAT                    0x30
>   #define SSPP_SRC_UNPACK_PATTERN            0x34
>   #define SSPP_SRC_OP_MODE                   0x38
> -
> -/* SSPP_MULTIRECT*/
> -#define SSPP_SRC_SIZE_REC1                 0x16C
> -#define SSPP_SRC_XY_REC1                   0x168
> -#define SSPP_OUT_SIZE_REC1                 0x160
> -#define SSPP_OUT_XY_REC1                   0x164
> -#define SSPP_SRC_FORMAT_REC1               0x174
> -#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
> -#define SSPP_SRC_OP_MODE_REC1              0x17C
> -#define SSPP_MULTIRECT_OPMODE              0x170
> -#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
> -#define SSPP_EXCL_REC_SIZE_REC1            0x184
> -#define SSPP_EXCL_REC_XY_REC1              0x188
> -
> -#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
> -#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
> -#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
> -#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
> -#define MDSS_MDP_OP_IGC_EN                 BIT(16)
> -#define MDSS_MDP_OP_FLIP_UD                BIT(14)
> -#define MDSS_MDP_OP_FLIP_LR                BIT(13)
> -#define MDSS_MDP_OP_BWC_EN                 BIT(0)
> -#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
> -#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
> -#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
> -#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
> -
>   #define SSPP_SRC_CONSTANT_COLOR            0x3c
>   #define SSPP_EXCL_REC_CTL                  0x40
>   #define SSPP_UBWC_STATIC_CTRL              0x44
> -#define SSPP_FETCH_CONFIG                  0x048
> +#define SSPP_FETCH_CONFIG                  0x48
>   #define SSPP_DANGER_LUT                    0x60
>   #define SSPP_SAFE_LUT                      0x64
>   #define SSPP_CREQ_LUT                      0x68
>   #define SSPP_QOS_CTRL                      0x6C
> -#define SSPP_DECIMATION_CONFIG             0xB4
>   #define SSPP_SRC_ADDR_SW_STATUS            0x70
>   #define SSPP_CREQ_LUT_0                    0x74
>   #define SSPP_CREQ_LUT_1                    0x78
> +#define SSPP_DECIMATION_CONFIG             0xB4
>   #define SSPP_SW_PIX_EXT_C0_LR              0x100
>   #define SSPP_SW_PIX_EXT_C0_TB              0x104
>   #define SSPP_SW_PIX_EXT_C0_REQ_PIXELS      0x108
> @@ -81,11 +54,33 @@
>   #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
>   #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
>   #define SSPP_TRAFFIC_SHAPER_REC1           0x158
> +#define SSPP_OUT_SIZE_REC1                 0x160
> +#define SSPP_OUT_XY_REC1                   0x164
> +#define SSPP_SRC_XY_REC1                   0x168
> +#define SSPP_SRC_SIZE_REC1                 0x16C
> +#define SSPP_MULTIRECT_OPMODE              0x170
> +#define SSPP_SRC_FORMAT_REC1               0x174
> +#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
> +#define SSPP_SRC_OP_MODE_REC1              0x17C
> +#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
> +#define SSPP_EXCL_REC_SIZE_REC1            0x184
> +#define SSPP_EXCL_REC_XY_REC1              0x188
>   #define SSPP_EXCL_REC_SIZE                 0x1B4
>   #define SSPP_EXCL_REC_XY                   0x1B8
> -#define SSPP_VIG_OP_MODE                   0x0
> -#define SSPP_VIG_CSC_10_OP_MODE            0x0
> -#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
> +
> +/* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
> +#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
> +#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
> +#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
> +#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
> +#define MDSS_MDP_OP_IGC_EN                 BIT(16)
> +#define MDSS_MDP_OP_FLIP_UD                BIT(14)
> +#define MDSS_MDP_OP_FLIP_LR                BIT(13)
> +#define MDSS_MDP_OP_BWC_EN                 BIT(0)
> +#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
> +#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
> +#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
> +#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
>   
>   /* SSPP_QOS_CTRL */
>   #define SSPP_QOS_CTRL_VBLANK_EN            BIT(16)
> @@ -96,6 +91,7 @@
>   #define SSPP_QOS_CTRL_CREQ_VBLANK_OFF      20
>   
>   /* DPU_SSPP_SCALER_QSEED2 */
> +#define SSPP_VIG_OP_MODE                   0x0
>   #define SCALE_CONFIG                       0x04
>   #define COMP0_3_PHASE_STEP_X               0x10
>   #define COMP0_3_PHASE_STEP_Y               0x14
> @@ -107,6 +103,9 @@
>   #define COMP1_2_INIT_PHASE_Y               0x2C
>   #define VIG_0_QSEED2_SHARP                 0x30
>   
> +/* SSPP_TRAFFIC_SHAPER and _REC1 */
> +#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
> +
>   /*
>    * Definitions for ViG op modes
>    */
> @@ -128,6 +127,7 @@
>   /*
>    * Definitions for CSC 10 op modes
>    */
> +#define SSPP_VIG_CSC_10_OP_MODE            0x0
>   #define VIG_CSC_10_SRC_DATAFMT BIT(1)
>   #define VIG_CSC_10_EN          BIT(0)
>   #define CSC_10BIT_OFFSET       4
