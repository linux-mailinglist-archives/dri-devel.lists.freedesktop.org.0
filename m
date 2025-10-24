Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBD4C07613
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9540E10EB16;
	Fri, 24 Oct 2025 16:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktoUu+RR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1F110EB15
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:46:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OC78Ej006434
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=7Zh9DUYKtKV
 wNnogAjQw/00B5F59jdUrYsLkMKI6u/I=; b=ktoUu+RRRBXMod0Faynpl+4+2Ol
 z3q4o6507VJjSQWOjKuNvZRzWS0qK7Cw8D5ODrontJmXuNU3PdpSbuF0FnXS7B79
 qthFn8RAYRO06V5zVjBod5zGFo2rpU9XyDbomRXu0xvHXVCbf+K+qJdnkm8t6Yb/
 8n8kKvgWBru5T1ZtyzGVPuJ3olK037Q4P4C9bmzIy1eHopsF6APH82OBkt2F4UnA
 MmEQWgl6/L1oagqguQAkjNbB/aEgSxF6uayMWLftH6Lq5j363VeIFY/FKXkiDb7P
 gIDjfrFtBDJB2UAbUimR6W776M8LpMP9KzHCfMhO7Lkl9WOj1jK/kpWuc7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344cpes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:46:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4eb779d9d9cso50573981cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761324392; x=1761929192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Zh9DUYKtKVwNnogAjQw/00B5F59jdUrYsLkMKI6u/I=;
 b=kvQ3gbIeTInlRDiSENOkd148LEsaUODgyJb/OGhbnfKY4BlvtlxPr4h18D+V4K04iZ
 ozNtYQW/bP9ZPyAb2hRIOUlUOloPYilpkq9hU/XSqNoS5Vy2I2wSqilPbjkDP753NeRQ
 ENCerWRyfCtK8ma9//V2mf84ZDDwkbtudpNhFiYP0DwdliJezVbNC4RWg3KsdaIXepOg
 2ohAsYa05yjkZMN674GQ/rJKxbYI7vZDQMMZjopW7oDgw3XInmhfvOhDFP9Q25dzI5bq
 zOIREYrxyLYK4C+76WLvUIGYNsqUOh/ababBMWobEsNp6re7g9NpRS/twSYsKWG1X7Sn
 BejQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5P8IWU25vGQgj4HfY28dYYKmK9qThoALNQFttMch7w7U5aZ3mF1aFxSNuyJeVkLKPiL1VlZ5brLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy9aHVrDY9wDK4jCN52RtNcYTDPH8UGYD67O9sUnNyfPEQE2sn
 72nJvg1esQODpsXrTCzHZfqw9b2MulM36C5g1rstkT/QIid3ot/Rp3Jk84Zws8eC+PrRkzeQnXA
 wjg8CosoJNaruakTLxuSKXMed6XZLm0Qvg3tFWglssFj2on+/xqLzBItY0OudUbUTLxsJORA=
X-Gm-Gg: ASbGncvwMWZxz6WPIJN2orL2QuOf/R8qdiuRbLSjic37WrpIMa37lOQ8PCr/VGdaEoh
 3e8oNqiH/xlqUsUOknwge9pvg/GxLQdbkG2iSaRwbUw7r9PyVREkIl+jnXjQQqDcbc/+o00c1ae
 RAQ2VE9kDLtlagc87Kcu7e8UuAmwe6ljp8qUE4aZ+RIN1sO4O17lNuTZv1om+XwArAjiqA4e0La
 lToP6fcPZVv3x5/aLCQQfg1qy7D5ZYawBVwBOVwPykFyFpY1L435MMnX5KSP9qK57J2W7RTReX6
 kc/y9i409mOdARRS+YumxyPe07UBiOkj1whf2bbfQXdrN1jOyg5XQL7PO2kNhDWwIDOt6uGlWeP
 P8YeKJqXTq4RFS3NK4eQQf76v/KiYTiJEbk9hkb8=
