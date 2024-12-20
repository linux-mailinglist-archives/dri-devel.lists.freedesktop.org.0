Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956109F9AC1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 20:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F0110E2D0;
	Fri, 20 Dec 2024 19:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ztzmoup6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079D910E3B7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 19:56:37 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKALBmg006193
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 19:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CNXi4HVvLwEnmfialNLMEUNaS0/KanL2j5mXVBCUz9w=; b=Ztzmoup6WnqTqnor
 ZvTDquigCZfl6PsIl8o3iovgSU5l7uML8oTAwRdOyJIb19Qlfri4RWhBWWYp5NXC
 ueOW43cV6jMTdDL22Ui3vDelmCgnIV/tezNcrFrNOwscRKkTO1+E6lXeiKX8DiKn
 qmIvE9aVpMjWWdhIT3buxPVTpfm1mTQo5W2uwGWhggCwU/OXEPT0SymWT23ESUYo
 BzeHj6p5vwbPYI5gTWgyV/F46xJSvKcQdB4rCvNOJzDqsutJxXuozK8lLRA8rLKr
 0RlzEJ666DNkpFKSBxdtCjNOLZfPvsiaDQGK1s3GQwZQreORLPhUkXDMKoP2YAf8
 5/lbkA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n6ra9fmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 19:56:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6d8eda4d80aso3534156d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734724595; x=1735329395;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CNXi4HVvLwEnmfialNLMEUNaS0/KanL2j5mXVBCUz9w=;
 b=D3TC23lObGmqZccdR1QE8+crwVPjNbe9K+nVqYzhLPHsfth1TduvFPUVmxuOvzyAfn
 cx2qQTzys3Y8m6jtTOkUvJbE8e7H+eEY/8VzfjimYyHbxezYNdMRQOHMdnZdkwPtneSu
 UMhO4SEpn+ZtRl9lArtmSCfcjBOkp6r7eQYFrRSZBETjywcOWNpYC/H4d5JDh2BcKOwW
 Eb3I/7KiESxLd8B0XfGKhehQPKNYQraJuzWUm34d4OkkX/hWt+ynMdJ42asahoAsU+cK
 0nJ1wH629zAeN/H3+cAyARVUlEZpPk9jw53VK6O0NaAsC5qwqoq1TvN/SZJjQQ+50zOb
 wziw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHJMv6spm+6qVVVEjgKX+iSYv93JObuNSnYn/QLUfPO/vP1DlrO2+ivFjm34dxSjMn8vnrNGCvnnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSxID5aZCqORqWnTS1c5GxDhaNmH3VddBB45tPRDQVJK3FhRQZ
 VIHODs3sPXSybUw5dYJBpBuL+QkkVmZBvplrDR5uzre9BpFDZu1qfn3HOIuwjR6XrfAC240e7Bg
 CBC6xoXd4GHL7D3Q+l8C2cbpU8jS06JAYCkAOnpT/pRp4fP5BJe/mQq9wZ+oz71nOuUs=
X-Gm-Gg: ASbGncvBYuM6yd6f0GOFwn4QJxoxD23l7F34Be/aHz6VfKAnF+ZVVoE17rGseV6jzXm
 11o4PjwjMVnCxUbD9oPaLMPbLaTIyGTLFwdv4EwhFhd6Kpi9pDUXtp8t0w4nVQ6NhQU4KzT6dER
 nCn1myyPA9R7UCnDFC/KG3+rIfdShxZD6xv6tIlCCixfYhC3x/XV5TKSNYSpmxiNe1aFMmFUJ9M
 Tvb8M6IEABAKRvfGwAk4Mxr2Pt1hC1MV1syAso6UI+vFsyJRKD+7FQzsQaYYuw6owt+nGnrNj+B
 a8JGbI6h258WuoNvyoJyX+e+XIjdS6b5L8U=
X-Received: by 2002:ad4:5de1:0:b0:6d8:e634:203a with SMTP id
 6a1803df08f44-6dd23327990mr24024436d6.4.1734724594942; 
 Fri, 20 Dec 2024 11:56:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6O7L0eT7hcle0d+mEEQSfXKZLRu3gm/NoMZrAmdKcF5OuBOOm4hLGodWNUXrXW8QaaUU7+g==
X-Received: by 2002:ad4:5de1:0:b0:6d8:e634:203a with SMTP id
 6a1803df08f44-6dd23327990mr24024226d6.4.1734724594596; 
 Fri, 20 Dec 2024 11:56:34 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe4653sm210771066b.122.2024.12.20.11.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 11:56:34 -0800 (PST)
Message-ID: <df25ffe5-b20c-41a7-b178-b191d332cb19@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 20:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mXbh4wf4NFB_NMSvk8ZwdKVQMawgUQxP
X-Proofpoint-ORIG-GUID: mXbh4wf4NFB_NMSvk8ZwdKVQMawgUQxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200161
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

On 13.12.2024 12:46 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> of A615 GPU.
> 
> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> which is a small state machine which helps to toggle GX GDSC
> (connected to CX rail) to implement IFPC feature. It doesn't support
> any other features of a full fledged GMU like clock control, resource
> voting to rpmh etc. So we need linux clock driver support like other
> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> Since there is no benefit with enabling RGMU at the moment, RGMU is
> entirely skipped in this patch.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

So we talked offline a bit, and the RGMU requires a piece of firmware.

We concluded it's best to describe that from the get-go, so that the
user doesn't get surprised when a new kernel update brings new firmware
requirements for previously-working hardware.

Please wait for the new revision.

Konrad
