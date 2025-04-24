Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8F6A9A7FA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0390910E7B3;
	Thu, 24 Apr 2025 09:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcMc504J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDBC10E7B3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6OW003392
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CTvivfFj86snxnhDWpggPaU2rs3LkEdWRUBSEWC7/ks=; b=ZcMc504J2YDPDoe6
 zA73aWewELQOZRK9NEFvFwc385QiPW8UqrFCs+0JR5cg3f1IwHFQVIIRamjJTN9x
 vxG3eobywUXWs0BkpfUGZbnCV0US316JTzmUVfDr+WhS+azW77u1bTxB3FTKtFKW
 ztndLuL/2poRJT6OxlQNv31AQHPRHKCb/ixPNFON+C6XD8eUjCmmehr7FgBLEPx7
 KznTWdaC+UzUM0Zso8ybVd/sKfJ5yBNbe+Ht9KbV18KCF1muNGZOPR0QfCN2SnGG
 met5p+C6Ufac+aAJCn4xj5jGLAbkmM9HsHV9/sIbGlvER//GM0e8k55Xgk11w83/
 PRGAcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0myd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c543ab40d3so128655485a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487081; x=1746091881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CTvivfFj86snxnhDWpggPaU2rs3LkEdWRUBSEWC7/ks=;
 b=hQzbVx9m67cxdgwjRPCXfBLWRfxnrhjtQLKsWXJ29TOiEhkGRWdl+sNgfLJy8/0O24
 x26mLjd41682xFHcvCiUeZjEjiLqXnrGRGUdmATMM4NxXUUx5V+T2IF+HeJdZ33hkK55
 II4xutm9PiBfbe+qNSUsCAxkD0/WWJXkiySFgyVdU2sDfEaC2OW6elSJsfp2ah+5LrTF
 QblMroExSTdWGOzBgKgqBidCRzd8UUuU2jWURfOuwn1IV8lLE933+bQtDpdARukBEr7x
 iYOHhAZpbiB7QFh5gDbhXxfKClB6Y4UI85XXIzb/bjIubyDppFyZ32QByW7FOqt4bHSz
 4V9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGHnHILgXsuWFkx2OWLYQ87Fc+X+/wXwBK18yriMRlrOwL3X4tY2fVxwesL0qEa1SJ7gvUA5krcFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgNVngDT4jPRrNr8y2GS2e/nfmaTlpvyYVkPPC8DLZ3V4M/d/2
 f403Z7gcSk8U4zJnYnM4QU7dccpTiLx17XA22YgFZIb2guIn3T+ZwlDVWm6cRdgjVC1Ib6Uey0l
 bnYVb1nTTbYQWJR+5X3vHDyePE15SkULVWeA7TEw5E0ldKA5gu6QSiDEbfjKqfh5A5UI=
X-Gm-Gg: ASbGnct1v85yVq+IeXZaeXYtJZzVUTaRIIYULJFf48zg8vCFH53lrVANgOZ6riEy39t
 KfVQTl6ZNqSN0HuJ/qrM7G9i5pcVPHYBcEhTANx95n5cQ9vN6xYtWs+2wRT+E6Pcu8NXNfYDjqF
 iAkpwT8hUXZk+6sdK7e2AyCuwslOiHWi0/nDCYASkJ4yhwyR4JKxTDGLNh/rmRfVrHmYApp3Fhc
 E/nLXzS9nzytTVHV+TeRNsXax4cjDBOrx+WQ9UaDyerltWGonatpKPoxDiZ3d7lT+KYrqMQVoW+
 rxH/TNosAefn9/qvSpfiFDZsmqo3uh1zn31d7J9xo+OnqjoZQRpD0+sHDfGUMCf71L1vBfWE/cQ
 5AULSTqeazwtV7jtiGAEVO9Os
X-Received: by 2002:a05:620a:210b:b0:7c7:a4b8:5753 with SMTP id
 af79cd13be357-7c956ef65d9mr270432085a.30.1745487081101; 
 Thu, 24 Apr 2025 02:31:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU4DEzZy4Gp1nBq1sJ9v/fMb9GmAbz0BFrdLUAAsJNqrJJV/Q6nPZGMnVEsZyEFfhqaykxxg==
X-Received: by 2002:a05:620a:210b:b0:7c7:a4b8:5753 with SMTP id
 af79cd13be357-7c956ef65d9mr270425385a.30.1745487080377; 
 Thu, 24 Apr 2025 02:31:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:34 +0300