X-Received: by 2002:a05:622a:207:b0:4e8:acc0:1e8f with SMTP id
 d75a77b69052e-4e8acc02259mr301322991cf.47.1761324392379; 
 Fri, 24 Oct 2025 09:46:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYqNSh4Il+UzcvDo5QXpBAvau+CsuwQ3FdztVvzts+To/aOcS0ccMPETaZH6qd7dg+hbKqIQ==
X-Received: by 2002:a05:622a:207:b0:4e8:acc0:1e8f with SMTP id
 d75a77b69052e-4e8acc02259mr301322541cf.47.1761324391835; 
 Fri, 24 Oct 2025 09:46:31 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d51472215sm563568466b.74.2025.10.24.09.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 09:46:31 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and
 uevents
Date: Fri, 24 Oct 2025 18:46:28 +0200
Message-ID: <20251024164630.816862-2-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o1Ve2GMqDqaoUKwx2iqWH39AGzZ0amUY
X-Proofpoint-ORIG-GUID: o1Ve2GMqDqaoUKwx2iqWH39AGzZ0amUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX1VAUYeXR9jL0
 R/BXE90m44VUaWU/Z6dMzUY3oTMRSv7O7dntAA3Hf1qWlC09ayoP5lubyTnkWpLxosF2bgP8Paa
 Eu1nHSp8BzOmQK4KUa3y0JBTgi333swpbUkZLJxA+Ls9a5naJgyVp8uXkdBXUAvBTgguN4sB3n/
 mLBdM7py6GJnJyks66su/1cDBAkSqpY4aB7A1U0ZaMWcYQPsrhkt2FWjmakidp9CPhO7PERO3Oz
 qMGzFSt7KMp+nHgi/OjoeBQq4v6KBWrwVcQ/72HgUyoe8gG+UtlD6kRR1IN7OpBytnQABjFIV0x
 MpV///IdGoal6O9C45OB/j3C0jwmaGxKw0o619qqM1LKIgGdqC3P6hlSvnqTQW+J5uONZ3B2E/P
 GVHVWVz9shquRw3wD23BjZiCcr+U1Q==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fbad69 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nt6Na7LQK8S_E-uQ5a4A:9 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
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

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Expose sysfs files for each DBC representing the current state of that DBC.
For example, sysfs for DBC ID 0 and accel minor number 0 looks like this,

/sys/class/accel/accel0/dbc0_state

Following are the states and their corresponding values,
DBC_STATE_IDLE (0)
DBC_STATE_ASSIGNED (1)
DBC_STATE_BEFORE_SHUTDOWN (2)
DBC_STATE_AFTER_SHUTDOWN (3)
DBC_STATE_BEFORE_POWER_UP (4)
DBC_STATE_AFTER_POWER_UP (5)

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 Documentation/ABI/stable/sysfs-driver-qaic |  16 +++
 drivers/accel/qaic/Makefile                |   1 +
 drivers/accel/qaic/qaic.h                  |  25 +++++
 drivers/accel/qaic/qaic_control.c          |   2 +
 drivers/accel/qaic/qaic_drv.c              |   8 ++
 drivers/accel/qaic/qaic_sysfs.c            | 109 +++++++++++++++++++++
 6 files changed, 161 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-qaic
 create mode 100644 drivers/accel/qaic/qaic_sysfs.c

diff --git a/Documentation/ABI/stable/sysfs-driver-qaic b/Documentation/ABI/stable/sysfs-driver-qaic
new file mode 100644
index 000000000000..e5876935e62b
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-driver-qaic
@@ -0,0 +1,16 @@
+What:		/sys/bus/pci/drivers/qaic/XXXX:XX:XX.X/accel/accel<minor_nr>/dbc<N>_state
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
+Description:	Represents the current state of DMA Bridge channel (DBC). Below are the possible
+		states,
+		IDLE (0) -		DBC is free and can be activated
+		ASSIGNED (1) -		DBC is activated and a workload is running on device
+		BEFORE_SHUTDOWN (2) -	Sub-system associated with this workload has crashed and
+					it will shutdown soon
+		AFTER_SHUTDOWN (3) -	Sub-system associated with this workload has crashed and
+					it has shutdown
+		BEFORE_POWER_UP (4) -	Sub-system associated with this workload is shutdown and
+					it will be powered up soon
+		AFTER_POWER_UP (5) -	Sub-system associated with this workload is now powered up
+Users:		Any userspace application or clients interested in DBC state.
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 1106b876f737..8f6746e5f03a 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -11,6 +11,7 @@ qaic-y := \
 	qaic_data.o \
 	qaic_drv.o \
 	qaic_ras.o \
