Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A849CD52DC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7B110E5EA;
	Mon, 22 Dec 2025 08:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRpbEqJU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBaETJPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C58410E57C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:52:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM8Znhu3962357
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uob+hAF8OiofpUbnbjg7D+uwM1p4gb+qkC9KuaAID1o=; b=TRpbEqJUhbVzV0tu
 s466P7IMqRZNeJJlAodUf//R/Gfj2EMsu1JnEcp7cYOnTjsDEQ8sg8f6pVLNipim
 gGcptlvILCb/xmWsPGm97apHwSKGr6g/xQtWAgE9HguYftCssDO3zxh4ztjuscVR
 nmBxt3outQiO0qaK+ht58YwvmwYYoRz6TKVFKhD0KQSlc3uec9IaCn5kFd3qfJ6k
 CI6HayG7gxXsd17tqoCUC0XH7cy8ib+gsFxhzR917LqrjpZBbfnTj6MMu186QMJr
 85NLRghXY6EUIJzEVXO5xznXtBl05KfUAly92bfBO52YhvQD2Daay9ViTWth87hq
 WWlERg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6h3k9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:52:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4edaa289e0dso12215461cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766393522; x=1766998322;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uob+hAF8OiofpUbnbjg7D+uwM1p4gb+qkC9KuaAID1o=;
 b=NBaETJPwhG/JDXexPHeZ+dHt5ROI8xqQ7WWXq5iwyU7mVCZDwRZqoh7VERI6s0/A73
 rkmIOpM5FJUapgDmsFibJmXDZg0nTr8ocaT41Kc+Wwmsdf32hHkkbO0GFJ4BVJCJr47m
 58VLdvNCWtw6Gt+IJW2ALnA4Uzfz8gJvWoXAbbbyHMY2d1L6u9GhRSC72y4x9+zxv4SK
 vWXCBeJH0Q41NbG9sFkbu7Ix4IClLFDTIR5cFpxkTBs1lFH0lH8LM9nU802Q40yddxYZ
 QLATyDol0l6W9ICb6xLpQ/HtAx6p+KWCq+Xux8UHXQjMAW04VbkVeuk3Lp+MK9HlCVUW
 iVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766393522; x=1766998322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uob+hAF8OiofpUbnbjg7D+uwM1p4gb+qkC9KuaAID1o=;
 b=NFq9JzLlPtP3QnzJ+EkfFib1kLXEPU1IgrbD+bmKEmPqteiB5iLI/CS7Uq42lBOSRn
 /QDPuHAc8WLslvILqoAWNvMje05Ol9CeGmUXhV21818iUBMrpPiGr2llaD3Cu6TZI6Px
 Wz2jUVOIHKLPv7LafCxwo1XbQVoin+SsDGqXopzEexhAJmvbANGF+BW+y1isE1yv6WOQ
 +kMw95fr0/4u3CGPijoP8e7uSSFV/oF07ZBEJdznjnAg9483iG8t1TfdCPQ48TpubfEj
 zvZKhTij8FH1a7bRPGhI4/5hFxBytf5qLjyY9cWw4dDxve+Y7fWWD50rsTPK6rzgjuYu
 8QOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu5+uUWkk+sOy42D/NF72GVMslkoKjAcXNtPJgClI/S4QsVxjxvxu865gu2RADALievt4/B0uRC6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK0jbGSUFNubPIeBNmU5ebxzddunAGz6p3uGx3o2fTJR7z6l2Z
 YCj2DdyxmJU1Guv3UfLRwj1XEAM7JiOzhjtWUOv5cSNp7ZmP4/FM616Coq9k1f/1/9pw/oV2cpz
 afkUKKYUicVwYf+RAZDUp39PmdT9TXC5zHyS6zLaRaxFj19aCZpPcs47hfeI272/eHLCVnipGwQ
 hm+G4=
