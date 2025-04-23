Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD9A99A0B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F0710E285;
	Wed, 23 Apr 2025 21:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPjFL80w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AF410E26E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NKYEdV016294
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XmpmVZla+VfDmzaCh/w2RI753s6YjEZNdR9seeOBG40=; b=IPjFL80wnVKujPoV
 BRDqKkLhkLjZ5YB9Y8DdmGFrIupz20ZCsU+iIxpc9Hu3R4oOKR2pdnzme9RNzKVg
 p58GUkYJJ7pqcmLOdXIoyqmPk9yla1MpEddEtEMyrJ2QvbDNqEU0tE7uMOqb8Y2z
 EpHD3oSQSl6WzPk27hsA8DSZncnmAS4HqfMeDZ6HTwSOStK0YEZ8qwq2MF9xGxkP
 gp0i7nuzHFvTUgaFjURoLBNuX4tSwJjC7Gk6NzyrOqqzUiV8FVZinOL8JPNVG/am
 bAEAS+G3bRkDf9dkBasdMqrn7TJCRqsjC1vVFdwK8oxu+VtwHmSkV08QEy1Lw9XO
 /aitUw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0beyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f0e2d30ab4so5918016d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442625; x=1746047425;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmpmVZla+VfDmzaCh/w2RI753s6YjEZNdR9seeOBG40=;
 b=oxMGsTT6mkBfYj5BqrAk0GzAplkeVyhUAWYSKJgHO8l1uofJhtGlNuS+ANkTiIeGEo
 6+xoA7irAp8VEKob6uj1FybkhxnRszDmozn9qet3vhEjOQw0dov4vUfxudwF7+8KcePn
 26hJvqHU2KmAk49DW+NXi+hE//9etwvfwMSSaoYysO+BApFKdWBd/2E5Deebl3JehV/+
 soTNWmYzdUQY+oPGU4Gy6LosR56sJZRWKdgHFm7buuCBrg/AbgPto7XlefK5SbLmhjfc
 7pvkdELR8XphgpXd5sCDH/TfNBTQd+I85cERc7PyT9jzxLqejawzmmkECaPFYKOlDLi6
 k0vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbJ4Cx9Sp5i+zPNcL/qntjwl0qgTxz9kfksCTk0FKZa0X66OoM1AmdsdkyFeWwSiBBQWlLUBNhXGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK5tD/9lmqVU271NOTzTMbq6QSiNfHj2Mz6Ualq1E++Ay1B6jD
 yIlLwxWlcnqpKatkBRO1vJG5X0dJCjkszzKxDO69heKFUn7Xfp6Hu9kU/bN272f/SVq+Ubdybt9
 mvUKxOdF2sG+r1dlXXPqKvKrs4/m1waJDhMmW18mfb3d7zjXGD/jk8mLZEDch4BIHsxw=
X-Gm-Gg: ASbGncsn29DD1wGeKcSTQ9K/S+u+W1GI4JFsmCPgnDjnPjYHUiVsyKnYombk3a6typA
 849ixjXkKv19i68zo9t14swz/0lo/MfZbzLJgPPjO/EleLsmzQ1p1EW2n5fbbhFDQKBdGKBDwEJ
 bVHDnuw+ap8RsswLHSnTeDL4CUpL5+DlGouXkT1eAjq5x2lny32CkegH6x8qII8rq+AMblTeKOM
 LVdhA4to3X94LUxDonu44TKc+giKkzCvQomy8BazzdUPI+H765pXUBU2FZvHOqpIdRY53gYTdvr
 mr1kxoYqCFiiA8emjsBPY4IIc+dW5lHk1/tcn2pP2UCnGvHncDNmNPbYy24K0/K0mVfrkhHegz6
 h1M4fcTksyKaSCqrcqyTgOPF+
X-Received: by 2002:a05:6214:5097:b0:6e8:f1b6:a122 with SMTP id
 6a1803df08f44-6f4bfc73c5dmr3390816d6.29.1745442625348; 
 Wed, 23 Apr 2025 14:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE4WugsNFsjiAFs6HO9O740/p4733F52U78DF3ipje+tLxnH9jXVMOf52RufQrUnFglErzpA==
X-Received: by 2002:a05:6214:5097:b0:6e8:f1b6:a122 with SMTP id
 6a1803df08f44-6f4bfc73c5dmr3390386d6.29.1745442624886; 
 Wed, 23 Apr 2025 14:10:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:03 +0300
