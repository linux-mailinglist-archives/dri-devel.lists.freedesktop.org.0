Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C2B0D2B4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A6C10E5FE;
	Tue, 22 Jul 2025 07:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nb2lJZoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424E810E5FC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M2NwAF005512
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6T5LoZlt4M2Nfb5X+7vfdX4LAsIOmzT/JE+HlobZE30=; b=Nb2lJZoKQUj0tLuH
 eRFnlJbO4HBHeUIrBulW0/dZjwGRnZ6w5pOhm4JWHajPfwLFKMZJIfBodb2Wkm8a
 WrAj0g51s5ii0drQgY0tVfrqg54VZziMNKT+gpWe5D8o10Ik/s1dWGLnuGpJRUD1
 ssVpJH2CIyvOxBgTwMWhthE6MxTnvPXsmLxRi5pb1jWOuJdhMb4tEIDXGr9SQx/0
 vxputu7C0op/3W17gMHHTqtT6R9Z2XC/h+2IE1MLyM9cxiyXAhoHWCIWdHAKyENd
 /HXSlfxyAXuseIYGBMpY9uoj2QeCeKBmPaJrVAAUz9sWBISvkqILHf7laILObGzk
 PeqkjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q8hav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3131cf89075so1363873a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753169019; x=1753773819;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6T5LoZlt4M2Nfb5X+7vfdX4LAsIOmzT/JE+HlobZE30=;
 b=T0rLA7dhJdnLhgLXQAmObrzTLDoDNntDvuWsY/zNLhMRp3Gu19B+6fBpwG2NxM/oIl
 Upugs8LbiPi/HDaXfvVn+nx9ylfGE3cV4HiXsrbCAx5bCcNVdGjqPYMqRKDQaHel7CEk
 tUiDvDiKsl3ts9qQjb4CuZnAAEPtrg44fzeSMD8/ypZgOcROZ0xBVTfFV4gzo3EVuYdi
 Z9lZPnMDQIFpFN85J/doV7CXvoqD1RYuNNCI1dX8YQfWjl1U7xkPH/byY2e4yQw6F7YV
 ToaiWx4eIgR5SeQ5FY/bjw5yZhxwuSa/C8K7NT86585nEZWPs7JCtAWvY29s5U86lOxR
 OfdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYjuzfJOPgA9n3SZyLfqzGGrOozP6W6u3ORPJ+DC6xf9e6aLXue4uzPmnnGjqrIwcUVExPSXuOueA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvlYHpqEqc25qO8503DL/bt3LAmZ11vdkk88lbIKf+x+e16osv
 0vmnwMWPBPtu1wVFX1Un4PqUXYtE4D9zD13FSoF36ypDZFIXCFd7kac1qa4BXeO/E29n2aVx++N
 nIQKtSN0OCCXKysOQyBSvxJ4f6yLd7qiXVixND6w9o0FPu6WAtfN3ySIusx1He/rNKMrtRrc=
X-Gm-Gg: ASbGncstGA8F/ruJoSN+YfWaB6/oykV8/jzFdCymJ35Zkid582qoqQQnNmOQzy00zHd
 0bn/hahTl6HLUXD6cmeHJQuh27v2u1vDdb6P8g2GW/CIo8pp2IH6ooOk8ImwN0GStXWTypmUWbp
 2kP1Lj1dblEb8rEhwuUj36p45FNXPU67BHL/SYgQc+erNLQzOOGto4wzi3okxorvMrI6CGqI2ko
 GgG0n4X6wadyOlBQ4dKORJJ4E8i/Jttt0mYIwgEiDMvOjnZQghQU/1pPVZ+VWrzRQq+8Bym40wV
 62ZnBeoFy+wUA+cgXr6p96U1Uq9YBUNUnJr2TU/mt6inO0k0kjBSKSrXWF3zEQ9Yj6D69dx7sa+
 2Xfs944ntd25srBR0bi0WYQamWTQqkClA9cNFzzC0j1IQXiWQmzUUSpBe
