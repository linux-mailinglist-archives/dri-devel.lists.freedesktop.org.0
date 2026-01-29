Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA1rLxHne2laJQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 00:02:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717FBB590D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 00:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25A710E8CF;
	Thu, 29 Jan 2026 23:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6mbEAxm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIJaZmGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCE210E1EA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 23:02:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60TH4C68028735
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 23:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4xilsLx0mjQbln6HYtM7EOjqDHQpTIQtLvmJs2JkP+U=; b=k6mbEAxm7frTtzMN
 4tVAMWhTa4OFmoXqfomAAzSyebIeq5NgqaQrtLHcgCOQM07i/JucX9GKnsdFBWjb
 EnnLFYVmf3tvXR4BNoNmxkPfpJaa5M6GB5XqDreNjxZ3/1lCMCy89e6i+wbnTDxD
 qWkc/s2VT3uZB0lahj0EHfXn4VNANXCWIMdGHtgLRVzSgeeggTOyPCSX6C7N2vD9
 ikyPTHbKeYRcLxLjRJ/6PLcPYox7tMYNr1RNzCDBeSBllDfT/WeyT9/7GtbAUAUs
 /P0acaM7bHq2u+I5ewxzbftX5TVsIOohxXyHT2wW95RiLpaipq/5Fe79klhyXspy
 VQ4S9Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bm590we-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 23:02:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b630b4d8d52so940522a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 15:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769727756; x=1770332556;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4xilsLx0mjQbln6HYtM7EOjqDHQpTIQtLvmJs2JkP+U=;
 b=dIJaZmGjT/mHtBt6GcxiDDGOqneKM+ys1FHv3zhETUXF+SUMaMyf7MUfYFMJXC5bmn
 KsgSKAC+WDwjN/hPhWUO4r+Ti9HbIfLbWZsbiexCpE9wfVWCkjEsuNlZvpwDsZ9vJz+W
 KZGy6iFYp7I1KjvtrZz2cPmCrZKdrCMCXSkUG1yU82jAvHEYQRw7V1Lfavq5MJNNQP/R
 3QgLdZkkutdxY21fPIcG1T67sPT51SnvGKRJPUItHY7cZuPtihWf8WtPaqoTKFM7ww3B
 UXQH6l5MwkNTQDSb3ppD5cHHd4OtgR00neXZvgiqSR9mGk1qoc3zd6Hvi85KMLyHhtzu
 2SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769727756; x=1770332556;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4xilsLx0mjQbln6HYtM7EOjqDHQpTIQtLvmJs2JkP+U=;
 b=nZ542DRnwjZolWnRz8EZuI1TMfGr1+II2SJDn9jK1SMkfiqThU0/zW1u85m4bdiEG2
 XfjF3qjJxK5XoYD1/dw3+H9kNP+jaoj4sqG3JlEI8TN+eQ2aNeSCLcyAEj0/NScVr4qp
 oPjpUqqlvG78c48Q3rw6eNLhWaf6hH5vhlUZ4T4GU/9gYyzkgfH7320zVGhx1uWzP4HA
 oDGqJPvXl9CHjU76s54fe0dkAjyt9L2XM4AYBsDn2bM4pdUCb71uXqbW10LET1rT02UU
 jYlkBmY/u1JDL1SZ9iqFXYwD4a0qODb/MIXoXpat1zvdVHIwxeCZLCMuFY+BaTcZOq1z
 5Ppw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAmIu15CYL4wR+d5nQxic/zsqhbvOUdJifxL7VyFzWyT6tEaY+gfAnXZaPrfhN/tCCcraGfj/skxA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4Mw3OXPCRmAhZ47IQFiXSaGcuLyzSN+5iRNVAST5XtUsGZfpo
 pPb6DR1FhsmReI9tqd0Ttbw1x527ptEyH7tfUUw1PlOjmDSfYucv/7xIH+ulQCtZf5K19LHawk9
 miRqDkjwV6WOcYujkWFISsdva4HVTUw5uVDuaQV2MGLzCPIuyzVCnev3e+QNwvGABVZboW34=
