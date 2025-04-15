Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274E9A89834
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F081E10E6BF;
	Tue, 15 Apr 2025 09:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEKy+Dij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D9410E6BC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tElx025107
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f9AgmbDCtg5twjkdaU8ecsDLSo+5QAUYUantq6/JrfI=; b=VEKy+Dijiq3D2HS9
 CttI6+q/ldNvecUyGFgk+PBDZd+y1COnsv091oUDpau4C70e4fnZyfbm47wUfPRb
 5nqukibWXYS8Ak/Ok6BuKz/PusuXH8vX32lNBK9J45KoY9WPx+1fIuiz+usA0B+W
 +sGsuE1kXRfhGo2oEVDT/iEYNmaFeUXtb8xR6ct8rw7qxFuU2RufPOH4v5uDEeLC
 Rx8t7Yo2f2TE096mF7X4OF34zfNhHSlb38eVL4lVhR2shNf4lo5mjuPjueSD5Dh3
 Bvju9vlAPU9wR+4z05sT3D7Yg7Z73KV1zjthK8mGqN0xUSBHTIBiqK4WfMc4WlRh
 varBSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wfh6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c0c1025adbso1107935785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744709987; x=1745314787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9AgmbDCtg5twjkdaU8ecsDLSo+5QAUYUantq6/JrfI=;
 b=YEIde7MmYTutWBW/hnz3VIodaD7dgW8HGUlFOF86wTIj3XQ39VjfZ+UtESDOywskQm
 f0zaFChzfjVIbEsBuyzxzT4YmFdBUkapbDqMDl/0LstGdISFpO8MA0+jyv7ggDJla/Ln
 LsfampHThdo+qaHm+1+XlxGNpFQveEmVHMcc9k/F41Im3sBsWFO8a7ZSMCe8aIZfXur1
 tZX4I62kBIbMm2tzeZPLGScngVZsDFWr5pb8EBA/FgtAhCrgg/6ofkNj7dWLdgCpPmLH
 G+zVbtk19iJ/WhYAGXxDEhhzdhrlOqJGumuI2HfVxIElmi7EeINbl0SL+gWY+JfaggiD
 HvlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2yxtEELEmEiz8KiL6RUbStufLJ4GAayR1tbpH1oQ0PywW0o48z6fDquqSBJOf/S82FVUt+KgsEmA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBdU7dih2ekQiXP/HTnHqmVibvnJ5B4TYiTp/M2POm/l0j70Qr
 j2Fj23qHFu/t4oKjNmU5cdAx0S8IX3edkRmYkBJ+qyDTv9CwQ2wglqvz3vqGxqinf5LVrgvSTDI
 DG4tbluyZjtL8MY3M1sDjybzyV1AQ2ei6d6ybpytu1Q2pxGQ2PnJkmV5I9dSNaRwQ7w4=
X-Gm-Gg: ASbGncvS2BONHrQiSurhAuDk6vm24kog5nL7bDdYBo/GPGTkDCOtOHjXE4HGq7EIEb5
 Wz+9CSpHyxXThhZuY57yLiRAEvDJdfAPoKSQI135ZjJVMNSdGYxPmvBJV1iF3V16ncBaY4JjSRI
 5Ygbkz4qJFFRjFrVxibkKCPiPJcroSgWAqukgxavt1sSyfP6XKnCrs2MHMpU2mtPITWgd1Zy7Hb
 oFiZg5iFnvC9nPTI/xEuFoMqFgau5DcTv2A1tpggvpm73BdvpAJl2M/nLPyTgP/28i6PEFiC8TR
 siJhNFdm3fgBgmPIyJ2r4AhTRbO/JBk4ilDNdjbHSA6grzVE2tdJ0qzRWZ9qZMq4AlHM1/NxrQM
 CTH86eSq1t6FO2YTlFY7Abee1
X-Received: by 2002:a05:620a:811c:b0:7c7:bbc9:aba0 with SMTP id
 af79cd13be357-7c7bbc9abbemr966510185a.35.1744709986964; 
 Tue, 15 Apr 2025 02:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNnFLA5vT9LBSCJYCI3wYTMJxns+5i+5nNMjNTaaqHqu7WIdEd0lcCu19hVoYSlOsP/K6bQg==
X-Received: by 2002:a05:620a:811c:b0:7c7:bbc9:aba0 with SMTP id
 af79cd13be357-7c7bbc9abbemr966507185a.35.1744709986634; 
 Tue, 15 Apr 2025 02:39:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:39:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:34 +0300
Subject: [PATCH v3 06/10] drm/msm/mdss: add SAR2130P device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-6-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/w/74iYrKtAn6Ezwjelu2gFTZwiy2nDMAwTnc7sQiaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilWDQOXj32DrIB5f1c8i1fbFrhMbXUgwFwuJ
 rK+IaXWOZGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVgAKCRCLPIo+Aiko
 1VumB/93BM4l4rNb1vaPru2JaZuDFAsHysckNuR6nbScwRoFXGKP3DshlAILzwors9FN9+qfY3I
 FPMgJHcrKuzX7MfYGB37yKDkW84JsFXofe177vif7emU+yNciQcpFCt2OMLEC4YicOKMg/YwRLR
 JKkTp1+cbbuZyyTjX83GT332xV0oVphd3hdH+mBpR1yO/kOf8ngxeKlkxLes3AwPo9UYoODfly8
 2OYFQBakGA8BC2JN5bg0t2E/i6gkbgNB793qiSr/CvSn6sZLdWYpODgNu4P2C3BPyYB8535ahbb
 HGAKYIM52l/E67bm+FTgxudqZ8MMZZMjz+R1o4U01fhNfCYx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fe2963 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Zo32ic80xGYl86IK4a4A:9
 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8XCftYUqXzM6eeIVkUOm9ATysy1T4zJA
X-Proofpoint-GUID: 8XCftYUqXzM6eeIVkUOm9ATysy1T4zJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
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

Add compatible and device configuration for the Qualcomm SAR2130P
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..f706e44231a9c360ac4abe26e4050e416d8c3940 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
 	.reg_bus_bw = 74000,
 };
 
+static const struct msm_mdss_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
+	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },

-- 
2.39.5

