Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278DAD0DB9C
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD6F10E1A2;
	Sat, 10 Jan 2026 19:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDQ3fhvx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QuR+X3hB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E994C10E1D9
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AFdx6k3767101
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=; b=JDQ3fhvxZFqJs7+7
 /xyl9fTT81ulEBVhF8rYgpfULcIkmuo0v8hQvjdIv2SA4JYb5T3td1Sy+XUL6stH
 mW5rhlzU3+qxFz4BLpW7eHL5sIq9L/TY3Mq9QPO6RJL/lkFXsGzP/vAW8sa6hzMJ
 t5FSWA8UV7df9mUp0BhBeVfkfdUHRJ/5+ZmisFjCMSX5DwVU5MaRGGNnT5OpYuHB
 5H4V/CDSp6iC3K3vw+9eTwY/VNsZyO/00Q3K8xreBtkfGn7eqw2UDvH7WmkAADoq
 yHvGPXXUi/p+JXYmPs4T8NqFsgK7O1r4+TRatwN+Hn6pEnrIOuMY0HlNHdTJqRLf
 sXIMQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntugkmh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8bb9f029f31so1367958885a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073883; x=1768678683;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=;
 b=QuR+X3hB4ie6/zkX1CvjEcRe9ATjr96X9vgW7Lf3ME7v1cYW11r86lTCTU1/9hAjCH
 rBWDcJyicas2KSbCNSt5gk3WX3p/F1pq+FRvuUP+o1tqWXBpQ8Vdk8QIlaIzO8bTMwDU
 w4y2TCYeEPpB0duI1apHf+SbV+v9oLSnRsvEKaPUDFlB5wcCI6asFJLyZ3vkS82nrHfV
 vU7SZXE9+Vlyp19tydXz7qtWctqC0edbFsuRU21OVkP+V7SU7zq8xhjJ7hHWw/rqJR8M
 vWPg6FLmaQ3gy+ahq/snON7xkMelU9ORu4R4372djGkHEC5giqK5r/xX4NZ3xidlR6rp
 uguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073883; x=1768678683;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=;
 b=jM5nCBQujvfvyZ2/HBJXSkiTi0tOAuO1F5kxMIe1EtuFellTTgSZuFyLEcWFYmnlzF
 Rm/Bqe+H8bIu84Mi1LtHlaKM1fEcqWl51dYJZEUiEsE6k1rk8oMggFYN0YZKB0Qq6hvG
 uozil9oEraHvAxgjpd2ybDSlnL5NiO+mjsgJ9L75xMGB30ECiYUIWzz6+BxrT2En4kt3
 RhNsybYA4LuWM6kJPSEZmFkzD4Zojfg0jVf0PEq7YFDbmcfy2LcKmI3Z07fnKGRcqNUf
 WhtPVY9NBBiQmiS2NcEv9KJGBq48tJ0MO+LJqYs0nIut6mDgvol42UlNZVspSEPXtl0Z
 A2FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8Pen2v1Kf+9Bu2NE1ZDiLzYFXE+FmoZW/IPqdRbzeFz1Lx5gbWP1w2FacQkGX5F66A6l03Ds4VN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB53UVpEUZ2lj0CHNDHCn//9DSxIZ1kG/jZ/cwsRg+oEyIwea9
 rOGCv+L7BtqWqe6XYAxhEFwRsv4tOLV7XRNR7YaM2tnU9xETHAj00nne/OilqSXUQR8K0wT7rC/
 gJ6CaeaEakLL4YjSm5UC55+ZKyhIzrWd9rVW1AbBDhz/DpD1ERvtmjy5jKc1f42KqOA0Zf1Y=
