Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5A6A80A37
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8BA10E227;
	Tue,  8 Apr 2025 13:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MU3QPD55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C1C10E227
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:02:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B6C2R020155
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 13:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=C99IbYsybOI0qp7XxA4lc+
 KIHKOFmr7JRjwEaTrZLy8=; b=MU3QPD55N9DA2pJuMf56VhN6m09g5P9xHnGDw0
 2GCTx8MvJlWt3jtXA9MH8Gn0Z5bS7LMNbHbfvkx5DvjZ+Dln/8+LGpfgNaVbHb5O
 bOuOW6k1nBuaKWCStWmwGorfPayYPSgwL1uiOFgLk+PoK7UHJ4qXxVnSv0aGwCr5
 RtzN+GItoymdF0pIv3jAMzn05AwNi17bdQqXswPi2ZlKfL9+hLdCIHrcCNWU76/h
 W4gzNKLGScWRQpdCtWu+2pC3mSzr+uDaYJaZpxgXihSyvKR7WsmvohT3Chaeo+YK
 RHTHD2W41mvVCoxZqtz1HnPn4fNsAEtiHgF02nt6g2lnjssw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2qtew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:02:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5b9333642so587170185a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 06:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744117368; x=1744722168;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C99IbYsybOI0qp7XxA4lc+KIHKOFmr7JRjwEaTrZLy8=;
 b=S8NOu6ulY3u9zfrm10wuNJD5bsscFpLaGfJdc3OwFQhGx6Dyuzw2SKFfXh7aJWqIaD
 R03+WoxKYUxP42tKljRqeasdft/ClgVSSQCtosbZmngsOaDInB926RVwx0VQGlJ/F4Wb
 mfQQshQ2lnC7KCMWol3KmKZZCsPQVwxcAaQlei6E5Z0+ZNTF6mcFEAh2ix+UcMhegIL4
 HnCcihlSjgA24jOE37XXwhVKWHThZmoK3xm66RfxrgBO8eIRlw7IV+1/ijGjFxdV3XEU
 NuaamUg5S8ycXgCWpLIneoHEwzkNknUYhDwjklVAscOiAOragf644sv8YRaLA5hIfmOh
 YR4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ceMFUzCXZ6HZxoiwXVtmKlvZvQ5gxGMs4ADxVi7LSxIX0n6S5l52sOlEz9XEkF2hluzTvRgpODA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznMV7d9vgV9wCK2x6Kzd/WY/3qdWbKyHSRXBVuaQuTQbWKZEqO
 iw/2yoO+kCWc19aKMRm/kEVO1UYEdm8C4I2mRZ2cD3s+EN1HvfdSKa4HC0h4tdBRRMmYvNJRP9j
 Q2elQugDzOq5yYSsrg5SR2G4wvnKfsdvM0EXlVd4M7LoJ+vAB+C6MmlyQ8Ru+jf9Hsb0=
X-Gm-Gg: ASbGncvNPmaSAUS6KbAG0he/yPD0JQj/H6ySdVrhwyxWmpm6noEDboJe3HOmHw3qtPR
 DFY3CahkV/QlNFFxOKwHoMlDNeVN09R4azNtqdrjYRbdXSfuHuTS8EL3BaxX/Wwy6yceAp6SUxc
 FscFufTDiz5TgosmMExE2ivvjm8uttkfxOyEu1GcnpXLZRovu/w0rl7M4ReLXQQtWEgp5z6vxEb
 Ch5s+rHTHS66fhEdjiTnlJ1RxdbM9dbLr4OrO0QYOy52gh8aTN0oKi831/0HmDmncVnYaMc1g3N
 uKor6K9HxoCyR1AGC/wIdGVvPie2qREW08DIgw3q5j/UMcVKXPUimLL1AUGI5/LkRirwnHl66Eu
 d5BIsHVxkbcynNGuiQP58l1ETbxHv
X-Received: by 2002:a05:620a:404d:b0:7c5:4be5:b0b1 with SMTP id
 af79cd13be357-7c775abf4demr2156429885a.35.1744117367511; 
 Tue, 08 Apr 2025 06:02:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaECUNZdRzJhLeXw75QE0R57Qpn6GFw1WDUnaDhh01xqCeMB3cxE/BN2Oc2HzYpAvyKc0/7w==
X-Received: by 2002:a05:620a:404d:b0:7c5:4be5:b0b1 with SMTP id
 af79cd13be357-7c775abf4demr2156423685a.35.1744117366999; 
 Tue, 08 Apr 2025 06:02:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e670d1bsm1560613e87.214.2025.04.08.06.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 06:02:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 16:02:44 +0300
Subject: [PATCH] drm/msm/dpu: drop rogue intr_tear_rd_ptr values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dpu-drop-intr-rd-ptr-v1-1-eeac337d88f8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHMe9WcC/x2MQQqAIBAAvxJ7bkElK/pKdKjcai8qa0Ug/T3pN
 MxhJkMiYUowVBmEbk4cfBFdV7Aes98J2RUHo4xVjerRxQudhIjsT0FxGAu6drGm0e2qjYWSRqG
 Nn387Tu/7Ae5Oh7tmAAAA
