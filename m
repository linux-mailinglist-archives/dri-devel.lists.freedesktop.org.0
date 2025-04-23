Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13423A99A44
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A72410E2A4;
	Wed, 23 Apr 2025 21:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1nudbFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36D510E6EF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB0Yvo024105
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7juAG/GkF3du8/wYABYn1XxvOib8H+R8fcCmEsp2kaM=; b=i1nudbFITywtFoJT
 pjqWvw17B4rb3NJb9k8YkMX35vF66nelsxDIPIaKlrhG364AkA94ieT1ShEGqBZZ
 Ze1KeEFN/2VoQBLtj+jS3SS3MXHAWR/C6VHGyLyqBaokfhkMhFns/OEMj1rAHZdh
 g2Szjm8S+ESi6IDRzeWcXRze3lLNnsVh28/J32jqD19xfVk/toqCdC5ZCzwRdXdj
 T/53rmywi8E53sHN1xb4auVNffhtSUr92ZyyB6ket3nF8uCvvyZFY3TL4R+B9Tb7
 xOG9WP+dbHYa+bc8QM2vy3Q2Qc4n5zn4cvNhNF60efjos8x8bBYDa5YH3FTaPhZr
 dG5Ekw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bcps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c572339444so45152985a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442686; x=1746047486;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7juAG/GkF3du8/wYABYn1XxvOib8H+R8fcCmEsp2kaM=;
 b=efk6Mkoc19z3GEYRbJZvreXE1hQiZtTvt/YWT6MnsPI2oXkPuFicsjGsUmCBUITYUJ
 f61ksGGyQ6ZtdCMw0a6pot61+oH8fJXAzqAkVzbqWKV7ZHb7jsucVZOG8k3KDnkmOXxj
 37puUinDUzI6gXaaYi+2Vpkr3dOM0sjMFli/oSwo4LGwiWfm0f9wCzvgRQ8gXWFC6Ks8
 t6rkCOX4xo2D93MKQqWGSSbvC0WtG2LkuLpH4SH8/UpVy/3nb6zF7E9sbO1gA1Wz25WE
 xfXFciTOJtPypmJAECohkPdIZfXJBP34FqNB/mJjupd10IRktvPS4FsxJdSJW9NsxpoA
 hVDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDtZMnMv4S+Headdxnp0/b+OLG7NylYUGYjWrfOAp3VmFAD1m5CY5xOKld73IuzphFk5o0Du1B0ag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjS+c8GS27OFBKBK9W2ZWz0v7O/jKzDeBITUVz2vFlNjsI/1Fk
 kvkEsJqIF/dJGqBe9IA/JdmNwjCaH12wUEFUcG5UGhL2rCQ2BjJd4u6uAwIJtla+lqktat4/qcT
 Nkr912eaq/IsXZcb021Ql8NZ72pDSXW5XlLbXZU86AzZkEQda8m6beJItjPH3DJpuP9Q=
X-Gm-Gg: ASbGncvNO6LPs12UNUFeehfnKQdEWgKVFnvJJGBe2M+n+i2t4Vy8Qju+h6mkp9tt0Z+
 4EpvDyDQk+qF89dGH6w2hah5/AJr/+zMk5ONDkUqAh45xWQYvhObc9yomth4/0zXpWArobFxe6u
 6X0qTvb1Np0YyNRqbU7SDUAuOeK9mE9Iy/SMy3h7WPlBudO0P/I8WlYRFRF//b8AnqFbNdRqnoB
 VxUiTX2wqgOGoT5huj8rEu+VvhQJ5rYYEFJhcHK4FGXggjRnrXWibdnyeTCxzcciJRfl2Ea/7cT
 avO8k2narmBDmgoy6Mtx/pCuJnZgu7LRc2C33L5lvGIDYF7WtROfIZxhjO1DrYZxA3O8CXl0elo
 yQhBtkiYDh2TYxsM4z3E5QYQH
X-Received: by 2002:a05:620a:3181:b0:7c5:18bb:f8b8 with SMTP id
 af79cd13be357-7c956ea98b4mr47853285a.1.1745442686000; 
 Wed, 23 Apr 2025 14:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBiCLzMjle0UO/afRLR2+FdbfmRTBHY4/qAev7T6DsOdXSopPHAINyFixXVJzXLX325cROSg==
X-Received: by 2002:a05:620a:3181:b0:7c5:18bb:f8b8 with SMTP id
 af79cd13be357-7c956ea98b4mr47850385a.1.1745442685607; 
 Wed, 23 Apr 2025 14:11:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:11:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:25 +0300
Subject: [PATCH v2 29/33] drm/msm/dpu: drop ununused MIXER features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-29-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oq1wDHFI9F1rM8Vg4jlGeQy7++4ktlgP1SkYjPIrj9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcurOQwmw4mipyLk4xtDigIfZZRv3wsszemX
 9hk31N/tM2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1ataCACp7q5C2z1OKTIZTteRTOMWwwrni7zhoxTCOn6yAO8b5EEyhXosAsxOTWTVc30mVVcdep/
 2vIpet/BP0REXC+2ZMtja6f+BagsNXHyjhCR7hkTZDti+d+ME2kprZUzJkEB0O8Wc1ZvVDPpXlT
 nOGKpWe25Zm0CSa1pLNT3R3tr3CEn6TA5r+1/KbeQMOyN+7BHEOcPl59Knnw6J79hU8H1/myYS2
 X8MaQQzNhWqbewDxhXC8MK1AoY1qUmbY7CsDOzD5aCgvEP9e9ahwcwrb9b0Q75Rq7WKvQ/HOxkZ
 uZIH5aQdmH3Am7P9XclOpul6PuwPWz3R4Bz9L/c3sqXgVyZE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EdwvhQnYBr4ih25dAl19jcSCKcv-sfCT
X-Proofpoint-GUID: EdwvhQnYBr4ih25dAl19jcSCKcv-sfCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXwx/o2B3++vGR
 9Le5JLY3dYLZ3SnqFllQyW4W7dzGe3lqbE6yclsxSW7w94GYmi/NUrl53zSSDV07CHYr8JXAwsd
 xzc4klbi4RdkLAkSAqM8Ao4FFD0RHNBCdIYc394B4Zfkc57xdhU243ZXVcZ3J4WapYapqLdONc9
 pg0RVcs0ZrnHT3sF9M0HKHv3KZFZ2xdSBlR5TyEs+kUJ6pUf+CQjlUhEJmlZoalJhi8gvXYPJPJ
 +hRmw2WVkfUM4QbcnU3i+jWYCwH8sJPmf+PJWY9fmq8jqbhldQ4mgezyJqh2ZFZ5b6Yt7EmoUor
 ocUGEWvldH7gZBgvZTUUG3Pd84lZ1eEbGX82qpvP4b67QsCVnszZYT8bdy+tcaKH/kcgISM5zYd
 Qk/QuGQwuPWcwRLz3UZX0vGzBmNGpDaYYMNFZkXVQnlnkOFWH8G7qIQssZeW2+gG2GhqsWXm
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6809577f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=87smWpNc5u_ETeg062IA:9
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=987 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5eeb693f0e282da2aa0e5a729aed1bc8573639dd..beffb92adf5d8a150e049811bf2caa212dace1a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

