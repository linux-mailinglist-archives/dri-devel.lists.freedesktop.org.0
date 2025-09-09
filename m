Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F251EB50087
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3431C10E795;
	Tue,  9 Sep 2025 15:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fq5ymuoA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DF610E795
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 15:01:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LUvf029184
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 15:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+YAkGp0Was8SY+eD78frAm2r
 kjGCrvc6KWsSn1t2uZE=; b=fq5ymuoAhCxfolSJ7QsAym0GWLEar7BQu4+tpmuq
 o+JzNNpJQxs4yIecyqSOB/xNjJQlO9N347rAkP7ZFcqiuZXPMbMv+zwM2Y9GhVV/
 s5jvxgSEGG+IQlKe3s34ii9GYGguXNOhEqSWacsDMmxW6uPYXgHJ1xkJPHTRcuAb
 nz1n8yUcCxfG0OMnlj6Ys8VvJc6+OXo+9M9mmAFMRgzffJbiNTXrRV/np8G8P+XM
 zY0DcvMHF1f3ILkY8XU6FWhMUDZ2pkBiGe1uZ3Vi1XTNW1Y9JIPzcK+cLIPm0jCV
 Vwer4dyuWdpJ9jlYLXCtjGGJoGAiJZw77FiF+xC2R0ogAQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8gmfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 15:01:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-52899566bccso10245030137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 08:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757430105; x=1758034905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YAkGp0Was8SY+eD78frAm2rkjGCrvc6KWsSn1t2uZE=;
 b=T32fXGFqGQUEpEpK1HkOy0HtUDcNYkkKXz85w4rpgR+cCy+erKeqMZhvBj1p6ePoIB
 nptbHll+7jb/1vb2+zVnxdlKJLzu0BGMp8JOD/GRfqiSesTiM7k6kjamRvY+0uo3YmrN
 mRSfHYw3Z54EjMXfmauODDg4WJPkEosMcFUUOP1V1uOQPAABqnET3dR7ji/Jwer/uK8l
 OIuMZfRNkQ1UOglmTiIOiWXt3dK0tZ4MRPx1BBGjh4W+Ke17uTyz+/Obz/Rgb1yRPXjC
 GhJgQ7I/xU9tJ5EkVy+WoJk9bDs4/3ew+u80X65lUZGQhdgWlgCNFFGgje6DrxO8ZKt5
 CvcA==
X-Gm-Message-State: AOJu0YzprS8Y9s5ZOIZ+ijJj7k7CM5lO1p0aqkVoa26voLszGR2YBMYH
 WV2GBcE/SzVRzbbSJ/Qtm//QVwsuCT52tdfwYRIHJ343dVObvp15vU3ptLxry6raLilHT8l3XfF
 M6NFqU9D0iZpcm6Zd+QzOenFEsa+h35phuHPdXLeGrEsha6gKP124sFQIWDhl+idD7fNWPmM=
X-Gm-Gg: ASbGncvsdlxmf9Wi0rThjKVoCfJGOoI9+UmCphL8oZxk5cHzNWWGqj0nY1m0U9kK8Ng
 pL4hV9tfEU+vuzC934Qr7rxCNla/ksZXICn+r5cR8zT+I+KoueK3FLIdjdwm3eLOTJVkQzZ/rOo
 /z+3L+e0fhbkAdLfKn2ocbu41i/NstujR7L4s7SNShpHaFXTGAOaFtmi0VGzaGdvlB/MGUtlgoE
 OdyJKaZ8puPeQoVmU4sd2qNUafTvyW2b+WdjxMZkc8nicQUTo9upgbelKiEZG61DGxqenx8GxlX
 67l4WibTfM25IuApESNijygFGl2cR7yfXl0B5bwcUefj8MzQPwzG0MGg0Y9If8lTey+08Qe0eWe
 NkTI68ija877KBP7ULEDJWXkOOnIHTn+JSaLzbk7MSwPCcJd6pHNv
X-Received: by 2002:a05:6102:809f:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-53d1c3d661cmr4304898137.9.1757430103180; 
 Tue, 09 Sep 2025 08:01:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbmFVS3O9rFOkq1qoy/EYq4X6azRKsts/lxojCWvOsI6IFbFnDvbit2/OPl1wUqGZICszRTA==
X-Received: by 2002:a05:6102:809f:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-53d1c3d661cmr4304813137.9.1757430102638; 
 Tue, 09 Sep 2025 08:01:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680cfe2496sm587402e87.61.2025.09.09.08.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 08:01:41 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:01:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Karmjit Mahil <karmjit.mahil@igalia.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] drm/msm/registers: Sync GPU registers from mesa
Message-ID: <2rlos7qjnawikqhotu27svqyo4yevpc25cugscc7tihxz6go73@rfas2xavrn2n>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-6-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-6-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXzRPsXUjWa4Zd
 cLC/5Bp5dSY6St0l3CtK3RISWVGGplm0m8eXVZU+sBczaLr0Ew509y78QiU/hNFri2v3mj4BUI1
 1TSv2hXnIVsrmqX6dvsHCqtwFDYmnhoevU0qikIvORnpNHZdUMjpDVbwwjVDkOOOacuHljKRDzh
 eghdGVaCEmCJ3vMrrfJO9enF71UI+3IeWafmUJ1kzwkHzkzqSOqts2eQhi6t39agDM2QgEfZDDS
 +8ZwWqzn9svGVxhKUlyKWf1aWGerrCXFvJ2IwsVGQk2ZXCk6Fghl6ZuVMd4WJShG2dFXoMzx0Cm
 aWlTaC2gaKzF4sJaxBp
X-Proofpoint-ORIG-GUID: SZmfqZTrvfEAQBsXl-Ebgf9UOcepJbne
X-Proofpoint-GUID: SZmfqZTrvfEAQBsXl-Ebgf9UOcepJbne
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c04159 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8 a=rLiRm7ZfGlefp7lywOQA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509060031
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

On Mon, Sep 08, 2025 at 12:30:08PM -0700, Rob Clark wrote:
> In particular, to pull in a SP_READ_SEL_LOCATION bitfield size fix to
> fix a7xx GPU snapshot.
> 
> Sync from mesa commit 15ee3873aa4d ("freedreno/registers: Update GMU
> register xml").
> 
> Cc: Karmjit Mahil <karmjit.mahil@igalia.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   8 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   4 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 702 ++++++++++--------
>  .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
>  .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
>  6 files changed, 508 insertions(+), 475 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
