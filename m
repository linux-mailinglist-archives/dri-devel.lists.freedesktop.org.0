Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB26A23A6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 22:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0573910ED23;
	Fri, 24 Feb 2023 21:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9300310E24F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 21:21:50 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31OFY3sv007064; Fri, 24 Feb 2023 21:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=//g4ObyzCFPZoVTqKA8Lnh+zrLaGykLEtFuh+CGByjE=;
 b=XeqT6F0luWS2n5mPLN4HUx+l7KOgGc11LNq6wJenuWHDweDQnUi7j5ZfO7SmYRHd8n7M
 6Kz7iqFZXni7YLBr0XIuq7WHpfOh1Yvu6cCSHdVmzOBEiTmkBa8mz/bKFGxnqLjo0PZQ
 gFPByKS4S4hFVV7q4QokXBrNM4bCTinpoLaBWrOG1AvobFocL+GlHVPo4CzKiwRz6Qe8
 1pgxO61BdYPwXlHoHwo0/HC4VfHYayEKEZHd938eWVhmD5KZ4i4vFzcNp1CzDMfSd3t2
 WuaUz+tguRf5xg5dYLA0hi2OkkJ0mvSLhqbgyprC+BSg67sxl9f756i/WQJcg/dVXD5a XQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nxuu11nn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 21:21:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OLLc2n032090
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 21:21:38 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Feb
 2023 13:21:37 -0800
Message-ID: <6fcb1b75-e029-120b-6fc7-0bab48c7db29@quicinc.com>
Date: Fri, 24 Feb 2023 14:21:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/8] accel/qaic: Add uapi and core driver file
Content-Language: en-US
To: Dafna Hirschfeld <dafna@fastmail.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-3-git-send-email-quic_jhugo@quicinc.com>
 <6f39e97f-bbef-53a2-96d7-db5970142db0@linux.intel.com>
 <6263a464-f291-4e6a-eca2-e18d17d56e84@quicinc.com>
 <20230222155210.mxitxfoulniqj7dv@dhirschfeld-vm-u20.habana-labs.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230222155210.mxitxfoulniqj7dv@dhirschfeld-vm-u20.habana-labs.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5dPOZBklZ5TmhM-i0trTIUSSuTH_gfzT
X-Proofpoint-ORIG-GUID: 5dPOZBklZ5TmhM-i0trTIUSSuTH_gfzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_15,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240169
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com,
 quic_carlv@quicinc.com, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/22/2023 8:52 AM, Dafna Hirschfeld wrote:
