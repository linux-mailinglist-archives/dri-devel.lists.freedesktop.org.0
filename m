Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E7FD2D2CC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E703810E809;
	Fri, 16 Jan 2026 07:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQqDWGfb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJqI5qBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336BD10E0EE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMd2gD4101603
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 db0LO5TJ25DmrOL6OV021nIeGeKQkcenwFXwq6LGlxE=; b=hQqDWGfbUqLwPJnY
 pZ23wCGv3B5oWCgT3L3NHYVrItGXl1mJS7JQfV3+mQOiUu8wXX5XIYg69WxXxhMO
 L2NoqwvuahVyfDdKbZlSaAQsRT1CgxIYghV9t6wMmc0rhi2SEbY+Mst9TaBBMlYG
 7zLy/PeiwxB8R2cXYfsd6JZAeNH6gw9/VidiaypZhlyvuU3ZrmbTRb9mH2ox8lGN
 WuzFM8YbKaDM168fnM1tidPzZfEP8XWgqngkv510HYC0rRmP8WRhjFp3g8Y9O1Tp
 o/Sv8ejyW3wHefhSL7HeOGXP+UWkC3gebRL9fGweMZKnbG+1JffITWVwEbo/yGea
 EQoONg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq97517fe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c5297cfe68so349290285a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548473; x=1769153273;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=db0LO5TJ25DmrOL6OV021nIeGeKQkcenwFXwq6LGlxE=;
 b=CJqI5qBs0zNkUrMruW6v+Cz0wOF4A+PoJEFHWmAPchbA7ZVfjYtGCjREtBQKga4+Fa
 Ro8Uvm9OeCmc25Kyz7LBKgLJnZeZoM1W2Igv7/KKA+p0mZAFX6XmWPnmjI553kNyNa5V
 WOUt9SqDbHG7caDu+VTWGOaNLxpa/So0QOOSjj0wHdWFtJyml7FQWDrys6+ijz6J83N9
 6LAtzFYYT/cvblcIiXeYbX5QA86HffwXJ+jDst/AR8S1kP5OiUkLp7uZ0yQVzD+54UR3
 MQbpjjFCrIMQX8vGfVgdCPITlh0BiciKAcGEA58ChI0cRq1g5Vvn2hvFFs/DTtmQ+zdr
 34zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548473; x=1769153273;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=db0LO5TJ25DmrOL6OV021nIeGeKQkcenwFXwq6LGlxE=;
 b=DQXWi/0nc/LEHXV9qQzTvYRf1hypUyqh7qakOvuoHcH0f4MQ6wSiWKcZuTZbWWzrvf
 wtnJaXg7CW6Q/lewQhjwFidB+bSjBvLd/c3UhtkAveR9o5sWetZpIvf4jo35EDo1/YOY
 KpIfLUFg/byKDH3Ln7thiQpweXysqIhfFE7JisKGhK15GwT3U0sLpi2WaDi7XDJW/fdO
 i6spHAYCrxoU7UpB9v+KSGkYNKb2HpyJ8c16F6gcfveCvzR0UZVJ8A5XSlrMZe+MhLeJ
 UzG+zXectLOzEdG0ABMdAyhHRpaCVUizR+rsuAB/Wl/9e7PntiyJwpOX1H2So+8kTd1G
 6kOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7NvH9tIQ8Nj7rzdk0xRg73Sks9GKR8rcJQcu+Swf+/pp1uvF91TBWMVwnk27mNc7Vf1uppfI5wyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEprnWdGzuxlYFeIWjybHSWHR9YBdZwJuC1Q1fSoPXh0hwl4X5
 k8gF/YzpZPMj0AVgK6WM3zgJeoIbywZNqzEgUsn/UZNQthx1OVRAmry6VWjSQAzbzkigO5RqEt8
 D4Ne2YXP3mbNJc++wbhbQEcxOmqfI5ox4Tok+k6E/6wIo2r1wWkKagBqI+F2AipH15gZYdSA=
