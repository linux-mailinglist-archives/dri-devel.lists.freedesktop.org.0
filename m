Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B2634FB2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 06:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311E210E4EA;
	Wed, 23 Nov 2022 05:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADF010E4E9;
 Wed, 23 Nov 2022 05:37:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AN4to6o026311; Wed, 23 Nov 2022 05:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=i5cQM6Zb0RFIDomP7VSgalfTUBrkgnb5lgnwKHZmF8U=;
 b=XHcfT8kbNGPaAPfZ0z5N2sNbZiLK59CuK4/SwFaH5GnCemrX8el/UPfMS9rnQr5aSX0I
 7oZ5zCRisubNWBuXQFDaY4YG+Cx5T7QQxWfefpN+17JrZ0wC3S381GYilu2TSyi9oTkD
 bLXn1ehSITVYaTm1o4O0+clcaoCCRZi5YWXYT7H+CjUPjhFwj41Sc+rRWboSE9BQcYfD
 hafKPUCtvAANeEQ8NsehcMiqZF/8vZIBv7Vm6dlzq4GfJqzRGIii6/g+mREwkhfWVUPP
 b4b+OQnAtYraBtDauq2swRgm36I7ZHiQuz4xqVUwpoEQCauY3T9T59LkJ+CfQnkO2xRX 5g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m0nsjb0nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 05:37:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AN5b3wK014141
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 05:37:03 GMT
Received: from [10.216.38.33] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 22 Nov
 2022 21:36:57 -0800
Message-ID: <7b6d7d2b-f8e7-f85c-ba39-70582225f6c4@quicinc.com>
Date: Tue, 22 Nov 2022 21:36:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 09/11] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-10-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221122231235.3299737-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Y1VPpCf_zvYWACEGEHCS3Vb6WbifQBOh
X-Proofpoint-ORIG-GUID: Y1VPpCf_zvYWACEGEHCS3Vb6WbifQBOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230040
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/2022 3:12 PM, Dmitry Baryshkov wrote:
> On sm8450 a register block was removed from MDP TOP. Accessing it during
> snapshotting results in NoC errors / immediate reboot. Skip accessing
> these registers during snapshot.
> 
> Tested-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 38aa38ab1568..4730f8268f2a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -92,6 +92,7 @@ enum {
>   	DPU_MDP_UBWC_1_0,
>   	DPU_MDP_UBWC_1_5,
>   	DPU_MDP_AUDIO_SELECT,
> +	DPU_MDP_PERIPH_0_REMOVED,
>   	DPU_MDP_MAX
>   };

Please update the enum documentation as already requested in the 
previous patchset.

>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index f3660cd14f4f..67f2e5288b3c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>   				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>   
> -	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
> -			dpu_kms->mmio + cat->mdp[0].base, "top");
> +	if (top->caps->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
> +		msm_disp_snapshot_add_block(disp_state, 0x380,
> +				dpu_kms->mmio + cat->mdp[0].base, "top");
> +		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
> +				dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
> +	} else {
> +		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
> +				dpu_kms->mmio + cat->mdp[0].base, "top");
> +	}
>   
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
