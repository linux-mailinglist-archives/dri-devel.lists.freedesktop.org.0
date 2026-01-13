Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D79D1A734
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28F810E521;
	Tue, 13 Jan 2026 16:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="madejXzh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZaMO/F2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D7010E51E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DBsPhU2865805
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hAD3t824tdcwEOLVZWqxMKdxBRPHELtlY/iZHePT5Uk=; b=madejXzh4uc1tB4k
 3DyD5z8f6SMhnGpiKPkDIOK4EpEWUYevdm9MjY2TkB1Nul8CyIXONtZzE7fIfaOs
 O4ZrErUNXCUuE2gOKfE+krCjaCfkN/16qkIrpOb86nB2YYvnhqExOuy2SwAlU9u5
 jLiQPSbpdmctYEgAwc/FQ6R8JQUsMIaCx/Tcj7L1SxUWMOjPimYKfnt7TDSx3TXR
 oeJSxcVp3HXxq0X4I7XWxNU/SAD2p6h5jHIXCPG0TURfwhUfMaExyHaMJNNwYPwa
 3ZkhPdsjRvIBi3LErColwNUXqyYaa/59BHEjoKYO6dHcSmVxHdO1A0mR8NRL1rXd
 geAAMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjha9h9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c5296c7e57so191140585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323453; x=1768928253;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hAD3t824tdcwEOLVZWqxMKdxBRPHELtlY/iZHePT5Uk=;
 b=OZaMO/F2jdvvz8l6qjMGjpAOriN+3pEY9/TA3FwteZcHk7UB2a/PlclTB0Bfu/xOog
 ktB4IYQ0jO/e6im9LCZybs2NnYS2kHEw3FM/w7qFGv+Aqq25edS5W3+JgQaHu8pU5/fy
 LjtEvN3Xqo/QKld6HSq9vZe2MjfoVOpGSuOkB/vau4ybimbwz3p/7LJq3OnBk8KayH9X
 aA0JvEYlmogJGDfQDBWcRPUW8hdsTNO2McoOngEsG309R+eiVlzM61xGZU8jqy/zzIkO
 LdFEmFbUNZaWromQPVEwpCFdUVqaFZCvx2EvN0t0CEvKlmbsVZ9qgcCce+VdApAkpW0n
 7w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323453; x=1768928253;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hAD3t824tdcwEOLVZWqxMKdxBRPHELtlY/iZHePT5Uk=;
 b=BD38S/FT9cv2XBlLnwJTGwdwwQuiVe+zVjLyUrmb7T61YbSYm4MzBQQqRsfJp2cl4g
 jrmEAv4rNYEP+9zmRwRmerl0CQewGILWXTVckK7wZtJmpbi4RzcHdO3wpXfR37CXV2Gs
 jgFTxk037Cw84ZEgnsHsJgD8pM1vlZ81mpslujVmlFyBg9P4g44iV8TuD4zG5TV9V4j0
 q2lw2poGoJXwuzBuopPV1wiZrC+8tUFOxAn2/de4ziQ+0JFJZP35PcHJMSqU+QSLqBnD
 g0cxyGtkwj9uPnzJxFn2xchpfBHLZVOQMeUE0CJDZ17Bv2ajA2e0eI6dqCrX2zELObw5
 jbdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURJDdFm8wCkRydFyXMKsfT2S+COdCNZsl3JAYvOnAaO9B6rSdQYPmh98Zz3nT0GG1HfoaV0Kf7s3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5dh/TQKLToMX6UwQxk/BhkTNXBOBtQD2F+UuBrP9jYxzEm/3P
 xszCsGCnLwiPspm9lAE0rbAYeZa5jIjt5jH/qx+7zMjrcmdljdYNpb9dSWVZ/j7n+bs3UCVYQFG
 YrzRJ9lrf5eAF1ffriAL8G8sxDnDwQjJxc/NBjbpyGsH37/+XRHr5aeC2ASkJA/IK4ylfJPs=
