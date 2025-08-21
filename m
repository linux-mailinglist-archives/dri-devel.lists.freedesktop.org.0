Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAE2B2EC1C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E1510E86B;
	Thu, 21 Aug 2025 03:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUlmt6AA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FDE10E86D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJES17031148
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c7ZlGnJLq3+8VPdDBGrjVATTNbjOXYsVFry4SHltG84=; b=eUlmt6AAuho5wdkr
 o4j6MR9QVgfB9gI8IylgS1vLDVapbYjbRHop+U7w+lk0vgg42JVRmjWb7RttP5eQ
 D2nT/7kULgkVnRetLcdVUfQXH9vvvvJPRZlDsE+3lNLe8U0w+lbrKAwhPvNomZAt
 NhrmDFu+4JLgJlaMTlh8ZW7ZrneTYiwO+yIWyxADuio1HVM1Tz97ly7fD9IG63Ad
 HnCN9IkRdb53FG8VnXbI2zwvjRd2CuFlZ0r4H5M4RoLogny2lpJE4JH/wAgM6YC9
 dhhhQySSNExksxKCuZoPDknaXVDsAsjhYtI9hDmpwCOPlxPyLQ80mXQUyYh0CqFq
 ta4etA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dksgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e1fc66de5so1652220b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 20:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755747446; x=1756352246;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7ZlGnJLq3+8VPdDBGrjVATTNbjOXYsVFry4SHltG84=;
 b=KYTdRcW7h4QcO8lGYpPXIthRbjiCg2zSzbK3jatcfs0BDN0sk3XHneHZXzeq/1smNV
 2djclPkMkFsYqxQC1ew2Psv6PrwiEtijSfZMxLrckLsOW9uzS+rKmTiI6ZmpsMLd+Z+2
 7xWrdZhVr6W2ubwApW8SBVT981IfDdGiMlTVKtyq8Kv0QXWFFVclE4LbCc2pXAO5tugo
 y4kqG0bi6FiemmEdzM8gRGqOdISomd2aggn8QRtj5wbWij97qp1Mtt5OSJXF6yD6xDnf
 OqoIrfdRxTFs8waZ/7qkipSWWyPLJ/rNvpCXq9BQWuQcS1Wh9l50Hq9B059h4GeLuwWJ
 PV5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfZy0w+RuiE8RDyfz9/rPicwv4xT/cU7A3P3s6PoyS40TWcRj8f2xfyVQLPJ0GVrBrkynvZKsgSZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWGpXCTyVj44LlbGSO1uwE4T0CE2VPfUVChCIXg1rmHbgMLqPg
 CxFKzCArr8gaS4CyIlRXkDOfhmQCIIX1Y8SRCGPbLZggDMY1cIIBtYxT9TBy9vQLyCA5rx0V8JW
 XFk7kwnrJLPgdsOpbFrpIxJz71mwgs6TXSnE+pEFxsVlojNfrD3FimNYCeiONELk37hrLeY0=
X-Gm-Gg: ASbGncvTCyGA9mWBrhq6iaGV6VFMn55PBYGqoop1WilSv6ja9Yyp1kA6SAkwS5PuUrS
 x2b5TFta9yjalb8p7T/yc3Rg+5gXC7bPFh06xIu8pNTYFRK5cTWKaB8HJytoc/P9A1Jznfubz1B
 eXP6f2xi5fqWtKAk9euml1Fo6b9ORQ6uPXwzAHB92vDSrL0GJJU6Ei5w97bkC4o3EL5yWe+/h94
 HqLOvQ34PBRUyBktfV+gcU1+k6jJMEbNWXa805cqM0E9vDlVoITNpCT63Mi3Mdey61H0QuTC8b4
 ct2g5dLiAwDXBe1Qv8RX4Y6sZgO2UcxWrvCXWxp1KD9E1dyXlRYLK8ewYuZtzB+fP9bRhLU=
X-Received: by 2002:a05:6a21:6d94:b0:240:1d4f:71da with SMTP id
 adf61e73a8af0-243302c9111mr1308517637.23.1755747446534; 
 Wed, 20 Aug 2025 20:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP7fH3nvIAuguK5uO0nZHBdwSgTrqe9xEtuGpzyBRAGzFnVbJ7eW9pMnJeNufd/3ZYhmSLEw==
X-Received: by 2002:a05:6a21:6d94:b0:240:1d4f:71da with SMTP id
 adf61e73a8af0-243302c9111mr1308473637.23.1755747446067; 
 Wed, 20 Aug 2025 20:37:26 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:37:25 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:36:00 +0800
Subject: [PATCH v8 5/6] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747403; l=977;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jx21lmx5MGZ/FfsdeqVGZncpC/OsVU2to6SdDDH2l5M=;
 b=nIqdK5cwHfKA4OLfWyrt9z/LdtZOW4Iwetkfd1JMz89UozEsjKfrY5moqsraiVywkhgM6/qjq
 uGY5PjQ4rAWAws1iQ4pyqdTzZ2LqTHFXsU0e8v9ZXsffLRA2a9Ne3f+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7dADMUzPoyaB
 onkLYik2PYETgqZMU6SOJ/NkVqX/uF69zXyrPtSPp83+Foiw59xzeAG+OfaX+1XEucKD1RcDx4e
 HlMjESly/qbjKbGEND9H5YnOTrzWe9nP2ZD/6mkvX07+uULdeFdw7Y/8Wn/QZH/XKc4NSoXEAhQ
 UIgj5afHKIBULNED6m6QGleW9PLPM4NPl4piJheCUloGPQhFm8FcDptIRUK1S9Ls+jJORhanofq
 nHmMJpMd40xGxSZTR+w0SXXliAlKjI8MWtBuNqohq0SO7ptuxE8k19J2SrYmDKlal4pDCQ6lRcJ
 KnHPVFz2ZSpvn5m3jOrvxB+csD8OeJyq5ooG36Up67ok1Mk/bI1zwiIgmaq7MGqJlKLSPB72k5Y
 F+0vkcjTbPKMy55Ig+sadf4vPEZIUw==
X-Proofpoint-ORIG-GUID: 9nFMB9xy2Vo9RNg6l6tBqp-M7zLGbLJv
X-Proofpoint-GUID: 9nFMB9xy2Vo9RNg6l6tBqp-M7zLGbLJv
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a69477 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=56KCLgTT6E_AFdM1kc8A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..db2f0064eb72e8a990ff4806f60be74d3ff8dfa9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1

