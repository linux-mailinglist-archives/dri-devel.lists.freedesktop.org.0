Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B251DAB452D
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 21:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0C910E1B8;
	Mon, 12 May 2025 19:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBNLDmdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A467210E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 19:49:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CITrv2011903
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 19:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=AVtid8XmaircRDu8psIAvKiVKosmaZwIN+T
 GX8pFG0E=; b=kBNLDmdW/8bDjiom3njw1KcVquLjIBWu4oMTA4i66yoU9cduq1O
 62JOOzu86kXe8IFnikxXTswaK3NstlgY82Wza2YQ4z3FO/g/EwZhxniUXoPoiPY6
 Z1+TvzJN9AMt14jDBpayt2f6d2jqUaYmEpvEIGEyjcBsUNxKcyQGlBo7Q3VM38ic
 otpU/Jh6NxZ6BAH+l2pgkV0qQAZGgneStjitTtOi5+b0JPBPqGq3ZVeHs77R8EN0
 e82JHZy2CKsGC2hNNknE+EdBJrmRMfnkwlZSUQ1oSVpiKIhygdoqqTkl/vw3Piq8
 B17g//VYIbjnnIYkVVNu6gCTbjV82QpnGRQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjnc9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 19:49:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74041404f8dso3371426b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747079384; x=1747684184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AVtid8XmaircRDu8psIAvKiVKosmaZwIN+TGX8pFG0E=;
 b=B67mOKzkdicPxEPZIgm3bsrQ15IRSonPj6OoTmgpWph2uU26TDXk2L6IiKL6ZLxEYw
 M5L8ROLlxdPwJ1+mVIgHaAf5g/YwZruTEdkxZ9L5NnIldE3Z8fr64Y6uezip+mGyB+do
 LZgi9v4Duv84YrHA9FSyL/gSVwY+7FZ5pzsoH5w1bUQ/x4K9UCDPw85Pr9aa7PuB5vDR
 nH/BszhyoFX1RaXJp4eR0o+iDNMVdmfAniNeB1LaKv59PCclUfF91BcO8hxOFPKqgrvY
 CnLmSFqdVUara9CHZutcWfhRscX4r/oSsCNA9foTP7LsqficPUNC+yfMqAjR94FgWweE
 uiZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5eZMzgny/9JphivcYx4yCKLYc4GdGtBFDJUfiqRSQkGUvYqBjpfriEThenx3+Ry5MEYJg2dOxIbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx2TJAlNobKqtqR8KhA0ArOw0Zc3GYGXafbmhE6DWcFSlYyxSA
 Oo8h1frCdee9LiCvyOW6cJBJKm6M8nDZq6gPcibwTwh6WszQEBsUS57rPm27vVmEtarDYaNEcfY
 TFVuJVV8vM3dtjJDHJ9TfOq0hDjUuLAwMjP+qgKm5l40uPjUZ2OIjbiSJV2SH5JG8a1k=
X-Gm-Gg: ASbGncv8hiPF0HUb4fekLVCn/4AJ0H8Evv4oP2oqIQsXmzhbLjd85yE+ITLeE1sVOOw
 86hqKtwdUUrhq/nmgTAOr9F38QbWXHjFSjbAK8s8lAdPMFGGESL/7LtZ9yyy59JnI0iuYek3/12
 OBUY0wzofjxytLwSTLxHRXp4ZuRwkpDhDlRKoz7cpu6pkcqJRmeQoe//NEcg4/DaEg5NBsTIpdw
 NC2yAbD2ydOJWdNg8bdrTu0Muza4uf0dz5GrW6Y5DLnB1r+lXhvbgIPZwF3TydCfDEEOjmt7Gvi
 9VT9GveU2xo9zmBswCiJhzlIrivT4vmteILCWeCMedY7DiXUlA6ha2Ut3lYP
X-Received: by 2002:a05:6a21:3292:b0:1f3:418c:6281 with SMTP id
 adf61e73a8af0-215abb4f8f6mr20093365637.4.1747079383554; 
 Mon, 12 May 2025 12:49:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYUfqFyAUqZSXxXm+VB9O/v87XjKLUoJutpc+9iQbZCTSd4mUo8011g8rhYBa1bQzrYGlyvQ==
