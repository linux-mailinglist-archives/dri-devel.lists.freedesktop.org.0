Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4979D1A755
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B16510E51A;
	Tue, 13 Jan 2026 16:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJoJoRDU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EF7EfgWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3739710E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:43 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DCX5Y73810382
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T3jkI5KBlBqmZ2HnDU7wrb/gTC/agtlfdGFSMyUfGxQ=; b=oJoJoRDU7g0nU9To
 pAqlFfT+VmgqzUJH5AQm19gDy6AeQePrHTsDgWCnkWVWBFMudpoQgHl4ozDbSVly
 vi7mRXPKjjF3RR8iuqnJrMq/F88ILHp7Pm3P14RqK2olxueHklf3+SZAh0+QBzmW
 oi9HSTKU/jwBhMeQnCpJwMPdwlYYCDHVdDE5j4fm6JLHNUp217U3XNwGSUUZd5y+
 zr0+qGdNwLMv9muD7hgsSkQ2x6Y7kXbMoRCd9M/WwB5PAxqewKFVpGcCId0iAdSK
 rv88DJI3VNHvISszUwN/kuuuO4Qh/6Jok9MX2rbjlww1NEA4cva30xbDsgzxQ2PG
 /PPyaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55t7b9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2dbd36752so1971518585a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323462; x=1768928262;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T3jkI5KBlBqmZ2HnDU7wrb/gTC/agtlfdGFSMyUfGxQ=;
 b=EF7EfgWsz0K5IMs5R2Db47FFm5XQPTcwQYbxb279ir7kokRsEOSYtLnIPKMy46HElB
 rs8VeiprTVnMcwGQTmcWmyKSSlRneJ1uJwsmqY7ecLgiTxSLxAqqFdRtKeKl75No9H4n
 OncCMJw9TC6IM4zkD3Sv/rmbIPJpN83oCN+xwWNvRAzUTcFWxeYXJB7+RfNxeCFDgtsO
 l1eIZaZzDC+/6eXtr+R+IMD+EU7n1L4ppzLo/cYW8JjKbZMZ0/TU6g1qethpvqRu8lqw
 WeMf8Hqf/NZS7R60O0OPB6MrEiby3uXcM/DQ8PiniYfZcwVZRtdv1foaBImfG5ckjnAG
 aHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323462; x=1768928262;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=T3jkI5KBlBqmZ2HnDU7wrb/gTC/agtlfdGFSMyUfGxQ=;
 b=ijuwR3Xw7ai+yF2Q0XcScnSxBVT4sexbvAwmOBQZI9WjjcmKw8u4hpIh71/Qiw8ttW
 uILBNRl+kA+aLsHWVTsDlxsJnNXXqrfNwUpaiVB1ymLdRUBm+rE8v8I9MFO407fQu1Vq
 UFLZR1lmWmwSMY1gbRiGy0zGu85WrcxHpGw5h5Ojq1B8uvfDtqxQZH7CjN3yRnUNRsxJ
 DkUpIJoA1/RoKpaukWgWLGVLkgrmYttbuTMlkALuFPVNGf5jMswvnKtUU1XG4GPzd2j7
 i9n4jZ+L6PRxSxikeG24YYHCmPJD6hnQ35KuksD7Zd45fltZ79va8ixna6/fxV/iioYt
 gcSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXSFBhwYQ1JSktO5fi6VaQDtUU/dI76NI06TZHzGVqSvNhWgDvWT+LVOieRbl/fPds5q2EVIz88fo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKfAUhhAjAj54KWCuv/pjPvT/DgLZNxBWsAAv9gdwC5/sCrVFj
 saVO32TVcZLQ/KYQMiMG4uTHHn25WRvXDStzFWf35Ao9kH4o/OTMBx2eUgi/UwyRLn2X2/hyBcK
 aEzhaThdWKBtoBXoerf7VywEKX1911Rd4A+mHuHhQRAWbri/oWHdbEATDcLyI4s7nvY/bDVo=
