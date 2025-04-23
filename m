Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688AA99A1E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C506D10E3AB;
	Wed, 23 Apr 2025 21:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DobGb7vn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCD410E2F3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAddlN018062
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ger9HZb5YssomX2ccM8ujcxYFQhM3swDMg2juQ5fOn4=; b=DobGb7vnP5IFWkdW
 JjrUcagp6js6sWSOSZh64YSX8frm6UhjOWFQISmIHmHfbGvurBf67QekCrUiJDgD
 ajQeXIOmpphILk3R/hC7nbjFBxXKOn1hmN5pIHO/C8mVBAhN5ZUUYJiklllU3OUX
 OjFsBSp9PBw08ZblDYbCZsL/54gBMPWjkiNVckA7lyITznCKMLU0UAtJ5rNe+dwA
 q1Iox7ZS13kgg9YCn728+xWunAK2bD8TI86wswfieMEtcs+eCoE6rIhft21GaUq1
 QLXPgMzrcSK6bYGXcJW8dU5esqhZcMRQHmlF0fYkdThJ/tlVIWVAuP6nyTxfWLNp
 VK21eg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh03dk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e913e1cf4aso7954446d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442648; x=1746047448;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ger9HZb5YssomX2ccM8ujcxYFQhM3swDMg2juQ5fOn4=;
 b=DmB2xNjYE4jYK/uPrYAzhZz6s98WYGZQsNwZPqwXtIzwU9NguHxnjErdsZxws9Cnbg
 LMB0uK9EMg3NjHBK61snvMDjXhMMbNvqygYvH++J8niXpbeusX8O0n2eBiI4MLc5bgvE
 OGgeamjAuniXRon9eorKKoMd7DspC+wkZ5kGgcI2z2igXnBKnU1oDvKkJHHNun2DF1G7
 2QOSx8CRKIfiTWPy6bLobPxVQ1e8Uo7Rb1xo8YEcUCrYZk/9C/8aD8Ct+ym18lTtJPUP
 gJWuklSWWdofkJmTpekoaH8tt9QKdWQ+Kdvv8OIcfCAGgTyaDF3kDInosCm77H1DqE5O
 HWXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBu0Y5VabZ3cFTro2w/zLaMCLj1ca5fy2WskD5eIdGUg20+0HQw70FqUqmNVcgyfAeiEPsnZ1nDDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvG0uEqrrUSqcLGxJ7dKRVdrTN5XeT1HhUrWB5n1FBhbxgBMIU
 ahUE4oYXoQTfD0Npf4GoWZFihC6gLx6G2RcAJe3Y6VXm7VBQvFFyalOlrpeh7tUSCSATeVUDwSU
 +NEU9bDktoazSWSpQDGgjkdheIm31vi0v0tFKOBp9lkAosAYd0l8HXsowiDIL6lhQzXI=
X-Gm-Gg: ASbGncvr4c6JweKXR8ynAjIlAzdQxpUPz/I6wjVeNFXiaR6jtUSliCz9sSwKP88zfvX
 2YMa+x7Jnn5WXypNwyIZqQpPqhvckdO44QbNyEKhLrYBP1a9PSFlwiUcywY1mTS05tKA+xdAbq7
 DHPI4O+p/kUCajKcZbSONwpY5DC7fDj2bUQsJLcoDkaKxaCS6p0s/ZIJ6hRx2balRbPDFLB9TWb
 bh0dtb/UvvFDEdGNSriIeC1yXXKIw81Mw3f8ibSEF8bZauswdbnyfr4ioh8pcmMPr6RqFgu1YrP
 IHD6FOjcqE9u/e93SkNU748JSPlgXqusemBZUlBB/Sg6jF4HxfIbxfI82GhREVURpaP1Neily7c
 MhN81HDYw4Etef1lpvPg8qxzW
X-Received: by 2002:a05:6214:d62:b0:6f2:c88a:50c5 with SMTP id
 6a1803df08f44-6f4bfc6d049mr4370196d6.32.1745442648461; 
 Wed, 23 Apr 2025 14:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDen0vCqajbJuoXqp9q+jzjoErpaetpajjeSga/fCWifSqSKIaSoaW1H2T2QTCLrpt68JR6Q==
X-Received: by 2002:a05:6214:d62:b0:6f2:c88a:50c5 with SMTP id
 6a1803df08f44-6f4bfc6d049mr4369656d6.32.1745442647924; 
 Wed, 23 Apr 2025 14:10:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:12 +0300
