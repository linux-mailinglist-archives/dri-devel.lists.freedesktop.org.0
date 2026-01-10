Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A15D0DB96
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E412610E1E4;
	Sat, 10 Jan 2026 19:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="meN+wm9H";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQTylc8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1502D10E1DB
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60A6dheU2610184
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=; b=meN+wm9HFNYDDdz/
 bah9j1YQ2f6Yckc/k/3X4dNb1O7NwaR/boY+2gbznFpxUv+4YCfN/zmPcwlBo4/p
 40ACkzEieN7VwR10VYXfV+E47z6sEfS1Exh6/BTWrQ5H6tgccXpCbfh7FvZqhXFx
 gBar0a9gdXydIEKs5Ip9HqVcAOTOazT1Hx+CLlfC4BDN6G9Y0ocHYbntLzXAsxPC
 bclZoPq+URZoiAVAEXBRMuNkLcKFZLFtVspepeP+QPYd3lfMgdO6OBFjaQMrSLDa
 rOlT5hmuV8l6mtCF5oAS+b83WrDga+BduJ+0Pd8u0N22iKN79SjVUGON8sr3+WKY
 vyGgIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf5795q2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b6a9c80038so569884585a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073884; x=1768678684;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=;
 b=eQTylc8ws3VvBL7PmxJn7uBxqi4vN58sv595Iot8FBu9xthbuTuCjixF9CBJAO7ULA
 U4xotnyIaC94VSJcdZzV3N0Txn9OX7y1dthnYQlQJp1y79MumM0M2m+ye08u40j8y3a0
 pwjggrGpOTE0que6HbzJJPLVCgyZu0CYKZ7cTg/M/s6Tj6U4OtgiVD2c+5NhdMtbpl3W
 tmQM184d7uZthh3YfD2HlCS8b5L1gu+eyD+hOzgPOdALi0fnHBWHETVKLN3QuMXvvy9G
 8S9MtQNHAFQ8ocxFub3Dy5BMfVeXh70VtqI9Nnmu9Mmop/GJUzrwYxv6dEVaYb2N/5xx
 RTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073884; x=1768678684;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=;
 b=bVmUI55e6ah4+3xZdfiLwq+okFTO2yre8G0QIt8wDSMI+SMc5a7hwYqT69OnJtDjLX
 p8txYm5fsP/4P4LQJ9NNvvZa+ORuJ5rVcswvzUQhhPNJw4Ik2yS3qn5O75AQHgo+XaXZ
 1J2Ay2yn8VVi9KhtGoSLMW1oXY/hP1zsOi76/jQRJvYM2pFfluVfVG9BIET1MhuCvUL5
 25zdt9dfES8u6GwjPZ/8EgNvoZvODe/Is9xyRcdhlVQtZz3AN8w15AKFqPUKZu0vHCey
 bCiSx8gWjdkTifaBXnssVwV4cMtTePxx4lCwu3KqCKz6rkmlN2JGuFLZ5QBL7djk6YbX
 QPKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8+28Lb5Y3Vj/LxMmlSlnrq+JZQh+lHxHeHRyMgAp25ziMFsp01IaDfSasGqGX5WMW4LJUYASt9W0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxATytLMjNXywQi9pu/zwT2GWSpZTflH9XCmGLUG6CJVznoOO5Z
 Q7JPs9vXMV1X2BLFF9QC64WuTUAxz/sCtoBfcnVxsmtcKzfwY0fy1JKaP1T4NC6n10VAERYYkbc
 Fu0BwOztpquWiO/f8p3sGZ1BVY1HOezqtFTtWrgkV09bvUGLDeYUigAZ1ekXA0GfI0ULCWMc=
