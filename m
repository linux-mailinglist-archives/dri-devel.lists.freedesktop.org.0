Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56933CDC3E4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 13:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986C910F0D1;
	Wed, 24 Dec 2025 12:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QMGz0Cz6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUh2UPa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9046910F0D3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 12:43:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO6iGmM678327
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 12:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wDwdQ7S4bZBvA651QN2phLv3
 tQqdzNozh71wvSt5LDw=; b=QMGz0Cz6JOm+nL+VTgNcxjNkr/tzDJocEGNwH8Lq
 ZL3j2mqe1CliYVMC73RNNsqe0jjJBhTNUs+aF3E5O8qzfj8dr33qA+8CbFDW9Wg4
 /9bvq3f5uIQ9Oq+3uURUDghRxWE6Uttk7ZMpQrNI+n5NXFJeQ4mzbI7MosBhYqi7
 Akmcx6hWbGfzi2wd9ncJljEL51CXpsVAEnH717UWzvqOD0KUwYS4L1SAxxshxsUL
 +gG2KOgTfJvRo5LUxIr7ikor4BO/cqCNVeKrA2Eg5qERwWH683OD7U/N19UutY6u
 FD+vYJMp3loZS2VVp/MKwhBavCaacymHgy4jZqPnobUJRQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq2m92-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 12:43:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a39993e5fso150601526d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 04:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766580229; x=1767185029;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wDwdQ7S4bZBvA651QN2phLv3tQqdzNozh71wvSt5LDw=;
 b=IUh2UPa/itez824JamXxM8A9keh9r3UVpYeQavyIlKqouxgrYMxDkeOW44EPLMwAqw
 HIq9k0UJBnFbcvoPlYnuxRNoQv++YpEx5SMgb3h1YCR6Jc71XqOzKDrbEWSAYvORj/Na
 gnbypSPnLd8w92EtBykuf737E1YWVZgB7w3OcAPRiCDFdNaNa8fTbBpgy32XAz5oW8Kc
 4sVCoVSE9Awstg7MSU4P/8qdd/8pYVnJlQ8TQKGRnu0ZB0gROa8136FBldL1QtcQ52kl
 /FsqEXs14qckTfe9wrRyf1/Hz3JCWJouDBmKxxG9iAEPucQmFK6L/OZsT9WqwFnDa3F7
 X3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766580229; x=1767185029;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDwdQ7S4bZBvA651QN2phLv3tQqdzNozh71wvSt5LDw=;
 b=kfU76HAA6VU1eRJWEPWwfaQvn6kLuBQJmoYde4DCygAcqlB5oabOSJUFk8P15LjpwZ
 ZTFxWukUoV+r/M2N6SmZ8QRFAMjmKofUujTDE3wq+WW0oN3sgni6Yk/dW8ZoO6eK5vyD
 1vNmPO7KXyJ2GAyoF0B/yHOiQyl9uQzdF0UKxwrqWvzRbm7N0BA4+J2DPK0NT/tIUuwk
 GT8uJXYVbTqqK6fQILXWTsAtzf7lcrjo5Cu3QS1FEyUupSXr4/GKUnxXcN+3nS5d4Xvz
 Toiig8Gh34Inx+JqJZ2HCsDLE3IRB7OyW0gO2yxvI8syP+usG+B96wu3Y6j6o2OA5eIT
 NGXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdWTlU/OD/JsmXXOwK4LK4dbP3/4G2Ku+cXwGa5YnhvT+jXd+DnT6KLjsIpSh7qbSSB0ZlUb4fqWk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSfv1ueJyrJ2l8X+BFPhSMeOd4fuz1MWhb/BeWE9/hgCLiPbSX
 FtCGq6v00avbXK2RQqCMlD0Uvd5BQb0G2xX8rVFnfSSp5xAwJdbCTCzX3c7j6zJWPsv2xYwOmvF
 ooc/pI7R5x84cY9AFvZw1Rtf8vnYQ/guQ68L5uVEa3KuE6VPiddQAcNuaDxD9wS9YR+AHAFI=
X-Gm-Gg: AY/fxX7gmf0d2qUAU9RfCoYnVFQeWO98pVQz+f+2y7Gkalh3FS+fEtfjJnE0br9xoI/
 6UlifsAj85kuh9AtfuzOIKTE5bS2ik5Cewc2ASpbsxq3Tg70jLSbuj670oH5vwAES24/GXzPv80
 MhlBoib8IT+ckM4yuyUCr+Hvb+hRxpwA4XAYd57+bOajl52Pn5ZcPrFo8KDuqxDOP3i7ASeUkrB
 hbADX+4CAaGikk940+/eHsMyky1qX0ZG9FsNP1Ni4alA7uVgwhofwsTqPcIQE3iu/Vk8WTQKzzg
 MMOemblNyZMD6n+zstYL6IOMcWWKfELCLUc3QGJ61mICWtG+chiCbLSjbLLtkfQt6p4rzh+2qLi
 1GgjuVz0yqNGUkehmDA2K/sFoorwku6LvSM+h9iI3sNMxYELPYi5mHXurifE8B0hDgVTggh6m2Q
 L4Q/DJqU47J+kBKjR2G8dsD2A=
