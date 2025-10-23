Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A0EC03BBA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 00:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06B510E975;
	Thu, 23 Oct 2025 22:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SW34gp/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2149810E97C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:59:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NF0LJG022503
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 469MVkdM4tlBeR1KDgd7vEW2/LS3FomPXkmwr2wH4Xs=; b=SW34gp/f2bfuWLb5
 btmLFbgoz/D4jEB1LvPR1PGuzlEe8Xa50DJiHXqMN1PXWwoEp570EAjzL/pvqf32
 zRZSEtMzi/vMj+RA2lYepTaMGaHe0SuiBoUEELypApunGplBpHrMW5yvtlb4luH/
 nUDEu7S2kEOmtBrIAzVzn4dnekeE6Mfd5BuJL9lgI611KYB1pzNqJwjG0elo4FDV
 AQ3dp8YqG6PINCxfWcNICvSqtVquUxbaNBxTjZui6DRl5eiubzdj67H5T2nXH9GL
 T3j7zWi0F49Urmr/5KognNXsMePFCV1Rd31Wke3Kx/jhJw5pAQTWVzb0EWAseFZr
 06d2dQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8a4t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 22:59:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-277f0ea6ee6so12421715ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 15:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761260380; x=1761865180;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=469MVkdM4tlBeR1KDgd7vEW2/LS3FomPXkmwr2wH4Xs=;
 b=RuypuYHtP++f0AWQNU8q3n5wqrRKVzWfKCbFT6P/aDUFFj5ogA4IdNT2wXS9lGilsL
 iFe9rGhFx2lelkvEO2SfAMVLUdapcBB7RqHv2pBPfW5zUPatSRYejjfUPVJE2t+LdVLN
 zT2zUZOPoVT6nnd25mxsjki4ou/ZxXYlux3vgLAA6BoFBloQTr37z8s0+GAH0dZCFCQz
 ICz2uD+bZAEmOUv8OxuWoRqwknbbKF6hPpHjcrt4zxtNkrbuSd1GzGX85v1DEhwNkJGa
 Wn85rd3YvKN3nIcJei4Fj7TxpyqwMyke/ISnMeyjnkNmMzrmpp9lAYYoox/QA8zROks4
 q/8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWU70xRIZgdYRYHiiLq5K5MUntYRnNEePovofHjx79u1rY5OkSctckI77QH3L0F0V9gRdvxQ3KmVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlX205VozSlAwl8tqi7yJhcFIe7i7FXzw5k9KsiKXp813JU0Sc
 nokjAMHb6etzNiOBsh6eqRmC80KiyeU8Pqndh+9r3w2FqpTv5/N92Ff7WC/sY8fSuKsgtxLw3JX
 YAeeI4aHAgwIaqOyqLCf4xVx2VkCH4r/tXPZaW7rzUwnyG6fhQeNWq2tcVbGy1OQJcbsfkrE=
X-Gm-Gg: ASbGnctvC+NyyKr2JPg377fUPwP0s0o4iSwFKOV2JVekktNwqHCSjtl0d33H8j+ItgR
 h2nqqQdvcA8nkGncBsGL159o10Gj1NIoZB7ZwT3DHIdZTutQZFwpBCLmexmpV6KHC199eTQ9yCb
 ydGyTOlkE6mXaN7QigHFP8jS+0RJ9velN7+YuwaydmHxcrxHZ6lIjECT+jsCTSKe59EqBPIf6ys
 GpVZL797nLY7R+Fg3C3WsXxf4W3ChGJk692igcI0OKJB3kUoh4hIKaDNJN6hcaJvvpU6ylrdAPS
 a+kW6Z3ivLCACxm7XXwNmoLtnwj3FwlopqkJyv8s7n8DwV5NPCxQDfqgDALyborGTlCKCOhyd4O
 Lz+GhF6n1vS+lqFyRRjgdGdA=
X-Received: by 2002:a17:903:2345:b0:28d:1815:6382 with SMTP id
 d9443c01a7336-290cb65b674mr335551835ad.46.1761260379744; 
 Thu, 23 Oct 2025 15:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJbBbKKW0DFk7iDHJKQ3h/G/P4s0gD6I2OLQk44UpbQebnNfbRHLEqoXFR2CkmDt6YK8syMA==
X-Received: by 2002:a17:903:2345:b0:28d:1815:6382 with SMTP id
 d9443c01a7336-290cb65b674mr335551455ad.46.1761260379120; 
 Thu, 23 Oct 2025 15:59:39 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.232.102])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6cf4bb9259sm3169412a12.2.2025.10.23.15.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 15:59:38 -0700 (PDT)
Message-ID: <b7b1648f-91b5-4259-8d7d-6d4645f065c0@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 04:29:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <202510212140.4YWihsB7-lkp@intel.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <202510212140.4YWihsB7-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX67hy1cCN0tFa
 QfjLIuSCmLjyDYAbxZgxkgB/VBCIrn/Hb7XAcvKDSbe3jmmXqPuFKoQ03zLJKP7u3/uLb9beVs0
 QrXEH60oRKGd0QxsSWbsFZv1PefmHZQVxmz/a+hRjtY/VyxuI9BcpB5W1ZixxW8YPxBLs4TdA8x
 SL9j34Zylv5FzgavkFNDzRZ5cOOP81NtsUMUW0kXTULVvB0xij1AtJWSx0vlGSv7EPfgcS8ZXPs
 ZUor11U9SBXyPbybG0vKgM6ELyc0zzemuAZgjwjudkyalYRw1vVTxg/CbcHXvrqI7L38jTXCabW
 rkAJ4vtm6MfAN7zev1L58GmKAddqQ6T8PYxVSSc7A0fhFLQvgs013kqepEh0vT4WMk5JvU/yJzN
 cwz646NifN8pwlwpvU+yqK7gmFQQyg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fab35d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=OORdEvYNKPdDRPFHMUl15A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=IvkCWOmhgfTTPoLh6GMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=mmqRlSCDY2ywfjPLJ4af:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: grDvuedG1AdYGxKGeZl8j-reGopQqwFP
