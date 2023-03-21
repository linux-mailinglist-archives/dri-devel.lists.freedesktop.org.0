Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A9B6C2F21
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 11:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650F610E0BD;
	Tue, 21 Mar 2023 10:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B804E10E048
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 10:35:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A8E1B8133A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 10:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB8DC4339B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679394921;
 bh=juqE4HVKZecszLDUVZ+ptk5BWBO70Mf/TVBQaR83NAE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VEBDWeRgEht/z78Nl8M9KavHwp6blC3+VLPQKCJAaBjPMULqigtssK1zWD+jNHiaU
 lhtaAk2koi/d3MXoAKoufTCrxbWzBnTOopfzaBZKeM3A2guDqoltVbRGqLI3MyueD4
 JceLk+gvOPabn4T2pwtJqz9i/lb2Bk9C58ErIJyTA6TfAVD0Pb+oMZGm7xYRzdReTZ
 jhcXjaBUWBBBQW0cP01Byt1QPHi5N9SXyMxFHQdJ1e7EvBQNrBMdjCdU6BPP1EVJ3e
 zphrdg32AH0tuuIzXYEu5xXRrS2iLKCilHPLV2JhdYKZJQPuSzVTRD7fus5BK/jOp4
 SxfGNbnKeV2nA==
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-53d277c1834so272336957b3.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 03:35:21 -0700 (PDT)
X-Gm-Message-State: AAQBX9d/ywdKxopsgr7ShsOLb56dcq1vYg8k/4OkQQrHtVU96HkjVLxK
 C8p9EXQW8XjBRiEeAq3UF/6RF0dHT/SD4GuVr2Y=
X-Google-Smtp-Source: AKy350ZLvtW1R3nD320MKCy3MJql8nw0aFNrhjQEkXAVaEIWF21xIU1QDQu7cNiJ2ua1jrgA5gg+YylwlouuiCNEjUE=
X-Received: by 2002:a81:ac10:0:b0:541:8995:5334 with SMTP id
 k16-20020a81ac10000000b0054189955334mr799500ywh.3.1679394920353; Tue, 21 Mar
 2023 03:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-3-git-send-email-quic_jhugo@quicinc.com>
In-Reply-To: <1679325074-5494-3-git-send-email-quic_jhugo@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 21 Mar 2023 12:34:53 +0200
X-Gmail-Original-Message-ID: <CAFCwf12wsh=acqQ9hjXL+M8E-cT7=xNvNv3O0=y9UEo35W8XHQ@mail.gmail.com>
Message-ID: <CAFCwf12wsh=acqQ9hjXL+M8E-cT7=xNvNv3O0=y9UEo35W8XHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] accel/qaic: Add uapi and core driver file
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dafna@fastmail.com, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
 stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 5:11=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> Add the QAIC driver uapi file and core driver file that binds to the PCIe
