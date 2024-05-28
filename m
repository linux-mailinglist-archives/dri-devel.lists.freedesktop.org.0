Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B98D27CA
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 00:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE3E10E799;
	Tue, 28 May 2024 22:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="K7aDK4mk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA24112487;
 Tue, 28 May 2024 22:12:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SLaJd2018733;
 Tue, 28 May 2024 22:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VAtV6BHt5M29s80gmR+qVaH0AyzW3a+g/mKm1YvmP/I=; b=K7aDK4mknviY0MnT
 W2cbvGlU0J3ZnAm/SYvsCJ6kGlSF5LaPR7u50owiKCavpIHZE8tIAOuBJMCJ+OTT
 EYCXQPMCMcvmoMQVI0angIM+IULmwQuqdWf2OtpYFnAupO5SSPjTWdBvkAIQh88k
 zg1uj5fFA35q8AiIaPlyiMibW/N/8hgeatS6Ynvx+XpKspRBMV3ApKSd8qmPxFH2
 4qctEHZ/Y27q9ssCreO/LPWM2CnsjPl1Lax46WJ7dJKt1ekWz3mwLbJN6XXsgs9D
 uJvunf4PtDJ65ptTBCFc+UgWIZgOq1nZ6W8H83uL6z8KGhfutfDflCQxwXXgcoJc
 b3lQTw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0x7cmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2024 22:12:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SMCZ00013232
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2024 22:12:35 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 May
 2024 15:12:35 -0700
Message-ID: <d7ffd990-9b58-4baa-a667-15feaf895572@quicinc.com>
Date: Tue, 28 May 2024 15:12:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Jonathan Marek" <jonathan@marek.ca>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-5-f797ffba4682@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-5-f797ffba4682@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TkiTtbWYL5GyVWDPFl3C4HfIUuAaHVJh
X-Proofpoint-ORIG-GUID: TkiTtbWYL5GyVWDPFl3C4HfIUuAaHVJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405280165
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



On 5/27/2024 7:21 AM, Jun Nie wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Video mode DSC won't work if this field is not set correctly. Set it to fix
> video mode DSC (for slice_per_pkt==1 cases at least).
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Hi Jun,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 47f5858334f6..7252d36687e6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -857,6 +857,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   	u32 slice_per_intf, total_bytes_per_intf;
>   	u32 pkt_per_line;
>   	u32 eol_byte_num;
> +	u32 bytes_per_pkt;
>   
>   	/* first calculate dsc parameters and then program
>   	 * compress mode registers
> @@ -864,6 +865,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>   
>   	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> +	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
>   
>   	eol_byte_num = total_bytes_per_intf % 3;
>   
> @@ -901,6 +903,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
>   		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
>   	} else {
> +		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
>   		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
>   	}
>   }
> 
> -- 
> 2.34.1
> 
