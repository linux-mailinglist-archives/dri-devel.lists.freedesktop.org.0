Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 839526B7F99
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 18:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B4E10E5E5;
	Mon, 13 Mar 2023 17:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94A110E5E5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 17:37:54 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DH41lv000627; Mon, 13 Mar 2023 17:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MJ4++H05ic9JJyoL8SuXJyGtLSzUGofSJBwJM5ZzQPk=;
 b=MRLZ5pXPVWJDPCM22hl2fv0BrOyN8PNWAeIQv2mLoT8dX08Qxug0l7m08WmU+MsERdQ5
 l0WnWhCMP8qh14+yclR4v0N34BZ+siAYvnVYtjvXisA0XamYPjXmWFkHi3bRNWrzA03f
 dJy3jAziBX1PKtOD8D25O3Mu5cr72ni/KVG2DuZYsDdXL9RqFYsjGb80K6AsQ5fXO1NY
 V4LljJpaUXSMO+3Ob37yQO3IuKC+RLBIeve9StCVg9D6x/9YYngkpnqw+XaO3FNgeVs6
 cNyCXj2khB02XXTu7/Z5VnrzagLFIxzBidild7BYw565GQYqRyp7IEw17OAmgxv5HQ5v wA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pa7w6r2tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 17:37:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32DHbWow009448
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 17:37:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 10:37:31 -0700
Message-ID: <ba787919-cc97-518f-18ca-472fbe56b129@quicinc.com>
Date: Mon, 13 Mar 2023 11:37:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 2/8] accel/qaic: Add uapi and core driver file
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dafna@fastmail.com>, <ogabbay@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-3-git-send-email-quic_jhugo@quicinc.com>
 <fcdababa-2ad1-bb2f-c306-c6f6950d9485@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <fcdababa-2ad1-bb2f-c306-c6f6950d9485@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: A2IIRycRYVy_A2eiZWLfodP_jusRteb4
