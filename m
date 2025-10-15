Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F92BDBF05
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 02:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2122E10E6C5;
	Wed, 15 Oct 2025 00:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="drvVXABG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097B910E6C3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRBV3015429
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=v6jgXJjjhJQgEeLigi3JtVL9
 kgOdixyq/3UnYeX/yA0=; b=drvVXABGVbv/fGc7BU2ZshHr/53UJPRKevbg5dAc
 EJkhc8WPrU3jGgxZg+z/KtLVe3c8EHmm2B20madUway+zu6VRMNC2bFFNAgEM35Q
 XO0LvL3sxnZjcSB785f2Oo8EQFGFkg4LtWBEpmYi3jewqDa8vNfMjQCwkcge+7Jy
 ZnsRxwwfLG1jObcAEAePOz8VB6fFF6JewKsrbD1+X6BelKXIecB87Cpw81rXcL40
 KpOFjvJDKpUru4VLyk3XWGoniTWDxltnsnaZN3D5U40n5QFdrhmuckgAMd4Sxb5/
 ByBlsx/ccKehueVHIaeUraHDMWaXNACleQQqDOS1iFKzdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c2g41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-88e2656b196so94393985a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 17:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760489566; x=1761094366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6jgXJjjhJQgEeLigi3JtVL9kgOdixyq/3UnYeX/yA0=;
 b=CoXvoEGF5aOPYvNFLK4cvXA1snMMUst6joxb2eS3/2OvZQ0YiyVsp8uswWvYofoGqZ
 2ZKzLBB/uG3XMw/VY3YdcSRRE1zK6477Uris0kPBfWjWCjkkUKK7bw9QScAzaS8wBKhL
 UmuZAXGlsx2aOI5ubVi3eWYz/y5zAd3S2XMEoo+eSWaXnqy1/c53vLbRWu189rTXcMqj
 iTLER+KMjDehiyOBjllYfy7A848jciljbhKcRmXIhV6CvNy+aOQwBPMGjdqHSadtAkt1
 YPCd+wnq2Rb9qnPfJjD+E0qVamnbn2Du90QKe2WdkYMu7tr54anrjVFulVulxzbGfB8Q
 Eg2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9GG2NKGD2Jj0P+eprCantoyJeV2UYTJRDZSI5OIu5W/41lWB9I2iMsIfayFgafXcSu5XCm8qnItk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdV4BRmBWQUBMHYwkJCNJZA0n4qAOX/VnpfTtN5GRe3YpR2GWW
 /Ea38oe/p0Z7shNCkRFAx+lZXaC7iM7x+bRvcSJ107uG8598HXG0ER2hoQyBAdl4msUSTA+0c06
 LZhVkVqrWyb8KnKP7Du56+E0dEfxlsrN3QG3p2EvpZdPIGETCsGUPG2lhD5dGHFlPrs1D6Zc=
X-Gm-Gg: ASbGncsKs0hzU9c42Bj6pm2wwwXhJ59A7dy42ISoqLA/EFS9YzatQ87i1z6XsdbNINr
 neMrZVBwzn3jeXp8fex9sFZesAMjoZnzfctRqyeum/svu+PdLcHfs9DQTy2Y0r9lzXSpDPc6Lv7
 ZFfUVNuyE3M2gsCcYkpiwNYXNi8EdSJ5YGCkEmdTcKeTDGIPyT40hK08zticKsZ/d6vE+7stGwl
 aLshRlEd3f3zV0OAvNrqkfTY2DtCvUcmjl+NLvA63o5V87A86EBaNyAHj6r4ii8VQLMlC6warxW
 uLrJmmave4PiPEHVR0bdJDfxSwAXY1NfRLlS5EGkbm//oj+/NBeM/QgLn6XFc3DtWsS/+LRwunV
 rM04bwGBClDeCws1a3vxbUub7nbSYS9h3bYzL5ld5Otmr5hKyXiD3
X-Received: by 2002:a05:622a:490:b0:4b5:781c:8841 with SMTP id
 d75a77b69052e-4e6ead46dc8mr387551161cf.42.1760489566168; 
 Tue, 14 Oct 2025 17:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW7m8cRicbOVlOzwtOiVLlN+6jv4dabkaHZG6TVMI+/LbJiygclcG412ZISQ5L9/YyBrt2pg==
X-Received: by 2002:a05:622a:490:b0:4b5:781c:8841 with SMTP id
 d75a77b69052e-4e6ead46dc8mr387550931cf.42.1760489565763; 
 Tue, 14 Oct 2025 17:52:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762e7f7f7fsm44067811fa.27.2025.10.14.17.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 17:52:45 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:52:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 12/16] drm/msm: dpu1: Switch private_obj
 initialization to atomic_create_state
Message-ID: <36y2be6lf2hthjqojovlqsonkd4borz3qh54wup2mqvgktcuca@h4ziajonssoh>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-12-6dd60e985e9d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-drm-private-obj-reset-v2-12-6dd60e985e9d@kernel.org>
X-Proofpoint-GUID: 0dqnfSO3WSDB7QuWKNeNBQSJYYHSbJOC
X-Proofpoint-ORIG-GUID: 0dqnfSO3WSDB7QuWKNeNBQSJYYHSbJOC
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68eef05f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=MY5GpsA41Snrp9pqcaIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXwcnevzytFyUR
 N5a5hC5jJzGX8yRM6tZjS5ng8sIgm7/yejZQgCPBIei5AyEa+lIsx7Aay6TWN8qMxyQ61bwp8ZK
 N98fUrbjiGgyUXdbvnUgxaZrXNbRrQEM/LF9SL+9h+kokBSOkWHsxZNpQ2RPIWSefMXVhqWS/eJ
 U4XgP46E0rHdQP1lhuJqefOAfy+o14l5anif/dgCs2UsHmCG1qJ95Xha3P5tVwTIrXU76DMrHmb
 yjRYHXwIB5guNLBOg/baWkP9lp9UgG4MMDn/5Dhngxep9mvsBm6r9VkzIkuGudaIdSF6zAsjoLO
 TcrungQxVwcV7MdQZ7lqgU2TteufjL0f60ANLDF6TNK6MVkar6LphVAno4lg1OGzkwbQk8JiczQ
 JD3uTNe1RDMHVqkiUn6eBQG/f107Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
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

On Tue, Oct 14, 2025 at 11:31:56AM +0200, Maxime Ripard wrote:
> The MSM dpu1 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 42 +++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
