Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6ADB0EFCF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE6C10E7A6;
	Wed, 23 Jul 2025 10:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiVLRDt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195C810E7A6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:28:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9O8s6020122
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bzR/vX7Xl3wBXcTUtNpoHInSR+HaYsHrGxjxbc/TMBQ=; b=ZiVLRDt6zu3B3KDe
 ujWkglWD0BULfoZK8aDE0iM7y/RNm6W3KcRaX239CA49O8hyuIjMGe89LV89fNri
 SmEiKP1XGZD/geJVS9w1ntu2a3sssHMQsCMPhSrR+6INDMEDnk88kxQpn0DDXw+t
 gZECXNyun+ijKZ0yxCxO23dLJ94v1gIlyIjrNuuWsFBamYwrHlW0ZUrfVqU8DuId
 TNVUJV+kr4JRGLGwRnlc6pL399Zy7UmgTkVbhUnoMtG48ICjZAyKhP1zcB57MlLj
 UEAefD2h1HrsSTBgEBEXX5JZ5NOKyAMdcBsBhG4ZSi9aIxoFxbOc1uDepMRKb7NC
 2JP7jg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3eqm85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:28:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fb030f541bso15675886d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753266498; x=1753871298;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bzR/vX7Xl3wBXcTUtNpoHInSR+HaYsHrGxjxbc/TMBQ=;
 b=jVQ+hb6eFoY/HOVJTVspVD+wBCY2w+AHSWKUmYwc+ESoj4Fdjeblij3cr6HLwD0IAt
 /rjcm2vOO1aMZQyGgUMcHd3cGsSu7bbqwl9fa9QdNnIOtpMzhD7xgB9Cm+cDjh5++aHG
 0hPhCa1/AdhlpGJ4f207x+UJXX+Ml9H84ODK0Us/NIHHGfI6Z/evuEvZmwcaz5VeMPry
 auZboamI+6vSwp7sm1joSvVW4f5zmLoittzC5P6yslsRU7jpEDfh86m6HEnbSbZbz+z2
 dD3M0Srl4ulbKdT1GfIK1Mugafk4AwHx4Yq9V/Uh6mFbMOVNtleEZc0eHbR/ODLsg9kd
 nuwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZzoOBUl5CNNBKHkZNcxkQ+3hAWrJ1mpnIjg6vwC8Rs/4zVW/f7wqwIiwiKKekOMwveKwBhMteqwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQV+hQ1kqEAomiVgb+sud1NMiH1Brlu0wmXq6BHrHgiMQBlGpV
 DTPKaLvgay71Nbx0T/mjsSc4oNuXT/rmdfLN3aULWH/8ZrXraj46+DgEkHXhmTzVcbXm/WqDpVu
 eyNfFIWf0VmPm0OVV09DM+MRQPhhN4W6fjhN5ATEuqyaRJQiCuWqYBy89jzeSq/aUCPlJHkQ=
X-Gm-Gg: ASbGncvV+U0hYa0AsG+bCLbwK7CIE6wuLhsQLI3DLMO+X+5WWX3tkCBiPodD6iTdyJS
 WA18GafFSnOPV8BhM3teIVo0AWXKj6fxHKwZSz+9fiGw3EiDfGBJBcKLrFQ6O7Z7jaKhQ0l/3y5
 I81HruIoAAGSEWdhhXMA5MaRlyKr58jha+cuePeT10rebr41hEj6r/nWv4myilfg9pVrXD2onl/
 2umL83xj6WB0DdYL05gRCJwlCe8RZVav2ydhM1xoVtOuLRP/IDEbVMAShWEVN7r0i3UDGsOcBEC
 l3gEgplDjsK1W6ihJDvx0PaWMF3GlyJUwLaM2TwIwmcvPSx7ZgDux0SZg+0C/8CAsEhpunvapyA
 CvwHMnVclw4IKrfT/jg==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id
 6a1803df08f44-70700537849mr16607076d6.3.1753266498253; 
 Wed, 23 Jul 2025 03:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbL39UtPO+SV8wf9+PGiKf6rdU9y7bVc7YUr8WF8xNy4i+xE+jtF/o/Z3VWa+cAEKKOMUmAw==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id
 6a1803df08f44-70700537849mr16606856d6.3.1753266497737; 
 Wed, 23 Jul 2025 03:28:17 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f09da6sm8325019a12.5.2025.07.23.03.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:28:17 -0700 (PDT)
Message-ID: <8267f6b9-2929-4dac-9e55-f2838ab64f50@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GOvKiTK1ap3OdzflhAYmWGKUXKls-iBY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OCBTYWx0ZWRfXxNTkc9P3RFXK
 cqmOlAf5dAnzB8t2sW+L5Cx6tK9OQWif7ILqZErEqr92c07mCwf07bg18qSBf4GHt23j2ncqtoe
 ph3/KahVrpyVsBBjz5Hsi7QyD5nLnBLUpsiNucHmMjYNpaxlpiU8/qWoao5nbu+WyvHkXaULc0D
 KQ5+HbJfjYtNHAXpHSZZdM0By+XOJcw8Yn1FTFwpODRJ+aDIqqZQO92vmJHUqHt+/qVooOGcA28
 YgOA0x0ei+wZMi1xCHC7JH/DTM2rwD2TstcEox0rrui0p2dIUg9gITYezB3VvcAA6QEYsDMBKw4
 ywxXlQx8hhLanqQFmTvBezqtjP0lHWgoIuNVW9qGgiPP2Nku7ppWjWiTloL9oOYfRJcpDeGh35s
 lglQjCYVUA5OyscAZ1+Q+KbXDzucpq7NATNgk+LsvgSMYhLYZmjdj0oM/O5ec1eIkemRJH54
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=6880b943 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=ZrogrxV2tr_2hvHNPc4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: GOvKiTK1ap3OdzflhAYmWGKUXKls-iBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230088
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> When IFPC is supported, devfreq idling is redundant and adds
> unnecessary pm suspend/wake latency. So skip it when IFPC is
> supported.
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

Do we want a static_branch here instead?

Konrad
