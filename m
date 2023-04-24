Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8322B6ED648
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 22:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F78E10E2A1;
	Mon, 24 Apr 2023 20:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E558C10E2A1;
 Mon, 24 Apr 2023 20:45:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OIdIxI015572; Mon, 24 Apr 2023 20:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NvwkZ6kAkQqlU3nvA+hkJSMUBJeAdRt++vxUhCRkN20=;
 b=hJ7wm7wiqqn5Wi4DCen2DhP/KrF6ahfr6Z9empRGBr+UNgoxQOjAkdAcJ1hBZXjwewyu
 /ElGNZFznPzZVCCh95iBZ/cQpnXv5+hpYDCixQEoJqP5JTkB8LDBESeqCh88ty2kjvyN
 Umgu/hFj3i7IemMAAJWouY3+u/pnMcZTAjXm8oamuywcSngEQoz05S1Gwrgbp9Y95yE0
 ejubPOspqru5e+j0aigDIvoHOSlRCpIF2kZxrOdqQzQITTbdrFMzCr4MPQS3IKNJ62Wl
 BlTeo/yYYWyx4UTkdygKNMJzIRI/MkxLPlyc8Yplx8xX9PKTUrQmtLHWkkHQNBvJcEwx kw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5r0usc9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 20:44:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33OKiwDp026790
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 20:44:58 GMT
Received: from [10.110.104.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 24 Apr
 2023 13:44:56 -0700
Message-ID: <62d78d23-e191-a64f-5c4c-cd2c26217bdf@quicinc.com>
Date: Mon, 24 Apr 2023 13:44:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 03/17] drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets
 out of hwio header
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, Jeykumar Sankaran
 <jsanka@codeaurora.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Chandan Uddaraju" <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-3-ef76c877eb97@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230411-dpu-intf-te-v2-3-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: A3vEk8sHJRjI9vUaRaLuFkhpO-rUaah-
X-Proofpoint-ORIG-GUID: A3vEk8sHJRjI9vUaRaLuFkhpO-rUaah-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240187
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
Cc: Archit Taneja <architt@codeaurora.org>, Jami
 Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/17/2023 1:21 PM, Marijn Suijten wrote:
> These offsets do not fall under the MDP TOP block and do not fit the
> comment right above.  Move them to dpu_hw_interrupts.c next to the
> repsective MDP_INTF_x_OFF interrupt block offsets.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

This change itself is fine, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

One comment below.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h          | 3 ---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 53326f25e40e..85c0bda3ff90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -15,7 +15,7 @@
>   
>   /*
>    * Register offsets in MDSS register file for the interrupt registers
> - * w.r.t. to the MDP base
> + * w.r.t. the MDP base
>    */
>   #define MDP_SSPP_TOP0_OFF		0x0
>   #define MDP_INTF_0_OFF			0x6A000
> @@ -24,6 +24,9 @@
>   #define MDP_INTF_3_OFF			0x6B800
>   #define MDP_INTF_4_OFF			0x6C000
>   #define MDP_INTF_5_OFF			0x6C800
> +#define INTF_INTR_EN			0x1c0
> +#define INTF_INTR_STATUS		0x1c4
> +#define INTF_INTR_CLEAR			0x1c8
>   #define MDP_AD4_0_OFF			0x7C000
>   #define MDP_AD4_1_OFF			0x7D000
>   #define MDP_AD4_INTR_EN_OFF		0x41c
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> index feb9a729844a..5acd5683d25a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> @@ -21,9 +21,6 @@
>   #define HIST_INTR_EN                    0x01c
>   #define HIST_INTR_STATUS                0x020
>   #define HIST_INTR_CLEAR                 0x024

Even HIST_INTR_*** need to be moved then.

> -#define INTF_INTR_EN                    0x1C0
> -#define INTF_INTR_STATUS                0x1C4
> -#define INTF_INTR_CLEAR                 0x1C8
>   #define SPLIT_DISPLAY_EN                0x2F4
>   #define SPLIT_DISPLAY_UPPER_PIPE_CTRL   0x2F8
>   #define DSPP_IGC_COLOR0_RAM_LUTN        0x300
> 
