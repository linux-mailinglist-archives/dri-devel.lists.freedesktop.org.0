Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05104D1A73D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F3810E522;
	Tue, 13 Jan 2026 16:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ff/bs0zO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nw/fDIxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E833210E522
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DBvL082865826
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3qd0rjFR/P4m9XN0g2YNicO9VxjDGq6AS9z8HKrb+Ek=; b=Ff/bs0zOvQrVqQDm
 ou3W1WkFr1Tnln1wod1rqtq7kzJ1TgxXTTtnqi2x5NYwXkbQzcuXsiTihxIY0eFO
 5tHoRzDe5TkGrvUmn/VkA7qn6HpClqo+t45pOF08jIzN6A66pUPYKJerRGNNlKZ2
 APcRUFOa3HjH45T2rgdcnm/ORfXCq2+7gJWCIiKWv0enLnfVwZRoh6wMr2tyAw2M
 d16swDxggPDlkKyuaOkNDJpS0bBKK4YAKOck2emZhF25h8RFV3GqATAalvHKWSw4
 6pewj+blt4iyeylJB/y/21Ozl3FkE7DQkjIrU1pQ+SwaFKpyHgWevYjvJy1PG44D
 /T4L8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjha9hh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8ba026720eeso656246185a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323455; x=1768928255;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3qd0rjFR/P4m9XN0g2YNicO9VxjDGq6AS9z8HKrb+Ek=;
 b=Nw/fDIxUFIaLmDlap+hhL7fXrt34SdXw7MwsJeP9vJxEIBojjLm/CH8Y34SUnSdV0t
 I8k8BdZkXP5ilzOX8uknTJQaUIXxaNeGq3PmkLZN4awH242xTCPksWhlOFgjgFH1Nuh4
 lq8EkPRIfOU0wm5wwZr1xvahZKsg27oOqJYnY7IWIV23C9ina0xhslCHWPHS6c0BkZNv
 4riLRq/XLlmkWa5XNL+GxP0RnBWptB0rQPFhOp6QwZxa6p2YCroB5ysXnI6yWGCwBV33
 9QEz3ukvaCgfqmrVvhCTlypJ0LYEv9sJYDHcRjGSvw6Pdx8feaCTUowP95HZfXRM3hRP
 zdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323455; x=1768928255;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3qd0rjFR/P4m9XN0g2YNicO9VxjDGq6AS9z8HKrb+Ek=;
 b=wSIBOVCkIIT4YjWKx47IYzkkHosNfL2NVLZ9WdEgfy9Kup6UWRc3YEvdEZiA+5TPGE
 vJCfsP6WmfSxBlXS9WVsiX4T1aetFpwXrTOxFLGom8gIj8lcnfq6ziiZH2jIXCtZZwtK
 pxE5qaKQmofy4fIXmxh4iiOYezh6fOe/ygfQeMNZ4pDaRaI8KN6GgTLdMTgeW9RkHq4m
 kJ/ZhISfNyBnQYMWCiGS9LpzvyFYucMsaIJzzKZAOvWLUHM4FOnv2D0c9EAWAwO2Cfay
 WQAGvhu+N7bCvozRxBXNnzJPOc8xuiS+lrDs2ZVOiZRRA7I1jLpF8CA1kdgxVj8sZCh0
 oPQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn28ipbdBa+Yi+gqeiLxGCGbsiAzv4bkP8lKYx++TD3Hj9qDjJmbHjhy15uZP38pgUbfjO3sZiH3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy/el5e1QeVMU3O60R4ldQ7oqkR4EKna9/oN9zjYJ2L/8f/zgb
 8JFO1LavNoh3Oj107eWBpBZ6ivu8HOFu2/p4G8bwm4kC4/gSG6RXF7XByw3gJsRJB6g0eYxEfmG
 qmFxg1IOSmxESkfNP4YBgUt+c+qDttp2AddPhEPfcQD/Z0U0lXUELSilPEMqAc/NulqQT6JM=
