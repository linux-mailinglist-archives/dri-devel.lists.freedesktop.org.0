Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF5BB233D
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 03:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B1C10E752;
	Thu,  2 Oct 2025 01:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZphk4Nh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45FE10E752
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 01:03:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic5sE005969
 for <dri-devel@lists.freedesktop.org>; Thu, 2 Oct 2025 01:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fHrr65lNXuCbU7GLecWRSzb5
 A4LI0xtyUM7m4ktwrdY=; b=IZphk4Nhg0W0DaJgkAk/2l6BgMbcMbaUAmi4e2Ht
 zf19C5MX1zPKhZOFpiLyarnSwJE4FCZ2/9iUjXgoTfvUPKGQpWBO0HPZFzEhpVFm
 qd+sPnWUvm0ei5lCm/U9NXCQUiCqgiYadMkQla56TJFVuNOYiuWrHHTVk8FvpyxB
 qqaJSTm6N02CJLa6o+DbETd0IHyz/bxBFo2F65K+1bJw2ccYTc0kpMh7Yq2pFNm+
 qUbPTcbjlatp84jBLUT++FCoZDsO62ewDaBV4l1KmU4JbXrVO68H03uww+Xa+vuF
 fALG5LzZCoGY2nYVuFutQWPJ/3if8tMPbU+tmxBtHMD4iA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdp2hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 01:03:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4dd932741cfso12846491cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 18:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759367028; x=1759971828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHrr65lNXuCbU7GLecWRSzb5A4LI0xtyUM7m4ktwrdY=;
 b=sbmjCk3NCdlJHYbxbQH5zdpAD1ggQhEoWo4DaEr946MqkEm1k2EKvE7GSESxpokjP4
 0ocORCIjlFWfuNDeJju+OQsUDw7JijRFR4yV6vZLiyoHqBMLst9F79Df2Ax+Eo+xi8ua
 YKRdN4n12FtQJBMcjhjUPD2gkcMkdN3kbISaso0efGAveO4lrC2TVh2HnExZmCrmCgbR
 vWcVXlLcXpu2eAvNu73Rl7HHaCZN/qQ9zRUETSvr1bzYU+vH8gcNGu7Knw2yKslQSwvP
 kpv/k6JRMANpxfEdQmkeDBRD+pWlE8Vbd/MA9XKt0SZN5Z/BKV5H3QoNbm3bSzs8mqDa
 djWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVywFY1XQQjU9xmtp3+guvlklguelNAqaBIj+7hleGj0fEzdYCcqOBkP4h73x0ymJph4cV4EHS4kQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPDQGb+R04pzC9kFMU//zyMcNUH3JkJFwjswQgdGyI1erkqNQS
 1pGILCm3/W0YP+cnBi4m+A63Cc+NPzBIHTgzS/o52mqMDyZ6IsrvgFAL63Uj35nYuKQ2WfAId8H
 fOh9uXOux5av4wTbBhSd9ghwQYPmL9vRqhnkBKvbtWzGoHjA9DLQGyqFBbix9CnZsri3Ml7U=
X-Gm-Gg: ASbGnctIqSrZz4QbQl5T7ootwSr7CUxE1X8Subks7bogOXGawvjrQQ3bXDUpSP7lXRp
 ekajbZ9aEt3j4yMdgOk1tWKvp1389G+xLdn4KBc1AzpU7P7+tciZ03O3oRi8lCs2+hDuVDkjN+Y
 w6wEAc2+5bOsDZCWRcJG6tJ3jXdPQ30fH2iL9DjsYG8OY1lnNAWPoU2R86xY86UYCyVgcH3gfo9
 EF6MHbjhWN9331H3g+uYHFDTa2rwsSo91xl01S1u4oppANj+RRI1pT8cUiyX2vhbvU/rnDYaX5/
 AUGG15NbaSkvNazaMUkvq9wMlU3jSeI040vG2y1cDQ1oJtPJjCGbf5M8O7GVP2qtHJ++bHlvfmU
 OO74y55fjy207EsGRasR54V7SPc+cpN4x43wV2bVfm7nbX3Shiro+ETUeEw==
