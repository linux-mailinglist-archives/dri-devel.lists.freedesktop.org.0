Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8EED2D2BF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E3C10E80F;
	Fri, 16 Jan 2026 07:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwEcsGc9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AU/XQzqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D586B10E80E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMhlAC2819530
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4QuTSDWOVRIPQT/wdz2/Zb7Ib6ue0h9V6PsZa4P8oi4=; b=jwEcsGc98DU7te48
 UZ8K4r+eNk8yWijgY+bo8zeQDm/YCz/dCRodIJwAeO9ddRougzsHrbFcF0Q/dNFH
 nT7xGaPdWbwqk4HwyR4cgDn+ksRpOtidXvkwc7QP/xqGX4evTMd3mOiBoj7xSpoa
 Tc5FcBqC3wVcBiS5qgbHbnROsrh7drEzEHbMt6c/BmIpsWFkDOhhP9q14Vgz66qx
 7XOPmQF9cHiYAUVMZCKdVXC1YSoBCwtOxVWFF151HSoOs+MIk+BHuEAQudhlmfL7
 4npGMlOgTdkCvzUqaz19nApYcGQiOMEqBE2Lhd0Arb9oON6731jdEtS94arQCZqd
 fWucNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq99ah7kg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50146d98660so50722641cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548466; x=1769153266;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4QuTSDWOVRIPQT/wdz2/Zb7Ib6ue0h9V6PsZa4P8oi4=;
 b=AU/XQzqZlEbfHp8Uj5N0KZp3Fyi889d3AxAk9gwClyZAl/hHsw/Vh6HKDMcUtwV2t1
 aw8XHtWUys7StwE/aXUg9PE1+z5nmdjF2ogCjA/2F59qy2JYG7AiUflfwX8ILmV3KUfD
 hHw1HZ9JQgIpUPAMxc40NLUZTlxcU90xZGx3g9zpjuqBiDFCYNvJ2gOuXNGHK2EQcqoV
 lygueGfQvm82aJQcrB7y7G4hLEOiH2LvZANZLcdlXgtz8Oi8pREWX5Sw9e9EyTLG0W5J
 wwJ9Iqm3Rf4anSU8cBBzLGyYv9/N3id+UaSdtsvqcchXo7A+oJmdKi3cWNtdpTWCnNnc
 JB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548466; x=1769153266;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4QuTSDWOVRIPQT/wdz2/Zb7Ib6ue0h9V6PsZa4P8oi4=;
 b=lm+tdxuZd6Dzakelb7BTDU/NgYWZW2xfofB1Ao7QRlNMFeN0Iwfg8fKEBb0JVZ64i1
 jf/dcx+xfP3/e5U4W3llvA58QZjz0lGesPhiqW9+1x3irRTGQPqoR/QmAhBqum/G8G4v
 GbGewZvr3aOwS1YWrNy+D4SZoUn/khv1oZgnLTmtC1NLmqdjRnbUtX6G3l3cK5rW9ntD
 ZdYJdEIoM9eB6a4aCaTVCv+NBURj37kypwklJD8AjDZnEMbg9FJZLnIfJbuUgAMELzya
 agJBH3hCxmchMn7gSqqksPfz5xNDPr9EvsLWKmBI2GMUyGR6ENzuUQPrYQSEGEJNjJFx
 DDvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4MrFSRJ9J/jxQUcMeyZWmwliSXyGuaVzT+MwQpz61Gl7K3xuamKcz8Rc0gGcyrzillnzFbuYSTI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIP4UMwpnOnWlM2Qi2n3iDjIS4KH/PDwhj7SSyJ7OnnnecExRx
 LrOEFyLJD+jOQMQit+kUHD0KqrcEKU5VJnBG4jXG/5kpna5txdI4g6nWs/a8KHRCjZsQHFNp2Vr
 +sHpo+U1MO2qHGQtaUtwBuo9y9XYfyocvSP6UFEom3LnT7P+G6M0HjCAdK26jWSbTohZK7F0=
