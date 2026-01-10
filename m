Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82C8D0DBBD
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF3810E229;
	Sat, 10 Jan 2026 19:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6VOGJUG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HT7Gr9H0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1025C10E1C1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60A6eB4d3480083
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=; b=E6VOGJUGy61sVQhC
 sTL6ONEeLNvGbeqIEZSCr7OTYTbQQKSl3okuOUlb6Ptntc4xzteoRxhxUZQaFXVm
 2RRSkCuTUdH6U0C/yz9XjzGgt84YdUDtukdixmVfzQ+Yu6vdUY6+Tiz/mk8in0zn
 uRXBI7v49eCpFQnRyIVh1GY5sY6lIDAMgH4HJUelFLIE84mD36TPNUSpUNYqmbSv
 JpaO1Cn5n5wkV6xrCLGJQ0WV60idtUdXl8ZH5gB4bMQ2RWr+vjFchfgPwaj/IlYZ
 vWaCmBZBQAXKATq5U9fFmQQJ1xZhaJ9BpXBROTmu2ZFdFs0dTsp5Nwmn6PsbT0xk
 +jgc9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeush6n6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b259f0da04so1405754285a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073885; x=1768678685;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=;
 b=HT7Gr9H0YQjQ4043x9XQ7Bpva7TcinAaFLJJq1TjX+7fRDAAqOTEiUfqgj34471xBJ
 tCQ7yQWGxgjyxTfBuhmxm2gppP9TkaOTlRIvVxZh68bb2XuHAbX7fUN3q+Mbb6ZI1olP
 x7DECQO3sfBU7dA4MQ06oC+KrVe8Fcr6qqUuoZHQgl5kBNEOMXrfyn1EwUi1TeKtqB1W
 31ilyAW154N96pghPTmxRo6qde/uRhNXrpT1P+f50/VWiHf15NIG91jd9cVpasCltn1B
 R3ASlWaZjTIvu8/GPAercam/DtdP8yIiGHN2auZBxn1gM1801GctqH+cYqIz+HL5QbGX
 7QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073885; x=1768678685;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=;
 b=bB1gJ+NSNXKt/0T/Qu8ve3SVIl6qkDV7CoyswQLkLnyZVy3rnXXMDwJumfTLYHqEgi
 3ISM1DOKGQOaK+2UJIMnmkQ+VSL3KRuj3wJgSNqhpYJSHb3hKEs6BLF9AmO1oXyN3z96
 C9+u5mhbbPtTvi8dlqOBR42HPpetRgQAu8SDXkPhfOuCUjy7tjEaU+JUBiWItySqp+wW
 jfDxK4hsuoBXjikwZVh+B0lHVzEkAIL9KadCq+KMva5iXA0irJSw8V+prU9Psmc5uJ1c
 bdqe1iregx/YALL5XLsdjJ1l29e6VQxl607oUfEA6tuwnlioY8yTLj2+/ymLkQHa7RgO
 jj3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYi2XltPeuUFiwx3DZuxwInqPaaMgFdOCWZyxx0DnD3Ow/Mx7PoNHGbEpcDMnpJVkIyuakfotuurE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHzdWEDub99x/ptXNykwa5VZpLqfxy4MENzmCNqfc7e8kKBind
 d8KKbRYcM1Use2EZKvjzDlm3uOMn1CBg/jOGl0OTFuo9DeQxOOvb5UwyfKzeu53zUndtuaFveUl
 dL6sriVDtloYBk+jivIkUOqW7Dd4B0us/Hy1I+/s+1anZHlOW0W1TcJczVukDDQ+yYoQ/jRI=
