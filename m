Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CC6A99A3D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 23:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3037610E2F3;
	Wed, 23 Apr 2025 21:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyc+NK4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E98E10E703
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB6aKM024113
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p7QBd09toXDPTxrH5vx0XxRC7vdkh0nO6VZwdHqqgW8=; b=oyc+NK4woGJ3KVuq
 XMkvpBEmcWvcjyJ43PLZARuEOVJdBK9b99w88vHDJDNt6sr9b/FiHBWyeVjrFYsm
 XBDNpx6c0XHSxsvBA6D3stZs2+fwY/Z89bizkVbHpcqvPnlAlgDprKIFVLf3FnXB
 F38phjjjIhKWMlevA80kwqz3niwOwpDXk/GwDxjw+CEEAm/Sc3PkXNsS/RmzoPAm
 VEZ+YQM93T8lNNPQO0V8vHANQ00u0SFhCi1yarWDmjAuCBhMNVFgE7iYb0Wi+325
 6e5TCCxb1dr+mayxWdfCzSbz1UO0fPEMlOaDQC55LqtP1bhJAhQGIAgAEf3eFRhK
 5SJOZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bcp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so71897285a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442675; x=1746047475;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p7QBd09toXDPTxrH5vx0XxRC7vdkh0nO6VZwdHqqgW8=;
 b=gpvb+JTSBN6/RCIw/KT+auMqilzPqTKEqugpj7ZXEoC/K7I3k2Iu4s7Dkvw6fy/hNw
 LhkJAddE/4fTkJWqEPnc7qY+hVJZonarX1Qs51oBeo/8JTeyV75CbhzOyvuNshP715nz
 5dviZ8xiqEXCsczI1uDQR6bU3Sdr26rkYITpoKG+zUIe/AfOrbGzygxAGKKjUy+3QiIs
 BmoPnReCeZUYliYmymTxjyt6942x+duab+9/L6zJw386mDqb70Iy90Xs29J+YcDZIAQ2
 tr/WJXRMlOe+fh+bYs+3s7AuuUJqLrvJHI0hjQO4embSpADF/gVMKtbh6hTfoD5bYq3J
 grag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIOTLZYQWXuw8YRfKn3xTMYYl6qRHYXPb8Ycz60ToYaIiBzaqJ6IGSALyJKJr+8tkwZNZamcN5I2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yypj+yZeGIb2TA73qS+RCusyjGJXUI9xytdMf0kXYq7s2XKTZZn
 oAun64GkkQE9D/9qy2B+3FLXQwxAS7sXoddepw2XXUhd/3vKBapa/xBqS4729h8uKLhvvFfS/1F
 U3vdJcCHmh62sUTZmW6W9FX9cyddLB3pzoM6zuTP2FEn9zA954M3YaVTZbIU3BkXB86s=
X-Gm-Gg: ASbGncto4KWCv7+6o55JAKKzqOrWn9o/8033ZUugPNo1GwN9oMGeJBwv3f5OCIRN+Lh
 P2Z3tMpaYGzcjxKPEBSaWAPJOE9Ga/IfjuITwCx3w5ozZXxXIyesQo359P5ZguuUqFEPIe9v6+O
 qemHqNziigWlXWXfrTXJ6it9JIBws8WIpmEfqnvXCLRZddWjfUZz3gBBNQbei5ss8t9BHZrUGSe
 8ptzjhHkSuymu4kBxaqRwDL8+wyyVzJOREoN1sh5WURV0jL0FguclybVMAPg4HYdQ5QAUYEXAXa
 dKnM5omlIZ2QvgXfumX6FiKlsL3m1nNl1QbQFGV54u+y24+PqtKsXxLC8JhA/hmRkhNEI7X4WX5
 0hBq2cUqiMV3KaHAtAu4b6ck8
X-Received: by 2002:a05:620a:46aa:b0:7c5:e2fe:f431 with SMTP id
 af79cd13be357-7c956f4b197mr51250385a.52.1745442674621; 
 Wed, 23 Apr 2025 14:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRqYlbUiZFCoVw3MBgGjNdRqpB+HNKkc7dzaPXL2B3DisCVphKGvluBN2NXjbOiQ5N91WnoA==
