Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1827A99A05
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C14910E2AA;
	Wed, 23 Apr 2025 21:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwSqMxrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AEF10E27E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAddlK018062
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Y6UKS4JYcuUAg5jzEbt/jNsmLaCkbGKSDsl+QGDcjdU=; b=ZwSqMxrpCeaqh9zu
 8Sq/gr9zW9NlUd7jaLhaZ5mGrFYkL1zBBTbKfNbGQYmMkt07NSk1+psX73B6QqJj
 xVCAT5ETsxIN61PJJ6RUB5lTFFXNrGlG07TvETl/s9fYNZerBkMHfeS6fxtrGGPi
 eEh0SQ8Y8pyu6DpmRpW71kdUnSkwbe+V6fjTCFxeR0EsYGVcwI1KF77lFrFHv37o
 iT7MAlVYKUtc5jIFhHWgkzOQK0sG/dHHzHEMNFFHQuhf6eJeEcdTkRc5d/i0vNJ9
 CM022l/p8WH0fJsALNr2ns352rJz+qB1pqzQVrbyO1BPgB1vBETM+8nbhHrDetaL
 lOW4+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh03dh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e91d8a7165so5614116d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442620; x=1746047420;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y6UKS4JYcuUAg5jzEbt/jNsmLaCkbGKSDsl+QGDcjdU=;
 b=HlrcZ9BVIdWonUgxrlNcFqAtjGRZ5m5d2R/1JwVCaSE9eafUKCt+rhi9YVXrOX7Y4g
 Q9idxfauhVaMiIOoCXKI0+5kkOB4jQD2E/8ykwyNqTsNSbgCvCEIRj1V1yft+WpscMlK
 4HU8HhBuPd8v68uf9BuYT/dUhGtJlzTTzLunVrqOPw3TmcpmlM+/LYYRElUEZNkNDk2/
 E8KYZCrLZ8YHhUR/QmGC96mFbbPmmPtYYex4eB8zbtPJXvkl8mMJ0FAorH9h91NiSjmi
 56gMm91z2IBR7f5LD0R1VjO3bgwUyThIKX+kYuQIrz9K2RxULBf/VXv/y4s3N+kcm6IS
 /LSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJLqWCOS57m2szQox4J17P5DeXfG46bhY0OxFQs+LS8iqpvl4qvgluamj5AKB7U1jAw93/l1y+5mc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxl8qia++He2bJIA4NXXGDldbOPpseFwrfLolc6C4gXpvSpPIV2
 +gyyC3PAVRcIpsw0eb/Ky9EZFbNOSZ4zGNCrCz2+BUHDih2wKoaIlF8FePN2w+Itkk0Tu+7XHNW
 QEETbEMtwChLgFriGcV9r6Nb6b7vMYkqB9Z+tSzFNhxS2ECVuA95BmVWgqECxG2Ta4DQ=
X-Gm-Gg: ASbGnct2u4dlK4QYffGcCM74AS5Yr7iYx5VnfYd8pu/Ruq38iz6eeQ5FlvIlBrDucmn
 XK9IcGpunBbJvsfjoDI/+F42yyIO0viQ0WYJj2xQ8FTQX0fDfvJMomBkdIIdwMIqkU7WZ+U4OQu
 iT+0gOSLbEbbyKxoAFS1nQyGF3uywdV+PFxqRdb4QdKLAYy/TBy/QWBJkElPf0LAFM+mrV4szf+
 PB/qZqkpZglArcf2O10+HePC2M9N0kY7VyuRt7lcW5Wl/WB3UXoZVrymlNqERdCxasTfWoxC+Tl
 wqzXcP0WMrobZV9iY1ejgKfUQeFaoT9HA7D2aWjovbLJEnXpWZYbkEy9Hoqqd1UspUB11jNjjig
 NcV6fKsf2V5fSEKIRXNz0FSaU
X-Received: by 2002:a05:6214:5099:b0:6e6:5bd5:f3a8 with SMTP id
 6a1803df08f44-6f4bfc7d20bmr3253176d6.29.1745442620337; 
 Wed, 23 Apr 2025 14:10:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLzUPfct4nWaD35EhN1BKf8WJ1RrzjFP9v77ONKcGBSU1K4tluJaOglVnxZysGEb6xpd0Hww==
X-Received: by 2002:a05:6214:5099:b0:6e6:5bd5:f3a8 with SMTP id
 6a1803df08f44-6f4bfc7d20bmr3252846d6.29.1745442619941; 
 Wed, 23 Apr 2025 14:10:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:01 +0300
Subject: [PATCH v2 05/33] drm/msm/dpu: inline _setup_dspp_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-5-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcqdYHwIQ3qP/JElrts5dzGjsyXrqAefsV/M
 KkmWKUjvkyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKgAKCRCLPIo+Aiko
 1ZcpB/4qSyr0iP11NwqcYPY610/qlcZAOgtRs99lx3yKCEOY5PzkYC72ZxkGfXGOXEA6nXfTzyl
 cb6OASx6Lq9TjBIV17S6OQvRCgsSv3gOk06jBLZu2YxODeb0MdSyHVAaT8LeZuat2AZpUlFI4md
 q3nrHZDpe103lINB6WVHPr6W0jVxQ11gTvE7GZh1BFaEzfcN0XDdNX3lVgDUWt9nukFUQdT9Ft0
 LXIVqf+W4zBQnef/8i4d+/RY7Oh2JNw076zuSFudcj09F/jyF6SWBQExFxIX764etPahGpBxmRC
 PtkOFyph43NfGYRF0cK17NqVB97JAp4e7T9WyDzyxMP4it9e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfX4tD5sNjW65t9
 TKXu5yOEP0slBUnx6H3GeH4PSOj35meD4cq+neulB2Va7EgQsKCth/jINVft+ilXPKWjMv1bXXC
 soSZMv9rlhEs5BEW6/jzswKNW8fb7tFXVgMXxHtDz2+wlCWwZy/fqEm2Z92CAkDUMSJXqduVkFR
 4270owKe6XorrYEfVnZJnON4M5eTjSJ4J3/BmnD0pudpZBvt3KxV9XLQTF7Q6rpGB+0TNDp+jUZ
 MJcHpQJbxU9C4BRV9Rt+NAi1n6SpxkDenzLqvccfgetizLYKPeAGbnFWFpd8VwUWe1FYYSR2Lqv
 EZ/YpQH4Ur8FcwO3lRpEIMTssjqLuq1PUMHA407C44jeiDkI+SXYdI86Eg9A495ZVN+yfAdzRuq
 so80ORWhnd/A4VOgoFjnHXvkLG0J7rDpJ8O/RrjCQecjEU+fKOz3oqZPTko8qkSevohyqBRZ
X-Proofpoint-GUID: _V0Fz-D8NhYlZdTASLGDT54XM0iE5TCA
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6809573d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9
 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _V0Fz-D8NhYlZdTASLGDT54XM0iE5TCA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143
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

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5

