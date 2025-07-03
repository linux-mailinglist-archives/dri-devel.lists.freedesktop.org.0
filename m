Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A459AF8188
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 21:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B3B10E1B7;
	Thu,  3 Jul 2025 19:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewcoEFtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636ED10E8C5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 19:45:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563ER7pp015165
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Jul 2025 19:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZCM7QMSDxKv2qFBgS+zVkBmh
 E3IR8xSI0qRlItQCwdY=; b=ewcoEFtMIcZSBpo75EPx/BH/CxTkkphmZBNkiuxu
 9Udld1HDoCowXgie/z+7iCgs4fHNay5rp0GSM1qTQvITb7z/VxaWBxOLlKTehZuy
 er5HTFPjJUxQuOTk3nnA4XNwdiXIVTXWTtJFniD8ktHLHoBsMRBu7WnKZQnfyR6U
 K0yFFaDtCzrIJEvE6Q9PDtVZPXKd2qtH+027PjDWDt1SzGrTBnymoVhAIvrvNjUP
 u7B2ymKP7pNQIGx3MNH40Iai2Q1/yBLqybPKJp46plETX5SEHy+5fW+hgbmgZmKn
 KV1f5bwVmUHDq9aiVnMNwSsh8hRyHQ/G0CWi64wUwzLG0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9sk05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 19:45:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d3e90c3a81so16380985a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 12:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751571946; x=1752176746;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZCM7QMSDxKv2qFBgS+zVkBmhE3IR8xSI0qRlItQCwdY=;
 b=tQ3ddYAlU2pYMaCs5qTM+1RP3vykRT5u8oLSu3ar4g/1O5ijLEwHWcFb/x97wnsU9R
 0ytQj/VbMIBmXY0ZNd/tWD2Pxar/t1zPkSdIJm3ExwnuLIIE4sJ6op283NjI4GhDkrn0
 uhf6vjeEfyunKtsjp1m8qkerEnWPTgyJIFj9XV5EjXqGnRKGuAutXBKgv7TI+wI7g5Fl
 d7x60IzwaesG0cDUGPh/O4j+t+2ik7eyFjjR/+jn5TB3J0jPOnOFI8fNiMHZRThi/mFM
 SjoaL104ITkQX3dUrPnVeqFd6fq2YO5FKezjcXplLO2dggDwO0LgKEdChh7DVuPromkF
 qVdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVjLjuo1BP2/PDslQX3e95NsSb1wC7lnRvj9paN6+HSZkdTbIBb2PCvAi44gAm284VMlUyufLobd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLMHqQQxSxaaAwu3bvXyNxXxo3lXxJGLF6jxZVSbmHrLzNYFWo
 oWgW+2MOSz8iL6TyHMGIfjNgYTLYNOgnDf7hmqb5D/xmm2o3Nwhciin+Gipl4grcbCAVr5Tvs8Y
 +PrLJ4qlB3w8h+xgo1LJgPrVkcp4H/YwvVGRvoRy+4UieUxPhUsnLPYSaqwRYBY0DPvSF9W0=
X-Gm-Gg: ASbGncuagHKFSXzB34Bdah8WAbIja2SBYoCGZia6F62NusgYtyLBWuWCxmNzzSl24LA
 ZuF8adFuMxPnqa3TwGPfx96Fmbao6BXEgxL2nCbL9uagI+bX+vzIXxaCQEACMa0ID1LhgHKovuA
 m6OvoekXmCvl59WUHemLPK+EEoS3gyedizGNjfXsqlDvNOC+E8TkyU4Cl0KfRJBuegtb+KZWXZ9
 as8WQIPt6+8hPe4wNl1SXUuuFRjmZibNQCNJHhopuYvB/9h6KvnEql6ROvp5aKalJoCb+5yKd8y
 mrdotd6D2PGxeZsSDua6C4mEa9hrUnKz0TNsm7q4JaGaiA5csa/O+87KtrIlJljw9AjHEzB+5sp
 SXzSRIqTACZF+ub1+Xkym+qsGPe+mHEmfAdo=
X-Received: by 2002:a05:620a:4586:b0:7d4:6506:cb63 with SMTP id
 af79cd13be357-7d5dcd151fcmr21172285a.28.1751571945573; 
 Thu, 03 Jul 2025 12:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS8RFdz2f0aAezmbC6UWYhes3/5YevtRWhAWpjVXlYu8m9CftEOm5G+GE1c6x1xY4sKoE/uA==
X-Received: by 2002:a05:620a:4586:b0:7d4:6506:cb63 with SMTP id
 af79cd13be357-7d5dcd151fcmr21168785a.28.1751571944980; 
 Thu, 03 Jul 2025 12:45:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55638494483sm55037e87.99.2025.07.03.12.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 12:45:44 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:45:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Message-ID: <burq5f43rrr544kn2kdzd5mvdi4yep5yz2g3dfortldchfqag5@23c7ciirwrfv>
References: <20250703183442.2073717-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183442.2073717-1-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6866ddea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iv_ZzY4-czSJ8NSb4YEA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WcJCw3KVYA0wkDonQ1N1pVOLBSG6HwGW
X-Proofpoint-GUID: WcJCw3KVYA0wkDonQ1N1pVOLBSG6HwGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX4RGkxVhliKMu
 YKEmyz5UgYBlN/9xcA93b7lcFxTbV6WpieOayqYpEXQWOW60L5hvgPc2J6KN+WGmBJHMHyPRzBW
 Sbl2Rl6zJ8LM05zAxXQVqkhpqboTWS4ZPUMOGhpVcvWpc4VUxArObQgXO85BFrIe0+EuTEy2vsG
 t0TEItUqoelDmrIAjBucIolTFpPEgBDDzqkKMl4iw5qJfSCjnt7KSO9sp/osgPFolHOeCXzu/gK
 DQ+dRFujv/CxAMCyAjvxUhH56cqvmQHeDZTQzadnblHKq+44piVuLLDD4/g+2lY7NnJcQ8mIWhT
 UaQKvxqKA3Juh7aUoraoU+lrfOjaRoXVh0XMOgWYCXq0XwzmepQD4Lqeg+wyDMewgiXoh98sYxk
 zE+8ddxX9eqcT2tRCsCPlBUSy9Vh2pe4fZQ5XKFbSbXAS+v+wMWkgLoUauPMRPPVlbd4Po2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=821
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030163
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

On Thu, Jul 03, 2025 at 01:34:41PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The original code did not set 'zap_available' to false if
> of_address_to_resource() failed which seems like an oversight.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 +++++------------
>  drivers/gpu/drm/msm/msm_drv.c           | 15 +++++----------
>  2 files changed, 10 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
