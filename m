Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382DD2D2D7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BFE10E80A;
	Fri, 16 Jan 2026 07:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pg/8+jaD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7LbNStY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB63A10E814
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMaPx63192405
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SZ0iwrehLKaUcajId2K+vtohdRW3UYKAHqXQkWw5X5E=; b=Pg/8+jaDveFD4Lrw
 f7e3NY6djZyZlaQNPfS6yvwZF+iLu8hJ0Gf6d+WOJk8pwmXkCEz2rMZV9+TFxtuj
 tuAOkB2ror5Rn4iVl2wFLlmVgJGjMOn2rWVfv1+N4X9Mz295NlYoFuSRAMy27+i0
 Vt2yj41lEVWAOWJtPzQdHojuKDahZG+PDqsayMbVsq8drFvrI+SMiGgscne0HpVz
 Z6kOVFZ0CLKB+P4o6tC8fIu6MfV2NqUp+Nq0JHrvHOfX2Z00479wbDuuY137C0Zn
 bW6VtBO8QhYca8LUzM2i5ulSVmNOWikgKwWayyj7bRGWlK/W578sh0sfuZ1cs08R
 il6Rig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968h80k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c5296c7e57so664301685a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548469; x=1769153269;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SZ0iwrehLKaUcajId2K+vtohdRW3UYKAHqXQkWw5X5E=;
 b=i7LbNStYETJ0kQefHOFdZiHe6z+vc99hXa41y9e+7UIkAcggGNyOMUZR71W5dnAw/3
 yg8p3RibWXTT06B8OYnKSavnBp2NSjf/jI/FWfuxKhYi1GvAspJHYLgS7wKLDklNW66C
 R8p845jOOSEyFamIHOmzp8BxvuAzsRs5tJkcMfriAIfjcGAjcfKXzWOZdnNEsUXe5Ocy
 CyQasqKK3TWjx01+1D9duHxmHl48O8MdTRyyJMH2vG+YehqqjZoMV3Op5fsU+3dR9Ade
 SKRGtzwCx07jQayg9oKcjUjUaQrgseawRaF2zZvpjrBwDC+T6ZYi2F8iHM2gy5qI2Sv9
 KX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548469; x=1769153269;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SZ0iwrehLKaUcajId2K+vtohdRW3UYKAHqXQkWw5X5E=;
 b=POJab1hPEsOuVXHvvZcIcGvjsni/6c49MVKWvbxMJUZV3x7ozA9I5g+oxsHGPEI5tB
 d4J2mLo4f8OhMBLkvaB+S6LNWCJ+gC1P8VZfJeaFzwnK2adwXamEARkxhXPDuUDyySsq
 M8vNd6EcJy2ul9AdLBAJXMZr5aCLbXfJL7yhrCdvrydg7thz9Loqr+UMerYGh6XVB6st
 V0nHrDv61AW6DImbH+Z8ssWYjFRljOTeUem2US7ERc24stheLFaMa8QVO8r1Q+1kiamg
 hgAwDkGTIdLHossDMxwhZWH2Dt4e8jfRp/0yCwnOVw5/xu89XoCNGXq0MoLAm7BpVmqH
 IzAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWogIF4U63rdL6Aun+H1Y08aXfPGaEg+BvS95/QYY5em4XgwNnDX8R+wGrsBE1TMtnk9fKQf50iCzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkpsJeeYtAIvrz9ekZR5dQchRYH4pTP+opJMjrrAoiTQZ6+8MH
 RTX348lvNdmUiWHzf5rEaa/kDmEdEn/obvmGMlW/H/Xxyy7ImxAOu716mZEurTl4ZueQrUULh3A
 CG0/Y2gooCihGTPvc6AfhinOo+YQeDapX+OwSZHDE/kgAXDRNqhA7rqaxEn9vximWiibNTRk=
