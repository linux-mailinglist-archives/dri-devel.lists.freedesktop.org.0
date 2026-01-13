Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87215D1A759
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E62010E52C;
	Tue, 13 Jan 2026 16:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRm+XX8N";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKSzqjfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A5B10E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DEjL374080735
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zoh4+RntaZANZMlo0wGX4a/MmqOhckBF1Mck4hRE40U=; b=GRm+XX8NnW6VT/PC
 MTrlKH/VukDNzJkRFkNP8rxJlNAB656Yk04f30c1VUuXbLrcoUGYpFjU/4P7upuA
 Px0U0ZfUWXCD73S0hRvSqAUJMuGyLxDQjOh4O8GjieEafsCO+qjY6aMVxTRwSV5B
 kC14w6cHJgsl94PPTruQNl1WSBKAYLHfQ4SoCMIcfXRRpNL+wDKLQPdoS9rDuOyn
 rTowQr+xe2Rf/eiU25eXzhZfro3p8v9egJ11RMjP3PeRgZaf9TUKS/Vof5tO06RA
 +S8busvJi5ybrDjvOa4z2kTxZCCp1RqfFftm+dY3cR/0ua1z64+Oo9iNH2o0DIvo
 SjCEhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e8fpx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8ba026720eeso656266585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323460; x=1768928260;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zoh4+RntaZANZMlo0wGX4a/MmqOhckBF1Mck4hRE40U=;
 b=aKSzqjfOj0+TWRcolMvZmnZHZ2m8PcQ/ZTFdEPh0PO8/5962MSoYnQhz1LGufzlDue
 UYBoeANmezaf9qO2k08z99eawi42BBfHIbSuABTSEgLy3sqoOWESNVZGCmdIgmWxWroU
 lQBUygznhHmFLRTz5rp2Ul5bM5948dcXhIET3nQ9JxLlCEJxBzJPu13aB9sUKdXr6atW
 xlFLE21h5nMjaNpCWA0o1qbAvrH0KsNMZMQu7mjPOTGbtDaaQhocVtY2sY2BHAJ4rrcA
 2DaY+RLz9knKQPJg5DaJUHxZ+cJOokCPh3zvOHDWV93q4/uZZFiruQNAlO4CrAcNW/9U
 K3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323460; x=1768928260;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zoh4+RntaZANZMlo0wGX4a/MmqOhckBF1Mck4hRE40U=;
 b=gevXjDL4ohSBF8uSiuyBPB4aXNnGvBQCPYPWPp1wecLgY4TbfHGzYL73p7WyrIp/WI
 s/UJZlKXdVUj2WhSYuq4TQ/KhXwYAVSj+YVf89/aZtCTtPY/of7HvC8Tr/jJLTEN7OP7
 6Tp/1xe5WIrpRMgn2CJqVrEIGgTp0GU0g8pSHg7a7/K+ibN+5BTCeHc0TA+3Rtga45vi
 MVZFISftgE53ikia9Dvo9OhuaLDZ7zsG5mMIVQkb/lDQTyABPyWL/v71J7pgxmUD3ObF
 M8L/agLFxAt9PqTXCgmYtblUkz0Ej6Ae1fuli7Br02xrl0IbasqxLazQkyL1FkpKcni0
 joCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZOa3J0010SZLvRNgQ0QjosZ+mjapJD9Jyd3lrgRM4gkB/bgjkO4B7UoMJ52eRYZXrE1aolGRU4Iw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz4zno8JAvIyeqlw7lub66ElY3HPB65litmd3ZEdBPx+GH8oYc
 D63Nw5iBUyWk135zj1mACpMkr858cNujbIuhhP1TX/WxhcDRB+QuFAsx5SI6/pB36fCjrMEbODg
 fAF6HGBKBARbL9H3DG0jcXxxYojdOZ9d40HhYw8wIrSPDUKgcMYX44lrEjhu1oz8JldLcIlU=