X-Proofpoint-ORIG-GUID: grDvuedG1AdYGxKGeZl8j-reGopQqwFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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

On 10/21/2025 7:45 PM, Dan Carpenter wrote:
> Hi Akhil,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-a6xx-Add-support-for-Adreno-612/20251018-011020
> base:   cb6649f6217c0331b885cf787f1d175963e2a1d2
> patch link:    https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-1-0baa44f80905%40oss.qualcomm.com
> patch subject: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
> config: powerpc-randconfig-r073-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212140.4YWihsB7-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202510212140.4YWihsB7-lkp@intel.com/
> 
> smatch warnings:
> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:641 a6xx_set_hwcg() error: uninitialized symbol 'cgc_hyst'.
> 
> vim +/cgc_hyst +641 drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> 
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  600  static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  601  {
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  602  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  603  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  604  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> b1c53a2a2d395d4 Jonathan Marek 2020-07-10  605  	const struct adreno_reglist *reg;
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  606  	unsigned int i;
> 40c297eb245b1c9 Konrad Dybcio  2024-08-28  607  	u32 cgc_delay, cgc_hyst;
> 51682bc4abf4b55 Konrad Dybcio  2024-08-28  608  	u32 val, clock_cntl_on;
> 4b565ca5a2cbbbb Jordan Crouse  2018-08-06  609  
> dff2f69f3e8a6ea Rob Clark      2024-06-18  610  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
> b1c53a2a2d395d4 Jonathan Marek 2020-07-10  611  		return;
> b1c53a2a2d395d4 Jonathan Marek 2020-07-10  612  
> 66ffb9150b00f3f Jonathan Marek 2020-07-10  613  	if (adreno_is_a630(adreno_gpu))
> 66ffb9150b00f3f Jonathan Marek 2020-07-10  614  		clock_cntl_on = 0x8aa8aa02;
> 5cb9695ccef2305 Jie Zhang      2025-10-17  615  	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
> e7fc9398e608a7b Konrad Dybcio  2023-06-16  616  		clock_cntl_on = 0xaaa8aa82;
> 18397519cb62248 Konrad Dybcio  2024-02-23  617  	else if (adreno_is_a702(adreno_gpu))
> 18397519cb62248 Konrad Dybcio  2024-02-23  618  		clock_cntl_on = 0xaaaaaa82;
> 66ffb9150b00f3f Jonathan Marek 2020-07-10  619  	else
> 66ffb9150b00f3f Jonathan Marek 2020-07-10  620  		clock_cntl_on = 0x8aa8aa82;
> 66ffb9150b00f3f Jonathan Marek 2020-07-10  621  
> 5cb9695ccef2305 Jie Zhang      2025-10-17  622  	if (adreno_is_a612(adreno_gpu))
> 5cb9695ccef2305 Jie Zhang      2025-10-17  623  		cgc_delay = 0x11;
> 5cb9695ccef2305 Jie Zhang      2025-10-17  624  	else if (adreno_is_a615_family(adreno_gpu))
> 5cb9695ccef2305 Jie Zhang      2025-10-17  625  		cgc_delay = 0x111;
> 5cb9695ccef2305 Jie Zhang      2025-10-17  626  	else
> 5cb9695ccef2305 Jie Zhang      2025-10-17  627  		cgc_delay = 0x10111;
> 5cb9695ccef2305 Jie Zhang      2025-10-17  628  
> 5cb9695ccef2305 Jie Zhang      2025-10-17  629  	if (adreno_is_a612(adreno_gpu))
> 5cb9695ccef2305 Jie Zhang      2025-10-17  630  		cgc_hyst = 0x55;
> 
> Only initialized here and not on other paths.
> 
> 5cb9695ccef2305 Jie Zhang      2025-10-17  631  	else if (adreno_is_a615_family(adreno_gpu))
> 5cb9695ccef2305 Jie Zhang      2025-10-17  632  		cgc_delay = 0x555;
> 5cb9695ccef2305 Jie Zhang      2025-10-17  633  	else
> 5cb9695ccef2305 Jie Zhang      2025-10-17  634  		cgc_delay = 0x5555;

Aah! Looks like there is a copy-paste bug that missed my eyes. Thanks.

-Akhil

> 40c297eb245b1c9 Konrad Dybcio  2024-08-28  635  
> af66706accdf5af Konrad Dybcio  2023-09-25  636  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
> 51682bc4abf4b55 Konrad Dybcio  2024-08-28  637  			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
> af66706accdf5af Konrad Dybcio  2023-09-25  638  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
> 40c297eb245b1c9 Konrad Dybcio  2024-08-28  639  			state ? cgc_delay : 0);
> af66706accdf5af Konrad Dybcio  2023-09-25  640  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
> 40c297eb245b1c9 Konrad Dybcio  2024-08-28 @641  			state ? cgc_hyst : 0);
>                                                                                 ^^^^^^^^
> Uninitialized
> 
> af66706accdf5af Konrad Dybcio  2023-09-25  642  
> dff2f69f3e8a6ea Rob Clark      2024-06-18  643  	if (!adreno_gpu->info->a6xx->hwcg) {
> d2bcca0ccccfa5e Neil Armstrong 2024-02-16  644  		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
> 