X-Received: by 2002:a05:622a:1cca:b0:4d8:afdb:1283 with SMTP id
 d75a77b69052e-4e41e5453cfmr73046411cf.66.1759367028491; 
 Wed, 01 Oct 2025 18:03:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+PPEgu5a9spnGcgbd8IPDdjH3CRYSnDJceqwk4HUzRW0WSjlgTwcpzIm44jNRFI2tTLMX0g==
X-Received: by 2002:a05:622a:1cca:b0:4d8:afdb:1283 with SMTP id
 d75a77b69052e-4e41e5453cfmr73045961cf.66.1759367028031; 
 Wed, 01 Oct 2025 18:03:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b011b140asm337846e87.133.2025.10.01.18.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 18:03:46 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:03:43 +0300
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
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
Message-ID: <eicw5g5ozli6tvcsvxdorvd5ymxizidodbrfitqezcezwlzdli@6koxrgnu2lj3>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
 <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
 <edb8b0dd-126b-4ed6-8603-119f1fd52baf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edb8b0dd-126b-4ed6-8603-119f1fd52baf@oss.qualcomm.com>
X-Proofpoint-GUID: GgQyq9p2ZsduQNAFRwUB_DPXMNlW_-ai
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68ddcf75 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=93h1c-cikf9FHO0Tq-gA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: GgQyq9p2ZsduQNAFRwUB_DPXMNlW_-ai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXycecHtQm0XKp
 bwIvgEEbxTGsOUIR4ttXik3rUY3KIh12kzsWdruXBCWniFlf3Pf6Lb21L98D/jFu4akqkxDENBT
 YabDOHUDq3t2X6pVTM4lgZXfxse/RBhvqRQifkfZ5E4B/ehO9Urqq3/+dhIqEGMDE7MiQPq2LBi
 QMJs/Wn5Ro/mKIum8hvRQcsJYAP6aCyHbv9a+O3peCEkydlntFuDr+urS3xUDhWAMADKYBv9eTu
 e9qwCBuSJnFWFrfpDpZum6f/ZqqRdu4RnZTA9tIfNn+b6os8UHX8DUOi/slX9/GDjXpSFiOp16d
 3GqfpNsbU+5RZvLqQjD5XC6ZAHX14Q0lLhnoBEtdxwUbsseIlSlj5R0rl5xvbcRzQFTtEzRKfWZ
 4Aicd2GpaQVGurVaUa7tCFi30QmFXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
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

On Thu, Oct 02, 2025 at 02:52:35AM +0530, Akhil P Oommen wrote:
> 
> 
> On 9/30/2025 12:53 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 11:18:15AM +0530, Akhil P Oommen wrote:
> > > GMU registers are always at a fixed offset from the GPU base address,
> > > a consistency maintained at least within a given architecture generation.
> > > In A8x family, the base address of the GMU has changed, but the offsets
> > > of the gmu registers remain largely the same. To enable reuse of the gmu
> > 
> > I understand the code, but I think I'd very much prefer to see it in the
> > catalog file (with the note on how to calculate it). Reading resources
> > for two different devices sounds too strange to be nice. This way you
> > can keep the offsets for a6xx / a7xx untouched and just add the non-zero
> > offset for a8xx.
> 
> It is not clear to me whether the concern is about the calculation part or
> the xml update part.
> 
> If it is about the former,I think it is okay as we have confidence on the
> layout of both devices. They are not random platform devices.

I'd say, the uncertainity that in future the offset will be the same. As
such, it's much easier (in my opinion) to introduce the variable offset
now.

> Also, we may
> have to do something similar for other gpu/gmu reg ranges too to
> conveniently collect a full coredump.

Don't we collect the full GMU register dump?

> 
> -Akhil
> 
> > 
> > > code for A8x chipsets, update the gmu register offsets to be relative
> > > to the GPU's base address instead of GMU's.
> > > 
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
> > >   drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
> > >   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
> > >   3 files changed, 172 insertions(+), 140 deletions(-)
> > 
> 

-- 
With best wishes
Dmitry
