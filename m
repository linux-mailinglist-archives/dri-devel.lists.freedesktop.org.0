Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8BB0B5D5
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 14:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E65410E368;
	Sun, 20 Jul 2025 12:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="htWDOlAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C0710E36D
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K7vA2P002640
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ye7FLQxF+oX8P2ZafnjzmxaweqY3lUTRvMOeBW2C9Lk=; b=htWDOlAYefHQTczi
 QPo0hslP2C5MFEVtTH2FAQS4MBnRJUgMBcrsKyVuHCc5drZJgeJIOWb12KxCvSTY
 vQYdtI8IRjHNRtHfVGmDEdhdctYDznzEdKiJz3dH342baCGI1U85VlhEU3qk1SBh
 Vu9gyhve+Q5W0qWSldmbjfCuPtMHXX5O5sEqT315GuRATe/N9tExL2/CVjY4bXgQ
 vBaZbhJ2r9l4CErOP3BMfP7KKPQ4E/DOLl+Gjee+nBZtaTHoOow8+6MUkkfTr6Wm
 4jlmOVzLCesgmTQuqRJqOp6p9aJMXWxWLJ7FhmGhdohkQPyUweKneC2KjHDNoxj6
 BztGVQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459j5sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2c36d3f884so2326098a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013822; x=1753618622;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ye7FLQxF+oX8P2ZafnjzmxaweqY3lUTRvMOeBW2C9Lk=;
 b=aQB0R0rckNPGs9Q/Dff7EpnTRfzVSTc4JeGC0aoqVEIaRU7BP5AH/RAxe5MmlpQMb7
 yVXvxqIwNaAkl21XRvCCW6aOlW88/cTG39hCQPqlqyITgDVWUY+mPOx0W2slYDkg9XJH
 Na0xrf4u15f4JtbEPe0vGjSpcSJvTFhOOys/Sl0fbE3oKl09S8lfzMDRLVT4/wn9lDTz
 3c/JinGgCfpm5yLzTLaiQKazmSVRHEc+g/GgU+C9G3QY9sYdqJnjxLAW7n+MszUxyRc8
 SXpJq6rnCIJwsVGZISnCpbWbtcNgwLiE58Oy5x1iv4emVze3l6+wYJuNRup8yRHap9lC
 zvGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyKaFubwtMm8qeIy+9W8Pzy0K+AYML9o7b1vhsb/yeNz5IgikZ9OMLcjimA+8NJhB6eVjvuOt/OKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywej7+7FNr3EQ1OtThAGCNT4+91zSOFaQLHIljliLnXAqNuxJJr
 fyBFCMiy5neQ64gXpnw90XQK2dI4SLgCaqkQgXdvjLE5UqwnkE4Hrif6xW1hQ5eqCber+R4vDjv
 DJ0cPvDifcUGRw1f4VZWex+1GiCl/nyaCKwNnYyLeaq2h7KiuyNmiNK1uIUmpMiGtGouSVFU=
X-Gm-Gg: ASbGnctPZTvJvFhvBz46/gC8Lx2FjaJw0gyComdGpNpganBT00aiBnBbWWWx/esg4Hy
 uoaDNAuu9OYpWOFL6tBQpJqiLNLVeDvlH2JVWGsV1Yp5D1RoY0pqxyA+P3RzyWHyXpt61I/15qi
 ZLzIsFXxNL1REKEDDB28L6OkNw5vqlTVBMUEaPWwk7PIE+9/EhlvIy9iZJ+yCkIf3bEnuwBQ7ek
 d5DAnSZ/siXebSiZ97+p60fnEn7i6libEBxZn6GMly2UcjnjjJNV9qt74nTO8A+tBvSzgNaCp5S
 Vb0VJ/wZ7L6tFJgTgLnIOQ51E3yPpFhupD/IQJH5le3pEsnjCw97g4KFX/ZIH4aj
X-Received: by 2002:a05:6a21:a616:b0:238:351a:643e with SMTP id
 adf61e73a8af0-238351aa167mr17819749637.46.1753013822099; 
 Sun, 20 Jul 2025 05:17:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiWwQwtfLMcB/87qX/+tJZdR+Mt+Z77vPLlFgpUunMGDPIC5fMzAPTtacb5vIt/CbB4/MmWQ==
X-Received: by 2002:a05:6a21:a616:b0:238:351a:643e with SMTP id
 adf61e73a8af0-238351aa167mr17819729637.46.1753013821656; 
 Sun, 20 Jul 2025 05:17:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:04 +0530
Subject: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1436;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FEX4gllwWRzFTPzD5y94Fxz57/D5CyfbPDxIKY/FMHo=;
 b=WNF6fhXZNpLcKewFVHkyZ/9w1NDmAhfqENUshg+HaTobcQUFQ+1wvwT3T5lx8e8LomX+8eQpp
 WvoeoCpfdVOCqz29mDOa+2xKgqFH8UfRS+v8e8JIYk6DifdK0rXQLd5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 4r_S7foMhl83TdZEvGDIJ8X9yr7vE963
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687cde3f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JNXRRqm57C3p3bqa__oA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 4r_S7foMhl83TdZEvGDIJ8X9yr7vE963
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX1nhyhAe9I47/
 whjdLFFxyIZbk+GzWndIRNzCk5w637XL/hXNcuqcnTWX59KF17jiiRRXrApd78/hJUUvTYpjnQH
 0R9L1+OvU/5qH+Uzq8ZUyojfJ/uvRZM5AIx0RmSPWVVSkRz1+KmA+6ddGyPAn38e9Vx9L/JLio8
 RLvaP5kOCPn21banqgbpwuEWOlW1xgmw0y5aeRFWRyuAgdgRI/B7ncPl5tjdwJzSisudKPWMs1R
 gga8mkNWWc/DybA4im4NFi2tJiQv49qpTNMeT7McMIoDRvyGpfal1eFaS0f9jnixmCpb7Y1kir8
 IULyHbZ1qj1SOFlJnbDjwi5xvtwNQRVq3st77hfwoIhZMO7JrJBk1ZAnAL0bQrW9yNilbdz7LNy
 aL1nKhw7R9nkpac06+9QPCXaGC6Qek9qxK4D2FDSr+46t0/xx7sVvyGoi1UVft+X7RSpm+ig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=950 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200117
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

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 41129692d127b70e9293b82bea5ccb6b911b0bfb..790ef2f94a0b0cd40433d7edb6a89e4f04408bf5 100644
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