+	qaic_sysfs.o \
 	qaic_timesync.o \
 	sahara.o
 
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 820d133236dd..4c2f25249e95 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -47,6 +47,22 @@ enum __packed dev_states {
 	QAIC_ONLINE,
 };
 
+enum dbc_states {
+	/* DBC is free and can be activated */
+	DBC_STATE_IDLE,
+	/* DBC is activated and a workload is running on device */
+	DBC_STATE_ASSIGNED,
+	/* Sub-system associated with this workload has crashed and it will shutdown soon */
+	DBC_STATE_BEFORE_SHUTDOWN,
+	/* Sub-system associated with this workload has crashed and it has shutdown */
+	DBC_STATE_AFTER_SHUTDOWN,
+	/* Sub-system associated with this workload is shutdown and it will be powered up soon */
+	DBC_STATE_BEFORE_POWER_UP,
+	/* Sub-system associated with this workload is now powered up */
+	DBC_STATE_AFTER_POWER_UP,
+	DBC_STATE_MAX,
+};
+
 extern bool datapath_polling;
 
 struct qaic_user {
@@ -114,6 +130,8 @@ struct dma_bridge_chan {
 	unsigned int		irq;
 	/* Polling work item to simulate interrupts */
 	struct work_struct	poll_work;
+	/* Represents various states of this DBC from enum dbc_states */
+	unsigned int		state;
 };
 
 struct qaic_device {
@@ -195,6 +213,8 @@ struct qaic_drm_device {
 	struct list_head	users;
 	/* Synchronizes access to users list */
 	struct mutex		users_mutex;
+	/* Pointer to array of DBC sysfs attributes */
+	void			*sysfs_attrs;
 };
 
 struct qaic_bo {
@@ -319,4 +339,9 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 int qaic_detach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
 void irq_polling_work(struct work_struct *work);
 
+/* qaic_sysfs.c */
+int qaic_sysfs_init(struct qaic_drm_device *qddev);
+void qaic_sysfs_remove(struct qaic_drm_device *qddev);
+void set_dbc_state(struct qaic_device *qdev, u32 dbc_id, unsigned int state);
+
 #endif /* _QAIC_H_ */
diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index b86a8e48e731..b1ab1282f9d3 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -309,6 +309,7 @@ static void save_dbc_buf(struct qaic_device *qdev, struct ioctl_resources *resou
 		enable_dbc(qdev, dbc_id, usr);
 		qdev->dbc[dbc_id].in_use = true;
 		resources->buf = NULL;
+		set_dbc_state(qdev, dbc_id, DBC_STATE_ASSIGNED);
 	}
 }
 
@@ -921,6 +922,7 @@ static int decode_deactivate(struct qaic_device *qdev, void *trans, u32 *msg_len
 	}
 
 	release_dbc(qdev, dbc_id);
+	set_dbc_state(qdev, dbc_id, DBC_STATE_IDLE);
 	*msg_len += sizeof(*in_trans);
 
 	return 0;
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index e162f4b8a262..a8a16f20320f 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -270,6 +270,13 @@ static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id)
 		return ret;
 	}
 
+	ret = qaic_sysfs_init(qddev);
+	if (ret) {
+		drm_dev_unregister(drm);
+		pci_dbg(qdev->pdev, "qaic_sysfs_init failed %d\n", ret);
+		return ret;
+	}
+
 	qaic_debugfs_init(qddev);
 
 	return ret;
@@ -281,6 +288,7 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 	struct drm_device *drm = to_drm(qddev);
 	struct qaic_user *usr;
 
