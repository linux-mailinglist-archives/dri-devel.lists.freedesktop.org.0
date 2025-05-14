Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951C3AB79EA
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 01:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5CC10E757;
	Wed, 14 May 2025 23:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvP18TXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F83710E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJfsAR012639
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CuBzJCBuNWzefLz6iW0PPRQ/pOOPIkBFXN2o8I++3E0=; b=UvP18TXuamuHvsm7
 rMy5HDcseGPiLDpmYlQORzLqSuBjYh/ixymmiEMpZYocBMDldUbTgurBpviWIb7i
 +3kZyYkDPzhgLR5qKGwS+wc7P0YRNfrUaa3dtHeFbky4ngVMrPbkalE5Qv+yBeeV
 bSabPoqRCNdXtrOLyuARlgOAecdAAFDIyHcG8eBYopRwfSqkRqd4/LRhF2jSQKVM
 64fvYe8iXnzFexbfp9EIFB84i49QkXiXC1Rwmt999zQxyXZzaZ30bPlAvUfcX6Gu
 QV+efMPOvt+mh9sCeuBpn9yF3uz9CiXnGVVPYc6KD/W2aZ4Q9qhLNQI3HDeDHWio
 VZ1rsw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcymeq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-22e816139b8so2648385ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 16:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747266763; x=1747871563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CuBzJCBuNWzefLz6iW0PPRQ/pOOPIkBFXN2o8I++3E0=;
 b=wBTIP/tTTNKi2Ex1hgipgmBjMkoDhSiCNpvBuveGjRhFwIji2gCaYguDo2EsnXjMjP
 qLxmn3hILTZLW6YTQu9gV0Fd6Oe6/SNfTnXHNHkzUFHNkBVVRNRZilLA5NGp5iLP8UAJ
 dPvk4NW0M+t+ikmm8T1IjFAOKfv5IcKxP4mgRPyEbRbfIS0v4FsbbsHGCL6MMoR//dZM
 WoMBr8wKY54OZAMD8fdleJ4xdfnfMcH+7tWxJELWARnligYNqTp3VtTPJTZQR4obxE36
 ot55Wwhtwx97nBe8rOEtffsVMmBNNGAlqJ6fZ5XFsNiLZQQ++vfebTE3zmyXEYGF6VNc
 KYQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc9gpyd2oiJM9slr3kdgNXx7pEPMO+PykdJGBsbpYjKwh1Kiv9WvvGNTzkvNWKPqD4zrLxzBBpcyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGDlABRIy+fpJnQL/mhOXXqdj3qcKyQXRk60rkoGhuULb0Zoi+
 Ri0ctUvHu7KSOcQOOk6ISOOHeHlcDJKN2CNopq/ghKfgnTOs245YltyrqnevZYSjV2wVdihKnRM
 xoRqch43hyjFGuwGm/hMNEJ0R7w4P/9bKS/jzL8si/KX6PLCVAo/SaxYMRpkn3gs8pmA=
X-Gm-Gg: ASbGncsN94wEwTEWEM+sa5sAluYiCgJl9d/bp6lLCuetj12IrS0BxzqEhge0qtV9kGB
 wTrY7b6JNYDJ/YHMNAR7UaJMHmn4EFJUzAsSjwoRjoUFpZPa5KUlB5YA9Bb6fHnnGLhSWVcg2ye
 HTHBVl4AVJJoUURQ0Lb1VY4+zV/MlV2uPrnOSd70VP7JKA7JgKYYAHO3lsa62sEcAQ4q+q7ZP6G
 R1CrKXQrwmFddQC72bNUA61eYz57yPSNFjDd2KMxn93rYRwKY4PoHtV4eA/T6LvMWZDPw+LFB6E
 1RPc1LDDdMQ+ce0mqILcuXpHFyEKwS4tdR4v6T3t2y2xSWpW+J7dh3PF4wZIgTCIEfH54lo4
X-Received: by 2002:a17:903:2443:b0:223:2630:6b82 with SMTP id
 d9443c01a7336-231981058d0mr88360345ad.10.1747266762978; 
 Wed, 14 May 2025 16:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhWKAog4NA4K76orc9FFW6gSJW+dnOTRSdWtcPrFRPKjWtNX9etR1Q3S0r4hzqbzyGJBHhvA==
X-Received: by 2002:a17:903:2443:b0:223:2630:6b82 with SMTP id
 d9443c01a7336-231981058d0mr88359935ad.10.1747266762585; 
 Wed, 14 May 2025 16:52:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 16:52:42 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:29 -0700
Subject: [PATCH 1/5] drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=2434;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=BsgyS5TVX9bNk5OPlLRIxhQvZxWCd+vRbBAP94yBF6U=;
 b=+Hs/R20Lqd8VjpMZfSaRGzJzzDWiDQddM0F7j5Y2CU07J0IGS2UuXDWrTeLdD0J1T9Z0Tx08T
 cDWAJOqXSD/DQSjH7PLwlw1YvoAZkYmlZNsB+9v5lyJ1pArXfo4dLz/
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: FHsnHJvBFidVgnJZAQ7rcwJgLQFT0bNR
X-Proofpoint-ORIG-GUID: FHsnHJvBFidVgnJZAQ7rcwJgLQFT0bNR
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68252ccb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=s8xGxOBDnglVIm_wuFwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfXzKjz4dVuEVFf
 aTf6sEwx6c/ZVVhFuafHo8E4vItooB8z+h87KXJsxPFUEqwcz2bRK7jLbape89FOvhLBBXKAlAR
 bYO5Fn9/npwNkvgg4B6QaY4/uqGOwwDJXEkZXKaQ3jlMp4Kdaa5JA9J+mElFzlD9O4z/oqEm20w
 6kVSGVO9ykIb5mASGO245XH3zhlSYvZ5bs77Qrt5RNZKuHJrMyyOYWVmQpykNgsCipd45RXzEf5
 /Tuv7V3bYonpH13fQeRxTCC0Y/tPkiDM54B2OtDhH3XqgOPDcQtm0DKyKw5N4pfIQOwlTkVHFGg
 tZq/ixtH+e+Z47Y6LbkY5dCG12lEPIJ8GQ66TrdkLl5BNZp9I3M6vnYaqPUQ74ghKD3IfJbmONV
 0Exd2ruyHoZVGgjpNtFF4mf0OC5q4dX8ZwcmG3p8UkuJMWt5JHOZc1wegoCIwrVE+JMZt0RG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140222
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

Drop the unused maxwidth field from the dpu_lm_sub_blks struct

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 64265ca4656a..65f3ebd86270 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -379,7 +379,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
 /* MSM8998 */
 
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x50, 0x80, 0xb0, 0x230,
@@ -390,7 +389,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 /* SDM845 */
 
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68, 0x80, 0x98,
@@ -401,7 +399,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 /* SC7180 */
 
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68, 0x80, 0x98, 0xb0
@@ -411,7 +408,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 /* QCM2290 */
 
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4cea19e1a203..5f1f3eae0f6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -390,7 +390,6 @@ struct dpu_sspp_sub_blks {
  * @blendstage_base:        Blend-stage register base offset
  */
 struct dpu_lm_sub_blks {
-	u32 maxwidth;
 	u32 maxblendstages;
 	u32 blendstage_base[MAX_BLOCKS];
 };

-- 
2.49.0

