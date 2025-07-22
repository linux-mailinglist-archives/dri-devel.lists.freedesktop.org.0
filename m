Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C84B0DBAF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EF610E694;
	Tue, 22 Jul 2025 13:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Onz7x3Pe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F392310E694
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:52:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7KqIO017492
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Kw9ZzSYekP4jnMMDcD6u6zPA
 55Dkfs0wyd2ey7LJ+D8=; b=Onz7x3Pedf5elMf/z6wd1xlgRL/J1CJ9BxfEi9Do
 FS3EDeFEgiu2i06HRNNfzJNeNjNkeTCk+AEUm1vmMa3ci/IoMf/1IGmQ90qcARy0
 SWrh9BhIo7i0+otRHvLZhsxk3ti/7DL+PvQEhfqRMrOaEw/HSPcPgoy7P3BE2od5
 2r6PRKjy2/M0/ch9+iavqkIqieKBSQ70McWiirrNSA0Zy5W5LRhOplyIOTjaoL0N
 bzrnmCCezGcoL6XsVegZqsklNiFAvlC0l1aRgjfhXNh8zn4m38l+hm+dBDf3qT6R
 oph5hjbnFFznkQSfOzoxuwP0BJMJGOaM7NDwiyJq+ZMPRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w2rsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:52:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e207330a45so779139685a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192335; x=1753797135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kw9ZzSYekP4jnMMDcD6u6zPA55Dkfs0wyd2ey7LJ+D8=;
 b=NDkT9Sazs4kZBuwFbPZD/lHI4cBTDVD/eOMCP686J/OBGXrDI1cS2gaA45iy1oMjaC
 /NOJ36IrQri8rgWIrvSG0V5ANVUZJEqwY/LVosymcIbnQaGxPs7QZz6CWm5Ytk4Id27b
 42ybykRi8RqanoDXGOGFARSVtIJ4/M5PqTgrumM4Eov4ve2Dy+saxhrutHEYlrSgWCUd
 HgmvzK51grKcwTM/v4gqZViD4Vr0PsYKDB1TBQ7zfld+Oaon/h6joOJebSjIQ1U2DIDG
 7Jo4HzpF7wS2rvYEyXj8as0apUt517n2eMPdBsaMPCbMBqnuWZeF4ccV0pM3wK1xLkc3
 tLTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5PpL23ohS06Xdc9SMO0iOJJ9O3JAasuBUguwqrUj/7Hn6mDAZyCKt931WtWdF03quWyUm4nckqjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvWj0y1xFgUuPymqOZnhwM+cxphW92RZyRfHA4uFUrDrcdrqL+
 pqFCKHCSVmveOrsQSUkNjhJOy3vznL0h6jHbi+RrWRnPjudwSQ+//w7vzPmhZNdjSQ+LoMEhXP1
 Kn6kaTuNLVKs5MJB50lHG2ypa4GNVlNk7Eg5RsmVJ9ZdpFuE6qVfTb9GI2FKV8rs/CntGJoE=
X-Gm-Gg: ASbGncu5vvggh3HrI05kcVWyPBbTYrQbqVXytFz1YYFgMm+jS31RbLN5yXC3u3ClJ9n
 JxWNMaS16Izl1HYipFbHf0PPOewJlBwfHZbt9THUa7kgVl67RxFduksYJl9g807Tu8PG1i8qkAs
 qEXcoH3sgG+SQOD9ehBS05o7HCJBUQ/3ZEO5pN9sL7i8eG+a99ufg9QAYkKS14B2SY7QaVRqct6
 qtdDFFCfmYjHCfW3tIGgI8ZwSqMpzRoeg7ECaWyuFY3ButdCprgRaI1LhJRNX15sKDoH9mSIxV1
 Unp9FNKQKRtMwCzmFn7x+iHbgdAGy+zgBvY2KeMOFpusx2PzfXb101HJfN4Cl1g8JRz1VGbeeKS
 6W3nPI0hDRc8lj0Yh9OMF31C7hDkk5dCtVOS7S4RGfzlgBneoFJwx
