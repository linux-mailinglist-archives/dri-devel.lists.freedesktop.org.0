Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA997D2D2B8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A72D10E80D;
	Fri, 16 Jan 2026 07:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGZEXB9B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUfxtoPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED2D10E80C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMkwFZ3892932
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9XKxSV3npugqCr5qKJ+/bMzEPofZPWIgN1+iQGbZA4s=; b=GGZEXB9BsJS4YR1q
 GnMo0rSPqCuU8Q5EyQrs0btXMall62kDALqebtciHeKdkwepXXXEbiNNREK1OPNs
 wz2JfiMAObgpNCcXUk8t1aoQ+6pxsOQhFlScJGXkvnvE16R9+zAxBq+E1dL27j6S
 n+rbd3ODrZUioKpVz3j3Eg2H0lGLEkQt0rWguKQWLL1XiPGSDeJA+34+sL9P6IVg
 x5Yn9qPYYszKqDz/gM/1d+63oRt3uuL526GaWXnALtpE/gJaf9kjxnnJDFuTqD/Z
 ZJnAkM37LS6Vm8xf36nmGmmSw6S3bxuPUllr8j90lk8QPkzUz7GHiBdxemORLUhH
 8HtMhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b0979v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a4c50fe5so379729485a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548465; x=1769153265;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9XKxSV3npugqCr5qKJ+/bMzEPofZPWIgN1+iQGbZA4s=;
 b=hUfxtoPQX9MuCIfMlhsOSdNuTLEdzfPwDONeXzFf87Rm/VggLG27CbCL1VcUlX+Uf8
 UnZdmQYlwfWJ35X3Kbe3oCLxoR50ftdPusDE2KBaT1SnQ89PD3iLQn4SxZbiXyMjlVfq
 Tx2N+d+wJdvWpDp91b+leq4ay9IFLLkEG1el5XM85hOaSPRM8mMvwgkoHVJtcWVOVwMa
 BXfTT38yUQ2pGJ6gOGY08clJxW84tpW0YuOMRK4TCfUCfckQgW2gnGul+orYzg2v+w/c
 IK+iQWPpiyv4ePHhPneL2X8nDMQbliysqMLMRKRpKpdSWoTxcmvwmXurVJ7viy2D7JfU
 B8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548465; x=1769153265;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9XKxSV3npugqCr5qKJ+/bMzEPofZPWIgN1+iQGbZA4s=;
 b=C8CkeKAkXgbdwfZLNVHZeRBYD3X/WQbWUV88ZSIZahHM2BPnC15WsdQ4L9ng6UNyXJ
 73TcuwHQa83VY4F0X7lCsfv4UW0RSZNHcnhJR8T+nVWOe1KhPayo/ThBfqHkBvQG3uj2
 668EVnEsFfOX+MS/T9sNUGY+kQp+7I0oiIze0dsKu1vXGFrlOrpk+MKper+dhHK6q1Bp
 4fbvBlFrdYfwaxh8SF1OENRw4yuZdenCvNgUAhDe9IAKpP5su/bv4aSZsaMqT6Dv0WvV
 a8JpqfYCBLReT0SMbF2L2sEzerUSMhk63nRdHq1CNABc2JWOQphhAiDfYfFLBONdisuA
 ZKfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVksYNZN8OMFC35/5Nd24tjEWQn9tazev0UHCTC8Svg8rkUQzgAvyXGJKwItzDiTEeMwJHkcXJ0N+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy03TSWwNEw007DWppip6ExVLMw/nu/D3maxMRYtoCYsQfE7Xt7
 eKoenlcr7i4QVskrfA5++yg4AUz162hq1qq/d3J7CQ051KSZPt1dRBH4z/QFsh8B5KmRSY3u9Nk
 MS2sglD6Y5TachrhswBet6yZmfDPtDPpBmLppdAyCEa9Eef+OuxfGfxHIf1fAmbQukBq2rhw=
