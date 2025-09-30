Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0452BABCFF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CB610E507;
	Tue, 30 Sep 2025 07:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="emTznH3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E866510E506
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:25:37 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HOO5014790
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=geMF67s9lK2e1WUJdGTKamsD
 rkDJzWkQ4J1/vFsh4MY=; b=emTznH3ez3asNBmGW+AXo+80/eVD9rTybYFwZcg2
 ts9ACxZQR37p41NlYT55EjyOJhRAHavX2BiBFPHDQsJcD7H+ENH/w1/x6puGBB0w
 sBfNaHAii2RLUAeLz8lS8fUB+Fbf36NbOk8tZ1NnIF3/2F5xB1HP+xW6G8fGXWyB
 BmQUgrs0JdGiqNhgBfHoF++3COil3V/aguBgKHGrVpNAk+RoUj3M+e+5U0zba0cO
 kvzGZI8AmCfNx1OJah+khh0Bd1l9fQrB2ggTVxgF8dQW4ITzr7A/SBHbVlVUA9Yv
 UbF3C7sYepsLZ56hGJW/x/ZqkxoJtbiyhgRX27XPf8n54g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr025m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:25:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e0fcbf8eb0so54784361cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759217136; x=1759821936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=geMF67s9lK2e1WUJdGTKamsDrkDJzWkQ4J1/vFsh4MY=;
 b=p2oa4noEcWHiasW2O2SeX7f9cP2Y/SClct2IK41WRW4RdYf+KVnLyC5wTM7/dePuVO
 BWOvZbfUqpZkIMevo7gD8FQP9fHgCj3i01bfppCX0bmQuqnf0naK8YMaLEZkQ0I388Uy
 J65tU3+kua3dPoji6N5ljZ3y+g0HHL/5Yd2PSotVIyoiVo0eEcvuuRtGag6V8+AH2w9H
 AB5XgRuiA2zjx7pg1+V0XulGnfAFQAoqZwkhFGQzCSucfgBv05H4//o5OS85S+39lbI9
 H5DGdJjB8PPWwSsnRv8RzHeOctiXWjSs5gNM+ukNw4QdzG2IFiXEUf5T+3/7CkS6I2gs
 W2uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIgF/fQMlFQ80WjIEXhSeTTpPqFSSoshAbagMZkjC1Zxp0tuLhn2BfeYjJ25gEe4fz6cTj1wgkpGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcwcN14oBnHdXRKCCLolP8v0q7XjwudDeZzqfK162UMIwUZuWX
 foOtKJo+7drPhCYJ4ZD6+Jd/sKJe34uW4AAmtJQ12rlRdVP5WHse0JqR6Iy+PhdZswEQHnPD3KU
 ptQUctb8ZWzgYMTs54h5u7YbCNj304pv4b6lJbv9Aax0GprSZXmS5QY7m3kBVELXB3jxoEJc=
X-Gm-Gg: ASbGncsdq9LPzdnbkXzLcsu936Ql1pn75lvuwaoZcYNG5e04ZDRkK1KSGcNYYxP5rWm
 JfdLOfYC+svz6Yk3XtLaRInGxas2+QNLT7UyOF9I+DYu1HKO4bNcsOLEoo4nroqj2fYJNqBO9fo
 HlMxrf/It8qIx0u4cbPqdCxvqY447pDSmNmiWUTL65f5kVXEPb9jTZ57Z2kPXBISMzm7KqtfiGH
 yuLJLHFPzuwZUZIzFvI+1lUl1IDpNz7h2GI3LxJqLaGrgjbJN65DdH9w5mTZdCOJP6Fw2LJa7rB
 RICSw7F7nbhD+ajhjmHHltNjR93jS22zbJ67qdKqt/qf9vfV/+dFzgBnZaFcOEdwALM13/7+Wy8
 e17kdr2SNpi8htFtlZd6gmNUh0NUZxXmdpsqu2nTJfuOI3Cw9zdVJ8cy2Mg==
X-Received: by 2002:a05:622a:4b14:b0:4d1:ae10:5b1b with SMTP id
 d75a77b69052e-4da4b42cbe4mr262137691cf.50.1759217135807; 
 Tue, 30 Sep 2025 00:25:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFydm8Witpz9fh7gZQkdonO45FlyJzofDOb43m9RJWVluGKuEzZbINbtIf8sGlgSFb0MqlQSQ==
X-Received: by 2002:a05:622a:4b14:b0:4d1:ae10:5b1b with SMTP id
 d75a77b69052e-4da4b42cbe4mr262137431cf.50.1759217135307; 
 Tue, 30 Sep 2025 00:25:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58619e6c530sm2504496e87.93.2025.09.30.00.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:25:34 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:25:32 +0300
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
Subject: Re: [PATCH 11/17] drm/msm/a8xx: Add support for A8x GMU
Message-ID: <thvn5qhq6lhweceoofuj23bzyteesdorjvnhpves3bbszsm7ni@zgvdn5utrafo>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-11-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-11-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: xZAjp1LBcPhK9ZJS2odCCE22f-tkLWvj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXyXD5feNVebpe
 NZm/vqcBBqU9gMES20ipCMetpZ/zNWN7v85Wa++ekoIz9WTEc+x6/7HyTNY9qZH//iN26ALCLpM
 /Bbp/UX0ADhKzPUzWsQgeJDxthkG6Oj+UYwoleiwVQiEP97A+PvBIwAkpfgXnqj+50FFI8bmKE+
 L2YQRH2TBVeahXX3BaX7QxbxVL9obS8nveNLnCN9KDIOK8xw9wGNU9YZ7IQuLjOhJPA8ZrZ6GdE
 jnpfzaLdO2+LRiyAev1ScILOjq+/fCT6dtKmE1fU1IA36VLtsuChJH/lN1AQX+lttTfaAw1pDIT
 CRlrebRHqb6sf7sURcMrgDL3xTmTTD7wY7z6xOCvbGQ7DIQ/uWiriYkTUbwlnAggOk75s1fz5i8
 i4bFXl+Q4jYZnTydUCe9+5GziMUUow==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68db85f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Yh7iuwBG_BicX8m7FkYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: xZAjp1LBcPhK9ZJS2odCCE22f-tkLWvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
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

On Tue, Sep 30, 2025 at 11:18:16AM +0530, Akhil P Oommen wrote:
> A8x GMU configuration are very similar to A7x. Unfortunately, there are
> minor shuffling in the register offsets in the GMU CX register region.
> Apart from that, there is a new HFI message support to pass table like
> data. This patch adds support for  perf table using this new HFI
> message.

Documentation/process/submitting-patches.rst, look for "This patch"

> 
> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
> to simplify handling of MxG to MxA fallback along with the additional
> calculations for the new dependency vote.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 161 +++++++++++++++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |   5 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  53 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h             |  17 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h           |   7 +
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  48 +++++--
>  6 files changed, 242 insertions(+), 49 deletions(-)
> 

-- 
With best wishes
Dmitry
