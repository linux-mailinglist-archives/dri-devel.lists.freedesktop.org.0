Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB2EC518F3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 11:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE24910E02E;
	Wed, 12 Nov 2025 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAGdreiM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7e17uzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A5910E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:07:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9qjU64053039
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=; b=kAGdreiMYqZZcG2C
 a0uUG51Xyaex5zm8dEzDifgrYM5roPuhPx6kulk58BS+3W4TQOgTjoDq/LETD+5v
 toGP7tnj8cm8v2VOP+Lz/IpXCakCM90iM38mvClvDOeFEsYdpaWGBXd1aHjxLjpp
 AG2iXmEwEz9WwP5KH0yLT47UkP4ZycamLGgCsOVpOXREEsSXGEPofqjIuh1/A6cl
 8LeM5ogKJJzUCQJLJcS3TvjBK/3S3BtpOkBOzEhYPUkaFk6OcMno02VIYZ06WDsx
 ptIuEYHOCgcE0bzK3p9fTf3uJs5R1wFxbW1ukttPz3Fs2uSqO/F6CPSlVCgrZfQs
 ttvkZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acj6v99h8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:07:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed5ff5e770so1355361cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 02:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762942068; x=1763546868;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=;
 b=N7e17uzZD46o2mSxNBldlcM8BWFkId0qjCProOFPDCPn6LfJi8IyjpaVys8r2NJ1LZ
 4TRnLxTmtE1+YOYoUCfry4AZGH9gtVK0XKmcgy06VhXYVlBZFY6wY30icaWz+CtF2cMk
 GIeezlnxqJw8XFHTWW9ivwEvFi8kZpQLXUt0eMBh4CoJf+Z9ZtssGxmNOnpGM5y4c6yE
 YAxjmmcCGNPqyPSID01vqmtZ/EGzvrHvrcTi6B+PPq8m/unFony02bb8rSGeEWILCvV5
 GWO1IA0f1q3glYpicwcYeOb63eDi+Dl1u+HM2ktKr1X43yve12GSwQCKuLSn4A0iS5Mw
 zu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762942068; x=1763546868;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=;
 b=lhV124r/NKFnatI4XoT/CbpzkADy2koAC3eCfKpEkgp52wajro6lcqs/WZJhZ5T8R8
 n+Jtn1g59fXMRCwoctTmVZMcsBQ8dxJUNnXhE8zCNdQVGXyi2lFoTPNYr/QPthPRSKcA
 4kraVJrRwCv2Wk5lYR1XJVr8zal5lBOt+kcBjS0e/h5naDy9+7xIU1QtTTqqGsMp5usW
 Jx5sPE1JI/0fX4b+a1GHmvlV/thHqHIfnG8/0tVVchvlVKLHfeiFslEEjHkE1Rl2Ay8K
 Zji5ePIsF5hfIzrWcly8QI5GQ8pGNBsW0eBDSRuwj5YJkljM7KBdqgW4maBW2Ytftpct
 L08Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIXHAClRiJN1rfrWXXiyTOl5yOACWJxFhnYUEjlRBIV4nlvhNpeDQ2rfY6Y+aBTPW54WMH494xt1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs/OScIVq2ctQS/hJQdl7HNyI7c69XbzUTttq8cbSrtXCP/o0O
 zpMzcFVt/WOs3iIpgKmLx76ZMHgSgG8pMmEotyE4gCNU2RY1LbN+0kCaAvGU0CuDkqgUqwQO4Df
 UnTAlkX+S/YGWgeJ+d7uYVBj/zVP+BSE71q8KCbirb6v8Re/Mwfka0RED/hEolai5pwoBAKQ=