> device. The core driver file also creates the accel device and manages
> all the interconnections between the different parts of the driver.
>
> The driver can be built as a module. If so, it will be called "qaic.ko".
>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/accel/qaic/qaic.h     | 282 ++++++++++++++++++
>  drivers/accel/qaic/qaic_drv.c | 647 ++++++++++++++++++++++++++++++++++++=
++++++
>  include/uapi/drm/qaic_accel.h | 397 ++++++++++++++++++++++++++
>  3 files changed, 1326 insertions(+)
>  create mode 100644 drivers/accel/qaic/qaic.h
>  create mode 100644 drivers/accel/qaic/qaic_drv.c
>  create mode 100644 include/uapi/drm/qaic_accel.h
>
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> new file mode 100644
> index 0000000..36c0d0ba
> --- /dev/null
> +++ b/drivers/accel/qaic/qaic.h
> @@ -0,0 +1,282 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights r=
eserved.
> + */
> +
> +#ifndef _QAIC_H_
> +#define _QAIC_H_
> +
> +#include <linux/interrupt.h>
> +#include <linux/kref.h>
> +#include <linux/mhi.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>
> +#include <linux/spinlock.h>
> +#include <linux/srcu.h>
> +#include <linux/wait.h>
> +#include <linux/workqueue.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_gem.h>
> +
> +#define QAIC_DBC_BASE          SZ_128K
> +#define QAIC_DBC_SIZE          SZ_4K
> +
> +#define QAIC_NO_PARTITION      -1
> +
> +#define QAIC_DBC_OFF(i)                ((i) * QAIC_DBC_SIZE + QAIC_DBC_B=
ASE)
> +
> +#define to_qaic_bo(obj) container_of(obj, struct qaic_bo, base)
> +
> +extern bool datapath_polling;
> +
> +struct qaic_user {
> +       /* Uniquely identifies this user for the device */
> +       int                     handle;
> +       struct kref             ref_count;
> +       /* Char device opened by this user */
> +       struct qaic_drm_device  *qddev;
> +       /* Node in list of users that opened this drm device */
> +       struct list_head        node;
> +       /* SRCU used to synchronize this user during cleanup */
> +       struct srcu_struct      qddev_lock;
> +       atomic_t                chunk_id;
> +};
> +
> +struct dma_bridge_chan {
> +       /* Pointer to device strcut maintained by driver */
> +       struct qaic_device      *qdev;
> +       /* ID of this DMA bridge channel(DBC) */
> +       unsigned int            id;
> +       /* Synchronizes access to xfer_list */
> +       spinlock_t              xfer_lock;
> +       /* Base address of request queue */
> +       void                    *req_q_base;
> +       /* Base address of response queue */
> +       void                    *rsp_q_base;
> +       /*
> +        * Base bus address of request queue. Response queue bus address =
can be
> +        * calculated by adding request queue size to this variable
> +        */
> +       dma_addr_t              dma_addr;
> +       /* Total size of request and response queue in byte */
> +       u32                     total_size;
> +       /* Capacity of request/response queue */
> +       u32                     nelem;
> +       /* The user that opened this DBC */
> +       struct qaic_user        *usr;
> +       /*
> +        * Request ID of next memory handle that goes in request queue. O=
ne
> +        * memory handle can enqueue more than one request elements, all
> +        * this requests that belong to same memory handle have same requ=
est ID
> +        */
> +       u16                     next_req_id;
> +       /* true: DBC is in use; false: DBC not in use */
> +       bool                    in_use;
> +       /*
> +        * Base address of device registers. Used to read/write request a=
nd
> +        * response queue's head and tail pointer of this DBC.
> +        */
> +       void __iomem            *dbc_base;
> +       /* Head of list where each node is a memory handle queued in requ=
est queue */
> +       struct list_head        xfer_list;
> +       /* Synchronizes DBC readers during cleanup */
> +       struct srcu_struct      ch_lock;
> +       /*
> +        * When this DBC is released, any thread waiting on this wait que=
ue is
> +        * woken up
> +        */
> +       wait_queue_head_t       dbc_release;
> +       /* Head of list where each node is a bo associated with this DBC =
*/
> +       struct list_head        bo_lists;
> +       /* The irq line for this DBC. Used for polling */
> +       unsigned int            irq;
> +       /* Polling work item to simulate interrupts */
> +       struct work_struct      poll_work;
> +};
> +
> +struct qaic_device {
> +       /* Pointer to base PCI device struct of our physical device */
> +       struct pci_dev          *pdev;
> +       /* Req. ID of request that will be queued next in MHI control dev=
ice */
> +       u32                     next_seq_num;
> +       /* Base address of bar 0 */
> +       void __iomem            *bar_0;
> +       /* Base address of bar 2 */
> +       void __iomem            *bar_2;
> +       /* Controller structure for MHI devices */
> +       struct mhi_controller   *mhi_cntl;
> +       /* MHI control channel device */
> +       struct mhi_device       *cntl_ch;
> +       /* List of requests queued in MHI control device */
> +       struct list_head        cntl_xfer_list;
> +       /* Synchronizes MHI control device transactions and its xfer list=
 */
> +       struct mutex            cntl_mutex;
> +       /* Array of DBC struct of this device */
> +       struct dma_bridge_chan  *dbc;
> +       /* Work queue for tasks related to MHI control device */
> +       struct workqueue_struct *cntl_wq;
> +       /* Synchronizes all the users of device during cleanup */
> +       struct srcu_struct      dev_lock;
> +       /* true: Device under reset; false: Device not under reset */
> +       bool                    in_reset;
> +       /*
> +        * true: A tx MHI transaction has failed and a rx buffer is still=
 queued
> +        * in control device. Such a buffer is considered lost rx buffer
> +        * false: No rx buffer is lost in control device
> +        */
> +       bool                    cntl_lost_buf;
> +       /* Maximum number of DBC supported by this device */
> +       u32                     num_dbc;
> +       /* Reference to the drm_device for this device when it is created=
 */
> +       struct qaic_drm_device  *qddev;
> +       /* Generate the CRC of a control message */
> +       u32 (*gen_crc)(void *msg);
> +       /* Validate the CRC of a control message */
> +       bool (*valid_crc)(void *msg);
> +};
> +
> +struct qaic_drm_device {
> +       /* Pointer to the root device struct driven by this driver */
> +       struct qaic_device      *qdev;
> +       /*
> +        * The physical device can be partition in number of logical devi=
ces.
> +        * And each logical device is given a partition id. This member s=
tores
> +        * that id. QAIC_NO_PARTITION is a sentinel used to mark that thi=
s drm
> +        * device is the actual physical device
> +        */
> +       s32                     partition_id;
> +       /* Pointer to the drm device struct of this drm device */
> +       struct drm_device       *ddev;
> +       /* Head in list of users who have opened this drm device */
> +       struct list_head        users;
> +       /* Synchronizes access to users list */
> +       struct mutex            users_mutex;
> +};
> +
> +struct qaic_bo {
> +       struct drm_gem_object   base;
> +       /* Scatter/gather table for allocate/imported BO */
> +       struct sg_table         *sgt;
> +       /* BO size requested by user. GEM object might be bigger in size.=
 */
> +       u64                     size;
> +       /* Head in list of slices of this BO */
> +       struct list_head        slices;
> +       /* Total nents, for all slices of this BO */
> +       int                     total_slice_nents;
> +       /*
> +        * Direction of transfer. It can assume only two value DMA_TO_DEV=
ICE and
> +        * DMA_FROM_DEVICE.
> +        */
> +       int                     dir;
> +       /* The pointer of the DBC which operates on this BO */
> +       struct dma_bridge_chan  *dbc;
> +       /* Number of slice that belongs to this buffer */
> +       u32                     nr_slice;
> +       /* Number of slice that have been transferred by DMA engine */
> +       u32                     nr_slice_xfer_done;
> +       /* true =3D BO is queued for execution, true =3D BO is not queued=
 */
> +       bool                    queued;
> +       /*
> +        * If true then user has attached slicing information to this BO =
by
> +        * calling DRM_IOCTL_QAIC_ATTACH_SLICE_BO ioctl.
> +        */
> +       bool                    sliced;
> +       /* Request ID of this BO if it is queued for execution */
> +       u16                     req_id;
> +       /* Handle assigned to this BO */
> +       u32                     handle;
> +       /* Wait on this for completion of DMA transfer of this BO */
> +       struct completion       xfer_done;
> +       /*
> +        * Node in linked list where head is dbc->xfer_list.
> +        * This link list contain BO's that are queued for DMA transfer.
> +        */
> +       struct list_head        xfer_list;
> +       /*
> +        * Node in linked list where head is dbc->bo_lists.
> +        * This link list contain BO's that are associated with the DBC i=
t is
> +        * linked to.
> +        */
> +       struct list_head        bo_list;
> +       struct {
> +               /*
> +                * Latest timestamp(ns) at which kernel received a reques=
t to
> +                * execute this BO
> +                */
> +               u64             req_received_ts;
> +               /*
> +                * Latest timestamp(ns) at which kernel enqueued requests=
 of
> +                * this BO for execution in DMA queue
> +                */
> +               u64             req_submit_ts;
> +               /*
> +                * Latest timestamp(ns) at which kernel received a comple=
tion
> +                * interrupt for requests of this BO
> +                */
> +               u64             req_processed_ts;
> +               /*
> +                * Number of elements already enqueued in DMA queue befor=
e
> +                * enqueuing requests of this BO
> +                */
> +               u32             queue_level_before;
> +       } perf_stats;
> +
> +};
> +
> +struct bo_slice {
> +       /* Mapped pages */
> +       struct sg_table         *sgt;
> +       /* Number of requests required to queue in DMA queue */
> +       int                     nents;
> +       /* See enum dma_data_direction */
> +       int                     dir;
> +       /* Actual requests that will be copied in DMA queue */
> +       struct dbc_req          *reqs;
> +       struct kref             ref_count;
> +       /* true: No DMA transfer required */
> +       bool                    no_xfer;
> +       /* Pointer to the parent BO handle */
> +       struct qaic_bo          *bo;
> +       /* Node in list of slices maintained by parent BO */
> +       struct list_head        slice;
> +       /* Size of this slice in bytes */
> +       u64                     size;
> +       /* Offset of this slice in buffer */
> +       u64                     offset;
> +};
> +
> +int get_dbc_req_elem_size(void);
> +int get_dbc_rsp_elem_size(void);
> +int get_cntl_version(struct qaic_device *qdev, struct qaic_user *usr, u1=
6 *major, u16 *minor);
> +int qaic_manage_ioctl(struct drm_device *dev, void *data, struct drm_fil=
e *file_priv);
> +void qaic_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *=
mhi_result);
> +
> +void qaic_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *=
mhi_result);
> +
> +int qaic_control_open(struct qaic_device *qdev);
> +void qaic_control_close(struct qaic_device *qdev);
> +void qaic_release_usr(struct qaic_device *qdev, struct qaic_user *usr);
> +
> +irqreturn_t dbc_irq_threaded_fn(int irq, void *data);
> +irqreturn_t dbc_irq_handler(int irq, void *data);
> +int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *=
usr);
> +void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *=
usr);
> +void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
> +void release_dbc(struct qaic_device *qdev, u32 dbc_id);
> +
> +void wake_all_cntl(struct qaic_device *qdev);
> +void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exi=
t_reset);
> +
> +struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, str=
uct dma_buf *dma_buf);
> +
> +int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_=
file *file_priv);
> +int qaic_mmap_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi=
le *file_priv);
> +int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struc=
t drm_file *file_priv);
> +int qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct drm=
_file *file_priv);
> +int qaic_partial_execute_bo_ioctl(struct drm_device *dev, void *data, st=
ruct drm_file *file_priv);
> +int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi=
le *file_priv);
> +int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct =
drm_file *file_priv);
> +void irq_polling_work(struct work_struct *work);
> +
> +#endif /* _QAIC_H_ */
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.=
c
> new file mode 100644
> index 0000000..cbc7655
> --- /dev/null
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -0,0 +1,647 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. *=
/
> +/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights r=
eserved. */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/idr.h>
> +#include <linux/interrupt.h>
> +#include <linux/list.h>
> +#include <linux/kref.h>
> +#include <linux/mhi.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>
> +#include <linux/wait.h>
> +#include <drm/drm_accel.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_ioctl.h>
> +#include <uapi/drm/qaic_accel.h>
> +
> +#include "mhi_controller.h"
> +#include "mhi_qaic_ctrl.h"
> +#include "qaic.h"
> +
> +MODULE_IMPORT_NS(DMA_BUF);
> +
> +#define PCI_DEV_AIC100                 0xa100
> +#define QAIC_NAME                      "qaic"
> +#define QAIC_DESC                      "Qualcomm Cloud AI Accelerators"
> +#define CNTL_MAJOR                     5
> +#define CNTL_MINOR                     0
> +
> +bool datapath_polling;
> +module_param(datapath_polling, bool, 0400);
> +MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode=
");
> +static bool link_up;
> +static DEFINE_IDA(qaic_usrs);
> +
> +static int qaic_create_drm_device(struct qaic_device *qdev, s32 partitio=
n_id);
> +static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partit=
ion_id);
> +
> +static void free_usr(struct kref *kref)
> +{
> +       struct qaic_user *usr =3D container_of(kref, struct qaic_user, re=
f_count);
> +
> +       cleanup_srcu_struct(&usr->qddev_lock);
> +       ida_free(&qaic_usrs, usr->handle);
> +       kfree(usr);
> +}
> +
> +static int qaic_open(struct drm_device *dev, struct drm_file *file)
> +{
> +       struct qaic_drm_device *qddev =3D dev->dev_private;
> +       struct qaic_device *qdev =3D qddev->qdev;
> +       struct qaic_user *usr;
> +       int rcu_id;
> +       int ret;
> +
> +       rcu_id =3D srcu_read_lock(&qdev->dev_lock);
> +       if (qdev->in_reset) {
> +               ret =3D -ENODEV;
> +               goto dev_unlock;
> +       }
> +
> +       usr =3D kmalloc(sizeof(*usr), GFP_KERNEL);
> +       if (!usr) {
> +               ret =3D -ENOMEM;
> +               goto dev_unlock;
> +       }
> +
> +       usr->handle =3D ida_alloc(&qaic_usrs, GFP_KERNEL);
> +       if (usr->handle < 0) {
> +               ret =3D usr->handle;
> +               goto free_usr;
> +       }
> +       usr->qddev =3D qddev;
> +       atomic_set(&usr->chunk_id, 0);
> +       init_srcu_struct(&usr->qddev_lock);
> +       kref_init(&usr->ref_count);
> +
> +       ret =3D mutex_lock_interruptible(&qddev->users_mutex);
> +       if (ret)
> +               goto cleanup_usr;
> +
> +       list_add(&usr->node, &qddev->users);
> +       mutex_unlock(&qddev->users_mutex);
> +
> +       file->driver_priv =3D usr;
> +
> +       srcu_read_unlock(&qdev->dev_lock, rcu_id);
> +       return 0;
> +
> +cleanup_usr:
> +       cleanup_srcu_struct(&usr->qddev_lock);
> +free_usr:
> +       kfree(usr);
> +dev_unlock:
> +       srcu_read_unlock(&qdev->dev_lock, rcu_id);
> +       return ret;
> +}
> +
> +static void qaic_postclose(struct drm_device *dev, struct drm_file *file=
)
> +{
> +       struct qaic_user *usr =3D file->driver_priv;
> +       struct qaic_drm_device *qddev;
> +       struct qaic_device *qdev;
> +       int qdev_rcu_id;
> +       int usr_rcu_id;
> +       int i;
> +
> +       qddev =3D usr->qddev;
> +       usr_rcu_id =3D srcu_read_lock(&usr->qddev_lock);
> +       if (qddev) {
> +               qdev =3D qddev->qdev;
> +               qdev_rcu_id =3D srcu_read_lock(&qdev->dev_lock);
> +               if (!qdev->in_reset) {
> +                       qaic_release_usr(qdev, usr);
> +                       for (i =3D 0; i < qdev->num_dbc; ++i)
> +                               if (qdev->dbc[i].usr && qdev->dbc[i].usr-=
>handle =3D=3D usr->handle)
> +                                       release_dbc(qdev, i);
> +               }
> +               srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
> +
> +               mutex_lock(&qddev->users_mutex);
> +               if (!list_empty(&usr->node))
> +                       list_del_init(&usr->node);
> +               mutex_unlock(&qddev->users_mutex);
> +       }
> +
> +       srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
> +       kref_put(&usr->ref_count, free_usr);
> +
> +       file->driver_priv =3D NULL;
> +}
> +
> +DEFINE_DRM_ACCEL_FOPS(qaic_accel_fops);
> +
> +static const struct drm_ioctl_desc qaic_drm_ioctls[] =3D {
> +       DRM_IOCTL_DEF_DRV(QAIC_MANAGE, qaic_manage_ioctl, DRM_RENDER_ALLO=
W),
> +       DRM_IOCTL_DEF_DRV(QAIC_CREATE_BO, qaic_create_bo_ioctl, DRM_RENDE=
R_ALLOW),
> +       DRM_IOCTL_DEF_DRV(QAIC_MMAP_BO, qaic_mmap_bo_ioctl, DRM_RENDER_AL=
LOW),
> +       DRM_IOCTL_DEF_DRV(QAIC_ATTACH_SLICE_BO, qaic_attach_slice_bo_ioct=
l, DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(QAIC_EXECUTE_BO, qaic_execute_bo_ioctl, DRM_REN=
DER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(QAIC_PARTIAL_EXECUTE_BO, qaic_partial_execute_b=
o_ioctl, DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(QAIC_WAIT_BO, qaic_wait_bo_ioctl, DRM_RENDER_AL=
LOW),
> +       DRM_IOCTL_DEF_DRV(QAIC_PERF_STATS_BO, qaic_perf_stats_bo_ioctl, D=
RM_RENDER_ALLOW),
Why do you need DRM_RENDER_ALLOW ?


> +};
> +
> +static const struct drm_driver qaic_accel_driver =3D {
> +       .driver_features        =3D DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> +
> +       .name                   =3D QAIC_NAME,
> +       .desc                   =3D QAIC_DESC,
> +       .date                   =3D "20190618",
> +
> +       .fops                   =3D &qaic_accel_fops,
> +       .open                   =3D qaic_open,
> +       .postclose              =3D qaic_postclose,
> +
> +       .ioctls                 =3D qaic_drm_ioctls,
> +       .num_ioctls             =3D ARRAY_SIZE(qaic_drm_ioctls),
> +       .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
> +       .gem_prime_import       =3D qaic_gem_prime_import,
> +};
> +
> +static int qaic_create_drm_device(struct qaic_device *qdev, s32 partitio=
n_id)
> +{
> +       struct qaic_drm_device *qddev;
> +       struct drm_device *ddev;
> +       struct device *pdev;
> +       int ret;
> +
> +       /* Hold off implementing partitions until the uapi is determined =
*/
> +       if (partition_id !=3D QAIC_NO_PARTITION)
> +               return -EINVAL;
> +
> +       pdev =3D &qdev->pdev->dev;
> +
> +       qddev =3D kzalloc(sizeof(*qddev), GFP_KERNEL);
> +       if (!qddev)
> +               return -ENOMEM;
> +
> +       ddev =3D drm_dev_alloc(&qaic_accel_driver, pdev);
> +       if (IS_ERR(ddev)) {
> +               ret =3D PTR_ERR(ddev);
> +               goto ddev_fail;
> +       }
> +
> +       ddev->dev_private =3D qddev;
> +       qddev->ddev =3D ddev;
> +
> +       qddev->qdev =3D qdev;
> +       qddev->partition_id =3D partition_id;
> +       INIT_LIST_HEAD(&qddev->users);
> +       mutex_init(&qddev->users_mutex);
> +
> +       qdev->qddev =3D qddev;
> +
> +       ret =3D drm_dev_register(ddev, 0);
> +       if (ret) {
> +               pci_dbg(qdev->pdev, "%s: drm_dev_register failed %d\n", _=
_func__, ret);
> +               goto drm_reg_fail;
> +       }
> +
> +       return 0;
> +
> +drm_reg_fail:
> +       mutex_destroy(&qddev->users_mutex);
> +       qdev->qddev =3D NULL;
> +       drm_dev_put(ddev);
> +ddev_fail:
> +       kfree(qddev);
> +       return ret;
> +}
> +
> +static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partit=
ion_id)
> +{
> +       struct qaic_drm_device *qddev;
> +       struct qaic_user *usr;
> +
> +       qddev =3D qdev->qddev;
> +
> +       /*
> +        * Existing users get unresolvable errors till they close FDs.
> +        * Need to sync carefully with users calling close(). The
> +        * list of users can be modified elsewhere when the lock isn't
> +        * held here, but the sync'ing the srcu with the mutex held
> +        * could deadlock. Grab the mutex so that the list will be
> +        * unmodified. The user we get will exist as long as the
> +        * lock is held. Signal that the qcdev is going away, and
> +        * grab a reference to the user so they don't go away for
> +        * synchronize_srcu(). Then release the mutex to avoid
> +        * deadlock and make sure the user has observed the signal.
> +        * With the lock released, we cannot maintain any state of the
> +        * user list.
> +        */
> +       mutex_lock(&qddev->users_mutex);
> +       while (!list_empty(&qddev->users)) {
> +               usr =3D list_first_entry(&qddev->users, struct qaic_user,=
 node);
> +               list_del_init(&usr->node);
> +               kref_get(&usr->ref_count);
> +               usr->qddev =3D NULL;
> +               mutex_unlock(&qddev->users_mutex);
> +               synchronize_srcu(&usr->qddev_lock);
> +               kref_put(&usr->ref_count, free_usr);
> +               mutex_lock(&qddev->users_mutex);
> +       }
> +       mutex_unlock(&qddev->users_mutex);
> +
> +       if (qddev->ddev) {
> +               drm_dev_unregister(qddev->ddev);
> +               drm_dev_put(qddev->ddev);
> +       }
> +
> +       kfree(qddev);
> +}
> +
> +static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_d=
evice_id *id)
> +{
> +       struct qaic_device *qdev;
> +       u16 major, minor;
> +       int ret;
> +
> +       /*
> +        * Invoking this function indicates that the control channel to t=
he
> +        * device is available. We use that as a signal to indicate that
> +        * the device side firmware has booted. The device side firmware
> +        * manages the device resources, so we need to communicate with i=
t
> +        * via the control channel in order to utilize the device. Theref=
ore
> +        * we wait until this signal to create the drm dev that userspace=
 will
> +        * use to control the device, because without the device side fir=
mware,
> +        * userspace can't do anything useful.
> +        */
> +
> +       qdev =3D pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev=
));
> +
> +       qdev->in_reset =3D false;
> +
> +       dev_set_drvdata(&mhi_dev->dev, qdev);
> +       qdev->cntl_ch =3D mhi_dev;
> +
> +       ret =3D qaic_control_open(qdev);
> +       if (ret) {
> +               pci_dbg(qdev->pdev, "%s: control_open failed %d\n", __fun=
c__, ret);
> +               return ret;
> +       }
> +
> +       ret =3D get_cntl_version(qdev, NULL, &major, &minor);
> +       if (ret || major !=3D CNTL_MAJOR || minor > CNTL_MINOR) {
> +               pci_err(qdev->pdev, "%s: Control protocol version (%d.%d)=
 not supported. Supported version is (%d.%d). Ret: %d\n",
> +                       __func__, major, minor, CNTL_MAJOR, CNTL_MINOR, r=
et);
> +               ret =3D -EINVAL;
> +               goto close_control;
> +       }
> +
> +       ret =3D qaic_create_drm_device(qdev, QAIC_NO_PARTITION);
> +
> +       return ret;
> +
> +close_control:
> +       qaic_control_close(qdev);
> +       return ret;
> +}
> +
> +static void qaic_mhi_remove(struct mhi_device *mhi_dev)
> +{
> +/* This is redundant since we have already observed the device crash */
> +}
> +
> +static void qaic_notify_reset(struct qaic_device *qdev)
> +{
> +       int i;
> +
> +       qdev->in_reset =3D true;
> +       /* wake up any waiters to avoid waiting for timeouts at sync */
> +       wake_all_cntl(qdev);
> +       for (i =3D 0; i < qdev->num_dbc; ++i)
> +               wakeup_dbc(qdev, i);
> +       synchronize_srcu(&qdev->dev_lock);
> +}
> +
> +void qaic_dev_reset_clean_local_state(struct qaic_device *qdev, bool exi=
t_reset)
> +{
> +       int i;
> +
> +       qaic_notify_reset(qdev);
> +
> +       /* remove drmdevs to prevent new users from coming in */
> +       qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
> +
> +       /* start tearing things down */
> +       for (i =3D 0; i < qdev->num_dbc; ++i)
> +               release_dbc(qdev, i);
> +
> +       if (exit_reset)
> +               qdev->in_reset =3D false;
> +}
> +
> +static struct qaic_device *create_qdev(struct pci_dev *pdev, const struc=
t pci_device_id *id)
> +{
> +       struct qaic_device *qdev;
> +       int i;
> +
> +       qdev =3D devm_kzalloc(&pdev->dev, sizeof(*qdev), GFP_KERNEL);
> +       if (!qdev)
> +               return NULL;
> +
> +       if (id->device =3D=3D PCI_DEV_AIC100) {
> +               qdev->num_dbc =3D 16;
> +               qdev->dbc =3D devm_kcalloc(&pdev->dev, qdev->num_dbc, siz=
eof(*qdev->dbc), GFP_KERNEL);
> +               if (!qdev->dbc)
> +                       return NULL;
> +       }
> +
> +       qdev->cntl_wq =3D alloc_workqueue("qaic_cntl", WQ_UNBOUND, 0);
> +       if (!qdev->cntl_wq)
> +               return NULL;
> +
> +       pci_set_drvdata(pdev, qdev);
> +       qdev->pdev =3D pdev;
> +
> +       mutex_init(&qdev->cntl_mutex);
> +       INIT_LIST_HEAD(&qdev->cntl_xfer_list);
> +       init_srcu_struct(&qdev->dev_lock);
> +
> +       for (i =3D 0; i < qdev->num_dbc; ++i) {
> +               spin_lock_init(&qdev->dbc[i].xfer_lock);
> +               qdev->dbc[i].qdev =3D qdev;
> +               qdev->dbc[i].id =3D i;
> +               INIT_LIST_HEAD(&qdev->dbc[i].xfer_list);
> +               init_srcu_struct(&qdev->dbc[i].ch_lock);
> +               init_waitqueue_head(&qdev->dbc[i].dbc_release);
> +               INIT_LIST_HEAD(&qdev->dbc[i].bo_lists);
> +       }
> +
> +       return qdev;
> +}
> +
> +static void cleanup_qdev(struct qaic_device *qdev)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < qdev->num_dbc; ++i)
> +               cleanup_srcu_struct(&qdev->dbc[i].ch_lock);
> +       cleanup_srcu_struct(&qdev->dev_lock);
> +       pci_set_drvdata(qdev->pdev, NULL);
> +       destroy_workqueue(qdev->cntl_wq);
> +}
> +
> +static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
> +{
> +       int bars;
> +       int ret;
> +
> +       bars =3D pci_select_bars(pdev, IORESOURCE_MEM);
> +
> +       /* make sure the device has the expected BARs */
> +       if (bars !=3D (BIT(0) | BIT(2) | BIT(4))) {
> +               pci_dbg(pdev, "%s: expected BARs 0, 2, and 4 not found in=
 device. Found 0x%x\n",
> +                       __func__, bars);
> +               return -EINVAL;
> +       }
> +
> +       ret =3D pcim_enable_device(pdev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +       if (ret)
> +               return ret;
> +       ret =3D dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> +       if (ret)
> +               return ret;
> +
> +       qdev->bar_0 =3D devm_ioremap_resource(&pdev->dev, &pdev->resource=
[0]);
> +       if (IS_ERR(qdev->bar_0))
> +               return PTR_ERR(qdev->bar_0);
> +
> +       qdev->bar_2 =3D devm_ioremap_resource(&pdev->dev, &pdev->resource=
[2]);
> +       if (IS_ERR(qdev->bar_2))
> +               return PTR_ERR(qdev->bar_2);
> +
> +       /* Managed release since we use pcim_enable_device above */
> +       pci_set_master(pdev);
> +
> +       return 0;
> +}
> +
> +static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
> +{
> +       int mhi_irq;
> +       int ret;
> +       int i;
> +
> +       /* Managed release since we use pcim_enable_device */
> +       ret =3D pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (ret < 32) {
> +               pci_err(pdev, "%s: Requested 32 MSIs. Obtained %d MSIs wh=
ich is less than the 32 required.\n",
> +                       __func__, ret);
> +               return -ENODEV;
> +       }
> +
> +       mhi_irq =3D pci_irq_vector(pdev, 0);
> +       if (mhi_irq < 0)
> +               return mhi_irq;
> +
> +       for (i =3D 0; i < qdev->num_dbc; ++i) {
> +               ret =3D devm_request_threaded_irq(&pdev->dev, pci_irq_vec=
tor(pdev, i + 1),
> +                                               dbc_irq_handler, dbc_irq_=
threaded_fn, IRQF_SHARED,
> +                                               "qaic_dbc", &qdev->dbc[i]=
);
> +               if (ret)
> +                       return ret;
> +
> +               if (datapath_polling) {
> +                       qdev->dbc[i].irq =3D pci_irq_vector(pdev, i + 1);
> +                       disable_irq_nosync(qdev->dbc[i].irq);
> +                       INIT_WORK(&qdev->dbc[i].poll_work, irq_polling_wo=
rk);
> +               }
> +       }
> +
> +       return mhi_irq;
> +}
> +
> +static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_=
id *id)
> +{
> +       struct qaic_device *qdev;
> +       int mhi_irq;
> +       int ret;
> +       int i;
> +
> +       qdev =3D create_qdev(pdev, id);
> +       if (!qdev)
> +               return -ENOMEM;
> +
> +       ret =3D init_pci(qdev, pdev);
> +       if (ret)
> +               goto cleanup_qdev;
> +
> +       for (i =3D 0; i < qdev->num_dbc; ++i)
> +               qdev->dbc[i].dbc_base =3D qdev->bar_2 + QAIC_DBC_OFF(i);
> +
> +       mhi_irq =3D init_msi(qdev, pdev);
> +       if (mhi_irq < 0) {
> +               ret =3D mhi_irq;
> +               goto cleanup_qdev;
> +       }
> +
> +       qdev->mhi_cntl =3D qaic_mhi_register_controller(pdev, qdev->bar_0=
, mhi_irq);
> +       if (IS_ERR(qdev->mhi_cntl)) {
> +               ret =3D PTR_ERR(qdev->mhi_cntl);
> +               goto cleanup_qdev;
> +       }
> +
> +       return 0;
> +
> +cleanup_qdev:
> +       cleanup_qdev(qdev);
> +       return ret;
> +}
> +
> +static void qaic_pci_remove(struct pci_dev *pdev)
> +{
> +       struct qaic_device *qdev =3D pci_get_drvdata(pdev);
> +
> +       if (!qdev)
> +               return;
> +
> +       qaic_dev_reset_clean_local_state(qdev, false);
> +       qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
> +       cleanup_qdev(qdev);
> +}
> +
> +static void qaic_pci_shutdown(struct pci_dev *pdev)
> +{
> +       /* see qaic_exit for what link_up is doing */
> +       link_up =3D true;
> +       qaic_pci_remove(pdev);
> +}
> +
> +static pci_ers_result_t qaic_pci_error_detected(struct pci_dev *pdev, pc=
i_channel_state_t error)
> +{
> +       return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static void qaic_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +       struct qaic_device *qdev =3D pci_get_drvdata(pdev);
> +
> +       qaic_notify_reset(qdev);
> +       qaic_mhi_start_reset(qdev->mhi_cntl);
> +       qaic_dev_reset_clean_local_state(qdev, false);
> +}
> +
> +static void qaic_pci_reset_done(struct pci_dev *pdev)
> +{
> +       struct qaic_device *qdev =3D pci_get_drvdata(pdev);
> +
> +       qdev->in_reset =3D false;
> +       qaic_mhi_reset_done(qdev->mhi_cntl);
> +}
> +
> +static const struct mhi_device_id qaic_mhi_match_table[] =3D {
> +       { .chan =3D "QAIC_CONTROL", },
> +       {},
> +};
> +
> +static struct mhi_driver qaic_mhi_driver =3D {
> +       .id_table =3D qaic_mhi_match_table,
> +       .remove =3D qaic_mhi_remove,
> +       .probe =3D qaic_mhi_probe,
> +       .ul_xfer_cb =3D qaic_mhi_ul_xfer_cb,
> +       .dl_xfer_cb =3D qaic_mhi_dl_xfer_cb,
> +       .driver =3D {
> +               .name =3D "qaic_mhi",
> +       },
> +};
> +
> +static const struct pci_device_id qaic_ids[] =3D {
> +       { PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(pci, qaic_ids);
> +
> +static const struct pci_error_handlers qaic_pci_err_handler =3D {
> +       .error_detected =3D qaic_pci_error_detected,
> +       .reset_prepare =3D qaic_pci_reset_prepare,
> +       .reset_done =3D qaic_pci_reset_done,
> +};
> +
> +static struct pci_driver qaic_pci_driver =3D {
> +       .name =3D QAIC_NAME,
> +       .id_table =3D qaic_ids,
> +       .probe =3D qaic_pci_probe,
> +       .remove =3D qaic_pci_remove,
> +       .shutdown =3D qaic_pci_shutdown,
> +       .err_handler =3D &qaic_pci_err_handler,
> +};
> +
> +static int __init qaic_init(void)
> +{
> +       int ret;
> +
> +       ret =3D mhi_driver_register(&qaic_mhi_driver);
> +       if (ret) {
> +               pr_debug("qaic: mhi_driver_register failed %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D pci_register_driver(&qaic_pci_driver);
> +       if (ret) {
> +               pr_debug("qaic: pci_register_driver failed %d\n", ret);
> +               goto free_mhi;
> +       }
> +
> +       ret =3D mhi_qaic_ctrl_init();
> +       if (ret) {
> +               pr_debug("qaic: mhi_qaic_ctrl_init failed %d\n", ret);
> +               goto free_pci;
> +       }
> +
> +       return 0;
> +
> +free_pci:
> +       pci_unregister_driver(&qaic_pci_driver);
> +free_mhi:
> +       mhi_driver_unregister(&qaic_mhi_driver);
> +       return ret;
> +}
> +
> +static void __exit qaic_exit(void)
> +{
> +       /*
> +        * We assume that qaic_pci_remove() is called due to a hotplug ev=
ent
> +        * which would mean that the link is down, and thus
> +        * qaic_mhi_free_controller() should not try to access the device=
 during
> +        * cleanup.
> +        * We call pci_unregister_driver() below, which also triggers
> +        * qaic_pci_remove(), but since this is module exit, we expect th=
e link
> +        * to the device to be up, in which case qaic_mhi_free_controller=
()
> +        * should try to access the device during cleanup to put the devi=
ce in
> +        * a sane state.
> +        * For that reason, we set link_up here to let qaic_mhi_free_cont=
roller
> +        * know the expected link state. Since the module is going to be
> +        * removed at the end of this, we don't need to worry about
> +        * reinitializing the link_up state after the cleanup is done.
> +        */
> +       link_up =3D true;
> +       mhi_qaic_ctrl_deinit();
> +       pci_unregister_driver(&qaic_pci_driver);
> +       mhi_driver_unregister(&qaic_mhi_driver);
> +}
> +
> +module_init(qaic_init);
> +module_exit(qaic_exit);
> +
> +MODULE_AUTHOR(QAIC_DESC " Kernel Driver Team");
> +MODULE_DESCRIPTION(QAIC_DESC " Accel Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/drm/qaic_accel.h b/include/uapi/drm/qaic_accel.=
h
> new file mode 100644
> index 0000000..2d34874
> --- /dev/null
> +++ b/include/uapi/drm/qaic_accel.h
> @@ -0,0 +1,397 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
> + *
> + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights r=
eserved.
> + */
> +
> +#ifndef QAIC_ACCEL_H_
> +#define QAIC_ACCEL_H_
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/* The length(4K) includes len and count fields of qaic_manage_msg */
> +#define QAIC_MANAGE_MAX_MSG_LENGTH SZ_4K
> +
> +/* semaphore flags */
> +#define QAIC_SEM_INSYNCFENCE   2
> +#define QAIC_SEM_OUTSYNCFENCE  1
> +
> +/* Semaphore commands */
> +#define QAIC_SEM_NOP           0
> +#define QAIC_SEM_INIT          1
> +#define QAIC_SEM_INC           2
> +#define QAIC_SEM_DEC           3
> +#define QAIC_SEM_WAIT_EQUAL    4
> +#define QAIC_SEM_WAIT_GT_EQ    5 /* Greater than or equal */
> +#define QAIC_SEM_WAIT_GT_0     6 /* Greater than 0 */
> +
> +#define QAIC_TRANS_UNDEFINED                   0
> +#define QAIC_TRANS_PASSTHROUGH_FROM_USR                1
> +#define QAIC_TRANS_PASSTHROUGH_TO_USR          2
> +#define QAIC_TRANS_PASSTHROUGH_FROM_DEV                3
> +#define QAIC_TRANS_PASSTHROUGH_TO_DEV          4
> +#define QAIC_TRANS_DMA_XFER_FROM_USR           5
> +#define QAIC_TRANS_DMA_XFER_TO_DEV             6
> +#define QAIC_TRANS_ACTIVATE_FROM_USR           7
> +#define QAIC_TRANS_ACTIVATE_FROM_DEV           8
> +#define QAIC_TRANS_ACTIVATE_TO_DEV             9
> +#define QAIC_TRANS_DEACTIVATE_FROM_USR         10
> +#define QAIC_TRANS_DEACTIVATE_FROM_DEV         11
> +#define QAIC_TRANS_STATUS_FROM_USR             12
> +#define QAIC_TRANS_STATUS_TO_USR               13
> +#define QAIC_TRANS_STATUS_FROM_DEV             14
> +#define QAIC_TRANS_STATUS_TO_DEV               15
> +#define QAIC_TRANS_TERMINATE_FROM_DEV          16
> +#define QAIC_TRANS_TERMINATE_TO_DEV            17
> +#define QAIC_TRANS_DMA_XFER_CONT               18
> +#define QAIC_TRANS_VALIDATE_PARTITION_FROM_DEV 19
> +#define QAIC_TRANS_VALIDATE_PARTITION_TO_DEV   20
> +
> +/**
> + * struct qaic_manage_trans_hdr - Header for a transaction in a manage m=
essage.
> + * @type: In. Identifies this transaction. See QAIC_TRANS_* defines.
> + * @len: In. Length of this transaction, including this header.
> + */
> +struct qaic_manage_trans_hdr {
> +       __u32 type;
> +       __u32 len;
> +};
> +
> +/**
> + * struct qaic_manage_trans_passthrough - Defines a passthrough transact=
ion.
> + * @hdr: In. Header to identify this transaction.
> + * @data: In. Payload of this ransaction. Opaque to the driver. Userspac=
e must
> + *       encode in little endian and align/pad to 64-bit.
> + */
> +struct qaic_manage_trans_passthrough {
> +       struct qaic_manage_trans_hdr hdr;
> +       __u8 data[];
> +};
> +
> +/**
> + * struct qaic_manage_trans_dma_xfer - Defines a DMA transfer transactio=
n.
> + * @hdr: In. Header to identify this transaction.
> + * @tag: In. Identified this transfer in other transactions. Opaque to t=
he
> + *      driver.
> + * @pad: Structure padding.
> + * @addr: In. Address of the data to DMA to the device.
> + * @size: In. Length of the data to DMA to the device.
> + */
> +struct qaic_manage_trans_dma_xfer {
> +       struct qaic_manage_trans_hdr hdr;
> +       __u32 tag;
> +       __u32 pad;
> +       __u64 addr;
> +       __u64 size;
> +};
> +
> +/**
> + * struct qaic_manage_trans_activate_to_dev - Defines an activate reques=
t.
> + * @hdr: In. Header to identify this transaction.
> + * @queue_size: In. Number of elements for DBC request and response queu=
es.
> + * @eventfd: Unused.
> + * @options: In. Device specific options for this activate.
> + * @pad: Structure padding.  Must be 0.
> + */
> +struct qaic_manage_trans_activate_to_dev {
> +       struct qaic_manage_trans_hdr hdr;
> +       __u32 queue_size;
> +       __u32 eventfd;
> +       __u32 options;
> +       __u32 pad;
> +};
> +
> +/**
> + * struct qaic_manage_trans_activate_from_dev - Defines an activate resp=
onse.
> + * @hdr: Out. Header to identify this transaction.
> + * @status: Out. Return code of the request from the device.
> + * @dbc_id: Out. Id of the assigned DBC for successful request.
> + * @options: Out. Device specific options for this activate.
> + */
> +struct qaic_manage_trans_activate_from_dev {
> +       struct qaic_manage_trans_hdr hdr;
> +       __u32 status;
> +       __u32 dbc_id;
> +       __u64 options;
> +};
> +
> +/**
> + * struct qaic_manage_trans_deactivate - Defines a deactivate request.
> + * @hdr: In. Header to identify this transaction.
> + * @dbc_id: In. Id of assigned DBC.
> + * @pad: Structure padding.  Must be 0.
> + */
> +struct qaic_manage_trans_deactivate {
> +       struct qaic_manage_trans_hdr hdr;
> +       __u32 dbc_id;
> +       __u32 pad;
> +};
> +
> +/**
> + * struct qaic_manage_trans_status_to_dev - Defines a status request.
> + * @hdr: In. Header to identify this transaction.
> + */
> +struct qaic_manage_trans_status_to_dev {
> +       struct qaic_manage_trans_hdr hdr;
> +};
> +
> +/**
> + * struct qaic_manage_trans_status_from_dev - Defines a status response.
> + * @hdr: Out. Header to identify this transaction.
> + * @major: Out. NNC protocol version major number.
> + * @minor: Out. NNC protocol version minor number.
> + * @status: Out. Return code from device.
> + * @status_flags: Out. Flags from device.  Bit 0 indicates if CRCs are r=
equired.
> + */
> +struct qaic_manage_trans_status_from_dev {
> +       struct qaic_manage_trans_hdr hdr;
> +       __u16 major;
> +       __u16 minor;
> +       __u32 status;
> +       __u64 status_flags;
> +};
> +
> +/**
> + * struct qaic_manage_msg - Defines a message to the device.
> + * @len: In. Length of all the transactions contained within this messag=
e.
> + * @count: In. Number of transactions in this message.
> + * @data: In. Address to an array where the transactions can be found.
> + */
> +struct qaic_manage_msg {
> +       __u32 len;
> +       __u32 count;
> +       __u64 data;
> +};
> +
> +/**
> + * struct qaic_create_bo - Defines a request to create a buffer object.
> + * @size: In.  Size of the buffer in bytes.
> + * @handle: Out. GEM handle for the BO.
> + * @pad: Structure padding. Must be 0.
> + */
> +struct qaic_create_bo {
> +       __u64 size;
> +       __u32 handle;
> +       __u32 pad;
> +};
> +
> +/**
> + * struct qaic_mmap_bo - Defines a request to prepare a BO for mmap().
> + * @handle: In.  Handle of the GEM BO to prepare for mmap().
> + * @pad: Structure padding. Must be 0.
> + * @offset: Out. Offset value to provide to mmap().
> + */
> +struct qaic_mmap_bo {
> +       __u32 handle;
> +       __u32 pad;
> +       __u64 offset;
> +};
> +
> +/**
> + * struct qaic_sem - Defines a semaphore command for a BO slice.
> + * @val: In. Only lower 12 bits are valid.
> + * @index: In. Only lower 5 bits are valid.
> + * @presync: In. 1 if presync operation, 0 if postsync.
> + * @cmd: In. One of QAIC_SEM_*.
> + * @flags: In. Bitfield. See QAIC_SEM_INSYNCFENCE and QAIC_SEM_OUTSYNCFE=
NCE
> + * @pad: Structure padding.  Must be 0.
> + */
> +struct qaic_sem {
> +       __u16 val;
> +       __u8  index;
> +       __u8  presync;
> +       __u8  cmd;
> +       __u8  flags;
> +       __u16 pad;
> +};
> +
> +/**
> + * struct qaic_attach_slice_entry - Defines a single BO slice.
> + * @size: In. Size of this slice in bytes.
> + * @sem0: In. Semaphore command 0. Must be 0 is not valid.
> + * @sem1: In. Semaphore command 1. Must be 0 is not valid.
> + * @sem2: In. Semaphore command 2. Must be 0 is not valid.
> + * @sem3: In. Semaphore command 3. Must be 0 is not valid.
> + * @dev_addr: In. Device address this slice pushes to or pulls from.
> + * @db_addr: In. Address of the doorbell to ring.
> + * @db_data: In. Data to write to the doorbell.
> + * @db_len: In. Size of the doorbell data in bits - 32, 16, or 8.  0 is =
for
> + *         inactive doorbells.
> + * @offset: In. Start of this slice as an offset from the start of the B=
O.
> + */
> +struct qaic_attach_slice_entry {
> +       __u64 size;
> +       struct qaic_sem sem0;
> +       struct qaic_sem sem1;
> +       struct qaic_sem sem2;
> +       struct qaic_sem sem3;
> +       __u64 dev_addr;
> +       __u64 db_addr;
> +       __u32 db_data;
> +       __u32 db_len;
> +       __u64 offset;
> +};
> +
> +/**
> + * struct qaic_attach_slice_hdr - Defines metadata for a set of BO slice=
s.
> + * @count: In. Number of slices for this BO.
> + * @dbc_id: In. Associate the sliced BO with this DBC.
> + * @handle: In. GEM handle of the BO to slice.
> + * @dir: In. Direction of data flow. 1 =3D DMA_TO_DEVICE, 2 =3D DMA_FROM=
_DEVICE
> + * @size: In. Total length of the BO.
> + *       If BO is imported (DMABUF/PRIME) then this size
> + *       should not exceed the size of DMABUF provided.
> + *       If BO is allocated using DRM_IOCTL_QAIC_CREATE_BO
> + *       then this size should be exactly same as the size
> + *       provided during DRM_IOCTL_QAIC_CREATE_BO.
> + * @dev_addr: In. Device address this slice pushes to or pulls from.
> + * @db_addr: In. Address of the doorbell to ring.
> + * @db_data: In. Data to write to the doorbell.
> + * @db_len: In. Size of the doorbell data in bits - 32, 16, or 8.  0 is =
for
> + *         inactive doorbells.
> + * @offset: In. Start of this slice as an offset from the start of the B=
O.
> + */
> +struct qaic_attach_slice_hdr {
> +       __u32 count;
> +       __u32 dbc_id;
> +       __u32 handle;
> +       __u32 dir;
> +       __u64 size;
> +};
> +
> +/**
> + * struct qaic_attach_slice - Defines a set of BO slices.
> + * @hdr: In. Metadata of the set of slices.
> + * @data: In. Pointer to an array containing the slice definitions.
> + */
> +struct qaic_attach_slice {
> +       struct qaic_attach_slice_hdr hdr;
> +       __u64 data;
> +};
> +
> +/**
> + * struct qaic_execute_entry - Defines a BO to submit to the device.
> + * @handle: In. GEM handle of the BO to commit to the device.
> + * @dir: In. Direction of data. 1 =3D to device, 2 =3D from device.
> + */
> +struct qaic_execute_entry {
> +       __u32 handle;
> +       __u32 dir;
> +};
> +
> +/**
> + * struct qaic_partial_execute_entry - Defines a BO to resize and submit=
.
> + * @handle: In. GEM handle of the BO to commit to the device.
> + * @dir: In. Direction of data. 1 =3D to device, 2 =3D from device.
> + * @resize: In. New size of the BO.  Must be <=3D the original BO size. =
 0 is
> + *         short for no resize.
> + */
> +struct qaic_partial_execute_entry {
> +       __u32 handle;
> +       __u32 dir;
> +       __u64 resize;
> +};
> +
> +/**
> + * struct qaic_execute_hdr - Defines metadata for BO submission.
> + * @count: In. Number of BOs to submit.
> + * @dbc_id: In. DBC to submit the BOs on.
> + */
> +struct qaic_execute_hdr {
> +       __u32 count;
> +       __u32 dbc_id;
> +};
> +
> +/**
> + * struct qaic_execute - Defines a list of BOs to submit to the device.
> + * @hdr: In. BO list metadata.
> + * @data: In. Pointer to an array of BOs to submit.
> + */
> +struct qaic_execute {
> +       struct qaic_execute_hdr hdr;
> +       __u64 data;
> +};
> +
> +/**
> + * struct qaic_wait - Defines a blocking wait for BO execution.
> + * @handle: In. GEM handle of the BO to wait on.
> + * @timeout: In. Maximum time in ms to wait for the BO.
> + * @dbc_id: In. DBC the BO is submitted to.
> + * @pad: Structure padding. Must be 0.
> + */
> +struct qaic_wait {
> +       __u32 handle;
> +       __u32 timeout;
> +       __u32 dbc_id;
> +       __u32 pad;
> +};
> +
> +/**
> + * struct qaic_perf_stats_hdr - Defines metadata for getting BO perf inf=
o.
> + * @count: In. Number of BOs requested.
> + * @pad: Structure padding. Must be 0.
> + * @dbc_id: In. DBC the BO are associated with.
> + */
> +struct qaic_perf_stats_hdr {
> +       __u16 count;
> +       __u16 pad;
> +       __u32 dbc_id;
> +};
> +
> +/**
> + * struct qaic_perf_stats - Defines a request for getting BO perf info.
> + * @hdr: In. Request metadata
> + * @data: In. Pointer to array of stats structures that will receive the=
 data.
> + */
> +struct qaic_perf_stats {
> +       struct qaic_perf_stats_hdr hdr;
> +       __u64 data;
> +};
> +
> +/**
> + * struct qaic_perf_stats_entry - Defines a BO perf info.
> + * @handle: In. GEM handle of the BO to get perf stats for.
> + * @queue_level_before: Out. Number of elements in the queue before this=
 BO
> + *                     was submitted.
> + * @num_queue_element: Out. Number of elements added to the queue to sub=
mit
> + *                    this BO.
> + * @submit_latency_us: Out. Time taken by the driver to submit this BO.
> + * @device_latency_us: Out. Time taken by the device to execute this BO.
> + * @pad: Structure padding. Must be 0.
> + */
> +struct qaic_perf_stats_entry {
> +       __u32 handle;
> +       __u32 queue_level_before;
> +       __u32 num_queue_element;
> +       __u32 submit_latency_us;
> +       __u32 device_latency_us;
> +       __u32 pad;
> +};
> +
> +#define DRM_QAIC_MANAGE                                0x00
> +#define DRM_QAIC_CREATE_BO                     0x01
> +#define DRM_QAIC_MMAP_BO                       0x02
> +#define DRM_QAIC_ATTACH_SLICE_BO               0x03
> +#define DRM_QAIC_EXECUTE_BO                    0x04
> +#define DRM_QAIC_PARTIAL_EXECUTE_BO            0x05
> +#define DRM_QAIC_WAIT_BO                       0x06
> +#define DRM_QAIC_PERF_STATS_BO                 0x07
> +
> +#define DRM_IOCTL_QAIC_MANAGE                  DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_QAIC_MANAGE, struct qaic_manage_msg)
> +#define DRM_IOCTL_QAIC_CREATE_BO               DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_QAIC_CREATE_BO, struct qaic_create_bo)
> +#define DRM_IOCTL_QAIC_MMAP_BO                 DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_QAIC_MMAP_BO, struct qaic_mmap_bo)
> +#define DRM_IOCTL_QAIC_ATTACH_SLICE_BO         DRM_IOW(DRM_COMMAND_BASE =
+ DRM_QAIC_ATTACH_SLICE_BO, struct qaic_attach_slice)
> +#define DRM_IOCTL_QAIC_EXECUTE_BO              DRM_IOW(DRM_COMMAND_BASE =
+ DRM_QAIC_EXECUTE_BO, struct qaic_execute)
> +#define DRM_IOCTL_QAIC_PARTIAL_EXECUTE_BO      DRM_IOW(DRM_COMMAND_BASE =
+ DRM_QAIC_PARTIAL_EXECUTE_BO, struct qaic_execute)
> +#define DRM_IOCTL_QAIC_WAIT_BO                 DRM_IOW(DRM_COMMAND_BASE =
+ DRM_QAIC_WAIT_BO, struct qaic_wait)
> +#define DRM_IOCTL_QAIC_PERF_STATS_BO           DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_QAIC_PERF_STATS_BO, struct qaic_perf_stats)
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* QAIC_ACCEL_H_ */
> --
> 2.7.4
>