X-Change-ID: 20250408-dpu-drop-intr-rd-ptr-76b52416c125
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8183;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JdlMXxUwizN2ti92XXyxVJFjwtOn6Nq4gI0Xlewt8tI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9R50D8d8SZ21NDKudMR43W7rVbh+XQ/JeL46E
 rTpKwT/QwOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/UedAAKCRCLPIo+Aiko
 1TBAB/9CG/SR1t4i7Zbc+3thhGxKeEe1SkmXyismu5gPfIWoRcjUOkzRJRDqJHynfQRE5ujp9Tb
 rsKr28RJPLvgHJjHVU2fy2eHDVBL/0Ef6+nfwQhd+FnXvr6fx8Ccdha2/1t6rR61NLn0+K0l12O
 g0FUDyCblRJeM90M6KFVcDZreLRx1ym+I1g693JRWhpLwEvwdA3E888oa1KU6WCCIMP2/F6rHvf
 P5xWunufE4HbFzgCEfQK5n+3hpokY906G9NsZeFm50qsFO5sQIZ+vDQI+r0ao0h1MDKfVq6+csS
 sa9VQffKBsgBuoMt/4AtYS8HNL6Py0dhfujMIifTyPhLdVSh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Gyp6pmVFCaTu9MWMWWEPHPwkAVXcvEs0
X-Proofpoint-GUID: Gyp6pmVFCaTu9MWMWWEPHPwkAVXcvEs0
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f51e79 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ZZee45BDSTTCXVxweLkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080092
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

The commit 5a9d50150c2c ("drm/msm/dpu: shift IRQ indices by 1") shifted
IRQ indices by 1, making 'NO_IRQ' to be 0 rather than -1 (and allowing
to skip the definition if the IRQ is not present).
Several platform files were sketched before that commit, but got applied
afterwards. As such, they inherited historical (and currently incorrect)
setting of .intr_tear_rd_ptr = -1 for 'NO_IRQ' value.

Drop that setting for all the affected platforms.

Fixes: 62af6e1cb596 ("drm/msm/dpu: Add support for MSM8917")
Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 2 --
 6 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 1f32807bb5e5d49b696832c4eab54c05106bfd4b..ad60089f18ea6c22160533874ea0cc54c352e064 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -132,7 +132,6 @@ static const struct dpu_intf_cfg msm8937_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x268,
@@ -141,7 +140,6 @@ static const struct dpu_intf_cfg msm8937_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 42131959ff22020a83c0ea65d79a56fd57c800f9..a1cf89a0a42d5f3c909798c30901fe8796b15075 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -118,7 +118,6 @@ static const struct dpu_intf_cfg msm8917_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 2b4723a5c67606d68dea905d947cd691bb28eda0..eea9b80e2287a86448ab4e1a5914c1914d5a2090 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -131,7 +131,6 @@ static const struct dpu_intf_cfg msm8953_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x268,
@@ -140,7 +139,6 @@ static const struct dpu_intf_cfg msm8953_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x268,
@@ -149,7 +147,6 @@ static const struct dpu_intf_cfg msm8953_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 5cf19de71f060818d257f95aa781b91ec201d4e4..ae18a354e5d2a3d2e073f2099e4d970bff5ed085 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -241,7 +241,6 @@ static const struct dpu_intf_cfg msm8996_intf[] = {
 		.prog_fetch_lines_worst_case = 25,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x268,
@@ -250,7 +249,6 @@ static const struct dpu_intf_cfg msm8996_intf[] = {
 		.prog_fetch_lines_worst_case = 25,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x268,
@@ -259,7 +257,6 @@ static const struct dpu_intf_cfg msm8996_intf[] = {
 		.prog_fetch_lines_worst_case = 25,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x268,
@@ -267,7 +264,6 @@ static const struct dpu_intf_cfg msm8996_intf[] = {
 		.prog_fetch_lines_worst_case = 25,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 4f2f68b07f203a11529f7a680fb87b448305d80a..bb89da0a481dec053e06369dee8b0854a3427aaf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -202,7 +202,6 @@ static const struct dpu_intf_cfg sdm660_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
@@ -211,7 +210,6 @@ static const struct dpu_intf_cfg sdm660_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
@@ -220,7 +218,6 @@ static const struct dpu_intf_cfg sdm660_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index c70bef025ac4190347f81d75caf4777786fbeaf7..7caf876ca3e30cc9230cbc6f19b9d3d1b954e2e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -147,7 +147,6 @@ static const struct dpu_intf_cfg sdm630_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
@@ -156,7 +155,6 @@ static const struct dpu_intf_cfg sdm630_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 

---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250408-dpu-drop-intr-rd-ptr-76b52416c125

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

