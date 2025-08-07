Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F6B1D95D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 15:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9455410E852;
	Thu,  7 Aug 2025 13:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="At4XKK7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06C410E852
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 13:51:07 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DEMw018565
 for <dri-devel@lists.freedesktop.org>; Thu, 7 Aug 2025 13:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YJaOnJPrQPzYB5QLyB82PbBYQ3YcFtLHpT0PXF3urfk=; b=At4XKK7p5ORvOQQc
 dzZBJJx1j7ulVqMKhjIUWMmK8HwTpD1MdfEME1TAvbfys5RL9pJXXseh9Bq4rm+F
 qXOkcwt4s78uQoGgVyCdtv6vsHLIDgI8s4WWdRC1vlHSpqtxNrIRZHCgarYmLQg3
 lDUUshPXfXg9m+2eQP6VWtoGJWGsHC74b1anYhoS4h7Sv9WiIJvMSjEgUd3YjH49
 ZRqAIL7IQYlMtJclt+OkcV6Meq4q3tntXFoe+ttkPiPe9FLrBpIo5B6O7A2k6VC2
 eOGqtG+SdYT0VCnqJbXdhhi59qIZ+7MYCD8TQgg3PcJSRf3c4Orfk4n3CedGfUrL
 q7TSOw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586c2a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 13:51:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70941c8a17aso1908966d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 06:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754574666; x=1755179466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YJaOnJPrQPzYB5QLyB82PbBYQ3YcFtLHpT0PXF3urfk=;
 b=hfucPzHNPBcy3fT85ZzhbBPjCY8anSm5JR3Wf5eOuMlI62U4n0PPfH5i0m+IkC0Jsn
 I5MKnZTppOc5nztdX+5sWFMxhHgI3EaJGpuJQpYvhOaGk2tnpOPCA4gaH78icHy8Jv5U
 1CwWOAazrMjbBjAkgbE8yIG1PYHPgK8GeuxHpkyVb6PdcHpcgkXe/XxPBVMKEXX3rxoj
 myBYcYAW80uQ7S+Q7ZS2XMgj64VyPQLpNhPHvzBStU0TgjYEfMuHsc9UItRDf7xvgc8q
 s9tolGrbrtS5kvVFAdzPzvAmMkD0BjzNdde24aORbag/HmxOoHTJ0MADFWU1a/dXHp/O
 5mqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZAQU7nqy4tb+b7pZqBH4zcytACATUCCpAO6hjO3M58+5NScoVN96+mLKG1sT5nZYqmanJt+U+xmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmPz0HcoV9rJj2dMmd5aj6TkYOSHO7NylFCQTu+//20N1WL4zH
 x8E0APV9r9WJPR6PdKi4c9stmM4DLDpnskEbSwQlWuCiHLOsm8vwefD3oe717P/DGBySzgMprPD
 QUYLlRr4ag1Fq+1o7MKFC1+59p21kDOJ2OdRb3a3hF9CWCNG5XYuOqWvyk4uuYpAocqO5C1s=
X-Gm-Gg: ASbGncsSRFDXKzA6PMsocJ5Ag2F9mAREPOPSJZcVP/ilc+zoRNr/NEicIBmn7qboK8C
 VGcAm+E2IVa6XiTjfZxON1R6YPNUw0mX/9FXgkCfVopF2IXFIGBT2XGN8XAfNET06Tk7PY/R8tR
 CB4n/Q0+hEaq0FRmdM9FnE0YjijnLyrRng6QItTqXpO0hnbd7oITkpKUp0rt3aYsACmKq2Uw1QO
 aE1IZNmxzBmLXoquqbQ00R+PunexIWW6/ueh/3+aMhx/r7hferq6AInzTRsl6D6T6RDCK/Ej16s
 UV7Xy1cqgt/v5lXSG9uXFPIgy/fE4iFX0SoOYAwJDq40KuCV+vE0MvDYTh7H0AdPqS5w5r0sJN/
 g5wQes3qXmMJ/tmLZ7w==