X-Received: by 2002:a05:620a:4088:b0:7e1:872a:50fc with SMTP id
 af79cd13be357-7e34356cb7bmr3600634985a.15.1753192334853; 
 Tue, 22 Jul 2025 06:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZcOEKfXjfbMZ69Gm3WsZ5DAtXxY4VO7zJgh6a1vFVgcI9uk4+0wZ083YoYs+e4/Wgr2kP+A==
X-Received: by 2002:a05:620a:4088:b0:7e1:872a:50fc with SMTP id
 af79cd13be357-7e34356cb7bmr3600630485a.15.1753192334345; 
 Tue, 22 Jul 2025 06:52:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91f1f4bsm17890721fa.105.2025.07.22.06.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:52:13 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:52:12 +0300
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
Subject: Re: [PATCH 13/17] drm/msm/a6xx: Fix hangcheck for IFPC
Message-ID: <i4o3ivearks7gwg37ywyqyl4jpmbwnuczac6h7dscrmlepawag@jhedlyj2hzps>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687f9790 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=eWe-OnA97Zcb8zRWG70A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMyBTYWx0ZWRfX023r5NfMflQ2
 qn4TqlG4+2H76a6DZopuWgrnTXO4ztBTdFePJ47A6dnY+/i5OwL4DkWxIIRy0/Yjo+mxSW58K8m
 8K15Z0o5/pJHWJMB7FXpw3ClNv9DeeBwV3ODcTC/UBugvSfqpNVkZ0DYRXpu2lph56JGhAW8CXE
 S9cU3XAUEWQSC6J0KlacK1RMgKxJY28SYFRdlZR7eGK+DSYcLUka6GPR1MhlEHNVn/qrJWQVD6N
 SQyX0XOQiyDaKSTkKeLTDpd4GaSFV7I6kAaZfrV0pzHVPcpkZY0ed2nCNn/zdGHeKNu5xA5lm4u
 jOshzcLNPV5vgYmf9VQvGIgt002IsRD2frtPTDM9ysc2LNvinL1budss5GWtlQERbE2y7YneppK
 BmAn9AaGBoE86Bepd8evlAOjmLDRA3vRCIbfZ5b4BZgbxz0MEfRt3tiJImk4axeX2AMb1Y7F
X-Proofpoint-ORIG-GUID: _GkG1zjXE1vRNnokGMcDzMPYLlOdeLVf
X-Proofpoint-GUID: _GkG1zjXE1vRNnokGMcDzMPYLlOdeLVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=966 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220113
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

On Sun, Jul 20, 2025 at 05:46:14PM +0530, Akhil P Oommen wrote:
> From the hangcheck handler, KMD checks a few registers in GX
> domain to see if the GPU made any progress. But it cannot access
> those registers when IFPC is enabled. Since HW based hang detection
> is pretty decent, lets rely on it instead of these registers when
> IFPC is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb..b3becb230a94163cccff4eaffb8eed44f1c29ad0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2399,13 +2399,23 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  
>  static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  {
> -	struct msm_cp_state cp_state = {
> +	struct msm_cp_state cp_state;
> +	bool progress;
> +
> +	/*
> +	 * With IFPC, KMD doesn't know whether GX power domain is collapsed or not. So, we can't
> +	 * blindly read the below registers in GX domain. Lets trust the hang detection in HW and
> +	 * lie to the caller that there was progress.

I know that we've relaxed code line width to 100 chars. Would it be
possible to reformat the comment to 72-75 chars?

> +	 */
> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> +		return true;
> +
> +	cp_state = (struct msm_cp_state) {
>  		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
>  		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
>  		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
>  		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
>  	};
> -	bool progress;
>  
>  	/*
>  	 * Adjust the remaining data to account for what has already been
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