X-Gm-Gg: AY/fxX5RaQleiIduaPPayt68RKdETdaguU6e6xcUAZg7VVJuwar95EKwKsSinL+kkCp
 XPE6ZbiRGKKHsIlHogKCGE0BnH2OkU8rw1XbThlt0Upn070bQWpsZjoC5ozhSfJE93jPuI99n7c
 MnBuF8IeLtAJBAk9l+bCyqikscAfo5Hwgv9ItO/qrQjdXLumlWByooxGLuuQJkSuSm6MPJYeVQl
 /t2aIFQvwpvPbH1/02jfe4oxxXR1TgYIlgPGzpyBrbyCdNCv+iELzUpyYIsHOTT6hSGPUQU3xTr
 lHOYCeQxKfJA4h09bg/fIVusAGV0+JUbpA2PR7eqJRVHgU0lQyWgGOeayx5ITAduKG/Ad7i75YJ
 3bliUlzdJDg2P4z5/aPO+Pyw465sb1vHzzCEFHgsQuJBdFDzr6EWcN3UbjIpAkSgU9/ZdHG6RFV
 qA85nGyzege4nT0P+3r5fTrdA=
X-Received: by 2002:a05:620a:2954:b0:8c3:55bf:735b with SMTP id
 af79cd13be357-8c38941de7cmr3129017185a.81.1768323452965; 
 Tue, 13 Jan 2026 08:57:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzABrhjIiz68f42H+KyJlrj7ATlYywKpQYCMtXQALfTAzDdPFy4bgFmJXrf3a4G5QttWZWIw==
X-Received: by 2002:a05:620a:2954:b0:8c3:55bf:735b with SMTP id
 af79cd13be357-8c38941de7cmr3129011985a.81.1768323452433; 
 Tue, 13 Jan 2026 08:57:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:19 +0200
Subject: [PATCH v2 04/11] media: iris: don't specify min_acc_length in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2913;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HMdQGGXMoxAFlMMe/K2Cq5GmygslrlUf47OHT0fh34c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlz4MHU02rMucG+cyZiLqJlRZWRz6g5HU4W+
 KfbfV1BiDSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1fIXCACTE42T0FJo5xNb39ByhGFcdrV8xverwN05Qjuhb2jVPNg9926oLQ/wvG8U3GZcIcenLo3
 UAwLo27BulYDZ1b4e/7plg3EYDmEsrFti8FsPMMGPPnEBkBr06ll7RxNWoJNrcLNov1QGf39Js2
 KuUbntx21eZkLoI7aHUxIa5JwVEh7MHulA0QRMomUhZGi42jEZ8/Pje5rDNhiH1r7aL1yRX9isT
 61+939iKmPzrXBjBWB6aP8zrmLKW3+BvwG50e09+ZxGdDi6rGCUg6Xou59rdu5u9sKqV8R7D3y3
 lUj0dl/keUVzGO/KdJ0UBenoLtJWeg7Pwy1xLRjfjZJd3ep1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXy72lIwSh1ffv
 CMCFx/KXEOkfrxYxwk6KOSKdPOotonlJ0rGt/2OcJXDNvYS6IvpJjAnKnL+7PgIMv8hY+Ut6Bcz
 475gzrYHFYDO4isF6kc39qWQ/6R2hIOmYDWWLrLyP3ttrY/Clo+2tt9dnOOap94c9Xit6EkEXTq
 +uXv5NwJShj5A1svi3TewZFxcDvxRpASt+4D58wrGvJsVSnH4dTqinM7n/nDA5ZWg2bTGSEO7R7
 wjjMxpiUHwmZ9X28keA4+ecny+Ex5+mo8hTglyOuA8t0Az3tf7kfiVZowOiYqnBwMGGC4qBE/5Q
 Yah7WwCybfRo0ahpfBXlzPt0SonK7oNIcma8N/prtR5z2lgP4HIiFgxJB1KYTb8LuVWBIP9k1gs
 PNSJ7EpIwtM4Wvchry9Ymq4WOoWph/aigpazHu46qWu24E/K8euaeqRbi38A+0UuyvGlI7dHRmz
 LAQasOYduubFV/Jn3IA==
X-Proofpoint-GUID: I4a6KM_G8Y4Wvip0iepURbV4O0J2KQwd
X-Proofpoint-ORIG-GUID: I4a6KM_G8Y4Wvip0iepURbV4O0J2KQwd
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=6966797d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tw3gK4E_mqRpSwCFd0wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
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

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