X-Gm-Gg: AY/fxX7k+B+1EQneMxBe/Ryhjm8lBSaK9NWwTdmuIxBZTfJ++4Euu9o9KhVSUqzd/Pf
 YlU2hmKjt5VJ8tByo9lpTjbmxWxarOAbFWw0as0zrusnhXVQMiftj0sceAqrpylQu72e4FzqZAN
 Xs8c0sGwfP1H8bqoUfvfscsiOZCehw/vph6bR4pRuy4jH3kx8UIp9x25pdUmMuGPzaKGtNzymki
 bdBQUaURobTkLR3+n77ZeAKAAQPyfbfUctKwQoVeU6dieOL2c9dWIFU4J+ID2KkUhFaarudgNZ7
 oAvV0tTM/Hv8TypPAV/uw5QGtmWq/XKhJ1CJK8TN2LPM+/y7yQZOo38ip4VOUIsVNfpCASQBAI0
 bxNmTnUWCfb0hy7xV9YMmpcBi9QohnnJgTxRFPcuofV4g7pLwkGE4sWNQ4tuZXuplAMwm54ZSzY
 SYrL3+jjkpKGwg07bw8SHNnw8=
X-Received: by 2002:a05:620a:3192:b0:8b2:5df1:9341 with SMTP id
 af79cd13be357-8c38940e76cmr3076018685a.75.1768323461699; 
 Tue, 13 Jan 2026 08:57:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFixxGv4qvV/C3gFxLRBxbhyay69L0agbIGsQIgfJHuYPpY2Dfb0r4yCe+MUS6dHgi/ZThQ7A==
X-Received: by 2002:a05:620a:3192:b0:8b2:5df1:9341 with SMTP id
 af79cd13be357-8c38940e76cmr3076013885a.75.1768323461140; 
 Tue, 13 Jan 2026 08:57:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:24 +0200
Subject: [PATCH v2 09/11] media: iris: drop remnants of UBWC configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-9-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3161;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nHRSUklijPQc2jdlENh96HtWcCH+DpPknCnBLECuzqc=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBpZnl0R9mcetWZiHcOLy7ag03H0ROOXYvlfi50m
 sg8vGsT25SJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5dAAKCRCLPIo+Aiko
 1W2nB/j4AoOJ6aWIMhTNvzAaChzogMOBVmDThqW8wMpr38Jm3Zqp9gIhlYQR6G6tiH2Dpmd6AEE
 DVC1pO1CVJvYpHOcHlUgqOsgwgwDmutuplQSXiaeVO28KenheoO56JaZ9rkguHarBTtYYwz6t90
 PtUENrBooP3UOqZLc4lS3aRKUrfDWUcKMVsQQJxLQCxj43t3PfOFwltjRYTWmPWYeEPNI0UcnrZ
 bBfI+ZE1gaCONR1ChxhkKdGbvVfSu11Ugutnfh07dmwjH4y9OQRC5osKfD2zXoztg6g2EeCkOOG
 WleBTPbRNl3TgFfVyFdLnJoU3groM9VuEaXmetn+cAy6Xxg=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bmrgDoPIwdnGz67IHms-zwTuQD6u5TBD
X-Proofpoint-ORIG-GUID: bmrgDoPIwdnGz67IHms-zwTuQD6u5TBD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX3Sg/3QkqaNkm
 BpAxBZB1AXWkIv2JnsdgAAalvWfUcAwULkWVNiEp7QI2ce1B+4Dx304cqehMlHHNiPSZuInbBeZ
 R5C+TyFRoJhcewEzAXpzFWh5w4eb+PJfcqKPYzDkB0OLJFG4t0EdkUmO0uT0tG7B2pqSOCsUHVK
 c/2elOeCFdEyONMaFZEF2JloHgNxIyY0LT3Lt816GOuyjvcqQ8vUpvUccfJ2VrWjQBrRaUcowow
 WNJ72xSBS+nt3XmcySjiYeyYeib95A/fmSLSYZr2zuSrlpdQ4IPPv5bxG+NWCQNTBSPlJitC92h
 tP++5StF1lkawGvkOJ8TBOAyk/1GVgFJ440O9oInkZQdsdB/Mc//Ny/fkbhYvzRR1xAl+IJbxyx
 I/pm+zMWRhgXYtBRp7sV4BOcmUyWmJXDYCMe4nelOLrITDRUsd4tujHIFIp8sHXaxXiZwp5Dq7u
 AXFx2kd7zOs9DJZBggQ==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=69667986 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2Ss2wluK-XfGWxNQOroA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140
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

