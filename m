Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0AD6B89C0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 05:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2D610E6E0;
	Tue, 14 Mar 2023 04:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D40710E6DA;
 Tue, 14 Mar 2023 04:44:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32E3WBeV027657; Tue, 14 Mar 2023 04:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=aWr4zFKGyngu2UDO4SAitdN/n6UBxqHKR61v3ZCdu5o=;
 b=moug7dKEBP8gF/Usu24in9APtLbw4LYBpspUa/gqXoyktf6oihcvoZuxRbrN1MelyxCw
 d0PppkcyDln07c8QM8m1k1LZq0NWCD9wmOoEhU/2klOtSdJztzPOwZWfx2t/lRBq6k/t
 O9RKqz5r1TPgiGyFTNWZ/L+x52QGkXEeNdg/aVDExLlBQa33qPjg8qWfuQs5Af+tAaY6
 qyacHiRZTKp2Qnyw/uFJzWYvi4vgI2YUYHQAUWh9FsMVQT0/tetcHU4DGTjIvOcYkKns
 zmJ03h+YWgDC2RVCKvqihxkDAbSWpKoHCkUb7us9g8zRtpE86MTfR826ySP+Aa79Gr4o +Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3paef88jae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 04:44:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32E4i52H020445
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 04:44:05 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 21:44:05 -0700
Message-ID: <b09dad15-43df-0959-d15b-b0f93587fad8@quicinc.com>
Date: Mon, 13 Mar 2023 21:44:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 31/32] drm/msm/dpu: log the multirect_index in
 _dpu_crtc_blend_setup_pipe
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
 <20230310005704.1332368-32-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230310005704.1332368-32-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: O7tD9Wz3ZCF8lpFFUh0VRw39BRlBTOnr
X-Proofpoint-GUID: O7tD9Wz3ZCF8lpFFUh0VRw39BRlBTOnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140041
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
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Lets print the multirect_index as well in _dpu_crtc_blend_setup_pipe()
> as it will give the complete information of the sw_pipe as well.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

This needs your signed-off too

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b748c4f17c90..96ffea069120 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -425,12 +425,13 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>   				   format->base.pixel_format,
>   				   modifier);
>   
> -	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
> +	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
>   			 crtc->base.id,
>   			 stage,
>   			 plane->base.id,
>   			 sspp_idx - SSPP_NONE,
> -			 state->fb ? state->fb->base.id : -1);
> +			 state->fb ? state->fb->base.id : -1,
> +			 pipe->multirect_index);
>   
>   	stage_cfg->stage[stage][stage_idx] = sspp_idx;
>   	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
