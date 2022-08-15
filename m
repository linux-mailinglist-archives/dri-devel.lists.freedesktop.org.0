Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893615A0024
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5350BA9D0;
	Wed, 24 Aug 2022 17:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8824ED15EB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:43:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FFPdqp024877;
 Mon, 15 Aug 2022 18:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=+CBHgz4opehVPDC+7miUFQAXIE2TJEdaD+kt/oubVxc=;
 b=nFeDmSWXA6WU9N35THzh+bYO6LNQTYVAeZrB6Lc1qga41oQdFbwCQAfVcqeuriYDWS3o
 ArDPR7NaVY/gYLPc/Xq7YaAfWLwZXMNJr9yRhSyKy5CQr7VIm8iVWQ4mmgviXAu0mI3w
 oHaenRyA1isHHXuemnkeHg+hgLczrOL3NZeAWc8st1YGR4eXXJO6Nz8H7XxA41ke++qe
 6UwOTMfr9Yu5b4Qj8+6nLCknqN7a/uXiVn2R+beMvPUaAoVdaazJTY7wtKg40WAj7hPX
 aPHdA/l+ACk9xPlx5P2jwQ/jpevKUIVZjw98zrLrSJqvEwo4KZAkbtYnxX6mkJIgIy1p MA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hx467e5c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27FIh8h8002524
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 18:43:08 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 15 Aug 2022 11:43:07 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [RFC PATCH 03/14] drm/qaic: Add qaic.h internal header
Date: Mon, 15 Aug 2022 12:42:25 -0600
Message-ID: <1660588956-24027-4-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
References: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: abqtz3WO2FKHzj7_DV9IDeW8tqjoYaI9
X-Proofpoint-GUID: abqtz3WO2FKHzj7_DV9IDeW8tqjoYaI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208150070
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

qaic.h contains all of the structs and defines that get passed around
to the various components of the driver.

Change-Id: I8349ac831a55daad3ac67ab763c2e815bb051be0
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/gpu/drm/qaic/qaic.h | 396 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 396 insertions(+)
 create mode 100644 drivers/gpu/drm/qaic/qaic.h

