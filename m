Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46688B0F0F2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 13:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7CB10E7AD;
	Wed, 23 Jul 2025 11:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j86+FYuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C7010E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:13:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9766v003506
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hdZZZ21a0qm1WSRcAHWFGr2d
 /0HAGcq2qAHNRmdLWJY=; b=j86+FYuJEhj9z/SI4nMt5/bu9aCDS/4QXeXYBJRH
 by3pRQpSTlel9Gw1rodhsP2Yqy2WdwxWF1ep9fPJKJGoontnffgmG1T1XvigdHbg
 Lpc/RBwfw2eWltPSJE1bxeDlbCMipOymcVHU+U7KaZUaeg57J9Bz7UfZ3dUxsoMj
 x4wgaIqHTc04GPMxIQBXglCVcYXwGEqdIo5JnjhvgWqT3mwfX2irVbfPdbe+3jwz
 VIGPngYh9k1NKJ8KzbTKvbxaXOU/JvD7Bm/IkcIN4lm4SsiD9BnOqB7DVy5pEWOs
 rHCMIYav4zNtceBH+M+euZfHd6Pjvjt3WxPsZNT5LZyOpw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1c83h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:13:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fab979413fso124932416d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 04:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753269183; x=1753873983;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdZZZ21a0qm1WSRcAHWFGr2d/0HAGcq2qAHNRmdLWJY=;
 b=es0++lGmxaVM+xZEGGpsECjD6pxT/PhcaKL6u2RnJ6HulDrBTOshtCGAL7C8CtQhRf
 PcKxOoOrSD4WLLDSeDEZAhaKycK+TG2Z2U2hL3Ub9UiANu45fyC63xJmSsh/k+dRaBpb
 G0DrTekjdLwjYSbgv8EbCoF0gJWKAxUqd2IGvrcztg9ZVeHAHT8LS5wo7ETPNAVi1AkE
 I5WfJfG9lHJ3vW7IhQl5JL85+6YflKyIQuS2yvfzhnkcKWcGNK+dixC1H4BLFzixWxko
 nHcf4ESGb4VUpFFPO8J8cUVHSH8VmxhZRx4uFHlMRSoVXLvCim4NGfbvf0wRchelMmmL
 1FrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWywEHXGdgSfrMf+h4LLkTNXR3RJe9VdPDa4jIsOy2DRuo4TS7aj6zrznFpbZ+LzlDIdgWvLUgyzjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylcvcRqrAgPYL+kEySA07+9Skh+aj9t6UTPnV0Du9oGaqe2EwX
 NcDP/P+WFftQfjG1eZL0kgY1PDYtkdvS9ouhlMIDrv4BXAZTAxNvkFhNXKRFQnqNJcEhssFuYel
 3gT+dFR1iv7/8Ol96DAci6hif//pdRgsAQWAPke9V10N+tLOCHLDNaa1zvpIRXsNCxo7NpU4=
X-Gm-Gg: ASbGncsK8mGhc1IxCykfIrBofM2aCstOvU4LVRVQCO+qcq883dNRIrICpyBCof7HZwW
 a2xLYsZPWqF/t9naa/RYModhTAqbByEEyvBXlpkuo0m0nGmypSVzUZnsIBn8iTlVjrPSb86TGXB
 53FOC+veg3OIJU3Dv43o3xflN6k0W9EPnjqwKo9LamBl5ERscpL3qoS3wRt37i8EEdotupHFMDI
 TXOqs3P1uAWmO6vFgaP4I6G2+mNXZ+Z0Rnrnq3LVEO4qPec46zk7j9Z9QMZczscb90B6fvtT1Kz
 9crNovx6+rSevdwNYnnne46fZEleqQ+aUus+bGQ0S4s01B733Ohgn2G6Ic7PWbWEb79JMKQAtaI
 jXj5Dp6cm5L2XDAyK9noznj5CmgF1iuf7c9ct5pgwAA5Xi8xuKAj7
