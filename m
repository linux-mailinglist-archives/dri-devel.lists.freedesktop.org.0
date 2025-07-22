Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A456B0DADE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83BE10E2A4;
	Tue, 22 Jul 2025 13:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRZG5+pM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6708010E30C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:31:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9FdVb012555
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/WYV/IpwzlIixikGjcsvi3zZ
 74GtvTpP8nq9H/FHkKg=; b=ZRZG5+pMMQG/exv5HIGHcksPfdI/QuZuiTPG+cMR
 J3hUMfyzApODyi3KcmexgOhbubANojyyjkN/710U2+G8jNJMfa8AW3iZ1p/Sobnn
 ew1D1iNMwdnlCDFEBJXUewe9wg0xci7RkWO2S97OacM/4q2SGF6BA5ixcDhtH0ES
 y1nctE46QRqHDTMLeHyKjkZr1NT5RwGIE3vaY0yzevjwOh3AHCf7gSCx5zSn4EVM
 eazoA+n/AoM+Zw0iMKj5ATVq02Q32o/xvtz5Y3tOcKsW3abkqpvjQqKezNlX0G6F
 DRWSwRMYr8IJV3y9OTdJdZTRv7MRVrLt54VKKuG/JLApjQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6kuaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:31:52 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-4241f355a41so1126788b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753191111; x=1753795911;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WYV/IpwzlIixikGjcsvi3zZ74GtvTpP8nq9H/FHkKg=;
 b=VRVI9xBeoDRLrCzGOY3xm/GKCQcIAA75wF1r9OUXJMI3GevefE0gB8A8HjC4SYtS/3
 qGsv0cAEo+HgPueeVXSw3u1JAl2kK2xfaZ4/ZYFj26VyTYXqY8jN+XLA1iyjJTLbzh/s
 K8dYpu05Xz7Fz/jS7f2wltQ9VZJISEVTcfyT2WzIyQAmoJ3AmXDfsrg4PzJxvCKPg6Ix
 00y8rnQtbpGIGvBLAg5GFMf03iJ5ItWo4sN7qbVLpxoNw53Ju4mio9KxGid5zmSvggqm
 UdgO52KNZTnSBPJl4S2UrvnXqXbxBgBWX2yM8oojKjIXVfctKE121PEaY3zdt9syb6TA
 irjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXMqHHBtQ7+UlfAejLPUDS6sWLIg6ZBzj6nv2NIimIwzSNZ3+pMJgQiAwm5nOJwXXHNcyv1/6eQvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJSlExqeiLNTTQsDbKIHQoecrSNYkpC8K9ESPiBFLaQRltgMQR
 Ga5YmT10o4rFJivQizydQmB5CO9e+v7QBjSeM+aOCVy0XvhSqrs2yPRfC6zlBMe27OUm0R3rVx9
 ipjar0hI7jGUaztfqhbPkHkrjxBBQeBzsiYHMaq+68q7jVe0rrCTViNHMwf433x+U7dBm2WQ=
X-Gm-Gg: ASbGnctoGa/t0nuRa13Tk+dbOc52JSYjA2nn79fkYu6IrtQR7j4lySQGVFCHFMelhpl
 waR/65wzemVe7e24vF14wJwJFyTzOwY8lfTW0+aMhpqAOoVVLD/witKreGi93+x0SfNF3lN4Bn8
 gHTAkn1it2eqN0m6QiXvkTRYwCOi0OQ61dHp3wFs+Ure8eC9E3pX1tnyWkDToPNdINGHruf+CL7
 ZEovRGUdkQFdw0KCUxR0+9IQ/Lbm5Kuo6JmNzC/ZLLpTg4d64b6loog+91EaiNwAzdnNeTOwvvZ
 UT8xuHXH/sQACFWFZmww+kam59hF+DLCa8ETM/5kT3HYzia0/8RNXcXlEw+t4fHk5hElAmGrZ+/
 Evx9TJqkrw2ai1Vjw01GvoGS/QuwLQy1HJauiJBGjTuNYEC/Ap/eA
X-Received: by 2002:a05:6808:2f06:b0:40b:6531:a43d with SMTP id
 5614622812f47-424a564a74emr2971622b6e.2.1753191111500; 
 Tue, 22 Jul 2025 06:31:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXXNKpQVAK8wSW1rOSvcuIJ90cBPFt5dTO9JhQF8U4J1q+bkg1PNkAQobLqYbFNvBZLVqrjQ==
X-Received: by 2002:a05:6808:2f06:b0:40b:6531:a43d with SMTP id
 5614622812f47-424a564a74emr2971571b6e.2.1753191111029; 
 Tue, 22 Jul 2025 06:31:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31da2b3dsm1952626e87.183.2025.07.22.06.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:31:50 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:31:48 +0300
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
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
Message-ID: <shq6rnj5qrw52xvtcnu3bbvxuxjuddzajugawcojdyrm74fpp6@abeztbbmtqnr>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f92c8 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=c4-AqNUvOhhRGI8Ju6QA:9 a=CjuIK1q_8ugA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: BrcdKLXpWKDQbLMPnW9TLYEf-kmrt8Qu
X-Proofpoint-GUID: BrcdKLXpWKDQbLMPnW9TLYEf-kmrt8Qu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEwOSBTYWx0ZWRfX62njNhtOZ5AC
 LzRZ4fIY6sDfNdwC3UlPRccjgvhhECL4LNUVNS06SDa3NYTjVBzM81xcIwi5UhYr2ffa6MZFVV8
 FhwIh+2Cp6Fc+CfyldXboHaUv+vfte1Muy6c7czwtFd86J10PWmPqIIdKETkB6cmdh6wEnMewAD
 610Xwe/HTmv6kbfxbdOHsJY2GJTQSuB69uN10jPajaYxXAQXnff3xV0GUL6SVbsgSA83d0ERtIy
 QCMEMHqOJCNLZFqezrLuIbuB9z11NQIqdsX/q81+eiOvRik2j32sEPBh8PAREseHaKlieiM0x7Q
 PxUj2cm8ZuVdESgP/6iN8/LFpOmoYvF8rE8fdtK9axG3xs8vzAYJgTUGAcZLwUkUvEdfo2/ED5i
 3+N+d9YgIK/V6v155zwNoO/Jt2OE4CPtvoB3ZgdlwvkpslXHI2b5izOb98GB9T/EkhzjAYyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220109
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

On Sun, Jul 20, 2025 at 05:46:05PM +0530, Akhil P Oommen wrote:
> A7XX_GEN2 generation has additional TCS slots. Poll the respective
> DRV status registers before pm suspend.
> 

Fixes?

> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  		val, (val & 1), 100, 10000);
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
> +
> +	if (!adreno_is_a740_family(adreno_gpu))
> +		return;
> +
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
>  }
>  
>  /* Force the GMU off in case it isn't responsive */
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