diff --git a/drivers/gpu/drm/qaic/qaic.h b/drivers/gpu/drm/qaic/qaic.h
new file mode 100644
index 0000000..07c25c1
--- /dev/null
+++ b/drivers/gpu/drm/qaic/qaic.h
@@ -0,0 +1,396 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QAICINTERNAL_H_
+#define QAICINTERNAL_H_
+
+#include <linux/idr.h>
+#include <linux/interrupt.h>
+#include <linux/kref.h>
+#include <linux/mhi.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/spinlock.h>
+#include <linux/srcu.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+
+#define QAIC_DBC_BASE		0x20000
+#define QAIC_DBC_SIZE		0x1000
+
+#define QAIC_NO_PARTITION	-1
+
+#define QAIC_DBC_OFF(i)		((i) * QAIC_DBC_SIZE + QAIC_DBC_BASE)
+
+#define to_qaic_bo(obj) container_of(obj, struct qaic_bo, base)
+
+extern bool poll_datapath;
+
+enum dbc_states {
+	DBC_STATE_IDLE			= 0,
+	DBC_STATE_ASSIGNED		= 1,
+	DBC_STATE_BEFORE_SHUTDOWN	= 2,
+	DBC_STATE_AFTER_SHUTDOWN	= 3,
+	DBC_STATE_BEFORE_POWER_UP	= 4,
+	DBC_STATE_AFTER_POWER_UP	= 5,
+	DBC_STATE_MAX			= 6,
+};
+
+struct qaic_user {
+	/* PID of the process that opened this drm device */
+	pid_t			handle;
+	struct kref		ref_count;
+	/* Char device opened by this user */
+	struct qaic_drm_device	*qddev;
+	/* Node in list of users that opened this drm device */
+	struct list_head	node;
+	/* SRCU used to synchronize this user during cleanup */
+	struct srcu_struct	qddev_lock;
+	atomic_t		chunk_id;
+};
+
+struct dma_bridge_chan {
+	/* Pointer to device strcut maintained by driver */
+	struct qaic_device	*qdev;
+	/* ID of this DMA bridge channel(DBC) */
+	unsigned int		id;
+	/* Synchronizes access to xfer_list */
+	spinlock_t		xfer_lock;
+	/* Base address of request queue */
+	void			*req_q_base;
+	/* Base address of response queue */
+	void			*rsp_q_base;
+	/*
+	 * Base bus address of request queue. Response queue bus address can be
+	 * calculated by adding request queue size to this variable
+	 */
+	dma_addr_t		dma_addr;
+	/* Total size of request and response queue in byte */
+	u32			total_size;
+	/* Capacity of request/response queue */
+	u32			nelem;
+	/* Synchronizes access to idr buf_handles */
+	struct mutex		handle_lock;
+	/* Hold memory handles for this DBC */
+	struct idr		buf_handles;
+	/* The user that opened this DBC */
+	struct qaic_user	*usr;
+	/*
+	 * Request ID of next memory handle that goes in request queue. One
+	 * memory handle can enqueue more than one request elements, all
+	 * this requests that belong to same memory handle have same request ID
+	 */
+	u16			next_req_id;
+	/* TRUE: DBC is in use; FALSE: DBC not in use */
+	bool			in_use;
+	/* TRUE: This DBC is under sub system reset(SSR) */
+	bool			in_ssr;
+	/* Represents various states of this DBC from enum dbc_states */
+	unsigned int		state;
+	/*
+	 * Base address of device registers. Used to read/write request and
+	 * response queue's head and tail pointer of this DBC.
+	 */
+	void __iomem		*dbc_base;
+	/* Head of list where each node is a memory handle queued in request queue */
+	struct list_head	xfer_list;
+	/* Synchronizes DBC readers during cleanup */
+	struct srcu_struct	ch_lock;
+	/* Debugfs root directory for this DBC */
+	struct dentry		*debugfs_root;
+	/*
+	 * When this DBC is released, any thread waiting on this wait queue is
+	 * woken up
+	 */
+	wait_queue_head_t	dbc_release;
+	/*
+	 * Points to a book keeping struct maintained by MHI SSR device while
+	 * downloading a SSR crashdump. It is NULL when there no crashdump
+	 * downloading in progress.
+	 */
+	void			*dump_info;
+	/* Head of list where each node is a bo associated with this DBC */
+	struct list_head	bo_lists;
+	/* The irq line for this DBC.  Used for polling */
+	unsigned int		irq;
+	/* Polling work item to simulate interrupts */
+	struct work_struct	poll_work;
+};
+
+struct qaic_device {
+	/* Pointer to base PCI device struct of our physical device */
+	struct pci_dev		*pdev;
+	/* Mask of all bars of this device */
+	int			bars;
+	/* Req. ID of request that will be queued next in MHI control device */
+	u32			next_seq_num;
+	/* Base address of bar 0 */
+	void __iomem		*bar_0;
+	/* Base address of bar 2 */
+	void __iomem		*bar_2;
+	/* Controller structure for MHI devices */
+	struct mhi_controller	*mhi_cntl;
+	/* MHI control channel device */
+	struct mhi_device	*cntl_ch;
+	/* List of requests queued in MHI control device */
+	struct list_head	cntl_xfer_list;
+	/* Synchronizes MHI control device transactions and its xfer list */
+	struct mutex		cntl_mutex;
+	/* Base actual physical representation of drm device */
+	struct qaic_drm_device	*base_dev;
+	/* Array of DBC struct of this device */
+	struct dma_bridge_chan	*dbc;
+	/* Work queue for tasks related to MHI control device */
+	struct workqueue_struct	*cntl_wq;
+	/* Synchronizes all the users of device during cleanup */
+	struct srcu_struct	dev_lock;
+	/* Debugfs root directory for the device */
+	struct dentry		*debugfs_root;
+	/* HW monitoring device for this device */
+	struct device		*hwmon;
+	/* MHI telemetry channel device */
+	struct mhi_device	*tele_ch;
+	/* Head in list of requests queued in MHI telemetry device */
+	struct list_head	tele_xfer_list;
+	/* Req. ID of request that will be queued next in MHI telemetry device */
+	u32			tele_next_seq_num;
+	/*
+	 * TRUE: A tx MHI tansaction has failed and a rx buffer is still queued
+	 * in telemetry device. Such a buffer is considered lost rx buffer
+	 * FALSE: No rx buffer is lost in telemetry device
+	 */
+	bool			tele_lost_buf;
+	/* TRUE: Device under reset; FALSE: Device not under reset */
+	bool			in_reset;
+	/*
+	 * TRUE: A tx MHI tansaction has failed and a rx buffer is still queued
+	 * in control device. Such a buffer is considered lost rx buffer
+	 * FALSE: No rx buffer is lost in control device
+	 */
+	bool			cntl_lost_buf;
+	/* Synchronizes MHI telemetry device transactions and its xfer list */
+	struct mutex		tele_mutex;
+	/* Work queue for tasks related to MHI telemetry device */
+	struct workqueue_struct	*tele_wq;
+	/* MHI RAS channel device */
+	struct mhi_device	*ras_ch;
+	unsigned int		ce_count;
+	unsigned int		ue_count;
+	unsigned int		ue_nf_count;
+	/* Maximum number of DBC supported by this device */
+	u32			num_dbc;
+	/* Head of list of page allocated by MHI bootlog device */
+	struct list_head	bootlog;
+	/* MHI bootlog channel device */
+	struct mhi_device	*bootlog_ch;
+	/* Work queue for tasks related to MHI bootlog device */
+	struct workqueue_struct	*bootlog_wq;
+	/* Synchronizes access of pages in MHI bootlog device */
+	struct mutex		bootlog_mutex;
+	/* Head in list of drm device created on top of this device */
+	struct list_head	qaic_drm_devices;
+	/* Synchronizes access of qaic_drm_devices list */
+	struct mutex		qaic_drm_devices_mutex;
+	/* MHI SSR channel device */
+	struct mhi_device	*ssr_ch;
+	/* Work queue for tasks related to MHI SSR device */
+	struct workqueue_struct	*ssr_wq;
+	/* Generate the CRC of a control message */
+	u32 (*gen_crc)(void *msg);
+	/* Validate the CRC of a control message */
+	bool (*valid_crc)(void *msg);
+};
+
+struct qaic_drm_device {
+	/* Pointer to the root device struct driven by this driver */
+	struct qaic_device	*qdev;
+	/* Node in list of drm devices maintained by root device */
+	struct list_head	node;
+	/*
+	 * The physical device can be partition in number of logical devices.
+	 * And each logical device is given a partition id. This member stores
+	 * that id. QAIC_NO_PARTITION is a sentinel used to mark that this drm
+	 * device is the actual physical device
+	 */
+	s32			partition_id;
+	/*
+	 * It points to the user that created this drm device. It is NULL
+	 * when this drm device represents the physical device i.e.
+	 * partition_id is QAIC_NO_PARTITION
+	 */
+	struct qaic_user	*owner;
+	/* Pointer to the drm device struct of this drm device */
+	struct drm_device	*ddev;
+	/* Head in list of users who have opened this drm device */
+	struct list_head	users;
+	/* Synchronizes access to users list */
+	struct mutex		users_mutex;
+	/* Pointer to array of DBC sysfs attributes */
+	void			*sysfs_attrs;
+};
+
+struct qaic_bo {
+	struct drm_gem_object	base;
+	/* Scatter/gather table for allocate/imported BO */
+	struct sg_table		*sgt;
+	/* BO size requested by user. GEM object might be bigger in size. */
+	u64			size;
+	/* Head in list of slices of this BO */
+	struct list_head	slices;
+	/* Total nents, for all slices of this BO */
+	int			total_slice_nents;
+	/*
+	 * Direction of transfer. It can assume only two value DMA_TO_DEVICE and
+	 * DMA_FROM_DEVICE.
+	 */
+	int			dir;
+	/* The pointer of the DBC which operates on this BO */
+	struct dma_bridge_chan	*dbc;
+	/* Number of slice that belongs to this buffer */
+	u32			nr_slice;
+	/* Number of slice that have been transferred by DMA engine */
+	u32			nr_slice_xfer_done;
+	/* TRUE = BO is queued for execution, FALSE = BO is not queued */
+	bool			queued;
+	/**
+	 * If TRUE then user has attached slicing information to this BO by
+	 * calling DRM_IOCTL_QAIC_ATTACH_SLICE_BO ioctl.
+	 */
+	bool			sliced;
+	/* Request ID of this BO if it is queued for execution */
+	u16			req_id;
+	/* Handle assigned to this BO */
+	u32			handle;
+	/* Wait on this for completion of DMA transfer of this BO */
+	struct completion	xfer_done;
+	/*
+	 * Node in linked list where head is dbc->xfer_list.
+	 * This link list contain bo's that are queued for DMA transfer.
+	 */
+	struct list_head	xfer_list;
+	/*
+	 * Node in linked list where head is dbc->bo_lists.
+	 * This link list contain bo's that are associated with the DBC it is
+	 * linked to.
+	 */
+	struct list_head	bo_list;
+	struct {
+		/**
+		 * Latest timestamp(ns) at which kernel received a request to
+		 * execute this BO
+		 */
+		u64		req_received_ts;
+		/**
+		 * Latest timestamp(ns) at which kernel enqueued requests of
+		 * this BO for execution in DMA queue
+		 */
+		u64		req_submit_ts;
+		/**
+		 * Latest timestamp(ns) at which kernel received a completion
+		 * interrupt for requests of this BO
+		 */
+		u64		req_processed_ts;
+		/**
+		 * Number of elements already enqueued in DMA queue before
+		 * enqueuing requests of this BO
+		 */
+		u32		queue_level_before;
+	} perf_stats;
+
+};
+
+struct bo_slice {
+	/* Mapped pages */
+	struct sg_table		*sgt;
+	/* Number of requests required to queue in DMA queue */
+	int			nents;
+	/* See enum dma_data_direction */
+	int			dir;
+	/* Actual requests that will be copied in DMA queue */
+	struct dbc_req		*reqs;
+	struct kref		ref_count;
+	/* TRUE: No DMA transfer required */
+	bool			no_xfer;
+	/* Pointer to the parent bo handle */
+	struct qaic_bo		*bo;
+	/* Node in list of slices maintained by parent BO */
+	struct list_head	slice;
+	/* Size of this slice in byte */
+	u64			size;
+	/* Offset of this slice in buffer */
+	u64			offset;
+};
+
+int get_dbc_req_elem_size(void);
+int get_dbc_rsp_elem_size(void);
+int get_cntl_version(struct qaic_device *qdev, struct qaic_user *usr,
+		     u16 *major, u16 *minor);
+int qaic_manage_ioctl(struct drm_device *dev, void *data,
+		      struct drm_file *file_priv);
+int qaic_execute_ioctl(struct qaic_device *qdev, struct qaic_user *usr,
+		       unsigned long arg, bool is_partial);
+int qaic_wait_exec_ioctl(struct qaic_device *qdev, struct qaic_user *usr,
+			 unsigned long arg);
+int qaic_query_ioctl(struct qaic_device *qdev, struct qaic_user *usr,
+		     unsigned long arg);
+int qaic_data_mmap(struct qaic_device *qdev, struct qaic_user *usr,
+		   struct vm_area_struct *vma);
+void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head,
+			     u32 *tail);
+int qaic_data_get_reservation(struct qaic_device *qdev, struct qaic_user *usr,
+			      void *data, u32 *partition_id,
+			      u16 *remove);
+void qaic_mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+			 struct mhi_result *mhi_result);
+
+void qaic_mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+			 struct mhi_result *mhi_result);
+
+int qaic_control_open(struct qaic_device *qdev);
+void qaic_control_close(struct qaic_device *qdev);
+void qaic_release_usr(struct qaic_device *qdev, struct qaic_user *usr);
+
+irqreturn_t dbc_irq_threaded_fn(int irq, void *data);
+irqreturn_t dbc_irq_handler(int irq, void *data);
+int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
+void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
+void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
+void release_dbc(struct qaic_device *qdev, u32 dbc_id, bool set_state);
+
+void wake_all_cntl(struct qaic_device *qdev);
+void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exit_reset);
+
+int qaic_sysfs_init(struct qaic_drm_device *qdev);
+void qaic_sysfs_remove(struct qaic_drm_device *qdev);
+void set_dbc_state(struct qaic_device *qdev, u32 dbc_id, unsigned int state);
+
+void dbc_enter_ssr(struct qaic_device *qdev, u32 dbc_id);
+void dbc_exit_ssr(struct qaic_device *qdev, u32 dbc_id);
+
+struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev,
+					     struct dma_buf *dma_buf);
+
+int qaic_create_bo_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file_priv);
+int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv);
+int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data,
+			       struct drm_file *file_priv);
+int qaic_execute_bo_ioctl(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv);
+int qaic_partial_execute_bo_ioctl(struct drm_device *dev, void *data,
+				  struct drm_file *file_priv);
+int qaic_wait_bo_ioctl(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv);
+int qaic_test_print_bo_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file_priv);
+int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file_priv);
+void irq_polling_work(struct work_struct *work);
+
+#endif /* QAICINTERNAL_H_ */
-- 
2.7.4

