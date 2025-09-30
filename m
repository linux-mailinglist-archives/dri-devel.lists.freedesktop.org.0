Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1446BABE4C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371DC10E28E;
	Tue, 30 Sep 2025 07:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbPXCIfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F316610E28E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:49:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HYu0020364
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tcDYvvx/kWESRIwdIUfePzUj
 wXfd5DkiWsQQ0UqQcPs=; b=mbPXCIfsnKiNtisq0erGetEyK+l37muV+7YinheB
 bYj644FZBNuf1NgkhSgSbqRlm+TYG5UJuTdvExajM+vrUhtwvopVf/wSpTJ/WkqC
 hu2tYYX0OahWkjx/XHHgJ165uF0Hdl0hZ0NmfphU42nznbmNIJHNgJcE+NtGueab
 od5nvAuCN+cVzlntj3IJiIy7FHLagNgVuDVgefB2uDbvVHjVWmKsT3TunRetSyK/
 SXZxXbuQKgsXBy8egQfp4FHYNPv0FfnA5OKfkxqjjmN2DiFC/r0Lp+ZgdSNra7UX
 qUjV2tDvYdey7K8eKSeHm1dSYSwas7M8x+dBmnqjSl5Xfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5r5th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:49:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4de23c3b40aso102807611cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759218589; x=1759823389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcDYvvx/kWESRIwdIUfePzUjwXfd5DkiWsQQ0UqQcPs=;
 b=Qs6G8U0s3uNY0JyxrkIsA2anq/fBagrGwIHU2NFJKKmUZHL3zTNFI34fCl1CkO0yGS
 Nd1KJLuFPUsmxD3gUygtOQFyN64mIQKcH5Z+yFLtzP4usF+M3rxqIq4qimluPv8/BHda
 HUjFrf7IcLp/GX9B3vwEpxnmZk84gNOF94N/eJN9r+OeJOXFEeng5XgJe6zLlIp1COMN
 6kbjaOq8+E2tIlf8X2QJ1kbf5DeKXPvpn7ZwGmDEZ9Tt7LFWdAYHf1fO5j0HQ+PC/K5V
 jwR5GbSDaIQBEIDmnWEcNwScWHE2v78ZU7UOGdF1xcmc3tj2u7bN/NZ9Nv4vJ8FDabjJ
 giQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPrHJ3h7THkpCzEBz8YCuF+ESTlVddrg2hFqzZDfwfGyzXUoIjjncnPaPdaiW8fL1PrZ7hZX8UXCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzStmvVHDMTb05zg/ZAnGgZp04D7A6erhwenIemBzEpkmECPKO
 fqlwor42kl78sY1ObqaBdYPz1wpD1UtgECgUo2L1baGYQivhWA2qTklDAMBuVBYbQ6z6BEvulAq
 RhqnUy1JHxgGSEhbrF3WDrsC9F98kufyNYtfe424wwm0hdDLcI8ckI5/Hww9rPvuoxB7ev1w=
X-Gm-Gg: ASbGnct63k0Wp3n4HM/4NqmwRp8Ne3QFpts3/sdtCPTt5vnJrzpI/9plExYPiv4hMPe
 NifrQ0L35HY7B2d5d0Zp62d6haJIuiI0nPFIFNL2YckkVFMI9XhhOjlcovqzzZP3yS2kTBT/vLh
 rcb+T2LqkWVadAKtXyeAptdzT7PchAUSrlV8h1a9vpQHgyioCPtl3GXv0vm8G2ntt/w8k3rV9nP
 czPENf+i9xnAkrDAR/aXSDOL5S8Kim27Uh6fGQem3bweMGlveFR4D1SxErI3oIy/sBRpG1ZlqdU
 BhYDi253QmF0SV+BbvkZqwiAZ7AR9XkClWlTK6t6QuJMssy0eMKuEzIZ8VJn69d4OHOdUNdoe0t
 aiL1p+T8Mclwm9FEUxSBbfSoXTyeD9DsW7eoaP7vt9oTt1V/hRBj77W6vSA==
X-Received: by 2002:a05:622a:17c3:b0:4e3:25d7:57d4 with SMTP id
 d75a77b69052e-4e325d772ffmr15078671cf.80.1759218589267; 
 Tue, 30 Sep 2025 00:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1NOqQxAPdQp+Dh3rh+AoIDtXwXlBUdceAQk5B9YJWaQLrY/hOzC1FHHQS6Zz8p9Hkpk4YgQ==
X-Received: by 2002:a05:622a:17c3:b0:4e3:25d7:57d4 with SMTP id
 d75a77b69052e-4e325d772ffmr15078221cf.80.1759218588705; 
 Tue, 30 Sep 2025 00:49:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58567242ef3sm2908507e87.19.2025.09.30.00.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:49:47 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:49:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 15/17] drm/msm/adreno: Do CX GBIF config before GMU start
Message-ID: <ae2ooybajk6mcjggeztumubht6auw5qlhmsdrblikc5ruoxtmm@oj5kvpxithva>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: WuDZAgGQDW_f_MGX4RawV8oIZxDIJ9CT
X-Proofpoint-ORIG-GUID: WuDZAgGQDW_f_MGX4RawV8oIZxDIJ9CT
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68db8b9e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=219S4Ll1wpRkBpzXM0IA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX4q+Z51O39mRG
 XSQc4WwhstUnddfEodo9Yiquxbh4QBV7N+BVrTxeZRPo54Rlz3Nd6iLBddwZYoNZGEs68RZuyek
 xdp3XwpvgHrPaUwJQEjoodc3Ez+JBF7v09PiEOG6yfCNeF9YOwbuE8q+L5w6iYTDYvq0ZI6nvnJ
 KSaaEhxkgmZVdW86rQdhB/sqrAHq927giP9B+USJe7L8NPq8jo6S4z+2153NCP2/lWaNjYoduzA
 +W+XmRo5qIbVWTfu2IQS5BCZcFTuxbG5CId4kIiPfiB+PDotU855MLhJHElwWFbyXcnYqLcyHUw
 wIuq86286+siTATdrUMl8IZp6mdl3k27MylzTVuPLxvs9MfwlOzmmJIa3UxqCaPB5+fn9VSfSbs
 d3d1nyhcY+SgD6I4um2XYwXffMdwMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
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

On Tue, Sep 30, 2025 at 11:18:20AM +0530, Akhil P Oommen wrote:
> GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
> configurations before GMU wakes up. Also, move these registers to
> the catalog.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Fixes tag?

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 12 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 ++++++++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 10 +++-------
>  5 files changed, 49 insertions(+), 14 deletions(-)
> 

-- 
With best wishes
Dmitry
