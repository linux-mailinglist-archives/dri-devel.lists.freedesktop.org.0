Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8832D0DB8F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9406D10E1C4;
	Sat, 10 Jan 2026 19:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFyxemJ6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLE8ZyYT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAB910E1B1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60A6gLVp3643427
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4H2PI0YQ2vjQe2YmNVHHacsuAm4FcBR4Fa8tcnhZf1I=; b=GFyxemJ6WZXhF5YN
 99Z70WGCf7lKj+2MUVN/ohxcqbykpmJh9e9xj6YrJak8EZaHSzxGrEwlNrfOvFts
 9svoUT9FKFHJT915ZiHlgAsKfP30B1ccKopPTHUStQelqTCrqTkOpwbx/suY1At3
 cc7F9v6aOfM36evR+IYongvQolK8yDGFOLq6swAuAt3/38nqp93ll1232N2Nwefn
 BcVmDI5RKYsI2Fq/VWm1jbUhP/a5j4ifIMuKtPbWok/ZIZUdv8Ws1DVC9eLnqOpU
 HyI4ZJ0Nzx7FdVLKIvjmXJOLy9xbqpaBr3c0uk4bCrFKXXldP32pMLUKHX6lMymT
 msNQ7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu17m5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2e2342803so1343207785a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073882; x=1768678682;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4H2PI0YQ2vjQe2YmNVHHacsuAm4FcBR4Fa8tcnhZf1I=;
 b=XLE8ZyYTDyFADno/aDiquxHItwRTZXAvLHfE/Ht/zpsQyF62sF5of0Ih7evpLaHiFy
 PNmuXUWnPsGVSg+bFmU1k9PEiuf+CKSfZHEINsnL6QKHZE4fpt2bmLYMXkr4UpHjEU15
 URAwOl7asw0zAPkSLJohHT011x0fZBrCgBG9oBmxlpqvQG9QPJKxL/WYUYLC2RMk7CW6
 i6EGynbY7OqRv1Rq0t0SNSbzMaNLshgIf+7thnhMf4eW32XX10Bt5ggFhnowO+FX6mIX
 IzbY3Q49tAw8KKzNaBApMxJ4v6SZlJZpB2SewNP0MeBRTy1tsElqr5mRZ1FSoFSTnmxI
 pVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073882; x=1768678682;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4H2PI0YQ2vjQe2YmNVHHacsuAm4FcBR4Fa8tcnhZf1I=;
 b=Q3WgQGUR+vbFJ6UoWYhez/aYHZqLRc7Xxk7fF9YRBbdz+r/mTUwxJJjzZrErAHcSc3
 3YVBBlfjB/TYY62MOF3t9MkkTz/QoD+ge3pfkQMAcn1EuIBa7fBV8U4Kd5ejbev/YgQT
 WJWgg/uBfAZKpWmxnVlsM8pqSQGdj+luyDVewe2ZQrBnz+WNnFuNB7+CJhxmesbbJhXg
 3rSE5SEco4oRB/BwxJkFtPs+t5WNAL/CxcpJbdI7+Mi/wRNNqUtRSoNJJW3hNgCQO6Nc
 uMVdtCBoZdRVqTY0Gwu1TrIWHTs981C+MDCI22V//otCALMEzs7jy3KtegLSuxkcFD/0
 WiMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRQ2s2wQoEOKj2c0qWrR1NkaYvc+xO6uq3buRBopGlhj1BZdV0JAIHgTpu6UkT5i3GnjNJYUX30Z4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK2R9sLGQRD/vPeSVqMt+/GsYZouQCb0EUnPktwOPCqPYZVfEH
 EiOJN3NeD/cHsFStPrCo9aiHGXvJB+USPeqRHLTdjwb4wIZXYIorHTjZR8wMU6+H4cJIsn2sOEX
 99SgI4uEDdV6hBVIDHljNic07nDqFA/lYBqSqJxQo+JB9La9w7oRfTtwS2anUnu9g/hsfSMw=
