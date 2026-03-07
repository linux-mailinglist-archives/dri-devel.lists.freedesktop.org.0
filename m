Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNpuHBMPrGkbjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A8422B798
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D52F10E260;
	Sat,  7 Mar 2026 11:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNk12wwE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WW3FivEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0256510E260
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 11:42:08 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6276qusM2402065
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Mar 2026 11:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=; b=gNk12wwEvqGjV6Bw
 E1UxjUwzpZv5/BpXbGl7Xt6p2L2DrPdJ5Hk4W5/6KkdMcCwlPh+PzuxUmOaoEP+g
 3BZEc71w0oH2RF1PHha+FsMsTNZAmy0L1GRzUOHW5D7w56kX5kQl3tRkei4l8nkn
 x/NCpW0+UcDnQbzwr+nOtY2kivDFwR0XNdqieGkQLNrgQHB3TLkV+QNuZwWgpSJM
 RP4b25Y13X4pnTMcCeEoPTD54/tsT+8GRbtegH6GvqILF27VBmUd8BOSocZrG9+l
 pAjZ6wnKFbjZFaOQVPBjqtvQMzIGkkEuknY/i6yf+mmOf2ppFtCEUKaG5KdO5k+n
 RUWHTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qes1g5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 11:42:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2ae3f446ccfso69228125ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 03:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772883727; x=1773488527;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=;
 b=WW3FivEfFV+swaNXx6NqLN5dzoH+e2L2hcEXhqc1Nw5z6gf4nK9cN7OW3VK7nLdpRX
 8GyX2cjbVgShVmbmoiAmUwOfLsfanJVFHQfaDSl3Ms6KJ33OV29hH2Ef02I2qqEYD0CI
 hXMteyUuoColKMiGXdVyYGSUMzFTm9TIRV5X4owmEC5Y4sNEbyUEFzZnDz+x/YXNjPJ+
 8O7cJ0VXM1SwfjXbEzsDq11mbGwboF1JBZD3cbQZfjXKtiFMUabloCGJw+zLUEO0Nsn6
 1FLs+KJC/MF+6zIBuHs9cnlytPu3AVDetXuJ/fAhRLtlsozXk9fMKIpeXEbZnPfDOsz4
 R50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772883727; x=1773488527;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=;
 b=DfkVWSBTe3F00WYAklzwWQdJJur3AwTtg7sQ17DMbc5pr6ZyS5aGxyb05Rz+r6SDUY
 /umPFwb4/qmOe3jrr9sC/XoZOq7fF5rMzJ7PSWk6SDqrReR9rI3OeKmCFZ+LDqmL213D
 pmhRXuK/DQbH+G/ept/X415xPQoa439dGFj0t5MRtHvwRVqFzqhUzEJrrIFN2VvnAJef
 UrYF+Rrzfo9e4pFmqm/U/4glws5WT+rOfnGmh4/pvGlzeQ7NXNqtT0kU5DQoRzjGzToX
 QeZcPcX+Er0eLhYWekku/BtyNlQ1HrjBQTowGw5QfDjGjZOTK9muPFC9chF7+Oc0CcYW
 D5DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Bdr56FaI/EiJQ5AiTopsbV5cJF0/a4P/6YblDKBESZ6IV3nVcU/RsS4X2Sx/drAfbdBkFbEDQxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJdB6lS0OTMPVQsmv8fQzvxk8gDRaU17J77nHWtvQZQltfkUQF
 mNUbEV7C6OOGHI3b08VIwH4LoydzR3R9bZDRdIOQuhl7BGoZqSl9aYn67oZ7LQ2Xfxgh2YCm09F
 TBQ8ANiGM75TSDMpR0vquRE1KlQHJp4KKJUXEhwuv3cd2mkr/mm8mVHoRAc6ehVNHK29qmKs=
X-Gm-Gg: ATEYQzyrLhZnryMzMvIbfmSXdP1T8BACZtdF1Zv39OjsaRgMKuORNicINbaCEvMgNgU
 QzLK9WKkGkTI7EhOQ6vIbKAYW9uu232FBMHLBrp7KZcdiwVu2wxwGePI3wZDl8XHzD4vZOTR+42
 HUAm/9kme/bitJPTxi28rqgHrz/coBEG02pKojn+nev/WxHEXJPN3M5QNdNdGgIkZx+Hbwub21g
 nlC1SblOrOlrIaFJZ7kNNR/u4WM3kSiDez/6Oa2wjbOE8PgMXtJQavrLKXPCxJc53JprjWb54tb
 vbmxxzAqOYp+tvshg7A37Cp6LwL13WYvjFdD1izulznbQLl+MYwUglyJcYnQH0SKE5zyiJ7AgNb
 RL1RjeSu96/dypCTSnN7dX3zMW2d2m8K4WMb4qnLA6vzyEye3Gng=
