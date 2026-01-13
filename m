Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BC6D1A74C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C8810E527;
	Tue, 13 Jan 2026 16:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0Vq7b0Z";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QptgjubK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF57110E524
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:40 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DG58vj1294956
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GLGqN4t9/fHBGxOm0fea01TzjR6zf1CFg50+jZFBdiY=; b=p0Vq7b0ZjxkZDsGJ
 6GFEe/6Q9AI+3NSr4+vFRD4eo6OwFegXeuJIg/gZjzoRTSysBPbWuXX7IjGO+jW3
 ml9t5rGswBUcLPbEwJzDlr9wtu+B7Sa4yESVT64P1rwsX/IfCzUJ5WnWKJnNY8Xr
 Ln56hTTFSFKUv4WYkwUiEJemJUQctD93DzwbNoi5//zpaCF94+4p6LsjfEHSKcFh
 fAgu34NK1u9kyS42tvFP/Jah7dJkUoP54bLOukjEx7L8GSooQDd/3t7vvkLoIJY4
 2pVvuxsm2RfeD8kMzCVATTYnjB37d3cvnhjV0/nONFSfGUgCz818y0/TouPgw7fy
 o3ZK2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v05w7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52af6855fso69590385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323459; x=1768928259;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GLGqN4t9/fHBGxOm0fea01TzjR6zf1CFg50+jZFBdiY=;
 b=QptgjubKui5jgL+j64uMdQIzM16YlqSkY6+02caTU4Lc53sy6SWoH4eS3DJMAgl2ol
 AOCgT4Cxjy9FPr1qcgYFlqL/5RmzyvUKkYZvOaOsknmLLYZpaoRFVuI1Es4Kauo93cIP
 x3ImSn5egdJPWv3cJDPsO/FnxFg9ro2b5rSZ3KMhsaSiK+aLM7LNLFTcVB/VOj+jtsDb
 gDp2/ndxMlGhKgTZLnTSRV/zmuVx1n8fqcClqilq1QuseYl1lB/wZcsecYVzRZRG3TEF
 t9g/VRdW2q/87U6Y4F5pgNEgNNO5AIrJoTmTnMSTyrd0GHk+jzV6GdwWWS2/GIFuGT3d
 S9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323459; x=1768928259;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GLGqN4t9/fHBGxOm0fea01TzjR6zf1CFg50+jZFBdiY=;
 b=uSDBW5KlnlnVVV1hZPSmprbmiGK3PTfL/7LuiQFsE8FeDx5HUEbiFBwdTs6G4ZBJwH
 PVAnODc3WTRsOYQDnN0aMlb5++zegmBZJ2OTuTXyezaMYetsxLuYcTxpysN8ru8+A+PY
 vvv9AX7CdI7I7NrVp3yaLzhTQ4CttvRIKdDcv3SNjly4K7RcohE0QV4dyZPKKU7BkyoS
 5fWayXbhKWmS549oa1kQlhjhWbAQcOSV7HIrbtpfYhfznKFPsu+tssHuTiX8VfolW0oJ
 FmQalp1hoZUJlbP1l9+kayHhybW94/d8X09NJ7LjTHvDfLvr+HpXLbzi7KYYlG0luO7M
 xUiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjZGIklFbc2bR7ctiwBI5JLIpsvB+I01oLP2Qp44yIwZQHzBwd1em6r0Xr7s+x1q+kxKloi3/5VKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNLer4zEUADs6fIm6DNHcMF/CiLt2tzSybxlzI5FS3fKBTf+r2
 bdLogMPGEjn8NeCbd9N6g1zfCX4/IpvLjcKPNGidipMRX7MUPLjtOGW/uXLLt6pph9pJKBvLZX3
 d8cRguqpmktHI9ZEdQXZV02Q40OVcUcyDqKQ3JkH8nyGrjY9EjeZE2mWjpZLJNEj7HlbTPIc=
