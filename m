Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CB9BC214A
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E35410E6E4;
	Tue,  7 Oct 2025 16:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRYsPwKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD1A10E6E4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 16:17:37 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597EjpZf011056
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 16:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=IZE6vPm/mR2Vdzuy+jmtdhyTKAyBvn+66g0
 GdcTYzUE=; b=BRYsPwKwhISpGnkR8+SyG/cMFPJpEnONriZiEA3vpmJmCZ6KKpi
 nZTA6gj7U5qaEpfGMxzP+h3cvGVcCilsSovUoptRwWVwxUuQWR053sGMauqN8j7G
 nty3uu3byMTMWH5ggyF6P+/0k6abj7mpR0vN5pKCc4H7kc5pTqfjAvKblwB1BRKx
 Bz8rmCn4Q2BN0eWq8aalfdowRDhs1BCuS/glcZ2ncvmAuiqnTlTYxY384gTYU55J
 FgPl5AAbxq6WcGcssJXD9h5PqArFeRxaFMUVZVlkBUWbR069Z9dVfio7J67e3Jm9
 AMWTF2ZxK1mYmDoo5kdvpzzzPW0gOH/DKmA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wkra24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 16:17:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-54a8b34ae3aso3406183e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 09:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759853855; x=1760458655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IZE6vPm/mR2Vdzuy+jmtdhyTKAyBvn+66g0GdcTYzUE=;
 b=uvoB4IIGpACpGCYIBieFGaPhG4Yc+t8GsYJDiwSw0I2DIUf5BhI6DK0xBoATi3OqWE
 4h4uiqxMbTu5k6iX3w6ZAwbl//bnFYiyFTR5kjVTXJHVV0WsFRVCLNqjxs+aTbO97f7A
 342aaSeJ5nojnlOuAaMj27BOKNplIEI95dgUhSYfg57unFSwpDmQu6caNXgvrGobCeMh
 y/8c9pR6lHetCP8jKGjZ1s1MEwGOdFSCI3mPKpsempKb92u94rs8dlwwVzf2+2Av6QHO
 XsQY3QQELhF8fjMT5imStfsoZsp9Cp1ELHDcy/sxp8kN0m4QiWJvq8WjCN5ta+89JLRX
 b/Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8qtclp4hwR3GIXLvnQIoJz0gHFttMk/VFikYoGMxzVXsln+DLN/YEo76itsXUEB9hC232XpR2fTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYt2FFNGJGO279jNJuJutT9R4f0bEm6lYblI9MmVqHoW1j/ouH
 /7uaPXYsjHo3wVDkokO0mSAQaeaUVW/6kYO/XwpZTJ2Fgfl/vumqkSSGJG7miJsm4QhZwyqjIZx
 /te0myKjDdNSF/3A13Tpaw2Rg0e/xkvk4fZejCbAyrg9pS97xHoVqKysD5egvPVrM1SMt1OM=
X-Gm-Gg: ASbGncvptfr2YU3NGdNkmolqLTOdOvcMM2W8Ql6FlqylVL+3NMsjJifc8a4wBJuYSOO
 9WS4KnaUZ9m9Hnece/nq8PS+QvxlU6IOlU4FZLR+oASGiRqbhQMMJKDJJkab1yzgmYANOmppdVK
 Nl49V+mMqCSZ4oBQCN6tV5O6QrEC1fZ0pvZQYu+5umjR+BZlQ+YtouRIp5y/JaTrXtCIfIJ3j4J
 5JSUTfbmUiPzTnlRmaLD7fo02ssWj4WxPJuOqHYlwlG++mWDX5FQ7MIEUFLoRwicia41IrXJPLR
 cp062ZmkeuVFdIpYqgodO5yWsZWuhPP28gY/54GXYqxeWlyNO8s6QG7//81Resdy+AeH79iywfy
 f3M7e+zGmvg==
X-Received: by 2002:a05:6122:320a:b0:54a:721a:e4db with SMTP id
 71dfb90a1353d-554b8a70d75mr102740e0c.3.1759853855132; 
 Tue, 07 Oct 2025 09:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe1uPOLGMhSgUB9H4U78fo2BYswE+ye7kZS5YxkfM9h1TqIT/jN8eZnr1dbhNpAeuCOMLhIw==
X-Received: by 2002:a05:6122:320a:b0:54a:721a:e4db with SMTP id
 71dfb90a1353d-554b8a70d75mr102711e0c.3.1759853854512; 
 Tue, 07 Oct 2025 09:17:34 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869c4e5d8sm1413174866b.82.2025.10.07.09.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 09:17:34 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Add QuPFW image entry for AIC200
Date: Tue,  7 Oct 2025 18:17:33 +0200
Message-ID: <20251007161733.424647-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfX9pkk+bwxxW6w
 lfBVwYwlk2a98OH21Vbij/TcIV/7c7szpRna4hCfFZUcfHobCd5uyrYCqlrp1DEBK+dZPuTlQjp
 mgp8ULeOw177lfzVVMTCHWGfJBwPbm8NZFLwJpDGOT/LGj6yAmKddBim4kr9M0neOM3PpuQJmvR
 sLPi4vXc21klGmOK0K1M12k/xE4ofiNF1rW+1va5vSQ3WliRZdITSEkcm8VNOMhOJMOr1tnpzqh
 f/UjrVESnXC4bc47AGbGEfQYkaBIvVzVb2M3NiAMgWDljuVxVFAGnv5v/lDCrPqJhtATXYzRtxy
 AiTQ0GF33aMuDym8Rb7sj5qGchUVIliyt+r975v4KlYMOvSBc18F/EyW0uzYS9Igb531jsMQTfC
 kYyqsH3IE4fft9OqOhfXOnbsFWeRBA==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e53d20 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ToPsW-EOJ6-KaudcJkcA:9
 a=XD7yVLdPMpWraOa8Un9W:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PMzs_nVO2pbw-VKiWB7K1P641L1zhmIB
X-Proofpoint-ORIG-GUID: PMzs_nVO2pbw-VKiWB7K1P641L1zhmIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117
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

Update the Sahara image table for the AIC200 to add an entry for QuPFW
image at id 54.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/sahara.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..3137fdf20be6 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -202,6 +202,7 @@ static const char * const aic200_image_table[] = {
 	[49] = "qcom/aic200/shrm.elf",
 	[50] = "qcom/aic200/cpucp.elf",
 	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[54] = "qcom/aic200/qupv3fw.elf",
 	[57] = "qcom/aic200/cpucp_dtbs.elf",
 	[62] = "qcom/aic200/uefi_dtbs.elf",
 	[63] = "qcom/aic200/xbl_ac_config.mbn",
-- 
2.43.0

