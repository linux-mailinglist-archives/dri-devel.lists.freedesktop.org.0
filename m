Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03856B0DAE8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9A810E30C;
	Tue, 22 Jul 2025 13:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPDuicZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC64C10E69A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:33:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9F4eL012705
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EfsXBdGr0ZefoEuNYobsoglk
 aaa77ZqFclUas4r8I6Q=; b=hPDuicZByTNlXa7CIkXCxdo4NPztXLE7eqKIPhCE
 SyJ6vyzlekTf7Lf8KAcsevpsdAZDvdmrkLH8sNkco2BVsvqtTc5GbIIDFGec8YVO
 myTm9y5rA+/akEelLQ9kEc0e34pxDnp55A/Q6LaRYapcFilfVnweow5PM2gxf9Yx
 xR8udUzWEznaAIp+TGZX2cFmXLsdVziXjdNmuNVao0OPhtYT3ahVKS+bWswz8dKt
 zjZBY/UxO8CGWoph8bM6hXnNSPHBsKX8I9FpBqZLnyxW0B31frq/TXPtMAb+dlBG
 c2+Px8ZrGm3yzHiG8P0fa8Zs/pgeZotuZmKu/ILqZP+Cuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6kufh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:33:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e095227f5dso867231485a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753191225; x=1753796025;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EfsXBdGr0ZefoEuNYobsoglkaaa77ZqFclUas4r8I6Q=;
 b=kYw2Ol+eKooIbzo6Dk7zef8ubBn72dW7J8xdomC9Oa3C1CeBCYXQ9MgEPIYWcxBp/p
 efhej3h3eIDbk85TsX66nzEkMYVIiQXaCHXaOkXLlLSyhpPBmXFS4SLezBJa/ByXxKnI
 ZrbYdHxiRSspL7wXfkIR+UemfJ7kSjsACbKn5eIk5p00QBlBdE9YHDHr3i7DMCUK/Xwn
 e93vfdscq8zu1ULi3RGCVvVTPeGzMO4Xf7D9jnNs9wDGBu0FFwV/61cSwui5rUq+K4Kj
 jXRv7RNMu1cARn8n5R3/Fj62CBHFDFnelGXsvfm1Ee/CjCfD9lkOdYdnbMQ3Wxm/+6S6
 P28w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh1xJG4VhK/1GcY9eyd95yW5zAm1L3dO8K0J3Lg0KhV/DY18rZTTvonKMgZMJSiLW4bEhFeLR9udA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyggA0LvggQwM9kJ/G9HNtYISyrNyOxY+8+3qnc4GL7PW0nrsf/
 ca3UL88QjkhejzIW7hrl/eU76s9t02VnUejgWpIM3GIZZV6zBHWCXi3qQbq6+yEY8Nwq9+oTKHE
 kvgYxaHyZvmtWPDRxKKkY4Og4xp++W+BaYhwLHPTtdmCFD3/j95SsHkxzOzOtdErHY7E7MAk=
X-Gm-Gg: ASbGncsm8yTeGz3PBvtOXNpv8JfeZXyig7NEJb0NefrdORDNf4y5r5+GOEs0J3daEro
 FiMLXUBahUZSPIHytxLnH4Hq/z7UMx2mWJKD8z44MwFvtuN4Rx7iHRHOHtjqbBtMXrasfM02py5
 oN2nBsHByE4m0d4JVK4V/3R+a/rKb+ZTWvjJy/Xt96cIY6wgLQYt1ioFEizO8U3y06WK1HLdY+i
 hLLBBgANnfjelWGnG+W9XpUPdXg3AyWoaPzDioIdb66WxG8kThPHj1HgvhwCWApjLRx44eiTuFw
 gbwKxzomMOhbgs6DAQppTRpbaTMFno/JESxhUeW0c15xPojLONG/ih/2nVawszrp6E38TjDgwLn
 xC1MNLNwklgGOFCkSiUn6VKCdyvFb/NJGyTl7JZ7dDCOu/TbeR5ok
X-Received: by 2002:a05:620a:1a8b:b0:7e1:4b5f:3f98 with SMTP id
 af79cd13be357-7e342b994e7mr3254129085a.57.1753191224751; 
 Tue, 22 Jul 2025 06:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP3AAsy3mbtljhMSzHmvF/WFjUN8vlpUNZFy1EG7TdKoCphtGRWA/vS7N52z+3EqqbWOMt3w==
