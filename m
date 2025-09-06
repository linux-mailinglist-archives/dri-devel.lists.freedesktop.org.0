Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA9B47682
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 20:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DB210E03C;
	Sat,  6 Sep 2025 18:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHrzSljn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8095B10E03C
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 18:56:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 586DBGNv027873
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Sep 2025 18:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZBadVXj3Q8VcKxqT6ZVVuFSs
 Ahvpg9kD+kwZrFZMdNI=; b=bHrzSljnjF72+ruJYJwyQHL3pG4UX3ioW9g4EbaJ
 /2VZZ3jQZPZ5PbAlOrObCT0b7stJhli43PRwUSobQAjnyib2Wrb1QH3i46AeS6DY
 yKCjLFt6Sf8qVtCvuMcaZCsq6VoDAVPL99hKtIlK3KbseuJi1iLGNVNZoSp2/V6e
 qTbdI03SxLVLNe0uPb2tDWjY+n7fS63isjIKfHWRmcEjWJNP3c9BT/H/rhK6uI0h
 8WxL++bQoHFZRY42yhNS29LeDzlR9hieu0hcu7uhSF4Kx/lB9Osb1DBuBLi8kHbF
 +fEshDCYnG6DO+TxKkN6j77LbpMjhCgdq9iTgwOhsfHqTQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d6391xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 18:55:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f91cdf14so34555041cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 11:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757184958; x=1757789758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBadVXj3Q8VcKxqT6ZVVuFSsAhvpg9kD+kwZrFZMdNI=;
 b=HKKJzukYO5giJadC5zU3W+9ZE9KBNaUuzpzZGwockREyxb5ptsApjHiPJjAQIizKRl
 SYBE8Nac2P4Kp9y2E6/3OJsGTOaM4jiGFoEDaMa1i3FWmZErI8kKqf5wUxvAudr2uEKt
 lH/cgCQm795q0gNHzp5gGLnjy1VkYNGXkkee8zNI7UNlB4qaqQGa+TKQqk0Pb4NMXuoa
 t1lIs/f/8Rq6yL79G3HrzlFTs5f+eucBbcQnMruKOT9sG1BrcpbIZiY5zJGywAeK0VIi
 wTzpUYoRO13PVysGwMXWCj4tuZ3uj9e9meCZdDeTVg5NA88wc7PrEqXVd3t2NSWubxDC
 QuiQ==
X-Gm-Message-State: AOJu0YzS60C4NNIBMG1EdCdvBEJcrLfQOO2B2a8ix9KW9o5wGF+mmrjG
 yGurWbE1oavQyCu+1Bv0Mi4QRKeIF0EdWKJPPuauFu4zLEwo30rDbNC72nAbBuJuCF3D4Gw/B3n
 h2F2Zkf+s75X5fi13vi/4rhEEh7Y358fc4CORLOBhiH57eZew4B0HcYvEXzaA+toChGc6zpE=
X-Gm-Gg: ASbGnctAy69BOkc8dwneNMSvMpVCBcNxkH5ibB+GPB6UDq1FVwl2q0hde9UT3tPwt0h
 alwFOa40Tnyzcyh+BbKix7kceel1ClcvJtMzFVfDvsK0HfPf5r4sSrA3B4b+r4J1WX9Qtan6fx8
 v7iecSEiu+BnUuXe716B2EWSFTi3dvuiilXkO9of2aAc0Q77w0BX31j9vhIymUKoH61azqEqmLt
 RXrVQ5OL+fOUL+FqUBUBG24tD7pVToNgSiVv4QJKHfJrh/BPhDxN8MsRvSGJJ8DWEHXhF/KV6L0
 UbUcKh+qQ1o1F/rM4uZrkIPCE/4WAUPjw0SgoHqBuAyXJGQz1rV1cqQJluqG056R7aYEmHubZ6J
 A1iNcJ9Yrikh77nlxm+7Ir/dnCyi7wwGhvmII1+sDm3clfeesbFW6
X-Received: by 2002:ac8:5d91:0:b0:4b5:ea1f:77f4 with SMTP id
 d75a77b69052e-4b5f8467913mr33200381cf.64.1757184958526; 
 Sat, 06 Sep 2025 11:55:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0q6LYwp7XVK/CoJjAl4rMPEW6+vPupVUdTnPMLr7cWeFfZ0htils1UjwNfk68K1j5RCHU/g==