X-Gm-Gg: AZuq6aLH0gVMdoBSlcorJqT91NVkalofGbEDqoilrofNIlhtg7+iLwaYa50NK3kpc2Z
 pp4plsNYCowT9ul6xfwcwHDkQQ1wME9bU6c3z52qhgampFpS7NrdBzyn7r2rYoArREMKXtyPJVa
 tGg2tKm5vhnmqrGhpHFNs2GCxVHnXXIqz8kYt0xqnETz8N1YVw4yVO6lkcDUQBZqlhxFEdmk/V5
 JaHhRILyr3Tr6no371cV5oYGGM8TtP8Ol0Bctr1YTJ2kZtamxuI/layrAt4PUPg9VYQ0Hi0cq9H
 hNIY3YLBH0DhlpihfhIhRKL/fRrGEmCfyJbcZZO2XDllvRuY2kPzCrGv5LkCXqXdGOdXewbK/R4
 O0+1INROBouhKqUD0VyoZv+4i4GbWHrE0qQ==
X-Received: by 2002:a17:90b:180f:b0:340:25f0:a9b with SMTP id
 98e67ed59e1d1-3543b3d2607mr833126a91.33.1769727756305; 
 Thu, 29 Jan 2026 15:02:36 -0800 (PST)
X-Received: by 2002:a17:90b:180f:b0:340:25f0:a9b with SMTP id
 98e67ed59e1d1-3543b3d2607mr833091a91.33.1769727755696; 
 Thu, 29 Jan 2026 15:02:35 -0800 (PST)
Received: from [192.168.1.3] ([106.222.231.147])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f3cc7absm6439131a91.12.2026.01.29.15.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 15:02:35 -0800 (PST)
Message-ID: <0dda1100-49d3-4ca7-9ae8-1541e2b855b9@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 04:32:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
To: Felix Gu <ustc.gu@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w6PJgagwaSmN51ZE3iSvZYD22JevrlcG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE3MCBTYWx0ZWRfX4OITiJj+zB2z
 aVsli1VA5TS1NijZl6H0ZNaA9B8sZRd/Vjl4T9sEilWEDLyl1C1A4Um6e08AuzJp2oH3DhzOitd
 6sqMPVP5IeIzKYOtddx6CT1SOGMI6MGDLuP1mEja2smpfaVak8N+SxdSCVMANMPuPf6jz/QeVRi
 DjssYzB4YVxK5FeKqrLTexGO5jZN+VzEv+a61J0pw7d/kauaxdYcQ7SwPSbzQiN0L5bp/UlZeUj
 8+qu7ZJtlmHInzmLBQlpuuRJ9/LTJQtAswrCYRYw3lfP5+eEhmPr4Kx9hOX2Q2LZKW7nsqs2LyR
 mCWipxfUO37MKLYoSuXs+QctZLs8Jk6Wd5KAgC3hBohYa1/gr6xAkEhXxmWNQQTcaSDUwq3OMlr
 dV6go1oG/gJ/+y9Ur+kaxGWpk9RC4N5vwmJ4lvCPM8dzGBoUK+q5rYoSPBGw6I1b76Xpt2frWBC
 grWHOZBsRfbzN32Kg3A==
X-Proofpoint-GUID: w6PJgagwaSmN51ZE3iSvZYD22JevrlcG
X-Authority-Analysis: v=2.4 cv=bZNmkePB c=1 sm=1 tr=0 ts=697be70d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZveB2507E6DkPBHLdDca7g==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=mHnloJP8uCFruMiY-FkA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290170
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 717FBB590D
X-Rspamd-Action: no action

On 1/24/2026 1:04 AM, Felix Gu wrote:
> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> While there was a manual of_node_put() at the end of the
> common path, several early error returns would bypass this call,
> resulting in a reference leak.
> Fix this by using the __free(device_node) cleanup handler to
> release the reference when the variable goes out of scope.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
> Changes in v2:
> - Explicitly add header file.
> - Link to v1: https://lore.kernel.org/r/20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2129d230a92b..604b0f861d27 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -9,6 +9,7 @@
>  #include "a6xx_gmu.xml.h"
>  
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/devfreq.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/pm_domain.h>
> @@ -2640,7 +2641,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
> -	struct device_node *node;
>  	struct a6xx_gpu *a6xx_gpu;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -2660,7 +2660,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->registers = NULL;
>  
>  	/* Check if there is a GMU phandle and set it up */
> -	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> +	struct device_node *node __free(device_node) =
> +		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>  	/* FIXME: How do we gracefully handle this? */
>  	BUG_ON(!node);
>  
> @@ -2702,7 +2703,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
>  	else
>  		ret = a6xx_gmu_init(a6xx_gpu, node);
> -	of_node_put(node);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
>  		return ERR_PTR(ret);
> 
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20260123-a6xx_gpu-cbc095dbe423
> 
> Best regards,