X-Gm-Gg: AY/fxX4k9PGcEw5yVt0O8raUIJgoKQQj4HVc3LsJHtvLaERVR9QvJEnZWDLMrHq3j04
 lvLRI/g0KDhNTRXjMPYV8qwagRk9yhQssSp0ucWZ8tFwvRHgf2WPnPMDxVAGXkycfjcE7uLGehY
 OYoJF94HSN7IJkRhLATJuNClH3UlnNMPLdCmbaGgov1eMMEMlPbD/sfHfrorUBKLtKAw+ucfhqS
 OCLR4uTZE7/f1KTyC4/odBPI8ocWVKlR+/42AztPjPQkah7eAmPbbcTpMWsgtPx/B9kIlN4gvYj
 h5b55kQlh/ryRs9IP1egxFTrZZOJSqvVqIJnv/wDMR4bBLqIoWkYF4qqMWPTQNPEyLrXB490hyj
 5qo3cpd9csozhuGMsCCg23aNUCyfiUg4E49Z+AroJc+XEUidnt5qxlt0vZgELUUeQxQ==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id
 d75a77b69052e-4f4abbdff03mr115520321cf.0.1766393522537; 
 Mon, 22 Dec 2025 00:52:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWwe4NdFNAaev00TKW28UVBa3Fu6va8hqB4ZolVSybJM2HPRrqFtrcc6EfguXpS+jYS4uOtw==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id
 d75a77b69052e-4f4abbdff03mr115520251cf.0.1766393522151; 
 Mon, 22 Dec 2025 00:52:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8044f4acdbsm853980266b.22.2025.12.22.00.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 00:52:01 -0800 (PST)
Message-ID: <e4748c15-935e-4dd0-a49f-a68921074922@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 09:51:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Johan Hovold <johan@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251221164552.19990-1-johan@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251221164552.19990-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zVix64-6biNb_UT3GhITOVbrvm62PqBB
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=694906b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dk0i7xQ4PQfej7aG6gsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OSBTYWx0ZWRfX00FYw2JAjUT2
 5sQydsrZfzLWCLmi3J9veQCK9Hy8vAQgwrRM/Rg5do4cl49Sn4MVCcB98BgIpH0ePfH1rahvvCL
 51OXNCtjXuE9DWxV2Lc/gEMAo8wYhKiuWe3x7hExRXPMQVLSyHWRLMgYJe1mJEqsnTLKI06wvlP
 RhKa50Y1Xf74GUHXYktkQjJOmNiUHUh93jVaMyic1Q6CrpM6qgPkytP7VulpN7hf2pOc8ISV9/I
 RAQSIXQxRWt0QFE1Y2Qx7fxq3hRvGgQ2UJV4dSlKlaT0m00Z3TfmXDVmRlKtxajDC8yHlMoRmA5
 iFBlr+S2r3TSyjV6PblqyCnvtBqBw4DVlS1TZFXQlun56LtHXpyN6QhrfB0Fue0Fi0mM3YS4iIw
 ZE30RbNBX8Zi4mW/V9rgbL5zJDmdF/nNAfTKa/r/TMb7dhPr0aOU70+mJcgc5thtoeIgNLH3OXD
 miP/nJyFghGZpY/kYUg==
X-Proofpoint-GUID: zVix64-6biNb_UT3GhITOVbrvm62PqBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220079
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

On 12/21/25 5:45 PM, Johan Hovold wrote:
> The hw clock gating register sequence consists of register value pairs
> that are written to the GPU during initialisation.
> 
> The a690 hwcg sequence has two GMU registers in it that used to amount
> to random writes in the GPU mapping, but since commit 188db3d7fe66
> ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> the updated offsets now lie outside the mapping. This in turn breaks
> boot of machines like the Lenovo ThinkPad X13s.
> 
> Note that the updates of these GMU registers is already taken care of
> properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> properties on a6xx too"), but for some reason these two entries were
> left in the table.

I am squinting *very* hard and I can not recall why I only removed one
of these entries.

> 
> Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> Cc: stable@vger.kernel.org	# 6.5
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..4c2f739ee9b7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -501,8 +501,6 @@ static const struct adreno_reglist a690_hwcg[] = {
>  	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
>  	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
>  	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> -	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> -	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