X-Received: by 2002:ad4:5c68:0:b0:88f:caa1:ae21 with SMTP id
 6a1803df08f44-88fcaa1aecbmr165164436d6.32.1766580229057; 
 Wed, 24 Dec 2025 04:43:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwaHpkqJ6p3wAcw8mqZa/VlOK2UE/SpJyrp+pSGs6Naw4FiZqH18vUS5KCoqIeO8ajlkopqQ==
X-Received: by 2002:ad4:5c68:0:b0:88f:caa1:ae21 with SMTP id
 6a1803df08f44-88fcaa1aecbmr165164136d6.32.1766580228633; 
 Wed, 24 Dec 2025 04:43:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4962182e87.93.2025.12.24.04.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 04:43:47 -0800 (PST)
Date: Wed, 24 Dec 2025 14:43:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Teguh Sobirin <teguh@sobir.in>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <oqiukznu3hkci3jslug4bwawkobqmcxl7v7dqrh5i6r3rirm7d@543kbgervkp6>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <52avqc3n4fxuypv6fkejuxkmuounxa67e5lsnfeynek6yxq6tm@ink6yoklpxes>
 <aUu4RyJyZROn-FzQ@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUu4RyJyZROn-FzQ@SoMainline.org>
X-Proofpoint-ORIG-GUID: qdlyO-Xrs96Uobn0SUsmFOYZ_Wz6nVxn
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694be006 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=9AdMxfjQAAAA:20 a=4g7Ab6pXP5EehEtGTCUA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: qdlyO-Xrs96Uobn0SUsmFOYZ_Wz6nVxn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX1Znyfy56Puu9
 X91PpLNmQ67sg/U5uF0bUP51IoDsdMMxD8mjElvK1f0hkKj8LbgucYXCkm9y5XPHZLt2zvjYEyG
 JJ5i/ikL6YES06ZRXbJcD+BxfxOl6tvYlQZpNguKEzjTjE1cj6K+NGKpaHI6VdxhEwVkBnLTtmz
 mQ/+0TT6zw+wTFqUOnAm+Tnfg3ibKjCWse9dd8ra/QQcrPZ5GcnBRu92+w46zNsP18XUxpfhMt+
 yWRq9c9Vc2NXaD4VAv5g8BMcaHL5UJj4fe62Us22G+YdnhercH8tPstnJfo3Wgk25IGJb7cUSIL
 nBfuSkEiZTMb+/+C2VhqI6IWRXjKmzFo950pvhbmLqASo7D26sEipwvyZJglP6HZgXrh5C7OrGU
 /tlSLraUsW02xyglXElyqjz5iv2hIpb0Mv0zzNKU4gOphAs5f9rJ/o3Bc/W6hE6iwgFlqx54nzw
 CtKzojA5c7+7XwWoJPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
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

On Wed, Dec 24, 2025 at 11:00:23AM +0100, Marijn Suijten wrote:
> On 2025-11-21 14:16:55, Dmitry Baryshkov wrote:
> > On Fri, Nov 21, 2025 at 02:02:08PM +0800, Teguh Sobirin wrote:
> > > Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> > > INTF blocks.  Currently all code to setup vsync_source is only exectued
> > > if MDP TOP implements the setup_vsync_source() callback. However on
> > > DPU >= 8.x this callback is not implemented, making DPU driver skip all
> > > vsync setup. Move the INTF part out of this condition, letting DPU
> > > driver to setup TE vsync selection on all new DPU devices.
> > > 
> > > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > > ---
> > > Changes in v2:
> > > - Corrected commit message suggested by Dmitry Baryshkov.
> > > - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
> > >  1 file changed, 9 insertions(+), 13 deletions(-)
> > 
> > Fixes: e955a3f0d86e ("drm/msm/dpu: Implement tearcheck support on INTF block")
> 
> Back at that commit, setup_vsync_source was still always assigned:
> 
> https://github.com/torvalds/linux/blob/e955a3f0d86e4a789364af62495ac37546eb71c8/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c#L260-L263
> 
> While that was technically a wrong assumption by me - I should've put this loop
> outside the hw_mdptop check in case that ever happened, it got unassigned in
> commit 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP
> on >= SM8450").

Fair enough,

Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")

> 
> Note that this patch is a severe regression on DPU <5 and doesn't set up the WD
> timer on DPU [5, 8), but I'll comment in-line on the diff.
> 
> - Marijn

-- 
With best wishes
Dmitry
