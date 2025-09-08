Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B84B486F0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC8E10E425;
	Mon,  8 Sep 2025 08:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HESkbmRe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCD210E425
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:32 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NeLiZ027051
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p2//K0CcjRV6S1OvPg1jKb3Q1LCMP0xj6racf95PPvM=; b=HESkbmReO6y3QZok
 gl1Li8pjoQ6HCs0leP3239zXALUAfSMNm4UfvyBH6aAnhazpVq1peYy8SiuYtTJV
 cW3SdgZqsbqxP1+HKIM3/QZyjvos/HszrB7rwCYkKYs6RjUmnJT5mz0IBOt9lAz8
 Zj1CZKcS+4wBjnPRwM3VTlZcJPUpcPuQHfRu+WBeRPEnzYWXkON7DQP8+BlM6XxD
 tO4s4WJF/7qSR33QoiTy+jx7tfwl+yIvv3QemUuI1f7/hgAKrd8CLgP4/LWnmSia
 wNQpdCPXVWLpAN3msKQomxDuq+OqoSaEYuTjDdpEPWW99qQKo+ig+qVwaKbGOeKs
 QcQZfw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapc1xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32b51a481feso4182843a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320051; x=1757924851;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p2//K0CcjRV6S1OvPg1jKb3Q1LCMP0xj6racf95PPvM=;
 b=SmyJjiLBgBvpJGF6LIo1XQs0kVg7xjUlxGvaOth7lEwwh+mJb95gepMXjX5nIA6oEJ
 /Dmf8RjKzt0bq2W881Yfr1O2WfxnqhHa/pZANem20KzycFLTA8Cb3qQJ1EdFFg+g4P8M
 wECsl3ALbz9QhN0kQlsSw9eioCNuhek8MGL4MtkIF98gJbKQeIA5e/nwzYmpdvVpYLC1
 jGf1MDdNNxPdTNdA8snCIjxtGDcQuQSgQZsvLpggzJRens8JETM9LNI06ox9qIxg7whf
 aSjT3TRGpD8mWnTFCM/LOUtJJ+ZmiRta0ggi22OYHF97uXHKLltO1YxM53KwM08jJIJS
 52rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtDHTV+Q7qpianWm44lvdOz526L/djtsCPBfq1PLuXlk4BtRs/+/h2kVymnhsp66OHlHhcQoIb5zI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5pSisfl+0aFZMid/ESBYmrIVJcEnjUzz4ZL00AwF9xhOLZJzF
 oeY33fAV6b+d4Jz9Q01j98b19s7FTfU0qIgkG+O6p2TKQqXqx4rO8iaTXUIqOWjpoyvYuCAd4x2
 478qnCfy1ejP9rt8csERnFF6tlDUTm+fFCl11W/4Q54rDHk4JWo4QSDNTbNPYz11Xex5zIKI=
X-Gm-Gg: ASbGncsW9j3lXohRWCk6gg7aJQ2I2BPMdljh9e1Mfcio54yi/O2OkU76LPhpBnbSt/4
 xbFvQDHdd8CzzSKmaumpbjfOF4Rlc+7TjkU0ZsXazJvgLYD2RqBJ1wIjkPcUZilL7r07dOF8Gp4
 yDPZAhQmiacqbmqNDbws4WApB1dQ6EqRKhIE46gpJIEu6jP0ScezpNvaYI0HhCXl2+hjQh1WB3d
 PZRCqDreGeSaltXtX2adWeFRDALpOS2S8U1gmReZGBEAO8QLQf2vLYdQ0btneAwpjofiMdNsYh/
 bmSON3mRFgn0LeI7apefW6AM7UjO5KYZn4rM/Iyvgx61bSQSadnV+cebXAeDrdVi
X-Received: by 2002:a17:90a:ec85:b0:327:4bd2:7bbe with SMTP id
 98e67ed59e1d1-32d45037837mr9250963a91.4.1757320050721; 
 Mon, 08 Sep 2025 01:27:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQqf8fIoETWqNunksZyViPasQDDwI23kKzq759z35d9ls/mhv5q1lAbeOT1ENDFbBHUWPswQ==
X-Received: by 2002:a17:90a:ec85:b0:327:4bd2:7bbe with SMTP id
 98e67ed59e1d1-32d45037837mr9250933a91.4.1757320050266; 
 Mon, 08 Sep 2025 01:27:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:55 +0530
Subject: [PATCH v2 02/16] drm/msm: a6xx: Fix gx_is_on check for a7x family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-2-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=1562;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=S5MyjT4mTPIr5LgIuanSA6/wDQeDhSOhfpOFVd2mIS0=;
 b=QHTLwKJPH/Cp1iIj/Fl88V5fVglSuhT3lfuw29UFrtJ4pIvQmTy0iSPN/uphabTvjR+bkY1rG
 L8d4gkxS68TDHiUvGkbMPXGZMUpyxRUFcrlDZ16WT2kVL+5wb8C8Sq+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68be9374 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lIJRztabaMjLl_BANJQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: rKOFinvBGQM-CjN8U-01m8rZEEjO0GIN
X-Proofpoint-ORIG-GUID: rKOFinvBGQM-CjN8U-01m8rZEEjO0GIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX2cdLSIXh6NG1
 wPlSwkAEGxj29zASwNI88gjsiUAd2OU6rKLwYNQNs0SYyclCzBAgHSSK1o470vHDqDVxH1zy/6m
 92e/WRul2f7tN+Cmehv2cNI6N2Y3tb3UQudVJE4Thl4HNMWJbY/J9D4WzOJy58E/RPpP6Q40SXT
 Z0/hBPuQeSUXMFaYpwFoD3LqpQMFeZDzfoseFcJw676thuL0wzk/2zfYPaxtoejbMOyoIM9mYnR
 u/6W/k5X/o1UXEehNM1IKSvznlb3Ra+p/iGxZ3/Xhe7LWKMGvwX3IFbCircQvsZg9Rx/CRMIW2M
 L+t+ta/CYOm2dCjOHO3+0R38L+RDTvg9XWMOHiXp9djmfih3L57fFEa6g5+z2wpISd+ERVlc0cm
 9M7I0AO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
different in A7XX family. Check the correct bits to see if GX is
collapsed on A7XX series.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 28e6705c6da682c7b41c748e375dda59a6551898..bb30b11175737e04d4bfd6bfa5470d6365c520fa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -93,6 +93,8 @@ bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu)
 /* Check to see if the GX rail is still powered */
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	u32 val;
 
 	/* This can be called from gpu state code so make sure GMU is valid */
@@ -101,6 +103,11 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 
 	val = gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
 
+	if (adreno_is_a7xx(adreno_gpu))
+		return !(val &
+			(A7XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF |
+			A7XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
+
 	return !(val &
 		(A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF |
 		A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));

-- 
2.50.1

