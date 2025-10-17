Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38829BEB15A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 19:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB2910ECB4;
	Fri, 17 Oct 2025 17:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ii/BKSqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CBD10ECB7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:34:36 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HH23O7009503
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=dYsd/GjttT2s05A76WlHpo8PTH2x+Xn4E45
 9h0a1my8=; b=Ii/BKSqwm3695AX3YrUPuzlQ2KCdAOwKktM6md3eSxnTbmsrXg7
 6rOMtAW/QbXbY62xCiHXrKhZDgMeEZVk9xpn+xEFwx+P2mhjRRWDBTIKAdm+I8mX
 QTQ0uS10LIX8VGLmjqyu8+MjeHG+NiNTeDC1ASmbW/2Ll8/LG9r+pmVQOh8l654F
 skUJISQBPOG6se/pP5XI83va7z/AyH5omYlzNBat8D86kwPdTBNmcEgmKXj1KoAT
 bP0dSCVtQXhXv13kSBgt0PT2FE8enIVq27vZo9eixuYl83FJ2hGOjOZjsiMVOg0F
 ppeYeSsyFlKShHUDN5G6nWIegIceSY+fWYg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0cd0kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:34:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-87c146f81cdso11590066d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 10:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760722475; x=1761327275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dYsd/GjttT2s05A76WlHpo8PTH2x+Xn4E459h0a1my8=;
 b=qOfvyFGJCOgqH19MOJOCj8AaHJ5TN+0SXHsvqZcmQITZAl8OsdKN7oj89QWXY3IBbH
 +UskRsmcsAMo6RBJmStZHZpALyojrciM1Eoyr1F1egyLGcD/ARCwxIP2vvFO6EyleCnS
 ttWbvu0w6y6uLvXWIj9uTMwSyQfmktegugDig+Q2pymV/e2wAA9tf0g2p5yrEWmBDOEJ
 PaZA5zp2x3u42SdK0QSxh6wDq0Wm1FGBBcKpqCkaMuniEFQUqcg1qXuUMdBwY49E2W0g
 fKXkn0K2rA8GW0v8+/BDTYcK/mKbwkdXgBuSpyH+Eo+q7n6jMcUDSXlC/s9GNRERU4VT
 9uig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdxjYJQOJghTGCm+QHG5EKDn4DujHUNz/9R1TtbuvwLEwYZlvBC0HuOguGKoJXdDS6cTG89l1uQmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzsby0ix0g5U14sbUHFsYot4lSs4VWiY76CirKM5enyPDjfGupv
 R1C7bVpDi/FAgudN6gbS55sKy+R0T/OZ3wkgSdKwh1b4URVNtQiIrNmGmkPvthmpFNSMJ2WX23a
 NdaGOmQiK4lyZ7LMGoI96PJOef/0vlke9V5OPGGiwOewZb28qV9uYuQi2HzA6PutmgVr1J0CwHo
 n1S9c8eA==
X-Gm-Gg: ASbGncs7uRE40A8OUB4eZhRGZI6YQ/5dGbODOWz9A2CF2cwVsKu2KqQuYxJT5cz0T0e
 bxzDLHNUqVrwaUakMYKRsgJVr4FiStA3i/9KwzLJf1zJV6my0itPMKkP/4mW9mAYJ3VKYxv25zf
 cTgMQJGBwdvyA2eIC5yD9Hpy+LxRNvLzqAnOSRQ2cNbwoYX9nUhESUw2zZJXep25/vElidFbTd3
 /PJJdYRlSUuVW0e7pG0V1LyjzF1XvUDOuS9sbZUGki3RYqTYsEuH6JLBQIQSOVuWDjcadENerLI
 VWOarSTOZ4xChcmge5k+MP8IEq0mnhijg1Sr4ik4ZzOtuAbISziZPBJvpKL+weGJBU9TsQqPIhj
 U0bmllFe+THG6YqohVUiOfbcA99fKL0tbETQ1X20=
X-Received: by 2002:a05:622a:1391:b0:4e8:a6f8:e3cb with SMTP id
 d75a77b69052e-4e8a6f90f50mr25649011cf.69.1760722474190; 
 Fri, 17 Oct 2025 10:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/lFBuKecVPkwVpoCgUiysER1QwLu9lFDIt77lLJKQKBmlHT/8S8jGBtBO6C7Dk7rpmiTB+g==
