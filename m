Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4492D1A746
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387A010E524;
	Tue, 13 Jan 2026 16:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oY6JolT9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pv1lzoX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9936F10E526
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:39 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DDsQQU2071004
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=; b=oY6JolT9I0bdB834
 OAkCxvkKSxiPh82IaeQNhYWatcuEMtj4MG+fJwYXVG7SZMjTuQuDN2WZ1K/B8I6V
 QcDxoABgcx/p/6kotNjkK/B9Wp+zQKeqgQ++xVHXBb+/O4cbc1mHFEzYt1s5Inpz
 OK7O2WUGzBIIwXZkDa+AqeZLidq3c/4R35TKi/PTwuN77ejXKzW/BOT5Xlug06OA
 k7HIBES0TJseoaaAIULW4eVbGiI8LisYVSDun+/wjcQMbV4MOsZg60P4l66MENSt
 BZPzKF7EgeVlylR+dZEuFa4dGc3e89PaVVNslg3YBfjjFGIPjdB+wO3VfPQyJ51I
 rsUlCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8ndt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2dbd36752so1971507185a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323458; x=1768928258;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=;
 b=Pv1lzoX9cnSdG09ifrsKv2hVCLvMl6s+5eXoTou6lrUQ+ET9MVkHxBML5G59oXAj7e
 z+rlMlyV3NGQK/cylV0pfnuBuug+pq8bhZFLXdsFHIZT2F9+mNKsZUC9+sEKzWSrSZ+J
 erUUvDUktULh3521Xq5WiBYD0KMNw+S5W6E5vxou6v9bJQMmaV9HfkTfqXx5U41JnvVk
 32Bon3mNsoCE1hlybjSe+KPIknJmXYEmwkB6J33cEizcbt3EG0jJeRPi5VVmcRLGUgLI
 3Jn/V4I7xLotTCknDLS8GYpd3f6D0bPV6jAXWc/tjG7PNSzOlsK2TlRSCYqjM9c0PDi1
 c8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323458; x=1768928258;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=;
 b=dhmLrc/1ZbLEj+FyDVw86CPc+EXJQNLvra+W9mATQAp/Tf/BDb4RhvzLvpp3yvbvoR
 Y2WYxrD8pi5XdUW+Q9e8EyiIS4gWtCbNUu5kSJa/ndn6cCwsvvKISjUiCJX+d4jbpcoV
 9ayASU128H5SUiY15qUvAG62jR9ShJxnTuparMhTJZKCT2TbEZ7qSKlFhxyA7i4JMVvI
 E1dHKIvKnB2bFESdAVLgwFbzAJntBwNw0S9eNsz7HKOyKKoxqBklyNJtB8MM43onEABu
 oQCg22YMGW00LVG7QoM8jJhb6MAc27xsKuBFPui+pw/tgFY4Q7hvHluGCJ7JZFDMmPBf
 Vl4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI2KfrLu/uuCIH+w0ojxlH+kh52sEXdZZeMCUX9rgSVE5OEHEC8BtixbeFaSanaGthIqQ2NENameE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvWQM668u7sVD8e/HC/NxFMsjRq3pmI1pxxqDFliKLkBicNaRG
 JAUNhn2SoJrAWTusdT5b0XEvSHwD+AL6iM9NZOmp4Rxyp48APoZP8Wo60HOKyM4lRWKfglVeCKn
 JEmOANu4HgPVWfeLdLXmEdIbHvKZblT4h9dhNpjAQjzVm2Yu8n6Nejqt4XwidGJO08oMhQLk=