X-Received: by 2002:a05:620a:46aa:b0:7c5:e2fe:f431 with SMTP id
 af79cd13be357-7c956f4b197mr51245885a.52.1745442674216; 
 Wed, 23 Apr 2025 14:11:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:11:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:21 +0300
Subject: [PATCH v2 25/33] drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-25-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13833;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+LkgCLQTfsN1XshO4dd9+YhVnPh0FkfYstgaJMuLCEg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcuaJwwnP+gkdTqQ96nk1BPRHspY4M90e95q
 SHpHNWXJbGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1TehB/9alwTik2/DA6PC7WKS4fUZAH6MQ5QDMWgrv+0GSTaRCzU0GBXTMcyFVnf+ul7ouRFKhFt
 ZoSrgb9mASCfvWIHp3UyDYE7RKuxEWJS8iCrZov6dX6xc8TDN/29VC1qcuC2EHD6TA6DBzH6UfE
 izpJjppJzwXGgFx3mtOBb4zxfFtvFXsJ64UkIoPWsKLHL3niDNDVcsHvMHGS80P6ouQTqYA4MaT
 YsnerGiGKalImTycRNjhQwKeeDIp2r2oAL/2olJux9E8HXv1IVt0L+c7ufGJhX0pbGnpaKFlffL
 LwVE1UF5hCyLgV/8zYi7FKtVzhErx2jGpt6RC5gxIdojuyxo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 8ii5x_KBadJj79m0JxKxpKZWf6FlJ_ha
X-Proofpoint-GUID: 8ii5x_KBadJj79m0JxKxpKZWf6FlJ_ha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX5WAepSIEXqwp
 31Z8bN6xug3P16nalSHoehwvMwKHVsZvY858l2KH0CQ6Q0wiV1muEXFZRht5TZS8K0UvaEsZGQJ
 oaglYmZ5UzmG0l0FavXvkbCuL4picrhtM71fW+32DvGPAMLQ+tOZtQSMqTLsliH1Mcm8QHsgG5n
 qqMU0C3V77lQsXdVwiXfoci7zO2D5PiMzOnOkLT6QGZuJQs3qlt+2HuHVd922UGBwbZiDVlWKGe
 trZldVae1+e670JGZRA0vy3IkWBeGhr/ZZwextSi1RNPrPMfSTRy7wG9z7a/bAloDkoIHzFKAnb
 S3SY/ckqufzI308zWoPBduQbmE+algogPgr8AV1KygRN/6VQ5MvKpORJ6qqr9jkURn1SaRFFzXY
 JV40Dew9HhvCAwc0rJDutHVDNjwVsYd4or4OV7O8zXPsaXWdwC3UB8OtvGBnhtzBIaWZINVn
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=68095775 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PTNk0fzPuTrgWsykFtIA:9
 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
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