X-Received: by 2002:a05:6a21:3292:b0:1f3:418c:6281 with SMTP id
 adf61e73a8af0-215abb4f8f6mr20093317637.4.1747079382852; 
 Mon, 12 May 2025 12:49:42 -0700 (PDT)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a3d1cfsm6284952b3a.127.2025.05.12.12.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 12:49:42 -0700 (PDT)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, quic_yabdulra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] accel/qaic: Add Reliability, Accessibility,
 Serviceability (RAS)
Date: Mon, 12 May 2025 13:49:37 -0600
Message-Id: <20250512194937.3530774-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIwNCBTYWx0ZWRfX0U4GluzFw3az
 1ftb5EDdwvBye5sLvKPjtiE6df0buPKwNF3IAKz18VhENU2HjVQjIlC3MiSgUSzRSd0P0WEbZ9r
 hF8NnyFt+vQNlCPTWspkOfqWsgO4aErgf66O8UKD9nbzF57EUpQhYYMNzBHOwPFRrCrTTYk8uyn
 ifsNoMsGdAtWqTvJvVIH12u7OxccZ9zFw//2ND+Sa3FidTeeF7jyndDnMnVpGBCoP4DEQ0A2lW4
 6H2anr1u40phwn9MlG9GLqVJCWgjz0Vq70dOZWt5MeZDX3togofD4coJ4KDgOfbAPRDR6vW9cmi
 TejyGi99QkuTQVeFFAqb5ui5l7ZrwQnHqKabD1EypUbaxYc7ZgAITomL746kLI5bxCrrRQ7VVbg
 kFY+/na4ujv7F//OnlKvn+6r5o7s1sG0Cse/2gL/eI2W1zEHoQdu/CKKafrvR/G9RK+KKZwq
X-Proofpoint-GUID: 6ChWgVjwzDmqkn_BkGyhdLrwKzhl7qZI
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=682250d8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=QmHHIsGFvcH2m9EzYqkA:9 a=IoOABgeZipijB_acs4fv:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 6ChWgVjwzDmqkn_BkGyhdLrwKzhl7qZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120204
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

AIC100 devices generates Reliability, Availability, Serviceability events
via MHI QAIC_STATUS channel. Support such events and print a structured
log with details of the events, and if the event describes an uncorrected
error, reset the device to put it back into service. As these events may
not all be reported via other mechanisms like AER, maintain counts of
the number of errors observed for each type.

Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-qaic |  18 +
 MAINTAINERS                                 |   1 +
 drivers/accel/qaic/Makefile                 |   1 +
 drivers/accel/qaic/qaic.h                   |   8 +
 drivers/accel/qaic/qaic_drv.c               |   6 +
 drivers/accel/qaic/qaic_ras.c               | 629 ++++++++++++++++++++
 drivers/accel/qaic/qaic_ras.h               |  11 +
 7 files changed, 674 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-qaic
 create mode 100644 drivers/accel/qaic/qaic_ras.c
 create mode 100644 drivers/accel/qaic/qaic_ras.h

diff --git a/Documentation/ABI/testing/sysfs-driver-qaic b/Documentation/ABI/testing/sysfs-driver-qaic
new file mode 100644
index 000000000000..f794fd734163
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-qaic
@@ -0,0 +1,18 @@
+What:		/sys/bus/pci/drivers/qaic/XXXX:XX:XX.X/ce_count
+Date:		May 2025
+KernelVersion:	6.17
+Contact:	dri-devel@lists.freedesktop.org
+Description:	Number of correctable errors received from device since driver is loaded.
+
+What:		/sys/bus/pci/drivers/qaic/XXXX:XX:XX.X/ue_count
+Date:		May 2025
+KernelVersion:	6.17
+Contact:	dri-devel@lists.freedesktop.org
+Description:	Number of uncorrectable errors received from device since driver is loaded.
+
+What:		/sys/bus/pci/drivers/qaic/XXXX:XX:XX.X/ue_nonfatal_count
+Date:		May 2025
+KernelVersion:	6.17
+Contact:	dri-devel@lists.freedesktop.org
+Description:	Number of uncorrectable non-fatal errors received from device since driver
+		is loaded.
diff --git a/MAINTAINERS b/MAINTAINERS
index fe9773af465a..5801adfe4927 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19916,6 +19916,7 @@ L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/ABI/testing/sysfs-driver-qaic
 F:	Documentation/accel/qaic/
 F:	drivers/accel/qaic/
 F:	include/uapi/drm/qaic_accel.h
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 35e883515629..1106b876f737 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -10,6 +10,7 @@ qaic-y := \
 	qaic_control.o \
 	qaic_data.o \
 	qaic_drv.o \