+	qaic_sysfs_remove(qddev);
 	drm_dev_unregister(drm);
 	qddev->partition_id = 0;
 	/*
diff --git a/drivers/accel/qaic/qaic_sysfs.c b/drivers/accel/qaic/qaic_sysfs.c
new file mode 100644
index 000000000000..5d7aa1a5f4d1
--- /dev/null
+++ b/drivers/accel/qaic/qaic_sysfs.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) 2020-2025, The Linux Foundation. All rights reserved. */
+
+#include <drm/drm_file.h>
+#include <drm/drm_managed.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+
+#include "qaic.h"
+
+#define NAME_LEN		14
+
+struct dbc_attribute {
+	struct device_attribute dev_attr;
+	u32 dbc_id;
+	char name[NAME_LEN];
+};
+
+static ssize_t dbc_state_show(struct device *dev, struct device_attribute *a, char *buf)
+{
+	struct dbc_attribute *dbc_attr = container_of(a, struct dbc_attribute, dev_attr);
+	struct drm_minor *minor = dev_get_drvdata(dev);
+	struct qaic_device *qdev;
+
+	qdev = to_qaic_device(minor->dev);
+	return sysfs_emit(buf, "%d\n", qdev->dbc[dbc_attr->dbc_id].state);
+}
+
+void set_dbc_state(struct qaic_device *qdev, u32 dbc_id, unsigned int state)
+{
+	struct device *kdev = to_accel_kdev(qdev->qddev);
+	char *envp[3] = {};
+	char state_str[16];
+	char id_str[12];
+
+	envp[0] = id_str;
+	envp[1] = state_str;
+
+	if (state >= DBC_STATE_MAX)
+		return;
+	if (dbc_id >= qdev->num_dbc)
+		return;
+	if (state == qdev->dbc[dbc_id].state)
+		return;
+
+	scnprintf(id_str, ARRAY_SIZE(id_str), "DBC_ID=%d", dbc_id);
+	scnprintf(state_str, ARRAY_SIZE(state_str), "DBC_STATE=%d", state);
+
+	qdev->dbc[dbc_id].state = state;
+	kobject_uevent_env(&kdev->kobj, KOBJ_CHANGE, envp);
+}
+
+int qaic_sysfs_init(struct qaic_drm_device *qddev)
+{
+	struct device *kdev = to_accel_kdev(qddev);
+	struct drm_device *drm = to_drm(qddev);
+	u32 num_dbc = qddev->qdev->num_dbc;
+	struct dbc_attribute *dbc_attrs;
+	int i, ret;
+
+	dbc_attrs = drmm_kcalloc(drm, num_dbc, sizeof(*dbc_attrs), GFP_KERNEL);
+	if (!dbc_attrs)
+		return -ENOMEM;
+
+	for (i = 0; i < num_dbc; ++i) {
+		struct dbc_attribute *dbc_attr = &dbc_attrs[i];
+
+		sysfs_attr_init(&dbc_attr->dev_attr.attr);
+		dbc_attr->dbc_id = i;
+		scnprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
+		dbc_attr->dev_attr.attr.name = dbc_attr->name;
+		dbc_attr->dev_attr.attr.mode = 0444;
+		dbc_attr->dev_attr.show = dbc_state_show;
+		ret = sysfs_create_file(&kdev->kobj, &dbc_attr->dev_attr.attr);
+		if (ret) {
+			int j;
+
+			for (j = 0; j < i; ++j) {
+				dbc_attr = &dbc_attrs[j];
+				sysfs_remove_file(&kdev->kobj, &dbc_attr->dev_attr.attr);
+			}
+			drmm_kfree(drm, dbc_attrs);
+			return ret;
+		}
+	}
+
+	qddev->sysfs_attrs = dbc_attrs;
+	return 0;
+}
+
+void qaic_sysfs_remove(struct qaic_drm_device *qddev)
+{
+	struct dbc_attribute *dbc_attrs = qddev->sysfs_attrs;
+	struct device *kdev = to_accel_kdev(qddev);
+	u32 num_dbc = qddev->qdev->num_dbc;
+	int i;
+
+	if (!dbc_attrs)
+		return;
+
+	qddev->sysfs_attrs = NULL;
+	for (i = 0; i < num_dbc; ++i)
+		sysfs_remove_file(&kdev->kobj, &dbc_attrs[i].dev_attr.attr);
+	drmm_kfree(to_drm(qddev), dbc_attrs);
+}
-- 
2.43.0

