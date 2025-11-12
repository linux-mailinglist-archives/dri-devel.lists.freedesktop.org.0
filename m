Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9C7C519B7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 11:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1A510E032;
	Wed, 12 Nov 2025 10:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHG/U/xg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrTWhErY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DDB10E032
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:18:10 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9X3EE1001824
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s/lopT9opyCf90Ve+odq78rypOpIc2a0jmLTtA1UVZ8=; b=XHG/U/xgXOWnwci/
 cbr10cJY9Vt1KgKxrd5wTZGGN7zmOyK3bgcF4K16kGw2s+flbPOVsa5yuY+U9C71
 GUdBTbMP0/9VrCf6+FqRxann05mQXG1D6YLuLAQXMEIFZSf0AUa5FG+JoX3RiyAB
 RR2hEBqBi1jo18d4cxDgheO984q1tR9tsiBCi6yksRqG1uO2QaOVtW+GxTpRASn+
 Rwl5DE0SBlnvtnEfMDP1pKUdc8H4naeKgABrfuOEZOvelQhB6UKWgk69l3UKWmIF
 /z5QGbCOmHcBTIBO7rx0gkghX2PaWhX3rGTitX/HYNfaSywUOHYw6jsPsXOxVZwS
 PykLqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqq207ev-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:18:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88233ac98f7so2191956d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 02:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762942689; x=1763547489;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s/lopT9opyCf90Ve+odq78rypOpIc2a0jmLTtA1UVZ8=;
 b=SrTWhErYCslCVbJlhzOtR3Y1299FE3To1uLiAeQMP7fQ59PbAYhcrgyQP4b+AH8CCu
 ux+3Ea9IeN3LNCn2QuSBFK5aaxSGGgB3hmzbJzZNCZi9VUFWlSmoYMFczqsNtoDoTcaG
 7XYISqA/s81f98voujSrdO7ivcsoShePUUBPkS/TVTBIWBzCa7NMV5rzOCxLOVmYH9X1
 f2pTvRYktqtKYdCtJA/59lxrWozlrvloKsSkf1QscMseMbpCifvYEJG6f4wPp/BGKoAO
 t8hVXQa4J123lGma6YHs4rCZbjfpGlV75bx7H/jtAKy0fT+m2SFbjaYdwxMr9veLdrLZ
 9rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762942689; x=1763547489;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s/lopT9opyCf90Ve+odq78rypOpIc2a0jmLTtA1UVZ8=;
 b=WYWzlhBjQryP8UyXZDrJyumP1KsEwXlQfRm+NEpAZZqpkgxX3BoCzawpHf3YJP8ZR1
 cXqZOLqxwLA5uy4QOz+jOjOf34oMfhPMJN36Pqd1eePTTKQE1VsgbdwYdSwrcFRTf3bz
 40tsUzIeHAb3B6ndtRnSbQMoJpuAIGEZ8dhlrpu3TlHMiAXgSCOCeJ1Ci94gG2AlO83F
 wdApKi4toq5KoRQna18CbMNAKob4vw5A5DJYvBfDwUSc471bJHA2CBdG7mJdNLSTmRQs
 dTUXHKC8QmZ0V331Rg3OFojC553nLxGopizQpC1QzDYoVX5gDq57W1aESlRnEhA1KY8s
 mV5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKbpKPDlE4lUg/c9I3SL6MG4X4iY+pyzmFrE/BplI+qgRwsGDTHpFFZk8sA4jNczltwX0TjgQtStU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXgEWXLwTQVuEXVNgdU78tDE7XzrifSIE7MteaskZJ5irouB04
 PanuEhebCzI1PStzYYtR5LDqozAOZxRhoMiTekXSTX5IFKpXwAWfbRiWoSwwzUT+9Dyexz1PmTB
 aReMps6iJVuif240F4B/u6/0qDycyylH784KiT6Vl7yOuv6l8+KO8ZdkuhwkiHArEzowLDE4=