X-Received: by 2002:a05:622a:1391:b0:4e8:a6f8:e3cb with SMTP id
 d75a77b69052e-4e8a6f90f50mr25648441cf.69.1760722473712; 
 Fri, 17 Oct 2025 10:34:33 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e8395a34sm27284766b.29.2025.10.17.10.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:34:33 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zack McKevitt <zmckevit@qti.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Subject: [PATCH v2] accel/qaic: Update the sahara image table for AIC200
Date: Fri, 17 Oct 2025 19:34:32 +0200
Message-ID: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e8u69rIJnxtTaZXwLRBHHcfuNee3vOAP
X-Proofpoint-ORIG-GUID: e8u69rIJnxtTaZXwLRBHHcfuNee3vOAP
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f27e2c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=FaqWTh5nWRqmHptS-xsA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX6dhfEOtLRlm2
 F4OdTFBhVSH+wzFtTueuLCBE8dIyVL3az1voCFXQuQmm/k4F2ZtrsLjKSs4ts5bHEouA98bmUHx
 +xfctgubjUAEgAlbw1xB3dvj/vt+vWzKMpuA6l5KrNod/49ghABLp78GMBzFLZ+NTQ7Lo0lGgQE
 nTEiMQKBw84qHt/+Ht7Vu9qN0SNYObT4n/vCU4ZmwfF2WApIv0vEXWhTjaN6vTc/jP1D+P2wxAm
 OQ98gc1SDKl24rnLEKiN32Po3C801zF5OlFUkN/PpJroruhiyFcIQM7TcBlPoHyw5TziwCWOBr4
 s3c0M/2UOmhmTZ20gYFBk3twZMdChJ4/jVblHg3mKQ/8Hz4bnybemE17V/Yi1ZH0ofstepnVXNp
 nQaEoWgGyTRJp4UqMKdonNbAydogJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
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

From: Youssef Samir <quic_yabdulra@quicinc.com>

Update the Sahara image table for the AIC200 to add entries for:
- qupv3fw.elf at id 54
- xbl_config.elf at id 38
- tz_qti_config.mbn at id 76
And move pvs.bin to id 78 to avoid firmware conflict.

Co-developed-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
Changes in V2:
- Squashed the following patches:
  * accel/qaic: Add QuPFW image entry for AIC200
    Link: https://lore.kernel.org/all/20251007161733.424647-1-youssef.abdulrahman@oss.qualcomm.com
  * accel/qaic: Add tz_qti_config.mbn entry for AIC200
    Link: https://lore.kernel.org/all/20251007161929.426336-1-youssef.abdulrahman@oss.qualcomm.com
  * accel/qaic: Add xbl_config image entry for AIC200
    Link: https://lore.kernel.org/all/20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com
- Moved pvs.bin to id 78
---
 drivers/accel/qaic/sahara.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..6ac0384c7dc2 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
 	[23] = "qcom/aic200/aop.mbn",
 	[32] = "qcom/aic200/tz.mbn",
 	[33] = "qcom/aic200/hypvm.mbn",
+	[38] = "qcom/aic200/xbl_config.elf",
 	[39] = "qcom/aic200/aic200_abl.elf",
 	[40] = "qcom/aic200/apdp.mbn",
 	[41] = "qcom/aic200/devcfg.mbn",
@@ -202,6 +203,7 @@ static const char * const aic200_image_table[] = {
 	[49] = "qcom/aic200/shrm.elf",
 	[50] = "qcom/aic200/cpucp.elf",
 	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[54] = "qcom/aic200/qupv3fw.elf",
 	[57] = "qcom/aic200/cpucp_dtbs.elf",
 	[62] = "qcom/aic200/uefi_dtbs.elf",
 	[63] = "qcom/aic200/xbl_ac_config.mbn",
@@ -213,7 +215,8 @@ static const char * const aic200_image_table[] = {
 	[69] = "qcom/aic200/dcd.mbn",
 	[73] = "qcom/aic200/gearvm.mbn",
 	[74] = "qcom/aic200/sti.bin",
-	[75] = "qcom/aic200/pvs.bin",
+	[76] = "qcom/aic200/tz_qti_config.mbn",
+	[78] = "qcom/aic200/pvs.bin",
 };
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
-- 
2.43.0

