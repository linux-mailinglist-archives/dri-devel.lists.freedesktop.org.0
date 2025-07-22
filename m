Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D8B0DB83
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7998310E698;
	Tue, 22 Jul 2025 13:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix42LYcP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B026A10E698
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:50:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M83b3t010113
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7oqjF5MC0Hy5JGq0yn/Rg4yv
 Ty+q3NvX6dPRW/kHnLY=; b=ix42LYcP8E5Pht/0iwXaYs+xrWcU+zW9wPtggSO6
 h63UIPkl0QcoaMtO0SUkrK8OvjWzP9xr1Kbb8fWWMQg2ojSXpntOE0D2XReKNe0V
 CP2veRtOFsdVXuFQFNmFa4l5/0ZLa9rQxp2aZEcnEzNY4un/9UxPe7pp/Y19LfWW
 MiMO+NibsZJhTW+MoIq+ZNV30BlEWE7f9/49+T2CJALY/JBIXAVGWf9fPzGSadnq
 BL9ksGZj+Z6Yl4YkExSJm6J80UTGI9owO/m3jYn3aOsdeCZM9NSKU0O2WwAhGejA
 uniajui6/Fe8J0p9gZQnXt81nxGIZVgOLSjsgFKXqjSPqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t18ysx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:50:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e4ca52aedaso248570185a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192229; x=1753797029;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oqjF5MC0Hy5JGq0yn/Rg4yvTy+q3NvX6dPRW/kHnLY=;
 b=eSWr9WxlBXfUcbHe/sw6pupC23YmX1lO0h6aMAUiPR9K6ZuJ6QlNq3BeVbVUaTyF7Y
 trMacazrhMWdmSNBwz7IN15BKRSOFWjyuOydCHq2dhd3zVATrwv1Z9/Y1MNVzzm9LQyx
 oLitd2sHqdaesmVNcFsAIGhvQwUSAn5YzLMbnrFGO+/9wNVN1lN1gcuFo4/gmYhjVwOx
 sduEz8UgUaUw564RGxsRmC6V/2NxEOc3uuz6jAwKgaTI2v7mH5uCm2+A8tdoTpqxCn3K
 ePZEBXaCxNyg4uRKApkOLREvip+X/fx1gw0yblBmN6G1Vg7MrcunImIGokcU/7pLY1y2
 CQzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnfqMQ8GY5IK+OioWrShNjfahMv7X+zkSDuHPDcCeayCscYw/CEQx1OtooROwlkWLdojFbL6QGNTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaA0MisZ1WPtkPILoyLLTJe4j5iv+3rIt/DQLOvVzmcEXVZ3BW
 7qNVRkhyP7F+2Bp6EkqGu1Qfnbt7QMoYtpxwCtV6MvHXwvV9Yoi45PyurYCfgXTrH5AJQjACtAL
 ssqB11yPGs9X6R4ZEeFyZcKCCaUczIbS9KAT6I28oQNgxrXK0eMn58BmL+bzyfaj6af6YxXA=
X-Gm-Gg: ASbGncvitwSvR4+92QyTYgji+5akBsUjQWuvVk0kIGWU3KPnEAq7nwuuGscrdahRSeu
 QJ0ujoBGug2/C46dgZ+e2TFqrAitxpiICIBF1IWxMh4MjI4SCsNM6cMq8OIyrcUjFDxwV1S/OAp
 rzA36pztw14QatY6iV/r8IxQDRFtOt/VT9M5waX2NI6M5wKB82D7qDr8BYpEBsWdKJxDhFDQET4
 DzhG7KM2r6gxfWq2gQWcW+PZO1iAV0Ul2ZQZ2+bHKJnYByWLVE15tPE3Srh4ZH54oBD4RBQRVFL
 hyCXdxof/nIDPHsTcd500cJ+/22xbvXzDSJ1IW73hUiHy56MCEGx46ZaLVedBALfa+ScGrHyEKZ
 XwtunqNB7tTf6vDXOMS/FcLPRiEyk/vCuPNsOSNbdl9h7g8b5c5a6
X-Received: by 2002:a05:620a:470a:b0:7e3:4283:e9fe with SMTP id
 af79cd13be357-7e342b8a298mr2785851885a.50.1753192228764; 
 Tue, 22 Jul 2025 06:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzoLA1jXenC0NKgRvJhDeIPSOC85lNKUs27uryhYpwh2Gr5qB128g74mtSw4KV/STcGN9WhA==
X-Received: by 2002:a05:620a:470a:b0:7e3:4283:e9fe with SMTP id
 af79cd13be357-7e342b8a298mr2785848085a.50.1753192228272; 
 Tue, 22 Jul 2025 06:50:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91f1fe5sm18015331fa.104.2025.07.22.06.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:50:27 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:50:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
Message-ID: <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-GUID: rwkfO--t7jHFFvszGaFPLF24X0F1oMBw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMiBTYWx0ZWRfXzM5CoU4ymYmN
 7RjshVSCIEVcOltQH2QDco8IXjDgQbh29dKuPBIL835rC6f8HFSbBKAQaIVlkE0vwZXl5jBhFgD
 GQ3ls+fDitFldjoqLHzeGkdV3WrWZeGEMEBkAcb1UIU8CxkCAe2ZlVgV8nWiCYx2wFrlOqkvg8S
 Wg6l84EA2TVa7bUSG5MluprvExWMzJgugvvjT7BpmZArpgXlRCyz1Ep1kHlLi3PapQSsNlFZNYV
 +jy8F7vbzkUM+PtXP0ER7ZSnzC0WpxnTda6nspn81ddbHd/OSCDur01/p5HfSAU/O6JRGFsr+iG
 M79E1p0TVlqGqIdD3hUkVSAlXqi60kOY+kkBDdYkDronOOXmy/O1WbsK138b0fpkI9toEKu1lqP
 rgaYPMGKlgEKqEPKefSvMzjFhooTjOD65npuOXWpZRvGda9ENm27OYhd35jN/Mx+nsbO1351
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=687f9725 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lzCaEFjWca4eqRuaUDUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: rwkfO--t7jHFFvszGaFPLF24X0F1oMBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220112
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

On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
> When IFPC is supported, devfreq idling is redundant and adds
> unnecessary pm suspend/wake latency. So skip it when IFPC is
> supported.

With this in place we have a dummy devfreq instance which does nothing.
Wouldn't it be better to skip registering devfreq if IFPC is supported
on the platform?

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -4,6 +4,7 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include "adreno/adreno_gpu.h"
>  #include "msm_gpu.h"
>  #include "msm_gpu_trace.h"
>  
> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>  	if (!has_devfreq(gpu))
>  		return;
>  
> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> +		return;
>  	/*
>  	 * Cancel any pending transition to idle frequency:
>  	 */
> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>  	if (!has_devfreq(gpu))
>  		return;
>  
> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> +		return;
> +
>  	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
>  			       HRTIMER_MODE_REL);
>  }
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
