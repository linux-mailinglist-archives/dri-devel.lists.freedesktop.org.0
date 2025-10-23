Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02634BFFBB6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC7E10E8C6;
	Thu, 23 Oct 2025 07:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXHjepf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A1E10E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6YbXB016177
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=w2fC93DLUlG
 GbUXGQjHhV8DdpBbQi0xLHsTL8o67LJ4=; b=WXHjepf5MYu5cijtLVVBVnTLOW0
 byGMo+foJtSjR30FlSqtQli1zp9opvPqeV2Y4E4KXpRvOdiuB05i6KenLguS3Aam
 xdK8BY5Worl/S4qTrfpd56v3PzLukhHL++qUa+DMs8+uayfUwbcsCb2SOnymMHFo
 1+rGKCfp8+ofdFf8uGZXvrCFtvoA65Gt5sf7V172DEF3WWQGzwud9eoBgxJ4GfNJ
 5wM1mBfikEc6m70E5vFUvemDiGRxH/7BVMVD8FHcTeBasz2WEVoHZisveWNSHxv1
 CLIoTAtAp7aY4gCA9b4WDkD2lzC6tBMAdtzfDRVU6F3g3ao2ZDTHmdyrhXw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsd4ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-27c62320f16so5723945ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 00:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206137; x=1761810937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2fC93DLUlGGbUXGQjHhV8DdpBbQi0xLHsTL8o67LJ4=;
 b=EimEsBAEz9mIuc2yFeVJRse7dAyL3mr10buAKsDotj6Puv2phrtF3I8n00JXT7oqKR
 iBYXMfPSaO2oT2RyM4X+YmS+Mi8//0SZXls27DzTpvPq+b2dSDroZgDE7wy3TJn78hFU
 zzGlIvep0pyE+KkcFQBv5eT8MlfoZY3AOsJ3WxKqynMSNjo0KFVXAhLZ8XXxJB2YBcKd
 kkOPEk7RboJCTU/uaFjzAEZ4F5By8ebbZiOtwkEKfbfdaQt76qyc+Ilk2AZ1sc/AH+0p
 vuwBEav5tkxiIOnrBRls/04TulfoM9Gcy/0mFSDarwoXO8t1mrgXrDLJZtRsjZYRlSJg
 3nyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVb6g4m8Pz0YXBG6CnRwIwyqX4AIZ4pfRO15ma/zpbsE5F3z9xCbQgQ8wwwmzPcfGS8V/2vID2CRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFiNLHqiN8JS6IskbS8cAPTzbrWqqWryNyAS/3umyZr66zazU4
 KHmsgG0re4ziThNAxrO+hgg17Y+T9TThepDlOzEEstqiusbuLe0swnwb4jw2SkijGawCV50p+Gj
 ObMWfnn6CP/2+7RrMZZPS/wsLjzFIM7y3CB7GTyUfTZme22TyqHa4GohDA1ikOlowXUQTKW4=
X-Gm-Gg: ASbGncvOn0K4tuNDQHbVZybp9JsZk2R2IM88zVMxBI1oAKj6GBzywxO8pYxSu2LmcC0
 +wmRvTD2sZlM1wvwVCIok7MKNyRiRo+vVbDwVX/uGjIrlY5gJsOaZlBhtrrPOCAZ4O32Dkalm8M
 5zX+vrAPmAOJCNFleANzG2ScgoGvYNrag5NgC1znjxw4p7vSqP7ZZlLSwSD5Z7HszDlMhqvX5lc
 f1zLd08eYWH5lf9ff00q4zr0JH80Xm3vSJAbzch9TD7/GUThD6w5Lj20WLiPNv5FU6OWpur40Q1
 wwxwnUbZpPPyweVgk/LHQqq1AHzkGmUa2mHppYq+Wfhi9aHKM0uDfxMKKNRqermDMcLK3Dvj+BV
 m2Mq1fz99mEfwDZvzaq35wS0wlBY8Lm4722N16Ri43IhdmwbZ0g==
X-Received: by 2002:a17:903:2310:b0:28e:7841:d437 with SMTP id
 d9443c01a7336-290ca121206mr291270625ad.38.1761206137447; 
 Thu, 23 Oct 2025 00:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH682hkGWt3dvBEItqoe9UCqS26mzJjNqbQjGPbVOBXOGQ063Q1XYvwVWIAZvw9Ki9Hjwp2hA==
X-Received: by 2002:a17:903:2310:b0:28e:7841:d437 with SMTP id
 d9443c01a7336-290ca121206mr291270225ad.38.1761206136943; 
 Thu, 23 Oct 2025 00:55:36 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 00:55:36 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 05/12] drm/msm/dsi: Add support for Kaanapali
Date: Thu, 23 Oct 2025 15:53:54 +0800
Message-Id: <20251023075401.1148-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX7XTZhn4v3jyl
 QvUQ8DOuvHJGPiOvyZzu4uJ+LnJ+CObeDDspXIrIjo7h/CvyxEhyNMBXIyAz3DyucBGrxTNc4Rt
 apxqxldy0E3KTH/rh0knHoRd5iFlbwOKmcZ32fFdj2lvyOf0iAnCuLhJJxKu4DlviQ5+/Gst6IY
 dICELZJP9B3kq++Ja54KVu2Byj71lveWOQ+I3l41DNtsNu+hyaMumBJtuiihK1S3YiBPo9G1Fxa
 b1kLmB/nMykAfOBDs2/tSkQddMEGrgRILf/wD3PSrl1MTVTy4+wHm3eLOv887IF3LiwwZsWRi6t
 kEGFg/yHoMvwYlXaxqk1tJmlHinH/Z30XoHdS3/+LI+PY9GwpGGn0xLkKwx92AkuGeElORe3GPy
 SNRpTqBKoyIlaqYc7hy1DhDD1XlyQw==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9df7a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=EGddA7oXPexY6v9tJfMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: u-h4s6ECcHvrpbYHO1WFQo3PSi2YiE7A
X-Proofpoint-ORIG-GUID: u-h4s6ECcHvrpbYHO1WFQo3PSi2YiE7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
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

Add DSI Controller version 2.10.0 support for DSI on Qualcomm
Kaanapali SoC.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index fed8e9b67011..bd3c51c350e7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
 	},
 };
 
+static const struct msm_dsi_config kaanapali_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8650_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0x9ac0000, 0x9ac3000 },
+	},
+};
+
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 	{ .supply = "refgen" },
@@ -332,6 +343,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_10_0,
+		&kaanapali_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 38f303f2ed04..5dc812028bd5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -32,6 +32,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
 #define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
+#define MSM_DSI_6G_VER_MINOR_V2_10_0	0x200a0000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.34.1

