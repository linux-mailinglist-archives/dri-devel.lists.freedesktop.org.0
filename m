Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF621B53037
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D1510EAA7;
	Thu, 11 Sep 2025 11:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtvCC23R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECAE10EAAA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B4kGm8019107
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=; b=XtvCC23RsHklyInm
 c7KoMjxSHqMi8zxFc0624vmpxQrBILAimTeu1L3EMV8XcWYrGsc3sNOtO/pCUxnN
 9O+qTZ0stmuCoVdwWBvl8BA+hD2oDJEz3DrtZYOMq4wjLWCE8tKOEW3IiWWBPoru
 qeWvG4t81da0Wbfju6H3YPuKCe/pTeHx0X5yMLxGe1jSf/+uFRuGJxIynoY6LF2O
 zJhoiAQiwhYR3eeD5bJg/4ehuqh1uaVEpZrFg4kvvaaZpnT5UiOSHJgPAEEZENI9
 vv4mEynB3CXsgs4YIei2CJuPap5wIL/Yl+8e9Kmc10MePBahURBkKziFxoPlf1Rz
 Wg61vA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphs4ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2445805d386so8639155ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 04:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757589887; x=1758194687;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=;
 b=oC0L65XtqjJ+OHc8bc7Bamk7V9mAh4bZcdmiqRjoOpzqUa3Q38RKxx3iiEA1JzIpO0
 otaVtaLDYEyg4ZBmVcjlWXqDcvMjDRNVZNDKNEByOKDzpVtN5Cr7lCr2KrlwVjRoXQUQ
 kOBMaFWR/8H5QIXCWRuLSsumpkFRth02Jgq5a95lZj5seCFy+1K8MFKnM1yAUB9ElUSl
 tPjKyUqSXhn88tKV9lAERRhku8vBMABJdJtH6FQVVUEcy2kbpsLpN1jxfW2VxHUYxMQ2
 mR5ugR6ZTuwWSUnVhQHGWH0Sn59SQCRuSipbN6Y4IpvVRK162Nfk9p6Doi64DR9oZYqH
 D+RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkRXzV3Wvk9uCfVUaTvtG7w2cQZ1eEREHt1CFYQ2oQSCOnyIfPuVfbUCnST+MYl/3APnHlXf0Akis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvtddP+7RhT0r7avYrM/KeG9sWGDtia/mwu6OBx1eOSvuFCiTc
 ZORtbhveWz/tzTGr7m0suUgAtSPVW3vdXcSSeJqVuCfRX/kXKHlPcHNxQSYW63msEX/pLuTq4uc
 W3YE+mqpCsqCviEOVBNml6zHYpzYM/pRLVBTlZu0J10jJDRNRLAzV2Gw8Jq05P6XtSLufjCI=
X-Gm-Gg: ASbGncvHde4j7GaUI7BxvpO2Sm7NxkcmfuwgDYj4oJA6ekRo8W4Cgb3DBUYKznDMVXw
 OucSUXZTZHGqFRZJCEIzFlKRrvaiSst8bsvFDErYJKX1esKxV0S+HGcBLT40QVpVLAUK4iEanmW
 gTIzkKc0+Pgxx/MHrcn++B5vyn8YsNeSfJVe4wPDMorBpev5IAx6eB7gxKXiGP6Mzap7s7/f5m9
 xs7GgNtPfWW8FKrIKV770Tg9Z7dpsbuBgdYfwgz+GZFAIeB5Hbbrj20+Bzl/JbjeQ9QGUfNdwT4
 jMKsKpxMC9DySiOOE3IBB7otT6wCQXze6ah6+bogJv/11hYuB00eO2ep8Khsz/fPv4W/D/ZrvPo
 FSAtBeB7wauwl8ZIpFZH0aKjVq0xN1xuN
X-Received: by 2002:a17:903:2346:b0:24c:c190:2077 with SMTP id
 d9443c01a7336-25173119212mr269058895ad.38.1757589886646; 
 Thu, 11 Sep 2025 04:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6QZfPeqjAdNDP/IOs1Iw7mvPTxlF9kQau40+ELjQ7Q8xG9vYN+Qx9eo0Ez25ipgoMd6bCXg==
X-Received: by 2002:a17:903:2346:b0:24c:c190:2077 with SMTP id
 d9443c01a7336-25173119212mr269058525ad.38.1757589886162; 
 Thu, 11 Sep 2025 04:24:46 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 04:24:45 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 19:24:05 +0800
Subject: [PATCH v12 5/5] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcs8300_mdss-v12-5-5f7d076e2b81@oss.qualcomm.com>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
In-Reply-To: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=988;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=f/HHi/48hqff50ItUhEpqZ+zfupVghiSAFK6cNZOm8A=;
 b=WpU6ED7a5F0yYamqUPXQmbEUElYlXxgI9Gy6Pj2DC+Dd2tBeAmG2l+2DtlQb/pKR2RcSjT3jd
 gjHYH2wDACyCQAfBTfxBjEIffU98xb0MjBM/hBwyufT2axZmE9F1DQq
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c2b180 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w6jnlB3v2fMHmChJ9ZgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: aZ-WYG1EmCiyWMkZOfPvELUouMVpo6uC
X-Proofpoint-ORIG-GUID: aZ-WYG1EmCiyWMkZOfPvELUouMVpo6uC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfXzGxrx5LDkEtv
 Wmgdcx6q39YWtVNTeso5Y3+RE8u/4grTFkYnzdkfXfZAhxwpEtAuqD3dYDQs2qsBRJNo1NFV658
 MFY3Nu07nR8p4Wn4BQrAzW3jnriwFFBVeJe7uMa8Dh3LH47S5Eu09Wg0xnLBy/MPQDDb9uWfJd5
 scgCWW0pmyZJ7IwOQj+8YQOEIGeLFEirfR4mm8sGGrUHg0yti0kGnz97lShApRGgl+smlqV1so8
 jlxoDF6x4PjjYPPgiYAhdz5B/aysYpYc6g6z1zbgChIxre7CSH412bSGSMvSk8SNRiWU6QnCsSI
 Ul5SZ7KHmodFTNnghbrI4d8b6LeHWcLkUf6aEEueIObGp1bPGFLfwpxMWH854Ms6hUXxt7auLHQ
 24t8GfOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c04..db2f0064eb72 100644
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
2.43.0

