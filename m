Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6679B4459D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 20:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3F210EAC1;
	Thu,  4 Sep 2025 18:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUKuYwzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2722F10EAC1
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 18:39:18 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HKw8s013583
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 18:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nn1s1cmBrSFFysEaJTYBo/i8fM15yQYFa7TnS6bqPa8=; b=pUKuYwzvgy5mPAG1
 g47p4h4g7JfiSoMpdvi8U/i/P8t1Fm2QeKguuxHSm1Ap9c5xRQTOaOTTK2WG/g89
 b6vgaT7PJDl9PQVv4hJV019kB5+94eAF8iWIO59/I6bLKac8RM76rGMPbvupprAe
 xDuRSeTTd4niCrn+FPuwv/sHsXKpxQgf10xgpdFICh90LUF3a+zcBNDTNirem8Yn
 /tL2NfQ8QllvIsjRO5vk7IW/fVzhSeJGA3SJO4j7AWHdQdyeIcK/GoNSJ+LYjHRB
 j+tlH23jH4nbX53XUUAET2u+kG62cjPkcVpU3OMbj9QHqEKyR6xWO3hYQpkOfqqO
 fcKS6Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wycg4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 18:39:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24458345f5dso17184335ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 11:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757011156; x=1757615956;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nn1s1cmBrSFFysEaJTYBo/i8fM15yQYFa7TnS6bqPa8=;
 b=GtNs6p6DtXUnCNOhnenu2znncbN1Bxjwf+Y+5vRmyghq4oRu17WGbdSYMVxSVlBNo0
 i+xrr3d5dvcRMNets5DFSzsSHjQ0ulZbzCrPxQ4qwC5BUu9Qu0SUwBraSl9f/cZ0j6o2
 JBnIDNyXxNNHDFTcAxuAoLd1iYDmFffCwR3L1HR0fQgIK+Y5qNYjjEOKXgqVzEO3oO28
 iXvv46TQQi/WdPrKXDzEPg+FKKEyeFpHATo5PQ246wDrLLP/+goYdmV5cXWmCtp/dOYR
 bh/Y3wkTp7Q34bRv2HTs8v8yoiOS28BGPilB2s2//DpNPPKCzRRIAYu9Oj3SdLodFegt
 E2wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEREI/YL8N6BxPErIPpAiN6WNzegAen17kBG/xZucksypfLC19tv2QctiP/1/4y1wpvfjw51qypGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU8HM/VepCIm45w6vniCpF9fTLOBOrLilecHcBHk/eW2IuRWEE
 8iLO0E+I5DJjsiJeqO94KtN9JL5ahpw779WPgjcJ9xhAxJejVcgRTMu/VE9y66w/G5nwZYQU+Tc
 IrfhnNfj3Z0dEB+DsYZOpacG2346BmD26OnRW0VrdQWAqFN18IFLpEkqgt1t+IUvEo3QtWtY=
X-Gm-Gg: ASbGncsbtP4qgOv4drGEHSAy09m/wI/npd0ERH3OXTQSNpqoLO0UYgVepDF3OFXz2Tg
 QNiODa45nDIBj5YrY9C7PqwoUp2GtlAeOPEjFB2K8UMKzh12PPSRkHx4C37MITdVVxmIXjw7+gc
 1W5BGCrC8zFhX3Ynz680RTxiCYQ9X8CwV0SM0SNwHw7c/YsLW5+q3pFTCafYy2mROdz2UCcVoM7
 ++agCzZ9OjGVL+StHPzmWeimwHeYoSGUZGMfRphEknJ98kEKjrXAnTLw7tNDE75+bB4CClyqJUQ
 v6A9GhBtCEBP4kNiO059iOzgT32Z2h6kWIpHt0qFwghI7NWGjDC9j/zYpF03Ee3e9RurfJpXCYh
 TeYbFbue5OeO2uPaWPiJVVw==
X-Received: by 2002:a17:903:2343:b0:24c:9c5c:30b7 with SMTP id
 d9443c01a7336-24c9c5c318amr78060515ad.47.1757011155839; 
 Thu, 04 Sep 2025 11:39:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGt8vlrmccO/zKDOpTjvGT8zqU0R03/eoM8Qk0vuGXWCzN2nGB8EZel9xPgSfcY7c/FvHbGw==
X-Received: by 2002:a17:903:2343:b0:24c:9c5c:30b7 with SMTP id
 d9443c01a7336-24c9c5c318amr78060015ad.47.1757011155125; 
 Thu, 04 Sep 2025 11:39:15 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24c9304b7eesm50520415ad.102.2025.09.04.11.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 11:39:14 -0700 (PDT)
Message-ID: <d312c946-38e1-4ab1-b038-19239d10720a@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 11:39:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/disp: set num_planes to 1 for interleaved
 YUV formats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-1-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-1-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9dcd5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=k66G2MeTsQAVc7QBSiAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9VheM9OLt7EDweHcmbw9VII0WtZS47pj
X-Proofpoint-ORIG-GUID: 9VheM9OLt7EDweHcmbw9VII0WtZS47pj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX/vaYOTe8FYIj
 stNy+GI00H9BmAjj8ivTM8kpIdddIso4kyg7SBGLZuT5tsIge9opCZrU6VMlR82S0/ZZv0ZwQMG
 bN8oa6mw4lqt0A+6CAHfFz4mzV508XaTQewxQ9G/TM4vzch1dqJonVCTLzCkPUjsZoEIcOZK9QL
 ivNEG2fNvevZ1l7fHPmlKEbL9/n9Z7YtZY9Wt59LEN1upQTqsjMrTMRzQlKehsvJ5p7SBug90je
 jP0eGJVKG02QyxYiP4W6c5on53ImSvOxPcNuCqI+zb5NYnvYTENk6bkYFGSggGf8xT1TnYvuIHQ
 9SEZlnUzi4+k2l+cK6AJeQqvo1yLEtehjfJaY8Vr0EEiNUb4NTSPN1GvHndAZY3XuymUH4Dy88n
 BUd86oJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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



On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> Interleaved YUV formats use only one plane for all pixel data. Specify
> num_planes = 1 for those formats. This was left unnoticed since
> _dpu_format_populate_plane_sizes_linear() overrides layout->num_planes.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 426782d50cb49d57a0db0cff3a4bb50c5a0b3d1a..eebedb1a2636e76996cf82847b7d391cb67b0941 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -479,25 +479,25 @@ static const struct msm_format mdp_formats[] = {
>   		0, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	INTERLEAVED_YUV_FMT(UYVY,
>   		0, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	INTERLEAVED_YUV_FMT(YUYV,
>   		0, BPC8, BPC8, BPC8,
>   		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	INTERLEAVED_YUV_FMT(YVYU,
>   		0, BPC8, BPC8, BPC8,
>   		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	/* 3 plane YUV */
>   	PLANAR_YUV_FMT(YUV420,
> 