X-Received: by 2002:ad4:596a:0:b0:707:1654:ced4 with SMTP id
 6a1803df08f44-7097943f2d4mr53232876d6.0.1754574665974; 
 Thu, 07 Aug 2025 06:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG05izQ2F1cJL0JtNMoakn9YJ17uRV6nsijU+bcL9wSJdmVXy+nD+ZxHapPlNUdAOzNVzIiHQ==
X-Received: by 2002:ad4:596a:0:b0:707:1654:ced4 with SMTP id
 6a1803df08f44-7097943f2d4mr53232626d6.0.1754574665396; 
 Thu, 07 Aug 2025 06:51:05 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f15a66sm12009012a12.16.2025.08.07.06.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 06:51:04 -0700 (PDT)
Message-ID: <937197e9-09dd-4f3c-bdb4-4001f5217c07@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 15:51:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KHaxecdK2hXC79vDe2UPMihyL3s49GiW
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=6894af4a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=f2c1g6THgo9BaYdya5UA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: KHaxecdK2hXC79vDe2UPMihyL3s49GiW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX6UxY6plr7GSC
 FBXenDxYXtnFe5nGWMEc8QlQdDpPCTX2D6pwI8q066EHmEVk0anXOg5IxkIjp7usqVXJ7lvd3vY
 smbAxyFUtFMXCmKd46hTNhh9N+aeB1hi1VlaF3qWL58CHBLJKTTbj1irV/6ef540O2D6NjTGpx+
 UFkF7tVnoTlITFhEFImUEFl0/fGSePJgJRpbhlhVzalCEfQfhnAkeSG+OoKmoRREludcVVGH9+w
 KsaVhRiPg81byc4kmTwhXH3ILMfFcdXSnUk22q9Mba3kFfSV0IMVWgp4CO+6MzqfpO98eTKtZhF
 jWX4TK3F7qxo7+jcMng1TCD7Hvk6DY7nRNBo2teDa5SaJHsfyBVzC53EJwizRQUaS2i1JQHkhm2
 4kLAoVZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Since the PDC resides out of the GPU subsystem and cannot be reset in
> case it enters bad state, utmost care must be taken to trigger the PDC
> wake/sleep routines in the correct order.
> 
> The PDC wake sequence can be exercised only after a PDC sleep sequence.
> Additionally, GMU firmware should initialize a few registers before the
> KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
> GMU firmware has not initialized. Track these dependencies using a new
> status variable and trigger PDC sleep/wake sequences appropriately.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

FWIW some time ago I made this patch, which tackles a similar issue,
perhaps it's a good idea to merge both:

From 7d6441fc6ec5ee7fe723e1ad86d11fdd17bee922 Mon Sep 17 00:00:00 2001
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 10:28:51 +0100
Subject: [PATCH] drm/msm/adreno: Delay the Adreno RPMh startup to HFI init

There's no use in trying to power up the GX logic before we're almost
ready to fire up the GPU. In fact, with A8xx the PDC and RSC uCode are
loaded by the GMU firmware, so we *must* wait for the GMU to fully
initialize before trying to do so.

Move it to right before HFI init.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++----------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  2 +-
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 28e6705c6da6..3335583ada45 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -513,7 +513,7 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	return ret;
 }
 
-static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
+int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -842,19 +842,11 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	else
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
 
-	if (state == GMU_WARM_BOOT) {
-		ret = a6xx_rpmh_start(gmu);
-		if (ret)
-			return ret;
-	} else {
+	if (state == GMU_COLD_BOOT) {
 		if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
 			"GMU firmware is not loaded\n"))
 			return -ENOENT;
 
-		ret = a6xx_rpmh_start(gmu);
-		if (ret)
-			return ret;
-
 		ret = a6xx_gmu_fw_load(gmu);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index d1ce11131ba6..309305298a45 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -216,5 +216,6 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
 void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
 int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
+int a6xx_rpmh_start(struct a6xx_gmu *gmu);
 
 #endif
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 8e69b1e84657..9ea01daf2995 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -910,7 +910,7 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
 	if (ret)
 		return ret;
 
-	return 0;
+	return a6xx_rpmh_start(gmu);
 }
 
 void a6xx_hfi_stop(struct a6xx_gmu *gmu)
-- 
2.50.1



Konrad
