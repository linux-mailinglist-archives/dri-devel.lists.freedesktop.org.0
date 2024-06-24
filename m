Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F55F915A30
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 01:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC5310E468;
	Mon, 24 Jun 2024 23:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KaM0sW8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB05210E36A;
 Mon, 24 Jun 2024 23:01:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OMveQ4011259;
 Mon, 24 Jun 2024 23:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SBaLhaSMTQm5vMNVZcz998f4D1E2LKGg3DiQR22YmzU=; b=KaM0sW8FtXQTI2EQ
 GJmbE/T3crcFbY6oYjM++3ZIVg10H8Z7+cqeU8LbhQHdqu4EsDUdvKycwyndm2PG
 H8KdbvtjUB6MMHbYMD1CO2dx6l0X6K6iFXyBXvDB8E4L/Ub4GMEAqZm3Tme6SOzq
 sJRssaT0dzw92U1jlBGc+albpWTfwrJm/cSJzSkUbQ2BxT6GBOqejGgFTsOBFuwL
 GW7Yy1rf5C4V2kWBV+uEr5sFRrxM7fW9k3Yp1MyJr6Q3/JOmvff0LyKhXSZIxsvE
 V7jq0lUB22M8FmxX+99/5mWj24/wZSHVyUPTWFL1UWS8t54NrB+Vb1+e58w69Rv3
 K6ZXVw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6ymtna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 23:01:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45ON1Zxx007183
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 23:01:36 GMT
Received: from [10.110.106.13] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 16:01:35 -0700
Message-ID: <29deaedd-15c0-1c34-2fe6-a3aafcdbc7ad@quicinc.com>
Date: Mon, 24 Jun 2024 16:01:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] drm/msm/dpu: remove CRTC frame event callback
 registration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240625-dpu-no-crtc-register-v3-1-1b161df13776@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-no-crtc-register-v3-1-1b161df13776@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: X3QPrmmEGbC6ca2tgcu1XJI_BqCr1AvM
X-Proofpoint-ORIG-GUID: X3QPrmmEGbC6ca2tgcu1XJI_BqCr1AvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_20,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240184
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



On 6/24/2024 3:38 PM, Dmitry Baryshkov wrote:
> The frame event callback is always set to dpu_crtc_frame_event_cb() (or
> to NULL) and the data is always either the CRTC itself or NULL
> (correpondingly). Thus drop the event callback registration, call the
> dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
> assigned using dpu_encoder_assign_crtc().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Fixed documentation for dpu_crtc_frame_event_cb() to stop mentioning
>    registration. (Abhinav)
> - Link to v2: https://lore.kernel.org/dri-devel/20231005220659.2404199-1-dmitry.baryshkov@linaro.org/
> 
> Changes in v2:
> - Rebased on top of linux-next
> - Link to v1: https://lore.kernel.org/dri-devel/20230102154748.951328-1-dmitry.baryshkov@linaro.org/
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 25 +++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++++------------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 ---
>   5 files changed, 18 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9f2164782844..4c1be2f0555f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -658,18 +658,18 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
>   	DPU_ATRACE_END("crtc_frame_event");
>   }
>   
> -/*
> - * dpu_crtc_frame_event_cb - crtc frame event callback API. CRTC module
> - * registers this API to encoder for all frame event callbacks like
> - * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
> - * from different context - IRQ, user thread, commit_thread, etc. Each event
> - * should be carefully reviewed and should be processed in proper task context
> - * to avoid schedulin delay or properly manage the irq context's bottom half
> - * processing.
> +/**
> + * dpu_crtc_frame_event_cb - crtc frame event callback API
> + * @crtc: Pointer to crtc
> + * @event: Event to process
> + *
> + * Encoder may call this for different events from different context - IRQ,
> + * user thread, commit_thread, etc. Each event should be carefully reviewed and
> + * should be processed in proper task context to avoid schedulin delay or
> + * properly manage the irq context's bottom half processing.
>    */

schedulin -> scheduling

Apart from that,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
