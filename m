Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F392C3F9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 21:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993BE10E60D;
	Tue,  9 Jul 2024 19:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jpo4jrcM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7732410E60D;
 Tue,  9 Jul 2024 19:39:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469GgFDc025652;
 Tue, 9 Jul 2024 19:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ay5oBrHSb2YL73YTY5mpyQMrO+3FJd7t8ZkpRjje6dM=; b=jpo4jrcMa1PYT1Hz
 B/H88h/SwhPzHsKpo9u2/cDjbXHLWhtNHbLqoH9IkuCiFwsIBT4nG08RjVDRypnw
 kqmwcI31votZ4naM/I5cx9rIfhLQU4pD+rMpkjaF56gIhqUNB/DayPmS//91zpiL
 BDfN9bmxcO7raEaG748rv35YEZ9K9OURJC9lHxj/kQr9H89BjOsdx3mUE+ETsPem
 lgo0EDOjEJ7CmzE9XaYnjl6KrMpYbV8FEET9TuiGbc8L3Rl6OZdxISwPRn89pJAb
 KaiYhKXrFGYqhHhdQFb+vQsu2YSva/M5sRmZiHnWh9uqVPYzoyzRrxZrp3fW7vd/
 I3l6Yw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4091jdhqs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2024 19:38:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 469JcFsE032048
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 9 Jul 2024 19:38:15 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 12:38:13 -0700
Message-ID: <46487222-6818-b0bf-e5cc-2310d62b5fe6@quicinc.com>
Date: Tue, 9 Jul 2024 12:38:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: don't play tricks with debug macros
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, Chandan
 Uddaraju <chandanu@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, Archit Taneja
 <architt@codeaurora.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Jeykumar
 Sankaran <jsanka@codeaurora.org>
References: <20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org>
 <20240709-dpu-fix-wb-v1-2-448348bfd4cb@linaro.org>
Content-Language: en-US
In-Reply-To: <20240709-dpu-fix-wb-v1-2-448348bfd4cb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nwCNJHvQJK8e2IG-3esDB5ADKXGgn6BK
X-Proofpoint-ORIG-GUID: nwCNJHvQJK8e2IG-3esDB5ADKXGgn6BK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_08,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090132
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



On 7/9/2024 6:48 AM, Dmitry Baryshkov wrote:
> DPU debugging macros need to be converted to a proper drm_debug_*
> macros, however this is a going an intrusive patch, not suitable for a
> fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
> to make sure that DPU debugging messages always end up in the drm debug
> messages and are controlled via the usual drm.debug mask.
> 

These macros have been deprecated, is this waht you meant by the 
conversion to proper drm_debug_*?

/* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
#define DRM_DEBUG_DRIVER(fmt, ...)                                      \
         __drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)

I think all that this macro was doing was to have appropriate DRM_UT_* 
macros enabled before calling the corresponding DRM_DEBUG_* macros. But 
I think what was incorrect here is for DPU_DEBUG, we could have used 
DRM_UT_CORE instead of DRM_UT_KMS.

And DRM_DEBUG_DRIVER should have been used instead of DRM_ERROR.

Was this causing the issue of the prints not getting enabled?

> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index e2adc937ea63..935ff6fd172c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -31,24 +31,14 @@
>    * @fmt: Pointer to format string
>    */
>   #define DPU_DEBUG(fmt, ...)                                                \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_KMS))                         \
> -			DRM_DEBUG(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> +	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
>   
>   /**
>    * DPU_DEBUG_DRIVER - macro for hardware driver logging
>    * @fmt: Pointer to format string
>    */
>   #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
> -			DRM_ERROR(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> +	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
>   
>   #define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
>   #define DPU_ERROR_RATELIMITED(fmt, ...) pr_err_ratelimited("[dpu error]" fmt, ##__VA_ARGS__)
> 
