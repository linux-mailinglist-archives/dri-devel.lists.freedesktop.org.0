Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B2C5FF34
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 04:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA7110E00B;
	Sat, 15 Nov 2025 03:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAWU0XNi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpJU6huA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7155A10E00B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:08:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AF2C7pl1474213
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=U65TdZ0xWh9RTPUOJQQdTg
 JX0pVxkPF+VkIbt7jf5ZY=; b=RAWU0XNicy2pzeWvhi+GH8iUklYxRBrHGlITlP
 In1P47D7RICMJOAHNrspvyOSkViaQ6ui+JklEhXF7C1+O9FYl+YWfe+bcr2DpjpP
 Qi2u4qSFEhCMCL49BL1uRlIJYuKBsmtij8LdhNNk2q6lRxDRjqkOaVwocZboC0hm
 RUDBfOCetco35fIqO15KPz5OdcyEY8AkpDHyaGYjeoVY1mT9+V6uv1aAW5zGqQvD
 noKzpLwjdkFy+TvJaXqpEMISe/VmhC1OZyOaFTaGc73aptncWjfPuNJ66dhsJYU9
 cGL/rTRxCGrZ0GTkHJxkBP2wFhQI2DJ9Y2gaJzjP6A0mCkGg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aegh602w7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:08:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-880501dcc67so24365146d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 19:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763176093; x=1763780893;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U65TdZ0xWh9RTPUOJQQdTgJX0pVxkPF+VkIbt7jf5ZY=;
 b=jpJU6huAE/mAXjbpmbp6Q1KufKHx3UwdxjIwfKnaUlJGXqnRnQAIoI1QAdeojn4aME
 /JO2zPlQRgvmNBbUGI0YVxaTS9TACEGHmY5gWPXcS/07ACi7MgTPpxD+kZEocTRokc97
 vytJXaf5Ve7Xtjn0Z95ko5Lc5JYl7gy6UnK63SGKIqzDyVpAvnPY+Edx2a52PwV5LybH
 4BG9+vidRc7fAKbT2opYp+QRQCWhkzZmw9OplVr7dyLhDBWqtkPAr4tTYXmEueff2F0q
 FC/G38KhFc1RkcG+XOWKU0nmyzI/tk83jnklR3TQt7OpQ9r0HvmpYue+JD6WlL2F+XZT
 cQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763176093; x=1763780893;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U65TdZ0xWh9RTPUOJQQdTgJX0pVxkPF+VkIbt7jf5ZY=;
 b=MCyzeknqocIEYXPyNWiauMo8JUIUmGaIuuyTl23SDZrRr5sQg7m9Sn00UorNF6prlT
 GuNCQfmzhdnaMKIpGx6WgsQ+iF3nz8MTy17iCK1j8KmCypdM9LUWCYOdtxRre694/7u7
 yVh5wfRmG3Xc8NlL4qW9SmavlkPiqdRyGnJYjPWazBEojeggWiIc+FRUHFfCgK+bZHI7
 LSPXcF3oXWY6vbD30RobsKyHQ/Jx+FGjxSimcegybtEfNiDScIx+oj1qziQFFa0TqBJP
 A15WuM6rRRRaB41sLPaSbJuGoFt9suB+ly58eFXARD//qSy1O9NjeJ1BncDsvluj9IAk
 AqBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg8EPDpVLsNtYzHJ2nlTFDmcjKJJkOmJwEzthYq/Gx54UbjxFmrE+07trXDqul2SU3t0UwhO1nBUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjUptt+zpX4RwG3oKU+T6vfR9L00/UgZAvtq8l7oNnVB0PE38M
 uQiuCOo1dZbJQ67rRCxKxg+qLABzz1C5epAYgz/KJb6K9j6S43TLH5yAx1DSYnfLpmLrqAXDAeD
 XVVAKyByeSQad8Uei5oh9i2yZqHFbkHawiZQrcSOeBnG652YyBvdMVUyCqwk7cG+yfBcYoKg=
X-Gm-Gg: ASbGncvnnYi4BINkd2XADhy3jpXoRO3IC2i8CsLzRCDqIQTQzIggiXqyr/vWz3C/dgu
 TrCyrHuLWTUncbAglL0CQGBnseFIistU0otzmktGA2Hh9ZZJqCSYa0eiSfBl1828T1Ojgd7o+2L
 9quEdZw0fRb7Ob+1BkX6f5GtS+VBRpBcezKoY2T2KWMl44dKWyr5QoMEsM8V9Gc62ZjGCT9stha
 a3Lz/OhFJ93rQcWXBq8cGUJatHFzIGuUJ9IjnS7wBn/pIF8e1aLIFJTtNZAwxcZAsrO02P05lLG
 qY4PYVuZiDCPslVfz71vlLlgXy3MPVVUMj/7ACdJ2OWUOx3NSayJ+UV30GCCrb5FdCGXdDwLjxP
 oVQwFfSsk30D3H7IZ+ll/y3ClXqefY8i+KDUblDktgwT/WQJ89OaUUgeNuYKvX70VZA29JRo8jo
 JY8za/ZL9EUwcB