X-Gm-Gg: AY/fxX6nqiLoMf7eIMHV0ziUHpqKXiabfqaBFzQTiGV2srBOpvchry+6SulvHpEhBI2
 6i0l3ranWTVamaj2Dy2LZQvrl4OFroyg3oTHk0tSWgTQkSV3YbLsnetlJihSFkmEfo+DPoaM3Ag
 ker18MMvKfhIIyJCEPwIoJyhU70s8RdUtBho1cmH7npHspbv2wvPgHP6hpAY0EuV3Xdg8KE1LEy
 ROMfn+rMpOBZhSe/x+9hHQj/uEUW85k1ZgjKaHr2h0qTn4dlrT889KR9UXRhoz466zEEB0inlq5
 NlgWC6WPWjVLrWEBEKQAkaL9bubBFvXH7ZD1pVUhgUNTRXxmqpOTgc+7UfVlrujDYQ7IsjlDoTL
 cDLjfQTIUmfCO9IPKb1T3E1pTXUkwDDUjPrDg6KpgWzbIJ0RipArIcyOuNW//E8T5ky1T2XLUBu
 lf5gxnIAAEcHsxTsR4GZL2gqg=
X-Received: by 2002:a05:6214:202b:b0:87d:e456:4786 with SMTP id
 6a1803df08f44-8908426ab50mr179708506d6.45.1768073884411; 
 Sat, 10 Jan 2026 11:38:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrvCJxK5E/lItE74kRDCtOeI+UlaEXrEZFIHoPd9qyQkcxz9NSymG2Cfr+eVovwlWWnTIhyg==
X-Received: by 2002:a05:6214:202b:b0:87d:e456:4786 with SMTP id
 6a1803df08f44-8908426ab50mr179708326d6.45.1768073883937; 
 Sat, 10 Jan 2026 11:38:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:57 +0200
Subject: [PATCH 05/11] media: iris: don't specify highest_bank_bit in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
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
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vy9tVwOAA5YcL1Np1wJJTKlwneoNR0tSHzfBWTZUVqY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTpbtQDEaVekUIxIorLinJK+7zjJlGSZMwM
 IVJk9KPFVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1eHlB/4kUeCqrKqRYoiDCTdAHwW+RQxJdDp+scPXwVIAisZhOAeXVsPpYM+t0YOd1l7pRcUZ1nh
 KKM5HfETppQXrnooOWhfprp32HjTruoZvQ/ySA7bMZk7n8IaLyW+Z7Ute1JeebTfVfWWm+p+Sc5
 nAOeI8+T/0TxChsPUAgiucmG8gotqLveV4inEzeyoUVZTuZ7abJUn/3CG5NmlakEt321MQy15VI
 80fRTK63d3lAwlw1js6cuGlSp1PTyWK2bk3B56afJghYwHnKg3mwE6nK6FVjrJ8gf+4EEMNGB2r
 NahK5yVFqDXNOzCLivlIoHa9GoccIsmhk01fIiI6MXDJQceA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6962aa9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfXxjrd1raeBTOE
 8Qfa0re+79l8Q0rBe4p0hPMQeIcpIUEbSsai0lG+leQdP9a1tuEhgqwlY9hqF4Kn0JlF/cRKcNA
 kQ2RqAYq4zag+99k8wfR2F6qp90j7ntLUOP1sVoVc5+zrqxtpPMT6tD4T3oes3Y3twiHdZEelVv
 QOF4LIhMxnoSDxE8Fcp2DEBY1z+Z7sDxEUEIXvQqb8NqaFLtE0jwQMq2M6IZZKKa8wYoQK6rNVX
 R7bfBpZkd+yJ7nIVmj1zcGqSRLNUPeT3zC13N9hF12q1CGEYNvo6cY2NbUFlKGrwmBq3j35XTKH
 WNJKIOzt2xI45ndhNNDFR8m/zJSlRR7Nshpyt6/RplW+hREvPV1vi0sFMSPOYvRIEtQSOiQcWjP
 zcbijtRXYetw5Ttmr4L5Lo/a4MImUufAwPPJqve55vRJysec7l1EZgRHjkQ2KDv1OcgaMsyzyCq
 9K/FeESyxCOhsy21TTw==
X-Proofpoint-GUID: Q5NxmQKkk7i_0rhGNYinOClmn5mxzZ9Z
X-Proofpoint-ORIG-GUID: Q5NxmQKkk7i_0rhGNYinOClmn5mxzZ9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173
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

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 878e61aa77c3..a4e60e9d32a4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -159,7 +159,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	payload = ubwc->highest_bank_bit;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_HBB,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3c5f3f68b722..8421711dbe60 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
 	u32	bank_swz3_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c70cfc2fc553..5ae996d19ffd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,
 	.bank_swz3_level = 1,

-- 
2.47.3

