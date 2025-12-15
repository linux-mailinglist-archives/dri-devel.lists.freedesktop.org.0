Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F3CBCFCB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 09:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860A710E3A7;
	Mon, 15 Dec 2025 08:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdLNK5jD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTYnZiSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9AB10E3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BEMhtfK3680878
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
 8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=cdLNK5jDp8TBB7djLkAZ6HtFZoW
 WTej2mBmm7t8tW9Je6HRuT8zUzvjjl/E1dCsS+jz1SL8gSIVj+LBa2gF/tFSzOnn
 gnKYLsH7/g+1ybTm/TQyHPdboHESWBt3nz+LVX2rh+yJXq9lCscolQxx+Rus6neD
 4GQ/HItzF9rWj+WdhnLzSHXZmyiIfe6vXtpoSmOUR3QQJIX1nPgIk7tmvPTE3SPq
 iBXBCRec+Cr7zO56HMJHb6pBYnHiVh3DYmaDCnDnJkPHS5APwMbzxjGEiarLw3ua
 QCWXir820zTOKa0IHrdXwJKQzq/T3QDgYULHlDUvFaRi6SKCxO3ZuUl68+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11a7uruc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed7591799eso73735911cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788046; x=1766392846;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=hTYnZiSJj0vZdMK6bGyu3A2lnbhfalphlssG0DID5/mYwqThaT6dmSU5gLSHmePQH1
 6nIo6yI+IFMiPguKAsA6MM2A5kvMP7PdE4/UYiMAOlNdscq+Dm2g41Is4i7XtRir8S+O
 jqisplbp5668aFIPM2z+5VYqJ3DcRkh8ot1u+DjZRzmyhyBC7LP/QU3N8K3xFE56+L5D
 ygUOK0C7g2O6VQGuETk/AqrjU/RiweYbjyI/GADUes+uynPBB8dDtNF4ggTEXc7slqBu
 67aDF76OIHHifdwfbmWSUSo33fkvzlUwSwpSCRHUgMIf3RQDzNMt3A7eaLy5BnDcC3P4
 cjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788046; x=1766392846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=HMBJCxVWMOad1WU//ivbwSK59tcK5hyICQIXY/1PK7UW7vy5X9b4x4OHOl80ktsnCj
 yD32gXX35iy7XOgV7s/Gpt6n3+Sa/D+rUnicO04kB/TrEPqL4DW6g6YncsA53asUbc6P
 lPOyPTQ7gj4czh9Lx0wVVlSS7S+4JrhwibXJnS7fVoZWKpU1wlG6XvrIRLy83VuQE+ZA
 HHNLncTLRfnv/SyWFyK1nBGrTU2sn0ZTIi+YwPzaEjcSMD5auVGeNlX8UhU/ru3LOCxT
 R9iRdrDGtkfEhGfQYj4aoPgw2Hy1lmgTLWHdcpkd1ftVAQMZEYQAprAk3tcIJ7xfVe3p
 JnKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+A7LXhUzoF36pb9QarI/8HLsBE8syiEIgyDsIp3G6zVXKYjT1V4mfTCCuztlK2ImHc+E8SFClfuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYXz2O6x9Z8yb0H60NlVdE6VWKshGOkaLQKPrDAPn0VCtV7vof
 /oq7fRrEjwbCvvK3T/RiNNt59SDQV6wqyyfGrzdcUQZARgLZpnqvG8/+vJbGg+k7/m4AYx9vHeJ
 3kXvc2SS6j/pvHMqszi8jiIFJQtiIHgtCIzmY1Y0WDNB7KHIySds4zy302kvcUIgt4caLveQ=
X-Gm-Gg: AY/fxX4GZ/7twGnmcXPeGxKx/KBP4sjcCDKPPEL1/wwy6btoBqgHBQmoOp86qSevLws
 CK6ZgdhTYf5mSIz266EwNiESgc0JNi1J1usbqB4MPmMZL/j4sM2fMu6YfOxpJUvRyfFsmMl/0+/
 2lx5cWD1/o7JMLmyAOOrGUIYTTpZ440xxhtAHTeOunB+9DPVg9J5u7/wH7okDwZxyZRy1sfJ4ik
 SkiOIAZoFAjVzCf0wK6/qm+6n1LZCT2N+2zMA4GtECXqsWJSdTX3nh6xkkfSMNeaBMCfxo0HJ7i
 VfBOX8K7iFUYDu5Ah97saZcfSQ1b4mwqY+CwKUUp+H3wfn7vEul3N5lUrIiFKTYDh5I9DZF8u21
 +dr2ipkpR9gLdmBaiJq9kFnOEmHau6XNsl3Zfq8B9R5z34qEteI4tLjFwEeqRM+m2oCg=
X-Received: by 2002:a05:622a:1791:b0:4e6:ebe3:9403 with SMTP id
 d75a77b69052e-4f1d059d261mr122345811cf.41.1765788045677; 
 Mon, 15 Dec 2025 00:40:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkrFIAQoibBowZ+hZ+Nx8U5gIQEDXi5Q9OFXQj88z4ksCGjc3LaNGlfwA9GNy8uOY0+1Glhg==
X-Received: by 2002:a05:622a:1791:b0:4e6:ebe3:9403 with SMTP id
 d75a77b69052e-4f1d059d261mr122345531cf.41.1765788045177; 
 Mon, 15 Dec 2025 00:40:45 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:44 -0800 (PST)
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
Subject: [PATCH v3 07/11] drm/msm/dsi: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:50 +0800
Message-Id: <20251215083854.577-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfXyYKYbR2qzF50
 DsCLzcBp75jLCmBUt6I+o4CNfGAhqLjlSRCvi2ckct3XL6TkmNvTWHOMtoFqMby4B04eNnnRkiE
 cybD/mB03T1nitaAyaVj0TNMqpYIWkEgwAHvJpeFEO7A50gp2eSZcpNNANMDOg9+/GR6+L93SFl
 p+pe6JrQc73fOPtFCfsg5QsNHemujpIApmKlsXuzzQHIQ6Nopbf/m5zQG3gtsNYwa+2P/pIaoyc
 +OC6lgclYhmrMG0MUfG5i6kBsihrYJV0SJHf5tPeJVjtpzxFu3BrPhmgDcEH0bjt4dHr1WaGTSs
 jl/04VEwfs8hBQGx4V+Ay0/heeIHwbE6VG22DVdCQuC7vZ07C0nYSm6zTBcykdM0GPbopLWOke/
 ZZAutf86f7NRZM72Wms4+plD1BZqDA==
X-Proofpoint-ORIG-GUID: HuXDxGOWNeqXY-_uIXNSqOrEoZAD3GgN
X-Proofpoint-GUID: HuXDxGOWNeqXY-_uIXNSqOrEoZAD3GgN
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=693fc98e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072
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

