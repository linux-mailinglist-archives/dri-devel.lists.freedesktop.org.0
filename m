Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7499D1A731
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3537810E520;
	Tue, 13 Jan 2026 16:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEN4LSf/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkMZ3EQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314A10E51E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:33 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DCW4fi3815839
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ro+3CJlEZW1JxIMktHpjPjGXooS/+lR4TeEfoGxJw10=; b=oEN4LSf/uh3mgGvI
 JCHyBf3lbKGN++C7Jb9zdIeogeT9ndns0wEy7On3NA/ag02QEaRLTF9R/Gkd5I/0
 UhM3le1hj6yabFUg/RLfphzP/Oc32aHNk+7UcyMLo9Snj94O5zpVLnxIKt9iXmEy
 WMnZi+YOZXoqjWpphuFqyDpSjNE8vtexAtBb1wQ8CY6gW9EThcO+UcZlCvqwzRQ2
 gDh3sEW7QyuUF0zJFDrc16G/ZdJD4Wqx7hSX2jWTtfGUZ6ND1eqpesThkcGB2D4j
 DHT4yKyQxqGmVOf5lnwDmZfyjSBh6a9vu0UoKECAA4IPAejiYTRKq8FxpyI83gyL
 3Lb4qw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55t7a8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8ba026720eeso656231585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323452; x=1768928252;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ro+3CJlEZW1JxIMktHpjPjGXooS/+lR4TeEfoGxJw10=;
 b=FkMZ3EQB9eL5IhFjw9MDKmbBomHvopO1vIqWX2uT6zdOPCJ1HRgmvRRl0r7CKVuUYc
 1NIfDx8bwrRtjs/fL9BogJp5yqkfHmDvOVV119EZKPZs70JrNqFsnJv5FHXAjBHu1PTg
 NQ4tEoH+oDmk04D0l3HSB88Cqq2ltuYkmvr6d+rAdktx4h3tvzkVKBTox1jYP2TfTGqt
 KbN121uKpwOZleLC2wGhoxKkEA5xkcgGL58T5XcT8guRa8v+lZHHHw0kGvAX6ME5Zc5o
 25pzobG4M/vc1bTySWftizaodPzO6EpdZbsAn7/cVcCt/pnK8/283dVRCD0al3FCfsUw
 6I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323452; x=1768928252;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ro+3CJlEZW1JxIMktHpjPjGXooS/+lR4TeEfoGxJw10=;
 b=n3qt6kjT6oKktVYPhdj5qHUqN5XPpVXVCATm5m7JBmlrQwkTQ2kOVFmZlaPFBLSbGS
 fq8K4dR/cUhObIa6/R52X5ZRWMkuYLGQ6mX9TqpFBl1Fx8YlKXXdHp5dmXKTw6LaxcRV
 smulQXJ5bchOYqX+BNHrwm9AOI8dYQ47CN1SHaDS14p6j3+9O3uoJBVdlCX2hW2C893Y
 ntpHwW4CNW+QcXKjjxL2dxwT3LS1slGg3X8J7I0ubZB/eh2oAqLmEnUxtWMWfKJSDWKw
 HWJBVVAIZ3YO+jifcNdqYayIDgZEVseAGSUHek1rKDumF0jc+9fe9DdrHA/y0cOAmEGa
 8TyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG8Bs/AfgoE8NJmLq7RYObOvhMmHWRDEeAtlKuyIKSSYgy8aBJ+3Tm7r0OSJbXXGjqGlqvPot5qZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWpjZ4hlgXOZCyxY9T8cPqy/2Y0fIUZNvHnRr8P2b7RlGoXiav
 yVJj4LNEz4DoPkMDp5xOBmQMUQQD1w0ABbC4nvEJ+07CypPhDk5LPQ/cwht9Kc0X8U//MV88we8
 QEEUAWIyi203e5UFopv8dezMVDEzMXBYfx808LbeIZw5/fLFsWHf4t7bdd8y5SM4st0LKRI0=
