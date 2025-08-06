Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005CCB1BE43
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 03:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E405310E135;
	Wed,  6 Aug 2025 01:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZnCqWYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1B410E135
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 01:24:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I7Q3a011467
 for <dri-devel@lists.freedesktop.org>; Wed, 6 Aug 2025 01:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cECZSFy3qa0bHjy4EhDWe8hr
 H3jcwRS+Y/cAXNikEvM=; b=WZnCqWYliZrXAa9l0D6gS08pZD5aOk4pHsA8w3uo
 3uTmfTchrXSBEkKnkjwWSMeKduOuZkvtqsz+1bARX/fIgrA8CWE68l8vp7eaLMIB
 27oIU6mFPGP4icayA/sIi02FU5i0aun/Bl2YU1miEv1Px4UYEfUfNhdKOSwpilNe
 wJMUDlWXY7xvzbtFKLcRyp8ZAGG4Q2FBTE9gmKxCdMebYO24kgh1L2vC5BS6V/nM
 Fr8FRFnGPk1O83SoAlmGdIDlNMSgB6UQ22G9gbniVfqhjTl9+LqohAy4JRgYu7VK
 YOIPrrKwF9uc/KAoiqECqUceMmNI7drFKQLrgu2mp7Uyuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6rxw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 01:24:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e36e4467e3so114027685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 18:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754443496; x=1755048296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cECZSFy3qa0bHjy4EhDWe8hrH3jcwRS+Y/cAXNikEvM=;
 b=AiDQisv4XGrV1cJ+wUtEGSDLnuADEAvOdn290cj+c89S01o9/TH921s1mQwndzVWIm
 Nxt3Uak8oCPaqdbZySnj3bN/PQUx9vFJ3zYp/wxaBBk/Mv1vvTczE3TqJO3CACG7trkN
 OZss5FhUzrsJ6++pWWjCiNetBnttnOJ7at+rVzHWQv9AG7wEmPr8jVOw+TO/zkvYJ2uE
 Ecz1JbqCDCl1wIPw4s/LQ5qPjTkqdvPweXfN0nvLhRlE/GfKLgLaHqpE2wcvaLpG2Giv
 IVwaXg5JbuaJiWKLHyIcBbu7fD2UVCviP9kN9A0K2ZqDqbnysUXnSn3TpDnmGgjrcWID
 Xhag==
X-Gm-Message-State: AOJu0YxaNLgaJ4ITafcKJjmTd7XzFaFfGp81I90/I3NiFWpUgoZkIlAy
 yHLm8WBjgHrcPnpvwywuM91qj9TtIXijNbLTnzsv7p9UfLZGf41Fv9GBeSdYzUd2a2ZoGSbD9ZA
 Qmu4gtmvsoPC3alpW81dJax/h8OXizc1LdludUWDx7LBEpBwWyDP5QHqcE8rtl6SSpiV8jjE=
X-Gm-Gg: ASbGnctXYsTKIhpxFeioM9iGnrCk6RBeEShn07GJ3GfPRQL/L+2XPzrnXXVG9a8OsyY
 54mRiHsFV3OMv5dzFD9blTPWxNa9ooCoqk8nJ7HYKDRHLBQImiagUjhZ8xXx7UVX3zpCnVGgJuy
 GgQAK+0keQ4XmIgjMeqhdblrGeLXKRa+rIieIWbWoywiovpPXhCZvil5zqXvHB6KAtychPW3Ypo
 Afv4ikEeiLRPU66CDpTTXGLwohruPStvumhyHIMwIJgSryjgPyWvHxSDLCtzjxTZnf9LuhNbQq4
 +gFn2KMRJXo6V6kGUkn/4VTNQZaN0eqcqHNOAohRvQ8hLMex0tZ1BceM21Tm/7CAM2ZY+pIA5lG
 nYtKE6aScKaRhlocuD+s2/8072kzXM/t2jJ+jWPF/RNmYyZ9U3HjF
X-Received: by 2002:a05:620a:1a95:b0:7ce:ea9d:5967 with SMTP id
 af79cd13be357-7e8156eaa4amr154492485a.15.1754443496026; 
 Tue, 05 Aug 2025 18:24:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE3iln/vIeJH6XAQFmoLvafmfwZ8ex6TVrHNRQ6JVSz4HJUlvRexPyLHQYfDNi/TLCH3K+5w==
X-Received: by 2002:a05:620a:1a95:b0:7ce:ea9d:5967 with SMTP id
 af79cd13be357-7e8156eaa4amr154489885a.15.1754443495580; 
 Tue, 05 Aug 2025 18:24:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332382b55d2sm21196351fa.31.2025.08.05.18.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 18:24:54 -0700 (PDT)
Date: Wed, 6 Aug 2025 04:24:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix a few comments
Message-ID: <mwfrgvslnbfxegxqhfx4ldshqqxyfgm6cwbopm5hk4srgeza4s@vohmu53ettad>
References: <20250805164308.23894-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805164308.23894-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CXSzB0P_ImSkSu575wz3rACWqk78m6DM
X-Proofpoint-GUID: CXSzB0P_ImSkSu575wz3rACWqk78m6DM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwNiBTYWx0ZWRfXwvB6LoZ8TRuu
 fxceyHXFA0HPf/p3ev17S+V9MCcTasXj1+JOJffLt2oW+wwllZoEUfOMwEt5ri0WDGwZWXPzwCK
 1MJIY5tPeZsjCyPIEnKSxQQlchh7n51gtG1HvmRmN0R6RyfhiJr/OQRDErSlS1BHwQNZlilHJn7
 fdcGcdkfvDzvVaMC7Q1qLAclNvBqw0EYFNGWZTaTO4dENbV6BYDzX1Mt3Sh4t4ixyHoKSGYG+wj
 dXoVb92UjWY50XXoyLMP48JhL/zLRLTf7+C0pAZ7ClNCoRPISOxogoNpMBk48P5iy3JC5PBKOb/
 FBX2h07Cf2Kb7473bFm5uZmrpRLeqPZUTJUzokhWxNk6vCJ1HL2E8n9L6Jc8BMZj2TjIHg2Ipf1
 +eyTqqhAkdID40eqjduGl7bEmGElt+HhI8POVnPbZoSYdp1cRBT0ge/NvrQv/BYN7HZr0oMy
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6892aee9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=GOsSNTHw1BKba07vPD4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=930 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060006
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

On Tue, Aug 05, 2025 at 09:43:08AM -0700, Rob Clark wrote:
> Fix a couple comments which had become (partially) obsolete or incorrect
> with the gpuvm conversion.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.h     | 2 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c | 5 +----
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