X-Proofpoint-GUID: A2IIRycRYVy_A2eiZWLfodP_jusRteb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_09,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130137
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
Cc: quic_pkanojiy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_carlv@quicinc.com, quic_ajitpals@quicinc.com, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/13/2023 7:21 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 06.03.2023 22:33, Jeffrey Hugo wrote:
>> Add the QAIC driver uapi file and core driver file that binds to the PCIe
>> device. The core driver file also creates the accel device and manages
>> all the interconnections between the different parts of the driver.
>>
>> The driver can be built as a module. If so, it will be called "qaic.ko".
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> ---
>>   drivers/accel/qaic/qaic.h     | 282 ++++++++++++++++++
>>   drivers/accel/qaic/qaic_drv.c | 648 ++++++++++++++++++++++++++++++++++++++++++
>>   include/uapi/drm/qaic_accel.h | 397 ++++++++++++++++++++++++++
>>   3 files changed, 1327 insertions(+)
>>   create mode 100644 drivers/accel/qaic/qaic.h
>>   create mode 100644 drivers/accel/qaic/qaic_drv.c
>>   create mode 100644 include/uapi/drm/qaic_accel.h
>>
>> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
>> new file mode 100644
>> index 0000000..996a68f
>> --- /dev/null
>> +++ b/drivers/accel/qaic/qaic.h
>> @@ -0,0 +1,282 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only
>> + *
>> + * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _QAIC_H_
>> +#define _QAIC_H_
>> +
>> +#include <linux/interrupt.h>
>> +#include <linux/kref.h>
>> +#include <linux/mhi.h>
>> +#include <linux/mutex.h>
>> +#include <linux/pci.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/srcu.h>
>> +#include <linux/wait.h>
>> +#include <linux/workqueue.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_gem.h>
>> +
>> +#define QAIC_DBC_BASE		SZ_128K
>> +#define QAIC_DBC_SIZE		SZ_4K
>> +
>> +#define QAIC_NO_PARTITION	-1
>> +
>> +#define QAIC_DBC_OFF(i)		((i) * QAIC_DBC_SIZE + QAIC_DBC_BASE)
>> +
>> +#define to_qaic_bo(obj) container_of(obj, struct qaic_bo, base)
>> +
>> +extern bool poll_datapath;
>> +
>> +struct qaic_user {
>> +	/* Uniquely identifies this user for the device */
>> +	int			handle;
>> +	struct kref		ref_count;
>> +	/* Char device opened by this user */
>> +	struct qaic_drm_device	*qddev;
>> +	/* Node in list of users that opened this drm device */
>> +	struct list_head	node;
>> +	/* SRCU used to synchronize this user during cleanup */
>> +	struct srcu_struct	qddev_lock;
>> +	atomic_t		chunk_id;
>> +};
>> +
>> +struct dma_bridge_chan {
>> +	/* Pointer to device strcut maintained by driver */
>> +	struct qaic_device	*qdev;
>> +	/* ID of this DMA bridge channel(DBC) */
>> +	unsigned int		id;
>> +	/* Synchronizes access to xfer_list */
>> +	spinlock_t		xfer_lock;
>> +	/* Base address of request queue */
>> +	void			*req_q_base;
>> +	/* Base address of response queue */
>> +	void			*rsp_q_base;
>> +	/*
>> +	 * Base bus address of request queue. Response queue bus address can be
>> +	 * calculated by adding request queue size to this variable
>> +	 */
>> +	dma_addr_t		dma_addr;
>> +	/* Total size of request and response queue in byte */
>> +	u32			total_size;
>> +	/* Capacity of request/response queue */
>> +	u32			nelem;
>> +	/* The user that opened this DBC */
>> +	struct qaic_user	*usr;
>> +	/*
>> +	 * Request ID of next memory handle that goes in request queue. One
>> +	 * memory handle can enqueue more than one request elements, all
>> +	 * this requests that belong to same memory handle have same request ID
>> +	 */
>> +	u16			next_req_id;
>> +	/* true: DBC is in use; false: DBC not in use */
>> +	bool			in_use;
>> +	/*
>> +	 * Base address of device registers. Used to read/write request and
>> +	 * response queue's head and tail pointer of this DBC.
>> +	 */
>> +	void __iomem		*dbc_base;
>> +	/* Head of list where each node is a memory handle queued in request queue */
>> +	struct list_head	xfer_list;
>> +	/* Synchronizes DBC readers during cleanup */
>> +	struct srcu_struct	ch_lock;
>> +	/*
>> +	 * When this DBC is released, any thread waiting on this wait queue is
>> +	 * woken up
>> +	 */
>> +	wait_queue_head_t	dbc_release;
>> +	/* Head of list where each node is a bo associated with this DBC */
>> +	struct list_head	bo_lists;
>> +	/* The irq line for this DBC. Used for polling */
>> +	unsigned int		irq;
>> +	/* Polling work item to simulate interrupts */
>> +	struct work_struct	poll_work;
>> +};
>> +
>> +struct qaic_device {
>> +	/* Pointer to base PCI device struct of our physical device */
>> +	struct pci_dev		*pdev;
>> +	/* Req. ID of request that will be queued next in MHI control device */
>> +	u32			next_seq_num;
>> +	/* Base address of bar 0 */
>> +	void __iomem		*bar_0;
>> +	/* Base address of bar 2 */
>> +	void __iomem		*bar_2;
>> +	/* Controller structure for MHI devices */
>> +	struct mhi_controller	*mhi_cntl;
>> +	/* MHI control channel device */
>> +	struct mhi_device	*cntl_ch;
>> +	/* List of requests queued in MHI control device */
>> +	struct list_head	cntl_xfer_list;
>> +	/* Synchronizes MHI control device transactions and its xfer list */
>> +	struct mutex		cntl_mutex;
>> +	/* Array of DBC struct of this device */
>> +	struct dma_bridge_chan	*dbc;
>> +	/* Work queue for tasks related to MHI control device */
>> +	struct workqueue_struct	*cntl_wq;
>> +	/* Synchronizes all the users of device during cleanup */
>> +	struct srcu_struct	dev_lock;
>> +	/* true: Device under reset; false: Device not under reset */
>> +	bool			in_reset;
>> +	/*
>> +	 * true: A tx MHI transaction has failed and a rx buffer is still queued
>> +	 * in control device. Such a buffer is considered lost rx buffer
>> +	 * false: No rx buffer is lost in control device
>> +	 */
>> +	bool			cntl_lost_buf;
>> +	/* Maximum number of DBC supported by this device */
>> +	u32			num_dbc;
>> +	/* Reference to the drm_device for this device when it is created */
>> +	struct qaic_drm_device	*qddev;
>> +	/* Generate the CRC of a control message */
>> +	u32 (*gen_crc)(void *msg);
>> +	/* Validate the CRC of a control message */
>> +	bool (*valid_crc)(void *msg);
>> +};
>> +
>> +struct qaic_drm_device {
>> +	/* Pointer to the root device struct driven by this driver */
>> +	struct qaic_device	*qdev;
>> +	/*
>> +	 * The physical device can be partition in number of logical devices.
>> +	 * And each logical device is given a partition id. This member stores
>> +	 * that id. QAIC_NO_PARTITION is a sentinel used to mark that this drm
>> +	 * device is the actual physical device
>> +	 */
>> +	s32			partition_id;
>> +	/* Pointer to the drm device struct of this drm device */
>> +	struct drm_device	*ddev;
>> +	/* Head in list of users who have opened this drm device */
>> +	struct list_head	users;
>> +	/* Synchronizes access to users list */
>> +	struct mutex		users_mutex;
>> +};
>> +
>> +struct qaic_bo {
>> +	struct drm_gem_object	base;
>> +	/* Scatter/gather table for allocate/imported BO */
>> +	struct sg_table		*sgt;
>> +	/* BO size requested by user. GEM object might be bigger in size. */
>> +	u64			size;
>> +	/* Head in list of slices of this BO */
>> +	struct list_head	slices;
>> +	/* Total nents, for all slices of this BO */
>> +	int			total_slice_nents;
>> +	/*
>> +	 * Direction of transfer. It can assume only two value DMA_TO_DEVICE and
>> +	 * DMA_FROM_DEVICE.
>> +	 */
>> +	int			dir;
>> +	/* The pointer of the DBC which operates on this BO */
>> +	struct dma_bridge_chan	*dbc;
>> +	/* Number of slice that belongs to this buffer */
>> +	u32			nr_slice;
>> +	/* Number of slice that have been transferred by DMA engine */
>> +	u32			nr_slice_xfer_done;
>> +	/* true = BO is queued for execution, true = BO is not queued */
>> +	bool			queued;
>> +	/*
>> +	 * If true then user has attached slicing information to this BO by
>> +	 * calling DRM_IOCTL_QAIC_ATTACH_SLICE_BO ioctl.
>> +	 */
>> +	bool			sliced;
>> +	/* Request ID of this BO if it is queued for execution */
>> +	u16			req_id;
>> +	/* Handle assigned to this BO */
>> +	u32			handle;
>> +	/* Wait on this for completion of DMA transfer of this BO */
>> +	struct completion	xfer_done;
>> +	/*
>> +	 * Node in linked list where head is dbc->xfer_list.
>> +	 * This link list contain BO's that are queued for DMA transfer.
>> +	 */
>> +	struct list_head	xfer_list;
>> +	/*
>> +	 * Node in linked list where head is dbc->bo_lists.
>> +	 * This link list contain BO's that are associated with the DBC it is
>> +	 * linked to.
>> +	 */
>> +	struct list_head	bo_list;
>> +	struct {
>> +		/*
>> +		 * Latest timestamp(ns) at which kernel received a request to
>> +		 * execute this BO
>> +		 */
>> +		u64		req_received_ts;
>> +		/*
>> +		 * Latest timestamp(ns) at which kernel enqueued requests of
>> +		 * this BO for execution in DMA queue
>> +		 */
>> +		u64		req_submit_ts;
>> +		/*
>> +		 * Latest timestamp(ns) at which kernel received a completion
>> +		 * interrupt for requests of this BO
>> +		 */
>> +		u64		req_processed_ts;
>> +		/*
>> +		 * Number of elements already enqueued in DMA queue before
>> +		 * enqueuing requests of this BO
>> +		 */
>> +		u32		queue_level_before;
>> +	} perf_stats;
>> +
>> +};
>> +
>> +struct bo_slice {
>> +	/* Mapped pages */
>> +	struct sg_table		*sgt;
>> +	/* Number of requests required to queue in DMA queue */
>> +	int			nents;
>> +	/* See enum dma_data_direction */
>> +	int			dir;
>> +	/* Actual requests that will be copied in DMA queue */
>> +	struct dbc_req		*reqs;
>> +	struct kref		ref_count;
>> +	/* true: No DMA transfer required */
>> +	bool			no_xfer;
>> +	/* Pointer to the parent BO handle */
>> +	struct qaic_bo		*bo;
>> +	/* Node in list of slices maintained by parent BO */
>> +	struct list_head	slice;
>> +	/* Size of this slice in bytes */
>> +	u64			size;
>> +	/* Offset of this slice in buffer */
>> +	u64			offset;
>> +};
>> +
>> +int get_dbc_req_elem_size(void);
>> +int get_dbc_rsp_elem_size(void);
>> +int get_cntl_version(struct qaic_device *qdev, struct qaic_user *usr, u16 *major, u16 *minor);
>> +int qaic_manage_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +void qaic_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result);
>> +
>> +void qaic_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result);
>> +
>> +int qaic_control_open(struct qaic_device *qdev);
>> +void qaic_control_close(struct qaic_device *qdev);
>> +void qaic_release_usr(struct qaic_device *qdev, struct qaic_user *usr);
>> +
>> +irqreturn_t dbc_irq_threaded_fn(int irq, void *data);
>> +irqreturn_t dbc_irq_handler(int irq, void *data);
>> +int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
>> +void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
>> +void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
>> +void release_dbc(struct qaic_device *qdev, u32 dbc_id);
>> +
>> +void wake_all_cntl(struct qaic_device *qdev);
>> +void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exit_reset);
>> +
>> +struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
>> +
>> +int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +int qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +int qaic_partial_execute_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +void irq_polling_work(struct work_struct *work);
>> +
>> +#endif /* _QAIC_H_ */
>> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
>> new file mode 100644
>> index 0000000..9172799
>> --- /dev/null
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -0,0 +1,648 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
>> +/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/idr.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/list.h>
>> +#include <linux/kref.h>
>> +#include <linux/mhi.h>
>> +#include <linux/module.h>
>> +#include <linux/msi.h>
>> +#include <linux/mutex.h>
>> +#include <linux/pci.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/workqueue.h>
>> +#include <linux/wait.h>
>> +#include <drm/drm_accel.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>> +#include <drm/drm_ioctl.h>
>> +#include <uapi/drm/qaic_accel.h>
>> +
>> +#include "mhi_controller.h"
>> +#include "mhi_qaic_ctrl.h"
>> +#include "qaic.h"
>> +
>> +MODULE_IMPORT_NS(DMA_BUF);
>> +
>> +#define PCI_DEV_AIC100			0xa100
>> +#define QAIC_NAME			"qaic"
>> +#define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
>> +#define CNTL_MAJOR			5
>> +#define CNTL_MINOR			0
>> +
>> +static unsigned int datapath_polling;
>> +module_param(datapath_polling, uint, 0400);
>> +bool poll_datapath;
> 
> You can define this param as:
>    static bool poll_datapath;
>    module_param_named(poll_datapath, datapath_polling, bool, 0400);
> 
> You woudn't have to set poll_datapath manually.
> I would also consider using a single name for the param and adding documentation using MODULE_PARM_DESC().

