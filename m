Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985ADAB5CDD
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 20:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F392110E073;
	Tue, 13 May 2025 18:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXbIUyHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B72210E073
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 18:51:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIRXiq016770
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 18:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=spJV8R8Bs+sSlbQ8ehRNXH
 ZILSzp5Uy8JZHgSPrWiv8=; b=GXbIUyHYlAsbf6jVpJqiOe6Phh4ElBlYzJLAwq
 ysariO3UGI6TChpuL6dGHd++bOyYxfaIDetkA7KlbAYwAkQFKzCsRi6QHiH3zfcS
 vZUfyfBtQBh4pPi8u4Lq93XVBxNmJKaZ9Ce+AKV4QaLhpjVTeTNBRNs5j05AKuAj
 XhPjsWGYFg89nZI/ajBQ41GwG2T2zjBnNJMYkVJGtsdNMR/rbYlAcMfN4Il0mv2I
 tgRKGnfFR/H8EiVNUqDtdG2Bj/W/iu8jk52iP+PluDCr6npI5Zr88aBFStTwzzjk
 h4qbPqZs/NO+Ny7ENpqWesvMCLfnC1H+6FrIASPs3JricA8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmr2q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 18:51:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c955be751aso1069711585a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 11:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747162305; x=1747767105;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=spJV8R8Bs+sSlbQ8ehRNXHZILSzp5Uy8JZHgSPrWiv8=;
 b=wQHUDrsb6UPG4WbGRv2qnL7QOziuTv0p4/z7tzRQeNR29Bz/smiM0u5TmRELxo88EM
 mAjSFipssYy3/myOVQvNwBFq8t479GNEyf39VuZ0etHybQvGTrn/jcGaWJyVXlI9HYge
 Uk5YnbNBW+K7dWZ4mUwAP2oJXQ5NOu9k8OoJzQpZ4pv2UEJ+FesvjHPyQDuvdktn48aB
 YQYoauNOWSPE99NBkb/l5VNPQVoKyItboL48g3In16co8vr3sZehBLq8FT6tT5FMTomS
 lz6QxAc5M1XHIZpIaCoE6VXvcazMjI6LssT8oOMbogFO4s8LTGmKP2Sj9RgFgVj2MgZ2
 blnw==
X-Gm-Message-State: AOJu0YxiIEbfoBcy/7BNpzbgEk75CIdhj99Jaf/s+JBAh0DZjZtdEc5p
 NUHyGgFoJC8FxKcn2i8bIrOqSptn8nDDmqXktDlxwjtcUHUJx/4W4PxhRgWj6/2FIVAYCJhgSCf
 Ec3nnZJceOQLqpfuCZPoqLaqQr4rJzvxp/wVHZD7nlj4RnPhHYnyCMEWYQrxaY8DD/4k=
X-Gm-Gg: ASbGnctyYcUtwzkpjaHWnFF9AOS6yq8JBhryPQOOPjG/No7nC+SY+6wMMcdfZiAC4nV
 O69KMgxPmC2YWSFjEdX/fEw1gQgkQGFsywryABzd9EqrXOCSdKqLtzkQmWJ4TyaQ39DlaWdhEZ5
 a/ir73mlSYVoOS+m75eI0Ce4xWS9M2dIGcC0VSLCq5+zeNjbpUEItW0oRquPDFFZZi8K9O/SVcs
 tqbWTpUsW8f4Tp+/DqX21ZuSPDf7mSla+peIw7KeoTkCJv4NyOxQ7qV3dN3V50GoB56shtfZJvq
 RbeeAU4snFTjKWErlEwqsvXyDJs5DWPJLe7PiLUc4us0clmRji7g+mPXLUtEpz/5c87/h1ejiOD
 NXEXCMYHeKV2PxlBm2KfA3taz
X-Received: by 2002:a05:620a:4551:b0:7c5:3b3b:c9da with SMTP id
 af79cd13be357-7cd28847654mr136577785a.40.1747162305180; 
 Tue, 13 May 2025 11:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKPB9Lqd5DHIDqIUSv2k1KGjQ6LFo1CTuDOZKsPaobR2sbUqTntY/YEFbpxxNxBcCiVDzTVw==
X-Received: by 2002:a05:620a:4551:b0:7c5:3b3b:c9da with SMTP id
 af79cd13be357-7cd28847654mr136573085a.40.1747162304785; 
 Tue, 13 May 2025 11:51:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64bf86fsm1958205e87.178.2025.05.13.11.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 11:51:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 May 2025 21:51:41 +0300
