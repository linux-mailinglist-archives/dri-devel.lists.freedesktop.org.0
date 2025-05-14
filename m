Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A42AB7718
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1513E10E734;
	Wed, 14 May 2025 20:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mltkatwe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C9610E734
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:32:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuoeo012655
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XxPdt9cqTUOBy/MQknWD34Qy
 9JQbrEE6AdpEjUZi4wY=; b=MltkatweJY4EspyZRwcEgq0QjsOCbL+hMj2X8lvL
 MC5913jkkE0xXE3F8a275nrpNqkgzGtEpJdaq6Jt8MORVO4Zu4SWCdiD+UDc17BS
 XQ1ZtgArq6YvvXWGq8eGhoAMIJLOUmeNvpB7LTmox9ImonGcb0iFBmr2PlNv4XJq
 GLEKwyYCJ/boTRjvcfHof9eP5DPN+Dwnxmd+BvX9YyyDUkJS9dO7PsEfvy0klB3Q
 z13BN8ZqM70TguWGi8JUDddvPtP9vDgORCiLNiHCir9MMaZao2VoCWlHUe29GqTJ
 8lgTQ7zAQhJYNcvcXtAifjbP3xt8sm4oJS+L93Rs0N4/4g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcym21d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:32:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-47b36edcdb1so7307731cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 13:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747254758; x=1747859558;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxPdt9cqTUOBy/MQknWD34Qy9JQbrEE6AdpEjUZi4wY=;
 b=k1Gdun1ZYDC2KVHWhpQUcLQgWAGLv4zN/cZNCt01SOqJ8YmNhXbCw8+9+d2dlvC3zl
 1yZDA9JwJN26YaMPnyh9f8WBs1jUvh51+E0ba+DTfn0o+4XdbJGEW9xpnIUXJI1g0t7W
 At0Q4Dx59jarwTt1ppwwnt7+0z3b7dDvhLgL3eAWw8zTgCOSBWazU21V/jHIKkVdx023
 GSNQ5oK7NwAw7Td8Us6dtRrhKRRFVmsa34DEebzFVfuzYbPjTKbg9U7QdR8SMgzFzT1J
 kniSTs/dfPIn2xa7iRh9Ptso07+DfS1PeHaRxAu+QG9qmcTnYWSYXSeIRrnnArBrq0xU
 U7bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW546/HsJsgxc8g0ErZmqQo4VsVvWEezDdytMRw+dUYImrvAv69KxA+kfyaaSh04GPPIqmiHmuedf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7qJHu3DAuEk8kXGAg0w2gX2L4FJew/SO+RN8o17YQRuav8Ogz
 WgAlS77jPYJ9vLiQlrzQoVoG1D9m61spnjnknyQQGaTt93apYMbgAmaWEGjg4qBzb3cEE+B/lZ/
 pypQclf0Iv5lx5rD4U3NvFAPJnfizsxfKw/o4xdY64bCxdsz1Ds2LN/bnTPMHQUXisnwUHCUbeA
 M=
X-Gm-Gg: ASbGncvqHIu79D1P/KnRj2ZDsywnGhE5B72Izqi8SBq6AP4tn/dNMgrA3rGfTW63su1
 FqluQ9prJIxoCx5HpY4AidEHzMvnsF6SFUYzGvEsBVZbnB+lQK4dzaef7zfyoJvukZ0eTyNInUF
 fKUpGSqhoRyWdvcHkxiFwJF/j/oYnzUs2qslYgfxtWfzkmHczjq1A0V+HBHiKVS455+vrN+zkuZ
 /xoQQUUm2Z4v+C+oinywOLsOIkMjhLs+Ul2cFU/SUyZBXPjYG7POmxSojbMC85ogueYVsRv3e7C
 cT3UkiD22uQlOz5xhoCk0VpeOoIGGpntqL63dkqUJJlggsm1MMXRoTwg3LyacoVc1DPxTqgir3U
 =
X-Received: by 2002:a05:622a:6110:b0:494:78d5:c8cb with SMTP id
 d75a77b69052e-494a32ba633mr1027581cf.4.1747254758132; 
 Wed, 14 May 2025 13:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFjaViNcmlJtAKHvgfVZ3CjaBKnxNHVGmEtfw379yfKxDhn5w+VxEmOu10Ygw0Vu93zhM+Xg==
X-Received: by 2002:a05:622a:a0e:b0:494:78db:1e55 with SMTP id
 d75a77b69052e-494a32bade9mr1639071cf.11.1747254746920; 
 Wed, 14 May 2025 13:32:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c358ae30sm20781661fa.94.2025.05.14.13.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 13:32:26 -0700 (PDT)
Date: Wed, 14 May 2025 23:32:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 12/15] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
Message-ID: <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: 1ZdsHLmDvNLEyotTBRH7YYuXYaqPOHI3
X-Proofpoint-ORIG-GUID: 1ZdsHLmDvNLEyotTBRH7YYuXYaqPOHI3
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6824fde9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=YFUBf4FbcCgwuu9kWHgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4OSBTYWx0ZWRfX38jHja5YPw9C
 Sseu5lWxjobKXTdLQZnCPa/CeHb6GKpISuPc1hj289ZUhCyS4pDC8X+pctSMAq6oZoNcfPzOcrQ
 /DvN5Jx5ncI+4maxVFI9QtffXEFI8bi7caRz2hH+RQCtOr/NQaBd1xHHikfdaTXnB+1vRMFzAkU
 RtCK3G+jV8bHjFqMjZVGL8iSy4GCzn3ROeR5HQ/Zsupy7AFs6NzHsRTUOEjBZ4teGMJIid0QcnW
 t4X/EaLk+JWVyUQ+e87PoJqjGjWxM2Zs6W7xv33uEG2+6pNDodPu2vnUlgU3TBb1QvOQzpqzzgh
 aqBPwaKTz47aDMEyYNyKCKt+09hUMTb9TjfsZDU1mDaJX742lg5lXqNNFJoDXzG0NcKZ4UtgXXa
 mpjHQeFxaNkI0yhb65PPfQzGZgeccltnMBuoVxah2I8E9supDb7BtZyxw+zUki8TWRpnLDhV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=933 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140189
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

On Wed, May 14, 2025 at 05:10:32PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> On A663 (SA8775P) the value matches exactly.
> 
> On A610, the value matches on SM6115, but is different on SM6125. That
> turns out not to be a problem, as the bits that differ aren't even
> interpreted.

We also don't set swizzle for a lot of UBWC 1.0 targets (as MDSS wasn't
programming those). Should we fix all of them to use 6 by default? Or 7?

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