poll_datapath is referenced in a different file, therefore it cannot be 
static.

Having two variables is intentional.  The parameter only takes effect at 
module load.  This file reads datapath_polling at module load, copies 
the value, and the driver uses the cached value (patch 5) during 
operation.  If during operation, the module parameter changes value, 
that doesn't take effect.

Your suggestion appears to make the cached variable, and the module 
parameter the same.  Which means if the module parameter changes value 
during driver operation, it will take effect immediately.  This seems 
like a "footgun", giving the user an oppertunity to break things.

I think datapath_polling can be defined as a bool, and the module_param 
call can use the bool type, but the two variables remain.

I could make poll_datapath device local, but then we'd have N copies of 
it, instead of just 1, which feels like a waste of memory.

Using MODULE_PARAM_DESC feels like a good idea.  Will do.

>> +static bool link_up;
>> +static DEFINE_IDA(qaic_usrs);
>> +
>> +static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id);
>> +static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id);
>> +
>> +static void free_usr(struct kref *kref)
>> +{
>> +	struct qaic_user *usr = container_of(kref, struct qaic_user, ref_count);
>> +
>> +	cleanup_srcu_struct(&usr->qddev_lock);
>> +	ida_free(&qaic_usrs, usr->handle);
>> +	kfree(usr);
>> +}
>> +
>> +static int qaic_open(struct drm_device *dev, struct drm_file *file)
>> +{
>> +	struct qaic_drm_device *qddev = dev->dev_private;
>> +	struct qaic_device *qdev = qddev->qdev;
>> +	struct qaic_user *usr;
>> +	int rcu_id;
>> +	int ret;
>> +
>> +	rcu_id = srcu_read_lock(&qdev->dev_lock);
>> +	if (qdev->in_reset) {
>> +		srcu_read_unlock(&qdev->dev_lock, rcu_id);
>> +		return -ENODEV;
>> +	}
>> +
>> +	usr = kmalloc(sizeof(*usr), GFP_KERNEL);
>> +	if (!usr) {
>> +		srcu_read_unlock(&qdev->dev_lock, rcu_id);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	usr->handle = ida_alloc(&qaic_usrs, GFP_KERNEL);
>> +	if (usr->handle < 0) {
>> +		ret = usr->handle;
>> +		srcu_read_unlock(&qdev->dev_lock, rcu_id);
>> +		kfree(usr);
>> +		return ret;
>> +	}
>> +	usr->qddev = qddev;
>> +	atomic_set(&usr->chunk_id, 0);
>> +	init_srcu_struct(&usr->qddev_lock);
>> +	kref_init(&usr->ref_count);
>> +
>> +	ret = mutex_lock_interruptible(&qddev->users_mutex);
>> +	if (ret) {
>> +		cleanup_srcu_struct(&usr->qddev_lock);
>> +		kfree(usr);
>> +		srcu_read_unlock(&qdev->dev_lock, rcu_id);
> 
> It looks like you are leaking usr->handle here.
> Also the order of kfree() and srcu_read_unlock() is not consistent with other error cases above.
> I would suggest using goto to handle errors in this function.

It looks like you might be right.  Will fix.

>> +		return ret;
>> +	}
>> +
>> +	list_add(&usr->node, &qddev->users);
>> +	mutex_unlock(&qddev->users_mutex);
>> +
>> +	file->driver_priv = usr;
>> +
>> +	srcu_read_unlock(&qdev->dev_lock, rcu_id);
>> +	return 0;
>> +}
>> +
>> +static void qaic_postclose(struct drm_device *dev, struct drm_file *file)
>> +{
>> +	struct qaic_user *usr = file->driver_priv;
>> +	struct qaic_drm_device *qddev;
>> +	struct qaic_device *qdev;
>> +	int qdev_rcu_id;
>> +	int usr_rcu_id;
>> +	int i;
>> +
>> +	qddev = usr->qddev;
>> +	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
>> +	if (qddev) {
>> +		qdev = qddev->qdev;
>> +		qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
>> +		if (!qdev->in_reset) {
>> +			qaic_release_usr(qdev, usr);
>> +			for (i = 0; i < qdev->num_dbc; ++i)
>> +				if (qdev->dbc[i].usr && qdev->dbc[i].usr->handle == usr->handle)
>> +					release_dbc(qdev, i);
>> +		}
>> +		srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
>> +
>> +		mutex_lock(&qddev->users_mutex);
>> +		if (!list_empty(&usr->node))
>> +			list_del_init(&usr->node);
>> +		mutex_unlock(&qddev->users_mutex);
>> +	}
>> +
>> +	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
>> +	kref_put(&usr->ref_count, free_usr);
>> +
>> +	file->driver_priv = NULL;
>> +}
>> +
>> +DEFINE_DRM_ACCEL_FOPS(qaic_accel_fops);
>> +
>> +static const struct drm_ioctl_desc qaic_drm_ioctls[] = {
>> +	DRM_IOCTL_DEF_DRV(QAIC_MANAGE, qaic_manage_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(QAIC_CREATE_BO, qaic_create_bo_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(QAIC_MMAP_BO, qaic_mmap_bo_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(QAIC_ATTACH_SLICE_BO, qaic_attach_slice_bo_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(QAIC_EXECUTE_BO, qaic_execute_bo_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(QAIC_PARTIAL_EXECUTE_BO, qaic_partial_execute_bo_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(QAIC_WAIT_BO, qaic_wait_bo_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(QAIC_PERF_STATS_BO, qaic_perf_stats_bo_ioctl, DRM_RENDER_ALLOW),
>> +};
>> +
>> +static const struct drm_driver qaic_accel_driver = {
>> +	.driver_features	= DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
>> +
>> +	.name			= QAIC_NAME,
>> +	.desc			= QAIC_DESC,
>> +	.date			= "20190618",
>> +
>> +	.fops			= &qaic_accel_fops,
>> +	.open			= qaic_open,
>> +	.postclose		= qaic_postclose,
>> +
>> +	.ioctls			= qaic_drm_ioctls,
>> +	.num_ioctls		= ARRAY_SIZE(qaic_drm_ioctls),
>> +	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>> +	.gem_prime_import	= qaic_gem_prime_import,
>> +};
>> +
>> +static int qaic_create_drm_device(struct qaic_device *qdev, s32 partition_id)
>> +{
>> +	struct qaic_drm_device *qddev;
>> +	struct drm_device *ddev;
>> +	struct device *pdev;
>> +	int ret;
>> +
>> +	/* Hold off implementing partitions until the uapi is determined */
>> +	if (partition_id != QAIC_NO_PARTITION)
>> +		return -EINVAL;
>> +
>> +	pdev = &qdev->pdev->dev;
>> +
>> +	qddev = kzalloc(sizeof(*qddev), GFP_KERNEL);
>> +	if (!qddev)
>> +		return -ENOMEM;
>> +
>> +	ddev = drm_dev_alloc(&qaic_accel_driver, pdev);
>> +	if (IS_ERR(ddev)) {
>> +		ret = PTR_ERR(ddev);
>> +		goto ddev_fail;
>> +	}
>> +
>> +	ddev->dev_private = qddev;
>> +	qddev->ddev = ddev;
>> +
>> +	qddev->qdev = qdev;
>> +	qddev->partition_id = partition_id;
>> +	INIT_LIST_HEAD(&qddev->users);
>> +	mutex_init(&qddev->users_mutex);
>> +
>> +	qdev->qddev = qddev;
>> +
>> +	ret = drm_dev_register(ddev, 0);
>> +	if (ret) {
>> +		pci_dbg(qdev->pdev, "%s: drm_dev_register failed %d\n", __func__, ret);
>> +		goto drm_reg_fail;
>> +	}
>> +
>> +	return 0;
>> +
>> +drm_reg_fail:
>> +	mutex_destroy(&qddev->users_mutex);
>> +	qdev->qddev = NULL;
>> +	drm_dev_put(ddev);
>> +ddev_fail:
>> +	kfree(qddev);
>> +	return ret;
>> +}
>> +
>> +static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
>> +{
>> +	struct qaic_drm_device *qddev;
>> +	struct qaic_user *usr;
>> +
>> +	qddev = qdev->qddev;
>> +
>> +	/*
>> +	 * Existing users get unresolvable errors till they close FDs.
>> +	 * Need to sync carefully with users calling close(). The
>> +	 * list of users can be modified elsewhere when the lock isn't
>> +	 * held here, but the sync'ing the srcu with the mutex held
>> +	 * could deadlock. Grab the mutex so that the list will be
>> +	 * unmodified. The user we get will exist as long as the
>> +	 * lock is held. Signal that the qcdev is going away, and
>> +	 * grab a reference to the user so they don't go away for
>> +	 * synchronize_srcu(). Then release the mutex to avoid
>> +	 * deadlock and make sure the user has observed the signal.
>> +	 * With the lock released, we cannot maintain any state of the
>> +	 * user list.
>> +	 */
>> +	mutex_lock(&qddev->users_mutex);
>> +	while (!list_empty(&qddev->users)) {
>> +		usr = list_first_entry(&qddev->users, struct qaic_user, node);
>> +		list_del_init(&usr->node);
>> +		kref_get(&usr->ref_count);
>> +		usr->qddev = NULL;
>> +		mutex_unlock(&qddev->users_mutex);
>> +		synchronize_srcu(&usr->qddev_lock);
>> +		kref_put(&usr->ref_count, free_usr);
>> +		mutex_lock(&qddev->users_mutex);
>> +	}
>> +	mutex_unlock(&qddev->users_mutex);
>> +
>> +	if (qddev->ddev) {
>> +		drm_dev_unregister(qddev->ddev);
>> +		drm_dev_put(qddev->ddev);
>> +	}
>> +
>> +	kfree(qddev);
>> +}
>> +
>> +static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
>> +{
>> +	struct qaic_device *qdev;
>> +	u16 major, minor;
>> +	int ret;
>> +
>> +	/*
>> +	 * Invoking this function indicates that the control channel to the
>> +	 * device is available. We use that as a signal to indicate that
>> +	 * the device side firmware has booted. The device side firmware
>> +	 * manages the device resources, so we need to communicate with it
>> +	 * via the control channel in order to utilize the device. Therefore
>> +	 * we wait until this signal to create the drm dev that userspace will
>> +	 * use to control the device, because without the device side firmware,
>> +	 * userspace can't do anything useful.
>> +	 */
>> +
>> +	qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
>> +
>> +	qdev->in_reset = false;
>> +
>> +	dev_set_drvdata(&mhi_dev->dev, qdev);
>> +	qdev->cntl_ch = mhi_dev;
>> +
>> +	ret = qaic_control_open(qdev);
>> +	if (ret) {
>> +		pci_dbg(qdev->pdev, "%s: control_open failed %d\n", __func__, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = get_cntl_version(qdev, NULL, &major, &minor);
>> +	if (ret || major != CNTL_MAJOR || minor > CNTL_MINOR) {
>> +		pci_err(qdev->pdev, "%s: Control protocol version (%d.%d) not supported. Supported version is (%d.%d). Ret: %d\n",
>> +			__func__, major, minor, CNTL_MAJOR, CNTL_MINOR, ret);
>> +		ret = -EINVAL;
>> +		goto close_control;
>> +	}
>> +
>> +	ret = qaic_create_drm_device(qdev, QAIC_NO_PARTITION);
>> +
>> +	return ret;
>> +
>> +close_control:
>> +	qaic_control_close(qdev);
>> +	return ret;
>> +}
>> +
>> +static void qaic_mhi_remove(struct mhi_device *mhi_dev)
>> +{
>> + /* This is redundant since we have already observed the device crash *
> 
> Use tab instead of space for indent.

The space was a glitch.  Will remove.