> On 17.02.2023 11:15, Jeffrey Hugo wrote:
>> On 2/16/2023 7:13 AM, Jacek Lawrynowicz wrote:
>>> Hi,
>>>
>>> On 06.02.2023 16:41, Jeffrey Hugo wrote:
>>>> Add the QAIC driver uapi file and core driver file that binds to the 
>>>> PCIe
>>>> device.  The core driver file also creates the accel device and manages
>>>> all the interconnections between the different parts of the driver.
>>>>
>>>> The driver can be built as a module.  If so, it will be called 
>>>> "qaic.ko".
>>>>
>>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>>>> ---
>>>>  drivers/accel/qaic/qaic.h     | 321 ++++++++++++++++++
>>>>  drivers/accel/qaic/qaic_drv.c | 771 
>>>> ++++++++++++++++++++++++++++++++++++++++++
>>>>  include/uapi/drm/qaic_accel.h | 283 ++++++++++++++++
>>>>  3 files changed, 1375 insertions(+)
>>>>  create mode 100644 drivers/accel/qaic/qaic.h
>>>>  create mode 100644 drivers/accel/qaic/qaic_drv.c
>>>>  create mode 100644 include/uapi/drm/qaic_accel.h
>>>>
>>>> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
>>>> new file mode 100644
>>>> index 0000000..3f7ea76
>>>> --- /dev/null
>>>> +++ b/drivers/accel/qaic/qaic.h
>>>> @@ -0,0 +1,321 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only
>>>> + *
>>>> + * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
>>>> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All 
>>>> rights reserved.
>>>> + */
>>>> +
>>>> +#ifndef QAICINTERNAL_H_
>>>
>>> Please use guard macro that matches the file name: _QAIC_H_
>>
>> Before moving to DRM/ACCEL, this conflicted with the uapi file. 
>> However, that is no longer the case, so yes, this should be changed. 
>> Will do.
>>
>>>
>>>> +#define QAICINTERNAL_H_
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
>>>> +#define QAIC_DBC_BASE        0x20000
>>>> +#define QAIC_DBC_SIZE        0x1000
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
>>>> +     * Base bus address of request queue. Response queue bus 
>>>> address can be
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
>>>> +     * Request ID of next memory handle that goes in request queue. 
>>>> One
>>>> +     * memory handle can enqueue more than one request elements, all
>>>> +     * this requests that belong to same memory handle have same 
>>>> request ID
>>>> +     */
>>>> +    u16            next_req_id;
>>>> +    /* TRUE: DBC is in use; FALSE: DBC not in use */
>>>
>>> Use standard "true"/"false" instead of custom "TRUE"/"FALSE" macros.
>>> This applies here and in multiple other places in the driver.
>>
>> I think you are getting at that the documentation could be confusing. 
>> I don't appear to see custom macro use in the code.  Will try to 
>> clarify that here.
>>
>>>> +    bool            in_use;
>>>> +    /*
>>>> +     * Base address of device registers. Used to read/write request 
>>>> and
>>>> +     * response queue's head and tail pointer of this DBC.
>>>> +     */
>>>> +    void __iomem        *dbc_base;
>>>> +    /* Head of list where each node is a memory handle queued in 
>>>> request queue */
>>>> +    struct list_head    xfer_list;
>>>> +    /* Synchronizes DBC readers during cleanup */
>>>> +    struct srcu_struct    ch_lock;
>>>> +    /*
>>>> +     * When this DBC is released, any thread waiting on this wait 
>>>> queue is
>>>> +     * woken up
>>>> +     */
>>>> +    wait_queue_head_t    dbc_release;
>>>> +    /* Head of list where each node is a bo associated with this 
>>>> DBC */
>>>> +    struct list_head    bo_lists;
>>>> +    /* The irq line for this DBC.  Used for polling */
>>>> +    unsigned int        irq;
>>>> +    /* Polling work item to simulate interrupts */
>>>> +    struct work_struct    poll_work;
>>>> +};
>>>> +
>>>> +struct qaic_device {
>>>> +    /* Pointer to base PCI device struct of our physical device */
>>>> +    struct pci_dev        *pdev;
>>>> +    /* Mask of all bars of this device */
>>>> +    int            bars;
>>>> +    /* Req. ID of request that will be queued next in MHI control 
>>>> device */
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
>>>> +    /* Synchronizes MHI control device transactions and its xfer 
>>>> list */
>>>> +    struct mutex        cntl_mutex;
>>>> +    /* Base actual physical representation of drm device */
>>>> +    struct qaic_drm_device    *base_dev;
>>>> +    /* Array of DBC struct of this device */
>>>> +    struct dma_bridge_chan    *dbc;
>>>> +    /* Work queue for tasks related to MHI control device */
>>>> +    struct workqueue_struct    *cntl_wq;
>>>> +    /* Synchronizes all the users of device during cleanup */
>>>> +    struct srcu_struct    dev_lock;
>>>> +    /* TRUE: Device under reset; FALSE: Device not under reset */
>>>> +    bool            in_reset;
>>>> +    /*
>>>> +     * TRUE: A tx MHI transaction has failed and a rx buffer is 
>>>> still queued
>>>> +     * in control device. Such a buffer is considered lost rx buffer
>>>> +     * FALSE: No rx buffer is lost in control device
>>>> +     */
>>>> +    bool            cntl_lost_buf;
>>>> +    /* Maximum number of DBC supported by this device */
>>>> +    u32            num_dbc;
>>>> +    /* Head in list of drm device created on top of this device */
>>>> +    struct list_head    qaic_drm_devices;
>>>> +    /* Synchronizes access of qaic_drm_devices list */
>>>> +    struct mutex        qaic_drm_devices_mutex;
>>>> +    /* Generate the CRC of a control message */
>>>> +    u32 (*gen_crc)(void *msg);
>>>> +    /* Validate the CRC of a control message */
>>>> +    bool (*valid_crc)(void *msg);
>>>> +};
>>>> +
>>>> +struct qaic_drm_device {
>>>> +    /* Pointer to the root device struct driven by this driver */
>>>> +    struct qaic_device    *qdev;
>>>> +    /* Node in list of drm devices maintained by root device */
>>>> +    struct list_head    node;
>>>> +    /*
>>>> +     * The physical device can be partition in number of logical 
>>>> devices.
>>>> +     * And each logical device is given a partition id. This member 
>>>> stores
>>>> +     * that id. QAIC_NO_PARTITION is a sentinel used to mark that 
>>>> this drm
>>>> +     * device is the actual physical device
>>>> +     */
>>>> +    s32            partition_id;
>>>> +    /*
>>>> +     * It points to the user that created this drm device. It is NULL
>>>> +     * when this drm device represents the physical device i.e.
>>>> +     * partition_id is QAIC_NO_PARTITION
>>>> +     */
>>>> +    struct qaic_user    *owner;
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
>>>
>>> Any reason why drm_gem_shmem_object cannot be used as a base?
>>
>> I beleive that is incompatible with our memory allocator in patch 5.
>>
>>>> +    /* Scatter/gather table for allocate/imported BO */
>>>> +    struct sg_table        *sgt;
>>>> +    /* BO size requested by user. GEM object might be bigger in 
>>>> size. */
>>>> +    u64            size;
>>>> +    /* Head in list of slices of this BO */
>>>> +    struct list_head    slices;
>>>> +    /* Total nents, for all slices of this BO */
>>>> +    int            total_slice_nents;
>>>> +    /*
>>>> +     * Direction of transfer. It can assume only two value 
>>>> DMA_TO_DEVICE and
>>>> +     * DMA_FROM_DEVICE.
>>>> +     */
>>>> +    int            dir;
>>>> +    /* The pointer of the DBC which operates on this BO */
>>>> +    struct dma_bridge_chan    *dbc;
>>>> +    /* Number of slice that belongs to this buffer */
>>>> +    u32            nr_slice;
>>>> +    /* Number of slice that have been transferred by DMA engine */
>>>> +    u32            nr_slice_xfer_done;
>>>> +    /* TRUE = BO is queued for execution, FALSE = BO is not queued */
>>>> +    bool            queued;
>>>> +    /*
>>>> +     * If TRUE then user has attached slicing information to this 
>>>> BO by
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
>>>> +     * This link list contain BO's that are associated with the DBC 
>>>> it is
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
>>>> +    /* TRUE: No DMA transfer required */
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
>>>> +int get_cntl_version(struct qaic_device *qdev, struct qaic_user *usr,
>>>> +             u16 *major, u16 *minor);
>>>> +int qaic_manage_ioctl(struct drm_device *dev, void *data,
>>>> +              struct drm_file *file_priv);
>>>> +int qaic_execute_ioctl(struct qaic_device *qdev, struct qaic_user 
>>>> *usr,
>>>> +               unsigned long arg, bool is_partial);
>>>> +int qaic_wait_exec_ioctl(struct qaic_device *qdev, struct qaic_user 
>>>> *usr,
>>>> +             unsigned long arg);
>>>> +int qaic_query_ioctl(struct qaic_device *qdev, struct qaic_user *usr,
>>>> +             unsigned long arg);
>>>> +int qaic_data_mmap(struct qaic_device *qdev, struct qaic_user *usr,
>>>> +           struct vm_area_struct *vma);
>>>> +int qaic_data_get_reservation(struct qaic_device *qdev, struct 
>>>> qaic_user *usr,
>>>> +                  void *data, u32 *partition_id,
>>>> +                  u16 *remove);
>>>> +void qaic_mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
>>>> +             struct mhi_result *mhi_result);
>>>> +
>>>> +void qaic_mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
>>>> +             struct mhi_result *mhi_result);
>>>> +
>>>> +int qaic_control_open(struct qaic_device *qdev);
>>>> +void qaic_control_close(struct qaic_device *qdev);
>>>> +void qaic_release_usr(struct qaic_device *qdev, struct qaic_user 
>>>> *usr);
>>>> +
>>>> +irqreturn_t dbc_irq_threaded_fn(int irq, void *data);
>>>> +irqreturn_t dbc_irq_handler(int irq, void *data);
>>>> +int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct 
>>>> qaic_user *usr);
>>>> +void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct 
>>>> qaic_user *usr);
>>>> +void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
>>>> +void release_dbc(struct qaic_device *qdev, u32 dbc_id);
>>>> +
>>>> +void wake_all_cntl(struct qaic_device *qdev);
>>>> +void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, 
>>>> bool exit_reset);
>>>> +
>>>> +struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev,
>>>> +                         struct dma_buf *dma_buf);
>>>> +
>>>> +int qaic_create_bo_ioctl(struct drm_device *dev, void *data,
>>>> +             struct drm_file *file_priv);
>>>> +int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data,
>>>> +               struct drm_file *file_priv);
>>>> +int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data,
>>>> +                   struct drm_file *file_priv);
>>>> +int qaic_execute_bo_ioctl(struct drm_device *dev, void *data,
>>>> +              struct drm_file *file_priv);
>>>> +int qaic_partial_execute_bo_ioctl(struct drm_device *dev, void *data,
>>>> +                  struct drm_file *file_priv);
>>>> +int qaic_wait_bo_ioctl(struct drm_device *dev, void *data,
>>>> +               struct drm_file *file_priv);
>>>> +int qaic_test_print_bo_ioctl(struct drm_device *dev, void *data,
>>>> +                 struct drm_file *file_priv);
>>>> +int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data,
>>>> +                 struct drm_file *file_priv);
>>>
>>> You don't need to break these lines. You can use up to 100 columns in 
>>> the whole driver.
>>> It will be more readable and checkpatch won't complain.
>>
>> Some of this predates the 100 column change.  Checkpatch already 
>> complains about the uapi file.
>>
>> Will try to fix here.
>>
>>>> +void irq_polling_work(struct work_struct *work);
>>>> +
>>>> +#endif /* QAICINTERNAL_H_ */
>>>> diff --git a/drivers/accel/qaic/qaic_drv.c 
>>>> b/drivers/accel/qaic/qaic_drv.c
>>>> new file mode 100644
>>>> index 0000000..602a784
>>>> --- /dev/null
>>>> +++ b/drivers/accel/qaic/qaic_drv.c
>>>> @@ -0,0 +1,771 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +/* Copyright (c) 2019-2021, The Linux Foundation. All rights 
>>>> reserved. */
>>>> +/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All 
>>>> rights reserved. */
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
>>>> +#include <linux/sched.h>
>>>
>>> Is <linux/sched.h> used here?
>>> Feels like there are couple other unused includes in this file.
>>
>> Actually I think that can be removed now.  Will check.
>> The other ones look sane to me.  Are there specific ones you question?
>>
>>>
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
>>>> +
>>>> +static unsigned int datapath_polling;
>>>> +module_param(datapath_polling, uint, 0400);
>>>> +bool poll_datapath;
>>>> +
>>>> +static u16 cntl_major = 5;
>>>> +static u16 cntl_minor;/* 0 */
>>>
>>> Missing space before the comment.
>>> And also you could convert both vars to macros as they are constants.
>>
>> Sure
>>
>>>> +static bool link_up;
>>>> +static DEFINE_IDA(qaic_usrs);
>>>> +
>>>> +static int qaic_create_drm_device(struct qaic_device *qdev, s32 
>>>> partition_id,
>>>> +                  struct qaic_user *owner);
>>>> +static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 
>>>> partition_id,
>>>> +                    struct qaic_user *owner);
>>>> +
>>>> +static void free_usr(struct kref *kref)
>>>> +{
>>>> +    struct qaic_user *usr = container_of(kref, struct qaic_user, 
>>>> ref_count);
>>>> +
>>>> +    cleanup_srcu_struct(&usr->qddev_lock);
>>>> +    ida_free(&qaic_usrs, usr->handle);
>>>> +    kfree(usr);
>>>> +}
>>>> +
>>>> +static int qaic_open(struct drm_device *dev, struct drm_file *file)
>>>> +{
>>>> +    struct qaic_drm_device *qddev = dev->dev_private;
>>>> +    struct qaic_device *qdev = qddev->qdev;
>>>> +    struct qaic_user *usr;
>>>> +    int rcu_id;
>>>> +    int ret;
>>>> +
>>>> +    rcu_id = srcu_read_lock(&qdev->dev_lock);
>>>> +    if (qdev->in_reset) {
>>>> +        srcu_read_unlock(&qdev->dev_lock, rcu_id);
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    usr = kmalloc(sizeof(*usr), GFP_KERNEL);
>>>> +    if (!usr) {
>>>> +        srcu_read_unlock(&qdev->dev_lock, rcu_id);
>>>> +        return -ENOMEM;
>>>> +    }
>>>> +
>>>> +    usr->handle = ida_alloc(&qaic_usrs, GFP_KERNEL);
>>>> +    if (usr->handle < 0) {
>>>> +        srcu_read_unlock(&qdev->dev_lock, rcu_id);
>>>> +        kfree(usr);
>>>> +        return usr->handle;
> 
> hi, use after free here

Nice catch.  Thanks.  Also noting the other things you mentioned.

> 
>>>> +    }
>>>> +    usr->qddev = qddev;
>>>> +    atomic_set(&usr->chunk_id, 0);
>>>> +    init_srcu_struct(&usr->qddev_lock);
>>>> +    kref_init(&usr->ref_count);
>>>> +
>>>> +    ret = mutex_lock_interruptible(&qddev->users_mutex);
>>>> +    if (ret) {
>>>> +        cleanup_srcu_struct(&usr->qddev_lock);
>>>> +        kfree(usr);
>>>> +        srcu_read_unlock(&qdev->dev_lock, rcu_id);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    list_add(&usr->node, &qddev->users);
>>>> +    mutex_unlock(&qddev->users_mutex);
>>>> +
>>>> +    file->driver_priv = usr;
>>>> +
>>>> +    srcu_read_unlock(&qdev->dev_lock, rcu_id);
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void qaic_postclose(struct drm_device *dev, struct drm_file 
>>>> *file)
>>>> +{
>>>> +    struct qaic_user *usr = file->driver_priv;
>>>> +    struct qaic_drm_device *qddev;
>>>> +    struct qaic_device *qdev;
>>>> +    int qdev_rcu_id;
>>>> +    int usr_rcu_id;
>>>> +    int i;
>>>> +
>>>> +    qddev = usr->qddev;
>>>> +    usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
>>>> +    if (qddev) {
>>>> +        qdev = qddev->qdev;
>>>> +        qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
>>>> +        if (!qdev->in_reset) {
>>>> +            qaic_release_usr(qdev, usr);
>>>> +            for (i = 0; i < qdev->num_dbc; ++i)
>>>> +                if (qdev->dbc[i].usr &&
>>>> +                    qdev->dbc[i].usr->handle == usr->handle)
>>>> +                    release_dbc(qdev, i);
>>>> +
>>>> +            /* Remove child devices */
>>>> +            if (qddev->partition_id == QAIC_NO_PARTITION)
>>>> +                qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION, usr);
>>>> +        }
>>>> +        srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
>>>> +
>>>> +        mutex_lock(&qddev->users_mutex);
>>>> +        if (!list_empty(&usr->node))
>>>> +            list_del_init(&usr->node);
>>>> +        mutex_unlock(&qddev->users_mutex);
>>>> +    }
>>>> +
>>>> +    srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
>>>> +    kref_put(&usr->ref_count, free_usr);
>>>> +
>>>> +    file->driver_priv = NULL;
>>>> +}
>>>> +
>>>> +static int qaic_part_dev_ioctl(struct drm_device *dev, void *data,
>>>> +                   struct drm_file *file_priv)
>>>> +{
>>>> +    struct qaic_device *qdev;
>>>> +    struct qaic_user *usr;
>>>> +    u32 partition_id;
>>>> +    int qdev_rcu_id;
>>>> +    int usr_rcu_id;
>>>> +    int ret = 0;
>>>> +    u16 remove;
>>>> +
>>>> +    usr = file_priv->driver_priv;
>>>> +    if (!usr)
>>>> +        return -EINVAL;
>>>> +
>>>> +    usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
>>>> +    if (!usr->qddev) {
>>>> +        srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    qdev = usr->qddev->qdev;
>>>> +    if (!qdev) {
>>>> +        srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
>>>> +    if (qdev->in_reset) {
>>>> +        ret = -ENODEV;
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    /* This IOCTL is only supported for base devices. */
>>>> +    if (usr->qddev->partition_id != QAIC_NO_PARTITION) {
>>>> +        ret = -ENOTTY;
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    ret = qaic_data_get_reservation(qdev, usr, data, &partition_id,
>>>> +                    &remove);
>>>> +    if (ret)
>>>> +        goto out;
>>>> +
>>>> +    if (remove == 1)
>>>> +        qaic_destroy_drm_device(qdev, partition_id, usr);
>>>> +    else
>>>> +        ret = qaic_create_drm_device(qdev, partition_id, usr);
>>>> +
>>>> +out:
>>>> +    srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
>>>> +    srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +DEFINE_DRM_ACCEL_FOPS(qaic_accel_fops);
>>>> +
>>>> +static const struct drm_ioctl_desc qaic_drm_ioctls[] = {
>>>> +    DRM_IOCTL_DEF_DRV(QAIC_MANAGE, qaic_manage_ioctl, 
>>>> DRM_RENDER_ALLOW),
>>>> +    DRM_IOCTL_DEF_DRV(QAIC_CREATE_BO, qaic_create_bo_ioctl, 
>>>> DRM_RENDER_ALLOW),
>>>> +    DRM_IOCTL_DEF_DRV(QAIC_MMAP_BO, qaic_mmap_bo_ioctl, 
>>>> DRM_RENDER_ALLOW),
>>>> +    DRM_IOCTL_DEF_DRV(QAIC_ATTACH_SLICE_BO, 
>>>> qaic_attach_slice_bo_ioctl, DRM_RENDER_ALLOW),
>>>> +    DRM_IOCTL_DEF_DRV(QAIC_EXECUTE_BO, qaic_execute_bo_ioctl, 
>>>> DRM_RENDER_ALLOW),
>>>> +    DRM_IOCTL_DEF_DRV(QAIC_PARTIAL_EXECUTE_BO, 
>>>> qaic_partial_execute_bo_ioctl, DRM_RENDER_ALLOW),
>>>> +    DRM_IOCTL_DEF_DRV(QAIC_WAIT_BO, qaic_wait_bo_ioctl, 
>>>> DRM_RENDER_ALLOW),
>>>> +    DRM_IOCTL_DEF_DRV(QAIC_PERF_STATS_BO, qaic_perf_stats_bo_ioctl, 
>>>> DRM_RENDER_ALLOW),
>>>> +    DRM_IOCTL_DEF_DRV(QAIC_PART_DEV, qaic_part_dev_ioctl, 
>>>> DRM_RENDER_ALLOW),
>>>> +};
>>>> +
>>>> +static const struct drm_driver qaic_accel_driver = {
>>>> +    .driver_features    = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
>>>> +
>>>> +    .name            = QAIC_NAME,
>>>> +    .desc            = QAIC_DESC,
>>>> +    .date            = "20190618",
>>>> +
>>>> +    .fops            = &qaic_accel_fops,
>>>> +    .open            = qaic_open,
>>>> +    .postclose        = qaic_postclose,
>>>> +
>>>> +    .ioctls            = qaic_drm_ioctls,
>>>> +    .num_ioctls        = ARRAY_SIZE(qaic_drm_ioctls),
>>>> +    .prime_fd_to_handle    = drm_gem_prime_fd_to_handle,
>>>> +    .gem_prime_import    = qaic_gem_prime_import,
>>>> +};
>>>> +
>>>> +static int qaic_create_drm_device(struct qaic_device *qdev, s32 
>>>> partition_id,
>>>> +                  struct qaic_user *owner)
>>>> +{
>>>> +    struct qaic_drm_device *qddev;
>>>> +    struct drm_device *ddev;
>>>> +    struct device *pdev;
>>>> +    int ret;
>>>> +
>>>> +    /*
>>>> +     * Partition id QAIC_NO_PARTITION indicates that the device was 
>>>> created
>>>> +     * on mhi_probe and id > QAIC_NO_PARTITION indicates a partition
>>>> +     * created using IOCTL. So, pdev for primary device is the pci 
>>>> dev and
>>>> +     * the parent for partition dev is the primary device.
>>>> +     */
>>>> +    if (partition_id == QAIC_NO_PARTITION)
>>>> +        pdev = &qdev->pdev->dev;
>>>> +    else
>>>> +        pdev = qdev->base_dev->ddev->dev;
>>>> +
>>>> +    qddev = kzalloc(sizeof(*qddev), GFP_KERNEL);
>>>> +    if (!qddev) {
>>>> +        ret = -ENOMEM;
>>>> +        goto qddev_fail;
> 
> qddev_fail label is just before returning so better return here directly
> 
>>>> +    }
>>>> +
>>>> +    ddev = drm_dev_alloc(&qaic_accel_driver, pdev);
>>>> +    if (IS_ERR(ddev)) {
>>>> +        ret = PTR_ERR(ddev);
>>>> +        goto ddev_fail;
>>>> +    }
>>>> +
>>>> +    ddev->dev_private = qddev;
>>>> +    qddev->ddev = ddev;
>>>> +
>>>> +    if (partition_id == QAIC_NO_PARTITION)
>>>> +        qdev->base_dev = qddev;
>>>> +    qddev->qdev = qdev;
>>>> +    qddev->partition_id = partition_id;
>>>> +    qddev->owner = owner;
>>>> +    INIT_LIST_HEAD(&qddev->users);
>>>> +    mutex_init(&qddev->users_mutex);
>>>> +
>>>> +    mutex_lock(&qdev->qaic_drm_devices_mutex);
>>>> +    list_add(&qddev->node, &qdev->qaic_drm_devices);
>>>> +    mutex_unlock(&qdev->qaic_drm_devices_mutex);
>>>> +
>>>> +    ret = drm_dev_register(ddev, 0);
>>>> +    if (ret) {
>>>> +        pci_dbg(qdev->pdev, "%s: drm_dev_register failed %d\n", 
>>>> __func__, ret);
>>>> +        goto drm_reg_fail;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +
>>>> +drm_reg_fail:
>>>> +    mutex_destroy(&qddev->users_mutex);
>>>> +    mutex_lock(&qdev->qaic_drm_devices_mutex);
>>>> +    list_del(&qddev->node);
>>>> +    mutex_unlock(&qdev->qaic_drm_devices_mutex);
>>>> +    if (partition_id == QAIC_NO_PARTITION)
>>>> +        qdev->base_dev = NULL;
>>>> +    drm_dev_put(ddev);
>>>> +ddev_fail:
>>>> +    kfree(qddev);
>>>> +qddev_fail:
> 
> no point for this label
> 
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 
>>>> partition_id,
>>>> +                    struct qaic_user *owner)
>>>> +{
>>>> +    struct qaic_drm_device *qddev;
>>>> +    struct qaic_drm_device *q;
>>>> +    struct qaic_user *usr;
>>>> +
>>>> +    list_for_each_entry_safe(qddev, q, &qdev->qaic_drm_devices, 
>>>> node) {
>>>> +        /*
>>>> +         * Skip devices in case we just want to remove devices
>>>> +         * specific to a owner or partition id.
>>>> +         *
>>>> +         * owner    partition_id    notes
>>>> +         * ----------------------------------
>>>> +         * NULL        NO_PARTITION    delete base + all derived (qdev
>>>> +         *                reset)
>>>> +         * !NULL    NO_PARTITION    delete derived devs created by
>>>> +         *                owner.
>>>> +         * !NULL    >NO_PARTITION    delete derived dev identified by
>>>> +         *                the partition id and created by
>>>> +         *                owner
>>>> +         * NULL        >NO_PARTITION    invalid (no-op)
>>>> +         *
>>>> +         * if partition_id is any value < QAIC_NO_PARTITION this 
>>>> will be
>>>> +         * a no-op.
>>>> +         */
>>>> +        if (owner && owner != qddev->owner)
>>>> +            continue;
>>>> +
>>>> +        if (partition_id != QAIC_NO_PARTITION &&
>>>> +            partition_id != qddev->partition_id && !owner)
>>>> +            continue;
>>>> +
>>>> +        /*
>>>> +         * Existing users get unresolvable errors till they close FDs.
>>>> +         * Need to sync carefully with users calling close().  The
>>>> +         * list of users can be modified elsewhere when the lock isn't
>>>> +         * held here, but the sync'ing the srcu with the mutex held
>>>> +         * could deadlock.  Grab the mutex so that the list will be
>>>> +         * unmodified.  The user we get will exist as long as the
>>>> +         * lock is held.  Signal that the qcdev is going away, and
>>>> +         * grab a reference to the user so they don't go away for
>>>> +         * synchronize_srcu().  Then release the mutex to avoid
>>>> +         * deadlock and make sure the user has observed the signal.
>>>> +         * With the lock released, we cannot maintain any state of the
>>>> +         * user list.
>>>> +         */
>>>> +        mutex_lock(&qddev->users_mutex);
>>>> +        while (!list_empty(&qddev->users)) {
>>>> +            usr = list_first_entry(&qddev->users, struct qaic_user,
>>>> +                           node);
>>>> +            list_del_init(&usr->node);
>>>> +            kref_get(&usr->ref_count);
>>>> +            usr->qddev = NULL;
>>>> +            mutex_unlock(&qddev->users_mutex);
>>>> +            synchronize_srcu(&usr->qddev_lock);
>>>> +            kref_put(&usr->ref_count, free_usr);
>>>> +            mutex_lock(&qddev->users_mutex);
>>>> +        }
>>>> +        mutex_unlock(&qddev->users_mutex);
>>>> +
>>>> +        if (qddev->ddev) {
>>>> +            drm_dev_unregister(qddev->ddev);
>>>> +            drm_dev_put(qddev->ddev);
>>>> +        }
>>>> +
>>>> +        list_del(&qddev->node);
>>>> +        kfree(qddev);
>>>> +    }
>>>> +}
>>>> +
>>>> +static int qaic_mhi_probe(struct mhi_device *mhi_dev,
>>>> +              const struct mhi_device_id *id)
>>>> +{
>>>> +    struct qaic_device *qdev;
>>>> +    u16 major, minor;
>>>> +    int ret;
>>>> +
>>>> +    /*
>>>> +     * Invoking this function indicates that the control channel to 
>>>> the
>>>> +     * device is available.  We use that as a signal to indicate that
>>>> +     * the device side firmware has booted.  The device side firmware
>>>> +     * manages the device resources, so we need to communicate with it
>>>> +     * via the control channel in order to utilize the device.  
>>>> Therefore
>>>> +     * we wait until this signal to create the drm dev that 
>>>> userspace will
>>>> +     * use to control the device, because without the device side 
>>>> firmware,
>>>> +     * userspace can't do anything useful.
>>>> +     */
>>>> +
>>>> +    qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
>>>> +
>>>> +    qdev->in_reset = false;
>>>> +
>>>> +    dev_set_drvdata(&mhi_dev->dev, qdev);
>>>> +    qdev->cntl_ch = mhi_dev;
>>>> +
>>>> +    ret = qaic_control_open(qdev);
>>>> +    if (ret) {
>>>> +        pci_dbg(qdev->pdev, "%s: control_open failed %d\n", 
>>>> __func__, ret);
>>>> +        goto err;
>>>> +    }
>>>> +
>>>> +    ret = get_cntl_version(qdev, NULL, &major, &minor);
>>>> +    if (ret || major != cntl_major || minor > cntl_minor) {
>>>> +        pci_err(qdev->pdev, "%s: Control protocol version (%d.%d) 
>>>> not supported.  Supported version is (%d.%d). Ret: %d\n",
>>>> +            __func__, major, minor, cntl_major, cntl_minor, ret);
>>>> +        ret = -EINVAL;
>>>> +        goto close_control;
>>>> +    }
>>>> +
>>>> +    ret = qaic_create_drm_device(qdev, QAIC_NO_PARTITION, NULL);
>>>> +
>>>> +    return ret;
>>>> +
>>>> +close_control:
>>>> +    qaic_control_close(qdev);
>>>> +err:
> 
> same here, not sure there is a point to this label
> 
> Thanks,
> Dafna
> 
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static void qaic_mhi_remove(struct mhi_device *mhi_dev)
>>>> +{
>>>
>>> Add a comment here
>>
>> Presumably why this is an empty function?
>> Will do.
>>
>>>> +}
>>>> +
>>>> +static void qaic_notify_reset(struct qaic_device *qdev)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    qdev->in_reset = true;
>>>> +    /* wake up any waiters to avoid waiting for timeouts at sync */
>>>> +    wake_all_cntl(qdev);
>>>> +    for (i = 0; i < qdev->num_dbc; ++i)
>>>> +        wakeup_dbc(qdev, i);
>>>> +    synchronize_srcu(&qdev->dev_lock);
>>>> +}
>>>> +
>>>> +void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, 
>>>> bool exit_reset)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    qaic_notify_reset(qdev);
>>>> +
>>>> +    /* remove drmdevs to prevent new users from coming in */
>>>> +    if (qdev->base_dev)
>>>> +        qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION, NULL);
>>>> +
>>>> +    /* start tearing things down */
>>>> +    for (i = 0; i < qdev->num_dbc; ++i)
>>>> +        release_dbc(qdev, i);
>>>> +
>>>> +    if (exit_reset)
>>>> +        qdev->in_reset = false;
>>>> +}
>>>> +
>>>> +static int qaic_pci_probe(struct pci_dev *pdev,
>>>> +              const struct pci_device_id *id)
>>>
>>> Please try to simplify this function. Maybe move irq init to separate 
>>> function.
>>> It will be more readable and there will less of a error handling 
>>> spaghetti at the bottom.
>>
>> I guess I tend towards not breaking something up if there is not reuse 
>> elsewhere, but I think I see your point.  Will have a look.
>>
>>>
>>>> +{
>>>> +    int ret;
>>>> +    int i;
>>>> +    int mhi_irq;
>>>> +    struct qaic_device *qdev;
>>>> +
>>>> +    qdev = devm_kzalloc(&pdev->dev, sizeof(*qdev), GFP_KERNEL);
>>>> +    if (!qdev)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    if (id->device == PCI_DEV_AIC100) {
>>>> +        qdev->num_dbc = 16;
>>>> +        qdev->dbc = devm_kcalloc(&pdev->dev, qdev->num_dbc, 
>>>> sizeof(*qdev->dbc),
>>>> +                     GFP_KERNEL);
>>>> +        if (!qdev->dbc)
>>>> +            return -ENOMEM;
>>>> +    }
>>>> +
>>>> +    qdev->cntl_wq = alloc_workqueue("qaic_cntl", WQ_UNBOUND, 0);
>>>> +    if (!qdev->cntl_wq) {
>>>> +        ret = -ENOMEM;
>>>> +        goto wq_fail;
>>>> +    }
>>>> +    pci_set_drvdata(pdev, qdev);
>>>> +    qdev->pdev = pdev;
>>>> +    mutex_init(&qdev->cntl_mutex);
>>>> +    INIT_LIST_HEAD(&qdev->cntl_xfer_list);
>>>> +    init_srcu_struct(&qdev->dev_lock);
>>>> +    INIT_LIST_HEAD(&qdev->qaic_drm_devices);
>>>> +    mutex_init(&qdev->qaic_drm_devices_mutex);
>>>> +    for (i = 0; i < qdev->num_dbc; ++i) {
>>>> +        spin_lock_init(&qdev->dbc[i].xfer_lock);
>>>> +        qdev->dbc[i].qdev = qdev;
>>>> +        qdev->dbc[i].id = i;
>>>> +        INIT_LIST_HEAD(&qdev->dbc[i].xfer_list);
>>>> +        init_srcu_struct(&qdev->dbc[i].ch_lock);
>>>> +        init_waitqueue_head(&qdev->dbc[i].dbc_release);
>>>> +        INIT_LIST_HEAD(&qdev->dbc[i].bo_lists);
>>>> +    }
>>>> +
>>>> +    qdev->bars = pci_select_bars(pdev, IORESOURCE_MEM);
>>>> +
>>>> +    /* make sure the device has the expected BARs */
>>>> +    if (qdev->bars != (BIT(0) | BIT(2) | BIT(4))) {
>>>> +        pci_dbg(pdev, "%s: expected BARs 0, 2, and 4 not found in 
>>>> device.  Found 0x%x\n",
>>>> +            __func__, qdev->bars);
>>>> +        ret = -EINVAL;
>>>> +        goto bar_fail;
>>>> +    }
>>>> +
>>>> +    ret = pci_enable_device(pdev);
>>>> +    if (ret)
>>>> +        goto enable_fail;
>>>> +
>>>> +    ret = pci_request_selected_regions(pdev, qdev->bars, "aic100");
>>>> +    if (ret)
>>>> +        goto request_regions_fail;
>>>> +
>>>> +    pci_set_master(pdev);
>>>> +
>>>> +    ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
>>>> +    if (ret)
>>>> +        goto dma_mask_fail;
>>>> +    ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
>>>> +    if (ret)
>>>> +        goto dma_mask_fail;
>>>> +    ret = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>>>> +    if (ret)
>>>> +        goto dma_mask_fail;
>>>> +
>>>> +    qdev->bar_0 = pci_ioremap_bar(pdev, 0);
>>>> +    if (!qdev->bar_0) {
>>>> +        ret = -ENOMEM;
>>>> +        goto ioremap_0_fail;
>>>> +    }
>>>> +
>>>> +    qdev->bar_2 = pci_ioremap_bar(pdev, 2);
>>>> +    if (!qdev->bar_2) {
>>>> +        ret = -ENOMEM;
>>>> +        goto ioremap_2_fail;
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < qdev->num_dbc; ++i)
>>>> +        qdev->dbc[i].dbc_base = qdev->bar_2 + QAIC_DBC_OFF(i);
>>>> +
>>>> +    ret = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
>>>> +    if (ret < 0)
>>>> +        goto alloc_irq_fail;
>>>> +
>>>> +    if (ret < 32) {
>>>> +        pci_err(pdev, "%s: Requested 32 MSIs.  Obtained %d MSIs 
>>>> which is less than the 32 required.\n",
>>>> +            __func__, ret);
>>>> +        ret = -ENODEV;
>>>> +        goto invalid_msi_config;
>>>> +    }
>>>> +
>>>> +    mhi_irq = pci_irq_vector(pdev, 0);
>>>> +    if (mhi_irq < 0) {
>>>> +        ret = mhi_irq;
>>>> +        goto get_mhi_irq_fail;
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < qdev->num_dbc; ++i) {
>>>> +        ret = devm_request_threaded_irq(&pdev->dev,
>>>> +                        pci_irq_vector(pdev, i + 1),
>>>> +                        dbc_irq_handler,
>>>> +                        dbc_irq_threaded_fn,
>>>> +                        IRQF_SHARED,
>>>> +                        "qaic_dbc",
>>>> +                        &qdev->dbc[i]);
>>>> +        if (ret)
>>>> +            goto get_dbc_irq_failed;
>>>> +
>>>> +        if (poll_datapath) {
>>>> +            qdev->dbc[i].irq = pci_irq_vector(pdev, i + 1);
>>>> +            disable_irq_nosync(qdev->dbc[i].irq);
>>>> +            INIT_WORK(&qdev->dbc[i].poll_work, irq_polling_work);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    qdev->mhi_cntl = qaic_mhi_register_controller(pdev, 
>>>> qdev->bar_0, mhi_irq);
>>>> +    if (IS_ERR(qdev->mhi_cntl)) {
>>>> +        ret = PTR_ERR(qdev->mhi_cntl);
>>>> +        goto mhi_register_fail;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +
>>>> +mhi_register_fail:
>>>> +get_dbc_irq_failed:
>>>
>>> I don't think that duplicated goto statements are allowed by the 
>>> coding style.
>>> These should be rather named something like err_free_irq.
>>> See 
>>> https://www.kernel.org/doc/html/v4.10/process/coding-style.html#centralized-exiting-of-functions 
>>>
>>
>> I took another look at that link, and I do not beleive it prohibits 
>> duplicated goto labels, but they probably could be renamed and 
>> simplified as you indicate.  Will have a look at that.
>>
>>>
>>>> +    for (i = 0; i < qdev->num_dbc; ++i)
>>>> +        devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
>>>> +                  &qdev->dbc[i]);
>>>> +get_mhi_irq_fail:
>>>> +invalid_msi_config:
>>>> +    pci_free_irq_vectors(pdev);
>>>> +alloc_irq_fail:
>>>> +    iounmap(qdev->bar_2);
>>>> +ioremap_2_fail:
>>>> +    iounmap(qdev->bar_0);
>>>> +ioremap_0_fail:
>>>> +dma_mask_fail:
>>>> +    pci_clear_master(pdev);
>>>> +    pci_release_selected_regions(pdev, qdev->bars);
>>>> +request_regions_fail:
>>>> +    pci_disable_device(pdev);
>>>> +enable_fail:
>>>> +    pci_set_drvdata(pdev, NULL);
>>>> +bar_fail:
>>>> +    for (i = 0; i < qdev->num_dbc; ++i)
>>>> +        cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
>>>> +    cleanup_srcu_struct(&qdev->dev_lock);
>>>> +    destroy_workqueue(qdev->cntl_wq);
>>>> +wq_fail:
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static void qaic_pci_remove(struct pci_dev *pdev)
>>>> +{
>>>> +    struct qaic_device *qdev = pci_get_drvdata(pdev);
>>>> +    int i;
>>>> +
>>>> +    if (!qdev)
>>>> +        return;
>>>> +
>>>> +    qaic_dev_reset_clean_local_state(qdev, false);
>>>> +    qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
>>>> +    for (i = 0; i < qdev->num_dbc; ++i) {
>>>> +        devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
>>>> +                  &qdev->dbc[i]);
>>>> +        cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
>>>> +    }
>>>> +    destroy_workqueue(qdev->cntl_wq);
>>>> +    pci_free_irq_vectors(pdev);
>>>> +    iounmap(qdev->bar_0);
>>>> +    pci_clear_master(pdev);
>>>> +    pci_release_selected_regions(pdev, qdev->bars);
>>>> +    pci_disable_device(pdev);
>>>> +    pci_set_drvdata(pdev, NULL);
>>>> +}
>>>> +
>>>> +static void qaic_pci_shutdown(struct pci_dev *pdev)
>>>> +{
>>>> +    /* see qaic_exit for what link_up is doing */
>>>> +    link_up = true;
>>>> +    qaic_pci_remove(pdev);
>>>> +}
>>>> +
>>>> +static pci_ers_result_t qaic_pci_error_detected(struct pci_dev *pdev,
>>>> +                        pci_channel_state_t error)
>>>> +{
>>>> +    return PCI_ERS_RESULT_NEED_RESET;
>>>> +}
>>>> +
>>>> +static void qaic_pci_reset_prepare(struct pci_dev *pdev)
>>>> +{
>>>> +    struct qaic_device *qdev = pci_get_drvdata(pdev);
>>>> +
>>>> +    qaic_notify_reset(qdev);
>>>> +    qaic_mhi_start_reset(qdev->mhi_cntl);
>>>> +    qaic_dev_reset_clean_local_state(qdev, false);
>>>> +}
>>>> +
>>>> +static void qaic_pci_reset_done(struct pci_dev *pdev)
>>>> +{
>>>> +    struct qaic_device *qdev = pci_get_drvdata(pdev);
>>>> +
>>>> +    qdev->in_reset = false;
>>>> +    qaic_mhi_reset_done(qdev->mhi_cntl);
>>>> +}
>>>> +
>>>> +static const struct mhi_device_id qaic_mhi_match_table[] = {
>>>> +    { .chan = "QAIC_CONTROL", },
>>>> +    {},
>>>> +};
>>>> +
>>>> +static struct mhi_driver qaic_mhi_driver = {
>>>> +    .id_table = qaic_mhi_match_table,
>>>> +    .remove = qaic_mhi_remove,
>>>> +    .probe = qaic_mhi_probe,
>>>> +    .ul_xfer_cb = qaic_mhi_ul_xfer_cb,
>>>> +    .dl_xfer_cb = qaic_mhi_dl_xfer_cb,
>>>> +    .driver = {
>>>> +        .name = "qaic_mhi",
>>>> +    },
>>>> +};
>>>> +
>>>> +static const struct pci_device_id qaic_ids[] = {
>>>> +    { PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
>>>> +    { }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(pci, qaic_ids);
>>>> +
>>>> +static const struct pci_error_handlers qaic_pci_err_handler = {
>>>> +    .error_detected = qaic_pci_error_detected,
>>>> +    .reset_prepare = qaic_pci_reset_prepare,
>>>> +    .reset_done = qaic_pci_reset_done,
>>>> +};
>>>> +
>>>> +static struct pci_driver qaic_pci_driver = {
>>>> +    .name = QAIC_NAME,
>>>> +    .id_table = qaic_ids,
>>>> +    .probe = qaic_pci_probe,
>>>> +    .remove = qaic_pci_remove,
>>>> +    .shutdown = qaic_pci_shutdown,
>>>> +    .err_handler = &qaic_pci_err_handler,
>>>> +};
>>>> +
>>>> +static int __init qaic_init(void)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    if (datapath_polling)
>>>> +        poll_datapath = true;
>>>> +
>>>> +    ret = mhi_driver_register(&qaic_mhi_driver);
>>>> +    if (ret) {
>>>> +        pr_debug("qaic: mhi_driver_register failed %d\n", ret);
>>>> +        goto free_class;
>>>> +    }
>>>> +
>>>> +    ret = pci_register_driver(&qaic_pci_driver);
>>>> +    if (ret) {
>>>> +        pr_debug("qaic: pci_register_driver failed %d\n", ret);
>>>> +        goto free_mhi;
>>>> +    }
>>>> +
>>>> +    ret = mhi_qaic_ctrl_init();
>>>> +    if (ret) {
>>>> +        pr_debug("qaic: mhi_qaic_ctrl_init failed %d\n", ret);
>>>> +        goto free_pci;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +
>>>> +free_pci:
>>>> +    pci_unregister_driver(&qaic_pci_driver);
>>>> +free_mhi:
>>>> +    mhi_driver_unregister(&qaic_mhi_driver);
>>>> +free_class:
>>>
>>> This label doesn't free anything. It should be renamed.
>>
>> Doh.  Holdover from a previous version.  It does need to be renamed.
>>
>>>
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static void __exit qaic_exit(void)
>>>> +{
>>>> +    /*
>>>> +     * We assume that qaic_pci_remove() is called due to a hotplug 
>>>> event
>>>> +     * which would mean that the link is down, and thus
>>>> +     * qaic_mhi_free_controller() should not try to access the 
>>>> device during
>>>> +     * cleanup.
>>>> +     * We call pci_unregister_driver() below, which also triggers
>>>> +     * qaic_pci_remove(), but since this is module exit, we expect 
>>>> the link
>>>> +     * to the device to be up, in which case 
>>>> qaic_mhi_free_controller()
>>>> +     * should try to access the device during cleanup to put the 
>>>> device in
>>>> +     * a sane state.
>>>> +     * For that reason, we set link_up here to let 
>>>> qaic_mhi_free_controller
>>>> +     * know the expected link state.  Since the module is going to be
>>>> +     * removed at the end of this, we don't need to worry about
>>>> +     * reinitializing the link_up state after the cleanup is done.
>>>> +     */
>>>> +    link_up = true;
>>>
>>> Maybe you could just use pdev->current_state instead of link_up?
>>
>> Maybe.  Will have a look at that.
>>
>>>
>>>> +    mhi_qaic_ctrl_deinit();
>>>> +    pci_unregister_driver(&qaic_pci_driver);
>>>> +    mhi_driver_unregister(&qaic_mhi_driver);
>>>> +}
>>>> +
>>>> +module_init(qaic_init);
>>>> +module_exit(qaic_exit);
>>>> +
>>>> +MODULE_AUTHOR(QAIC_DESC " Kernel Driver Team");
>>>> +MODULE_DESCRIPTION(QAIC_DESC " Accel Driver");
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/include/uapi/drm/qaic_accel.h 
>>>> b/include/uapi/drm/qaic_accel.h
>>>> new file mode 100644
>>>> index 0000000..d5fa6f5
>>>> --- /dev/null
>>>> +++ b/include/uapi/drm/qaic_accel.h
>>>> @@ -0,0 +1,283 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
>>>> + *
>>>> + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
>>>> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All 
>>>> rights reserved.
>>>> + */
>>>> +
>>>> +#ifndef QAIC_ACCEL_H_
>>>> +#define QAIC_ACCEL_H_
>>>> +
>>>> +#include <linux/ioctl.h>
>>>> +#include <linux/types.h>
>>>
>>> These two headers should not be needed here.
>>
>> Fair enough.  Listed out of paranoia since they define things used in 
>> this header.
>>
>>>
>>>> +#include "drm.h"
>>>> +
>>>> +#if defined(__CPLUSPLUS)
>>>
>>> Use lowercase here: __cplusplus
>>
>> Doh.  Not sure why uppercase was used.  The referenced examples sure 
>> didn't have that.
>>
>>>
>>>> +extern "C" {
>>>> +#endif
>>>> +
>>>> +#define QAIC_MANAGE_MAX_MSG_LENGTH SZ_4K    /**<
>>>> +                          * The length(4K) includes len and
>>>> +                          * count fields of qaic_manage_msg
>>>> +                          */
>>>
>>> I guess these are doxygen style commands but you should be using 
>>> kernel-doc here.
>>> See https://docs.kernel.org/doc-guide/kernel-doc.html.
>>> This can be used to verify the header:
>>> $ scripts/kernel-doc -v -none include/uapi/drm/qaic_accel.h
>>
>> include/uapi/drm/drm.h was used as the example for these, and thus it 
>> was assumed that was the DRM style.
>>
>> I'm not convinced kernel-doc is applicable to all of these.  Will review.
>>
>>>
>>>> +
>>>> +enum qaic_sem_flags {
>>>
>>> Is there any specific reason for enums if all values are explicitly 
>>> given?
>>
>> It is a style pulled from elsewhere.  I can remove the enums.
>>
>>>
>>>> +    SEM_INSYNCFENCE =    0x1,
>>>
>>> All these enums/defines end up in a global user space namespace.
>>> I would advise to prefix everything with QAIC_ or DRM_QAIC_ (e.g. 
>>> QAIC_SEM_INSYNCFENCE)
>>> to avoid conflicts with other drivers or user space libs.
>>
>> Good point.  Will do.
>>
>>>
>>>> +    SEM_OUTSYNCFENCE =    0x2,
>>>> +};
>>>> +
>>>> +enum qaic_sem_cmd {
>>>> +    SEM_NOP =        0,
>>>> +    SEM_INIT =        1,
>>>> +    SEM_INC =        2,
>>>> +    SEM_DEC =        3,
>>>> +    SEM_WAIT_EQUAL =    4,
>>>> +    SEM_WAIT_GT_EQ =    5, /**< Greater than or equal */
>>>> +    SEM_WAIT_GT_0 =        6, /**< Greater than 0 */
>>>> +};
>>>> +
>>>> +enum qaic_manage_transaction_type {
>>>> +    TRANS_UNDEFINED =            0,
>>>> +    TRANS_PASSTHROUGH_FROM_USR =        1,
>>>> +    TRANS_PASSTHROUGH_TO_USR =        2,
>>>> +    TRANS_PASSTHROUGH_FROM_DEV =        3,
>>>> +    TRANS_PASSTHROUGH_TO_DEV =        4,
>>>> +    TRANS_DMA_XFER_FROM_USR =        5,
>>>> +    TRANS_DMA_XFER_TO_DEV =            6,
>>>> +    TRANS_ACTIVATE_FROM_USR =        7,
>>>> +    TRANS_ACTIVATE_FROM_DEV =        8,
>>>> +    TRANS_ACTIVATE_TO_DEV =            9,
>>>> +    TRANS_DEACTIVATE_FROM_USR =        10,
>>>> +    TRANS_DEACTIVATE_FROM_DEV =        11,
>>>> +    TRANS_STATUS_FROM_USR =            12,
>>>> +    TRANS_STATUS_TO_USR =            13,
>>>> +    TRANS_STATUS_FROM_DEV =            14,
>>>> +    TRANS_STATUS_TO_DEV =            15,
>>>> +    TRANS_TERMINATE_FROM_DEV =        16,
>>>> +    TRANS_TERMINATE_TO_DEV =        17,
>>>> +    TRANS_DMA_XFER_CONT =            18,
>>>> +    TRANS_VALIDATE_PARTITION_FROM_DEV =    19,
>>>> +    TRANS_VALIDATE_PARTITION_TO_DEV =    20,
>>>> +    TRANS_MAX =                21
>>>> +};
>>>> +
>>>> +struct qaic_manage_trans_hdr {
>>>> +    __u32 type;    /**< in, value from enum manage_transaction_type */
>>>> +    __u32 len;    /**< in, length of this transaction, including 
>>>> the header */
>>>> +};
>>>> +
>>>> +struct qaic_manage_trans_passthrough {
>>>> +    struct qaic_manage_trans_hdr hdr;
>>>> +    __u8 data[];    /**< in, userspace must encode in little endian */
>>>> +};
>>>> +
>>>> +struct qaic_manage_trans_dma_xfer {
>>>> +    struct qaic_manage_trans_hdr hdr;
>>>> +    __u32 tag;    /**< in, device specific */
>>>> +    __u32 count;    /**< in */
>>>> +    __u64 addr;    /**< in, address of the data to transferred via 
>>>> DMA */
>>>> +    __u64 size;    /**< in, length of the data to transferred via 
>>>> DMA */
>>>> +};
>>>> +
>>>> +struct qaic_manage_trans_activate_to_dev {
>>>> +    struct qaic_manage_trans_hdr hdr;
>>>> +    __u32 queue_size;    /**<
>>>> +                  * in, number of elements in DBC request
>>>> +                  * and respose queue
>>>> +                  */
>>>> +    __u32 eventfd;        /**< in */
>>>> +    __u32 options;        /**< in, device specific */
>>>> +    __u32 pad;        /**< pad must be 0 */
>>>> +};
>>>> +
>>>> +struct qaic_manage_trans_activate_from_dev {
>>>> +    struct qaic_manage_trans_hdr hdr;
>>>> +    __u32 status;    /**< out, status of activate transaction */
>>>> +    __u32 dbc_id;    /**< out, Identifier of assigned DMA Bridge 
>>>> channel */
>>>> +    __u64 options;    /**< out */
>>>> +};
>>>> +
>>>> +struct qaic_manage_trans_deactivate {
>>>> +    struct qaic_manage_trans_hdr hdr;
>>>> +    __u32 dbc_id;    /**< in, Identifier of assigned DMA Bridge 
>>>> channel */
>>>> +    __u32 pad;    /**< pad must be 0 */
>>>> +};
>>>> +
>>>> +struct qaic_manage_trans_status_to_dev {
>>>> +    struct qaic_manage_trans_hdr hdr;
>>>> +};
>>>> +
>>>> +struct qaic_manage_trans_status_from_dev {
>>>> +    struct qaic_manage_trans_hdr hdr;
>>>> +    __u16 major;    /**< out, major vesrion of NNC protocol used by 
>>>> device */
>>>> +    __u16 minor;    /**< out, minor vesrion of NNC protocol used by 
>>>> device */
>>>
>>> vesrion -> version
>>
>> Will fix.
>>
>>>
>>>> +    __u32 status;    /**< out, status of query transaction  */
>>>> +    __u64 status_flags;    /**<
>>>> +                  * out
>>>> +                  * 0    : If set then device has CRC check enabled
>>>> +                  * 1:63 : Unused
>>>> +                  */
>>>> +};
>>>> +
>>>> +struct qaic_manage_msg {
>>>> +    __u32 len;    /**< in, Length of valid data - ie sum of all 
>>>> transactions */
>>>> +    __u32 count;    /**< in, Number of transactions in message */
>>>> +    __u64 data;    /**< in, Pointer to array of transactions */
>>>> +};
>>>> +
>>>> +struct qaic_create_bo {
>>>> +    __u64 size;    /**< in, Size of BO in byte */
>>>> +    __u32 handle;    /**< out, Returned GEM handle for the BO */
>>>> +    __u32 pad;    /**< pad must be 0 */
>>>> +};
>>>> +
>>>> +struct qaic_mmap_bo {
>>>> +    __u32 handle;    /**< in, Handle for the BO being mapped. */
>>>
>>> The comment is missleading. BO is not mapped by this ioctl().
>>
>> Its mapping the handle to the offset, which is a type of mapping.  I 
>> think I get your point though.  Will try to wordsmith this better.
>>
>>>
>>>> +    __u32 pad;    /**< pad must be 0 */
>>>> +    __u64 offset;    /**<
>>>> +              * out, offset into the drm node to use for
>>>> +              * subsequent mmap call
>>>> +              */
>>>> +};
>>>> +
>>>> +/**
>>>> + * @brief semaphore command
>>>> + */
>>>> +struct qaic_sem {
>>>> +    __u16 val;    /**< in, Only lower 12 bits are valid */
>>>> +    __u8  index;    /**< in, Only lower 5 bits are valid */
>>>> +    __u8  presync;    /**< in, 1 if presync operation, 0 if 
>>>> postsync */
>>>> +    __u8  cmd;    /**< in, See enum sem_cmd */
>>>> +    __u8  flags;    /**< in, See sem_flags for valid bits.  All 
>>>> others must be 0 */
>>>> +    __u16 pad;    /**< pad must be 0 */
>>>> +};
>>>> +
>>>> +struct qaic_attach_slice_entry {
>>>> +    __u64 size;        /**< in, Size memory to allocate for this BO 
>>>> slice */
>>>> +    struct qaic_sem    sem0;    /**< in, Must be zero if not valid */
>>>> +    struct qaic_sem    sem1;    /**< in, Must be zero if not valid */
>>>> +    struct qaic_sem    sem2;    /**< in, Must be zero if not valid */
>>>> +    struct qaic_sem    sem3;    /**< in, Must be zero if not valid */
>>>> +    __u64 dev_addr;        /**< in, Address in device to/from which 
>>>> data is copied */
>>>> +    __u64 db_addr;        /**< in, Doorbell address */
>>>> +    __u32 db_data;        /**< in, Data to write to doorbell */
>>>> +    __u32 db_len;        /**<
>>>> +                  * in, Doorbell length - 32, 16, or 8 bits.
>>>> +                  * 0 means doorbell is inactive
>>>> +                  */
>>>> +    __u64 offset;        /**< in, Offset from start of buffer */
>>>> +};
>>>> +
>>>> +struct qaic_attach_slice_hdr {
>>>> +    __u32 count;    /**< in, Number of slices for this BO */
>>>> +    __u32 dbc_id;    /**< in, Associate this BO with this DMA 
>>>> Bridge channel */
>>>> +    __u32 handle;    /**< in, Handle of BO to which slicing 
>>>> information is to be attached */
>>>> +    __u32 dir;    /**< in, Direction of data: 1 = DMA_TO_DEVICE, 2 
>>>> = DMA_FROM_DEVICE */
>>>> +    __u64 size;    /**<
>>>> +              * in, Total length of BO
>>>> +              * If BO is imported (DMABUF/PRIME) then this size
>>>> +              * should not exceed the size of DMABUF provided.
>>>> +              * If BO is allocated using DRM_IOCTL_QAIC_CREATE_BO
>>>> +              * then this size should be exactly same as the size
>>>> +              * provided during DRM_IOCTL_QAIC_CREATE_BO.
>>>> +              */
>>>> +};
>>>> +
>>>> +struct qaic_attach_slice {
>>>> +    struct qaic_attach_slice_hdr hdr;
>>>> +    __u64 data;    /**<
>>>> +              * in, Pointer to a buffer which is container of
>>>> +              * struct qaic_attach_slice_entry[]
>>>> +              */
>>>> +};
>>>> +
>>>> +struct qaic_execute_entry {
>>>> +    __u32 handle;    /**< in, buffer handle */
>>>> +    __u32 dir;    /**< in, 1 = to device, 2 = from device */
>>>> +};
>>>> +
>>>> +struct qaic_partial_execute_entry {
>>>> +    __u32 handle;    /**< in, buffer handle */
>>>> +    __u32 dir;    /**< in, 1 = to device, 2 = from device */
>>>> +    __u64 resize;    /**< in, 0 = no resize */
>>>> +};
>>>> +
>>>> +struct qaic_execute_hdr {
>>>> +    __u32 count;    /**< in, number of executes following this 
>>>> header */
>>>> +    __u32 dbc_id;    /**< in, Identifier of assigned DMA Bridge 
>>>> channel */
>>>> +};
>>>> +
>>>> +struct qaic_execute {
>>>> +    struct qaic_execute_hdr hdr;
>>>> +    __u64 data;    /**< in, qaic_execute_entry or 
>>>> qaic_partial_execute_entry container */
>>>> +};
>>>> +
>>>> +struct qaic_wait {
>>>> +    __u32 handle;    /**< in, handle to wait on until execute is 
>>>> complete */
>>>> +    __u32 timeout;    /**< in, timeout for wait(in ms) */
>>>> +    __u32 dbc_id;    /**< in, Identifier of assigned DMA Bridge 
>>>> channel */
>>>> +    __u32 pad;    /**< pad must be 0 */
>>>> +};
>>>> +
>>>> +struct qaic_perf_stats_hdr {
>>>> +    __u16 count;    /**< in, Total number BOs requested */
>>>> +    __u16 pad;    /**< pad must be 0 */
>>>> +    __u32 dbc_id;    /**< in, Identifier of assigned DMA Bridge 
>>>> channel */
>>>> +};
>>>> +
>>>> +struct qaic_perf_stats {
>>>> +    struct qaic_perf_stats_hdr hdr;
>>>> +    __u64 data;    /**< in, qaic_perf_stats_entry container */
>>>> +};
>>>> +
>>>> +struct qaic_perf_stats_entry {
>>>> +    __u32 handle;            /**< in, Handle of the memory request */
>>>> +    __u32 queue_level_before;    /**<
>>>> +                      * out, Number of elements in queue
>>>> +                      * before submission given memory request
>>>> +                      */
>>>> +    __u32 num_queue_element;    /**<
>>>> +                      * out, Number of elements to add in the
>>>> +                      * queue for given memory request
>>>> +                      */
>>>> +    __u32 submit_latency_us;    /**<
>>>> +                      * out, Time taken by kernel to submit
>>>> +                      * the request to device
>>>> +                      */
>>>> +    __u32 device_latency_us;    /**<
>>>> +                      * out, Time taken by device to execute the
>>>> +                      * request. 0 if request is not completed
>>>> +                      */
>>>> +    __u32 pad;            /**< pad must be 0 */
>>>> +};
>>>> +
>>>> +struct qaic_part_dev {
>>>> +    __u32 partition_id;    /**< in, reservation id */
>>>> +    __u16 remove;        /**< in, 1 - Remove device 0 - Create 
>>>> device */
>>>> +    __u16 pad;        /**< pad must be 0 */
>>>> +};
>>>> +
>>>> +#define DRM_QAIC_MANAGE                0x00
>>>> +#define DRM_QAIC_CREATE_BO            0x01
>>>> +#define DRM_QAIC_MMAP_BO            0x02
>>>
>>> I know that MMAP_BO ioctl is common in drm drivers but in my opinion 
>>> it is a very poor name.
>>> I suggest naming it BO_INFO so in future you could extend it with 
>>> other bo params besides
>>> mmap offset.
>>
>> I see your point, but I don't see how to implement it.
>>
>> Let us assume this IOCTL is renamed DRM_QAIC_BO_INFO, and struct 
>> qaic_mmap_bo is named qaic_bo_info.
>>
>> qaic_bo_info is part of the uAPI.  If, "tomorrow" we need to add a 
>> field to it, we cannot.  That changes the structure size and breaks 
>> the uAPI.
>>
>> I can't add reserved fields in anticipation of future use since GregKH 
>> had said not to do that - 
>> https://lore.kernel.org/all/20200514163734.GB3154055@kroah.com/
>>
>> So, I'm thinking the only approach would be a linked list similar to 
>> EXECUTE_BO where qaic_bo_info holds a userspace pointer that is the 
>> head of the list, and new list nodes can be defined in future.  That 
>> seems like an overengineered solution to some hypothetical future 
>> which may not come to pass.  If this is the solution, then I think I'd 
>> prefer to leave this ioctl as is, and deprecate it if the extension 
>> usecase ever comes to pass.
>>
>> Thoughts?  Am I missing something?
>>
>>>
>>>> +#define DRM_QAIC_ATTACH_SLICE_BO        0x03
>>>> +#define DRM_QAIC_EXECUTE_BO            0x04
>>>> +#define DRM_QAIC_PARTIAL_EXECUTE_BO        0x05
>>>> +#define DRM_QAIC_WAIT_BO            0x06
>>>> +#define DRM_QAIC_PERF_STATS_BO            0x07
>>>> +#define DRM_QAIC_PART_DEV            0x08
>>>> +
>>>> +#define DRM_IOCTL_QAIC_MANAGE            DRM_IOWR(DRM_COMMAND_BASE 
>>>> + DRM_QAIC_MANAGE, struct qaic_manage_msg)
>>>> +#define DRM_IOCTL_QAIC_CREATE_BO        DRM_IOWR(DRM_COMMAND_BASE + 
>>>> DRM_QAIC_CREATE_BO,    struct qaic_create_bo)
>>>> +#define DRM_IOCTL_QAIC_MMAP_BO            DRM_IOWR(DRM_COMMAND_BASE 
>>>> + DRM_QAIC_MMAP_BO, struct qaic_mmap_bo)
>>>> +#define DRM_IOCTL_QAIC_ATTACH_SLICE_BO        
>>>> DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_ATTACH_SLICE_BO, struct 
>>>> qaic_attach_slice)
>>>> +#define DRM_IOCTL_QAIC_EXECUTE_BO        DRM_IOW(DRM_COMMAND_BASE + 
>>>> DRM_QAIC_EXECUTE_BO,    struct qaic_execute)
>>>> +#define DRM_IOCTL_QAIC_PARTIAL_EXECUTE_BO    
>>>> DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_PARTIAL_EXECUTE_BO,    struct 
>>>> qaic_execute)
>>>> +#define DRM_IOCTL_QAIC_WAIT_BO            DRM_IOW(DRM_COMMAND_BASE 
>>>> + DRM_QAIC_WAIT_BO, struct qaic_wait)
>>>> +#define DRM_IOCTL_QAIC_PERF_STATS_BO        
>>>> DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_PERF_STATS_BO, struct 
>>>> qaic_perf_stats)
>>>> +#define DRM_IOCTL_QAIC_PART_DEV            
>>>> DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_PART_DEV, struct qaic_part_dev)
>>>> +
>>>> +#if defined(__CPLUSPLUS)
>>>
>>> Use lowercase here: __cplusplus
>>
>> Will do.
>>
>>>
>>>> +}
>>>> +#endif
>>>> +
>>>> +#endif /* QAIC_ACCEL_H_ */
>>>
>>> Regards,
>>> Jacek
>>>
>>

