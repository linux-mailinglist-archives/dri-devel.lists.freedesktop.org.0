Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B9BAB840
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96A710E4E9;
	Tue, 30 Sep 2025 05:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikP0pt55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D020F10E4E8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:49:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HRXP030612
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ThoA6YgpQiOg8S6pzAMpUUDGjl1Y3c4vNGfbI/06aRg=; b=ikP0pt55wblcGL3v
 pJdyHoy3ltPtPgHrg7x5YK6wk3DZnBbZtbTCsNBUpJASn4/yOXv0dSU+AyjANCxU
 nj/aqmoiwRw9ENISV+v+QDdK+bU3eR9KNmDaVc7DD/RdkfShJVCcO9nipftiHsXm
 13INjcakMMRUtBMqP1DgqeI9+kZATrrlKxc9Ra3u45YCrE8nYExt84+ffuE+tLe/
 X7E2eKsBvYJa+KW/BAJc8QYEGkRtHAMSvTSOYNiZUWyW/UTCPlPriDvG5C6JE6/l
 XlbrlmdTY4P2JwqySqHhWcCr9I+vZD20L41kvtGuFP3H6xqCpeva2QCG0BzFBBw2
 wTh+ww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdfjm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:49:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b557abaad02so7411059a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 22:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211395; x=1759816195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ThoA6YgpQiOg8S6pzAMpUUDGjl1Y3c4vNGfbI/06aRg=;
 b=R5HTpjqhwo+FbqKps0b30X+pZGfV1k21hsNwMBIVvvjAfslI3/pFTJUicuiufuZaCc
 1tStq7KKl6rSmUAThwwtHxQ29vvkLaon/aly85venVLtAjxT7poTFRWz+RX2uQT/r5Ic
 61rr4reCOjCEM+gFcl4HYPf7pI9SRxuHq/2FWfiNhWXANhO1QrrOLHmj9TWvBFE9egnY
 EI8AS0JfuBPQ6ayzWw3QdQiEUC3ub2fFSTi+Zd1XquWEfTogaZRzV9E8muqWVCz/Oe/q
 3p5Zj7Lw6AuEztFk+HO1xKPflZZFFQexT6FyojbHMRMyf5IUZv3PtBGHBLY4cxiMYB4U
 ng4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvru3feVQ+T7xCzzPypITxcsFIjBhpv5bryglA75KmJBBKiWWD7w8DNYWc0noYy0xYoRCn9RhUdug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg6hPPfTHisHqUOeED3j0M28tRwra6ozqJU0O4mVgbylATzSc6
 Asv7fCI2B7pMts41J8R6u0G/lWW3bPxhKixKfvX/g/E2IKfh8nleymjedxIHeNE89Ac3wMUkjDa
 WBOvsmHDd+/1/gBHiwSJzX4c1eXxPdU70VtXVMzZW7nQtDCuwEpVYHQ6qoNmXRhcQtfCwYJk=
X-Gm-Gg: ASbGnctjK0gnqwBDdENsEYk7Vn2DYC0t0oAkk0gOQPF/U3IlvAuKhFUAhnt5SXUQ3cw
 mfCIFEfKuWjX7uolfzI8Bkwos5uVEZn1PBlIs6QS9tEDl1KsYuglSYmXbzeyLOsCMYx0tcVzRqg
 g+jnAca87LpWHKhTUw48JudzMzEtaL9N3tQ4w5i91Dj2ofceLsIM65izKt44lL91qu3qS668zEi
 RUMweGxp72h/bA9LMcPPWYe+ohOFkTD7LUbIR3r0EWa5PzYPDqhAh8H4nBOVOGizQhzsHRG+fl5
 TZGpbYiU/DCexRnKOk7Vpb7ZEPKrUwBTG+e78cfpS+q8y13wBGbLJwl0apz21ih6W7WdnA==
X-Received: by 2002:a17:90b:1c8b:b0:338:3cea:608e with SMTP id
 98e67ed59e1d1-3383cea6105mr3192206a91.31.1759211395349; 
 Mon, 29 Sep 2025 22:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9p/WsjalDYjqqBpbBM4tMRq/jOyQCCf1RPlU4hhSKxmGGZ3ERYmjP7ysuZxVehRilUdsXhA==
X-Received: by 2002:a17:90b:1c8b:b0:338:3cea:608e with SMTP id
 98e67ed59e1d1-3383cea6105mr3192176a91.31.1759211394945; 
 Mon, 29 Sep 2025 22:49:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:49:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:06 +0530
Subject: [PATCH 01/17] soc: qcom: ubwc: Add config for Kaanapali
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=2182;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=rhJzPiPQh5PalUiLaJWP+g6zLitXs96Hl2pwoOg/lyo=;
 b=xbW+/WfyGkVXE9qGR4vL2rV53p7Zg5bR2EqsFaz4PwejCII1l2bWl8VOPhhZuVJqksSfryW49
 6muGlSfGBPvAAZf7W+0AB1ZWW4WLIyqkaz4FRTNyzyZnC7VOG5a7jD3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 42AEWIoB5xnlpeCBfqNW7V25b9H95jvn
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68db6f84 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=HBDVfrJ52KAmvMVrQVYA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 42AEWIoB5xnlpeCBfqNW7V25b9H95jvn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXyO3Dc8g2+0ku
 JeRq0VdJl93WbNmbL9t+wr+zDkDwYOx7qD7DPGGYwiOi/rdAmuQXnxr95mgS7YIOdi0PJLtRMMv
 MWz3HlmoycLRUPJK0CQyFvG9z8ZAmtoYcqBO6urJ5/rZGaN9y/1sZNRua6AzynY4zoyB0/mNQ8k
 8N83Ei9UAfnk1K22Zpf0h/5cuOR3h5ucsNifsi3/sfNmZBKAY5DPHzFbTaG9JyM8q+RdYdWzgnv
 1xPdb7HnW6XYPjiSgbaXr7d3EmpP02FzOBoBEZLCxIgpLZPsKNqa2aVmGwEu+ZHhZ4TsIg6CRww
 Dbq5SNMCqAHZ8cuqnuI81aaoS6lguFjVtN8RvOwRy78KzjXuGnBuBxiJTILT7a2dWXDtivXbrzB
 5MW2yZCJz0V4SM0tpfQB98B81HG9wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
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

Add the ubwc configuration for Kaanapali chipset. This chipset brings
support for UBWC v6 version. The rest of the configurations remains
as usual.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
 include/linux/soc/qcom/ubwc.h  |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 15d373bff231d770e00fe0aee1b5a95c7b8a6305..48dfd76efb34319b3cee29894ee4977f105d890a 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,16 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data kaanapali_data = {
+	.ubwc_enc_version = UBWC_6_0,
+	.ubwc_dec_version = UBWC_6_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -223,6 +233,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 1ed8b1b16bc90bea2ed54586edfe21beb2db04d4..0a4edfe3d96d4face2ef98622984c66939a68c53 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -52,6 +52,7 @@ struct qcom_ubwc_cfg_data {
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
 #define UBWC_5_0 0x50000000
+#define UBWC_6_0 0x60000000
 
 #if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);

-- 
2.51.0

