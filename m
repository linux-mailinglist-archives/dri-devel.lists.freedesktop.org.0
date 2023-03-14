Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AADA16B9A0C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0389410EA98;
	Tue, 14 Mar 2023 15:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523D010EA98
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:42:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EEbJLK022257; Tue, 14 Mar 2023 15:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6RSZjcuZ6K+epXzB1EqTSoZkguaQx+pS/eWbFqGli8g=;
 b=XWpssDrdYss8CcVmZLSnFOBB3YaPhgcZ2VrM+USNus7t4nas2bCLDgiypCP9tqydEsIY
 UJjB/DA1oiKlD2lQwtpLn1Qos9QIh+060+0zpP+QTrs3YWSMGxGBPMLCLO2APM/u1MNz
 oDtE2g5iq2QqA5ChgstUH5Q1BUT+yVMI/3/h4+H2Pdx4CdPCbokKiYhM6T1+uQgdvjus
 C0FMRN8JafSHRsIp4s9yhTOJYKtou0X/WyW9ysIiXxJkHCCzSvDxBWfXCd80icE/oynS
 IzqViDAMdkRqZPD1fSmNFv16xoYb4dzO7SHF8gfo2g3zgDEBEKKcvW1lgibDpbFTgH+M Fg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3paay3asp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 15:41:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32EFfqm2030225
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 15:41:52 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 14 Mar
 2023 08:41:51 -0700
Message-ID: <f56a2517-6251-8639-9724-049cce5407db@quicinc.com>
Date: Tue, 14 Mar 2023 09:41:50 -0600
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
 <ba787919-cc97-518f-18ca-472fbe56b129@quicinc.com>
 <bd2aac49-04a3-0d99-dc5e-f3ff53c9c6c4@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <bd2aac49-04a3-0d99-dc5e-f3ff53c9c6c4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aAKbn6q21GWYmlY2Nr9giyYY1gtYALvP
X-Proofpoint-GUID: aAKbn6q21GWYmlY2Nr9giyYY1gtYALvP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_08,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140131
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
 quic_carlv@quicinc.com, linux-doc@vger.kernel.org, quic_ajitpals@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/14/2023 3:55 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 13.03.2023 18:37, Jeffrey Hugo wrote:
