Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BC6AFB279
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 13:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ADF10E099;
	Mon,  7 Jul 2025 11:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCak27oe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA48A10E099
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 11:42:19 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679157p009341
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Jul 2025 11:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EPmD/mqlIvExS85dVMv30F8Iy5Y5MWP3RJHR3V0RmEk=; b=kCak27oehArBQbs7
 HuVS7QtbLw98lQGjXAIM1ZQbi91QEOJl470Erw1CPSFwbmpWoZJI8AhTW1ARWoHH
 VuLIiIr7gorBBzRs0Kf782/QHJZlApOyMg3563oHtd44/n5kw9VLPcaoSIrF9E/1
 sanKnuyOHFwzwft4XmBKJvDvkPh26v8obbfB8PIPOIPEsMPPhsvgOAlT3RCKYX7s
 RRKK85e9Y+B24cFwrPOIg9QpqL5p8ggllBIiE5df4ZHVvt+tzYKmmbPmYz0lFhWN
 YKe60w5hw/GScJNjYP84trOui3F/UQA5Dnc1Ik9sIV+Kt/utpy8D2CM6erN0ITQ6
 W8KgiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkcnvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 11:42:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d094e04aa4so55736285a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 04:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751888538; x=1752493338;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EPmD/mqlIvExS85dVMv30F8Iy5Y5MWP3RJHR3V0RmEk=;
 b=j+usSqwPi+qSk4AYLAW9izJ1Jg6XNlvCZXmpMS+Bl5Jz4o4sgJYAuNbAqfIeK83OEQ
 yf7vkRU9m5hOk0ArP8Aw6c2DrzZp2f0whhUpDXLL6cFFk3oKy+Zy86nKnjsOpCGZqFde
 KuQo5XVUZxh5p0Q3+RXTfUSMGutL68onE0k9+8B9LUiZtxWObAcgRLg1xEUHxBYT2DV3
 NPVMH6C38Svm8e8wt4bYMMCs/nMskcbFAsKau9Wx7HtmOJAHuRO0/lwyP0WXvc0FzHV0
 F/0CqzrRf16X/h/qiZ46fsBg5x0cbCHCUpgyOuyBDIyqSs4yf2g6EfEacMvnrkC3ZJaN
 vUuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPHfQvIgRZL4d3tOhy15z+y6VX+xj2JM1YuccN3y16wLDnK5yWv8e5R603RCKXs/1IT+X3WL0Bu44=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvynTRaU3o/+0WHwaBhePNSkYqHf6adwHu8AYCcUXzVtPfznVZ
 MaBsaj1+7jfLg+BDYGd5JucPN0kegB0GFMDdUKd7sF0bY+MuuyJxvpjk4Q0lBil6HOX5xTGmQ+I
 aWUf9l3G9RneB9DfOZvwOzCKwek+3ciXQkh85q4tkQElxumKFPoSLUGzdj4ubJe9jB8LwaBs=
X-Gm-Gg: ASbGncuxy6Gp01lbtbuW9vGViwTf/iti3ZHml2WPn+Jirqu9KR8G2q2c4av4JlgZdp9
 8BttiMRhhDgQHANBsJLK4BcbkHVZnG3xIpuR883eE5vJm42uWt7Go0sYajkncWh7dFfZdC5xPbQ
 CloyU0uoU0/YyGRaKObnKvPJy6TU8PO1ZzXm70OvymWwP5A/OyzI26xeIOdMALe0XfWIaEdXk8t
 903Qxc/Y7486hac3kcQD3X6IlznObrhkA67pbqWzEkHJJkjZgo9LSoKe5/rn8NuXa09FGpQdbZa
 fSBTCbghFAMTOV4d2Uz+qzftsB2M1/pm8aELPX1Z2iBYCD+3uAOBapihftvqEl5hZ/5+15uMntd
 /m18=
X-Received: by 2002:a05:620a:198e:b0:7d5:d1b8:e02c with SMTP id
 af79cd13be357-7d5ddc509abmr651648585a.10.1751888537745; 
 Mon, 07 Jul 2025 04:42:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9KOzB4zGkVpZwJx25vMl/UErrpqlqNGh0xSPchsvbG7/JV9ArfFw0uRjlumUIiFyMTjX47A==
X-Received: by 2002:a05:620a:198e:b0:7d5:d1b8:e02c with SMTP id
 af79cd13be357-7d5ddc509abmr651646885a.10.1751888537272; 
 Mon, 07 Jul 2025 04:42:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b5e6fcsm695212066b.146.2025.07.07.04.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 04:42:16 -0700 (PDT)
Message-ID: <6579c65c-877d-44fe-aa81-5b0e602b33f5@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fA0ElEz6fkVyI489hXIpaEVOnu3W_QtL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2OCBTYWx0ZWRfX/nOxuUIOFMfU
 RLh/cVDp/IzOLz0c+4kdPqV0ogjEMMqQDLXphkETfkR2deB/zj4wKGkp8rymZZoOy10Wgp6B7gO
 9Lb9hVFIWVI8AyUPNWLPAFORXFvEH8v7WCCnwt3CgnRtnP3/paRJLKkq8XuYJvLFOvpsvQa5n+Z
 imE6iBmYwO4t8cIqbfU5SRu6tHlvBMwYBBTVIcKavZiE0w7ZYO/KXB/rXfsdZyFDp6v/QnaIifm
 WcJCFnDZ4Gwrcc/OhSYjQnKbMfWahY3zg+EB5w5y0546bcJ2gpH0FUp8IQnhOjMrsDGTP0bqWK8
 aonI1nqJUUwtLivBz5xoAL2GiUqGFja90pzzcatqzxzXiir0CPqdsd4ri5ZD1jFqPvDnNfhi6ZD
 ONUn0D/2bpJB8PQjrM+pOXvJfwejHlBMtjEzO4kdx/3TILV6a3wSyS5W4JKLZINxiuCQP+6t
X-Proofpoint-GUID: fA0ElEz6fkVyI489hXIpaEVOnu3W_QtL
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686bb29b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=By577mDeuySOoy4OwVYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070068
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

On 7/5/25 4:52 PM, Rob Clark wrote:
> Avoid the possibility of missing features between the split and unified
> drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> in the drm_driver initializations.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b6efc5b9933b..5695de1bbae2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -816,14 +816,21 @@ static const struct file_operations fops = {
>  	.show_fdinfo = drm_show_fdinfo,
>  };
>  
> +#define DRIVER_FEATURES_GPU ( \
> +		DRIVER_GEM | \
> +		DRIVER_GEM_GPUVA | \
> +		DRIVER_RENDER | \
> +		DRIVER_SYNCOBJ_TIMELINE | \
> +		0 )
> +
> +#define DRIVER_FEATURES_KMS ( \
> +		DRIVER_GEM | \
> +		DRIVER_ATOMIC | \
> +		DRIVER_MODESET | \
> +		0 )

Perhaps I'm missing some C lore, but do we need the "| 0"?

Konrad