Subject: [PATCH v3 30/33] drm/msm/dpu: get rid of DPU_MIXER_SOURCESPLIT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-30-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=36091;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q/o4W7e/zi8vdq5R3kZI6sxj8jj4EUnGiEayky2KEDc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSwWG53p1ViHO3DQy0eO7+QV4Jb60ZTzcNED
 jl/IFS5ppqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1dJaB/9pCfbGfgd3JZSDWkcJRr/OjANmsAM39x9AbkOK9fSDe1Th2X/bqksneqM3mgZPe1zXHDW
 80PLE01r3VRrIqlnQmSj+bx0e8iXCY//8SLnTP9Hx5y6ETb2POPWLoUlZy9rCHr1jC7D68UdoX3
 k/jRfPABMez+9ETFj7zva8fMBZuSsHc5MyCy6bLyaV7H71qI7TEY/RR/6JtMZVZgPdTx/s75pug
 FPGQ4G+GJIoyxbqD0jnldpn3on5xeta0vfkorpHx4buOchLlJfhTS3qggJgMvuUwglLiScjU/jP
 +gVelVvA3t//UaZRWij4NHA3qRzo4cBpQQgDxtg9mqZOUz1m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: yDM8ZcltApwvTpOxC4votxqg_ru-IPvv
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a04eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=AmcqjzelFzEpYhav6GoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yDM8ZcltApwvTpOxC4votxqg_ru-IPvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX5jmO1Ia5haKq
 5FtE/TLnYRDzLOckDfXL7TC3D1D4YpH4+tZKtt2kgsxWcdJylbIkMoeptqOIvM31DyGOuFRlROW
 eFc2Vbdv+EkFBBXhZdD3p2Z+ZXMfGj+BhqsZ2XoxyQY9yvDSiDxT0TT8Qc4fpIewgbZml8jxGEi
 LkddFKwyo+QtNyfS+HcnzLyN/rZyS217hp7Z9R7ufjf9uQbH8Bny+ur3nCoU4GyKCkG2He1YvvS
 7o15zv8SMfb80pt2Ld02+pRe8AUtFU0rY/R0Q1QyWWeT8UO0TDALZ+eNmd77wREiXdp6d+1tKxB
 Tvi7P65q+fxaiXj16TBJv5nYvb8kcVPm5rIzcqIss9pbAET5+O51vMm05jDRzUkwcpnlIJ/aZcb
 S/XRNT3xx0hpr73tuS4IGQUieReHYQj8nIOmJlEnXD4e1W17SvGNWEvW9bkZjdQ5LgGbjqtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue cleanup of the feature flags and replace the last remaining LM
feature with a bitfield flag, simplifying corresponding data structures
and access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               |  3 +--
 23 files changed, 96 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 02bb3d01e2dcfb881d089c68b516abe1761f692d..2007aedc0526854d3d8c4eface5b507dc5c62c58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -135,7 +135,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -143,7 +143,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -151,7 +151,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -159,7 +159,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -167,14 +167,14 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 7f606be1f79fe83568b467c47e7280537f1ce091..4cebdaddd797eb052acf087b1cd1a1302ff42fc7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg msm8996_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -154,7 +154,7 @@ static const struct dpu_lm_cfg msm8996_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -162,14 +162,14 @@ static const struct dpu_lm_cfg msm8996_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index a10ca16d2d63d8b6e2e2165dcd4bf0cf915f8e3d..1f119f79545eb1f4c6d27fe9fcb2a22d038cc571 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -135,7 +135,7 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -143,7 +143,7 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -151,14 +151,14 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index c1fc91b3f6f85af18cf6a6c1690ec69074fc3545..c8008db5772498d3bb85596518a3a21395fc9491 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -106,7 +106,7 @@ static const struct dpu_lm_cfg sdm660_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -114,7 +114,7 @@ static const struct dpu_lm_cfg sdm660_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -122,14 +122,14 @@ static const struct dpu_lm_cfg sdm660_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 65975e7ebd9ba1970b48d8753a87835677d58df7..70d7751831b738d40ab7e736ddb442c4d44e982e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -97,14 +97,14 @@ static const struct dpu_lm_cfg sdm630_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_MSM8998_MASK,
+		.sourcesplit = 1,
 		.sblk = &msm8998_lm_sblk,
 		.pingpong = PINGPONG_2,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 8d5b7033f12f740fe7b9226e93fcece8ed54b890..1218a3585cbc8664194692cdd2639af1c7888c39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -133,7 +133,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -141,7 +141,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -149,7 +149,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