>> On 3/13/2023 7:21 AM, Jacek Lawrynowicz wrote:
>>> Hi,
>>>
>>> On 06.03.2023 22:33, Jeffrey Hugo wrote:
>>>> Add the QAIC driver uapi file and core driver file that binds to the PCIe
>>>> device. The core driver file also creates the accel device and manages
>>>> all the interconnections between the different parts of the driver.
>>>>
>>>> The driver can be built as a module. If so, it will be called "qaic.ko".
>>>>
>>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>>>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>> ---
>>>>    drivers/accel/qaic/qaic.h     | 282 ++++++++++++++++++
>>>>    drivers/accel/qaic/qaic_drv.c | 648 ++++++++++++++++++++++++++++++++++++++++++
>>>>    include/uapi/drm/qaic_accel.h | 397 ++++++++++++++++++++++++++
>>>>    3 files changed, 1327 insertions(+)
>>>>    create mode 100644 drivers/accel/qaic/qaic.h
>>>>    create mode 100644 drivers/accel/qaic/qaic_drv.c
>>>>    create mode 100644 include/uapi/drm/qaic_accel.h
>>>>
>>>> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
>>>> new file mode 100644
>>>> index 0000000..996a68f
>>>> --- /dev/null
>>>> +++ b/drivers/accel/qaic/qaic.h
>>>> @@ -0,0 +1,282 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only
>>>> + *
>>>> + * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
>>>> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +
>>>> +#ifndef _QAIC_H_
>>>> +#define _QAIC_H_
>>>> +
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/kref.h>
>>>> +#include <linux/mhi.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/pci.h>
>>>> +#include <linux/spinlock.h>
>>>> +#include <linux/srcu.h>
>>>> +#include <linux/wait.h>
>>>> +#include <linux/workqueue.h>
>>>> +#include <drm/drm_device.h>
>>>> +#include <drm/drm_gem.h>
>>>> +
>>>> +#define QAIC_DBC_BASE        SZ_128K
>>>> +#define QAIC_DBC_SIZE        SZ_4K
>>>> +
>>>> +#define QAIC_NO_PARTITION    -1
>>>> +
>>>> +#define QAIC_DBC_OFF(i)        ((i) * QAIC_DBC_SIZE + QAIC_DBC_BASE)
>>>> +
>>>> +#define to_qaic_bo(obj) container_of(obj, struct qaic_bo, base)
>>>> +
>>>> +extern bool poll_datapath;
>>>> +
>>>> +struct qaic_user {
>>>> +    /* Uniquely identifies this user for the device */
>>>> +    int            handle;
>>>> +    struct kref        ref_count;
>>>> +    /* Char device opened by this user */
>>>> +    struct qaic_drm_device    *qddev;
>>>> +    /* Node in list of users that opened this drm device */
>>>> +    struct list_head    node;
>>>> +    /* SRCU used to synchronize this user during cleanup */
>>>> +    struct srcu_struct    qddev_lock;
>>>> +    atomic_t        chunk_id;
>>>> +};
>>>> +
>>>> +struct dma_bridge_chan {
>>>> +    /* Pointer to device strcut maintained by driver */
>>>> +    struct qaic_device    *qdev;
>>>> +    /* ID of this DMA bridge channel(DBC) */
>>>> +    unsigned int        id;
>>>> +    /* Synchronizes access to xfer_list */
>>>> +    spinlock_t        xfer_lock;
>>>> +    /* Base address of request queue */
>>>> +    void            *req_q_base;
>>>> +    /* Base address of response queue */
>>>> +    void            *rsp_q_base;
>>>> +    /*
>>>> +     * Base bus address of request queue. Response queue bus address can be
>>>> +     * calculated by adding request queue size to this variable
>>>> +     */
>>>> +    dma_addr_t        dma_addr;
>>>> +    /* Total size of request and response queue in byte */
>>>> +    u32            total_size;
>>>> +    /* Capacity of request/response queue */
>>>> +    u32            nelem;
>>>> +    /* The user that opened this DBC */
>>>> +    struct qaic_user    *usr;
>>>> +    /*
>>>> +     * Request ID of next memory handle that goes in request queue. One
>>>> +     * memory handle can enqueue more than one request elements, all
>>>> +     * this requests that belong to same memory handle have same request ID
>>>> +     */
>>>> +    u16            next_req_id;
>>>> +    /* true: DBC is in use; false: DBC not in use */
>>>> +    bool            in_use;
>>>> +    /*
>>>> +     * Base address of device registers. Used to read/write request and
>>>> +     * response queue's head and tail pointer of this DBC.
>>>> +     */
>>>> +    void __iomem        *dbc_base;
>>>> +    /* Head of list where each node is a memory handle queued in request queue */
>>>> +    struct list_head    xfer_list;
>>>> +    /* Synchronizes DBC readers during cleanup */
>>>> +    struct srcu_struct    ch_lock;
>>>> +    /*
>>>> +     * When this DBC is released, any thread waiting on this wait queue is
>>>> +     * woken up
>>>> +     */
>>>> +    wait_queue_head_t    dbc_release;
>>>> +    /* Head of list where each node is a bo associated with this DBC */
>>>> +    struct list_head    bo_lists;
>>>> +    /* The irq line for this DBC. Used for polling */
>>>> +    unsigned int        irq;
>>>> +    /* Polling work item to simulate interrupts */
>>>> +    struct work_struct    poll_work;
>>>> +};
>>>> +
>>>> +struct qaic_device {
>>>> +    /* Pointer to base PCI device struct of our physical device */
>>>> +    struct pci_dev        *pdev;
>>>> +    /* Req. ID of request that will be queued next in MHI control device */
>>>> +    u32            next_seq_num;
>>>> +    /* Base address of bar 0 */
>>>> +    void __iomem        *bar_0;
>>>> +    /* Base address of bar 2 */
>>>> +    void __iomem        *bar_2;
>>>> +    /* Controller structure for MHI devices */
>>>> +    struct mhi_controller    *mhi_cntl;
>>>> +    /* MHI control channel device */
>>>> +    struct mhi_device    *cntl_ch;
>>>> +    /* List of requests queued in MHI control device */
>>>> +    struct list_head    cntl_xfer_list;
>>>> +    /* Synchronizes MHI control device transactions and its xfer list */
>>>> +    struct mutex        cntl_mutex;
>>>> +    /* Array of DBC struct of this device */
>>>> +    struct dma_bridge_chan    *dbc;
>>>> +    /* Work queue for tasks related to MHI control device */
>>>> +    struct workqueue_struct    *cntl_wq;
>>>> +    /* Synchronizes all the users of device during cleanup */
>>>> +    struct srcu_struct    dev_lock;
>>>> +    /* true: Device under reset; false: Device not under reset */
>>>> +    bool            in_reset;
>>>> +    /*
>>>> +     * true: A tx MHI transaction has failed and a rx buffer is still queued
>>>> +     * in control device. Such a buffer is considered lost rx buffer
>>>> +     * false: No rx buffer is lost in control device
>>>> +     */
>>>> +    bool            cntl_lost_buf;
>>>> +    /* Maximum number of DBC supported by this device */
>>>> +    u32            num_dbc;
>>>> +    /* Reference to the drm_device for this device when it is created */
>>>> +    struct qaic_drm_device    *qddev;
>>>> +    /* Generate the CRC of a control message */
>>>> +    u32 (*gen_crc)(void *msg);
>>>> +    /* Validate the CRC of a control message */
>>>> +    bool (*valid_crc)(void *msg);
>>>> +};
>>>> +
>>>> +struct qaic_drm_device {
>>>> +    /* Pointer to the root device struct driven by this driver */
>>>> +    struct qaic_device    *qdev;
>>>> +    /*
>>>> +     * The physical device can be partition in number of logical devices.
>>>> +     * And each logical device is given a partition id. This member stores
>>>> +     * that id. QAIC_NO_PARTITION is a sentinel used to mark that this drm
>>>> +     * device is the actual physical device
>>>> +     */
>>>> +    s32            partition_id;
>>>> +    /* Pointer to the drm device struct of this drm device */
>>>> +    struct drm_device    *ddev;
>>>> +    /* Head in list of users who have opened this drm device */
>>>> +    struct list_head    users;
>>>> +    /* Synchronizes access to users list */
>>>> +    struct mutex        users_mutex;
>>>> +};
>>>> +
>>>> +struct qaic_bo {
>>>> +    struct drm_gem_object    base;
>>>> +    /* Scatter/gather table for allocate/imported BO */
>>>> +    struct sg_table        *sgt;
>>>> +    /* BO size requested by user. GEM object might be bigger in size. */
>>>> +    u64            size;
>>>> +    /* Head in list of slices of this BO */
>>>> +    struct list_head    slices;
>>>> +    /* Total nents, for all slices of this BO */
>>>> +    int            total_slice_nents;
>>>> +    /*
>>>> +     * Direction of transfer. It can assume only two value DMA_TO_DEVICE and
>>>> +     * DMA_FROM_DEVICE.
>>>> +     */
>>>> +    int            dir;
>>>> +    /* The pointer of the DBC which operates on this BO */
>>>> +    struct dma_bridge_chan    *dbc;
>>>> +    /* Number of slice that belongs to this buffer */
>>>> +    u32            nr_slice;
>>>> +    /* Number of slice that have been transferred by DMA engine */
>>>> +    u32            nr_slice_xfer_done;
>>>> +    /* true = BO is queued for execution, true = BO is not queued */
>>>> +    bool            queued;
>>>> +    /*
>>>> +     * If true then user has attached slicing information to this BO by
>>>> +     * calling DRM_IOCTL_QAIC_ATTACH_SLICE_BO ioctl.
>>>> +     */
>>>> +    bool            sliced;
>>>> +    /* Request ID of this BO if it is queued for execution */
>>>> +    u16            req_id;
>>>> +    /* Handle assigned to this BO */
>>>> +    u32            handle;
>>>> +    /* Wait on this for completion of DMA transfer of this BO */
>>>> +    struct completion    xfer_done;
>>>> +    /*
>>>> +     * Node in linked list where head is dbc->xfer_list.
>>>> +     * This link list contain BO's that are queued for DMA transfer.
>>>> +     */
>>>> +    struct list_head    xfer_list;
>>>> +    /*
>>>> +     * Node in linked list where head is dbc->bo_lists.
>>>> +     * This link list contain BO's that are associated with the DBC it is
>>>> +     * linked to.
>>>> +     */
>>>> +    struct list_head    bo_list;
>>>> +    struct {
>>>> +        /*
>>>> +         * Latest timestamp(ns) at which kernel received a request to
>>>> +         * execute this BO
>>>> +         */
>>>> +        u64        req_received_ts;
>>>> +        /*
>>>> +         * Latest timestamp(ns) at which kernel enqueued requests of
>>>> +         * this BO for execution in DMA queue
>>>> +         */
>>>> +        u64        req_submit_ts;
>>>> +        /*
>>>> +         * Latest timestamp(ns) at which kernel received a completion
>>>> +         * interrupt for requests of this BO
>>>> +         */
>>>> +        u64        req_processed_ts;
>>>> +        /*
>>>> +         * Number of elements already enqueued in DMA queue before
>>>> +         * enqueuing requests of this BO
>>>> +         */
>>>> +        u32        queue_level_before;
>>>> +    } perf_stats;
>>>> +
>>>> +};
>>>> +
>>>> +struct bo_slice {
>>>> +    /* Mapped pages */
>>>> +    struct sg_table        *sgt;
>>>> +    /* Number of requests required to queue in DMA queue */
>>>> +    int            nents;
>>>> +    /* See enum dma_data_direction */
>>>> +    int            dir;
>>>> +    /* Actual requests that will be copied in DMA queue */
>>>> +    struct dbc_req        *reqs;
>>>> +    struct kref        ref_count;
>>>> +    /* true: No DMA transfer required */
>>>> +    bool            no_xfer;
>>>> +    /* Pointer to the parent BO handle */
>>>> +    struct qaic_bo        *bo;
>>>> +    /* Node in list of slices maintained by parent BO */
>>>> +    struct list_head    slice;
>>>> +    /* Size of this slice in bytes */
>>>> +    u64            size;
>>>> +    /* Offset of this slice in buffer */
>>>> +    u64            offset;
>>>> +};
>>>> +
>>>> +int get_dbc_req_elem_size(void);
>>>> +int get_dbc_rsp_elem_size(void);
>>>> +int get_cntl_version(struct qaic_device *qdev, struct qaic_user *usr, u16 *major, u16 *minor);
>>>> +int qaic_manage_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>>> +void qaic_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result);
>>>> +
>>>> +void qaic_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result);
>>>> +
>>>> +int qaic_control_open(struct qaic_device *qdev);
>>>> +void qaic_control_close(struct qaic_device *qdev);
>>>> +void qaic_release_usr(struct qaic_device *qdev, struct qaic_user *usr);
>>>> +
>>>> +irqreturn_t dbc_irq_threaded_fn(int irq, void *data);
>>>> +irqreturn_t dbc_irq_handler(int irq, void *data);
>>>> +int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
>>>> +void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
>>>> +void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
>>>> +void release_dbc(struct qaic_device *qdev, u32 dbc_id);
>>>> +
>>>> +void wake_all_cntl(struct qaic_device *qdev);
>>>> +void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exit_reset);
>>>> +
>>>> +struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
>>>> +
>>>> +int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>>> +int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>>> +int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>>> +int qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>>> +int qaic_partial_execute_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>>> +int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>>> +int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>>> +void irq_polling_work(struct work_struct *work);
>>>> +
>>>> +#endif /* _QAIC_H_ */
>>>> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
>>>> new file mode 100644
>>>> index 0000000..9172799
>>>> --- /dev/null
>>>> +++ b/drivers/accel/qaic/qaic_drv.c
>>>> @@ -0,0 +1,648 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
>>>> +/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
>>>> +
>>>> +#include <linux/delay.h>
>>>> +#include <linux/dma-mapping.h>
>>>> +#include <linux/idr.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/list.h>
>>>> +#include <linux/kref.h>
>>>> +#include <linux/mhi.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/msi.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/pci.h>
>>>> +#include <linux/spinlock.h>
>>>> +#include <linux/workqueue.h>
>>>> +#include <linux/wait.h>
>>>> +#include <drm/drm_accel.h>
>>>> +#include <drm/drm_drv.h>
>>>> +#include <drm/drm_file.h>
>>>> +#include <drm/drm_gem.h>
>>>> +#include <drm/drm_ioctl.h>
>>>> +#include <uapi/drm/qaic_accel.h>
>>>> +
>>>> +#include "mhi_controller.h"
>>>> +#include "mhi_qaic_ctrl.h"
>>>> +#include "qaic.h"
>>>> +
>>>> +MODULE_IMPORT_NS(DMA_BUF);
>>>> +
>>>> +#define PCI_DEV_AIC100            0xa100
>>>> +#define QAIC_NAME            "qaic"
>>>> +#define QAIC_DESC            "Qualcomm Cloud AI Accelerators"
>>>> +#define CNTL_MAJOR            5
>>>> +#define CNTL_MINOR            0
>>>> +
>>>> +static unsigned int datapath_polling;
>>>> +module_param(datapath_polling, uint, 0400);
>>>> +bool poll_datapath;
>>>
>>> You can define this param as:
>>>     static bool poll_datapath;
>>>     module_param_named(poll_datapath, datapath_polling, bool, 0400);
>>>
>>> You woudn't have to set poll_datapath manually.
>>> I would also consider using a single name for the param and adding documentation using MODULE_PARM_DESC().
>>
>> poll_datapath is referenced in a different file, therefore it cannot be static.
>>
>> Having two variables is intentional.  The parameter only takes effect at module load.  This file reads datapath_polling at module load, copies the value, and the driver uses the cached value (patch 5) during operation.  If during operation, the module parameter changes value, that doesn't take effect.
>>
>> Your suggestion appears to make the cached variable, and the module parameter the same.  Which means if the module parameter changes value during driver operation, it will take effect immediately.  This seems like a "footgun", giving the user an oppertunity to break things.
>>
>> I think datapath_polling can be defined as a bool, and the module_param call can use the bool type, but the two variables remain.
>>
>> I could make poll_datapath device local, but then we'd have N copies of it, instead of just 1, which feels like a waste of memory.
>>
>> Using MODULE_PARAM_DESC feels like a good idea.  Will do.
> 
> The value of the poll_datapath cannot be changed at runtime as have read-only permissions (0400) set in sysfs.

Those permissions can be changed, which concerned me and informed this 
design.  However, digging through the layers of macros I see that no 
"set" function is registered if the perms from the driver are not 
writable to avoid exactally that.  This is something I missed eariler.

You are right, two variables are not needed here.  Will simplify.
