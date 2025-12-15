Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D52CBCFC4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 09:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E54B10E3A6;
	Mon, 15 Dec 2025 08:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHi/ZNsR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaqNi1Pn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C872610E24E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BF8MlIm2357894
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2OMfokriNEm
 V3L9dGBSJIm9fOYQLSe+dw4pSj/NNaNk=; b=IHi/ZNsRuNRV6uzb5NbGEGoGzEI
 Z5ixEVnBTRJ2k2xyiFMbAv/5ZK8n1wFRWq/anDqcZGTq8axSCDYdG7uvv2GlDC/I
 2Bi3zwEWtc0MTzq5r1BKJgtjQmDqa9kyONYLdZntkhtobj41g9d/TMAWWtZ66LQI
 b1A267gEouKQ9tXnAsypiKtqTYU9Got30OAUMucCpp253PJqVeUYQG7PlG9Qp7mP
 7KjiYMTMGHLoRG5okShcokgSgdQ7K8jmCmdGnvbouOFfo5JfVuFeuKkSV9V+1XkC
 CDZA4iA1s5D7ImrzS09HAqjEYWvBygY8dafZYkdI098ACZN8imva/3Kb+Dg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b1771ucjx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee0488e746so71207181cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788037; x=1766392837;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2OMfokriNEmV3L9dGBSJIm9fOYQLSe+dw4pSj/NNaNk=;
 b=YaqNi1PnT6pAdln5mvMQYwFmIqJdMxJyEOSzVv4fAM2c/m+SrjQ3HnrU2IMPowkkNv
 UK3qT7JveWbDBWfEoccim+Pea9h8WyX13TNjG0dG8IS2Ja/izI8adbXzG0xKzmy2J3V4
 +Eu2BQzdWD30EmorDU7Q9rhmQWM6RgOBIK8FTnN6ENdYe+dmAaM44imjgWWY4mxwMaPr
 ApY4FwXm7+3hEOakff5jrA6v2PABtCIY+ElED7ELEk8Rz+a6Ezt6CexA7VkGlbXlFHjl
 dRcEjRDQ8eMwcQq9NscoB9Wr7imbM2XXjZkTlwLTaqRr1cvNnFEgZOAgJoRJfTvkPEgj
 4dZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788037; x=1766392837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2OMfokriNEmV3L9dGBSJIm9fOYQLSe+dw4pSj/NNaNk=;
 b=ZpHESU6mF0VrNXRNEUk6jB3hFNrsdQotA1hIKntddYtKEV4Gw0F2uivpEBJ4gV0pOO
 Gy2FSCPI6L4qFmKswgnhJW+GVsYDeQzsdTUS1DjLMJei7RHs72mWXmtk1qOonVaH7RE1
 41DbUHaYnoESQMMWYNj0ovW7DdYbygkhC4x1Li27d4txzgXf0DRtgEpcre8Zp4vK3Eld
 vZJChB4OA1dJRaKgB+RlbOOMENujGD+508QJcpmhIGio9eDyrT9APiI5LxDsDo5sf4Ji
 CpW21yBxJ1rdcFFYjtmv19dh0l5lJwA0w6NkL2XF52z6kaeWB0hzOzFNgbiko7Q2xB/x
 6OCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjCp+irQYom3676MgBJvBWMLYjwzmZjG1ZeT1D03H+1JBopY9LMansk/jF/ypQ6XPF0XrDAPxBpwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvOl0JgxCWU+MwGYamuv4DtpbW9ZsiR2FYL0/fVWZH1svpBd07
 MtJ+vWgCzze5e5JwmQBD2fJ20IptKdcj3R/T3StvYDFS5i7IYgZHFqgn70psvV92owk7GANAIOj
 UOlafn+DVZrUdvSyxibgi9bLxyciXY57kpBDR/CJ1J56rluu3M/kue/WQJhwoN6XtjX3GZLE=
