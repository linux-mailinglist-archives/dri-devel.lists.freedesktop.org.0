Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA94BABC3E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EF710E501;
	Tue, 30 Sep 2025 07:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWBKbjC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3968710E503
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:11:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4II2X019050
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kCgcpA/KH22QIJWR6lWCGCo8
 yAwGEj9Grr0AmK4duj8=; b=bWBKbjC8XOLZUBjxlVMArnVyMUk7L/cho3IZ8cAF
 EL5Nz+r54Fs8LIgnnKp8AbYGTg3br1F/XM8U2PrL7PYLnaxGDaTD0JL2uFUtfV50
 V3wAHWQYP4dEKJhvFclfk5q0U3mD6yu3gGTK1NwkDJEx6D9m0AqyNnA+V4M69j26
 PGzcRT+HCKxiNgdXHcMizv+fZtvCp8dSRx/J50S00rvzJlBE10zqROhY4ZkYNuFV
 3V2jA27AXp0UmNXViOWhJ/Dao3UhjAdPPKDHy7dVBl88m4i4xmnbI83xk4iHMjm1
 93jlCRiUpvFuiZjBZj3/BNHnHDUFO6ciosLCHqIIJjqCeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tr3g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:11:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-856d34460a3so1245981585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759216286; x=1759821086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCgcpA/KH22QIJWR6lWCGCo8yAwGEj9Grr0AmK4duj8=;
 b=pMI0y+qDspCeKj+KEshFl7Bv8e0ripZvJFs0F9iqwCb5UgFFgY+x+6Xp3dkJVkr5wS
 JPiT6zDR/BkFqUYnKShqH7Y1UqvC+SHSi9sHV0EEcFPr2BOs5Q5LyMwwDho0YIsxGHOB
 WYiI/r75FP6Ed04hsjPNxA0mEFXJ+idUoPr4Phcv/8Xhq2Yr0U+ZW6SzSs4E35Q67DiC
 fCmFi9Hg2M49YaMf+aAZY15MlTfV++deXJKL0W8Q2IxL338Rty7N2n8E6PRvt02QbvOk
 Rl9S2Y7IIC+4Y1BeeqHnajnW0MfJmH26vTG+cQJ1SKxBDrh9wc1Gbxv3Ipj1+hg4b1Y9
 hQXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7beNc1d0xbLvhx0gYjy9KrNnX0oP5KbQvJskbNcJ+3UjzLtBWVZVizIJWgjJR84klBPgIsy3czFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwBKxHSCwEwCSf2CmoDF45bZwzKbUs8kUraeLL12gklycvj/1R
 UnsUWI147H98DEN531OrvqpN4kIW3yxxrcbvsDYaIp0ZLlz1wo1q+xH3bse6OADuMiHxHgNS8tE
 Caj6NPT/b611usWl3YyNu9LqFw+Ro0NR3+aAGFtDlkXjOELM058b4x5Y2IM8uonhn+bAAm10=
X-Gm-Gg: ASbGncunZCGeOyDvTl5RvmGiECyUCNF2fUE3ONyncrZuUQq6jLaZBjPKib5zlwt8gEN
 5FHScN/OatvItqod/+nBm3GPp0k3wvzpLbLcDNw/X0qAFZDS5wxdNAuwAnx+L3kOWe4OA+c3ECS
 7sv9ViAJSvqi8RPTZGv5feW712AdsHum8/h3wFPwLR/eoY0auHqs0VQf/vKL38R4Mud9+tYb+vr
 zY1+tDD9ZoMlMfPYYe1+7dg/sMuMHcbU7/8AVmKmp0VluWgz+jFXuzI6qjcaGxaKmPnUFpPrIyU
 0lLZeW3c541ZQHo5yrPv+QvEk25G+BYNP9Z6j/wWaQQ7O8pH/MlKfAXEcynavr/1El2Wtq5+T6A
 QQCeZrP+IPVwSAPNWpHabEh8syG/liepeJt0wS0OGGuG+yOiA+dKecjl+zQ==
X-Received: by 2002:a05:620a:1a26:b0:858:64c:22cd with SMTP id
 af79cd13be357-85ae94c6f9emr2830950885a.72.1759216286502; 
 Tue, 30 Sep 2025 00:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYRbssu3zrykdvcozSbij6HKAxVNsfP55t5zEwTHN2XSjTz6lWJykcsj3kQZuHoluEGfqVDA==
X-Received: by 2002:a05:620a:1a26:b0:858:64c:22cd with SMTP id
 af79cd13be357-85ae94c6f9emr2830948585a.72.1759216286049; 
 Tue, 30 Sep 2025 00:11:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb4772cb8sm31868951fa.10.2025.09.30.00.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:11:25 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:11:23 +0300
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
Subject: Re: [PATCH 07/17] drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
Message-ID: <x7segnx2v4id3qw2zna6vxxbomfcyogib734ggifggynyfsp4h@7zs7savbiz7a>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-7-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-7-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXy2nzGvYsxzVZ
 /u6znJ0V9R2qFZ9V0l/1rID6uBJssZlZk5wolXGmiw+9GGFxLGj10QQXoOpNsZPno8/Mr2q/Q3Z
 YoTc1qKdHeTEz/6AkB+s4NgTgoXXc+lAPKlg5QjhDVX55NMnNh9QwXBXILEdteiRq3f5vQH8Ogx
 kFbNBelLFROhZgHFlMi73ECM1M+qnUSrkxxrqnu+ioZaz1GHK4rSjLcnRp5qp/2kOzZv32UL0Y0
 Gjt59bauW4OJIOfxKhJfC+ejnQDVuwRBCt36YDhyOuDNCGtr6HJJXPiPFPqeibSHOCkf/fRApmP
 ZCjIJvEPI+OeoNYlkg9MS/Fj/qI8jmrVYqdtCg5ALsUjEvqOXyigebLgH51L3d3KODEBMQzpWzO
 jvOyqefgnKm0lpdJnM+1oHQtitHXvA==
X-Proofpoint-GUID: UGPhiOan4euOz8j0TikfQHE7GW6utxK2
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68db829f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=scbeE0iXsUk0x8BJeo8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: UGPhiOan4euOz8j0TikfQHE7GW6utxK2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
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

On Tue, Sep 30, 2025 at 11:18:12AM +0530, Akhil P Oommen wrote:
> Move the gbif halt fn to adreno_gpu_func so that we can call different
> implementation from common code. This will come handy when we implement
> A8x layer.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
