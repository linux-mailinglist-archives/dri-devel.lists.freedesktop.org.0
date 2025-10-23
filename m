Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0656BFFB9A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1421A10E8C0;
	Thu, 23 Oct 2025 07:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCqh9su+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A980510E8C0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N75wel028844
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=hxn7ShIYBtn
 ywIoj5z7bF8woB+YQ7/3kOpn9agNkuO0=; b=UCqh9su+0S8vwPc2G3kzO6ABdEI
 zGLJGtTbs6TcQjhPdV99Td6N6bWhLg8qCAWg3Jzi2E+eYAf420vl5e8xoQlQnxxJ
 IN0iTZr1SWzsSxjmh1/Ro+7TgiXgng3H0RUag+C34IO8/33lD0dedWxqt8Fk3WjK
 DxvcPZyi6tFE2iilFJ5vPW6IWKt5tsCpXuQ+WVOmD+8prh5Lpp2tHbjfHExuuR1s
 jhBwFrU24+A8em7FaumQVDbcxn5xuqF5C32HGrkPHKwVIF+k/02KnkCekIcOhCfd
 sv1XknS6jGMVIOs+s+QGY96+OHSpHB2U054ncfd3POAiEQysDkr0Ds1DmKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wd5vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-28eb14e3cafso11886295ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 00:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206104; x=1761810904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxn7ShIYBtnywIoj5z7bF8woB+YQ7/3kOpn9agNkuO0=;
 b=IYWTYnIrJy6ZGf6STzwbsFF+GWu5fGdUn3dst2olprlvOwhOGaqPmYFnpRSo0d9eG+
 EL8wy44hcq8Xv2KSEyZQpSpF8kFefO9EhQ9uTCKbApdEVHwf/SVGQBaVWNkdZkDvYVWN
 TvV3aMnD2TVzDfbgKW1n0oDIVG/Bniibjngx9T3OA+KV8pMwDzSPz+viaHLuxwO/EEAl
 7pa391lG66iPwA2pzdP7DXneVo79KorVps8gRRzmxsqh2pYkxbwrS6TsZL0HsN6E0DJH
 dL30SWAq6yi7VnjLUQ510R6zLtJz2bwNCYf381ElWO8YkaW537lKXK/1MxTTuEBueo9V
 aMdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvD//GPGPM5AJGU5rFof4rgEOuEHvEo1A209mf+EVwiLP+FMAmJw3gI2hcuKKXgqwf+T1iV4z2Ju0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiO9VIO0GPZRdtfegr75zen3JwyIY6W0ZhbLYVyCwjbFP0fMzf
 nZyz81Y6H0WdxKBXtCsDl2FySVJJvNJnZNgZuUCJbkYyQrE8pawPHqFXs/y0/Z4p8IV4Vv+REFd
 916mAqhMHUqtWM+uSW4a/wPSo1bawt+c4osfJbiAs19vL2zl01RytDEXVr6XXFAE2cEfCGRQ=
X-Gm-Gg: ASbGncvvKo4EViXqWR7TGcFbkXxZl1HNvUa7IXRpyFgMHSdRb1KEeMUy8akvCLvDbYG
 nEKNAgrZ5yD0yJNv/RlTGN46+fT44k817WVf3x25G1HyNoOIxt++LLCc8cm3zbCgPkwKOtcGfum
 cyIUwByixyw3nbYHRIike3hrH76eCIdMzruuO+FkEBJcFSP+deFphSQyDP9WNglrDMDH1ABFpIK
 //HEeVDtlkoT30ohtm7qBAqFhmyzBZHYVFeuRWdmDwN3Y910fVzZEpVlvhGDfLnqk0HAjZsrj4P
 2Lesgl8vReHS5jLMRqm32mq9wuzFxR1aekn/qJncvfCzMKR3RV9Vw60AJUqGW3ZG2XgdXGO/G6d
 iqlA7FmgEbZ5uftzfmatVUVusb4NhRl8MEVbIQR2Mi80QLrjmxw==
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id
 d9443c01a7336-290c9cf8e7fmr298783645ad.12.1761206104352; 
 Thu, 23 Oct 2025 00:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbPua/PqYedRnSX1LyIiA33Ruaseb4k4MVB5/62weZo4u2AYpakMUmfxzI5Qq0e4u2523ZLA==
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id
 d9443c01a7336-290c9cf8e7fmr298783445ad.12.1761206103942; 
 Thu, 23 Oct 2025 00:55:03 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 00:55:03 -0700 (PDT)
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
Subject: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Date: Thu, 23 Oct 2025 15:53:50 +0800
Message-Id: <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xLKCbNhJqy-s7M6CWR0c-Ofon36t8x8v
X-Proofpoint-GUID: xLKCbNhJqy-s7M6CWR0c-Ofon36t8x8v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX2olAR+DsrajH
 YcpMD/nYhb4TtawpxtQiMlX0iaC/RZSoCiE5ltxJ39pzc8o55V5KQmm78tq7A8NM66CreJ2JkeV
 7nXm2qgAOCgOiI/lGbiEmS3OpL0Y06bMossSv8LHPfUgF1dpUJ2ndjS+eIVEa7LmDQO8qXypqH/
 H89umvDElnfFz3Kpf8Ev2TEi2tOB5IaqkKjp5rz8qZvG60aoFewG0on3UIDFkCbcB0AEHDmwnQj
 LDkcKbGPl1ZSP432evBvhXIE7Uu7TmjrMy9OHv3rxulPA3fvN8dmaJayYso2UimnjvLmwNBwLUL
 OcfscUuRVpSDFuKsxavlDrJqCOLHmffn9YyPD4rPfVzUjunB2RMqw0Fte4nTARdG/NNPt4Z2wGY
 TKgF9+uEkseG6wQIMl7oHHPIAFQaHg==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9df59 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=B1tu1MuE3RNTBmX3WhkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
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

Add DSI PHY support for the Kaanapali platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
index e391505fdaf0..8df37ea50f92 100644
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
index 32f06edd21a9..93e53fb8b4fa 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1518,3 +1518,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
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
+	.io_start = { 0x9ac1000, 0xae97000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+};
-- 
2.34.1

