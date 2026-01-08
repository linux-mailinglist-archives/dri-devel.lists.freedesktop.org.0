Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DB0D01B1D
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27B110E6B9;
	Thu,  8 Jan 2026 08:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr+cDKz/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpOqXij4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB34410E6B8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:58:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6088w9S21570543
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
 8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=cr+cDKz/xSZUWk6B06N+mmY220k
 I2lAAwjoK/uUXw+OQdofauEx2KHJHLu2Ts2WBb5bRLTC1fFG0gZz4hZB4WkDReOR
 D8x+tCTnwpWVWH+gYuRC43tuxo5CT+zM12+z0+LipTab+0vGlxRd1zvVWmnhUi0z
 rWWRMMuME88sXlMuePPDaKVDUhcVGaHfAjMGWC1wf0YQWshm/nE8x8k7T9/PFW1V
 LQ2I51KG7tlQU3d9LQ+k3pM4hNf4baKJsQbqM5wtYX51QxFDSCZpN84Q8His4zbd
 ziVL1uQv+eWtSz4Btaj4e1MRtbZUzX5tzTGAkfjAYJuoe5QCKRI2h/95tnQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqr019-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:58:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b234bae2a7so790585585a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862703; x=1768467503;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=dpOqXij4d1n2FrzV1Oi24Fb0Z/k3mSUuC26azR1YfLuQs6hHDhxBakBlD1s7GCEHk+
 j8QavRVhJt1TICvPZuL+0zaQpS4lKjNerrpoesdf+YVLa77j6XPUwvlSgT6PZ7m7qg8Y
 /NEZwv6rEulNw2mfVtTZfIbWmBRxAyiReUamTvhiLglzyD9Q1exQw+oPcYz7R+PmdGa4
 xnVcBksuXQFngl9Q9+UJPoPBu+pkt0o8MnaA9x2bx4YRBodVGmYrz8s3SxNiIX1IQ+aI
 99nrw3nDtAfDo8yr8KEFbWgo+thPyRGioHJH2TIuImBsW+D74rIUmDvdp8bcrPhqrz4C
 JX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862703; x=1768467503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=c6nA3ZZ1MtlIXrvqd3+pk8Azqbufnas4Upx4R16Uh6IjJ6oUPeo1ZdVEQOlDdm6kyl
 Y7LH0yHLaampoXsKjRABK2gCqMWo/haWb4n8aPy88xHXcscpaFZmP3w7rDhO8l5F90jl
 JQnwhFBUL/mis5AyBNL4PzNd0LpuyvOgji4U6RJfWSTAgNLaaXDK+X8+l76ZCdltWe2O
 gJhJAMoaIf967lP+rDymPwDH0F+H7LgVUEH716TdrCqRUNrrJltkg5R1nJ1wgOej11RY
 N7oLOG1z0b/0X0ZEbyEj/o3SRi4XRxdUHQB18IHtS/lCe7Qn/lV0zaNBUNbwxnvKn8/V
 kEwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKCDKIlnj+TIRHXubYK2PLtgbIsr+WVBhfbC9Y77ROS0CZ6yEtoqfIq6SHe9h+7flNlGPKjpF85z0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxujEhIuc2gKMPqSAgWjZFmkWyYb6rwcLRgjEH/q21rve+uDgIw
 E044g4LAFeE7I11n7HHos+zG3tV7ILzwgpOwzLGiaPPvsDlaPp5DTVnV4u588i6ndQbcNb1nmjj
 MVRRbAkU+fHPLfSCc8YY+Y8EYLYoFpiL+1K5VEmU1DdudNe7NR9cskC2kr14BFV6GbvsmppA=
X-Gm-Gg: AY/fxX7Qe52cL1hGUHPQtURn804gFkZ7ShkKuF6f6/mBUtdDcJ2mxMD3xdxcUc1959l
 G3q/qxqRRNE+8NFm0aw02I1T4xHOBj9sHKTtsG6Ro5r/Qf58Xz4xT0pAk8JvAXTqOovcG7o1hw6
 YHAiFmthpMNLO+AuXjcwFhcb257gpFh3EQx3vtSh7CRLsyVtpjpYqrbBH3oHUeTC+crUGvc3qW/
 X7eslR6YN3RiHDoMPnVEh17bIRUKy6G4zSE2/538YBsABwxnnBxwVAU3tp1dIs4Oi0ves7tcHsZ
 dBFO/sHaJRBdyAfp1IIYfHsCFA6P240P6XIuM/KvRj4GQadoVGR2DsYWGvqdbTEko21cSoinmtl
 MheN7fIn70MNHmk8elvN1FL+WzL8WlbsFrmE//+Pw8dAcsbUgazwI6iSPKweu8M1nIIo=
X-Received: by 2002:a05:620a:1aa8:b0:8b2:664a:309b with SMTP id
 af79cd13be357-8c38941c034mr652183785a.84.1767862703422; 
 Thu, 08 Jan 2026 00:58:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd2KU0rDWQ/R3b6xYRGG3myKrYnDS3p+KmuStEdvZ5CG3nEDqVpppZIpNi/G/SxwTUg47LCQ==
X-Received: by 2002:a05:620a:1aa8:b0:8b2:664a:309b with SMTP id
 af79cd13be357-8c38941c034mr652181685a.84.1767862703011; 
 Thu, 08 Jan 2026 00:58:23 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:58:22 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 07/12] drm/msm/dsi: Add support for Kaanapali
Date: Thu,  8 Jan 2026 16:56:54 +0800
Message-Id: <20260108085659.790-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=695f71b0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: udnuIpcww8tUvl_uCOl12w2RH6P9zHnl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX9SdunT4CdkAw
 XB8KKxboAcKxQxlLrplf+qzOhbOvaqiniEfCPeZaNaAYCql5FP9r4vaPg+l93bjChrwM2o+0E1z
 Xy4ddhZdhR8YqsfGDLV5FDvh7yKxGGCETH9mikw2XjAEjhG/nGLiAY0R8RAxSjeFYFoPVgXDlGU
 pqg5TUBV2gHap83qabjhZRhAOc1qs8+DSbcL4rrRTGLnssoDf0uE/TLvpWsx2JFz81YUE9jSkO+
 uIvpfnSP2V6MsSTsXe6tyiP7bY23WxUteyNNZoqbQJjI4SsBjhIZKYJLl0982zGTlNEIpR9Ac4W
 b5wb+y6l+TYSX3k1J21vV0uvg8Y4LecL6U0XtOQ3rujYISu3XIjwokPCUycrXo8kWt4zHP0zVPm
 fO2+xK2yJ8S7SBtBS329UzCwaHNsAmNg8etBYm74RIT3N32+8U7bfStU7XWgM7I0uUnjC+gUTxM
 DBzR9LM3GVKziwsc+pg==
X-Proofpoint-ORIG-GUID: udnuIpcww8tUvl_uCOl12w2RH6P9zHnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059
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

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

