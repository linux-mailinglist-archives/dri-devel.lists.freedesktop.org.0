Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50839C8EBCA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 15:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FAC10E798;
	Thu, 27 Nov 2025 14:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+ED2TXu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sf5lMAIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA62810E76A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 14:25:32 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AR9G80V606797
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 14:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lXfQGw9aQcdQsXAqShAhqg7C4NopwvslBYymEWJH4zY=; b=O+ED2TXuJmVoFhaU
 km8EVBUOCpZ3HTYumGT5retiXw2EepI2LX/yrhNaaVRUxY69I9/mOjjmUJNXx1I5
 DmxxdYG6q9vWFmPJDM1tNUecRRbYBVY69r5kdRvtMfUzovwJp9WUHLR4V+XVHsdO
 hMxiwJErYI1jtUjj5UGAwUgau62nLd9l8nINhPmpOTLRXeXHOKrhrGNWNoTZJgOr
 ZZQUFzJLnLANgZL1XAfrloxZfRe/TkX078X766fGui+6m8P0+IzmxXJbareqdHP6
 m9wPqr1LgNAstcsOKZS5oFwCNH6nMyWawvheH3KT+3FVg+L/gVZYFyyrELZDRbfI
 /HpfkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5gse6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 14:25:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b222111167so18663285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 06:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764253531; x=1764858331;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lXfQGw9aQcdQsXAqShAhqg7C4NopwvslBYymEWJH4zY=;
 b=Sf5lMAIam3rLDntyGziDpC+ycLbHiAUxkNx4RawKLAVHb4+IjwoA/tkism4ep9NrYF
 roBhhVUKS2zRmUNJnDk+3bitUHxVkT9HXCOh/cr6E7op6cBp51LgfWIG7QDtYYVHtQnw
 0sSHBWNEsTx0UKCU+lnAZW/EOujnSZ2goYK+9XXjDnIcZX3gQSkwL0wdWdaF5HtABg9j
 X1r1KZIpPLOQlWG04Qfe0ApBJYjcDbohgSmWrQW3VrdWfAoltEa23UohBR/YJldKvZfX
 5IzgIIyGx16UUgXU4dV5Wko787iHDjCbcLTByNDjezEVipTxvdRPsAdQD/1gcKw1jwJX
 cNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764253531; x=1764858331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lXfQGw9aQcdQsXAqShAhqg7C4NopwvslBYymEWJH4zY=;
 b=lWKRIIs8/tOBz/ccL4rBT5XAmKv62OLRSw3313+xD9gkp7QMu6ZsVpdofZi4OdGazD
 wlhMIJEHx8fmaAxI7mf8LDGvuckhG5IKWwNw1EFqlBk34cdQaPl1ztN3340KC+CnG9/Y
 dphkxykVt7EN3UOxA9lF6fSpcUBjDi3u1rZ2ZQh5fKVz+QKmCzRC7CM+PZqCtTieXbPw
 kfId4H1+kRCxNGbALdqLb6eT9AzTT0S0vOzuLpV0ay91zsO+HQXECIFwnnUdYYnMIiD2
 tbQlJOu6C5/88b6SCrKWRICme0STUGGb1wqMzKhu8Q6DqkbqKMim1Nn26ADBs6eDuTiF
 d7hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwrB/pfB5wpdhisMFxwaH1jp6KxxaCakVB5vBZmkZPOLCB3fu8TJIHAT6tm7ErcVvnoREV3kubgH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9+nTA60iv1AuOYk50iLvP49q3amp3M6Vk3FLMSEoCfiHGysq6
 6WpdR8rMZnIenT3zLmZx7ccYwSpofiR4bUF2EDgRTXKYC+VxE1Yxghcp7X9WN2G93hNv5s/6cep
 JrddTMdoqSjGZBb7hyslIwBoQUiH/j2w5u3C/8S9QsybwjLWOyoXuU15/U/UPFV92U8p0kW4=