X-Gm-Gg: ASbGncuLLl/jMEaiuj11hi3RkpQ5PYoHPWu4JhxQX/Am6m8qvAeGIfHmXjFcG+FB38G
 4nM+I5Bf/pclV/i9uTpmb0rd6k6LyMZ0DqRFb+IvvW8qu8u81tKRKMMU1EG1xSQ3ima/Bxl85uj
 8VVNM1+TeQuNaUfoL0DOC0Cyn0MnsQJbOiafbpeHKTelqBv6KucxDVZHptx6xtzXTyzwOpyZBIX
 GGx2X/ECwHsfdJbYS/Zj/Wdj0WofKEnbdq+lqklcC7nBhvFXqBdi8nyBjqlIYk8230T5F254DAf
 mLiiM9SxjmQK5bp3HAy0soAunfhuhblUuSrx5MCzAlupEXTe8vPALM1euTC5U8fEBzwXLEoG4tj
 a9+mxSxcF2QFF8DW9gaT0+gNOShuaedLm6iMfgWFilyXZzrLO+39iP+Ov
X-Received: by 2002:a05:622a:2cd:b0:4ed:70bd:d9e2 with SMTP id
 d75a77b69052e-4ede41f17b2mr892251cf.0.1762942689284; 
 Wed, 12 Nov 2025 02:18:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYtQ29X5tXvxSDaU/JA+AKkzXH/dnj2dUKb+nxLC9dFOdNM6v1tgVxXnY84nYUEM2+bTg7cQ==
X-Received: by 2002:a05:622a:2cd:b0:4ed:70bd:d9e2 with SMTP id
 d75a77b69052e-4ede41f17b2mr892001cf.0.1762942688856; 
 Wed, 12 Nov 2025 02:18:08 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f813eb6sm15397422a12.14.2025.11.12.02.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 02:18:08 -0800 (PST)
Message-ID: <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/21] drm/msm/a6xx: Fix the gemnoc workaround
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
 <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EbHFgfmC c=1 sm=1 tr=0 ts=69145ee1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=B6ldIsYNqgrP1okBzpgA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 5uWLlqoyB13I7P8lug0Qg_AerwZnJqoz
X-Proofpoint-GUID: 5uWLlqoyB13I7P8lug0Qg_AerwZnJqoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MiBTYWx0ZWRfX9TpERdS+VOTC
 Iz3aDFWpE2OlWC41H4YHuxIlxDhkeSzqyVJNsbq39OVm0PGPM9QAlQOvP6RQE4wwup++kF8P4b1
 hZSIFWhq5n0v5+UgMl7jG2WcEeuJtDRA/EsWDQKnp8cZMoDcbP/x3g4f/3OYsyHRhBH0TTfI7+H
 N0DvFkPB/RT8Zm1luc0DWNFe6cpJuG1aA4xdiG7fwlHAapEtiksNI1a774RPcTgn8bd5LDIJvEV
 hWHnbDHxdTcNKqsrzFHpdIrxPsb8t17kL3juDhaJWaE6Otz0ZAuaxCR3EDBp7RO+88ZuPNrH+om
 LIipG5rKYYRsTtwdwitpp93jataAZKzGDOVOVZFqo2uFxepWXWAJWtj+3FGh1QcEaa5K7BgVjCr
 mBPT9AL5pU2biE1RRdWVIduLSQxfBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120082
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
> Correct the register offset and enable this workaround for all A7x
> and newer GPUs to match the recommendation. Also, downstream does this
> w/a after moving the fence to allow mode. So do the same.

It does so for _notify_slumber(), but not for _pwrctl_suspend() in kgsl,
but in my understanding, making sure the bus arbiter doesn't gate access
first makes more sense

> 
> Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 4e6dc16e4a4c..605bb55de8d5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
>  	 * in the power down sequence not being fully executed. That in turn can
>  	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
>  	 */
> -	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
> -		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
> +	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
> +				adreno_is_7c3(adreno_gpu)))
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));

Arghhh copypasta, thanks for catching this!

Konrad