X-Received: by 2002:a17:903:f87:b0:2ae:44f4:1678 with SMTP id
 d9443c01a7336-2ae824b83e7mr49683765ad.57.1772883726702; 
 Sat, 07 Mar 2026 03:42:06 -0800 (PST)
X-Received: by 2002:a17:903:f87:b0:2ae:44f4:1678 with SMTP id
 d9443c01a7336-2ae824b83e7mr49683535ad.57.1772883726214; 
 Sat, 07 Mar 2026 03:42:06 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:42:05 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:23 +0530
Subject: [PATCH v2 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-2-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=7115;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9tH2JRuQd/Ntg0H7RVSyFLnl0a6EFmaIQsmT7afSET0=;
 b=Bo19H5v5jiStPSIXraymY3yh7iYxzNy7Xdt66+3ME/Uk7tUYGKYT26DGqjMR/x2bpA+wuK7Tu
 XTrWrkx49N6AmMV7cDMJ2+vyyXkxls6jXEAbdyT+j2Y71GvoN/iNbdK
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: Mzeq-_6_BRqnU954gcVOScq8aZCNcA-3
X-Proofpoint-GUID: Mzeq-_6_BRqnU954gcVOScq8aZCNcA-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfXxRABuzvtp3HK
 jqyL1cd6eOU9jLEb2nxP5HB2R4hWpS4789wNkRkKC4hb1/q7o9G6DMcQmaXTjiwJ+ZMFHJGgsIp
 zj+IXPSqsW7r+1Ejj7PKzEOPHfpxBUfWcDsVO81dIe/bFcv3+hb/QHzuBglAId7PDW1ti8c/TFC
 svMn810020VMPNtxPPAIhJgT4h6D3GE0svhjc3iX0w3bya0b/LY+dZpQ+/k+PnWJQrinUvbxJ9M
 cw7tH00tehMMff5q5kMUc4ljyFfss0zlyR6pP9W0FdC0bZNK1VMBcmkkqmRJR8barwNZZDFuYxL
 AXl1i3kdo6z/pQcTlFnKDkcUelQP63A7JN7Dti7JafLR0IRcYLQY0BSvaZ0lDkAu3aZ55kOYOny
 dT/lloYoVP/wbhaT8lSiOy8KxNLCjj3iMrtUY7pvU6QanJSgCcNWRVxH/mGDuYrFMMvIsPNts6g
 Bju3nix50tbYhJVJWnw==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ac0f10 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YoiwXk0N_qN2JQiW-xcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
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
X-Rspamd-Queue-Id: 25A8422B798
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The Sahara protocol driver is currently located under the QAIC
accelerator subsystem even though protocol itself is transported over the
MHI bus and is used by multiple Qualcomm flashless devices.

Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
an independent MHI protocol driver. This avoids treating Sahara as QAIC
specific and makes it available for reuse by other MHI based devices.

As part of this move, introduce a dedicated Kconfig and Makefile under the
MHI subsystem and expose the sahara interface via a common header.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/Kconfig                      |  1 +
 drivers/accel/qaic/Makefile                     |  3 +--
 drivers/accel/qaic/qaic_drv.c                   | 11 ++---------
 drivers/bus/mhi/Kconfig                         |  1 +
 drivers/bus/mhi/Makefile                        |  3 +++
 drivers/bus/mhi/sahara/Kconfig                  | 18 ++++++++++++++++++
 drivers/bus/mhi/sahara/Makefile                 |  2 ++
 drivers/{accel/qaic => bus/mhi/sahara}/sahara.c | 16 +++++++++++-----
 {drivers/accel/qaic => include/linux}/sahara.h  |  0
 9 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..1e5f1f4fa93c12d8ca8fb37633f2f0bee9997499 100644
--- a/drivers/accel/qaic/Kconfig
+++ b/drivers/accel/qaic/Kconfig
@@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on MHI_BUS
+	select MHI_SAHARA
 	select CRC32
 	select WANT_DEV_COREDUMP
 	help
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -13,7 +13,6 @@ qaic-y := \
 	qaic_ras.o \
 	qaic_ssr.o \
 	qaic_sysfs.o \
-	qaic_timesync.o \
-	sahara.o
+	qaic_timesync.o
 
 qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..76cc8086825e7949ed756d51fcb56a08f392d228 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -15,6 +15,7 @@
 #include <linux/msi.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/sahara.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include <linux/wait.h>
@@ -32,7 +33,6 @@
 #include "qaic_ras.h"
 #include "qaic_ssr.h"
 #include "qaic_timesync.h"
-#include "sahara.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -782,18 +782,12 @@ static int __init qaic_init(void)
 	ret = pci_register_driver(&qaic_pci_driver);
 	if (ret) {
 		pr_debug("qaic: pci_register_driver failed %d\n", ret);
-		return ret;
+		goto free_pci;
 	}
 
 	ret = mhi_driver_register(&qaic_mhi_driver);
 	if (ret) {
 		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
-		goto free_pci;
-	}
-
-	ret = sahara_register();
-	if (ret) {
-		pr_debug("qaic: sahara_register failed %d\n", ret);
 		goto free_mhi;
 	}
 
@@ -847,7 +841,6 @@ static void __exit qaic_exit(void)
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
-	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index b39a11e6c624ba00349cca22d74bd876020590ab..4acedb886adccc6f76f69c241d53106da59b491f 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -7,3 +7,4 @@
 
 source "drivers/bus/mhi/host/Kconfig"
 source "drivers/bus/mhi/ep/Kconfig"
+source "drivers/bus/mhi/sahara/Kconfig"
diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
index 354204b0ef3ae4030469a24a659f32429d592aef..e4af535e1bb1bc9481fae60d7eb347700d2e874c 100644
--- a/drivers/bus/mhi/Makefile
+++ b/drivers/bus/mhi/Makefile
@@ -3,3 +3,6 @@ obj-$(CONFIG_MHI_BUS) += host/
 
 # Endpoint MHI stack
 obj-$(CONFIG_MHI_BUS_EP) += ep/
+
+# Sahara MHI protocol
+obj-$(CONFIG_MHI_SAHARA) += sahara/
diff --git a/drivers/bus/mhi/sahara/Kconfig b/drivers/bus/mhi/sahara/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..3f1caf6acd979a4af68aaf0e250aa54762e8cda5
--- /dev/null
+++ b/drivers/bus/mhi/sahara/Kconfig
@@ -0,0 +1,18 @@
+config MHI_SAHARA
+	tristate
+	depends on MHI_BUS
+	select FW_LOADER_COMPRESS
+	select FW_LOADER_COMPRESS_XZ
+	select FW_LOADER_COMPRESS_ZSTD
+	help
+	  Enable support for the Sahara protocol transported over the MHI bus.
+
+	  The Sahara protocol is used to transfer firmware images, retrieve
+	  memory dumps and exchange command mode DDR calibration data between
+	  host and device. This driver is not tied to a specific SoC and may be
+	  used by multiple MHI based devices.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called mhi_sahara.
diff --git a/drivers/bus/mhi/sahara/Makefile b/drivers/bus/mhi/sahara/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
--- /dev/null
+++ b/drivers/bus/mhi/sahara/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
+mhi_sahara-y := sahara.o
diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/sahara/sahara.c
similarity index 99%
rename from drivers/accel/qaic/sahara.c
rename to drivers/bus/mhi/sahara/sahara.c
index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..8ff7b6425ac5423ef8f32117151dca10397686a8 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -1,6 +1,8 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ *
+ */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
@@ -9,12 +11,11 @@
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/overflow.h>
+#include <linux/sahara.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -928,8 +929,13 @@ int sahara_register(void)
 {
 	return mhi_driver_register(&sahara_mhi_driver);
 }
+module_init(sahara_register);
 
 void sahara_unregister(void)
 {
 	mhi_driver_unregister(&sahara_mhi_driver);
 }
+module_exit(sahara_unregister);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm Sahara MHI protocol driver");
diff --git a/drivers/accel/qaic/sahara.h b/include/linux/sahara.h
similarity index 100%
rename from drivers/accel/qaic/sahara.h
rename to include/linux/sahara.h

-- 
2.34.1