X-Gm-Gg: ASbGncswAhmHaGIoegwc569oaCVZ16VKFCnHhhINK3SfufVKEpNR2hbuDmkVKckNIM2
 O5D1ncts5BHGZcPkFWzCHhtjSdFRIX3tHNBneAe9MCX+aXnO/c08Kcc2FAQi6ibvi0X06oLc3ge
 N6BTXGb7/EsTZ3na0xpd714B7r/qquyQL/HvBWgYrTp+IHWrzMz3PSUrt+4jdTi3BfgW7N5IJNS
 wFxXFzW3hwgX7nytfR6sIMeEqJNOzQVSGLdxyP1YLDI/97nIfudMRrOwJPPbLLVX5lL7XVuEqm2
 WiGqpOtTfoGIRyW9l7vKJv5tPkM3fAfEjfD68BzO5lXyxcYTO69WjvFTR9wkiiYFGiXoLs20DxM
 TUmpLsur2zrLaUll1ZsjZ6zvLSkXaDSS6brUQCrDYpGOwL5d23cy2O7Wv
X-Received: by 2002:a05:622a:18a2:b0:4e8:90f4:c3aa with SMTP id
 d75a77b69052e-4eddbdad648mr18859821cf.8.1762942068459; 
 Wed, 12 Nov 2025 02:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd6taWWH3kgb8r8uxKAXxyDkXj9rB9AL10HGL6oyqqdNWof71H5ltc/gx7kawJfP1MWxxJCw==
X-Received: by 2002:a05:622a:18a2:b0:4e8:90f4:c3aa with SMTP id
 d75a77b69052e-4eddbdad648mr18859471cf.8.1762942067993; 
 Wed, 12 Nov 2025 02:07:47 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72d3baf872sm1427413366b.27.2025.11.12.02.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 02:07:47 -0800 (PST)
Message-ID: <da9e9d31-7745-4eb6-ac24-50905dc2a133@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/21] drm/msm/a6xx: Flush LRZ cache before PT switch
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wsrAd1AI67I55uRt2UxW7tAkMilNaB35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MSBTYWx0ZWRfX3lRoiNxDKTKS
 CLymtbKbmxesFJyzs0D+tyV8d8HShBuHLL2gLiwVkKDBvajUQDshiBgA5vkxNI6kKw+Cm4xBymP
 2juZL0CqfUXmGJsp1GiMIO3uDDLxbZoYNzGoPnyhUmzheMdrNBa215qV2WlZTZSIFm9s+ghQFPi
 QfsFjKLVkenvZwsELA7DNapNEMat+vlbWzxEhX+Gyh+1RHn+dt3Y8YRIqiU5eN0+PTHq4MIJyfy
 C9KAJ2S2J9l8fMCJSBtEOxZMZrGxbNJ9K5PX9Hd5N5QI4gppa4m3cZIhvrVkvDY+Vfg1ddwxZxQ
 2sD6fsnH5iT5uqvkD2Eg4Uof/7baeuCcc+hWp/tn4mGJx5I2EG6AExspXn+OSg1OQVO8mF6h74R
 BltV0MFKeOzUVfQ6ZRL5B3hGZnzP0g==
X-Authority-Analysis: v=2.4 cv=f8dFxeyM c=1 sm=1 tr=0 ts=69145c75 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FVkm2KtGXHSZZ5XTrLgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: wsrAd1AI67I55uRt2UxW7tAkMilNaB35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120081
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> As per the recommendation, A7x and newer GPUs should flush the LRZ cache
> before switching the pagetable. Update a6xx_set_pagetable() to do this.
> While we are at it, sync both BV and BR before issuing  a
> CP_RESET_CONTEXT_STATE command, to match the downstream sequence.
> 
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b8f8ae940b55..6f7ed07670b1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  		OUT_RING(ring, submit->seqno - 1);
>  
>  		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> -		OUT_RING(ring, CP_SET_THREAD_BOTH);
> +		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
>  
>  		/* Reset state used to synchronize BR and BV */
>  		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
> @@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
>  
>  		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> -		OUT_RING(ring, CP_SET_THREAD_BR);
> +		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);

IIUC downstream doesn't sync here since there's a sync after the LRZ
flush, but I don't think that's a meaningful difference.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