X-Received: by 2002:ac8:5d91:0:b0:4b5:ea1f:77f4 with SMTP id
 d75a77b69052e-4b5f8467913mr33200141cf.64.1757184958027; 
 Sat, 06 Sep 2025 11:55:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfbfa8sm2534700e87.96.2025.09.06.11.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 11:55:57 -0700 (PDT)
Date: Sat, 6 Sep 2025 21:55:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Karmjit Mahil <karmjit.mahil@igalia.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Sync GPU registers from mesa
Message-ID: <wbuvnhcxh4flicbgipuql2otwv7oqkol2pmdyvschpudshejy4@euajhp2sgnyq>
References: <20250906170542.481588-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906170542.481588-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyOSBTYWx0ZWRfXxLMYvlTZVU3W
 uVWxYUX0muqxbQVc8bbUwywkJAgbPZ6F54u3zA1pXULnHhlltEMLfGmc8Ch/n8tqpOsSlzt5aml
 RPwO7NDUfJZdYsrvSJLcU6IsuAwwOy/xnslEZLNAkpjWsy/ItwxMXTpUYyeWwNpGaqKD4CDbTEK
 pkaNI135jqwaMZWbY4Jriw5DG74LtYExXy0OhXDLPnvwLB0uWkWQLEKR52txObP6cpNPcYtXAV8
 z1WvP1Y+WlYmTT6h16rXVW8sk1Shb51XM73iQV7WIk1G/m4wB2wPm7okk0jJi3Afw5PgK1Wch1Z
 3qx8D1T+5Zf7VojSKdYvSFxSKP0Hko4qA6wqELC4nIiu8kXBiFZU5FFDcFeRA6c55j0bsNp9Uz3
 3bSlv1wm
X-Proofpoint-GUID: cbBjvtzcszhvLgrcid6xkHbp9XRWIUps
X-Proofpoint-ORIG-GUID: cbBjvtzcszhvLgrcid6xkHbp9XRWIUps
X-Authority-Analysis: v=2.4 cv=DYgXqutW c=1 sm=1 tr=0 ts=68bc83c0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8 a=PNsBLs71VRkgtwFNylsA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060029
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

On Sat, Sep 06, 2025 at 10:05:40AM -0700, Rob Clark wrote:
> In particular, to pull in a SP_READ_SEL_LOCATION bitfield size fix to
> fix a7xx GPU snapshot.
> 
> Sync from mesa commit 76fece61c6ff ("freedreno/registers: Add A7XX_CX_DBGC")
> 
> Cc: Karmjit Mahil <karmjit.mahil@igalia.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  10 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  19 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   5 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 718 ++++++++++--------
>  .../msm/registers/adreno/a6xx_descriptors.xml |  40 -
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |  50 +-
>  .../drm/msm/registers/adreno/adreno_pm4.xml   | 179 ++---
>  7 files changed, 524 insertions(+), 497 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2e2090f52e26..3f5c4bcf32cc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -247,8 +247,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  	 * Needed for preemption
>  	 */
>  	OUT_PKT7(ring, CP_MEM_WRITE, 5);
> -	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
> -	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
> +	OUT_RING(ring, lower_32_bits(memptr));
> +	OUT_RING(ring, upper_32_bits(memptr));

Could you please comment, why are we droping all these accessors?

>  	OUT_RING(ring, lower_32_bits(ttbr));
>  	OUT_RING(ring, upper_32_bits(ttbr));
>  	OUT_RING(ring, ctx->seqno);
> @@ -278,9 +278,8 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  		 */
>  		OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
>  		OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
> -		OUT_RING(ring, CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> -				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS));
> -		OUT_RING(ring, CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0));
> +		OUT_RING(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
> +		OUT_RING(ring, 0);
>  		OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
>  		OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
>  		OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
> @@ -1320,14 +1319,14 @@ static int hw_init(struct msm_gpu *gpu)
>  
>  	/* Set weights for bicubic filtering */
>  	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0), 0);
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
>  			0x3fe05ff4);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
>  			0x3fa0ebee);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
>  			0x3f5193ed);
> -		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> +		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
>  			0x3f0243f0);
>  	}
>  

-- 
With best wishes
Dmitry
