Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1335AAD4161
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 19:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB8C10E134;
	Tue, 10 Jun 2025 17:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6fpe9tP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FE810E121
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 17:59:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AHIvqZ017182
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 17:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=HdRdwAi5R4mg7+CZqegw72RDGkaSuNv85KQ
 OZooFeP4=; b=c6fpe9tP3IIguRdAG2VVxcPkbKJpU+JY3P3BblW8vTpTlaUzDo5
 BDMIjMMxKnDHzXaJA1Fx63K1/w1k77Bh3JkZ+2Hv/WWUrYJAeCWT2jZF3wQlyXtR
 t9WRrgCYJf0AVEF4x+Y69MVpyswiKl3ATvzFgWJdT89slIHwc+Zep1tKQQmCp2D0
 rxQg0r3erau4WfUZlLIPXrqYxomoEXBxvoW97kMZqAQKGirGNTudk6RFkFo3kV6p
 nQMfAXfBMz9ZLrJ35Syg21Lg83dKc6u+9IKSQ6LL7A69pBThpK212stct4Lmc2zs
 UvR4HfClcKOCkbthzidww/EZ9qUxLTyHdNA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mck3q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 17:59:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23632fd6248so13963215ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 10:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749578364; x=1750183164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HdRdwAi5R4mg7+CZqegw72RDGkaSuNv85KQOZooFeP4=;
 b=RinqUmhmupJldzK9UyDBG4J9AjQsF3hY04P9RKVJq1u+0ySYpFw/R53sGA+jhqkyMe
 DpKlxE72xS9QsHWCtl+5EFXhe7nP8g1qEvVdS9xMLD064/C1Ev1Y2z9tsiuU///C+2ZA
 z1trmJxGanoXGgHhV5IT+0BOeMT/p/dd0U9hHAV33Uj0a0rp9peJrt+0MWtBuha2A+ps
 wSSvlY7Ym7Pxk7eRAUp+xfYSJeEPBadxRg3w+I6Zggkhi3iN5eqMkZZNSqG5YQVQ/dgu
 kCocYvN8Qt/aYQOq8muff2Oc+RsuWY1DcMzcbZCIWOmKRwWCQJV+8c2KGBi/rZziEHKa
 ZlzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0r/r6xbxkTGA8d39l+pkFJTtNyt8eqsj/SAPsb3H4iLiIv+LB0/Cc+iNKeG5SlrXYNIJ2f0INMFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg0YJHnH75EAIXbPbtI3z+aVgOtoUABoL1yFk+S4RPiGVloTOd
 i3zzLw4NycYEWaAjGd9t60gntIqN/VlhyUZiWOPWNbJR0umCVevEX0bXn2nMQCd9fihh714O7j+
 0r2DTb8OACfZLF9/ZpEvxm1qgPf48AOQWwqIgVG4b4SxKwmHcnKSzjkOByjAxiN0C28xg4JlKWY
 TgjPI=
X-Gm-Gg: ASbGnct0xj7XtShVeuBBHIvUTRe/p6KlyW8sR0nqUmXH0v4Cwipb45WTWBGb46d+MpR
 Y0eFvz+skUv1yTnDXMdHehPcLnphAvyWA0TkgdW/yiJjXYjp9HhZiI+dgDJD2ek6RFKjve6ybuM
 PzpGnKjTyO/k7NQ9Eg1gCNNfCGDDQadGXE4/stM8jb6y5yY26UiTjS9xnghpnYu1lVXiHUlbf9P
 O4JS6fQodWDRSJt7E4z0fXru3A1WE4HSANlOnb8Flk5Uqv9soF8sytQravjulVt57KbSofIElQz
 nmJxlP+Oo1csHPDW5VXyk+4MN7rYoj/iVqQUckJzAqhf5hAMSW9nqMxpujP+/HhdjGfhVzw=
X-Received: by 2002:a17:903:8c7:b0:235:c9a7:d5f5 with SMTP id
 d9443c01a7336-23641a9e732mr2753405ad.13.1749578363609; 
 Tue, 10 Jun 2025 10:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/R/oyCTjIMyBrFffehV01N2xGnaQ7ZprY81iHDm8RPqdVN33MzJSoYmS6cZGq8g2YH9MZrg==
X-Received: by 2002:a17:903:8c7:b0:235:c9a7:d5f5 with SMTP id
 d9443c01a7336-23641a9e732mr2753055ad.13.1749578363199; 
 Tue, 10 Jun 2025 10:59:23 -0700 (PDT)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236034059cbsm73798635ad.165.2025.06.10.10.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 10:59:22 -0700 (PDT)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, quic_yabdulra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] accel/qaic: Use dev_printk() in RAS
