Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C86C076A3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE7E10EB1B;
	Fri, 24 Oct 2025 16:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8ONhWE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA5E10EB1B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:57:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCklaU004412
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Y+9oqAefh+KN7qSLrQunsPCZJMm1uw9AiBh
 Vh9CSxHw=; b=A8ONhWE1adNTxzpHfBNanYtX2wBvQCRLUsmYTbHicFSfrQRTQjP
 jueSiIPF9r4Q7UADn5UWnxQgkaF1B5gZYPBF0HpFQO/OeDX1t/k0nxln5cPykRya
 SswpmSvoYtqeSZgjSZdUvChjW5KQ+2ZP5XkPmY2GVhCV3ZWgNBz5nCwpeUPmU38Z
 2DJ3KPCNDx9QV/KQyI5rJTGAAq9Xe1IU4A6xi6PjWNnp7Vj5xws6ENFptdi0fSYM
 Kz47AqxP6uVztN8+gomPw9v4mOA8qeCMyGdZ+lVKO5czMLc32TMz/3jv5NQfZImb
 S13WfduQVzhgCVybzeL54OGesV7gKyrKjQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gecnb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:57:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4eb7853480dso75393441cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761325071; x=1761929871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y+9oqAefh+KN7qSLrQunsPCZJMm1uw9AiBhVh9CSxHw=;
 b=woUIBg9VIWMqQQuNurdHGsSOybj5/6PY7Zp1wjfnQyTWbwt5iK3G1ht7UpDWP/AE2L
 HpYdPzbgEGxfixUvAJEk5V1BXt8GnQVrx/7FHvcq7w9jydcZ6H1zMTEvyCmJHH9YodH4
 vBeyB55rbntay1gIObR2b/FhjkEsq2svc1T2fycOwQ9jnO+3/riSVzqMz1CfFW8+Yr70
 APuDGJHbCcGRbXQHP39BYx7ZBVKX1YV6MIaDsIlta52ezfl1PT4VMLev6HgJI0eNWV/0
 vpWrK8DwgA9IFiufwSL3U20vy82RKqkAbTVXW3nDJB2zG+7NZ0vaQSzw9VoKYPJzULco
 BgGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJrO/wTYwfcXGvDJZQqpLUulOOoy21TIBI0F/FY9xxLSOe4DceX7jTt6V6t0Qj9Aq81bEKry4plgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTiVwD1kqaInQJR3vTT7ac1tCC2EyWC3dKSVv0FNcKswHG6R69
 t4UqdrEV9/FuPI+1JVMcb2HjUuDjAitSX3aUnHKW1H2wWEpyeAFjP8PqBv9vydjIQo8s3g/2HP6
 lWwURpuR3Oydv4CNDvstHpNIIZ1FkSqZTAO7WKHJW60Wj5xl1NH9UgTZX894hLM+arunSseU=
X-Gm-Gg: ASbGncspMq2SW6kTzB8p69MwaWnt8bOSD8QlTIC43Rg+NYoSQtKOCNcnN1qw7va+S8q
 oS0XZlLY6fCFzMwfmhfbY0w9+v8SkhpdTSUV75zVOnE2t5B/LhI76YFFOMRdwJlF+NcL+Hgzmul
 c7x8r4L+0GO9esJfSDHFSGmAslNd75FXpxVV13Bk4aLqQgMp6GmApIR1YZYJykzhfvbjMDaHIUm
 rHtKIGBXBhXc1LvUvBhs67jc5XJq9Svl/hCPJ8YNl42C60F1kEBKDf3FAqtxQBdTMbCrnTAUALM
 7FQMHerG/DBIaMU4/PyO8YRmGnc5W0NvLVw8SqvvdAyG4xs3I0Vq6hu86fl9BPqQQK2AOeis/v4
 AV4irCpOW+DnYA6/mcfOYZY/7weogX2XIMVV0w7k=