X-Gm-Gg: AY/fxX78j3pBXpCsTE0i68slWygvmrU0lGWVgOMnz10IEEUnCH4MUT9mjJETJ8V9UCf
 TrOHto2KFAxeMS+vV4+MdjhWGpPjNePFw6cxIIbKCnv4MjSw03UR+grh4xBd8jQM9/riNHZLUYA
 xGxpiGaQGDDMlW68ihuucEkZGSSDiTrn12nKk7Htrfx2gpeyKRQbxWxr0rbdomz7GWRiHC9c3s/
 QMhSSyerLTzHU5BmEzANUZihvt1a7P5NkJbefpAfzC/83m2EyR9dKUqR+VeFn0safCBQS84JVmw
 EtxT28fz+AsQNcuL85Ujf+LXqUI72K9xO/na7JXv0Bk3sDkqhj9iUz0ab+p8wr/XtyvhoJ4ur+K
 ZQo4icjuZ9VwRjuapU9oIkulApMWB7SCw0GuBm8XONtBjuSikspv+gYo9SoFZHJU9SKXPrbM5kB
 sneNoXb/VaBiSU8RVsDclARgg=
X-Received: by 2002:a05:620a:1911:b0:8c6:a626:7353 with SMTP id
 af79cd13be357-8c6a66f3916mr290555585a.20.1768548472730; 
 Thu, 15 Jan 2026 23:27:52 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8c6:a626:7353 with SMTP id
 af79cd13be357-8c6a66f3916mr290552385a.20.1768548472243; 
 Thu, 15 Jan 2026 23:27:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:43 +0200
Subject: [PATCH v3 9/9] media: iris: drop remnants of UBWC configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-9-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xyHoBWvZZaE8TSDb+hpDqTYRq4EajnBdNLKjYQl12eU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bmi6w7SlOnaWcHhiZNrNOr3bCjMa1l6yfT4snmBr622
 m+df3zsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBErjNwMCz/1N7oGNJ3v+De
 9c88ET57THfk3uCfcN7/9pyoeckCaU3u5xuTHtQzfZzTsylbdnt5w9n5119P/NO1pC3x+OqtZbe
 cstJallknrfLlerlFbc0K1lK3RY7NB3VcxMr/2v5XTphsG29a0T7vSaGrZ6TAug2xq/e7HBBu/G
 axffq8BWoBL+qdGXYsKw89LF2spSP5x/3LpJag2uQvP91OKaelO5YHr7oU5+aYnxBcWBtSezBn+
 adIudNyszxuvd/N99O+wLiEY77OpFsuQSkm0VZLc3WeJtqX+Tzh/BFR2+zCc4TZl3+9i2ZGi4Np
 vfvDTct05ve7PmSb+GLaVeeZgiHLizIcZBvjv81rurUIAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX28gvybTZDyxc
 nmJoPgZwRIxwWG84xRq1vbIhzJ84wbgpUfofDkM53o4UctATH4cjtAozaw5ZP2rYNnRLGD5g6Fk
 4SfD6/LNLpq/ie+bTXKJOqDuZqNLSTuWrW+/YWYPrr8J2VCmjDF2/uHCYKhFQZ431fAbSidVxPt
 NotHLcDg8VQVDPOXvifXjcSHF+Bclo1c1I3wZJZrUHF65iDgTom5Oz6kCMwS24PcVnKpL4XAqvc
 prtNW7htCcO9nslo0TlIP/EfG5vf+y1QAXgzO7VYbsS4x9u1QB78Vqdg0jESUtVnIdht16b2ehv
 eHemuJLbQwop+vkLJ2/KJJQb5c1rgvdFHWdvzCGW2yqPpkmqeGKABpnyOIgTg9gIbW4EDwY/GXz
 AMjRepVp1kukDzP+EA4Ikb06Lm6p0jg27BBVJrDA2Tll/i639Wzi0X8qeACRyuqZ6psCViPBbk6
 PEohotqqySlDzU/veUQ==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=6969e879 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=oxqy8SEdECjWQAwmsJkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qwPW-ppJG-Omqj0ovA2OObXx5oStjvT8
X-Proofpoint-ORIG-GUID: qwPW-ppJG-Omqj0ovA2OObXx5oStjvT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057
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

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 4abaf4615cea..3b0e9e3cfecb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -71,9 +71,6 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
-struct ubwc_config_data {
-};
-
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -218,7 +215,6 @@ struct iris_platform_data {
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
 	u32 hw_response_timeout;
-	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index e78cda7e307d..5c4f108c14a2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -631,9 +631,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
-static struct ubwc_config_data ubwc_config_sm8550 = {
-};
-
 static struct tz_cp_config tz_cp_config_sm8550 = {
 	.cp_start = 0,
 	.cp_size = 0x25800000,
@@ -760,7 +757,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -852,7 +848,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -934,7 +929,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1020,7 +1014,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,

-- 
2.47.3