X-Received: by 2002:a05:620a:1a8b:b0:7e1:4b5f:3f98 with SMTP id
 af79cd13be357-7e342b994e7mr3254124785a.57.1753191224115; 
 Tue, 22 Jul 2025 06:33:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c735sm1951720e87.129.2025.07.22.06.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:33:43 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:33:41 +0300
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
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
Message-ID: <avni4utnzdmmafc2mf7aqgva3osbhuiqtia7gdngqswk5cmtn6@zo65ir7gyj6y>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f9339 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mwp7AVN4ek2gjh_I9OMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0pUlRvePVtEQVPha1JP8bUXEBSX2hJxC
X-Proofpoint-GUID: 0pUlRvePVtEQVPha1JP8bUXEBSX2hJxC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMSBTYWx0ZWRfXzeD8owuPaF+B
 6E24E/pxChFEKAJE+2djtMsavmdeTiZnRMySdnazu+C9/+eQ7TWgiS0JST/WuYOrv7yh3Hz12ZO
 1FgHjX7WHqE2W/Bt3cmR1Zk0Pdl1iYzcnDBaf1tY/HO0+pSltUy6aqhDdBzB7cYejh5KX72kQc6
 ygrTvZxR6UE/Ai7t/bFCFa7omjv7kHc3Q6HLeHYNZ4oRsmvjHo/VnK5ThRilLHhJr6Jz0a1Jtkq
 92ROghUyiSH/OdWko3vEJLX2xl72sKINa5+I1XiTynyCXPV8NxGg6l1oa1ymfRlYAFoaY1O09tV
 MTM4sRTDK1TA9QUpeJVRkNTiTmLjCbCUQ35pJaLk5822pvQPSj1EZfOjdh1AkqJk1rMqWOj6/dn
 zhjdELL4SG7yIA7sFVYE6NH4JDJwtWtcxjhwmK7fIdzep6ayy98uRF4IBnr30PvL6LialM5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220111
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

On Sun, Jul 20, 2025 at 05:46:06PM +0530, Akhil P Oommen wrote:
> Since the PDC resides out of the GPU subsystem and cannot be reset in
> case it enters bad state, utmost care must be taken to trigger the PDC
> wake/sleep routines in the correct order.
> 
> The PDC wake sequence can be exercised only after a PDC sleep sequence.
> Additionally, GMU firmware should initialize a few registers before the
> KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the

s/KMD/the driver/

> GMU firmware has not initialized. Track these dependencies using a new
> status variable and trigger PDC sleep/wake sequences appropriately.

Again, it looks like there should be a Fixes tag here.

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 30 +++++++++++++++++++-----------
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
>  2 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 3bebb6dd7059782ceca29f2efd2acee24d3fc930..4d6c70735e0892ed87d6a68d64f24bda844e5e16 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -279,6 +279,8 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
>  	if (ret)
>  		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
>  
> +	set_bit(GMU_STATUS_FW_START, &gmu->status);
> +
>  	return ret;
>  }
>  
> @@ -528,6 +530,9 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
>  	int ret;
>  	u32 val;
>  
> +	if (!test_and_clear_bit(GMU_STATUS_PDC_SLEEP, &gmu->status))
> +		return 0;
> +
>  	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
>  
>  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
> @@ -555,6 +560,11 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
>  	int ret;
>  	u32 val;
>  
> +	if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
> +		return;
> +
> +	/* TODO: should we skip if IFPC is not enabled */

Is this a question or a statement?

> +
>  	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
>  
>  	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
> @@ -563,6 +573,8 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
>  		DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
>  
>  	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
> +
> +	set_bit(GMU_STATUS_PDC_SLEEP, &gmu->status);
>  }
>  
>  static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
> @@ -691,8 +703,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	/* ensure no writes happen before the uCode is fully written */
>  	wmb();
>  
> -	a6xx_rpmh_stop(gmu);
> -
>  err:
>  	if (!IS_ERR_OR_NULL(pdcptr))
>  		iounmap(pdcptr);
> @@ -852,19 +862,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  	else
>  		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
>  
> -	if (state == GMU_WARM_BOOT) {
> -		ret = a6xx_rpmh_start(gmu);
> -		if (ret)
> -			return ret;
> -	} else {
> +	ret = a6xx_rpmh_start(gmu);
> +	if (ret)
> +		return ret;
> +
> +	if (state == GMU_COLD_BOOT) {
>  		if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
>  			"GMU firmware is not loaded\n"))
>  			return -ENOENT;
>  
> -		ret = a6xx_rpmh_start(gmu);
> -		if (ret)
> -			return ret;
> -
>  		ret = a6xx_gmu_fw_load(gmu);
>  		if (ret)
>  			return ret;
> @@ -1046,6 +1052,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
>  
>  	/* Reset GPU core blocks */
>  	a6xx_gpu_sw_reset(gpu, true);
> +
> +	a6xx_rpmh_stop(gmu);
>  }
>  
>  static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index b2d4489b40249b1916ab4a42c89e3f4bdc5c4af9..034f1b4e5a3fb9cd601bfbe6d06d64e5ace3b6e7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -117,6 +117,12 @@ struct a6xx_gmu {
>  
>  	struct qmp *qmp;
>  	struct a6xx_hfi_msg_bw_table *bw_table;
> +
> +/* To check if we can trigger sleep seq at PDC. Cleared in a6xx_rpmh_stop() */
> +#define GMU_STATUS_FW_START	0
> +/* To track if PDC sleep seq was done */
> +#define GMU_STATUS_PDC_SLEEP	1
> +	unsigned long status;
>  };
>  
>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
