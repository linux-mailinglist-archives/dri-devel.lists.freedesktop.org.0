Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41254D161DA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 02:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F19610E0FA;
	Tue, 13 Jan 2026 01:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cl3yAOyy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAS+R6r8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F156110E0FA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:14:07 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CN56501935377
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J/0cnCYpDBos+7nwSFiIuXvo
 +vrGW9jjlT38b0YSnCo=; b=cl3yAOyyWwhcHORodfqsQLgbb7Ch2B7xKZSnlKuR
 t4Qe0xREyUzz2t2V353PmvKDUBZNx50pMikiU0vkqS9Nz0uCvhYGQvMSL2dsW69W
 o2SbgK8ATBv18DcjEx8fa0TNtD9Nqjm8/5vOXg+313zwBbECXQRq+p59B8e+2CPI
 XymJOCYhMfPS/yGQTR/SzTYKE+J8yC6C/WAa8UZ9G3SjlSiVLciyKq0tFy5V/9/J
 SCJwJlxbGNFlDYbNo9Y3wlQh4BSRLQ7dEPasRgyjMwGeJXUKRfpIqKRE0w/VMgC3
 z522A1aWZI4o1PKN/Or9o2kgKwIb+EZPt5fRLGNwKUi/pA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cngyj9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:14:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b22d590227so867912985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 17:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768266844; x=1768871644;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J/0cnCYpDBos+7nwSFiIuXvo+vrGW9jjlT38b0YSnCo=;
 b=bAS+R6r8UnOgBOe7BpTjAHc2DuIOay3wZE/NamszEInreMYAkQf46NcQrO61ZjNf0S
 M4g1H1qztVoZyptd/yk9FwHPWk6sMRABRIeGcQp2tpTYCT/8n5GNIoVNvjmLp3iY54sB
 2V+nbfmN4wJ/M8GXskgrkI5Zm485h5kB0SZkjp/u9z9iBjAO4lntGV7dbASshk767BnX
 l8bH37b/7iOZg/J9kAPCoIlVLO0/sFCkJPoDrdtMLe7xn4oEOKL2+ZL0eeFJEj8YRY1V
 uzg1wCpo2i4bVVeUedWIheB3eO/prfTnlk5K0MmtyciWxCZYYJR3E1yirPJqaP94xs6z
 rSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768266844; x=1768871644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J/0cnCYpDBos+7nwSFiIuXvo+vrGW9jjlT38b0YSnCo=;
 b=NIpl8sAVDipG908rDuG50uWr+MQuX921LEU5YthooufWe+MvTrQj4Oa4/razzIvKiw
 YCweKjEQYwNQThVqnWe5ji9Pe3tzZwwBE1+ZembCwidjFlByVmTwCL9zIkUIKfkK46J5
 qMEZ4uqK8WAayAVulZ7TX9Av/H3UNwDguRLfk52jMJyyNikRcxJtDOVrqTVoCjb1/Buu
 PyJlI+sqoUG8deChYJCWeAixvTXyER8bubRKjcs8AsE7KyXMuLmrt7MBI06qxNdyOcpv
 q9PGoT4/SRGAHqhOjlZQrFaV7Du0XQ02jMaoUoGWaVf2UlKRUwTYvcFxhbCH61Q65EJv
 Gt3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWias4y01x/Vn4Sdq0c9sIwYuIhUmKCHqSjxeB9vr5+3/lkfq1Vy5KbecmhnQxmuNBIGb9fB+2tJuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAY5ygefyTLWnE8HNk3/DohdGC2c5J+MsxhRMWDL6jubQZCrFi
 Y0Qd5C9FzyeJsfBlZ4aYzvhUj0LJdmrtgW4a9264hJ4/YXMriSamG9/VWrhkRZ10HiyFT2x3rNx
 2f3m+4a2FEJskP3VW0RQ/6T+oNstb2qz1yQ/X/asACP5G5PGYDJRlwtqFaERkvxaCcaBz/6c=
X-Gm-Gg: AY/fxX6uj1PyrwJYSCuraxcOlF4rk3I/nOahF9CVnkHvp4K+jYooulvA8kwLjw0m/OY
 D60crMr2QD//FekX8IZBfrQEdH3ALFewpeMIMShPKGl4MNlix2NDCt5T+GkFooIihZKiKvf63ew
 XjEkDFYK4SJclslzjhIx/IRHBT0vkokev1gRC2ruknUFVAtkThHPAqLze4eXKIaGShp34JMg46E
 sh3uQQGXC8oBD/CEsIkPbXsqIyhQVaGRxY631JhGfva+IbAUGL6/vmu/VZpnRskUQCbEYkGfQg2
 Y/ByY6rV3hB9L8HKZVVEZmcCWepLDn9CyGsC68qoOdAdrnImrBtP8LCS0MugqzfE2S6sfVstZZY
 qdQn8ZQs4S5Sl3rUAW0IFUCaF/q883nQu8mdcr+XVpcABq1Mc/oHE/tqF7kcrvtOVlfJ98BTzPN
 AFaIfkXtGIowOYm7Y2wgWm7Ms=