Subject: [PATCH v2 16/33] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-16-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7378;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zZbpETW7aMiyCYpHLuzre/GCxsgOdCyoBUUKB/kjzjU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcs/IDhhuBBdGIFVcQqmzXlr78xxWAfXKuHS
 oBgWDlbJkuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLAAKCRCLPIo+Aiko
 1Tb/B/4zRmLp22xbdxBAV4jyvgcwbaBC8q5kxBKtdL97EqIXCpmaouAWT7G9XLcP7d6qjRAsuLF
 6PrH0dGs8hXuo8O9yk/sKeZ/dxSqWu6T2iXpeaRqgeN2jEwGdUJlqvOGvPxCUtWx4TaUjSs7uWh
 gXKifjTjMPBEewGc3427Tc8mK4kZn/skDI9W64YY2FOYHDvwomYhgfZPkmpGqP+0lGO2V9G3tkB
 bAGCK31ACnlY99SLou1I2Vhy5b2lkw0QqsRh+sNzFhMU8f2evTAF22QtBtP8tMQ6BptLD5rmeBy
 GZmOaqqzSFfH+vhHgODtEFhkpqhTaJbzXAMLMQjDCJytDXIp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXySOV75JB03W3
 /kyDD4gf66rxO6QFgJSegVXnAdjaGYkyo/Lf0onS1+AK5GZJlmGcAB8SUmtmTAd1uAZ4PhcV2h3
 dhW5DZnrYUdGj9Kkr1YPcl8K5/KQbktTC6ehmnWKjPBE1CBJ0GSv4/9j39BHYyRBOK7HfYdRNBl
 DG3Mvi43O1jS7jHke+dq7UEM4Iy0x9m4WNigkr5PpHms/fPj0Im2oypw+RXDesdYfOUsGnoW8aK
 vKkqshaRHYUxcpV/zPAknjdtOyr9bzCDNhCVhLD2XcqMxDrenxBstYtKYm8x8SXx0jDntiSlCfj
 EZ6zkFur9wTrPsEuMTB5Ze9ah5T+qS4XQB9G+NGHkuMv+cPphpgFilXXLLOXoiwa3xrSkX9yKvj
 LnJlaKdEnGhmpGu4ef98psBrHpKp6cmg+QpX2cQvvwZRp6RzEkUJa4f6qMHUfmWlAsAfNzJB
X-Proofpoint-GUID: 8CohjPIunZyCYSkkv_h1jp2EeTosQ-Pa
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=68095759 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=TBtKe9T1WDpDz7RobDkA:9
 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8CohjPIunZyCYSkkv_h1jp2EeTosQ-Pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
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

Continue migration to the MDSS-revision based checks and replace
DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10 ++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
 7 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 78ade3e977108fe98dc63ed93535ae3d947d871b..c0b4db94777c42efd941fdd52993b854ab54c694 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8937_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 63dd5afdb60b051f6d531257b2844920cc09ed80..d3e4c48be306a04b457cc002910eb018a3f13154 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -93,7 +93,6 @@ static const struct dpu_pingpong_cfg msm8917_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 4f09d483fbde29c74e3fd9bd0ba7a1a9c2638183..c488b88332d0e69cfb23bcf4e41a2e4f4be6844d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 54477e300c273182172a78b81dd0274242689895..ac0d872ac06be7376b7b4111e1ac5f4057b5fb76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,28 +181,26 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_TE2_MASK,
+		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_TE2_MASK,
+		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5e0123557a44fda1d250130e09e4968535927088..5dd486dd9bc77184d5e9cf5ca2922bb3d1671ea2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,20 +95,14 @@
 #define MIXER_QCM2290_MASK \
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
-#define PINGPONG_MSM8996_MASK \
-	(BIT(DPU_PINGPONG_DSC))
-
-#define PINGPONG_MSM8996_TE2_MASK \
-	(PINGPONG_MSM8996_MASK | BIT(DPU_PINGPONG_TE2))
-
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
 #define PINGPONG_SM8150_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 33506e3bba9fc51f9e99446cb7df6aa51d81a3b1..3300897aebc9d6b38bcf4a0e0d51095bcbb6fa9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -119,7 +119,6 @@ enum {
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
  * @DPU_PINGPONG_DITHER     Dither blocks
- * @DPU_PINGPONG_DSC        PP block supports DSC
  * @DPU_PINGPONG_MAX
  */
 enum {
@@ -127,7 +126,6 @@ enum {
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-	DPU_PINGPONG_DSC,
 	DPU_PINGPONG_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -319,7 +319,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
 		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
 	}
 
-	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
+	if (mdss_rev->core_major_ver < 7) {
 		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
 		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
 		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;

-- 
2.39.5