X-Gm-Gg: ASbGncug5jTAYo0tNSKXsdcX+jaY3pbzKGJlBXwfmDhyt11LXP9Lvvh1Q/ETUnppTLf
 VJnjjjq/KQvG4nMBgzyIG5OcPFCmrIkViooyeK0W7b6FGDlDNR+RvhzLmjxhmoa+wYiNPseNbQf
 j4kFwtqFMU2aQzBNb0e+cCdoW40I+gY3UIu86s+TnxZM9Oq+/ZIK+y6Gf3k3963aJVl6l4jOpxC
 iAco9GrhlnEcvhkM2wRfqgRI1mDlMz2S29xpcz5tDA1MLy2wVDVNHb5gEvsjpRbOcstd7r1YGcI
 ZxlLRB0RVJi3x2G/3j8VsB+7jsZRlFudQGhbJT75gowQhX//c1liUM+x+Ukm/ERdpydtrc2VGI+
 +jjg60sexwyBkUn1CuVNSYdJGwh4hvixJ8XQ0CuWZy0YnqFCAlxnSyp0cFCpzf1spEL0=
X-Received: by 2002:ac8:7f47:0:b0:4ee:1367:8836 with SMTP id
 d75a77b69052e-4ee5b6fad57mr245601301cf.5.1764253530899; 
 Thu, 27 Nov 2025 06:25:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1PEAD2AIQg2biuCDwbY2+IKiEBg3avLNdeTwyi+/WMXHOuqe/1V83hpMDDO6bHfXgntzNkw==
X-Received: by 2002:ac8:7f47:0:b0:4ee:1367:8836 with SMTP id
 d75a77b69052e-4ee5b6fad57mr245600931cf.5.1764253530457; 
 Thu, 27 Nov 2025 06:25:30 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f59a6a67sm172720266b.34.2025.11.27.06.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 06:25:29 -0800 (PST)
Message-ID: <58570d98-f8f1-4e8c-8ae2-5f70a1ced67a@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 15:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix a7xx per pipe register programming
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8I5WwmM3DfXDIQpoIpsO0s3TiwSYxPlP
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=69285f5b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=51bRkEKeLUuq6sK2_JkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwNyBTYWx0ZWRfX30NM2tvK0clw
 4VxNayNoEh0whtlAXn/BsgNCaM2ana60uOnakaWutbjVVErr+kJ2oqbFSxCiP1jNZRDo3yR75Lo
 Q5F0o47nmuiIdhQCN8Ls1TLSJhFi5RQ8CopunGwS1SJqGCaR0cYhIgM/zpEPrZzGob8laXW7MZq
 3gjQZEDWEypA451sl1ZC3Zibc6dKlosa4JA5lQKiAWUfco9iANblMN18aYr2N2NEK28YDJ5kM9X
 namdUghFEvu8V4tReKajdqgb3BS6cRd8P1iZLfxQhbSIDLoePQCbAR76VYrcHZcE0uuORUhn2Dv
 TWNcO1P3yF1V13ssKGl3m0b9ZnJZGFDu+G6U5HBqih3cP2O2McXgM0l9faPmUcct187UH5o9YM0
 QHJON3O9wwDwuaYdFZ1uF5ilVMLT9w==
X-Proofpoint-GUID: 8I5WwmM3DfXDIQpoIpsO0s3TiwSYxPlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270107
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

On 11/27/25 12:46 AM, Anna Maniscalco wrote:
> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
> but it needs to be programmed for both.
> 
> Program both pipes in hw_init and introducea separate reglist for it in
> order to add this register to the dynamic reglist which supports
> restoring registers per pipe.
> 
> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 91 +++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++
>  4 files changed, 109 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..c8d0b1d59b68 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>  	REG_A6XX_UCHE_MODE_CNTL,
>  	REG_A6XX_RB_NC_MODE_CNTL,
>  	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
> -	REG_A7XX_GRAS_NC_MODE_CNTL,
>  	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
>  	REG_A6XX_UCHE_GBIF_GX_CONFIG,
>  	REG_A6XX_UCHE_CLIENT_PF,
> @@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>  
> +static const struct adreno_reglist_pipe a750_reglist_pipe_regs[] = {
> +	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },

At a glance at kgsl, all gen7 GPUs that support concurrent binning (i.e.
not gen7_3_0/a710? and gen7_14_0/whatever that translates to) need this

Konrad