X-Gm-Gg: AY/fxX78NSiPWMS8Y3QvFBsMvfl00rEki5UyNFkAcHmD3rolLTTtoeraf+7kyGDicgM
 rP/JlZ8QtsybYAcmd8BC35z7ua3Lv7mNPxUhUBJkUSXt2DFAXvv9NVouuHFuIdE90eRmIMXU7ZY
 OyJEleYy55MIWWrPgvFbyu2jGwE6WV54vhbsAxN6sjX2y31Q/1L0AkQS7d8724Nu0kAlKgMt1Ju
 REqa8uuV3sohdkMXDQCMcs6eKSxJpn+Mz7fdYZTAaj0/aQG7VgMKnNrFq0K8Or5rQfi9FCgGhtC
 Db3d1btbF94TJh9g8D/LKeQq/771Y2PIxgJ5+Q9nqXEdowcxfWbAvPxnCWET7mAmAglIt1xKTp+
 Usohcr9fWqf6rOsHlQdYhWJwwdgNU54hqDr1xHJIp11q/qgyERftxWFDOmHQX5jnJw9E=
X-Received: by 2002:ac8:5a49:0:b0:4f1:8bfd:bdc0 with SMTP id
 d75a77b69052e-4f1bfe6f7fbmr194668431cf.39.1765788036883; 
 Mon, 15 Dec 2025 00:40:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFquCbinPDhAbYXnGkJ0wvZmDim1bIk7PfXYefiaPKtBfDyxhsk5phSVASo5dAYZ5Kl8RU5Tw==
X-Received: by 2002:ac8:5a49:0:b0:4f1:8bfd:bdc0 with SMTP id
 d75a77b69052e-4f1bfe6f7fbmr194668261cf.39.1765788036482; 
 Mon, 15 Dec 2025 00:40:36 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:36 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 06/11] drm/msm/dsi/phy: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:49 +0800
Message-Id: <20251215083854.577-7-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q6vfIo2a c=1 sm=1 tr=0 ts=693fc986 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3U4cfQXDHKTdET_WMGpZoedsPuDEU6DW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX1MIpM2T46ZnL
 r81wAXFVkfe6tO9e9qf51Js7g8RssbZFkYlBwUddnl8QWh96fSe8Jq5xE9BAN0RTCn6NG29p8RR
 lzzjxlALl62mAHuwaL1VwM1dzRBRgPACBdViP/ocsKAkhv+9AvenwCL2EZjwfmT8M9/R3wcivNf
 St1UKW1mX2JEFWQIAGUC8fUcFZ/iQFD1KIM6gwmgIjQra2FIUXbo90gXxL3REdkiYIWrDs7zQKS
 qubrFIP6MvOxTArWraZ+GtJeJ5k2Kkq+DEdHxUm3YxNmXCKoqs5n0za0xZft2aXEakJrGMz1ku8
 v7DBl7YiHcCJCerRh58ybP5Pn5jw3JUq6WL+Hp77jOCOPT2bHJTBkb/38TR+LGd2Q8+BUBZo6Wu
 UWSO1l+D5YPE9xXHvMIqiRK/XZZBGA==
X-Proofpoint-GUID: 3U4cfQXDHKTdET_WMGpZoedsPuDEU6DW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150072
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI PHY support for the Kaanapali platform, kaanapali introduce
addition of DSI2/DSI2_phy compared to SM8650, However, based on the
HPG diagram, only DSI0_phy and DSI1_phy works.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4ea681130dba..7937266de1d2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -577,6 +577,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_4nm_8650_cfgs },
 	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
 	  .data = &dsi_phy_3nm_8750_cfgs },
+	{ .compatible = "qcom,kaanapali-dsi-phy-3nm",
+	  .data = &dsi_phy_3nm_kaanapali_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 3cbf08231492..c01784ca38ed 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -64,6 +64,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c5e1d2016bcc..8cb0db3a9880 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1504,3 +1504,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0x9ac1000, 0x9ac4000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+};
-- 
2.34.1