X-Gm-Gg: AY/fxX6/bxy23py5kAWmM+iJZ9ahoocCXpYfaRlin7ZuRVKbHsHAK/Dp6nZ/A+XXNjW
 yn9GKaBpHXALf5/mwyPGpxiMq87bbGA6bxFCAkM8YrQLayU0XGb3nLMGE79e0fHRstJoPFIhn6j
 ga32cxntNJS8k/e+aoifYKqCJuLOuPgYDWne3yDzpOWtHxHFHIwgfmuoiiRe8PvJMROOx3DFpS0
 w4S3F6fTFa/iLWkfUc5Zt4YQhR8mJUslQ60TfR6CLWk5wS/Y7CpmUvfolPBjKt7phi0oSx6Y8Lk
 0rjigmeYFdpXSMsW/gMkhh7BwLuv9f6shEaWwG9DlKQXqs6J1N9Zv6kVpCOdVOVPWZkKz8lEObl
 iy+b7Iil+nRFx1jh+C9P0U6xin6iLamJGESTSSQe7WleG8Nlis8/KGW44ce+YUcTbwPzubrL6dk
 9yM8bkcKxrJ5tSvI0qzgDylXM=
X-Received: by 2002:a05:620a:410d:b0:85b:cd94:71fe with SMTP id
 af79cd13be357-8c38939d0b3mr3069765785a.33.1768323451766; 
 Tue, 13 Jan 2026 08:57:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPHLZZnThHtTThEN8TS1xdqz6/f67rjIpBLh9wnaWrGH00fV2A1b/2bIaew/04IQxVVL+JJQ==
X-Received: by 2002:a05:620a:410d:b0:85b:cd94:71fe with SMTP id
 af79cd13be357-8c38939d0b3mr3069760785a.33.1768323451032; 
 Tue, 13 Jan 2026 08:57:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:18 +0200
Subject: [PATCH v2 03/11] media: iris: retrieve UBWC platform configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3148;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HxFHaMd8bpe8kcSdhwDEmlVS7rhk4N3Se+Zkawib6CY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlzPuHC0ez/0yoHc10b5Tkr41czJWLTpbCaa
 hgBcrNbGT+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1eZUB/9+N0Ywz0eY1QGt5LDLkbXaFL0+wZkWQlc8fWbBMZ+R/ROFJY13kyW35e+x+2EuVe/w8S0
 BLMKr+OCrK3VcH+GPkUwfu0XeMGQAzGE6LxGg0vmHgYXhZNt5ivjMYIEjLv8Z5uFMQmRwA1A6XA
 pfZjiO92Dt072IUGnIlqlLZWauMNFX+U1GbZAdQerwamJ7mkjJoU5Yq7RDazTNfENgvLWXnGsRF
 eVm8hwK0a3Ukv+E6BJaT6JguMAagAyzjYALEFSwMLBfYwcUEWikDUScPfCgkFbtjns1YfExJgQY
 +vlkETBKu38DBiJutiZc3IErf1Ll3g7sd6GfFZUeM4cOpJKz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HXsAr2LkpUwT2Mi71xeijdC9OMyL0uVE
X-Proofpoint-ORIG-GUID: HXsAr2LkpUwT2Mi71xeijdC9OMyL0uVE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX0AT5lf74iVPI
 wY/vAqt70/orEYXBDA2q1ui30ohXGBr9S59e/SdNDi9tqV/YFJ2ofPnHWedbgOdBgvXGzd4JND+
 AxLJ68SqAIveTlC/nLNoJrx6AeK5cWukm0M4wWr1i1xDgxezgZbGSXKiN4Nr92ThwxdxxxQrAud
 zhjXDJ9yd6B/+ORDFTjvKTqb5z2c2Pj5KQYX2K54yqRuUsC+F1hVf9Moxl3TCbwFRYRiSQbTYNX
 n+6f07u+82nY5iUNlsQQ+4fFuIyUJOXjPraEGz0Lwo+IjCD5SRJBnvPQt3LgbcX+5QuzQm3wNOF
 ZiGNW08CeVvgRI/XE28C2gntLIEntzYiFEmmFAg1aHUZB7rZDKQBFFCFn1bOIwceXef/EXX2cPk
 k2+0X+3b0w6hDFzyFpf6tXU00BQBLNTMW9RrFOoxzSCWItZtriK8ymQ6wHH4mJYW0ptZlWzEGQ/
 QAlLXgW650qoI9tma9Q==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=6966797d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
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

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