X-Received: by 2002:a17:90a:da8d:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-31c9e75ef95mr12583152a91.3.1753169019026; 
 Tue, 22 Jul 2025 00:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUBkompgYp4NsbDBV07hVcCo1eE/2e6MRN+tw1ZOzoeY3VNs+3v9W92tzFmCZwxBRf2BDv7A==
X-Received: by 2002:a17:90a:da8d:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-31c9e75ef95mr12583132a91.3.1753169018485; 
 Tue, 22 Jul 2025 00:23:38 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:23:38 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:12 +0800
Subject: [PATCH v2 11/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-11-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168938; l=1803;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=IqNy2UOlnRxZPX6+c35gyiwHyCJKZ2vyWBvAK40oYUw=;
 b=chI1sTIkkoEQ34btM+a8bsvY7GDpzMDyBcI0I765ZtJRv43IghZ0xyFcN8ZZvoqA0o1cTqVom
 /JIMtAyXyYsBWSgRb/wbBdHsI+7fA5OjpN64gKTST3z1uBj7gp9RO1t
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX2gkwSluAIFNg
 yWmBt/OXCnKRHDChcqJEblzzl2ggMPTSyjDzvPmG9WmowWYuICih0hvA+14aX7zrhVcUnAIC5Tn
 ao4KY1K6rfmwtPa+Euo19UELGQopY7/9ZdRuBXl6sRIoC/L1FrmO5YiFgBAlSV9WvHh+A9eWVbD
 5BZt+l7Ks0/WwMj7zVmY5bQkWSPOkp1qIZ5bfMsgFuQRhW8RECiOd/nbL7IpqmQQuJ4+HRG9M6R
 VdVZfyrEMdXLnduriDA3XZMdJgXugc2nwNxAy4Svvrh06B7FVkCRcnbz2kKNRyntooZlW4jaOS0
 m5d5IUr/C0RUgOAAgturhrC5b+w8atRM6c8+nBE5PhlXL4my2Dr12hQOHSxzSETNtOXtwF6lae7
 IQmMGFzE582anQJwttGAOAI+Cb1+N3l0RPwJtLSdtopTFyrWD1bCrTkzJp7iH50I4nOezX5x
X-Proofpoint-ORIG-GUID: Lhvvw8mNzDHj0fvff3QRdO_w4ptTeMX4
X-Proofpoint-GUID: Lhvvw8mNzDHj0fvff3QRdO_w4ptTeMX4
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687f3c7c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CWFEUPHrMG6v4K5r7EwA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059
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

Register the QCS615 DP PHY via device tree by adding its compatible
string and associating it with the full DP PHY configuration.

With this change, the DP PHY driver for QCS615 is fully integrated:
- All required ops and flow are implemented
- Platform-specific configuration and init data are in place
- Compatible handling is aligned with USB3.0 PHY via type-based
  dispatch
- Supports coexistence with USB3.0 PHY through mutual exclusion based
  on shared TCSR region

This enables end-to-end support for DP PHY mode on QCS615 platforms.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index e97a206a10554b2d157d1fadd66d66386eec6c40..35fecf78736f7a6b9c3af6a89c71fd3ad9a87496 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -699,6 +699,11 @@ static const struct qmp_phy_cfg sdm660_phy_usb3_cfg = {
 	.cfg = &sdm660_usb3phy_cfg,
 };
 
+static const struct qmp_phy_cfg qcs615_phy_dp_cfg = {
+	.type = QMP_PHY_USBC_DP,
+	.cfg = &qcs615_dpphy_cfg,
+};
+
 #define to_usb_cfg(x) ((struct qmp_phy_usb_cfg *)((x)->cfg))
 #define to_dp_cfg(x) ((struct qmp_phy_dp_cfg *)((x)->cfg))
 #define to_usb_layout(x) ((struct qmp_phy_usb_layout *)((x)->layout))
@@ -2204,6 +2209,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
 		.data = &qcm2290_phy_usb3_cfg,
+	}, {
+		.compatible = "qcom,qcs615-qmp-dp-phy",
+		.data =  &qcs615_phy_dp_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
 		.data = &qcm2290_phy_usb3_cfg,

-- 
2.34.1

