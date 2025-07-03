Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A5EAF8190
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 21:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7938310E8C5;
	Thu,  3 Jul 2025 19:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRsJwaD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A42410E8C5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 19:47:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563BWG31020843
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Jul 2025 19:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kyjs9KtRSFqqWdHu/SnN7ykY
 05Jh3LfVZ1F5/zy/um4=; b=RRsJwaD4JTLFe9in0afKI1Ngl1YV4Ai1WnVCglxl
 jmf4tzEOSUWJtM3sVCUn0xHaEPn17UUXb4Jn89i8W3YfCa7gQSUcbSIyoMLx5nuc
 pqoQlTnGS6AR6OfyHlc5z47Y6QpMZA4WuL60a1tlRsB+b1J9tvL4HUI2pqPUKy7A
 St/p8y5SjWwVFzHE7zQfiPXWn8EoRKK+26Dt8+noAx9uyh3pJ6JoPEdJd5tVZsT3
 1s53SRBsLzqqKvuUWIY6XJa6zyPSpTXJQ8UmnKVo8jn/aZ60i3jZnj8yJAxCfc4i
 ZWhJxVkz7tni9RYBoihlxpkzcWMHiDlxA9YGIE7cdCZK1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn880f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 19:47:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d38c5c3130so32120985a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 12:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751572029; x=1752176829;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyjs9KtRSFqqWdHu/SnN7ykY05Jh3LfVZ1F5/zy/um4=;
 b=C+ZM2ELlET7gvsmLJqrIb0+mvXPbfewy11V3qE3wR9BnpFoGmEO7+9qZIxNuT2Xo5D
 Obr5JfSyO8j4iCUUeXiIDTvEYVc0ADUI/F3A1MjwiqJHDltcVO5SJRI4/Y6crsr1oR/E
 aDarqKFajMsst7hTMf64DVLaMwXsiehEE/sXGNdpAbd8WHKMYknliWFGrV1xHwZpHy8D
 yghkgI02T2CnQms4eE37hPQIm9mrKFYTvZB/0CtgNqXuHkQkchVn7PRIF208oQiOltDK
 jTdU7hmhQ8XHwNPWB2qPqwAqxJohvqkKVPe0//P/IQYg8kBUOLWv+OTASxNDaQf++fPp
 Clhg==
X-Gm-Message-State: AOJu0YySbfCua0+ZcwtavWgRyZjBkNDJcqLOKU8jcnx/6MHf7zAzVvH9
 xj9vjolJstgjHX2Mbbzke20rN2Ln+ZGHYedQMTSBXoXoeubiNSdXJ0bk5fXk5EUVT0MAxd24PUE
 O42FC3LApveNhlKNXb5ASZqGUFFhy/R0dslF0ydggpu7RcLPUADDg/O/QX+GWxKp2VW0DiSg=
X-Gm-Gg: ASbGncvT8dWHOV5Mvc3AEmkKNasL7D63cnwrDufIKJxxG+Uf/9IfsTqDH6r2uOJ4hkD
 6TtcEGfSiCi4ZPsDE+rMFr5+KltcndPcuKnyO5sKiBj928cx8he4s/GWmpKGJOq1j7SWgMY56Im
 xYAXLHjtV4TjwqxfiXnLiplvZ6sqzHe+070oe4+QeLvsOaupmAceN/sUyvYdIT8TGwgjmAWkUq3
 Wdl/xPZ0i+JDydG7IFCmrG/BpN8+X3k7egej1i6u0qxTUymQkscohFQdJYz4Uqwylv6KSV/U6ME
 X0B2YaKVihMcbuXkw7mHeY/7sZdKkxKCfi+w1Z3ZYfhR8T8mcgZ4k2s5toMYW1OvzsM5Cj0Cdca
 edWbLRo57hhyf6twQXgXzvymo1c5GC+KkmTU=
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id
 af79cd13be357-7d5dcc7603emr30091985a.11.1751572028387; 
 Thu, 03 Jul 2025 12:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj2tRf9bBt4hGhXkfgtHAuEkZL3reD1egDOqsmHrUX4JA7cNn7ybYXWLKFG4hgzOlB5osvWg==
X-Received: by 2002:a05:620a:27c2:b0:7c0:b523:e1b6 with SMTP id
 af79cd13be357-7d5dcc7603emr30088485a.11.1751572027963; 
 Thu, 03 Jul 2025 12:47:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b141ea0sm391081fa.78.2025.07.03.12.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 12:47:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:47:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Update register xml
Message-ID: <kwexjh3eaxerlfbzpsmd6nim5si6zdjpdthrpzcpakhwmodasl@vosfzxpkehxv>
References: <20250703175125.598687-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703175125.598687-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX6TLyPWLY6h4O
 1Vkb//ZaLThXZidRZyzqwXkzVKaKbZn+wwmcXPh1NPlFInqWo/Fh5cFSpIAXe6aEdUvZjEhO6+2
 JXUcpijOPHClLGcXqB6ajR13oZnbJXRu0Meuzk+1aaOHzAS/vkPqN6tx8RDOcFpDoXvTF+GLOdD
 dHEgcITtItz1M4v0gPtLmyvXzvdDMAyJuuRkzrZx04zjmgGWeRD4uPKbl7nQVUIJPnLc8yMwP1x
 tbG1R/CBMBsZdN1JqYFNSphoF1Z49WrDDi8Cb2wQyOrxe10hxvyz17Sf2M2pn/Rn/wd4GiBFWmB
 ZdBzconCbmwDbF9miyEy3+6Enhkg9fkLEH7R2FGVa40jLYcXo4s05SZpdkENLBvFp0igmD4/jwH
 IiVtrS5ls35w5Ux8uEXeeoBcVSRzwjzDRgJgcyEOpAhknsQ/Ja5iGNlEZ6Z1hJd+tTxzLmYc
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6866de3d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VrLyofq7WMs6qTrs2fUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SM5ZtTZG95mHZSada-4Jt6U-naS_wScW
X-Proofpoint-GUID: SM5ZtTZG95mHZSada-4Jt6U-naS_wScW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030163
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

On Thu, Jul 03, 2025 at 10:51:19AM -0700, Rob Clark wrote:
> Sync register xml from mesa commit eb3e0b7164a3 ("freedreno/a6xx: Split
> descriptors out into their own file").
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |    5 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |    4 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   |    2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |    2 +-
>  .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h |    4 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 3582 +++--------------
>  .../msm/registers/adreno/a6xx_descriptors.xml |  198 +
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |  383 ++
>  .../msm/registers/adreno/a6xx_perfcntrs.xml   |  600 +++
>  .../drm/msm/registers/adreno/a7xx_enums.xml   |  223 +
>  .../msm/registers/adreno/a7xx_perfcntrs.xml   | 1030 +++++
>  .../drm/msm/registers/adreno/adreno_pm4.xml   |  302 +-
>  14 files changed, 3312 insertions(+), 3027 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_enums.xml
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.xml
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