X-Received: by 2002:a05:6214:d01:b0:880:51ab:a3e3 with SMTP id
 6a1803df08f44-882926e53a2mr72211626d6.67.1763176092597; 
 Fri, 14 Nov 2025 19:08:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETRNQmWX8aGvtyoUqPy2210fEEuV0gG5CavmUUbG/DhynOs/idqSmfZ0BxhEj1o5mR+Mms2A==
X-Received: by 2002:a05:6214:d01:b0:880:51ab:a3e3 with SMTP id
 6a1803df08f44-882926e53a2mr72211336d6.67.1763176092032; 
 Fri, 14 Nov 2025 19:08:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595804003afsm1470162e87.71.2025.11.14.19.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 19:08:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 15 Nov 2025 05:08:08 +0200
Subject: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJfuF2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0NT3ZSCUt20zArd9GRdS2PDtNTEZHNTcwNTJaCGgqJUoAzYsOjY2lo
 Ac/x6PVwAAAA=
X-Change-ID: 20251115-dpu-fix-gc-931feac75705
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Federico Amedeo Izzo <federico@izzo.pro>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ar/QIifOQLCAoE88Y/UPeNAcQ8ZidFpXscg4CHs0wGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpF+6aIYfjo0upzZFrpTKA6w5gwaS8l/xy/i+Bg
 XtDzufUWqyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRfumgAKCRCLPIo+Aiko
 1a4SCACRd6VY2fRsbqKupUjg02if9uHDZMa1MI2Rl7krml3BiE1IJahoi8BOkY3tEwKN6oP+XFE
 HDmVMgWp+LJLImUqHSeoe/QvRjgvoZpq2piGjKWFuuSMsA0LHLIFTDkfKEURPqDIGZ3YSuChfbn
 fuqh/6Kv7+oBml+JT1uNL3UnL4MzG0JjE/hcNBcou161YO0eLGnRwAW6vcG7IU9fowU7cktvB7D
 HcixQQZLA/KwGO9fKVaiHdEfQ+400BUDzbwTRO9G5oMAzQoHVC2+ywnPt1p1AAujIUtwUA/FqlF
 ptdWiKrQHXo0G2VGV0b0weiVkUmu/ntXrC7UQ4GrPffgVg1F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=U+efzOru c=1 sm=1 tr=0 ts=6917ee9d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=njhVRvNgssgpu8VHMlYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: rgtlqSPt0uqXc_5hSXYZ1YWcIqap-fJa
X-Proofpoint-ORIG-GUID: rgtlqSPt0uqXc_5hSXYZ1YWcIqap-fJa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAyNCBTYWx0ZWRfX6k8ZI4waybSX
 7q2s2a9jvNEvVrGKSW94znnukpCVuWi/9BQcyVIa8SdbErGc2B/+WK8tac4kNutSq/46TDNxLE0
 pAjvab0Rnt4QylCMQ92DONvuEMIVsR1euKX4j8PfiWK2JOhqC/cX4Oz99D3lYoO7bgP0Y++WK78
 Y9Cv2jE/o51+bkxpz5URgmVr9SNT6pBP5WcywSXObJ6DDPYDCqvSCsX36l5u5cZi2NlFTnSn0nU
 mbPPOgdHBzxpjG6Qr/JSLH7At1w+JJvSc8aAvLcKOelut6PEFOko/jbRQYmPk1E6S1JEvlyQtiV
 Eot2HX7oybzKLBWgWyUt9Q1kh3eVucQKOdkee1Y0K9Db3wbaq54TN2ELeVLoFP1O68eUUZW7val
 1KS/2m21DSwjzbVvjtUHqYL5u7721A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150024
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

IGT reported test failures with Gamma correction block on SC7180.
Disable GC subblock on SC7180 until we trage the issue.

Cc: Federico Amedeo Izzo <federico@izzo.pro>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Most likely I will squash this into the GC patch
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c990ba3b5db02d65934179d5ad42bd740f6944b2..b6415adcea10126fb6bb29d60a9d4159052a61ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -103,7 +103,7 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.sblk = &sdm845_dspp_sblk,
+		.sblk = &sc7180_dspp_sblk,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 23bb39b471b71e3f313321ad1c7a6bd4d2159019..bfd34368a03641651530d9c564a74d2e9398f656 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -389,6 +389,15 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 		.len = 0x90, .version = 0x40000},
 };
 
+/*
+ * Some of Gamma-related IGT tests fail on SC7180. Disable GC until we triage
+ * those failures.
+ */
+static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
+	.pcc = {.name = "pcc", .base = 0x1700,
+		.len = 0x90, .version = 0x40000},
+};
+
 static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
 	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x60000},

---
base-commit: e2f085ab8636fae2ebe0adf42071e7558234cd7b
change-id: 20251115-dpu-fix-gc-931feac75705

Best regards,
-- 
With best wishes
Dmitry

