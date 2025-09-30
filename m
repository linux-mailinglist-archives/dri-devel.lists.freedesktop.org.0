Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A5EBABC50
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493C510E504;
	Tue, 30 Sep 2025 07:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7dtSxAA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4798110E503
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:12:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4IJ51018092
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aWG8L06mAn41deSqSo+E7yGh
 W76hJZ2Ee3eCES/ASh8=; b=P7dtSxAAUpSrQS6/yJuuLSp9MXXBagIUU63eyHxY
 BDwxk8Zq5coSRul7FNXnLHiLMlgrRF3CYd1VrL4+wNCDypEi/OI2uwEfhZ42EiSQ
 fnxkqeKaizh+eDLrDjUsTOL8AZKDr6+Ru1y51TA1po9l7aFEYSbankaBqDWfQvB1
 JmeKlDi8jRn3DqHsZskcXlsU71+gGEpveKvPm0BAabH7PDBJUlPkY+ZleUDW1Mo0
 rJbDnfYg9J8TEAfglTsrAHOfS8y4UesFIVUbs9qkL4hP6R8in+u0bx6sWLcDpr2B
 llQibxDyLKuXD4//T2Mz+W+CjMxnHXIugB6CVEaj5Rzw2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hfs0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:12:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8589058c59bso1737938685a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759216329; x=1759821129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWG8L06mAn41deSqSo+E7yGhW76hJZ2Ee3eCES/ASh8=;
 b=HEDYJLXEkYpYuxFq9lkNhMswZ1qtdfsnV/5AaSZbJGFnfOIk9bSbjyDmG4Y3cTh0/O
 3s+4PHL1Uhu6Bc8QTas3omQw/Grc9TmhGYDb65lwyxSXs+OJFVhfd1A42alTaloXra3w
 SJkpi4/mQOTQB9C0QXJX8HYfOWJLBNJkarvd+FTshIGOE5NBzzfmZ81AEYO8IUgvO1aA
 eyqbYZzLat1eQ0eYaCKy426cjfpXJjAMiyKBxlvW4hqD5+4vsS5y46RigjO54z05nNg4
 y2UpS/UK46U3NToUEWKDjePGkMWXkK4CtQgZpLWjMCcy5leEFM+zMhXcvSZ1bLCt4Va1
 GGug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVBxPmpXnf8bsr/WTOwilG17aly6n5jCLhjpajnJd8UIvs7i3K2bV/NPD0n0o8KWqmf6fncAt6y7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzfSyrEz9WDMAOGv2vab8paLz2rTjitPQjZC3IMI64SXKdd3DO
 sH0zPrfzfLYeaL3IrIZ9pbysuw63d7rFBDT3DOpVB90ezbY57dIvKdSpUly9zmec3nkC5w5VEyt
 JT+fPD2LMuBjagPRfOGusNAAN0YpbuX1fJ3o3u5Rh6j3YBCVHNc8AgCzdlGZJqVXo8fOPpRg=
X-Gm-Gg: ASbGnctqphv4wutOJooHbScg5IjRFBSrdjTtNYtsrxnCaLQ66IEJjYJgr1lvMa99b0m
 BgwFS3HmYy5zhLoyK5kL9Dh61YYA3gYNs3zfk0bWRIeA9xjJXP/dMt3iGpHqOrRMvTQ1SMofOVk
 nWSWK2fUScRcHtyqvcPcPPB8YSzgS0RJtQEhyKTaTl5bl3krGAIF9FZ+KWZf8CemdSYwmJcmXed
 7QGxY3YTXoc0E8sdG1BQmWmFCrFZKNzYQqV9B9sXhmk4nIKsb4lE/O/r2/zYDSzAXi0USJwz11L
 R2RKhsQe53QTVlowvV+s4zFR7Z53HgEzW9pkP0IsUjqtuLyWrv4GV0Eie4X/dNscRC8hEbFHl4e
 zHNiY9CQqV7mTRM7E5KcT2SKtQiznHbb+2ZtIZWRUD3dB3orgoCCh80oHCw==
X-Received: by 2002:a05:620a:450a:b0:864:48eb:356 with SMTP id
 af79cd13be357-86448eb076cmr1401386285a.25.1759216329479; 
 Tue, 30 Sep 2025 00:12:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl9dt1djyaC7zQdYtSaRmLXdGdPGvu1aHOByc+II7EPG2uXYQd9OC3qlxjl8GonAKh2YHTJg==
X-Received: by 2002:a05:620a:450a:b0:864:48eb:356 with SMTP id
 af79cd13be357-86448eb076cmr1401383185a.25.1759216329045; 
 Tue, 30 Sep 2025 00:12:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb4e39f3csm31049191fa.23.2025.09.30.00.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:12:08 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:12:06 +0300
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
Subject: Re: [PATCH 08/17] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
Message-ID: <srutubksxfjwb6hd3x6oqduyapzo7qh5rjqgvdt36jzqxdegig@o3ukylxtgiy6>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-8-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-8-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX1nFE1CALMK3J
 O5HwadbujINTK47UCHIDDD6TGu04iNUQa74ptSFcDmPh68RD2TVbfD9OM+vFgHIBzmOx3ELQAJe
 bYnrc8cwr/2Z/JU3GAknpA7sB79tAvdGmUsfTrT9uPCo8idDaTdGKCdK/T52jbEC3c1m3cjNMtK
 aJ1jCYHP2BxdrgeLDG5FMbTWGsZJ1+SFV8/N/jMg5lwmITvCWa7oBzbVwLjY87ppwSy4qtmuzhZ
 9jtiaL4cjGM+ZoEUdZnEUSS1+lc7oznKllxEP1hrozZk6G/HqRFa4B6tS3AsvZmDmig2uRoAuJY
 7xocMjMuqpUWRM2/7ubyIN9QDeOYlgKmXx+RxrXoVzD2Q03MakVGUqcATWOkzIdOMkv3Fo0lnwR
 ZBV/kovEoyY00zCDVTueZbKlZ7Ehsg==
X-Proofpoint-GUID: _LyXR4heUCHreb2SdajFAL53qjZSRPle
X-Proofpoint-ORIG-GUID: _LyXR4heUCHreb2SdajFAL53qjZSRPle
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68db82ca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=scbeE0iXsUk0x8BJeo8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
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

On Tue, Sep 30, 2025 at 11:18:13AM +0530, Akhil P Oommen wrote:
> Move MMU fault handler for each generation to adreno function list. This
> will help to use common code for mmu pagefault handler registration between
> a6x/a7x and a8x layer.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 5 ++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