X-Gm-Gg: AY/fxX4W3gVc8Jves99JeYUZ+QkShXJoORpoTOqI2szh44/1+32FOgUzy9rOu/YmpFe
 LWDqnSenpXGaex99yqHEHSnT6tS1Q9zizP/Cws8Jxq4OLMvYTO/UaezMnknMxqIy+jAB5q7pH77
 qmBRn9ANLNcqD77zzhV6zRBwDKqtoXQKYiV3DFO4vC68e9vX0Uhz9uQRe3Gdv0PDMhvMJEc49gu
 SyDfO0X/QOm0nn5osxu5QePOpMFjDlrqSAKnTyBEsY2K48I4DWjYA+UAUnXqHP8or9993RPezU4
 R6D1Xo41Ztr7ep0L9+9dQfLDdxDtWBNykE7bELjRhCSui1btMbTdsbn/+5q3YJlf68DvDRoawjC
 jIND+mpz7E/FVkXsV/oG1OGM8iPuO4c8SstViA8UgeBYT2c2fptybrpHnkgMg8MGekYdA4n/XQP
 W4NwG3s0eQCvcYrGwxJVVJxHI=
X-Received: by 2002:a05:620a:7103:b0:8a3:cd9e:e404 with SMTP id
 af79cd13be357-8c6a694817fmr279847385a.68.1768548465993; 
 Thu, 15 Jan 2026 23:27:45 -0800 (PST)
X-Received: by 2002:a05:620a:7103:b0:8a3:cd9e:e404 with SMTP id
 af79cd13be357-8c6a694817fmr279846085a.68.1768548465578; 
 Thu, 15 Jan 2026 23:27:45 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:38 +0200
Subject: [PATCH v3 4/9] media: iris: don't specify min_acc_length in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-4-662ac0e0761f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pVPYBG6Zmp4xvoeS1LqjWVdLu56/SMU4J5WCv0uhkCE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehp2eY0Q84sw5cRJw4R7iSUGowsdYMNzWW7r
 JQLLBZ79l+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1YIbCACVmD5fbsmfPmtjA42tUN6J8zB91OoPnx5cfICq/UDX7ddZTudLik8pGDXE3yu06E6IJSL
 OhRUGFzSFDGcunSxXcJ/vN5fLa7C1dq3imzvrStL/A5L6ckNsAZQjnRM7okF9oElpyXKgWBXUxa
 tjOUnJn+eiE1YmkwrDOM6fkPlahm4oFvVbkZGxiG9DeaE19UNEdd7UlL+yC92XWTUp8rC+5Rwrn
 lLxRpjb/1RsePh5Py43aWvMyqoV0BycLQbBbSnjuZ5UnDacj5aiXMupG5/4i5RXliKX5bxQTq2D
 s6sZXiZjfsIpnUKo/ArMFu3eJ/NbZwQjhNzcWAjvIX//sdRx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: A1bbSewFWFQOzNbcaXkTs231wazW8npG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfXw76vV6C9/zCN
 aZ0mWxR5aLo6UmRfZi1G6ASLGNsiE8yG+dcnIu2ZXX1dSObAdmWzKlLlBR6fRqpGlUbSxm8nqGD
 ZuEeBf6OQqRqtwl0SOWarCGhq3z9qHD/pOlIxHXo/tQsSc9stQSY6euunZptEt0fshU/ARo42SZ
 EtX5/vbjvVka6KjbhR3R3RRwVeP9xs0rFsG3krvXm5KxCpANG7l4KoYr5Ye/aS0Oa4XTcGo/Zy0
 SsgSBUNfwRBcoRB6bLC1+OyeELNwn3LMUciUvjmP+e0FD2SlvjYUxeZy3KIuKNvLSTgBi1UiClK
 yvUe2ELXyZiPEa7725ohlquAKTTx19VuIhC8xEONHSFCSXuy6+uAJxlQC5ieJzannF7GkDr0lIL
 ZLJShVPNaLtEQNSCbxD/SuMnGiWN8kG8LYNSYZ7fhRdHcr4ZFUQfErTsefKxRXBhSgzb7eWRfCz
 WaHtmxiw5vyCyzJ0K4g==
X-Proofpoint-GUID: A1bbSewFWFQOzNbcaXkTs231wazW8npG
X-Authority-Analysis: v=2.4 cv=f5ZFxeyM c=1 sm=1 tr=0 ts=6969e872 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tw3gK4E_mqRpSwCFd0wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
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

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..aa4520b27739 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,9 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/printk.h>
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +123,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +150,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
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