Subject: [PATCH] drm/ci: disable sdm845 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-ci-disable-sdm845-v1-1-9c3ca7d0f24b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALyUI2gC/x3MSwqAMAwA0atI1gY0taJeRVzUNmrAHw2IIN7d4
 vItZh5QjsIKXfZA5EtUjj2hzDPwi9tnRgnJQAXZwpYGvWAQdePKqGFrKouTd1Qb2xK1DlJ3Rp7
 k/p/98L4fjmeyXGMAAAA=
X-Change-ID: 20250513-ci-disable-sdm845-fca26359229a
To: Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8aF340dgmVwMplRdL4mqUGNXBthPtGz9cX7S0m3V9yY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI5S+1K1S5sW7YKw4EMKuEMPH6y1TiYRpCvxYJ
 tEhQgDB/s+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCOUvgAKCRCLPIo+Aiko
 1YMoB/0VrkkVQfRm3u7sOkHUgXVMQO4ygTDFfTGsUywrYYNzd7dvsEWrEs9myvn9POsj60lOkdS
 gmy55JITDFOdBESpZh05xg8ufrSYfPoYS5x+TXeWdcwHm2fqLrCbv9FsPZ1R7XN9meoKucdnYMc
 /A33AN946aNu2TzHmHl1BQE1zySRhw8HusxPDhxC3X9hc9Q3N481VdcTx12+4v3tfygxIB2PHsG
 FMgrsxaCF1Ls9pxeehzWXvp6OfKuPDPzwnIdU0C2s85M6JLq0RZWg28D9m/TLsMrKiC3cUnxPsf
 VY1jMTNV+7e3DZX37sdiM/aCVRlRU4eVSMeUwG3L117dT0NQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: MpB86RK7uMo5czT1ptqkNWTLpqxFAf2e
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=682394c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=O38deLNlhEFyGSD7h7sA:9 a=QEXdDO2ut3YA:10
 a=s5zKW874KtQA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: MpB86RK7uMo5czT1ptqkNWTLpqxFAf2e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE4MCBTYWx0ZWRfX8L1T5ejX4mRw
 67I6YIZdcK307yk1wDPakHkBk7o+4XFApwCR9WmiBBPgs7aNO9QlsXILV3n/qekDE3bvnsZ09+M
 IgRBJDHbK5UqR5ZNAapQhzAeD/wQjR8OOnVUC7a8buAv2dONVVSHemmKaL+o7xOQNRmBzRaGODF
 hDiVwiUa5DW2xczXGFWU34Wo0UjCLRR3K5PXgc9dIUhhwVJ/tdbgDYfP5UEbf2o994FuwzA/4oP
 jOD/8s+lj42D2ZkmOwmem4tthVSjthAGtJxXfIFVfK8TUz1YMDvVcQb3lwFRY6PSvLgH3g5X+O7
 5Zlc1oIF79w1uwcgAmWxV0WyDIumJj/R9DmdySFuHii1zyaDz3bcSSK/vnLCGTh+LkuKZXY6Hfg
 YT5IgTkdpltdDikWHguR15N4F1aL3s3JSWTe4sqNmCoJ4IdWUdSlwUeibugjgLKh9/vz5iN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=649 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130180
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

The SDM845 Cheeza runners are currently offline. Disable them until they
come back again.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/test.yml | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 84a25f0e783b6ca7f8a993c709d5a0fc86bf18d3..cc685833e8d2747dd21dc9a549c3d405431de8d0 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -180,19 +180,19 @@ msm:apq8096:
   script:
     - ./install/bare-metal/fastboot.sh || exit $?
 
-msm:sdm845:
-  extends:
-    - .baremetal-igt-arm64
-  stage: msm
-  parallel: 6
-  variables:
-    DEVICE_TYPE: sdm845-cheza-r3
-    DRIVER_NAME: msm
-    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
-    GPU_VERSION: sdm845
-    RUNNER_TAG: google-freedreno-cheza
-  script:
-    - ./install/bare-metal/cros-servo.sh || exit $?
+#msm:sdm845:
+#  extends:
+#    - .baremetal-igt-arm64
+#  stage: msm
+#  parallel: 6
+#  variables:
+#    DEVICE_TYPE: sdm845-cheza-r3
+#    DRIVER_NAME: msm
+#    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
+#    GPU_VERSION: sdm845
+#    RUNNER_TAG: google-freedreno-cheza
+#  script:
+#    - ./install/bare-metal/cros-servo.sh || exit $?
 
 msm:sm8350-hdk:
   extends:

---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250513-ci-disable-sdm845-fca26359229a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

