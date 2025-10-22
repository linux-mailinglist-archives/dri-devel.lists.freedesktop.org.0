Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB8BFE280
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 22:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAB810E04D;
	Wed, 22 Oct 2025 20:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHguHdcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E981510E03F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:25:31 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIen1g029712
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=kwBtKfD8mDP
 l7FcbnLyfaJIKFXBqDMoNLBKZ6gdFoAQ=; b=mHguHdcFOLxTvtrNkYEkCWyFZVL
 j/nufqmWSL+c3K7KtU8wd7a0Wa9IPDn30Ge8JsvHBKKMm41robu5TSPajjygHGX1
 AZd8jS/PgnVjI5qoa7HP2ME+7+Q22NuOFf/PSaE0jCjiWrOZcChlXQO6cToZzorL
 ieLonDyjjI5lr6rA03Z1orMMzZzwAiPSEZNTpVJ+YyI5Y/NSCXYgygOCiCypYQGg
 ZnosX2lZop8CfAlnzWsDzLJ5i+WJeTAnh3TfGsZEq9UYPloDGC2bTi1kUoFkYWp7
 GYybfw/TLwT7TOi8fJjF42JC82uNPXveWBV4uz67GBPLS2Kde6OdYZLdbGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge5ysc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 20:25:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e8a4c63182so724761cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761164730; x=1761769530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kwBtKfD8mDPl7FcbnLyfaJIKFXBqDMoNLBKZ6gdFoAQ=;
 b=JCsV2fzo5REzQ8zSjP5uWd+okMnntZB+xVgiIq/rXwSZ4Lh07rz0IhBsFLnioj6MlC
 BYf0RSNFBYtKsKFMFGkSXS4JzyiIZ5v55wTqHzbnaAu/SRoNLabBnUhpwxkpOIXDc6PP
 IlgCU0mcPHEz4TsfekotYm5SLf+6Pdvf4wGEvxA6KjOT7fg1/YcmC0Vw6QTbUntx8e9a
 W3LBg/3jTH2D+qvk0jDFukATZD7M5xX1NglW0VUY2dShcK1FruiRKJ7JXvZuGV7QJl4S
 Hgh51uFG6pGxS2SkTeDKPe2Q6Sklj2nWHK//aDvyJo13Ni6XZxSia1NGkrEjuI8bRzlp
 z5qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMG47FFEKjHKitzfyvAV4UbSh+vboaacNJ0sm2wyZVF0W+yqkqTqnyNdqz2Gj5+f4iI9v3dKgcTd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOlXNGB0lazPljMejqr2fd4YoGdayn9hmeZj1rbTNXxM2vJjHo
 cL53rVCx1z7iv1YLz2Tb0Pq/YMgXfYEdKneqT4+lRyOWy8tJ/NbVSZ98Y5PRPnF7Zyta7p0zoJu
 Jd72mhFfApfl+wl/4fjILTADdYSbW3rZjCxxGpaD6Mt0k/XE5VAZPovf3ZNdxzEr825TXQvs=
X-Gm-Gg: ASbGnctEBRaLouEZQ2C5aIc+uCsKmoEauWL5bIk3lqMhf6qTGxkcDLLK/070zEQl/B5
 uARbI916lpX1ovh30tdT3gHI6QBHGTU6OPBzeRWzHsrWpDLR8yn71cmLrNMJ5kekYU9COyd83Av
 wWDSRJceND+tDMAdaoKvCZWSkCR5FmD5mtqr+FaibWHcGzOKF5rvZrBeYb3v+0lqwx00ZGLyZni
 0Y0dqdyVwuJMWKIe2+/LL8hgVppQWtdiZ7Ja8wNa0KXX8XyPiUUv9mfu13Ltt8YRDRmUfM3aJqp
 VQsji+8/CYhhLFwzKgOKWxI5/hNnriqgXKYj9V+s7ddCZgfm7cttzJxq74C3SM7kgg0JPL2ibC6
 yRxY9Wf6eG5tn76ffjIF3jjQby5DjGgZxCIIZUO0=
X-Received: by 2002:a05:622a:15d4:b0:4e8:b783:f167 with SMTP id
 d75a77b69052e-4e8b783f435mr192705921cf.83.1761164730048; 
 Wed, 22 Oct 2025 13:25:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrE/W51tvurdufAZvbqtet6VH0PYfY8oxN2yAq0I9RSUK8aDK8uU8m+lDbi7rlVWVVb6CLmg==
X-Received: by 2002:a05:622a:15d4:b0:4e8:b783:f167 with SMTP id
 d75a77b69052e-4e8b783f435mr192705501cf.83.1761164729520; 
 Wed, 22 Oct 2025 13:25:29 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5141a207sm4998566b.52.2025.10.22.13.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 13:25:29 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
Date: Wed, 22 Oct 2025 22:25:25 +0200
Message-ID: <20251022202527.3873558-2-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX5YnmIy/VM+uM
 I/3mEpWa91VkQ258hcWHOyHW5+Pq9xNeTlIrZefUz+7XPwAaI3NnGPe1b9m/uvqUqvop3fq7DxW
 i/4XjxQZ9IPUJiryNLTiGslsg9RYWctESR8NjaxA/IjcxmodF2s5O2htHayRuuT8ir86uKyQ5uw
 Dlkbbj4bElPSaaJsFCyAmpZiULnC4PQ4P+2s0mOy/fgctDXVYlPMUVXX1Gvxk/Z/MRXjWBCWBvY
 BKTE38BzbpVy34hpyeqMDqutN8sfOTmsHNQqy482MJ81nj4+r9+upLavbmpChXBeePmuxUnpdIq
 +udiYvvmYK8BcsXm7tpHJHcNEPeMxkzCFmiHWJ30Bg9hQoSyKq66QVA6Z/nNbxJFAVTEVLnVU4o
 YU4bj9iuEnXr3r9H5oOAmNKeMQGFIQ==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f93dba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nt6Na7LQK8S_E-uQ5a4A:9 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QYu-GULVqg1qAEkiNRFnDKOq0896e1GQ
X-Proofpoint-ORIG-GUID: QYu-GULVqg1qAEkiNRFnDKOq0896e1GQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
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
index 000000000000..d967e8a20c1c
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
+	snprintf(id_str, ARRAY_SIZE(id_str), "DBC_ID=%d", dbc_id);
+	snprintf(state_str, ARRAY_SIZE(state_str), "DBC_STATE=%d", state);
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
+		snprintf(dbc_attr->name, NAME_LEN, "dbc%d_state", i);
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