Subject: [PATCH v2 07/33] drm/msm/dpu: remove DSPP_SC7180_MASK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-7-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=25067;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N2ibSK9AaVQQSoYkm2800cwsnJJzF8hIkM91nNwFHLE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcrZMtmDP8i8sKB/XAsqCk6rnkU0On9y0l3k
 /pMJ8SgpmeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKwAKCRCLPIo+Aiko
 1ePZB/0ZEAUC59XEYL1cs43a87J7CLpCpCP9N0tnKg+0GXaA6U2s1w1Okrt9125ytn7020tQ9+v
 vSfw2UpygkSh9b6S8Isj5fOgKWrMyjA6eyH3ywt9LdCxrdsGAYppPDNLlO0QcjB4ZB+wYrW3vy5
 2/AhV5UPItmQDONw7lnDXadjOZ4xVzSnyeCQLynRigieSzeKgV2oCfQD9WFsr46ojWXrihCuDem
 xJx50YmZqxnN8/2LGS18bSJm0t4HcjP4VvKIbXS6EXHCuKCYqa3vNVrjRG99yz/qVt5BuXmihOH
 wOjl4f8WRcm20vLslNl+9+XcYW6HylkdY+2tWN0OI4YV5Tvq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Z-u9LWcldLwvRPe49TpEgXBMUUWpsrk2
X-Proofpoint-ORIG-GUID: Z-u9LWcldLwvRPe49TpEgXBMUUWpsrk2
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6809574b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=U5TJg58F3aoNapyFlmsA:9
 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX2BwzH/2zsbxT
 bv0UbZFefjPKwxbSYdSQmS4fseX/hAuVUNafdnpSY1T4o3WjrSUGgpd7H53i/pNGLRTo/57FLKY
 b3R+kWN8nha5memMzvouoVM6JDVmLqUJjL/GxzmnaXBFtlF26hzqc7Ao8trZJ6gIM+1r3WW2lW/
 nYkOix2V+hOIrhM/yoYCl50J8c+BC41Fu2Zc39xwjQY3sNX7WDwsL/L/me0kSNKnEnoWd5Ch01D
 jm5mHxbJ4ktfhIzl2ov2WqeiF8xAEO2IZ9MlC5dANFsiCURHOpj3RNAE896pr/niYdj20DWiHJu
 o9YlpFD17rZkZGvm99Rzs4URnUrWHECh1YHovjhy7EEqANoLAO27WIkHNAT+435JcbpFOLhjLRj
 WuhePmcq4ih5Hp1NtGBA2mVgr+uxRhDPP66Sdp/L3nZw114JkUnMhOGcn4mQhP7NCtHi0xyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
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