X-Gm-Gg: AY/fxX4SZFNjXTGD0svD+B44SidIe4kC0lVeN5hdgajLtmmM6c8044B9fxm5+cFeCHq
 D0u/iPiqFvccnJE8PqI/jz4nmJk7wwQE6vBpDDiLkqp40ab8deegIYSdFVuIMtIOJU1BjBRR9+W
 7BMtj1FG94FtkxifOlwCwYXHFGX9SimXD+QlpkN/sTZHEFJVwj07DFEjK+VmCJh+2a1mvGp0/0B
 QqEor1gO1Fw+A7CLJZkK91S5sfKs9xM1kZIYUibEMf75+RpsLs2RprWpp2mMRt1D0gA+VXA6PwJ
 Mr1sW91O8J04PIw488g71IpVHFN2SGzYfQf45Kt+okGi6XSQNXdBCAedsBkkGiuh7R29Kr2dq56
 Q2StUFMO3NPvNy5qZ3sgFGFZewp1OCfO552hUd3K6iJqta70t8fYEm4+OkpQMu/t5yKPDdA6KjE
 HxE9ldf/iC+9RMTvbvFswkOg8=
X-Received: by 2002:a05:620a:f84:b0:8b2:772b:5f65 with SMTP id
 af79cd13be357-8c38938491dmr1508450485a.22.1768073882172; 
 Sat, 10 Jan 2026 11:38:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvti4R1UNPB/QZuF9f+Ha4QcmnBP+0xwJq190qSad6tb2kK+hmD9j21s2+HaFiLOw8lNJz6w==
X-Received: by 2002:a05:620a:f84:b0:8b2:772b:5f65 with SMTP id
 af79cd13be357-8c38938491dmr1508447085a.22.1768073881639; 
 Sat, 10 Jan 2026 11:38:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:55 +0200
Subject: [PATCH 03/11] media: iris: retrieve UBWC platform configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-3-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v7d6FVRClFDNhGg0CFfiHbvMTmzuP2fLLOXk0xkZx0w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTYzvsLt9XVaTe3NM+J5bnKWTKGCVobJxGE
 OEo6WVBuQ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1e8XCACJ8JwvotX+6V5UDt9kUHKxTMGpeF/vKyGL5+5jYzkCcgyBi4APm1EMBmq6wsYeElyiKf2
 oy3JIC/F1GMe8XLEIzLTJ6ng9K02ee9WOWtUcdnZuRKORb+w/3ciePjqFoUNjddDUzQlwL8Ax6/
 BjcDyf54ZSNt/XixrqY26je+Q1ZXQKqVIYXByZS9b35btR8Ll7r9Kk1JpZimrnL1K7IGuYX28Jc
 gzDgr+/H1okdQaAfZMokxTqsdcAVfGg4P1rTlV2m8p4/lB1ZK6lfW6bHGTN1vV7pkwlRq+Y9Kyd
 U2pvyZ22rLQJdRDBw1TZBaknlz494WJPIg/4RoTibFNMLbX6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bVudf3Wmic86OvpZcsRk7X4jvRKLGF2e
X-Proofpoint-ORIG-GUID: bVudf3Wmic86OvpZcsRk7X4jvRKLGF2e
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6962aa9a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX+KC6lh0x7InW
 zrFhtpPMSNDbV+giAwF2A4H0VuFvOv9QPwxZXaTN6E0fb4MDkEl7CGnyIJhEVVGkcDP8kuzzcT6
 Mcfm8ojLoJOY9ZYxIWvnCtl7xJEB+DFLmpE5DllNunF94OPEIfpZifbg5Fvp3xr4AQ9PyD/oYw4
 eBtjyfFhta2P1RwMY+j5/mnEkkF2LygNRHb5SrfMOjMxviNxx8k1WFsv9Dfaeu1vPbCB0HuvFrK
 tRnA0H/1SVwx/yOmqNyx313i0A9W4ywgbA4Fabs65xfYcMsN8NTjplzxrJy9qOy47LgDBreUlAW
 R/f52ve83bA51JRUaG5r9/Rajvu8RVnDjTe33Dm331UFvJvahGcTNHR1Q2siJjEDvENPhEuvwww
 HzBXNOlJOXX+RMcczmHshGsofg733xC9vnzK7StKNJi+UNUadyK5PKmBSaRqfzdTsb4eus86gtP
 9BIq0NUo6ZSqUd2AVfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
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

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

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