X-Received: by 2002:a05:6214:2387:b0:702:c15f:3291 with SMTP id
 6a1803df08f44-7070077456dmr34745396d6.22.1753269183333; 
 Wed, 23 Jul 2025 04:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyDLDuy3HyepZYFtPliTkOxZ5Xsf6vDUIcCInt6v8XfdgRXS9LLj6MWS8GTPYKlkNSKOxtvQ==
X-Received: by 2002:a05:6214:2387:b0:702:c15f:3291 with SMTP id
 6a1803df08f44-7070077456dmr34744846d6.22.1753269182815; 
 Wed, 23 Jul 2025 04:13:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a9103744sm20182351fa.24.2025.07.23.04.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 04:13:01 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:13:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
Message-ID: <vqncxeag7jqmtxmeezvwqdtneoavs5kazpcgweuw52knqbiukl@3iifyfkgkw52>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
 <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
X-Proofpoint-GUID: x98QUbYv1wLDeh-aYpP-hW5ayOItst1p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NSBTYWx0ZWRfX9BwLGc4FTDek
 izHexXD1BtdcAnj+SioTdopBOmJpmMDy6R7uYrHWVXaS0A8MzKgzKd+v2KVgKjTav9ZgweGW6Cf
 K73wNC1eoSOFfro3SdHxNZMBbX1TN1q1YiisWrQXQBz+1nazRTTR0m6+d0gQk0GU+6KWvXy+6Jg
 9jlnxjxPhnYZMCT1C9NfirZCibn8D233tXRMNZY+ZDDwAwuM36Nn+IamwLJqKFF2WFxnqI6p2tW
 if/BOQuDB6zedF+G4WX0Y+JHAuTF5R1XcnfoNEiYvrp9MnFHku6zUtoPO9KlV2ST71wA3D4XK1g
 cWn3INsEnY9m3zFkOIjGOLvvHH557Ag3KN3r5OdKxXPYCqUDNmu5RtF8lcB1GAj3Oo6+BNiA6Sr
 A6ZJXzMZ1O50voiHnHEBUXG8PLdZXPiWN/1y5qE+MVuj7qxogRRab0Hg6Big7Ry2Tdl4Pzbn
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6880c3c0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OfcbPBCFm4ewgWsImK0A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: x98QUbYv1wLDeh-aYpP-hW5ayOItst1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230095
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

On Wed, Jul 23, 2025 at 02:54:59AM +0530, Akhil P Oommen wrote:
> On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
> > On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
> >> Set Keepalive votes at appropriate places to block IFPC power collapse
> >> until we access all the required registers. This is required during gpu
> >> IRQ handling and also during preemption.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
> >>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
> >>  2 files changed, 37 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index 8c004fc3abd2896d467a9728b34e99e4ed944dc4..6770f0363e7284e4596b1188637a4615d2c0779b 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -1752,8 +1752,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
> >>  
> >>  static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
> >>  {
> >> -	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> >>  	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
> >>  
> >>  	/*
> >> @@ -1765,13 +1763,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
> >>  	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
> >>  		return;
> >>  
> >> -	/*
> >> -	 * Force the GPU to stay on until after we finish
> >> -	 * collecting information
> >> -	 */
> >> -	if (!adreno_has_gmu_wrapper(adreno_gpu))
> >> -		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
> >> -
> >>  	DRM_DEV_ERROR(&gpu->pdev->dev,
> >>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
> >>  		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
> >> @@ -1810,9 +1801,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> >>  	}
> >>  }
> >>  
> >> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> > 
> > a6xx_set_keepalive_vote()
> 
> static fn! Why do we need prefix here?

It's really a good custom. Also, note that I suggested two different
names to your functions (otherwise it's too easy to get confused).

> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> index 5b0fd510ff58d989ab285f1a2497f6f522a6b187..1c8ec1911010c00a000d195116fc950c4d947cac 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> @@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
> >>  	a6xx_gpu->postamble_enabled = false;
> >>  }
> >>  
> >> +/*
> >> + * Set preemption keepalive vote. Please note that this vote is different from the one used in
> >> + * a6xx_irq()
> >> + */
> >> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> > 
> > a6xx_set_preempt_keepalive_vote();
> > 

-- 
With best wishes
Dmitry