@@ -157,7 +157,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index ce169a610e195cbb6f0fee1362bcaaf05df777cb..fd95933a41f0d604b7abb9cebb95520905211d33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -68,7 +68,7 @@ static const struct dpu_lm_cfg sdm670_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -76,7 +76,7 @@ static const struct dpu_lm_cfg sdm670_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -84,14 +84,14 @@ static const struct dpu_lm_cfg sdm670_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index e1490dd6d0b35ef71b91b4b7dbc574b102e68652..520f5cd122dd331ca1a1d9cc1ebd7654264f3e52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -139,7 +139,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -147,7 +147,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -155,7 +155,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -163,7 +163,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -171,14 +171,14 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c53a0376fc3d040b69a35896aad613ff8aec73b6..c1827c80e7efef9c57757e0b53535d9fbba30c05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -138,7 +138,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -154,7 +154,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -162,7 +162,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -170,14 +170,14 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index f72c986079803ec0d60f0bd6545ee0812657b8f2..d4c7c59e1ba845e087bcbc3394fc972a9058943d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -111,7 +111,7 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -119,7 +119,7 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -127,14 +127,14 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 448ec3def8c7e3e77ce0740e24588a14b0a44da7..50eea89a885ecf0d4ff4f478e6d356d86285bb3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -138,7 +138,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -154,7 +154,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -162,7 +162,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -170,14 +170,14 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index f091503840182b624471c62ada5f8cb813a707bb..f7f949d2b0b3068e74bb974f4a7f2a46257a53d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -84,7 +84,7 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -92,7 +92,7 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index f4cd9405cc1f0589bce7ec68db68989bd24b2faa..2d9a20568f6956368c5efbe154cf2ce1d3a559e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -91,7 +91,7 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -99,7 +99,7 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index f4572433f352fb2c939b80c31e90bc2bfaa2a057..2c59f0b77a75880df18900fa406f1ea7006927a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -138,7 +138,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -154,7 +154,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -162,7 +162,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -170,14 +170,14 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index d312b7ff375ebb0bb5159c4d26eadc6eb3094103..cbc7e9081288fb8125438ad1cc0016042bf70661 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -88,21 +88,21 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 72110b2a2770435ac886e992b1ccce280c5ac3db..0238eb019d98ad5599cc301e47bda43de762b24d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -137,7 +137,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -145,7 +145,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -153,7 +153,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -161,7 +161,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -169,14 +169,14 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 72b2f67bb70eb09a3340097da6020a40cfbf87fb..3b2d99de20621a5c47a31212d7fb236e0b784d0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -138,7 +138,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -154,7 +154,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -162,7 +162,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -170,14 +170,14 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index de7e79680a7353e73bb2c761276edd9ddc25ce97..14a1781c19bd8060d338ea52684f756258526996 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -137,7 +137,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -145,7 +145,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -153,7 +153,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -161,7 +161,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -169,14 +169,14 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 674192923d8c184386e46870afc508e53917ff6c..f6893c7ea13bc0ac84b46d50a132e18e1c575a3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -135,7 +135,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -143,7 +143,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -151,7 +151,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -159,7 +159,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -167,14 +167,14 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 6cd7ddeb2b1fceed4cebc1f86793831b1cb75945..f2a09026abf324a3c66c17264c8a5d8f2d75a580 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -134,7 +134,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -142,7 +142,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -150,7 +150,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -158,7 +158,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -166,14 +166,14 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.sourcesplit = 1,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 8496a44e2f04edeec884e1bac029c513022bf79a..2db27c55787791309962acf796d5c49aaf018fc1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -86,12 +86,6 @@
 	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_CDP) |\
 	 BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_SCALER_RGB))
 
-#define MIXER_MSM8998_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT))
-
-#define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT))
-
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index beffb92adf5d8a150e049811bf2caa212dace1a6..51b330f37c901b99c7db640a0b77149c7ac8cdd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -64,16 +64,6 @@ enum {
 	DPU_SSPP_MAX
 };
 
-/*
- * MIXER sub-blocks/features
- * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_MAX             maximum value
- */
-enum {
-	DPU_MIXER_SOURCESPLIT = 0x1,
-	DPU_MIXER_MAX,
-};
-
 /**
  * DSPP sub-blocks
  * @DPU_DSPP_PCC             Panel color correction block
@@ -423,6 +413,7 @@ struct dpu_sspp_cfg {
  * @sblk:              LM Sub-blocks information
  * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
  * @lm_pair:           ID of LM that can be controlled by same CTL
+ * @sourcesplit		Layer mixer supports source-split configuration
  */
 struct dpu_lm_cfg {
 	DPU_HW_BLK_INFO;
@@ -430,6 +421,7 @@ struct dpu_lm_cfg {
 	u32 pingpong;
 	u32 dspp;
 	unsigned long lm_pair;
+	unsigned long sourcesplit : 1;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 7f6c548b626dbc5bcc3ddb27f185f336354dcb37..7b32bacb5b9cd61727a2d596c65ac1b14eda942c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -505,8 +505,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	if (stages < 0)
 		return;
 
-	if (test_bit(DPU_MIXER_SOURCESPLIT,
-		&ctx->mixer_hw_caps->features))
+	if (ctx->mixer_hw_caps->sourcesplit)
 		pipes_per_stage = PIPES_PER_STAGE;
 	else
 		pipes_per_stage = 1;

-- 
2.39.5

