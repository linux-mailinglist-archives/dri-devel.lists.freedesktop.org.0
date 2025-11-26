Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23247C8BF9B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 22:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F09010E6A6;
	Wed, 26 Nov 2025 21:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrIpD/I9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0uWMSTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B1110E66D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:09:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQJM1xT2221679
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yMrBrEupzNG/kjvgWInV+ccqxgsF0dGrNdtRVv00PpE=; b=nrIpD/I9+2FOXmOq
 ELLsoK3ZOZ3W7j/fIEAJVJj63CoxME2Pf28rmqCchMZ7FelHfK33niVpo4QM/oI2
 fvqYhCHjLF5KvJK9AUnwRZog+or81U8bwU/a+2ksqb5czcgIuVYrlnxna/+Ov/CJ
 Ev59eYXmyHY+lb/pRR57EfTPIi5A0T44y4QOyX3yitaHwG4SkRIqN4BOWxYNkRtF
 t6z6PHVgVHxfYCtXVDx8DZPCfRLYq+WasDoW5Lvf+psRXlcZ/wj6pJjrHZ7BNmJE
 ZHiClQzbYECzArPrW3+633cT0W4W4UICb26hatHZ9bHVuppdwvggMugZhNgk+V9j
 Zno5Rw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n487uw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:09:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29845b18d1aso2975085ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764191364; x=1764796164;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yMrBrEupzNG/kjvgWInV+ccqxgsF0dGrNdtRVv00PpE=;
 b=P0uWMSTdNsNaCHdafNjQtAIBTSUQ9WDUc1eiBDfmIGUYiQo90ob3qvuDGnXYzKUsM/
 PSoR8tNMBYarXhAu6KsfP7tyMZjAHXJ4uI4Q++d1eNaFVGOU6NZ+Jd9isvdrkdBp7+Y2
 WMuYQErlDFdkQg1oi8xFAqOTUpDulk8Jpb3UF5DkxuEjcl7nDv0zjcUqDZTTGu6vS868
 tK2kKeDd8G9fWcIl9PhJksRPbno6MKWS1GsJwSNYZSR05z4eoz2jWuG+555N2iuUJ2d4
 pbDfO89PlvlYg/D9KjTRf8MK6Tma29UY0IvVPeXVqLt+O6oEKV5OXVSz5CCgFCdxzSM5
 b+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764191364; x=1764796164;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yMrBrEupzNG/kjvgWInV+ccqxgsF0dGrNdtRVv00PpE=;
 b=XaZOwDVTjPF2TP9LdOWS7q/nmEQThj5GS+EbasUmTEuwENsVQQBQcQTbCVAFnTLJEr
 vt6esW5JwvHFwX338xqHxdZYUN203zbC16JVAAVKuCdHtjzwfnP/r/l4vo+uETFFeH9O
 yrNv+QmS0X29BclhUbq9FQ95+OdiYSEelDO64mrOy4Jgq69VaBXLT2TErzAu00JGzlDc
 7AlsEIvmhpbST5YuR6TKfmfJHOzSJVYx8Ay7AUcgRa5yAJgMYiAwU5cY/RPC0OP+Ih1G
 Z/W606ZVjbRX9R7PWXCnSkxvGu8dsoLshl/XWlvc4Sa4eFPeTjku28szz1g0b4LoftPF
 kz4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCbrUHOkx1s53zILwrmAlI1jJpJYNe11bHmsn8B0uVy3fbUPtYoNQTD3B/Xd4bZKcM5h0dyY5w5Q4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgUdYg9ZN5bzAVosxHONwP8Me5Jy/Yv4/1beNrq5rSh30YNDxR
 V071HIRH4EiYNErMfeNi5naQVHnO9j7HtCfzYvyiEggoJXoTBOE3RK+wZBX7Dzr3n7QG51DwKlb
 Ue4GhTM3kKtBlQLOk4nTuDQo23pu+X9YwYblQUmf0q7ROSuoKhZMbnwY/JpPLDf1XMssUzFg=