X-Gm-Gg: AY/fxX5IMl4z4xF5wdQSMQYFC0U1NUHgbpaeGkxTKjLn5WUerNkWGxQw75suNvRNmKH
 JdupwBQFrXhu2Iv5bHxzW1uw5k02HVZhhHNog1WEOvcOt+Hl6JKhNJAa1BtAFli6HHKEqkepN0S
 nDz2EeI85eC63yAmmetaTa3IjN8e1dlzsxBwWClfN+JuBu5svqiw1h8ZANX6TUgMMqbwRI2Ia0Z
 K55zOFELIAu16cl5D2rctGBwxNAiD14+2kRU5+vXLtMES8Y838nyUz1MYltqoY4U/lSQFFOolaI
 Rm6r12W4SbWJYlQGxL0rL6FePouVZtxRT+EnzFnxIkYhVHsZJ3Tw0iZ2FRr4rROgruvmVibiGxd
 f7mGaxWtQjDeDt26XWedr3l3TN59dnb6JRbDAwfaM6q7vqPU+4VUhyCSu+ahusRAlbhIiHNe/C9
 x+9FRsgnhAiWUYIuuYoWHwtE0=
X-Received: by 2002:a05:620a:480c:b0:82e:ef43:38f0 with SMTP id
 af79cd13be357-8c6a680c591mr276448885a.0.1768548464911; 
 Thu, 15 Jan 2026 23:27:44 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:82e:ef43:38f0 with SMTP id
 af79cd13be357-8c6a680c591mr276446785a.0.1768548464351; 
 Thu, 15 Jan 2026 23:27:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:37 +0200
Subject: [PATCH v3 3/9] media: iris: retrieve UBWC platform configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-3-662ac0e0761f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NJlond/l+pvaPzxG2+3Rh8GZXYyqIPyIRMdtfABwyGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpSLK7eOuMmp9/+kNLG1ooHmenK9K3vg4xt
 jzmr6bz2tiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1dThB/wKfxVwqr2XC5pORtSw1x3vtVL2Rn5Xauf2HTownr4jUtpxhFHFEG+8gh6dgZl1VQz/cA6
 mi92iIz8/PSP0oHvNMPpENoQi5RU8GwE4gdeVvCMcVcZqQEe4B2PTYOdLzoZJ5HhV9TiGcWyGQ1
 nhoMse1XdTg6+Qp9C7VKoQF6WbtrpicZMXpL4o3YO2LO9dIJYFxokCgs9ac0wg7oI404iK3j2ne
 Rm5pIPj/Xv3heMl5ooTMOGWCHnghyBeJTltAu4nK06CSKPBkAIPzaYRi1Z186TWcDzQh/G/hU/G
 zRx7tgHbbXEE2ckLyWH33YKnzu86ZGI23xhBwyGcO5OWuyfo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: nh32E5zb0Y39Z2Ni7GaQ-Hk_YMT3qNDZ
X-Proofpoint-ORIG-GUID: nh32E5zb0Y39Z2Ni7GaQ-Hk_YMT3qNDZ
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=6969e871 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX1Zob0rdQSgVj
 O8TwOWQu7tJXP9dYafPz/90Vtn2BzOEgJVG3HL/AR7FE0s48dhCdsERK8Xo2JuF//mp3TgM6XI6
 liYatSiOo72aCuwtVuElc98Q2ZublezPcHET3Bxx9dgtFAFAdaJizm5ch7iEP0hpCq4yo/+WxVe
 ZxRocnNnP5DfdmJJQObSfYhiKC6hSOR7RIXHyrUEM9L39aJ4MEU+OUgPgMdPIH1BJCWz8SzPb3S
 8c4pOhFQDUAu005uJfo/seW4uG18U53LEAnqXZBNVTvIMBxDrtf33gSSmDVZjpiYjWgshPXcZAX
 XzK0v6iaQr0cMsVWU7Gy6UJjj+tvwFnNUByViKfq5evLQWttetJ2aM3vHjX2BTzjsHmcZ5xP3u0
 a2ayIBA1/jLPEPip7eP/ZyafvM3mWzY+N6UCcJl8XlFReT8l3AEWvZ6hKtscbN/Ok/d1ju8xOEa
 KPe6/UlKitRxkkKbObg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
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

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig      | 1 +
 drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
 drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..39b06de6c3e6 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
+        select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..d10a03aa5685 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -30,6 +30,8 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+struct qcom_ubwc_cfg_data;
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -52,6 +54,7 @@ enum domain_type {
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
+ * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
  * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
@@ -95,6 +98,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
+	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
 	dma_addr_t				sfr_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9bc9b34c2576..85e531b35ecf 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -10,6 +10,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/ubwc.h>
 
 #include "iris_core.h"
 #include "iris_ctrls.h"
@@ -248,6 +249,10 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
+	core->ubwc_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(core->ubwc_cfg))
+		return PTR_ERR(core->ubwc_cfg);
+
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
 	if (ret)

-- 
2.47.3