X-Gm-Gg: AY/fxX7xnocf4ug/QCsiHaSmNNHQvIoBtLDMo/W9Gv36c+lhbx+Hf9c+rEhhhTzER9P
 zOhe1Avb5eRgh5lU+vyyAxzVd2nxdDGJ9IG/KQbEqIUV/RSTbox8TLPA29iIW1LezLWHoaBfiPL
 gG6aP7K3iJeW6KwynBtOgQTEKD/fXp92OyiB979KVWfU0Hf/nl5BCcPw1VJWs/QsZPGsfYj6mNU
 Q4OtBYkbwOiiauEk5oVJ/1f1ocK9nx964R/HHd9zmBdBW4Qot8Ij4Vpy8njmKWMVIsPT2sUDI7i
 qFWJ6zlK8IfU08uIHA8viYkwepT9b2LMgnkXrkUYog1iqgK4KZEauLB+kfQelr5S6A24UoHYPUA
 KW9gzR9S+n2AeUxEG4wyBRaNVC/Eeu/TJImcFZEzSHTRY1zAzVRf7hsAI/1PdR3Gwe5oX+RF1Cr
 L97PVXTDFZBlOD6qX0jMdoDhg=
X-Received: by 2002:a05:620a:2915:b0:8b2:e638:7dce with SMTP id
 af79cd13be357-8c6a6965342mr275660385a.75.1768548469356; 
 Thu, 15 Jan 2026 23:27:49 -0800 (PST)
X-Received: by 2002:a05:620a:2915:b0:8b2:e638:7dce with SMTP id
 af79cd13be357-8c6a6965342mr275658285a.75.1768548468955; 
 Thu, 15 Jan 2026 23:27:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:40 +0200
Subject: [PATCH v3 6/9] media: iris: don't specify ubwc_swizzle in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-6-662ac0e0761f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CLwtGbYMk7JPP0q90MTX23YSmAwj3tjnRTfHx1oOcwo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehqux+edbq6z3a9Wwtvn4DrpEkdkreFomTW/
 0GyHvpNqbOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoagAKCRCLPIo+Aiko
 1fzFB/9pnnNJp6fEXrEne1FHN5Ync/IFqS/ZFBzmZieZpTw/pBAe6HMkip31brV2LXiZyM2Spbl
 Z3uUdfVSWgBHzCAZL4Y1BpMnHaNKQ7nyZv9GFFzTBAVkAfIJcKZL+8G1E/JjV/ocDcwhqkFXJmQ
 4LT/65d5sIOcB/eau8UROFDkSi3pqw3BXmISQZYQBi6EfhycwuUQRjyKtOOu76s6Vf0pCQq61qj
 hDwfOJFu576VddZN/81TifqFo3cReZLLZtJM8al0buBeDbOMisdEC05Uze8bf1wFlQWeK+VyvTp
 YWYaZQQe4wnVYjcyMoTZvBSVA+9vK233vviPiZIBfYvd/rk4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=6969e876 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=19NtJfuW7GRvGFya53UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: F1XkUKx4rPqqzjmv4lRkZ-_PnxuRlzBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX/cabfIWVBiRL
 QgQZf1JT9YQD40IcYR64fsfHF34CDy07jRm0RVggfnds4mjpE7T5cunodrlmrOWTbbTJMRS/c+5
 5kcuBxAoXyBH2SazTRKQ2hyOk7Tj8SviAqQTcmBAb4jUbkG8ubQcKmLI5dwskbAijddSPUlwTY5
 e26r0wdWbVkbxswT53FRuTAdXsWXJwyTBBn8io1UNcPyurxejZfKjA1y6a0Qkr7O3aUXU5GCjkv
 O6Vs3xPv3Xg1H+h3HrHsDfIDlwWCzxlPF1ybSgviHRYoQv6qO9eiM1pjpuhAP+zukWxFDKcdfz/
 qGth7Rv+tcwiw3Mo8D+/RaDaFajtcRqJgubQPwaQ2TIvDDamuCG9Tg0dy96Kj9KiZzCexLE5kHr
 5wxWoRm44yIn5DIEbwD/jNGME+KnslXZtocHbBnvKPS0xOt7Eb23izPg/DcV7BzEXOyTHNYM40Q
 aC2oc45dejY1SRYzlow==
X-Proofpoint-GUID: F1XkUKx4rPqqzjmv4lRkZ-_PnxuRlzBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
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

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 6dc0cbaa9c19..a4d9efdbb43b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -170,7 +170,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -180,7 +180,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -190,7 +190,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL3);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8421711dbe60..9f9ee67e4732 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,9 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_swzl_level;
-	u32	bank_swz2_level;
-	u32	bank_swz3_level;
 	u32	bank_spreading;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5ae996d19ffd..0f06066d814a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_swzl_level = 0,
-	.bank_swz2_level = 1,
-	.bank_swz3_level = 1,
 	.bank_spreading = 1,
 };
 

-- 
2.47.3

