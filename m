Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2FCD5903
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104E210E5B0;
	Mon, 22 Dec 2025 10:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIWJPjhN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfVanzY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3830F10E620
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM632uN3106883
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
 8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=eIWJPjhNJyZytoREYhgx+ouckqp
 DCHlgmRAZ1SRLAd2ngZ+6zmQEOtKVGk20nPC1bvTfc5IiBqBeIGZnSpLQ0VDzp5m
 5ShQdGAwFXvJchl9lVSlyDmWzVFs0vuof7uymB1AQ/ngIy8EyWyAEMjPwWHDIaUN
 BFT8UiyZ3o17hsTdM6s4j5urSpYwtFuVYgcFfRnbWqUXAZaOZRU/IAyf4Z0g8CbJ
 ktWKy4SHuT/8Frk/m7Dv1QMzxQiCYrxFSeH033NUqEeFlOKfpzhACQyHA3yBKdZy
 w74crMy9fubwxektUlBuoDEHmKcnvD61KwddFL+L9hzI7JCaIskLUeGKZ/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmmyb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee0c1d1b36so107804441cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 02:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399113; x=1767003913;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=QfVanzY0vcQc2rIrtpsLfu+zFEXa2JEg1TMEIG09EUjFz8DH4/8PlQ06H9F64bokhF
 yJmhoHf9mbEj53HulRViVvotHJRqX47MrNtAbWZqeLnawtpu6aVIngfjwzF5ASxsB0Ac
 ljhkWZ4MrYaP9DNDEayoVoTu1hJgtRKXXXJdGa5NxPTLIMFGEdEYfotmuLmD6lveiucy
 h6VQ5P57txLjbNpaXoSFKNYnlLvOkQ5NoErrZTxRnVlpRZRIlFl7gQ1X//nhzmY7MBb0
 C3IMEf39Pi/MiuSLz4/vI88nlYaC4N5QesVUgtEPKYbOg6t5IsFkmnGDgVJCdojJgzAU
 T2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399113; x=1767003913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=fVtjgVT+M/CQU1YCbnBXKbl4v9OpDXEHRecyBhxEAINtU9HJpzgdBWO2Iil3t7UgzU
 YEsw7IiGNk/eQ70fAaxbveWnEhaBaVxMnnu5AP4MtZ/40udyH9ZbtyfLdZaWfXzP+h5M
 doNkF+vcf+QDn8QIDQus0M6ttqB064s0ExPHd2PVCv1MkAwxNeLxLFoT4xnM5q5sshjy
 z+mpskU8AE1Q54Lku++qh/r8YKZOf+jygcP3xPycYuq/S+MsNoVzg6VOV5bEwSA1YYrJ
 eBSf/6XSHuTuR3n5PQdJ5VB4cnjbGGXKwOQ3V4p342FttabkoGcBZuH3O0QvkMEcC1ZE
 v9UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+SIIk4DeGQ6jHAeeBHkj2kA6uH4rfuaBCRiMNoMUdyi+R5HrGFbKXggy6oTy91R1J7a5zBoEePpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbW12rxXxAqXcbT7H3uCpNxa2My1ofAIJs7W76YBGOQ8/OfRTo
 iJKICzJGdQlL9Pp/YlWqjNr9Dn4wPS/LJ6AeYgoRgUFQv39SzXt8TQ+6Hrk9/c7jO6u2j2aV8HR
 S2CSCGn2Zkw8ONC9WVIpInyOCUKCJL+sjZaiUWQDb8KTAihLbV2RBvcN5Of/sKYvq8ITdAho=
X-Gm-Gg: AY/fxX4ikL0O7fHhwAlj/5vKphww/PYi6ipUx4kX0xXX8sFSFAYSbQyXtRn1/CEc985
 wPC12B4xkK3RnGTmmkSwG/5etpPwrfF0RA/R5WroCGRjS1uynQSrrpQbMKcYOMOmCaD2p+z5Vj9
 V5wYQlohNXQENYrsuptLWPuILaS7rUcBKAzkHVW+jsK2qTK8e84vYOmyOls12VGr+NCsh78tX31
 EoK4NNN9OcaS+m2XZ7WUNjiYHT8n2QQzbq0hEi/WjsIS3sEG7YayuYXzoHGPWL6EVErzd3CEpfu
 WJUKpa7YGnhoOMbmibKDWrYkabVAlG7f05AmNq0//QRY4F0vMWXlKRjA9XnHDjhUrzH0hwLLucb
 FPjcs3oS12HLn6BNOFUs08SMi81++H5sHFYWDMMuuLqviF6T2b0jjCyO/+3I/UzJSsDc=
X-Received: by 2002:a05:622a:a0f:b0:4ed:ba4c:bda8 with SMTP id
 d75a77b69052e-4f4aacc4a8dmr146465791cf.18.1766399112791; 
 Mon, 22 Dec 2025 02:25:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuH+UxR760LE2LGBvlVBLqGJgZnX8ihzwwMGi1X2xSzsKDEWstX1Kns6pjYrJIRbxWZp/pCg==
X-Received: by 2002:a05:622a:a0f:b0:4ed:ba4c:bda8 with SMTP id
 d75a77b69052e-4f4aacc4a8dmr146465621cf.18.1766399112402; 
 Mon, 22 Dec 2025 02:25:12 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:25:12 -0800 (PST)
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
Subject: [PATCH v4 07/11] drm/msm/dsi: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:56 +0800
Message-Id: <20251222102400.1109-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69491c89 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rJZgsqZRg-JpdFjFoMo6S9SKGh3CAkIl
X-Proofpoint-GUID: rJZgsqZRg-JpdFjFoMo6S9SKGh3CAkIl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX+gSUfA3LgjAJ
 Ea46USHnUjgccvFVePieVccH9qdhIT8Y+DWEA87ZgD44APo0kb0wq49yKueJqE1VqzsD6WcgsNH
 805XgDHfKblz/xHIsac+Qs3jPaGub39GyMfFjuIvy0wg7lM4hJq2K+IjJ+RzgdNq1kKqSGIKyeP
 R7NGXujKfm+/9bMPPsLR54CeZ7zqCV4UmeXkcPFNKva+G4e5EUc/xgrRoKXEIjfZQWtL2aII4Bg
 TsN1zmR1exuBhvSFfh/N0mnF+RK9yxpDVJ9QOxg+8y4qx9qDdwG0futYG9SH5MEwgkhTrezjW/C
 MC9Hv4xGIEEe8GbtyD1BLizimXddfFiUHOF8YWoibFSOzBZr9VuTC5xVrFM4Ljh/BsKmsH9eOIA
 5GnkK4bugOesF7801UnQvChPL5p839/TXxLRaQ1QD3aXsvgTzV7Y70wva6ftWrM0+4UO6nVdUOW
 MW4c5DhSrJTk0FuUfNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220094
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