+	qaic_ras.o \
 	qaic_timesync.o \
 	sahara.o
 
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 0dbb8e32e4b9..3fa47385aae4 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -167,6 +167,14 @@ struct qaic_device {
 	struct workqueue_struct *bootlog_wq;
 	/* Synchronizes access of pages in MHI bootlog device */
 	struct mutex            bootlog_mutex;
+	/* MHI RAS channel device */
+	struct mhi_device	*ras_ch;
+	/* Correctable error count */
+	unsigned int		ce_count;
+	/* Un-correctable error count */
+	unsigned int		ue_count;
+	/* Un-correctable non-fatal error count */
+	unsigned int		ue_nf_count;
 };
 
 struct qaic_drm_device {
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 3b415e2c9431..e31bcb0ecfc9 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -29,6 +29,7 @@
 #include "mhi_controller.h"
 #include "qaic.h"
 #include "qaic_debugfs.h"
+#include "qaic_ras.h"
 #include "qaic_timesync.h"
 #include "sahara.h"
 
@@ -695,6 +696,10 @@ static int __init qaic_init(void)
 	if (ret)
 		pr_debug("qaic: qaic_bootlog_register failed %d\n", ret);
 
+	ret = qaic_ras_register();
+	if (ret)
+		pr_debug("qaic: qaic_ras_register failed %d\n", ret);
+
 	return 0;
 
 free_mhi:
@@ -722,6 +727,7 @@ static void __exit qaic_exit(void)
 	 * reinitializing the link_up state after the cleanup is done.
 	 */
 	link_up = true;
+	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
 	sahara_unregister();
diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
new file mode 100644
index 000000000000..2f8c1f08dbc0
--- /dev/null
+++ b/drivers/accel/qaic/qaic_ras.c
@@ -0,0 +1,629 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <asm/byteorder.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mhi.h>
+
+#include "qaic.h"
+#include "qaic_ras.h"
+
+#define MAGIC		0x55AA
+#define VERSION		0x2
+#define HDR_SZ		12
+#define NUM_TEMP_LVL	3
+#define POWER_BREAK	BIT(0)
+
+enum msg_type {
+	MSG_PUSH, /* async push from device */
+	MSG_REQ,  /* sync request to device */
+	MSG_RESP, /* sync response from device */
+};
+
+enum err_type {
+	CE,	/* correctable error */
+	UE,	/* uncorrectable error */
+	UE_NF,	/* uncorrectable error that is non-fatal, expect a disruption */
+	ERR_TYPE_MAX,
+};
+
+static const char * const err_type_str[] = {
+	[CE]    = "Correctable",
+	[UE]    = "Uncorrectable",
+	[UE_NF] = "Uncorrectable Non-Fatal",
+};
+
+static const char * const err_class_str[] = {
+	[CE]    = "Warning",
+	[UE]    = "Fatal",
+	[UE_NF] = "Warning",
+};
+
+enum err_source {
+	SOC_MEM,
+	PCIE,
+	DDR,
+	SYS_BUS1,
+	SYS_BUS2,
+	NSP_MEM,
+	TSENS,
+};
+
+static const char * const err_src_str[TSENS + 1] = {
+	[SOC_MEM]	= "SoC Memory",
+	[PCIE]		= "PCIE",
+	[DDR]		= "DDR",
+	[SYS_BUS1]	= "System Bus source 1",
+	[SYS_BUS2]	= "System Bus source 2",
+	[NSP_MEM]	= "NSP Memory",
+	[TSENS]		= "Temperature Sensors",
+};
+
+struct ras_data {
+	/* header start */
+	/* Magic number to validate the message */
+	u16 magic;
+	/* RAS version number */
+	u16 ver;
+	u32 seq_num;
+	/* RAS message type */
+	u8  type;
+	u8  id;
+	/* Size of RAS message without the header in byte */
+	u16 len;
+	/* header end */
+	s32 result;
+	/*
+	 * Error source
+	 * 0 : SoC Memory
+	 * 1 : PCIE
+	 * 2 : DDR
+	 * 3 : System Bus source 1
+	 * 4 : System Bus source 2
+	 * 5 : NSP Memory
+	 * 6 : Temperature Sensors
+	 */
+	u32 source;
+	/*
+	 * Stores the error type, there are three types of error in RAS
+	 * 0 : correctable error (CE)
+	 * 1 : uncorrectable error (UE)
+	 * 2 : uncorrectable error that is non-fatal (UE_NF)
+	 */
+	u32 err_type;
+	u32 err_threshold;
+	u32 ce_count;
+	u32 ue_count;
+	u32 intr_num;
+	/* Data specific to error source */
+	u8  syndrome[64];
+} __packed;
+
+struct soc_mem_syndrome {
+	u64 error_address[8];
+} __packed;
+
+struct nsp_mem_syndrome {
+	u32 error_address[8];
+	u8 nsp_id;
+} __packed;
+
+struct ddr_syndrome {
+	u32 count;
+	u32 irq_status;
+	u32 data_31_0[2];
+	u32 data_63_32[2];
+	u32 data_95_64[2];
+	u32 data_127_96[2];
+	u32 addr_lsb;
+	u16 addr_msb;
+	u16 parity_bits;
+	u16 instance;
+	u16 err_type;
+} __packed;
+
+struct tsens_syndrome {
+	u32 threshold_type;
+	s32 temp;
+} __packed;
+
+struct sysbus1_syndrome {
+	u32 slave;
+	u32 err_type;
+	u16 addr[8];
+	u8  instance;
+} __packed;
+
+struct sysbus2_syndrome {
+	u32 lsb3;
+	u32 msb3;
+	u32 lsb2;
+	u32 msb2;
+	u32 ext_id;
+	u16 path;
+	u16 op_type;
+	u16 len;
+	u16 redirect;
+	u8  valid;
+	u8  word_error;
+	u8  non_secure;
+	u8  opc;
+	u8  error_code;
+	u8  trans_type;
+	u8  addr_space;
+	u8  instance;
+} __packed;
+
+struct pcie_syndrome {
+	/* CE info */
+	u32 bad_tlp;
+	u32 bad_dllp;
+	u32 replay_rollover;
+	u32 replay_timeout;
+	u32 rx_err;
+	u32 internal_ce_count;
+	/* UE_NF info */
+	u32 fc_timeout;
+	u32 poison_tlp;
+	u32 ecrc_err;
+	u32 unsupported_req;
+	u32 completer_abort;
+	u32 completion_timeout;
+	/* UE info */
+	u32 addr;
+	u8  index;
+	/*
+	 * Flag to indicate specific event of PCIe
+	 * BIT(0): Power break (low power)
+	 * BIT(1) to BIT(7): Reserved
+	 */
+	u8 flag;
+} __packed;
+
+static const char * const threshold_type_str[NUM_TEMP_LVL] = {
+	[0] = "lower",
+	[1] = "upper",
+	[2] = "critical",
+};
+
+static void ras_msg_to_cpu(struct ras_data *msg)
+{
+	struct sysbus1_syndrome *sysbus1_syndrome = (struct sysbus1_syndrome *)&msg->syndrome[0];
+	struct sysbus2_syndrome *sysbus2_syndrome = (struct sysbus2_syndrome *)&msg->syndrome[0];
+	struct soc_mem_syndrome *soc_syndrome = (struct soc_mem_syndrome *)&msg->syndrome[0];
+	struct nsp_mem_syndrome *nsp_syndrome = (struct nsp_mem_syndrome *)&msg->syndrome[0];
+	struct tsens_syndrome *tsens_syndrome = (struct tsens_syndrome *)&msg->syndrome[0];
+	struct pcie_syndrome *pcie_syndrome = (struct pcie_syndrome *)&msg->syndrome[0];
+	struct ddr_syndrome *ddr_syndrome = (struct ddr_syndrome *)&msg->syndrome[0];
+	int i;
+
+	le16_to_cpus(&msg->magic);
+	le16_to_cpus(&msg->ver);
+	le32_to_cpus(&msg->seq_num);
+	le16_to_cpus(&msg->len);
+	le32_to_cpus(&msg->result);
+	le32_to_cpus(&msg->source);
+	le32_to_cpus(&msg->err_type);
+	le32_to_cpus(&msg->err_threshold);
+	le32_to_cpus(&msg->ce_count);
+	le32_to_cpus(&msg->ue_count);
+	le32_to_cpus(&msg->intr_num);
+
+	switch (msg->source) {
+	case SOC_MEM:
+		for (i = 0; i < 8; i++)
+			le64_to_cpus(&soc_syndrome->error_address[i]);
+		break;
+	case PCIE:
+		le32_to_cpus(&pcie_syndrome->bad_tlp);
+		le32_to_cpus(&pcie_syndrome->bad_dllp);
+		le32_to_cpus(&pcie_syndrome->replay_rollover);
+		le32_to_cpus(&pcie_syndrome->replay_timeout);
+		le32_to_cpus(&pcie_syndrome->rx_err);
+		le32_to_cpus(&pcie_syndrome->internal_ce_count);
+		le32_to_cpus(&pcie_syndrome->fc_timeout);
+		le32_to_cpus(&pcie_syndrome->poison_tlp);
+		le32_to_cpus(&pcie_syndrome->ecrc_err);
+		le32_to_cpus(&pcie_syndrome->unsupported_req);
+		le32_to_cpus(&pcie_syndrome->completer_abort);
+		le32_to_cpus(&pcie_syndrome->completion_timeout);
+		le32_to_cpus(&pcie_syndrome->addr);
+		break;
+	case DDR:
+		le16_to_cpus(&ddr_syndrome->instance);
+		le16_to_cpus(&ddr_syndrome->err_type);
+		le32_to_cpus(&ddr_syndrome->count);
+		le32_to_cpus(&ddr_syndrome->irq_status);
+		le32_to_cpus(&ddr_syndrome->data_31_0[0]);
+		le32_to_cpus(&ddr_syndrome->data_31_0[1]);
+		le32_to_cpus(&ddr_syndrome->data_63_32[0]);
+		le32_to_cpus(&ddr_syndrome->data_63_32[1]);
+		le32_to_cpus(&ddr_syndrome->data_95_64[0]);
+		le32_to_cpus(&ddr_syndrome->data_95_64[1]);
+		le32_to_cpus(&ddr_syndrome->data_127_96[0]);
+		le32_to_cpus(&ddr_syndrome->data_127_96[1]);
+		le16_to_cpus(&ddr_syndrome->parity_bits);
+		le16_to_cpus(&ddr_syndrome->addr_msb);
+		le32_to_cpus(&ddr_syndrome->addr_lsb);
+		break;
+	case SYS_BUS1:
+		le32_to_cpus(&sysbus1_syndrome->slave);
+		le32_to_cpus(&sysbus1_syndrome->err_type);
+		for (i = 0; i < 8; i++)
+			le16_to_cpus(&sysbus1_syndrome->addr[i]);
+		break;
+	case SYS_BUS2:
+		le16_to_cpus(&sysbus2_syndrome->op_type);
+		le16_to_cpus(&sysbus2_syndrome->len);
+		le16_to_cpus(&sysbus2_syndrome->redirect);
+		le16_to_cpus(&sysbus2_syndrome->path);
+		le32_to_cpus(&sysbus2_syndrome->ext_id);
+		le32_to_cpus(&sysbus2_syndrome->lsb2);
+		le32_to_cpus(&sysbus2_syndrome->msb2);
+		le32_to_cpus(&sysbus2_syndrome->lsb3);
+		le32_to_cpus(&sysbus2_syndrome->msb3);
+		break;
+	case NSP_MEM:
+		for (i = 0; i < 8; i++)
+			le32_to_cpus(&nsp_syndrome->error_address[i]);
+		break;
+	case TSENS:
+		le32_to_cpus(&tsens_syndrome->threshold_type);
+		le32_to_cpus(&tsens_syndrome->temp);
+		break;
+	}
+}
+
+static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
+{
+	struct sysbus1_syndrome *sysbus1_syndrome = (struct sysbus1_syndrome *)&msg->syndrome[0];
+	struct sysbus2_syndrome *sysbus2_syndrome = (struct sysbus2_syndrome *)&msg->syndrome[0];
+	struct soc_mem_syndrome *soc_syndrome = (struct soc_mem_syndrome *)&msg->syndrome[0];
+	struct nsp_mem_syndrome *nsp_syndrome = (struct nsp_mem_syndrome *)&msg->syndrome[0];
+	struct tsens_syndrome *tsens_syndrome = (struct tsens_syndrome *)&msg->syndrome[0];
+	struct pcie_syndrome *pcie_syndrome = (struct pcie_syndrome *)&msg->syndrome[0];
+	struct ddr_syndrome *ddr_syndrome = (struct ddr_syndrome *)&msg->syndrome[0];
+	char *class;
+	char *level;
+
+	if (msg->magic != MAGIC) {
+		pci_warn(qdev->pdev, "Dropping RAS message with invalid magic %x\n", msg->magic);
+		return;
+	}
+
+	if (!msg->ver || msg->ver > VERSION) {
+		pci_warn(qdev->pdev, "Dropping RAS message with invalid version %d\n", msg->ver);
+		return;
+	}
+
+	if (msg->type != MSG_PUSH) {
+		pci_warn(qdev->pdev, "Dropping non-PUSH RAS message\n");
+		return;
+	}
+
+	if (msg->len != sizeof(*msg) - HDR_SZ) {
+		pci_warn(qdev->pdev, "Dropping RAS message with invalid len %d\n", msg->len);
+		return;
+	}
+
+	if (msg->err_type >= ERR_TYPE_MAX) {
+		pci_warn(qdev->pdev, "Dropping RAS message with err type %d\n", msg->err_type);
+		return;
+	}
+
+	if (msg->err_type == UE)
+		level = KERN_ERR;
+	else
+		level = KERN_WARNING;
+
+	switch (msg->source) {
+	case SOC_MEM:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   soc_syndrome->error_address[0],
+			   soc_syndrome->error_address[1],
+			   soc_syndrome->error_address[2],
+			   soc_syndrome->error_address[3],
+			   soc_syndrome->error_address[4],
+			   soc_syndrome->error_address[5],
+			   soc_syndrome->error_address[6],
+			   soc_syndrome->error_address[7]);
+		break;
+	case PCIE:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source]);
+
+		switch (msg->err_type) {
+		case CE:
+			printk(KERN_WARNING pr_fmt("Syndrome:\n    Bad TLP count %d\n    Bad DLLP count %d\n    Replay Rollover count %d\n    Replay Timeout count %d\n    Recv Error count %d\n    Internal CE count %d\n"),
+			       pcie_syndrome->bad_tlp,
+			       pcie_syndrome->bad_dllp,
+			       pcie_syndrome->replay_rollover,
+			       pcie_syndrome->replay_timeout,
+			       pcie_syndrome->rx_err,
+			       pcie_syndrome->internal_ce_count);
+			if (msg->ver > 0x1)
+				pr_warn("    Power break %s\n",
+					pcie_syndrome->flag & POWER_BREAK ? "ON" : "OFF");
+			break;
+		case UE:
+			printk(KERN_ERR pr_fmt("Syndrome:\n    Index %d\n    Address 0x%x\n"),
+			       pcie_syndrome->index, pcie_syndrome->addr);
+			break;
+		case UE_NF:
+			printk(KERN_WARNING pr_fmt("Syndrome:\n    FC timeout count %d\n    Poisoned TLP count %d\n    ECRC error count %d\n    Unsupported request count %d\n    Completer abort count %d\n    Completion timeout count %d\n"),
+			       pcie_syndrome->fc_timeout,
+			       pcie_syndrome->poison_tlp,
+			       pcie_syndrome->ecrc_err,
+			       pcie_syndrome->unsupported_req,
+			       pcie_syndrome->completer_abort,
+			       pcie_syndrome->completion_timeout);
+			break;
+		default:
+			break;
+		}
+		break;
+	case DDR:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndrome:\n    Instance %d\n    Count %d\n    Data 31_0 0x%x 0x%x\n    Data 63_32 0x%x 0x%x\n    Data 95_64 0x%x 0x%x\n    Data 127_96 0x%x 0x%x\n    Parity bits 0x%x\n    Address msb 0x%x\n    Address lsb 0x%x\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   ddr_syndrome->instance,
+			   ddr_syndrome->count,
+			   ddr_syndrome->data_31_0[1],
+			   ddr_syndrome->data_31_0[0],
+			   ddr_syndrome->data_63_32[1],
+			   ddr_syndrome->data_63_32[0],
+			   ddr_syndrome->data_95_64[1],
+			   ddr_syndrome->data_95_64[0],
+			   ddr_syndrome->data_127_96[1],
+			   ddr_syndrome->data_127_96[0],
+			   ddr_syndrome->parity_bits,
+			   ddr_syndrome->addr_msb,
+			   ddr_syndrome->addr_lsb);
+		break;
+	case SYS_BUS1:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndrome:\n    instance %d\n    %s\n    err_type %d\n    address0 0x%x\n    address1 0x%x\n    address2 0x%x\n    address3 0x%x\n    address4 0x%x\n    address5 0x%x\n    address6 0x%x\n    address7 0x%x\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   sysbus1_syndrome->instance,
+			   sysbus1_syndrome->slave ? "Slave" : "Master",
+			   sysbus1_syndrome->err_type,
+			   sysbus1_syndrome->addr[0],
+			   sysbus1_syndrome->addr[1],
+			   sysbus1_syndrome->addr[2],
+			   sysbus1_syndrome->addr[3],
+			   sysbus1_syndrome->addr[4],
+			   sysbus1_syndrome->addr[5],
+			   sysbus1_syndrome->addr[6],
+			   sysbus1_syndrome->addr[7]);
+		break;
+	case SYS_BUS2:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndrome:\n    instance %d\n    valid %d\n    word error %d\n    non-secure %d\n    opc %d\n    error code %d\n    transaction type %d\n    address space %d\n    operation type %d\n    len %d\n    redirect %d\n    path %d\n    ext_id %d\n    lsb2 %d\n    msb2 %d\n    lsb3 %d\n    msb3 %d\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   sysbus2_syndrome->instance,
+			   sysbus2_syndrome->valid,
+			   sysbus2_syndrome->word_error,
+			   sysbus2_syndrome->non_secure,
+			   sysbus2_syndrome->opc,
+			   sysbus2_syndrome->error_code,
+			   sysbus2_syndrome->trans_type,
+			   sysbus2_syndrome->addr_space,
+			   sysbus2_syndrome->op_type,
+			   sysbus2_syndrome->len,
+			   sysbus2_syndrome->redirect,
+			   sysbus2_syndrome->path,
+			   sysbus2_syndrome->ext_id,
+			   sysbus2_syndrome->lsb2,
+			   sysbus2_syndrome->msb2,
+			   sysbus2_syndrome->lsb3,
+			   sysbus2_syndrome->msb3);
+		break;
+	case NSP_MEM:
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndrome:\n    NSP ID %d\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n    0x%x\n",
+			   err_class_str[msg->err_type],
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   nsp_syndrome->nsp_id,
+			   nsp_syndrome->error_address[0],
+			   nsp_syndrome->error_address[1],
+			   nsp_syndrome->error_address[2],
+			   nsp_syndrome->error_address[3],
+			   nsp_syndrome->error_address[4],
+			   nsp_syndrome->error_address[5],
+			   nsp_syndrome->error_address[6],
+			   nsp_syndrome->error_address[7]);
+		break;
+	case TSENS:
+		if (tsens_syndrome->threshold_type >= NUM_TEMP_LVL) {
+			pci_warn(qdev->pdev, "Dropping RAS message with invalid temp threshold %d\n",
+				 tsens_syndrome->threshold_type);
+			break;
+		}
+
+		if (msg->err_type)
+			class = "Fatal";
+		else if (tsens_syndrome->threshold_type)
+			class = "Critical";
+		else
+			class = "Warning";
+
+		pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nSyndrome:\n    %s threshold\n    %d deg C\n",
+			   class,
+			   err_type_str[msg->err_type],
+			   "error from",
+			   err_src_str[msg->source],
+			   threshold_type_str[tsens_syndrome->threshold_type],
+			   tsens_syndrome->temp);
+		break;
+	}
+
+	/* Uncorrectable errors are fatal */
+	if (msg->err_type == UE)
+		mhi_soc_reset(qdev->mhi_cntrl);
+
+	switch (msg->err_type) {
+	case CE:
+		if (qdev->ce_count != UINT_MAX)
+			qdev->ce_count++;
+		break;
+	case UE:
+		if (qdev->ce_count != UINT_MAX)
+			qdev->ue_count++;
+		break;
+	case UE_NF:
+		if (qdev->ce_count != UINT_MAX)
+			qdev->ue_nf_count++;
+		break;
+	default:
+		/* not possible */
+		break;
+	}
+}
+
+static ssize_t ce_count_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ce_count);
+}
+
+static ssize_t ue_count_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ue_count);
+}
+
+static ssize_t ue_nonfatal_count_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ue_nf_count);
+}
+
+static DEVICE_ATTR_RO(ce_count);
+static DEVICE_ATTR_RO(ue_count);
+static DEVICE_ATTR_RO(ue_nonfatal_count);
+
+static struct attribute *ras_attrs[] = {
+	&dev_attr_ce_count.attr,
+	&dev_attr_ue_count.attr,
+	&dev_attr_ue_nonfatal_count.attr,
+	NULL,
+};
+
+static struct attribute_group ras_group = {
+	.attrs = ras_attrs,
+};
+
+static int qaic_ras_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
+	struct ras_data *resp;
+	int ret;
+
+	ret = mhi_prepare_for_transfer(mhi_dev);
+	if (ret)
+		return ret;
+
+	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
+	if (!resp) {
+		mhi_unprepare_from_transfer(mhi_dev);
+		return -ENOMEM;
+	}
+
+	ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, resp, sizeof(*resp), MHI_EOT);
+	if (ret) {
+		kfree(resp);
+		mhi_unprepare_from_transfer(mhi_dev);
+		return ret;
+	}
+
+	ret = device_add_group(&qdev->pdev->dev, &ras_group);
+	if (ret) {
+		mhi_unprepare_from_transfer(mhi_dev);
+		pci_dbg(qdev->pdev, "ras add sysfs failed %d\n", ret);
+		return ret;
+	}
+
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+	qdev->ras_ch = mhi_dev;
+
+	return ret;
+}
+
+static void qaic_ras_mhi_remove(struct mhi_device *mhi_dev)
+{
+	struct qaic_device *qdev;
+
+	qdev = dev_get_drvdata(&mhi_dev->dev);
+	qdev->ras_ch = NULL;
+	device_remove_group(&qdev->pdev->dev, &ras_group);
+	mhi_unprepare_from_transfer(mhi_dev);
+}
+
+static void qaic_ras_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result) {}
+
+static void qaic_ras_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
+{
+	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
+	struct ras_data *msg = mhi_result->buf_addr;
+	int ret;
+
+	if (mhi_result->transaction_status) {
+		kfree(msg);
+		return;
+	}
+
+	ras_msg_to_cpu(msg);
+	decode_ras_msg(qdev, msg);
+
+	ret = mhi_queue_buf(qdev->ras_ch, DMA_FROM_DEVICE, msg, sizeof(*msg), MHI_EOT);
+	if (ret) {
+		dev_err(&mhi_dev->dev, "Cannot requeue RAS recv buf %d\n", ret);
+		kfree(msg);
+	}
+}
+
+static const struct mhi_device_id qaic_ras_mhi_match_table[] = {
+	{ .chan = "QAIC_STATUS", },
+	{},
+};
+
+static struct mhi_driver qaic_ras_mhi_driver = {
+	.id_table = qaic_ras_mhi_match_table,
+	.remove = qaic_ras_mhi_remove,
+	.probe = qaic_ras_mhi_probe,
+	.ul_xfer_cb = qaic_ras_mhi_ul_xfer_cb,
+	.dl_xfer_cb = qaic_ras_mhi_dl_xfer_cb,
+	.driver = {
+		.name = "qaic_ras",
+	},
+};
+
+int qaic_ras_register(void)
+{
+	return mhi_driver_register(&qaic_ras_mhi_driver);
+}
+
+void qaic_ras_unregister(void)
+{
+	mhi_driver_unregister(&qaic_ras_mhi_driver);
+}
diff --git a/drivers/accel/qaic/qaic_ras.h b/drivers/accel/qaic/qaic_ras.h
new file mode 100644
index 000000000000..5df6cb9dae80
--- /dev/null
+++ b/drivers/accel/qaic/qaic_ras.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QAIC_RAS_H__
+#define __QAIC_RAS_H__
+
+int qaic_ras_register(void);
+void qaic_ras_unregister(void);
+#endif /* __QAIC_RAS_H__ */
-- 
2.34.1