X-Gm-Gg: ASbGnctbh8Aof3eHX/MHWQXQPJ8Qdx99hrqFmE3y4uBktbhYk3MxVHknfphVf95gz9i
 NP+ZdTsIF5A9bONOjZFIDwcR7RAV11sUpTdQRN6ap34BspBtMjwdlqOHDwv210LtWikLWjtCTp4
 tEjGrOo28bQrKGOtMs2pD0p3cdCB1fGtLzbixQAXuIuiRdgWTCbfCWoBIkMYDFFlp0k+4mpVdiE
 s49EqbCj1TXW+oafihEP7ssToxNRrpDkJlmFJm8o3Zq2qE4EduaSViE1Nja/GbXMAPSqQwXeSbs
 aL0gpeX19JPpH92ce2fmjXCwiYWlqiPs5Kr+A22LpieY6dyH3wwSdZw+j5U0yAN2e3WRsIadbGA
 5X1XMHOJ7ydhJcoLvMHI+TibyPGfS7/A1
X-Received: by 2002:a17:903:3204:b0:295:5945:2920 with SMTP id
 d9443c01a7336-29b6c575104mr222681835ad.34.1764191364387; 
 Wed, 26 Nov 2025 13:09:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZw7wRDK5hth2e63vJFBF8A71k9+LuzivqF3PsMUAR04Gv7kXOToy8rbBpWlmX1hZZcRTOjQ==
X-Received: by 2002:a17:903:3204:b0:295:5945:2920 with SMTP id
 d9443c01a7336-29b6c575104mr222681545ad.34.1764191363890; 
 Wed, 26 Nov 2025 13:09:23 -0800 (PST)
Received: from [172.20.10.3] ([106.216.204.28])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b107774sm203797555ad.9.2025.11.26.13.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 13:09:23 -0800 (PST)
Message-ID: <71d02a9f-993a-4d61-a95a-cc3a9cbdb435@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 02:39:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: add PERFCTR_CNTL to ifpc_reglist
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3MSBTYWx0ZWRfX47Bp/NDTR8IH
 qml4x4Pg2RiNFW/7oncU4Gqxm0h3SZvAu+2K+ZASreZfUWW548yTp7WJgeUxvTy4t5EeNpT+Kxe
 bLI0TNvB2CZGOOScpCto+3MFlgGX7UIN2wVfnFoQ2kEM9aIIz4l9kYjxua/ww6CSjHNcr97TKhw
 yJDp9QsMd00Otb2RZu/7mRc03zpKP3oC6a7HQO9WgcjO5S21x5Fn+KYHBT1afKK5kbPYJBYGGtK
 QxhGnPDTRKT6EE631awQCB7jsIn55CS/Dd/HWFQMVh5rokwkeb8dxQGhqQd/GQNsCCzyz89DLSR
 KjDP6g+22dXvfcrah0lXP9qftQEPafRwbYT9O2b5OwCA3XAhmkFw+oWhoVpxuMc6NQufblyWMNF
 NmmPOiLzZ+bdbgsbIu/fkEcihZL23A==
X-Proofpoint-GUID: 9WkSeLCGiaSUsdoZ5Buufr411ekHcAuJ
X-Proofpoint-ORIG-GUID: 9WkSeLCGiaSUsdoZ5Buufr411ekHcAuJ
X-Authority-Analysis: v=2.4 cv=EP4LElZC c=1 sm=1 tr=0 ts=69276c85 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=RklEKUTwpnVNyatRsSmyOQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GqK8k8GEXUDarboaZ6YA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260171
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

On 11/27/2025 12:36 AM, Anna Maniscalco wrote:
> Previously this register would become 0 after IFPC took place which
> broke all usages of counters.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..b731491dc522 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1392,6 +1392,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> +	REG_A6XX_RBBM_PERFCTR_CNTL,
>  	REG_A6XX_TPL1_NC_MODE_CNTL,
>  	REG_A6XX_SP_NC_MODE_CNTL,
>  	REG_A6XX_CP_DBG_ECO_CNTL,
> 
> ---
> base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
> change-id: 20251126-ifpc_counters-e8d53fa3252e
> 
> Best regards,