Continue migration to the MDSS-revision based checks and replace
DPU_WB_INPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c                | 2 +-
 18 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 5f6b1251f30f3c6dfb20261a0d1bbf776ed5dd33..02bb3d01e2dcfb881d089c68b516abe1761f692d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -321,7 +321,7 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index c5d964e915cdde1f8a83c2793b0020d7cecde672..e1490dd6d0b35ef71b91b4b7dbc574b102e68652 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -278,7 +278,7 @@ static const struct dpu_wb_cfg sm8150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index dc21c5c232a7ce7d8c21d3a3f30a5c1bc352ddd7..c53a0376fc3d040b69a35896aad613ff8aec73b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -283,7 +283,7 @@ static const struct dpu_wb_cfg sc8180x_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index c1e620ae9596f400655b64b47e6b51a8d25e1428..f72c986079803ec0d60f0bd6545ee0812657b8f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -243,7 +243,7 @@ static const struct dpu_wb_cfg sm7150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 8fb926bff36d32fb4ce1036cb69513599dc7b6b7..a065f102ce592311376f1186add7a47dca7fd84f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -154,7 +154,7 @@ static const struct dpu_wb_cfg sm6150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index af7433fc6c128c2e29381ba6bf56388bccdd93f8..8c909c41b48a18fdc54753c68bc2ad19001cd3b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -133,7 +133,7 @@ static const struct dpu_wb_cfg sm6125_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 81af11630202943b910cd5896f07a32e53a23c6a..448ec3def8c7e3e77ce0740e24588a14b0a44da7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -315,7 +315,7 @@ static const struct dpu_wb_cfg sm8250_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 77126039733bbb2941aa6698bb353334efab3804..f091503840182b624471c62ada5f8cb813a707bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -148,7 +148,7 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 8cdd601a5350e80a5324db42c23bdeb474a59b0c..f4cd9405cc1f0589bce7ec68db68989bd24b2faa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -142,7 +142,7 @@ static const struct dpu_wb_cfg sm6350_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index bb35eea64a5af844965259cd96bef10d9955b493..f4572433f352fb2c939b80c31e90bc2bfaa2a057 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -288,7 +288,7 @@ static const struct dpu_wb_cfg sm8350_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index d21b2266909050fd20bf55b6fabe07351e445c5a..d312b7ff375ebb0bb5159c4d26eadc6eb3094103 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -159,7 +159,7 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 305a798768c60a2ec409c1021a91efc4eccc92fd..72b2f67bb70eb09a3340097da6020a40cfbf87fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -301,7 +301,7 @@ static const struct dpu_wb_cfg sm8450_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 67aed1ebc78952c6dfce0cc9f1680fa75ec26e13..de7e79680a7353e73bb2c761276edd9ddc25ce97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -308,7 +308,7 @@ static const struct dpu_wb_cfg sa8775p_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index b54a208e48a8508c39b4e4e95c9e26ce28ba7c02..674192923d8c184386e46870afc508e53917ff6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -297,7 +297,7 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index da2fdf01a17d29fd9a7ea46890db7a33fedee31e..6cd7ddeb2b1fceed4cebc1f86793831b1cb75945 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -297,7 +297,7 @@ static const struct dpu_wb_cfg x1e80100_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5ca696b8cd92cefe295cc7e45974e1da0d420cad..6a96fa529508673493712d7cb72846c29d0f5a07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -101,9 +101,6 @@
 			 BIT(DPU_WB_QOS_8LVL) | \
 			 BIT(DPU_WB_CDP))
 
-#define WB_SM8250_MASK (WB_SDM845_MASK | \
-			 BIT(DPU_WB_INPUT_CTRL))
-
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
 #define DEFAULT_DPU_LINE_WIDTH		2048
 #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 981d259c33631d31f0216f5cfae948b828d03592..e0efa65afd0b734234f1080baf2d91e348882dcf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -142,8 +142,6 @@ enum {
   * @DPU_WB_QOS,             Writeback supports QoS control, danger/safe/creq
   * @DPU_WB_QOS_8LVL,        Writeback supports 8-level QoS control
   * @DPU_WB_CDP              Writeback supports client driven prefetch
-  * @DPU_WB_INPUT_CTRL       Writeback supports from which pp block input pixel
-  *                          data arrives.
   * @DPU_WB_CROP             CWB supports cropping
   * @DPU_WB_MAX              maximum value
   */
@@ -157,7 +155,6 @@ enum {
 	DPU_WB_QOS,
 	DPU_WB_QOS_8LVL,
 	DPU_WB_CDP,
-	DPU_WB_INPUT_CTRL,
 	DPU_WB_CROP,
 	DPU_WB_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 4853e516c48733231de240b9c32ad51d4cf18f0d..478a091aeccfc7cf298798e1c119df56737e3dc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -208,7 +208,7 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
 
-	if (test_bit(DPU_WB_INPUT_CTRL, &features))
+	if (mdss_rev->core_major_ver >= 5)
 		ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
 
 	if (mdss_rev->core_major_ver >= 9)

-- 
2.39.5