X-Gm-Gg: AY/fxX6RVkt3TuE2/3y9602be4/3aaANENeE0u7/yhP6XYqS+05vYpFb7+F995BT9jX
 JwM9SSq13/tHB3LZWzcsnKZmccqDELI1zYQPMm/xz+Lbl+EQEiRu6j8nT/yr1bhpGf4DSzpxkC4
 Ea8U5+K3P3rqUO9nZU723atbj2PwMSn0efWuQ+kySa5Fa98/m9QGtVwRHNQzxYPTf5PzeBPzmxa
 9ksr3gLsoDbb5tnPMJX1DzTmQLapnJg8oWpeJYXSm9WnW07bRcfBa7Ab9cVliGtxhsz9v/n9Gun
 jVK0OUSdobpERVKiHBIXh9Z55e7xhDwxkfSi8Dk2HV2J+1jLmMEbSRkSaP4Qf1iOq43btrI2FiB
 kOGCfh4yqGKWp989H0KOD5sNP601I4WQodTED3LnE+xlRo9nNzOMwTH61kDv/oyefEgDLqwjRBS
 yBNdUxLg0usYDZwTalizYJOgc=
X-Received: by 2002:a05:620a:bd3:b0:8a2:6690:2417 with SMTP id
 af79cd13be357-8c38940bc02mr3196928885a.67.1768323460576; 
 Tue, 13 Jan 2026 08:57:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7GjNkqy3WqZzA/o83vsr0LsFzAsfde4eD5c3ZdYChDFJVIr0SZbRBaTUWOIPjQYDWaKV2Ww==
X-Received: by 2002:a05:620a:bd3:b0:8a2:6690:2417 with SMTP id
 af79cd13be357-8c38940bc02mr3196922585a.67.1768323459955; 
 Tue, 13 Jan 2026 08:57:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:23 +0200
Subject: [PATCH v2 08/11] media: iris: don't specify max_channels in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YJ8s7rg/pBWknDYmw6HVFvWkyXVJR/oPr1GbWJ+pCG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlzjwtS96w3QMPnMqqSb4hwiMO6ihseVVRgG
 gz5MShkrOWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1Rt0B/4+AcoK1NyIJhrsMtFwfpPsWlMI0gIUHpGK1s3Wj5+53t5W0iNpXpmv+eUJS8cGOUUK4SC
 rhiCXbQ8k4R6/RbFWWm2m2KDc1FjYd3UEetJYSkqSh/+qmChTmHTPmBsG3sx/myNr8RNdlWwR8C
 ZMJmL/yfDMYzzMr1D7mwdaRWM9qYMoOF/R27WV+abv6wT9O4oPqNAnMqRZXabVXQijQyFtGpfP3
 NhJ98Vax+ZRtnaRALQHXCXVSJRzxZWbFQFrjcXa3N8DLW276AlmxrIBe+K9x8T95Lks5xRHLT4L
 vUUQu5tUBlGBYXsgbmJksrOM+3waBqAW0W7MuAdK8MIPJ7GX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=69667985 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX2z9qbFvPVfKX
 elfpQkwPwtCBMpSuX/fioYNZf+Gq0wqTNGly8MUJ+tWOPcfaNi2qLd0Nt2oXn+lTFH53Sx5wQPZ
 8b6EspDboly7dRL2iUrW6aCm8MnuIDz1x/zyS47pqq4E2O8TBk3f5ZvotS6dBanmvaxr1LlZDGz
 Sf0mPqzY2dHhg+yVGQ6g9VeE33Hna72EgoavMt8IaVEtueP6FTnQse0+xKcb2lPdUDsoHVhTkNO
 bgjjkM4wP2g80zqsX+Nfg1OgApcu6bocf5fd6nfcc6RUeYtyKWWwuxKtBl+5mBgkLIT14HG1pTh
 eOvN168F4yMF+Fcjpec757z5+AkAABhiwvXaAgvKR3x57H60pGqIAP6zvh8wSSEs6i1b76TMaZn
 w2F6OcB/rStjvxwUV8u2fe9nG8ZbhuyMh9/CiwGCwjfz23bqr7RlTfge4xBJjUNobLHHOncjJK/
 ABpccPKY3011zRGVxNg==
X-Proofpoint-GUID: KtgH3GPhkdY_rP-c8HE2pPwn0nbeWEhU
X-Proofpoint-ORIG-GUID: KtgH3GPhkdY_rP-c8HE2pPwn0nbeWEhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
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

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 9945c939cd29..91dbea4c6664 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = ubwc->macrotile_mode ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f99fcbb8fced..4abaf4615cea 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -72,7 +72,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c967db452dec..e78cda7e307d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3