X-Gm-Gg: AY/fxX4AWIPKBxpgzWe5vv0McGgpfCpVMu5lZj5N7vBXJVyG/UT3eTcwslzItZmoQZ8
 SzmPiKYofHt4LdirMz3aLtQhECGSN3iZT+ObZxekQo7c/AwZGhqdowlwSJtrWPfhY43opaC9Y9Y
 Iwmy7Cs5lsZ0uFwnaqZhnrr30Z44sJq2836Vvcd/ug+cQVq7e2YK2NxF8Wgfb+zt8FEFSW0RJ+X
 +390ft6vuUzJN4U9uYn/RZ91yDItgCOkh+oIZ95ZZGmYe1yMq7NrTNzqIfKPsgQcYzReUfdV83V
 Y5Sbbwodtwmcam7OgDWeNdESkVqUX6gYir7eziB/zoZiw3Y8aqx2hlq9P28LHh/K9ySPQ2hYrca
 7kNQwgcwSJ1P2tgmeuNNJn1uRdLV+1MwLXvBYAiW1pQVtddSsy+6a7Hx/SoqWqiJ3WSxnKYUyZa
 Y3Xgj/0N6WLEaLOgYTLSiiiBk=
X-Received: by 2002:a05:620a:4708:b0:8b2:ea3f:2fa5 with SMTP id
 af79cd13be357-8c3893e0447mr2835349185a.69.1768323459201; 
 Tue, 13 Jan 2026 08:57:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXwgZ0fK0yC9neD9oD7YWJrX33cXmHUqEqwH/rowxMvNIvSZblKRs3crCDW3RZIb0RPAUEBA==
X-Received: by 2002:a05:620a:4708:b0:8b2:ea3f:2fa5 with SMTP id
 af79cd13be357-8c3893e0447mr2835345185a.69.1768323458692; 
 Tue, 13 Jan 2026 08:57:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:22 +0200
Subject: [PATCH v2 07/11] media: iris: don't specify bank_spreading in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-7-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AhTbHQYj1BGt1/wq9IUIForMIZJ5fEv6IZwtGavSJvk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlzSaIPzdYafLuiolUkERDzWfFPViyXu9dW4
 oRCsUXW3TOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1fuHCACspYQ1kmZkSJT9/nB0zOed8vpYRIJzry11R9PuiH4hxBuD+9wDeG3gIJ+6y3f+vcNLlz0
 OFQdv8P8wGk2cgTOO9mhDIJO9oTDEJTEtfQDUv49EY3j3Mo4AwQ2RKCSIufNf7WT4gJk8D946e4
 w4aiiQhK7RTP280nagnNT945p6ccLzZPCKLS9YBri5gDsfV+kpTYBIrn1UxTOdvpCBcXxgk2eup
 eog7euByTfuBdVZz4urV0CrTaOm5F/fyfEl03Ti9226WIJHVvGybXNzwvQ2Q0+3SDNU+j8FrZyl
 DH14P31Bmuw8oTxGmXsC9UANAALUEGwg3MuMyesCaT8g/U8E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=69667983 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AdZG_qri3LAqHiqB0KjrUlRLyU5zjU54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX0j8io8zwoyKs
 qbicqDgdpY25YqCRRuJ3+vBZFUUnLPwhZRX36b5yTukdMsTkJyfeHMxycTL8uQPgBqdm4vZ/FX7
 oTvVG80l35SA6dk1Rt315z/78sdX3HtxsTpljGCjINAtoXbInCZrmOHj3aaCQ1ljLafvV+P96Nq
 YnLhW2A3quRA4nRVsvJPaiL1oRR4KaCdfMrRPdzWLvngJK7yOpG97jUyoi5yghq0eJyGGawV7Md
 Zdv15pYnHlI/2Lt/7jCw04uqPZAVHEZqmG1cmh03+aLb5AJjizXdUmOSldnTbV5xEu9BZ2uK2MU
 ZCcyMPGk2NUQ8pUQDOa9mgsxGYJOizp+0wYBLZaYMDd0ZdzGxhQOJ1t77a0t/DSL+5G1Ma1IWGG
 68zOv9UgLRTHx3T7+/3J2hK4JfR1zlck9LajtKTDAF8zuTpwzsZS5TwEzy9ZOsejxa3lQw/I9wh
 s1h5V0OJQAd5EUE5paQ==
X-Proofpoint-GUID: AdZG_qri3LAqHiqB0KjrUlRLyU5zjU54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
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

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
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
index a880751107c7..9945c939cd29 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -199,7 +199,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = ubwc->ubwc_bank_spread;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9f9ee67e4732..f99fcbb8fced 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0f06066d814a..c967db452dec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3