X-Gm-Gg: AY/fxX6AOZdSkhQqooJu22vQqZA6pXiVLH8deRrEj+POZw5mNMj0BW73LqzhugPqaCD
 xU2b4viVDFcDMTFTJzb7uA7NKOLTU8701mlVd0a5r59Eiv7JkUsHLOz+Jr6q1CIM2KWfHSSCVMh
 hFRiq4L6SREnGCTlNM7Tl7TYqD9OY/DMcOq0RHN6XxhcbTfNswSzb+N2Ni5zDjFkVEFrGZX744C
 mjhGfFOrXSTuMysKXpP+TdocFfrFVdgwOl6G6RbS4mD8wfIl0HlCEXY3FpLWFMdlUceKV8ffTWm
 sX0R/GIEJhleOu/CGfH316/2MXL2zeGDM34dO6DzEPtePjlRwqkI7v7y9NLTOnTKfttLOvenexc
 EyOWdyFEK6gBr96vv4fUXfUZl8Ju4f3FJVel3CM7rGX8jDWVoGvqqyywZFS5EySeccSFk8uLPyx
 0vwWBzZZWQspOHPP5Tx7Mcu4M=
X-Received: by 2002:a05:620a:1901:b0:8b2:1fee:4029 with SMTP id
 af79cd13be357-8c3893eb52emr3097258185a.47.1768323458064; 
 Tue, 13 Jan 2026 08:57:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCnhBVZqobojQVLXPQjzAAmSKy7O7umppS6eUXYFfY2Ev9oYVzzadqdZ3a+yy/xKodNNnH/g==
X-Received: by 2002:a05:620a:1901:b0:8b2:1fee:4029 with SMTP id
 af79cd13be357-8c3893eb52emr3097253985a.47.1768323457373; 
 Tue, 13 Jan 2026 08:57:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:21 +0200
Subject: [PATCH v2 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3157;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fQxY8GjWVfh28Faxz0ICvLnZ7XfYjrCODr7t/XZ3IT0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlz+/4rfxjX3nufGM9uL6JiabX0uiE7N679R
 /W3MXRZu8qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1ZtWCACFa3FyEBbxtmnzw4nZsrVqgP+RQ90bdi2noxWSxt9Jv0Vu8dID28c57bkGJ4DXg7W5tDs
 whZCQvQgz2ACep+5MFJnQsVedpWDix0GBymlqJ3ddLERrjK0oYRvnxjAEG1INCvyBCn7krhos9B
 BGU+msHovll5fZ4X2aKmQsJ6AMulnTjzYc83msqWtPdQInGJe2qu9/eNY595ydBEGmkFPXaG32K
 lOamVuI9Zv8s/UuBg+cbiP9Lb08iqRiNhxnqVME9haId/SuHGiTMdmLgrUNWJoPFBd+jzTeK5f6
 pyCQEVprkq3/9sBHMdsi7Bq+Nw2c8/EJcc507SDOxQ/IAndn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: zRKv0SpJAd9ejpkaGKbZW7cromc8RZlL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX1qeP79p+mAqL
 kYmnwlFHd/L88BbpIDqAQs/CW13tq7dFdZRssGKync5/O5BcAJFt5To7YrpxLnen4mqP9wfmPbD
 VolJC9m2ukKPr+fTOHCVQa92gzFFJJEiBCitBVwe9v7GbcXuo2JOHXqdNQvi6TrdSE+IBvfV6yF
 4r+3wuWCZOEOZKyZmv+5RzHcpQ7qtG/j57x8/k1xWI3BrdQQDpVDU5ypgneTrbdQMAPw59Jendk
 EEug9ztLi2hBnxPnQvCWqzf9TVBX4m3SByOjnpo9ri4+dJ+5hVtL575SvQxuTJIQzGz8v+H/8yY
 ZWdGhKbTBJtUVutb5TNk7Qx+ZwQhVYI+7Ey+xl/eiaiGRfob5APFHFsYKyVw3dJHStSFahJqmDP
 Mtw/Oa2MrBIs0G0LDd/cbJt9g29GmBSTf+dL+3ejugw0dIQpTOJw8QsxiJ4QrOVft13Z7j5S4k3
 J48qYER9ZPaSurnla+A==
X-Proofpoint-ORIG-GUID: zRKv0SpJAd9ejpkaGKbZW7cromc8RZlL
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69667983 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=19NtJfuW7GRvGFya53UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
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

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