X-Gm-Gg: AY/fxX6Payk/MR4h4ZVqtcp9p8eFgSMJrJcaSutInH1yYGull/JafeV7r38vO1Zrx3o
 9Vrl3Xq4jpYE72xBRHEZdPk+5d12gu0tB9fymJtDfY9Z5rINJuIj5cXVPOVybLnJxWSGA/bCSJ2
 5Evo36C/DT7yMazUUBeUmJqyTOhgNSeGjAMlrtN/dXW2wVXHlX1uhTosYhu2HGeaPePNyI8Z0bQ
 Vl410QWqVLU6PrR1/BYv4kBwXe9WciK8c/b8ezbfk16ubRJu8QwVoRLJOQ4Y1a1XSl5ehj9ohQZ
 gKM5mvbSxFC9CJOpe208IKIoo+u/UgbwxW7V2tcoyb2QNMKKca0wNmowGyyk+THifWFpCKKoL0j
 bwv495ma/TmIlU9v92RbnyDKzbdnsaGvGuJGqNF4xONw3Rp/qw/iNxPTMI9NEgMOp7BctyXSm4Z
 x2dYyDeZvTKI1fQzRf2lRTvTc=
X-Received: by 2002:a05:620a:8ca:b0:8c5:2ce6:dd1 with SMTP id
 af79cd13be357-8c52ce611b4mr133424785a.6.1768323455468; 
 Tue, 13 Jan 2026 08:57:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmMk/PsOtdj2Lo9u4l/QM6jZZRflGFrd3qJ+h6uRlPWq8U3aO6YVpu8Fjn1QQ3S+KyIwtYvw==
X-Received: by 2002:a05:620a:8ca:b0:8c5:2ce6:dd1 with SMTP id
 af79cd13be357-8c52ce611b4mr133421385a.6.1768323455017; 
 Tue, 13 Jan 2026 08:57:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:20 +0200
Subject: [PATCH v2 05/11] media: iris: don't specify highest_bank_bit in
 the source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-5-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=21FS6ewfuqdGS3uFDKer0oeNOooIoTgNJcaXGQoNyaE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZaZfG6U6/vWplOWVLdfkQt3qN896XahvD7t695FAj/V
 G3bafuyk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATyZrP/s9wQh37w3yRfxFO
 x7+FPapcxvtywb7TnI9yf4l+V5GvTxYPuhQRey7gQMrhyE+xFuXJX3NuX4u5ZblSbFWkwlOh7yL
 Cqns/7I8/f+34DkNZkbnsaktsgsO9BLKu+RW5dzS1yB74cE5y14+1r6o3zEhlCHySp6/Qy/XtrI
 2/VdjZ2f90N7ltrv9e/fmsoNyRUq3SmRvny78SfrZaIf7yeTsv8zQNhxzLbVqq52VUQsrn+++8n
 RvzP+xM4TVvG62wq3Zz3iowXE2b1SD1J6zH5XKYVVjjosdBn1gz2JQn3TgS9W59X6JPHbu2ftIL
 5tvW177qFH70eW2x09hG7KOASIRs/cw6OfbHmvmxPE5PAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXwOseMFiSK1/X
 QVQLGWwg9KnQhAhmFxSsTfnaBq7A98iTR2d6qlaqR+VsYLOsnC1/KBMT0NmzNoI3mpAl+eFkJis
 UVHGw2A2T0BqKQDXIKnFzQByN6kFoVldsG0SdF94UOKGW+nb13sA0lApBjmPf1l6cs/vZBcBnzo
 /gO7/wCLtQuk7lqodW0eG6bEh1GTu2cLHMW1ffV7qd/lssDpIYn/iHjw8Zs5kALDuoljojf2Q6i
 jC5uXWdQZIrSzTYJ0qY1xUFMSyQdsdvyI+3dhCEfoB5L9Zao0yRb/Gf59HjUSpWBsl8fRRT0S0A
 mja56J/1KpWnJr9mbAWx9hXhdpXPo+PTyiIwT0cvmn7+Qlhrv9SWk+xjsLrTxXf8s1mRyMCORvc
 UnwW79E3N3L40+c9rQaUlDhJk1aGNVRjfTvaH1UYDpmfx+CAi4KQNm07Kp9Who4MM2gyXVtYGMZ
 1CBWrJ593vwLOAtYJ3w==
X-Proofpoint-GUID: b2Wgdrswy8ScuiUUK6Pue7Qj-gZv2AAX
X-Proofpoint-ORIG-GUID: b2Wgdrswy8ScuiUUK6Pue7Qj-gZv2AAX
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=69667980 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
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

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