Date: Tue, 10 Jun 2025 11:59:12 -0600
Message-Id: <20250610175912.2086773-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6848727d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=EUspDBNiAAAA:8
 a=HoyUafP1cdkc2dKxyUcA:9 a=uG9DUKGECoFWVXl0Dc02:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: 80LLVUQUNsvKnJ9Vv2IpyIFRn-3MM-ch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE0NiBTYWx0ZWRfX20lau4xEz1sQ
 FL+D2i7e2ZenmQoaY4sWhplZxUcYxuBGJ5A/zxr1jP/lZ1og/MERBZZuOfwAPFXXkcRblR/NU8m
 1l9AfVtc23fbwoRLTbZ96ngJXAXWCgUasX0O2YU9GbyFNSetavjASqbfZt6VCPEm4OkEwPAY61C
 AuHbQ9vpexGDV+1RRANVOcZwbzM1F2phQ2lc6dl9Ig/yxUOAeP3jXevWd1x/Sjp/KJlNu3ur/D1
 qA227AnX/fe930BnbG/nRQgAsiBIjegeR375jHDnwWOhvQxab7CpUOIthu7Tz3nBAju0ksgOOgR
 EbRAdoRRBi+nu+ZWvwFLY2F/viBRDh6J4nEEPceZV6SqhKBVWNrCkKUz+IAWbM+VNDnopGqQ8CL
 hzSIMEdiVDXJCjSP1AK25YWc9Cp1kG3P1K7P3aNLUWr89AqFPkpvTtWvMfMWBbG1f6adeuGD
X-Proofpoint-GUID: 80LLVUQUNsvKnJ9Vv2IpyIFRn-3MM-ch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100146
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

pci_printk() was removed with commit 1c8a0ed2043c ("PCI: Remove unused pci_printk()")
so change to using dev_printk().

Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20250610124809.1e1ff0cd@canb.auug.org.au/
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_ras.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
index 39c6f9cf98cc..914ffc4a9970 100644
--- a/drivers/accel/qaic/qaic_ras.c
+++ b/drivers/accel/qaic/qaic_ras.c
@@ -322,7 +322,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 
 	switch (msg->source) {
 	case SOC_MEM:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -338,7 +338,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 			   soc_syndrome->error_address[7]);
 		break;
 	case PCIE:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -348,7 +348,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 		switch (msg->err_type) {
 		case CE:
 			/*
-			 * Modeled after AER prints. This continues the pci_printk() from a few
+			 * Modeled after AER prints. This continues the dev_printk() from a few
 			 * lines up. We reduce duplication of code, but also avoid re-printing the
 			 * PCI device info so that the end result looks uniform to the log user.
 			 */
@@ -381,7 +381,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 		}
 		break;
 	case DDR:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    Instance %d\n    Count %d\n    Data 31_0 0x%x 0x%x\n    Data 63_32 0x%x 0x%x\n    Data 95_64 0x%x 0x%x\n    Data 127_96 0x%x 0x%x\n    Parity bits 0x%x\n    Address msb 0x%x\n    Address lsb 0x%x\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    Instance %d\n    Count %d\n    Data 31_0 0x%x 0x%x\n    Data 63_32 0x%x 0x%x\n    Data 95_64 0x%x 0x%x\n    Data 127_96 0x%x 0x%x\n    Parity bits 0x%x\n    Address msb 0x%x\n    Address lsb 0x%x\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -402,7 +402,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 			   ddr_syndrome->addr_lsb);
 		break;
 	case SYS_BUS1:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    instance %d\n    %s\n    err_type %d\n    address0 0x%x\n    address1 0x%x\n    address2 0x%x\n    address3 0x%x\n    address4 0x%x\n    address5 0x%x\n    address6 0x%x\n    address7 0x%x\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    instance %d\n    %s\n    err_type %d\n    address0 0x%x\n    address1 0x%x\n    address2 0x%x\n    address3 0x%x\n    address4 0x%x\n    address5 0x%x\n    address6 0x%x\n    address7 0x%x\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -421,7 +421,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 			   sysbus1_syndrome->addr[7]);
 		break;
 	case SYS_BUS2:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    instance %d\n    valid %d\n    word error %d\n    non-secure %d\n    opc %d\n    error code %d\n    transaction type %d\n    address space %d\n    operation type %d\n    len %d\n    redirect %d\n    path %d\n    ext_id %d\n    lsb2 %d\n    msb2 %d\n    lsb3 %d\n    msb3 %d\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    instance %d\n    valid %d\n    word error %d\n    non-secure %d\n    opc %d\n    error code %d\n    transaction type %d\n    address space %d\n    operation type %d\n    len %d\n    redirect %d\n    path %d\n    ext_id %d\n    lsb2 %d\n    msb2 %d\n    lsb3 %d\n    msb3 %d\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -446,7 +446,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 			   sysbus2_syndrome->msb3);
 		break;
 	case NSP_MEM:
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    NSP ID %d\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    NSP ID %d\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n",
 			   err_class_str[msg->err_type],
 			   err_type_str[msg->err_type],
 			   "error from",
@@ -476,7 +476,7 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 		else
 			class = "Warning";
 
-		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    %s threshold\n    %d deg C\n",
+		dev_printk(level, &qdev->pdev->dev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    %s threshold\n    %d deg C\n",
 			   class,
 			   err_type_str[msg->err_type],
 			   "error from",
-- 
2.34.1