X-Gm-Gg: AY/fxX4tIRBceHtea47xjVZxw638Q0AwEbBYBfGpV1h3aVjNDEUIB0UZz9mpTkeJQ9I
 USAcBV0Axf2X4RjiY7TcVGflbDnW9tIh7p7eh36RFP9CNuv7V2pruRxNK66+L4w7pnvchudJzKb
 no8Jno2XamkkHWIfULSV3Qs/6pMYI6MTGs0mGxWWaj1tm0Eb8XTMtGJxT0hN372JwkLODMe/cIL
 7oTsn29PgQ8S08HzVglEbw6xSFq/QO/JwXrJmLKDhHrhYE6fl8XmSbXbC6hXPGqBlgY96vkpFdk
 7YLFwrasSnJoiRdwWHqYU2e0Fgu4ubXa/TudL6sRXv97FN5Iztpj7qvx6AhQ/XDhLX7DNxYMBow
 s4OtRDiZlhqlcFqQ/pcu5XiIvFtIFJKcW1vkRKlu4u2R0h5fP/qki3BCj6brkGkvfdddoOh7x3+
 U67P1CcIjLveKE69E/pw67FLA=
X-Received: by 2002:a05:620a:1925:b0:8b2:ea3f:2f91 with SMTP id
 af79cd13be357-8c38941be22mr1791695185a.81.1768073885489; 
 Sat, 10 Jan 2026 11:38:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIKWgn/ESS0qupy6xBZrxuNNEEt1VDukrNT5CaPVcHGZGReo2NFsBi2b+nv6ZXh9qRMm0aJg==
X-Received: by 2002:a05:620a:1925:b0:8b2:ea3f:2f91 with SMTP id
 af79cd13be357-8c38941be22mr1791693585a.81.1768073885052; 
 Sat, 10 Jan 2026 11:38:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:58 +0200
Subject: [PATCH 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3036;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wPApkxuh4lfLkguH9VNNQc3BFntt8VOiO6TMdbr3Zds=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTqJmApBFFw10nL1vWSv+/MlslTeTh12Vy7
 IceARZggeaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1QHuB/9SDh8YAvc7H5s3wL2CsuB8vGeKPCPurzevmcKRHH1YnrOFa7QKcZ37MhNPhXNFF6K1xxp
 jsh+JHZLsbflUJExjO1oH36XdfZg2hDrpk47mqwbOhd6x6RKZJBVUwJOxbYS+qofypTKBbliKEw
 qMJfjCjO8jHHO7/a7U5SSxk+QREto7FgnTdDPK0DbjzWAPIh9E/RX05mQmDDqq/VFCXNHyk8YJR
 Ka8rPLLcuK6cTDY8ZxwEhTMtt8934hmWXJEikYkHY90pN6ShtsSOU0N69ORl5JUbekwAuxb9nHz
 bCX2FMRAD/6/NTjuZQvhq8GbuxVkYsnoaCdJ8cwYzGuYjoPH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: RPLg7Mlen5rPihXZI2I32S3Y3Ug3h0Sl
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=6962aa9e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: RPLg7Mlen5rPihXZI2I32S3Y3Ug3h0Sl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX+ImlOOJAlz0z
 6ID5Ge1iiM7WxjZ4Vro02nC2DCJLWQsPe3VrakbN3M3E2mZLnG8zxDhKOBaVLKSKvqsk94GhHQV
 8B8FrOXlKdgRYn3sZ2gBNYXtOEfynOWNKWoPmBVwGlyaD0rLFFJtXMhVl6a8tWFPxZSrhm6f1+L
 RaRzHXMPiCEWJmbSLz9upQ6km8V3c2TmVU61VB5c95VWuyxmi11cPejtWO/zpaAPl9wpbkvakhx
 6t9cNOfr3eY9/MKMzxagjE9SpRKQoEZdDMMrasYCC0+EkLXFHB1dEKf4NRJQ86UZdZUyMrQArbj
 TOc/u0TUaB0f6mz0z2GQIXMqaoMtKOYMyqTuglIHjXsNKN2F1yttSyK9d/WV3uttqQ49QBmvIpQ
 H4Ee6PsO3Fez1RXYxgrpvPr6o9H7ICV6D+EXzuEK9EKganzXLWA2nqU8sRnI8emWxJDU0Z+Cv22
 vhJ3vkA2YUbUB8vLXUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100173
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a4e60e9d32a4..a880751107c7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
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

