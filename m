Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BEDC8C0A2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 22:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140FE10E6DD;
	Wed, 26 Nov 2025 21:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxvIIT0D";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlHMUq0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930EE10E6DC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:34:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQG5flW1235385
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2NwkyEIbP7mfwEd4CBJ0OPJpWw2cL6nZtgf+1stJqQQ=; b=dxvIIT0D9F1y4XWL
 b0Z8hg0g43gIyEzI1E1v5AHUGy4oE5JKE4XmhDBNbDe+oSJmf2a9CE/rvVnAO+bw
 z46dAjQmBYYjINqPhYczsbyBXTEExVQEIiC1tDiqUtlZqmCFsNENeZC3rFCSNOR0
 vShmG3qo9oyQe8vgIo9GEhuE8S8aK1kfUHEGFPPQDr8LTjGtmLSSqr7obZv8efzY
 6imXw5v9eIl0eTOkzTZYL4ms2M+qUJgnlZPUFcroeKY8yth+j7o/AQJVc7nvTcf/
 CtxcCHtCjrfeLHvu44xAYwbcuS3ErFIfVFi+I0/TuTFAkVeE3+lsvHc7jtkO8bCm
 pfnUdw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd42ah5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:34:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7a998ab7f87so175143b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764192888; x=1764797688;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2NwkyEIbP7mfwEd4CBJ0OPJpWw2cL6nZtgf+1stJqQQ=;
 b=UlHMUq0ilhBixS4NDvZKIQBLGk76U2RCUFkWGavLs1U1vFm6L8pCVKcIp/pGHdnuaY
 u1fHldOb7j7SPkHHyg62BZhLgI1kiq4K/Cw0fxnOD2uKhog8rFtQkpDQvzzhmn6LBqFH
 wEzdhxSoprZpRD/HamacrbCIjm2FBnquxZ0g+vdJ1pC2LOcrgpCSSAVE/jTC/AI4m8ZI
 ThZ+rexgaap57CG7kRdQeUannXa3EqrNyD8No6rrV8hiCQeKZbDqYIMLe1PTpdTGPBX7
 qBJ4Er61fr2sMYjkdlgxsyu8YCWB9f2li6xRMUeaa8xqLW5cYUT1hyZgOpZQrqNZLn0f
 x7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764192888; x=1764797688;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2NwkyEIbP7mfwEd4CBJ0OPJpWw2cL6nZtgf+1stJqQQ=;
 b=ek3heLOpfDTsnE7sgQbszVHiEt4fk6Et4p1wy4XimNWGVObboudjqV08k4L0r5ShF6
 5BncZf6Bhp9FpUtJS/mPFAosnN1kmoYA+Ep5A+/A3yVMntINfcQ+uykZct7EPZjrDCy9
 ThHELJ/Y4HGrkDUWf/BcNAd/8nGa5hiq1eiXjLUeXfznvGnLRsZSaYmrc5CLYxmqVH6T
 ILPmKH8sljcbSVbjF5Swssd9LT/LiqnQ5aD2qCn+VSXZpjZedEnfDYdnS4FNhuLNlNPO
 2uItZFu9e00X6Vve12Sn4MgpZJh0kyi1YqHNqmUIOR49M1kbeWDkbIE+DDxGl9JRS1F1
 8juw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmUa+JWRA/9Oy+uskxDj3+DVLYWPqvM+YRS/JJQdvLevQyKbH86lZ9XT4B+G/6PJ5whrOOreX6kwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa1ffKYPGQe1+dWH1geeDFGxpTHmuGb1iWx6/jAwwoXOpkrzSf
 Zdqzf0wV2Zv8Jptipinm/Gcq9BJvi6RdxVQjzFO873jnrRoGV7FrYL0D7IO72EAMUuQnWfSnOT3
 cmiEpc3Rah4QSZB3LSCQ/5V9b/etOjnL6t0NxDbM0x68TMDRrKXZ6qo/850nYd8pULDC9Kq4=
X-Gm-Gg: ASbGncsRXmLHCbY3k7NizzgXmgBIcGz7KeIBfxEe/GAplFVtOyIcAS9MX/7QEGinvE1
 jqLqw9JJRO5dXYFQv9U1tO0oMkzVYt65AO+sM5RrvTH6FYX9cKsNS9yip3AlnYTl20b88vRuQ7e
 Ox0dObjYJeKSxVxRbJ8vCBUnwdCsukmo44bm11JYaa+31Da5cfauBbbiVb1iZFHXlqp2TDg8Pdn
 8z53dSJBrZhe8oBP2eNc+pAu27x88iRkZ1tY2AmJijpEajqPJfWSJfjdRVFad4Fm7KcST1q6a+9
 M+d7N4yuH2OxHwzJVlMYNuvkiz4F7qFPTPh98AX9fE7A4JiHFFRunPaIfWd2B6PGZexLDxaamyM
 P+rZCSmHMDyX6y0Tu8A0tjSmv7q9XMD82
X-Received: by 2002:a05:6a00:845:b0:7ab:4fce:fa1c with SMTP id
 d2e1a72fcca58-7c58c2ab130mr21776561b3a.1.1764192888293; 
 Wed, 26 Nov 2025 13:34:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzCt9XSY3gyqFZT1HSKkLzlml71T9rXO2LDSzLEnensoelSRtYNU9rQu4G8n5l1LFmUCIzQw==
X-Received: by 2002:a05:6a00:845:b0:7ab:4fce:fa1c with SMTP id
 d2e1a72fcca58-7c58c2ab130mr21776540b3a.1.1764192887864; 
 Wed, 26 Nov 2025 13:34:47 -0800 (PST)
Received: from [172.20.10.3] ([106.216.204.28])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f0d55b71sm22707890b3a.55.2025.11.26.13.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 13:34:47 -0800 (PST)
Message-ID: <7b6dff80-6e20-43f8-838b-3c5b02338714@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 03:04:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: add PERFCTR_CNTL to ifpc_reglist
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7EUY_-2sjBuT4MDkeQIAqZpWUBZOfKV1
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=69277279 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=RklEKUTwpnVNyatRsSmyOQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GqK8k8GEXUDarboaZ6YA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 7EUY_-2sjBuT4MDkeQIAqZpWUBZOfKV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3NSBTYWx0ZWRfX4eGjdPNoln6x
 vg2x1dn+oljyg4OWmLJJ52iKQZ1DO535qO3KgncF1MvVuZGx/2B+qgj5LLqXswCg58l1XY8wAp7
 6UvhC+ywKO6Bwr81KGSV3tk0jf2efkbFAMk6ACLZD81Caahfzv2O0sAKsQ3pvwfrzAmVXvwdG+i
 hVAZD49uuxWVtsO58ExakCkX01KRgElcBkLy4LMF1KIMObh0CvZ6HiYcoferJzrUQ3HgvNuN7Dj
 fQzM6eIL/G1eQsxITbleqGw6yCuQZf7PVe4Z+iES8etJemN8pUxw2CyjIcV/VlKLn+QDPh3ZDxb
 56ysdYgzDKOfmAg5nDYZS0Bh5nJui9BfiCIdeilF46IN1xfCBDta9Gw8BKxL6EpOC86YZbrFXC2
 cYybCXETAY8j2Q2bYlqNYIuPwNi2ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260175
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

On 11/27/2025 3:01 AM, Anna Maniscalco wrote:
> Previously this register would become 0 after IFPC took place which
> broke all usages of counters.
> 
> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
> Changes in v2:
> - Added Fixes tag
> - Link to v1: https://lore.kernel.org/r/20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com
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