X-Gm-Gg: AY/fxX4TgAfdk1B1lJCAbEWZg1utS8Z9x5g/Cc7ODlKhx4QTI5WGVlOOnRBHMSiS45U
 tuZX2dcjV0x8HZ923KChpjtG6gBA/u/Qsu57QzgJBX3f8wp1Tv5nljoQs7pF+uIim9A+v1c3X9f
 HSn3XWtJyiFaGAMlTNP9ecZ/hDeTqUeVNZEuvMs6jDQoZyuLwsEod23cuJt+yhGrD3gxv1KElwJ
 iPularaTmgn2dG/uSR/MIIYXdDYs5VZrVbtQx9scIbaLQ4XVGt2mVHOMx0UzCgTZ/I6JAnxy/6N
 pSGeYOdot1gsO87Ogm9Oex932ixPHF+tgkHB5c3dvISYtj9QcSjLYo4f6m4geVBeA3hAFutUDJ6
 BWqk65rn6AlJl+kXpZ7PX51r0/KFHkzzYfoq9EnOgUNfNy3rpxgqpqOBhnmnr3fi7PdYGz07iS1
 qZSarL79qEIZ8qSckbLcsKFoI=
X-Received: by 2002:a05:620a:448a:b0:8b2:eb83:b94 with SMTP id
 af79cd13be357-8c38938409emr2071092785a.25.1768073883281; 
 Sat, 10 Jan 2026 11:38:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Fhu3fI/rHF+8/VARZB58+5uap/6Yh/hs4XYGBO8bGPn2y09pUiKUokJLfjBWQZIQw3Taxg==
X-Received: by 2002:a05:620a:448a:b0:8b2:eb83:b94 with SMTP id
 af79cd13be357-8c38938409emr2071090085a.25.1768073882841; 
 Sat, 10 Jan 2026 11:38:02 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:56 +0200
Subject: [PATCH 04/11] media: iris: don't specify min_acc_length in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gpcocHCUXsXafKyVqfZhuRHgjdviZ0p9/GuqdmQE/lg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTjEmTAg2fFw4dXnV/yfZCtjbevCqTOR4Lv
 uzYk/iRzDKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1f6gB/94jLwTW2nfUZCMX4NIsS6AIuAIpXej+mAyN67FL9OzGClBIulunDjh5KAOY9TL2ZD9MAe
 qFofyQrofFYiIwZAGkQ6qyYd8aM+oADSU2ZkO5Avrh24VWvBSxdTKIsf8Dmf8wtx6MntOqml4xT
 8dXMnM5arSSOnfp5PTuNojYXC3bddT5YDktG5A9dmzIfAY+MXls8cXgYhFB6ZL4vy0OMOtlv00/
 g62jUUaEu9b0M1c8vWmB7KVcIWVtMcXxv7Pha6PPnZkjNfuZBNn192MPA9gYvexhV8GmueIzNKL
 nD8KeY/C/ra1QsbnaR+9ubdRo6ZQwAZbNqO5y3NoCbHgeKuu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX7BsAiLpoRwk1
 wbaRjo3M6YDJlEDH1UWt8V+F5/X+ywzxv7/P85Zd0/jNCTr6yQCJC6XEUyVxrMSFKXTMsZNgU8d
 wCb3rPigvbjIGazb4IEWnrB3zwU+h+ZQy8SSiS059wlRhXf9aO/Vtuo1+u/DQ3Jh2t4pUJ2kaZS
 1yPxgFVvwqp84kMUAkEabE/YJEa+co1oIm7VOugCWEUaKlzjXo01umJ7rwqTYtZdlsHmvdgLNJH
 CjoIkshh9q+iuCn7njjrZ6C+gsFWjV/ytwx3jsdurVF5BgRldpkK70J0yTF/q3mkMZ7JR6cEdc1
 zbu9QcBd8AVg7JE254vhjxLMMySc9fprogtBfGH/pb+TI3GiUpsx3JhFsXM3eRoJ5zpXXm94LE6
 fKCmGbEmR7wOENWbu3xPyNTzGK/JacjPY34wRxWuY3h/ZUrtdW4q8T/OWiJAlM/FrZzasfWmOd1
 vqO46xhFO+gvp76T2PQ==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6962aa9c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dSCyfi1qUYuBuoX4_vcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Cs-tSY7g9Ol31E5bnv8Srq4mfPZvYeQ0
X-Proofpoint-GUID: Cs-tSY7g9Ol31E5bnv8Srq4mfPZvYeQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
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

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..878e61aa77c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +122,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->mal_length;
+	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAL_LENGTH,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8d8cdb56a3c7..3c5f3f68b722 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	mal_length;
 	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248..c70cfc2fc553 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.mal_length = 32,
 	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,

-- 
2.47.3