X-Received: by 2002:ac8:590e:0:b0:4e8:a495:4752 with SMTP id
 d75a77b69052e-4e8a4954c39mr316455321cf.83.1761325070809; 
 Fri, 24 Oct 2025 09:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWfbWv9PlnchhJbCtZPrM04Bijjfjg28YOTLUgss64Wd9zIGhqWzXaKaJCXv5iWusGQphbSQ==
X-Received: by 2002:ac8:590e:0:b0:4e8:a495:4752 with SMTP id
 d75a77b69052e-4e8a4954c39mr316455081cf.83.1761325070386; 
 Fri, 24 Oct 2025 09:57:50 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebcbcaasm4786602a12.10.2025.10.24.09.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 09:57:50 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Fix typos in the documentation for qaic
Date: Fri, 24 Oct 2025 18:57:49 +0200
Message-ID: <20251024165749.821414-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfXxlfJOZ6UsBqU
 TMOpEbfCH988/rndV5K3KDSyQA3xOqbJ8KJqzBe2UiFdPq8u2OPkUq2pT1B+hIBsMQud587UweG
 P5zKZkAgUolBpKedG7b7LLibJxz6C5VJidcNllB29SFn/ftYEnkjpnvnbp3JK8sqJgf/BZMg6yQ
 x2puNFqh1xoaYOrQe0bjzErkdiAPyybqusJwWU3WuUjT1u2ZPnFNbSKzJJy3YHGDUMUEqd3JbD2
 Ss6eXt9gWD7aCgMpMt6G9w3F9q5y/3L5oVEwhaKXOWWE6lWuVskS9roC120SSECpvZ72wltD2O6
 izFNzbzv3RtwztXbDbR41kOGc074umizFuYTia4FRl1enwuFzQTrMIQvzjf+5R0NDY39+uUXK6E
 s4oQeD5dhRH7kQZdDT30S6ja7edVcg==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fbb00f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=pRYst-cxp-SWPdbSSdgA:9 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sQj6rr1rqEIZ-ecpHicbABk2whMsYIWo
X-Proofpoint-ORIG-GUID: sQj6rr1rqEIZ-ecpHicbABk2whMsYIWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
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

From: Sourab Bera <quic_sourbera@quicinc.com>

Fix typos in qaic.rst file.

Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 Documentation/accel/qaic/qaic.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index 018d6cc173d7..ef27e262cb91 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -36,7 +36,7 @@ polling mode and reenables the IRQ line.
 This mitigation in QAIC is very effective. The same lprnet usecase that
 generates 100k IRQs per second (per /proc/interrupts) is reduced to roughly 64
 IRQs over 5 minutes while keeping the host system stable, and having the same
-workload throughput performance (within run to run noise variation).
+workload throughput performance (within run-to-run noise variation).
 
 Single MSI Mode
 ---------------
@@ -49,7 +49,7 @@ useful to be able to fall back to a single MSI when needed.
 To support this fallback, we allow the case where only one MSI is able to be
 allocated, and share that one MSI between MHI and the DBCs. The device detects
 when only one MSI has been configured and directs the interrupts for the DBCs
-to the interrupt normally used for MHI. Unfortunately this means that the
+to the interrupt normally used for MHI. Unfortunately, this means that the
 interrupt handlers for every DBC and MHI wake up for every interrupt that
 arrives; however, the DBC threaded irq handlers only are started when work to be
 done is detected (MHI will always start its threaded handler).
@@ -62,9 +62,9 @@ never disabled, allowing each new entry to the FIFO to trigger a new interrupt.
 Neural Network Control (NNC) Protocol
 =====================================
 
-The implementation of NNC is split between the KMD (QAIC) and UMD. In general
+The implementation of NNC is split between the KMD (QAIC) and UMD. In general,
 QAIC understands how to encode/decode NNC wire protocol, and elements of the
-protocol which require kernel space knowledge to process (for example, mapping
+protocol which requires kernel space knowledge to process (for example, mapping
 host memory to device IOVAs). QAIC understands the structure of a message, and
 all of the transactions. QAIC does not understand commands (the payload of a
 passthrough transaction).
-- 
2.43.0