X-Received: by 2002:a05:620a:2a07:b0:8b2:271e:a560 with SMTP id
 af79cd13be357-8c3893e7e2bmr2315927385a.72.1768266844330; 
 Mon, 12 Jan 2026 17:14:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4WlkP4sNqdgzyvpCMNJE4qaOKFUaJCa4aduSzPBbjzyb10EW/oKcBiBwhOQ9DebVVAgpZZg==
X-Received: by 2002:a05:620a:2a07:b0:8b2:271e:a560 with SMTP id
 af79cd13be357-8c3893e7e2bmr2315923785a.72.1768266843790; 
 Mon, 12 Jan 2026 17:14:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b6a2b8330sm4926075e87.10.2026.01.12.17.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 17:14:03 -0800 (PST)
Date: Tue, 13 Jan 2026 03:14:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Message-ID: <yxp6k6bjscuxwm5mz2ev2647ewe7mycus7dszehtrfr7qhxx25@nptailaparnc>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
 <bb889140-5ddb-485a-bb50-739f68297838@minlexx.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb889140-5ddb-485a-bb50-739f68297838@minlexx.ru>
X-Proofpoint-GUID: BY5mz58W9ZjvHnXVtJD19T1XC3flrUp5
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=69659c5e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZEkBDfZtAAAA:8 a=vlXmtpXO02sfSNYNR6MA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=IqjDwHP2KxQYjTbYCZGP:22
X-Proofpoint-ORIG-GUID: BY5mz58W9ZjvHnXVtJD19T1XC3flrUp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwOCBTYWx0ZWRfX+195RJV3YZta
 wpo57RBQgYpzkbHJF4mZ9lqJDTv9qxp6/mtXo1dbPUCxy4fW1B4XzqGPwRl80D7+Vc/gRf7nw8l
 2fjoydGotCtccH5Zo9VhVbbpk5LjiHqxmdEOhaIfLRrc4VMjTMPKilkAJwrCXIiEqfFFHZ7IOt8
 BhN8my6xURV2QD+XCPRweW2frDww1EFdUEktYmPHDwtC8uPf+l3a4F3v6kg13nah//0qb1wTx7O
 hn6lqTLswBbPecy6VMaKXAR+fE1JfySi6yNU2B+GYbrJSggzQoGuqPRZ54bxCoTPyng/htmxnqN
 liN/bCWQSePEwu2dkImS15aCKz2jCQIm7k6rkEGLbzCfz21MRto+KaJFGHysfj7MH86C/nJOdX1
 t2ViZuPWd9f2PhvtbVBE5uRhH+i8UVykNKCKpdc/MKmdnGErkbAE99lCZmwGBNq62YpRRAs4HCa
 2EyeQpahxIjL9a/ls3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130008
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

On Tue, Jan 13, 2026 at 03:02:33AM +0300, Alexey Minnekhanov wrote:
> On 12/28/25 7:02 AM, Dmitry Baryshkov wrote:
> > Fix commands pannels support on DPU 3.x platforms and drop support for
> > those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v4:
> > - Inverted logic in dpu_encoder_phys_cmd_wait_for_commit_done(), check
> >    for the feature rather than the lack of it.
> > - Link to v3: https://lore.kernel.org/r/20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com
> > 
> > Changes in v3:
> > - Fixed commit message (Marijn)
> > - Reordered CTL_START checks to be more logical (Marijn)
> > - Link to v2: https://lore.kernel.org/r/20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Fixed CTL_START interrupt handling on DPU 3.x
> > - Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com
> > 
> > ---
> > Dmitry Baryshkov (3):
> >        drm/msm/dpu: drop intr_start from DPU 3.x catalog files
> >        drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
> >        drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
> > 
> >   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
> >   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   7 +-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
> >   drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
> >   6 files changed, 17 insertions(+), 335 deletions(-)
> > ---
> > base-commit: 4ba14a6add891fe9b2564e3049b7447de3256399
> > change-id: 20250926-mdp5-drop-dpu3-38bc04d44103
> > 
> > Best regards,
> 
> Thanks!
> 
> This fixes DPU with command mode panel on Sony Xperia XA2
> (sdm630-sony-nile-pioneer) and still works on video mode panels on
> whole bunch of sdm660/636-xiaomi phones and tablet. The whole series
> 
> Tested-by: Alexey Minnekhanov <alexeymin@minlexx.ru>

Thanks!

-- 
With best wishes
Dmitry
