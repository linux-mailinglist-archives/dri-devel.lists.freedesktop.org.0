Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174F5BDBE64
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 02:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574E110E251;
	Wed, 15 Oct 2025 00:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaSfch+r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F110C10E251
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:16:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKR9Jj000407
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vRKSagkceiefF+SRnShXnJgX
 A7X31NHPVC3PAt5RjRs=; b=DaSfch+rbCan1bYBqM+95hZeHO/SwdW7vkr7R3bQ
 1ylDjPmTjoqeWltXBRog7efzn3aa3VO1C5IuebNaivkjWOR3extuR0ayC1033rs5
 1zlQEmtCWXwwk+kuIsLmMIct7QsqdEHGqpMMEyCuJ13P+/DvxugR7wZCpDMnFVmX
 QWOZ4fHVjuUUPKyQKpuaq5NuMdKXeC7+D17bNB1XEIXSNJkOvzGYpnfez2VmUO8n
 OHM9OHso+jv7MxmAysjhytpEJKFC3i8MgE4l9/YkYQwqeWXKlXE/rYZ7flayTu1k
 W4wdZwba0KPDX07bh7yn8MvK9/h+717kFcj6ZS3LQ0fyaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0teu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:16:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-86b8db0e70dso16223416d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 17:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760487367; x=1761092167;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRKSagkceiefF+SRnShXnJgXA7X31NHPVC3PAt5RjRs=;
 b=vwlTTPtxEa1n+QLPxHEYzdbfDmRngMK/cmNgopU43UP6O1rx43Ecv+Sq6Uk8ZAcTPB
 0XkDQ2Aay79B4HRB7kYkNxA3bkYp9j5HZ6SiuapHKBe4p7LaiytjJG40eTWGzk21CExC
 jiqpS6SkcQl8tg3kDijnqF02c99SQJeSEf+BRlFGZhMPFT2R5pm5tXzmVoLTUIl2SdaM
 YHYRqwqlquhYTdbb2AcJujj5shSnm3qC9pQCM1Pgooi3tJ1w0N/dl9Lp76sThVtilGsH
 ayI56o3LxMmL1XqDlc4u3JAd/yUPThXs/utacV625Tfa2iVAiYurwioDKKd4Ot4YzgX7
 4zTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZwMunrLH0k0+s9jR2C1Z/8mod/XH4atlabxr2ubQpWpvMrYNQHX7sGZb/XG1wn6JTd7ISjc/Lmss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6s8+ps9CL1oU4tyK7Zz8maaI4i9pNJoAn/7AykZvpue3f7WwM
 4GVDqp2Lnce5WMaH4+LffJX2HJooPjHKwZ5CXa0DMU5A8PfaB8KpTruR7vN/W0MH/JwW1kuQG1V
 Sv4muyaz11guCnJ9vt7+q1e2orcC3gY3svyZE5DdOS6IcyOZMuQpC7FGlFtMUmCe1Q0f/QDY=
X-Gm-Gg: ASbGnctbhg5tuf2mCozSzkqL8oBCJskEUBrlGVbs3K+yzXJLn2pQvO/Ht1qC/1MaH1r
 qt/qdHzA+XH0m9PR6qlA4TBaPupRURPvwrd/8roGYgTYIXGKjjIGkRaPPSneypVoUSXu7ooFZK1
 hBJZ2DDuU3O2s/YuentMKGAfGIy7tx6gLxWU+GUmGA21ixjYy59S5q/7np+Ql0UZEAX8UlO1AHx
 LWb2hCS3+TyOQdOFsFBY/vs6wKVTWHOYKZf53ycn1Xn4A/fj+HVcRIYk4tnQ7hZcIoPjcpfBpjH
 ZTZgaG2Po4Gj310druNdqIPLgahLFddHohpwBk2gh28iihVzNmYgLO/wZA26bVhhMJL1G2ODi7J
 FmjSU8M76D1mijZpWRJyytEanCLhv5QvmHgjwlyVtHe9PmwX784WZ
X-Received: by 2002:a05:622a:6dc6:b0:4e8:8274:5ef1 with SMTP id
 d75a77b69052e-4e8827461efmr12422191cf.32.1760487367085; 
 Tue, 14 Oct 2025 17:16:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtPSrqhOR9COKOZLc6C4UDhoFnTKV/GqIpnfTsAuAZ4NEH1QkR7LuapfWGolmnPssKozirGQ==
X-Received: by 2002:a05:622a:6dc6:b0:4e8:8274:5ef1 with SMTP id
 d75a77b69052e-4e8827461efmr12422001cf.32.1760487366632; 
 Tue, 14 Oct 2025 17:16:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762ea3b31bsm43158091fa.47.2025.10.14.17.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 17:16:05 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:16:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 04/16] drm/atomic-helper: Add private_obj
 atomic_create_state helper
Message-ID: <gzmzviifiwcfqktqaqjpbimzxp6pu637ixixb33b2b6hhlok2t@jufarkb2hcep>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-4-6dd60e985e9d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-drm-private-obj-reset-v2-4-6dd60e985e9d@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0k99QFgJibDe
 OfD6RMwKocDadW/N9CU8VdJRgVP/PYDFakB1/1LsRS73q/dpPVo0IeoFhsrpCrDVeILF2rJmU++
 pJ/9Rdx6UJE+3DCUsTUTSuskFwOfRnPJvbig0SzMLf/mXI1e0KkwwrfqjESfRTH9jcKQHHSQRdh
 T3ED89RVbsvoGekB7jOiZD5IAIoNj+YwplZxGEc3MZC0GM1NYBY5BtKPO6oqh3b3h2LZoiH8IGX
 ixInIYgdV6MNA25e6u1t26red1uufGJ7s4QhtBdIlW6f7/+FCuHMjfAlLz/n1f1y2m2PKKeRyrx
 bZ+1ra89fXO9K5LEwrD9/SQqy3YpKwpkvkoKnGRwQ==
X-Proofpoint-GUID: Cj0r8E-8uN-sqf9leeTeHlTtNpaD4EsD
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68eee7c8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=m6x4fNQBW9mOBmm6YWMA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Cj0r8E-8uN-sqf9leeTeHlTtNpaD4EsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Tue, Oct 14, 2025 at 11:31:48AM +0200, Maxime Ripard wrote:
> Now that we have an atomic_create_state callback for drm_private_objs,
> we can provide a helper for it.
> 
> It's somewhat different from the other similar helpers though, because
> we definitely expect drm_private_obj to be subclassed. It wouldn't make
> sense for a driver to use it as-is.
> 
> So we can't provide a straight implementation of the atomic_create_state
> callback, but rather we provide the parts that will deal with the
> drm_private_obj initialization, and we will leave the allocation and
> initialization of the subclass to drivers.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 22 ++++++++++++++++++++++
>  include/drm/drm_atomic_state_helper.h     |  3 +++
>  2 files changed, 25 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
