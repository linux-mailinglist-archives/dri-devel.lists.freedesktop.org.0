Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE39FAB75A9
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E087310E2CF;
	Wed, 14 May 2025 19:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2JzJzOo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9EC10E2CF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:19:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAvWCC004821
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NSHyr8CcfGxZ2/FMsoq0HRY8
 55iH+a0Kisr19P6Fk6o=; b=O2JzJzOom8ocJ+7zhyoyrp+ANFuZtweFf1QHwsm9
 s43qAt7RUPh5WzsAYicfRiDv+ScXNLROALmmt1Dky1/hbzKNTavqgljFAaeTepX4
 sicANhLzlDIg4rU2uXDw41AL8ph3feHUOTbuoI3m40yKjeTf39buXBIaEBzJA+QD
 4b82H7fBiGJS2PCswYk5YrjwP6qBsG1jOqSdCxlHI4BKuwbRjfA69jNpSshMkDTf
 sMEAG/mh6lxgS2YbvGUqynmACdz+nyik2Xly9AMpZOhgPMYWDb/zyWh+LZ/9vs+Y
 jcANfVY3pv/ZLdKme+ZxikYazpyTh8S+LSyrPO16Ml06og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpbu41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:19:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c9305d29abso17766485a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250387; x=1747855187;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NSHyr8CcfGxZ2/FMsoq0HRY855iH+a0Kisr19P6Fk6o=;
 b=F3ua3lHQ01HeCkBFcuHceTyLA9aqtBSmMDKZj3hYOXKznPKQny/jrQyHgx01ClckOg
 lTgRWgq+KcOUpBarDyvEP+Cdg5HpB/pO1A9ttuqUZ+jk5POamDGNHiusp43V8oqS7emd
 ijUFD7v2kiSqVzphah2EvZwfFaIhEGwA6pAHrDsaOA47OENnglyj1bMyBlPmLExbTQ1c
 ab3Dno4aoWxB5Sr6TH/HC3AwSBpUyYx/8lQZx57XTZVDPR+rdwZNDjiFAlrgOAy67qp4
 7m6rdqxPKd+3QviPDzoo92LNEDgtbmp15PI/1IGV2ZsrbM2nk561rWP9n/8tfNpZCBqI
 ZAOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkf4jMrcVAum/2fEFXg3Qq1DfZLfjFpikSwzmlLkyvkGuxZXopibQuDhtFu7uc0cxFuGxFgPtN1mM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo/EhyYUjAGffJ6PVE4RgwXOhxzYoCXQmAPfDgnrWkrNXAp/6t
 FsRSIr+ORPuQpCpuzW0aySccyDDp6S1Nsx+S9goZU5+V1d/pBcHlEzsRjRZ1ILbU4ygDB+bUv2a
 zZoYXWbqv6PWcwuz99T49mHA54hAQoHUVwRiJvS3A9vS/a1UlXqbysQF6ZB5/yM03LCs=
X-Gm-Gg: ASbGncvYedV46Xje+3fDHggSiWxJ0fIp8fUZorYo5FP+G5lyHmf9CpgstD7rtIIKdLL
 uGcFoU2qKm/cIFNxz1azNADXdSZouSolC26enXoqLxaPD4qRN9GA/AGBmOGBaqvjhhxgKGiUhBp
 MOWIY9qQZEtr6nuzzLEF8rkEc8I2iQObNyL0I4kMw5sVkzN7SYAGLzGhDzD7RVAHqEk42bd/k/t
 aP1qjaHnZXFJaMYq/NQUSg4gM1nqvrF5ihUhFLgxgYX46+dg27Hhtg6896WRfuuFv/Sf9pRAig7
 fwsa+alg5yBscDFf6YzT8HiIbhDGojdu+iwz1feLYg3DtTvpOeaWINa2I/hTm53luhiBhWaEExY
 =
X-Received: by 2002:a05:620a:2984:b0:7c9:5ebc:f048 with SMTP id
 af79cd13be357-7cd287eb2ecmr555968285a.20.1747250386790; 
 Wed, 14 May 2025 12:19:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0P5XZzLLpPqaHxvQBlIrU80oFWrGZUfLAHjWlXyT4vEYM7GmFzGqbUiFFJbaA20guyHR/jg==
X-Received: by 2002:a05:620a:2984:b0:7c9:5ebc:f048 with SMTP id
 af79cd13be357-7cd287eb2ecmr555964185a.20.1747250386223; 
 Wed, 14 May 2025 12:19:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c5e977fasm19539111fa.34.2025.05.14.12.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:19:45 -0700 (PDT)
Date: Wed, 14 May 2025 22:19:43 +0300
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
Subject: Re: [PATCH RFT v2 10/15] drm/msm/a6xx: Simplify min_acc_len
 calculation
Message-ID: <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: 5biSy8ptCF6m8mqu8tbcOCVFv89akS8d
X-Proofpoint-ORIG-GUID: 5biSy8ptCF6m8mqu8tbcOCVFv89akS8d
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6824ecd4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=d28x5gvVvHF_Cf3YLGcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NiBTYWx0ZWRfX78KH0vFIX4EU
 OCkfNwOZfuHzdn0E16fbXNFC30kz5FKZZTxzaeGgbAmWTZgIlXkEJBrI6nEbQkPyxOgBP55m+6B
 f1LLZWYxS2Gkux2tBKYpmXZc28I+1tQCGMqyw9UfRVabgxBpDoXMHy+o2/vnTwIT86qNK/1SX1Z
 IlhankP8rp6pq/zGJ/51WZYvG3ttIGdrNiaZESpHbk47xWYFoEwfqIsaMiapk99ZLKdmGP/7Fq/
 /+gVG+EqgpVvxmuA3p9YnzPMj/KIy+CKM7ooO4xlpaZabI8+R8RBXK6892kS8+8tuQWl1lEmJTB
 nul3dT4Wf8+WHnptVGnz22gnOaZaTXmeaI94kSLQt+MZ93Li+RMCCQQdGmyCyA+yLZd38DpEsoL
 SiomvesQ7XV9w/Jkb6mHrk4+z2yo2txcu13K4lMiDTUqRpykWo57mFCeQ2ftopNUpiNbO5dp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140176
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

On Wed, May 14, 2025 at 05:10:30PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's only necessary for some lower end parts.
> Also rename it to min_acc_len_64b to denote that if set, the minimum
> access length is 64 bits, 32b otherwise.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5ee5f8dc90fe0d1647ce07b7dbcadc6ca2ecd416..fdc843c47c075a92ec8305217c355e4ccee876dc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -592,14 +592,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  	if (IS_ERR(gpu->common_ubwc_cfg))
>  		return -EINVAL;
>  
> -	gpu->ubwc_config.min_acc_len = 0;
>  	gpu->ubwc_config.ubwc_swizzle = 0x6;
>  	gpu->ubwc_config.macrotile_mode = 0;
>  	gpu->ubwc_config.highest_bank_bit = 15;

It occurred to me that here (and in some previous patches) you stopped
setting the field, but you didn't drop it from adreno_gpu.ubwc_config.
Would you mind updating the patches in this way?

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  
>  	if (adreno_is_a610(gpu)) {
>  		gpu->ubwc_config.highest_bank_bit = 13;
> -		gpu->ubwc_config.min_acc_len = 1;
>  		gpu->ubwc_config.ubwc_swizzle = 0x7;
>  	}
>  

-- 
With best wishes
Dmitry
