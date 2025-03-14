Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85C5A608D7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 07:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3329310E964;
	Fri, 14 Mar 2025 06:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VyHDBwxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6614310E966
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNug18031769
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mjSoUBvhcQw/y04Nu5LFvXZ5AJDuaSz5Df8S6I6vgwI=; b=VyHDBwxoPudWArcF
 UM3K3KFFTk72GNi5BAMt0MnLiTd2Vh6iG5b+ioI8UOWbekNFYAWJ8QWpyeADE9p3
 SuKBMSoe7hDmY9Z09m3M+02Xv75jHFz28sXy/tgO4WEgT9SfQknLAimjKyct+ezo
 +oCklyYEdvTLiz5XgJEGoR3LSog+QjUSSAyPKmPTj/USLQPQcgAepmGOBy6tHL5I
 VZ1uH45WZ6wRJG70muXas5SfZYun9GXV213k4E6dj1hyVKWW+vrHmKDZLvGhdAD5
 0v0GNh+7y4MLJVhvSA6hSQKcQYMwNspkJ9UuClIaqJ98AM1WcSkICqJ4/GGsXzTI
 6pRAJw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bx1jjmun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-476870bad3bso31481621cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 23:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932589; x=1742537389;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mjSoUBvhcQw/y04Nu5LFvXZ5AJDuaSz5Df8S6I6vgwI=;
 b=UJZOWtmL78gW7e+EVF78FMd/RidWgQ8AKve/1WNXgRMV9QBSFxmlPmMMjxF4S6VX1d
 sJ6e1czf6dUouoTi1GHyYLN8MjgwWnSvdmgVA26PP5Uf8KzuIxB/mfEttSfTYJYyFaHV
 +rcjyYpS/W2RtK36uKVFPYpz6oiIy4mbxfNhuF6M/PElQ30IDPSzCsh9sPP6sl7c6nrN
 Ltja1YvFSSVzRz5DE+A5doCa3Ra60pOH+j63GxfC8rcjZ60Kb4RFGDsMXzINJAytmCkS
 Tr+8Y/or+3wZFP10cxqGgm+cI/5/QffkZJwEUNG2PKFQ9TcCkmcRrVg5xEVKTw2baGXl
 Ah3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgc8/HczCwezX23euEmvSdWZtkUjWfx9cxAKerJ+82sWqWlzXyqv75dLWEYawyPWdIwweCMDUIcgc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLSaoZ/MjQmMMP5WLAiiLlL6MhEz+2fdXhBk+/An9YEYxN9LcG
 C0wHXcGLz1oBdDwatgHZpIDmrrYPQfReuOuprmUpTY3g3iE3her04HXuiJeHKRKS6au5NK2iLzx
 DQvgw38vu5/HDRWKFORRRErsdh658gVGAb53x++Vb6SNxuhe1oAcjpdfweaocRwUxWZ8=
X-Gm-Gg: ASbGncuGhBZlNJN0UjW+RRKL1tiAd7U1u6U+lb6zeUBPhFGaYpw3FfSlRnqLOEbHmIb
 XbBr/lNQ0A7rKtw43toUgaEAU8cvD9UGxAjF1/iF6Muv8Bg5Ysj3QpvYo8FlFUqF6c+89YAQ1vW
 t4JTpxmdhO118G67fjEu9mjRIV7GJHJitwErlRc8HFZVvyU/mbBmSqRNVhes5xHuPA82qsOS5Rp
 c1eWm13Kh6PvOHuQrucGxe84XLeQ0Q/ABEMxBx3RGpADdYiZu4UgZCM9YTg4zmXcZ7ZgfZRDurq
 aB63EWO6RN6PxvfenUrR90fjVOEp7qVrOPQeBVh9r8PUVUk2TSrUgfHjonfC5UfmTeezbVKTIkb
 wJvcHSxVRzrKpO1ZF+NXXKr0qeGRf
X-Received: by 2002:a05:622a:3d2:b0:475:287:12fb with SMTP id
 d75a77b69052e-476c81c3e7amr15418781cf.36.1741932589555; 
 Thu, 13 Mar 2025 23:09:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf5nv3MOYAkMmnz2OsAe+o9/z+buMZfQX7OZ04tCBLdd/CA2XLrJH4hX+ODMGN8nRL1Az0fg==
X-Received: by 2002:a05:622a:3d2:b0:475:287:12fb with SMTP id
 d75a77b69052e-476c81c3e7amr15418421cf.36.1741932589241; 
 Thu, 13 Mar 2025 23:09:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:09:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:13 +0200
Subject: [PATCH v2 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-9-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
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
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/LGXpgnuRffqJSRqVOkk/ZdY8s1uzD2F9Jjdwztl/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08gHRNb3rAw/1YzOCHHQbVo9K1tLhPyYm7yys
 7MIo6TQOkqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PIBwAKCRCLPIo+Aiko
 1bIAB/9iefWNNYwh+AhEoS9fi7fnc0aFhfEWmt/qtY1iAeShQna7KTXKAzo3SbUNBaZo9tErN2L
 WCk6iLtrFQ5WyPlwV3u9SbBQewc4Fjz37eeV/q8ulhrbHssaXkX3cIEixP9xNeJCqb+NjPkosVf
 A3zYjGvP76y9p1LANOqxkChYYGCbSXMzgzFmBKlByz0ULTZ5uI1BdRO+dC2bbmYbPjDJF8gLuZZ
 K2MgUIW/9IVltX03bTJup8BOkeGWi9Sc/EMDPB2ksIdCcSG/B3KjVWgFgpqCWyG3ZAJvlR3DzxH
 EQqc3RLVcZi6JctqZ0QcvA8vEwLzq399AIjKshNLNRCk10U5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CNQqXQrD c=1 sm=1 tr=0 ts=67d3c82e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=VUTEsYOwyNIbN2ghz4EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Sx9Ak3kCwXgVxGzbn7EHmmIGzVeiiA6D
X-Proofpoint-GUID: Sx9Ak3kCwXgVxGzbn7EHmmIGzVeiiA6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
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

Add the SAR2130P compatible to clients compatible list, the device
require identity domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sc7280-mdss" },

-- 
2.39.5

