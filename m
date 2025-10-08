Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFDBBC49ED
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 13:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCA610E0EE;
	Wed,  8 Oct 2025 11:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwqS+2Up";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B133210E0EE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 11:51:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890PAK014221
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 11:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y0WlonZzhT+aPa6S+klAQl8ZLyn+O2jbA9B6NJTdYUU=; b=LwqS+2UpafhDGXMn
 Md4iM6GKpIekhqaCFz7wXsm620Hpq15SUXKTd5hrq6u4CMxSSbdB7NU/JgbYYor6
 eIl9p6Ie88g2nnDXQysZo3YslcjeJjAw4TY44eTsOyGaAKtyLrddepQrFtebSDTc
 JpOBlhFTNmSqWwnGt2mJj8u2H2p6MNyKJJrrStfnifBDGgnnGQOPs13qnRePKx8S
 fcKcgr8jWXjH/sWfDDIM+Zq96LbQZbEwxH4W6pxh9JMKq9VqI7JuuFNM/ShdG3C6
 IhH9Jl/28oWOmhozi0AC8Zf4fLErFyoPHdnkp3DeXLaqKD3jMP4SdeFa7Z0Hje9v
 rxAukg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0p0pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:51:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d8c35f814eso16681501cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 04:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759924282; x=1760529082;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y0WlonZzhT+aPa6S+klAQl8ZLyn+O2jbA9B6NJTdYUU=;
 b=xCvuPgbnnvmoGdVk9sm5gNMN9eDC57xd6G2Rg3Gn1FhTWYDUDpYyOoFmxvJ/a+JmZ2
 W2NJ3yHzj+lpl+R8Dk7CablK5O4WBb9SFETfd/L6zZYeB/f1aahUgEblnrEMDsUh4knu
 xbWmPTNjzYTiidXfSLFjLob/ZgZ2okh/HM+vnXJYhKuK3UbrKYSN2tU0JW1BB4JfmorK
 nztOracbonavLteQdneyFipBGt0IitcquqOF5kgFvvcxLLQBZlX+RoVBnYcQGZaTIUVU
 1aYPkh2ewzky3+Q9OvRB4qUJ6Rx279zOhubey4jX8x9t5bcQ8s63qWu1kEmrLEjkim1h
 3MiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWds3BhvlGexPx7KrFXKLSSJ0m8z2N8tDIi7AFZu1GGsuNd84aWQrc07q9ljT/Lzwk22EmQBawHzuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHkLczDia1EQi3jZkqzOTTCNw+l93frBQEoxizkUdL8+fDblPf
 tQVQez8aO8E5Pt9qjl/zf/PJGBkUsh7LTq/DMhsz6b6zSyYtWH+/g1HWh58lZZPZ7qC57n3Il0g
 ScoyQtQc2+FXONSP23S+MdN8/F7lg+4LIv/UNksc9gb1NKiAoBfxWHhJeamPFghdw/7crefc=
X-Gm-Gg: ASbGncu5qT0/ITPcNrmm89q1O9mt6JSV+2JOo1pdKPW26Q4TBAvLQm5FdfcTHyFVQAh
 zourlHW1Osae3U1PRB3rOj8nbj5N6tt6PHefeoyxHLyt3763ttqvcisze+CRD5QaEYEVVW2lO7+
 G8kqMFbdjn4Z2X83jxIbanlxioWATKvs214NM+FF37jGXLTveu5cz9M4uNuE4KiM7lhZGngzdnG
 c5CT6BZ1EJS08Ad++etNwMAPP8CpyZimWw0Cc/CKgWhoT5mVaCCzogDLpfrC6OnsEU6F5CHZViv
 9sfea9Yt67qE5Eg+1J4xBi0jnsJPIOj/eomFVMTnHV8ocbNpl4oVtHMfyh5Nb/9Ed2s1m0OIwf0
 62M5XzaNOzSWvitFfcuSmtVlmxkg=
X-Received: by 2002:a05:622a:3d3:b0:4d8:85db:314 with SMTP id
 d75a77b69052e-4e6ead5eeb7mr27149951cf.11.1759924281821; 
 Wed, 08 Oct 2025 04:51:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2gWRn31Utay2MX1qgHKnxPLPzAbFxKTM0QkU36eLSGUOX9zyx3iPasVrXq6nEJTPeMh4/9g==
X-Received: by 2002:a05:622a:3d3:b0:4d8:85db:314 with SMTP id
 d75a77b69052e-4e6ead5eeb7mr27149701cf.11.1759924281298; 
 Wed, 08 Oct 2025 04:51:21 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b37bsm1681982366b.53.2025.10.08.04.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 04:51:20 -0700 (PDT)
Message-ID: <5a027440-8720-4df9-a793-5ac3a624ef60@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8hMrnkL7Q5H0EfGfrN49O1LZ7B8iouiG
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e6503a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=abYYEtMJDLCSMuBgjaEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8hMrnkL7Q5H0EfGfrN49O1LZ7B8iouiG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX7P2V1UbtGFFT
 wDgp/koJfRZRB142AwB9NMEUUVJ0AH42LvfqDtxb7PQAX2gbe7gk85wDLo5Gmy+B9rwBLFtNBPl
 HdmBoBZDRiltNgbLKz0IhtLZVlIQP4XzKfMwmvM0z7s+QmL/b/rteKgxZ1pWW/8r/dlvJOF0/2l
 g/5/VG4qk3g6TyBulMr38n/jpbc9Cf5Ik1C6AvgppPhSFkbBCdakpN0wRqlTInJAd6ocLwGFva3
 L3+ioahOaceFO4lwR7E+Az6xskmWj8U5Zv3Tv5b+7xA7bAOGnJtx9+VarV46u74Dm4WsZMUHEIL
 lLCcm/e7Xw6rM5wIyuG+VYMNBNwulMU2wUbzKXSKl4Zt4L+48yIa3ZzbaFIzib3c9gWkMoY6ZM0
 nQh8iSkdlkz+4IWQZ+7D5TAneStMzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123
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

On 9/30/25 7:48 AM, Akhil P Oommen wrote:
> GMU registers are always at a fixed offset from the GPU base address,
> a consistency maintained at least within a given architecture generation.
> In A8x family, the base address of the GMU has changed, but the offsets
> of the gmu registers remain largely the same. To enable reuse of the gmu
> code for A8x chipsets, update the gmu register offsets to be relative
> to the GPU's base address instead of GMU's.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
>  3 files changed, 172 insertions(+), 140 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc717c9474ca5bdd386a8e4e19f43abce10ce591..72d64eb10ca931ee90c91f7e004771cf6d7997a4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -585,14 +585,14 @@ static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
>  }
>  
>  static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> -		const char *name);
> +		const char *name, resource_size_t *start);

Maybe you can keep this offset variant and switch to a simple

devm_platform_get_and_ioremap_resource()

for others (also letting us get rid of a number of iounmap() calls)

[...]

> +	/* The 'offset' is based on GPU's start address. Adjust it */

That's what an offset is, no? ;)

I think we can drop this comment or move it above the #define

Konrad