Stop declaring DPU_DSPP_PCC as a part of the DSPP features, use the
presence of the PCC sblk to check whether PCC is present in the hardware
or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c              | 2 +-
 30 files changed, 1 insertion(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index a8b5c5b5a2e8d9d67ee185f00d92feeec42e490f..f7acceba7af1e8ec4b9c0cb52cbec60842c73704 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -190,22 +190,18 @@ static const struct dpu_dspp_cfg sm8650_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index ad60089f18ea6c22160533874ea0cc54c352e064..78ade3e977108fe98dc63ed93535ae3d947d871b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -118,7 +118,6 @@ static const struct dpu_dspp_cfg msm8937_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index a1cf89a0a42d5f3c909798c30901fe8796b15075..63dd5afdb60b051f6d531257b2844920cc09ed80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -104,7 +104,6 @@ static const struct dpu_dspp_cfg msm8917_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index eea9b80e2287a86448ab4e1a5914c1914d5a2090..4f09d483fbde29c74e3fd9bd0ba7a1a9c2638183 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -118,7 +118,6 @@ static const struct dpu_dspp_cfg msm8953_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index ae18a354e5d2a3d2e073f2099e4d970bff5ed085..54477e300c273182172a78b81dd0274242689895 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -223,12 +223,10 @@ static const struct dpu_dspp_cfg msm8996_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 746474679ef5b9ce7ef351e2d5434706d6109d33..9dc84c8dfb64c5f6642fe47ff9aa9ab16922687f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -212,12 +212,10 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index bb89da0a481dec053e06369dee8b0854a3427aaf..5ec81e3eb6c0902113b4ef1bf850b946d0ce4b1b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -183,12 +183,10 @@ static const struct dpu_dspp_cfg sdm660_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 7caf876ca3e30cc9230cbc6f19b9d3d1b954e2e0..2a80a881a233f48aa7f0b8a9345386eb85e3157d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -133,7 +133,6 @@ static const struct dpu_dspp_cfg sdm630_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ab7b4822ca630f8258bc9eb52c0b967e9bc34d18..968076c5f2211552bec1bd750409e4be57dddeff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -170,22 +170,18 @@ static const struct dpu_dspp_cfg sdm845_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index c2fde980fb521d9259a9f1e3bf88cc81f46fdfe8..3a60432a758a942eb1541f143018bd466b2bdf20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -103,12 +103,10 @@ static const struct dpu_dspp_cfg sdm670_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 979527d98fbcb19c33ccb45b5ba4716031949985..7731bd79c135f1f28cc3e5a53bf05097cc9f70e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -194,22 +194,18 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d76b8992a6c18c21a54eb2a373c789720b876c8b..899a5502229f1321403a27c4431c10bdbfeeeda8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -193,22 +193,18 @@ static const struct dpu_dspp_cfg sc8180x_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 83db11339b29dc6e11010bfc73f112f93cf6f7c6..830f416c0b5183cb764b2d6381bdc4a74df0ab0c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -150,12 +150,10 @@ static const struct dpu_dspp_cfg sm7150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index da11830d44072666e47b0505e2edc3ae7717eb23..dc6d8fd05c2e3afbe5182b1ae8dd9fea8b6543e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -136,7 +136,6 @@ static const struct dpu_dspp_cfg sm6150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index d3d3a34d0b45de08a33436f46a197cc836cf2629..14ecf429e7695c167e85f500b113952ebdbc3aa6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -117,7 +117,6 @@ static const struct dpu_dspp_cfg sm6125_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 47e01c3c242f9a2ecb201b04be5effd7ff0d04b1..8dab7f63928bb708c79080b139395c3410fd45bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -192,22 +192,18 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 040c94c0bb66ef5aaab2808f6f5ee04dd53e2540..f648d19123fa95a1c20074abd4dd0bda5147ed29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -106,7 +106,6 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 43f64a005f5a89e09ee9506a12cfff781530cb80..f8164950a0f7721643eabf5cb2bb7a5e3bcdfbfa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -69,7 +69,6 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 397278ba999b24722b116e73b008b2d0aec5fcb5..ddf05cb3954e12e6689cb579f20b20e1d220156c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -115,7 +115,6 @@ static const struct dpu_dspp_cfg sm6350_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 3cbb2fe8aba24c7b9db6bb61ff4c48f34db48bf4..6d424a4fd60bd94ddc0374466d86770138b2831f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -69,7 +69,6 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a06c8634d2d7779f7e867fb821f8d332652ba7e9..aaf4b270f20dcc5fb91fbcb783c6d3bc673894f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -71,7 +71,6 @@ static const struct dpu_dspp_cfg sm6375_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 93427f7cac3a370fdac3f119134bf9fee8b87a17..6fc6083607403be8ad2287952c99c7bd4d30f2e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -192,22 +192,18 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 1edec0644b078ac1fff129354d4d02eec015a331..281826170da082fc90a05c641060901ece0fbed3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -117,7 +117,6 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 7d698fc354666a2dc468a71ff08cb8df0c37234c..957e92d63f07723c8834bbb6e9c5a4d6449999a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -192,22 +192,18 @@ static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index ce050c898b9f21e69e5ff967c2af7c2df1e08232..ec0cf30306d2adbd5f07a2b6a6a443d29e11f712 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -193,22 +193,18 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 4291b4f9ce324eb517022eabe3ab6078b1c3a2fb..4bded17f2e371a48a5b21808b9f0c55c00efbecf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -192,22 +192,18 @@ static const struct dpu_dspp_cfg sa8775p_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index a6ab5c49654010194bfc1d4991ffec411ef6e6fd..3907d143056e2513a6a6bdd8aa2b56f63ac406cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -190,22 +190,18 @@ static const struct dpu_dspp_cfg sm8550_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index ad486b03c54d9beb6d77df4d6b5f142fd1dd8d8d..8cbec3741338aba07a780194ae50c162d2087d83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -189,22 +189,18 @@ static const struct dpu_dspp_cfg x1e80100_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 671e1ba35d28a20ca3a483bfc6412a8e53c25709..fda429972c35acc1e44c4384cf6d72d7e9f120eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -119,8 +119,6 @@
 #define CTL_SM8550_MASK \
 	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 0f5a74398e66642fba48c112db41ffc75ae2a79f..11fb1bc54fa92a5d9926addb437bc4b8f283723b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -90,7 +90,7 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+	if (c->cap->sblk->pcc.base)
 		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;

-- 
2.39.5

