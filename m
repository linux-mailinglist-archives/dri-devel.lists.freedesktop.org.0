Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7135CBABC29
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F127310E502;
	Tue, 30 Sep 2025 07:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMRR12IS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DE610E501
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:10:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HRSx024086
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mWB5st6dCk5SY60IEgGtzAA+
 H2jR/8jDg8gNG+7YCGs=; b=kMRR12IS8enm8CrZ8x9ZiNOF+G75w47cVG7mJiT0
 4MJCbnIMoifsmQJF6Qw1/CexJ1LSiBRaQp9oqReXZnznbu9/QH112t/NEIx+Krud
 5vN+2sk+w002UwpGj8tjqEZgh/c96L4wMX3RZ8Jwj8fCSpfnC5/ZZQX7ymP00+X8
 4VWnT5zGFBv2d7SVA9PiTWaA4ENPUYV/KhGo9XBZqbAQq78ZG2h2OwQK1UaYGDUY
 NRs9rGVEq4wiN9orST9RFK3banvnqwa1y2Pdd0qgyaXPNfQhj0/Hvd+q1GVuiaCF
 TZ9wz+TV2siD6SMBEZ68Gs2AbLvGi/p1X8n25Cr184U9Kw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n0btn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:10:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e0e7caf22eso54121511cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759216201; x=1759821001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mWB5st6dCk5SY60IEgGtzAA+H2jR/8jDg8gNG+7YCGs=;
 b=SJrWKeEtDpqhfUSpeV8AzBvmvvcq65Lym3pYqhpY2sA7O1MZ5rw6vLoYRLfnaQjjDN
 /2rgSIj/4Fzct8uxrCr5WPivDPRNfxiXJEPMkxoUpGaKd1vg8BficMeFn5ObNy8BhQxw
 vA1r4q1wsBtJdDj84bXK2ShniFt2DaHGN4IqMKqByPGm4OO9+SeaGEEevcsws30XGCQ0
 Twam2vfqgpAsNZEOY70ZDig/1O8xSay9xpGcXi1zQKF6ELakBUpyoEIbh9+F96I+uv/G
 8DYBxk+jnS5XfM/w25Fwpjumv6ElmWHZi2elBXfafK7YgKC/QD38Lk929KlEQ/OrQYwF
 EiJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX37uAiwzPyFMw/YV7J+/x6pLdKjnh4VdN8AzlJ7xdadfujO851pDlH373YTMeZWkSIeBVhHsOGI7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP9BOR+U8bSYgVXKUi4jwGnEQC5xrUiptUWozQcfM51mRFtuH3
 T+MPpZs/8E8HCVz1IL+TdoVJjHjJ6eBa13H+14O4j5AhQoGUMe0RE1yfWpj6P4j8AL0hQizBVZF
 AG20jsGh6qzVx55yA07DZsGX+65czX7qctS5jK1yFyGsqZwdI6g3bULtRV+vwewQLL387Em8=
X-Gm-Gg: ASbGnctzA4nS23MB6aYx5o9wEVUjRG8tLQoNb6Bi6bG/k0cqxnHs8uihmHJlxKc7WHI
 1RKAwTBuQtv6/9cU/3DfNwzimVV4UybafxYbwsWPqYLxOa05oQ8bpVYwvj8JDB1ryp65KO5Tk2/
 p7E/oroyTMTLb3cgtdCObypbKkWcKaNtfkNXI7YwxpBZmEMpdnQVdakVDuA0hi2of6g5QLi2nne
 0ER7IBV1agDdL+3Yabe/H7bwqnvUKazx/F9QHH4JRCxFeCL3OZPN4ZFtSl8vPYs/bXPL5IjYRUN
 TZ5Ar0IQv28MsvOniHuwaGFpAzKan6fRHFI2ACDNRPIV0n5PMUWg+CA3CZx+IBAfAu+5K7w/dyv
 a39xR65yx2NBpwUDkRqk5W3JkeGnBhAkB59NxNPXHUcID+VuVSPoRNMfs+w==
X-Received: by 2002:ac8:7d10:0:b0:4c9:3d38:1107 with SMTP id
 d75a77b69052e-4da4b13ee9amr205820151cf.48.1759216200763; 
 Tue, 30 Sep 2025 00:10:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqfXjb8BDoz0OLkhbqOSkOjFYvwz8YqZOgVTFVVpG1nTKdQgXBzxVthwYLzYpdiitvJ/C4Vg==
X-Received: by 2002:ac8:7d10:0:b0:4c9:3d38:1107 with SMTP id
 d75a77b69052e-4da4b13ee9amr205819771cf.48.1759216200128; 
 Tue, 30 Sep 2025 00:10:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb7710256sm31171981fa.45.2025.09.30.00.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:09:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:09:57 +0300
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
Subject: Re: [PATCH 06/17] drm/msm/adreno: Move adreno_gpu_func to catalogue
Message-ID: <cp7djnezyp4whhfqcnsfpes5kxfbyvqvc2ceimdrnrl7s7agyk@z7ozx6oihezd>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: mAXqKxsbNLZZ82a21Cje6qh9idbeByNI
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68db8249 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KsGV-J2CeG6-G7wVncMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: mAXqKxsbNLZZ82a21Cje6qh9idbeByNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX2qOKs9jOz/iF
 240in80vEK3kbuIpBrk/N8ttsZZtRYfNB51h0EVNlh/2zuf4Q/OsErwQhPwKmcjI/Y/MmMAC9tu
 SEnLBXlReR0+/cudKK414uPA9fWZVCrJeNYp4ZBjHbLEP1G3l12gP+awWaKDJfbrp7ekub0JIOs
 y0cO9zjsoKzrQetDbZ3aRjYj1WRoMwbFYrLgwa9W5FDmDsvOb70vmTY9YUk8orvRcOmMSTYFSDX
 ZvldVFa8skgtsM7iwflAbne8AJJl/buOkP/Y2hMGGlbcdQKeK6yMyubat1xpekxnN0+H0nB3q/5
 s8Ni31q3+wlfCpVxtvOXR1W0Ez4DBqkIqzXn66pxUW/giA7seTHfQfCti+8ZE6Y7WVfQaEGI0OE
 sPEyKBVREPc6oP3VUEG3bQrB7QhEng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
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

On Tue, Sep 30, 2025 at 11:18:11AM +0530, Akhil P Oommen wrote:
> In A6x family (which is a pretty big one), there are separate
> adreno_func definitions for each sub-generations. To streamline the
> identification of the correct struct for a gpu, move it to the
> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   8 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  50 +++----
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  14 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  52 +++----
>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   8 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  54 ++++----
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  18 +--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  61 ++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  50 +++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 209 ++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +-
>  12 files changed, 275 insertions(+), 262 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..af3e4cceadd11d4e0ec4ba75f75e405af276cb7e 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> @@ -8,6 +8,8 @@
>  
>  #include "adreno_gpu.h"
>  
> +extern const struct adreno_gpu_funcs a2xx_gpu_funcs;

Please move these definitions to aNxx_gpu.h (a2xx_gpu.h, etc). LGTM
otherwise.

-- 
With best wishes
Dmitry
