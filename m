Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C594C652
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 23:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3928110E81E;
	Thu,  8 Aug 2024 21:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gfKqHwKh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04C110E81E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 21:34:13 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7b0c9bbddb4so1002449a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723152853; x=1723757653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bi2l9ZFKRFytgKs/AecZXtAhNQp8P2yO3BKf9q+herA=;
 b=gfKqHwKhS2mTQSsZAYzkui0frsMo3B+NBRsTlhzDpB+HXgW8fk/pCYnrdRBqRPrOLr
 AemjIV/oa2v51YUr1Qv4on24CstMGhtAGgTfcl5jqNr0+Eba/tOJzrf3npVs0yYiNytH
 I4xU7Iz2B07d+l2D5ZaZgUdq57E8OcL3Ew6OWY0/tppD1jsIeopCmaXCT9aff+utjZs8
 cYbfI1WPf9KAcyeqs96LSAbWTbeqK2H0Z+QGoZ26aOmZAd0vgvrT2z1KoPR2EF/YSC+Z
 L0yp//cBiho+tvpETwvpqZmW2tC2KmPHERviH/Nd/c+fjZKmj9StIs10JDLkxNP/RpXW
 rtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723152853; x=1723757653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bi2l9ZFKRFytgKs/AecZXtAhNQp8P2yO3BKf9q+herA=;
 b=KSzrjwqYFP13EFm9wH99q92OKTO6O4EKiiGKLu00dgKrrAvuoCoOJrfqyIAp9jgJxw
 oPeTpFtXZb3eZJKfm1oVdmVsf64pQg+VwuMJ6TdaLr4qTEC5DNgXpXRSSAvr51Lr8+TK
 T/6Ohkz07yhHVarGECUdKlVl0HWLSJTPdVsY31BdZDtoYd2tyl40c0Cl6ekLEYTjZ4vY
 rINJGWpdfDGqRoShs9PGeHZWQ6zBwzsezOFSDR//DOcGKJAOrDupurcYQcZC8tCQp1vE
 9L9fj4+cYz32OQsn+/Dccr5C16FT/4xNkNdHe4UYU6qW4xfRx+LcD2eFPhdz/PgQo5im
 Jl6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg8CgQRZr9rMyPgFoCSY7qPOccBx6grrOY7NJ5wjUQdECLs+plNegOf7KzR7HCKBE/Lob73K+NJOPYJ9nbPv9OcJugUAa5FMT3a55vutF2
X-Gm-Message-State: AOJu0YwxjpHslG26X4U9nhcKCr8fc0lxGdDggvZjkFsbzERNhsvxn6rb
 PcxysnmBPVKnVGssot5QIzQPlKVgF1temfhxoHJUOI44CJ2NKO/v5lM2RYolxI5YCCAeB3d9INa
 ywpoDnX8tzLa50kUHzcd4F3rXQco=
X-Google-Smtp-Source: AGHT+IGJ3BUUUe4ed/x8+zwa30Oh+hyE0qurV1Dt5v2Md1ZxEXYynGXFHXXlPFqhXoSHCJOtSlVBQ4LBS8UkGXcW3s0=
X-Received: by 2002:a17:90a:ac8:b0:2c9:6f5e:f5c1 with SMTP id
 98e67ed59e1d1-2d1c33a3c59mr3965804a91.10.1723152852988; Thu, 08 Aug 2024
 14:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-5-lizhi.hou@amd.com>
In-Reply-To: <20240805173959.3181199-5-lizhi.hou@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Aug 2024 17:34:00 -0400
Message-ID: <CADnq5_NjrhE2z1+gvYmYqa36QHhjvVR9d=iCDOzVNMKODQ7c9w@mail.gmail.com>
Subject: Re: [PATCH V2 04/10] accel/amdxdna: Add hardware context
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com, 
 sonal.santan@amd.com, king.tam@amd.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 5, 2024 at 1:50=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wrote:
>
> The hardware can be shared among multiple user applications. The
> hardware resources are allocated/freed based on the request from
> user application via driver IOCTLs.
>
> DRM_IOCTL_AMDXDNA_CREATE_HWCTX
> Allocate tile columns and create a hardware context structure to track th=
e
> usage and status of the resources. A hardware context ID is returned for
> XDNA command execution.
>
> DRM_IOCTL_AMDXDNA_DESTROY_HWCTX
> Release hardware context based on its ID. The tile columns belong to
> this hardware context will be reclaimed.
>
> DRM_IOCTL_AMDXDNA_CONFIG_HWCTX
> Config hardware context. Bind the hardware context to the required
> resources.
>
> Co-developed-by: Min Ma <min.ma@amd.com>
> Signed-off-by: Min Ma <min.ma@amd.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/amdxdna/Makefile          |   2 +
>  drivers/accel/amdxdna/aie2_ctx.c        | 178 ++++++++++++++++++++
>  drivers/accel/amdxdna/aie2_message.c    |  87 ++++++++++
>  drivers/accel/amdxdna/aie2_pci.c        |  41 +++++
>  drivers/accel/amdxdna/aie2_pci.h        |  12 ++
>  drivers/accel/amdxdna/amdxdna_ctx.c     | 210 ++++++++++++++++++++++++
>  drivers/accel/amdxdna/amdxdna_ctx.h     |  41 +++++
>  drivers/accel/amdxdna/amdxdna_drm.c     | 107 +++++++++++-
>  drivers/accel/amdxdna/amdxdna_drm.h     |  21 +++
>  drivers/accel/amdxdna/amdxdna_pci_drv.c |  15 ++
>  include/uapi/drm/amdxdna_accel.h        | 128 +++++++++++++++
>  11 files changed, 841 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
>  create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
>  create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
>
> diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makef=
ile
> index b44de7fe0c9e..9cf90e92564d 100644
> --- a/drivers/accel/amdxdna/Makefile
> +++ b/drivers/accel/amdxdna/Makefile
> @@ -1,11 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  amdxdna-y :=3D \
> +       aie2_ctx.o \
>         aie2_message.o \
>         aie2_pci.o \
>         aie2_psp.o \
>         aie2_smu.o \
>         aie2_solver.o \
> +       amdxdna_ctx.o \
>         amdxdna_drm.o \
>         amdxdna_mailbox.o \
>         amdxdna_mailbox_helper.o \
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie=
2_ctx.c
> new file mode 100644
> index 000000000000..2cfcf9d571f6
> --- /dev/null
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> + */
> +
> +#include "aie2_pci.h"
> +#include "aie2_solver.h"
> +
> +static int aie2_hwctx_col_list(struct amdxdna_hwctx *hwctx)
> +{
> +       struct amdxdna_dev *xdna =3D hwctx->client->xdna;
> +       struct amdxdna_dev_hdl *ndev;
> +       int start, end, first, last;
> +       u32 width =3D 1, entries =3D 0;
> +       int i;
> +
> +       if (!hwctx->num_tiles) {
> +               XDNA_ERR(xdna, "Number of tiles is zero");
> +               return -EINVAL;
> +       }
> +
> +       ndev =3D xdna->dev_handle;
> +       if (unlikely(!ndev->metadata.core.row_count)) {
> +               XDNA_WARN(xdna, "Core tile row count is zero");
> +               return -EINVAL;
> +       }
> +
> +       hwctx->num_col =3D hwctx->num_tiles / ndev->metadata.core.row_cou=
nt;
> +       if (!hwctx->num_col || hwctx->num_col > ndev->total_col) {
> +               XDNA_ERR(xdna, "Invalid num_col %d", hwctx->num_col);
> +               return -EINVAL;
> +       }
> +
> +       if (ndev->priv->col_align =3D=3D COL_ALIGN_NATURE)
> +               width =3D hwctx->num_col;
> +
> +       /*
> +        * In range [start, end], find out columns that is multiple of wi=
dth.
> +        *      'first' is the first column,
> +        *      'last' is the last column,
> +        *      'entries' is the total number of columns.
> +        */
> +       start =3D  xdna->dev_info->first_col;
> +       end =3D  ndev->total_col - hwctx->num_col;
> +       if (start > 0 && end =3D=3D 0) {
> +               XDNA_DBG(xdna, "Force start from col 0");
> +               start =3D 0;
> +       }
> +       first =3D start + (width - start % width) % width;
> +       last =3D end - end % width;
> +       if (last >=3D first)
> +               entries =3D (last - first) / width + 1;
> +       XDNA_DBG(xdna, "start %d end %d first %d last %d",
> +                start, end, first, last);
> +
> +       if (unlikely(!entries)) {
> +               XDNA_ERR(xdna, "Start %d end %d width %d",
> +                        start, end, width);
> +               return -EINVAL;
> +       }
> +
> +       hwctx->col_list =3D kmalloc_array(entries, sizeof(*hwctx->col_lis=
t), GFP_KERNEL);
> +       if (!hwctx->col_list)
> +               return -ENOMEM;
> +
> +       hwctx->col_list_len =3D entries;
> +       hwctx->col_list[0] =3D first;
> +       for (i =3D 1; i < entries; i++)
> +               hwctx->col_list[i] =3D hwctx->col_list[i - 1] + width;
> +
> +       print_hex_dump_debug("col_list: ", DUMP_PREFIX_OFFSET, 16, 4, hwc=
tx->col_list,
> +                            entries * sizeof(*hwctx->col_list), false);
> +       return 0;
> +}
> +
> +static int aie2_alloc_resource(struct amdxdna_hwctx *hwctx)
> +{
> +       struct amdxdna_dev *xdna =3D hwctx->client->xdna;
> +       struct alloc_requests *xrs_req;
> +       int ret;
> +
> +       xrs_req =3D kzalloc(sizeof(*xrs_req), GFP_KERNEL);
> +       if (!xrs_req)
> +               return -ENOMEM;
> +
> +       xrs_req->cdo.start_cols =3D hwctx->col_list;
> +       xrs_req->cdo.cols_len =3D hwctx->col_list_len;
> +       xrs_req->cdo.ncols =3D hwctx->num_col;
> +       xrs_req->cdo.qos_cap.opc =3D hwctx->max_opc;
> +
> +       xrs_req->rqos.gops =3D hwctx->qos.gops;
> +       xrs_req->rqos.fps =3D hwctx->qos.fps;
> +       xrs_req->rqos.dma_bw =3D hwctx->qos.dma_bandwidth;
> +       xrs_req->rqos.latency =3D hwctx->qos.latency;
> +       xrs_req->rqos.exec_time =3D hwctx->qos.frame_exec_time;
> +       xrs_req->rqos.priority =3D hwctx->qos.priority;
> +
> +       xrs_req->rid =3D (uintptr_t)hwctx;
> +
> +       ret =3D xrs_allocate_resource(xdna->xrs_hdl, xrs_req, hwctx);
> +       if (ret)
> +               XDNA_ERR(xdna, "Allocate AIE resource failed, ret %d", re=
t);
> +
> +       kfree(xrs_req);
> +       return ret;
> +}
> +
> +static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
> +{
> +       struct amdxdna_dev *xdna =3D hwctx->client->xdna;
> +       int ret;
> +
> +       ret =3D xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
> +       if (ret)
> +               XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret=
);
> +}
> +
> +int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
> +{
> +       struct amdxdna_client *client =3D hwctx->client;
> +       struct amdxdna_dev *xdna =3D client->xdna;
> +       struct amdxdna_hwctx_priv *priv;
> +       int ret;
> +
> +       priv =3D kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +       hwctx->priv =3D priv;
> +
> +       ret =3D aie2_hwctx_col_list(hwctx);
> +       if (ret) {
> +               XDNA_ERR(xdna, "Create col list failed, ret %d", ret);
> +               goto free_priv;
> +       }
> +
> +       ret =3D aie2_alloc_resource(hwctx);
> +       if (ret) {
> +               XDNA_ERR(xdna, "Alloc hw resource failed, ret %d", ret);
> +               goto free_col_list;
> +       }
> +
> +       hwctx->status =3D HWCTX_STAT_INIT;
> +
> +       XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
> +
> +       return 0;
> +
> +free_col_list:
> +       kfree(hwctx->col_list);
> +free_priv:
> +       kfree(priv);
> +       return ret;
> +}
> +
> +void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
> +{
> +       aie2_release_resource(hwctx);
> +
> +       kfree(hwctx->col_list);
> +       kfree(hwctx->priv);
> +       kfree(hwctx->cus);
> +}
> +
> +int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, =
void *buf, u32 size)
> +{
> +       struct amdxdna_dev *xdna =3D hwctx->client->xdna;
> +
> +       drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> +       switch (type) {
> +       case DRM_AMDXDNA_HWCTX_CONFIG_CU:
> +       case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
> +       case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
> +               return -EOPNOTSUPP;
> +       default:
> +               XDNA_DBG(xdna, "Not supported type %d", type);
> +               return -EOPNOTSUPP;
> +       }
> +}
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna=
/aie2_message.c
> index 71df005b7408..54fb0f68587a 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -185,3 +185,90 @@ int aie2_query_firmware_version(struct amdxdna_dev_h=
dl *ndev,
>
>         return 0;
>  }
> +
> +int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwc=
tx *hwctx)
> +{
> +       DECLARE_AIE2_MSG(create_ctx, MSG_OP_CREATE_CONTEXT);
> +       struct amdxdna_dev *xdna =3D ndev->xdna;
> +       struct xdna_mailbox_chann_res x2i;
> +       struct xdna_mailbox_chann_res i2x;
> +       struct cq_pair *cq_pair;
> +       u32 intr_reg;
> +       int ret;
> +
> +       req.aie_type =3D 1;
> +       req.start_col =3D hwctx->start_col;
> +       req.num_col =3D hwctx->num_col;
> +       req.num_cq_pairs_requested =3D 1;
> +       req.pasid =3D hwctx->client->pasid;
> +       req.context_priority =3D 2;
> +
> +       ret =3D aie2_send_mgmt_msg_wait(ndev, &msg);
> +       if (ret)
> +               return ret;
> +
> +       hwctx->fw_ctx_id =3D resp.context_id;
> +       WARN_ONCE(hwctx->fw_ctx_id =3D=3D -1, "Unexpected context id");
> +
> +       cq_pair =3D &resp.cq_pair[0];
> +       x2i.mb_head_ptr_reg =3D AIE2_MBOX_OFF(ndev, cq_pair->x2i_q.head_a=
ddr);
> +       x2i.mb_tail_ptr_reg =3D AIE2_MBOX_OFF(ndev, cq_pair->x2i_q.tail_a=
ddr);
> +       x2i.rb_start_addr   =3D AIE2_SRAM_OFF(ndev, cq_pair->x2i_q.buf_ad=
dr);
> +       x2i.rb_size         =3D cq_pair->x2i_q.buf_size;
> +
> +       i2x.mb_head_ptr_reg =3D AIE2_MBOX_OFF(ndev, cq_pair->i2x_q.head_a=
ddr);
> +       i2x.mb_tail_ptr_reg =3D AIE2_MBOX_OFF(ndev, cq_pair->i2x_q.tail_a=
ddr);
> +       i2x.rb_start_addr   =3D AIE2_SRAM_OFF(ndev, cq_pair->i2x_q.buf_ad=
dr);
> +       i2x.rb_size         =3D cq_pair->i2x_q.buf_size;
> +
> +       ret =3D pci_irq_vector(to_pci_dev(xdna->ddev.dev), resp.msix_id);
> +       if (ret =3D=3D -EINVAL) {
> +               XDNA_ERR(xdna, "not able to create channel");
> +               goto out_destroy_context;
> +       }
> +
> +       intr_reg =3D i2x.mb_head_ptr_reg + 4;
> +       hwctx->priv->mbox_chann =3D xdna_mailbox_create_channel(ndev->mbo=
x, &x2i, &i2x,
> +                                                             intr_reg, r=
et);
> +       if (!hwctx->priv->mbox_chann) {
> +               XDNA_ERR(xdna, "not able to create channel");
> +               ret =3D -EINVAL;
> +               goto out_destroy_context;
> +       }
> +
> +       XDNA_DBG(xdna, "%s mailbox channel irq: %d, msix_id: %d",
> +                hwctx->name, ret, resp.msix_id);
> +       XDNA_DBG(xdna, "%s created fw ctx %d pasid %d", hwctx->name,
> +                hwctx->fw_ctx_id, hwctx->client->pasid);
> +
> +       return 0;
> +
> +out_destroy_context:
> +       aie2_destroy_context(ndev, hwctx);
> +       return ret;
> +}
> +
> +int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hw=
ctx *hwctx)
> +{
> +       DECLARE_AIE2_MSG(destroy_ctx, MSG_OP_DESTROY_CONTEXT);
> +       struct amdxdna_dev *xdna =3D ndev->xdna;
> +       int ret;
> +
> +       if (hwctx->fw_ctx_id =3D=3D -1)
> +               return 0;
> +
> +       xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
> +
> +       req.context_id =3D hwctx->fw_ctx_id;
> +       ret =3D aie2_send_mgmt_msg_wait(ndev, &msg);
> +       if (ret)
> +               XDNA_WARN(xdna, "%s destroy context failed, ret %d", hwct=
x->name, ret);
> +
> +       xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
> +       XDNA_DBG(xdna, "%s destroyed fw ctx %d", hwctx->name,
> +                hwctx->fw_ctx_id);
> +       hwctx->priv->mbox_chann =3D NULL;
> +       hwctx->fw_ctx_id =3D -1;
> +
> +       return ret;
> +}
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie=
2_pci.c
> index 8fb7ecbf35c1..f60934ae21e0 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -204,6 +204,43 @@ static void aie2_mgmt_fw_fini(struct amdxdna_dev_hdl=
 *ndev)
>         XDNA_DBG(ndev->xdna, "Firmware suspended");
>  }
>
> +static int aie2_xrs_load(void *cb_arg, struct xrs_action_load *action)
> +{
> +       struct amdxdna_hwctx *hwctx =3D cb_arg;
> +       struct amdxdna_dev *xdna;
> +       int ret;
> +
> +       xdna =3D hwctx->client->xdna;
> +
> +       hwctx->start_col =3D action->part.start_col;
> +       hwctx->num_col =3D action->part.ncols;
> +       ret =3D aie2_create_context(xdna->dev_handle, hwctx);
> +       if (ret)
> +               XDNA_ERR(xdna, "create context failed, ret %d", ret);
> +
> +       return ret;
> +}
> +
> +static int aie2_xrs_unload(void *cb_arg)
> +{
> +       struct amdxdna_hwctx *hwctx =3D cb_arg;
> +       struct amdxdna_dev *xdna;
> +       int ret;
> +
> +       xdna =3D hwctx->client->xdna;
> +
> +       ret =3D aie2_destroy_context(xdna->dev_handle, hwctx);
> +       if (ret)
> +               XDNA_ERR(xdna, "destroy context failed, ret %d", ret);
> +
> +       return ret;
> +}
> +
> +static struct xrs_action_ops aie2_xrs_actions =3D {
> +       .load =3D aie2_xrs_load,
> +       .unload =3D aie2_xrs_unload,
> +};
> +
>  static void aie2_hw_stop(struct amdxdna_dev *xdna)
>  {
>         struct pci_dev *pdev =3D to_pci_dev(xdna->ddev.dev);
> @@ -416,6 +453,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
>         xrs_cfg.clk_list.cu_clk_list[2] =3D 1000;
>         xrs_cfg.sys_eff_factor =3D 1;
>         xrs_cfg.dev =3D xdna->ddev.dev;
> +       xrs_cfg.actions =3D &aie2_xrs_actions;
>         xrs_cfg.total_col =3D ndev->total_col;
>
>         xdna->xrs_hdl =3D xrsm_init(&xrs_cfg);
> @@ -452,4 +490,7 @@ static void aie2_fini(struct amdxdna_dev *xdna)
>  const struct amdxdna_dev_ops aie2_ops =3D {
>         .init           =3D aie2_init,
>         .fini           =3D aie2_fini,
> +       .hwctx_init     =3D aie2_hwctx_init,
> +       .hwctx_fini     =3D aie2_hwctx_fini,
> +       .hwctx_config   =3D aie2_hwctx_config,
>  };
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie=
2_pci.h
> index a6b734f24955..818fc52dabbf 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -128,6 +128,10 @@ struct rt_config {
>         u32     value;
>  };
>
> +struct amdxdna_hwctx_priv {
> +       void                            *mbox_chann;
> +};
> +
>  struct amdxdna_dev_hdl {
>         struct amdxdna_dev              *xdna;
>         const struct amdxdna_dev_priv   *priv;
> @@ -200,4 +204,12 @@ int aie2_query_aie_version(struct amdxdna_dev_hdl *n=
dev, struct aie_version *ver
>  int aie2_query_aie_metadata(struct amdxdna_dev_hdl *ndev, struct aie_met=
adata *metadata);
>  int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
>                                 struct amdxdna_fw_ver *fw_ver);
> +int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwc=
tx *hwctx);
> +int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hw=
ctx *hwctx);
> +
> +/* aie2_hwctx.c */
> +int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
> +void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
> +int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, =
void *buf, u32 size);
> +
>  #endif /* _AIE2_PCI_H_ */
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/=
amdxdna_ctx.c
> new file mode 100644
> index 000000000000..3daf7065acf4
> --- /dev/null
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
> + */
> +#include "amdxdna_drm.h"
> +
> +#define MAX_HWCTX_ID           255
> +
> +static void amdxdna_hwctx_destroy(struct amdxdna_hwctx *hwctx)
> +{
> +       struct amdxdna_dev *xdna =3D hwctx->client->xdna;
> +
> +       /* At this point, user is not able to submit new commands */
> +       mutex_lock(&xdna->dev_lock);
> +       xdna->dev_info->ops->hwctx_fini(hwctx);
> +       mutex_unlock(&xdna->dev_lock);
> +
> +       kfree(hwctx->name);
> +       kfree(hwctx);
> +}
> +
> +/*
> + * This should be called in close() and remove(). DO NOT call in other s=
yscalls.
> + * This guarantee that when hwctx and resources will be released, if use=
r
> + * doesn't call amdxdna_drm_destroy_hwctx_ioctl.
> + */
> +void amdxdna_hwctx_remove_all(struct amdxdna_client *client)
> +{
> +       struct amdxdna_hwctx *hwctx;
> +       int next =3D 0;
> +
> +       mutex_lock(&client->hwctx_lock);
> +       idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
> +               XDNA_DBG(client->xdna, "PID %d close HW context %d",
> +                        client->pid, hwctx->id);
> +               idr_remove(&client->hwctx_idr, hwctx->id);
> +               mutex_unlock(&client->hwctx_lock);
> +               amdxdna_hwctx_destroy(hwctx);
> +               mutex_lock(&client->hwctx_lock);
> +       }
> +       mutex_unlock(&client->hwctx_lock);
> +}
> +
> +int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, s=
truct drm_file *filp)
> +{
> +       struct amdxdna_client *client =3D filp->driver_priv;
> +       struct amdxdna_drm_create_hwctx *args =3D data;
> +       struct amdxdna_dev *xdna =3D to_xdna_dev(dev);
> +       struct amdxdna_hwctx *hwctx;
> +       int ret, idx;
> +
> +       if (args->ext_flags)
> +               return -EINVAL;
> +
> +       if (!drm_dev_enter(dev, &idx))
> +               return -ENODEV;
> +
> +       hwctx =3D kzalloc(sizeof(*hwctx), GFP_KERNEL);
> +       if (!hwctx) {
> +               ret =3D -ENOMEM;
> +               goto exit;
> +       }
> +
> +       if (copy_from_user(&hwctx->qos, u64_to_user_ptr(args->qos_p), siz=
eof(hwctx->qos))) {
> +               XDNA_ERR(xdna, "Access QoS info failed");
> +               ret =3D -EFAULT;
> +               goto free_hwctx;
> +       }
> +
> +       hwctx->client =3D client;
> +       hwctx->fw_ctx_id =3D -1;
> +       hwctx->num_tiles =3D args->num_tiles;
> +       hwctx->mem_size =3D args->mem_size;
> +       hwctx->max_opc =3D args->max_opc;
> +       mutex_lock(&client->hwctx_lock);
> +       ret =3D idr_alloc_cyclic(&client->hwctx_idr, hwctx, 0, MAX_HWCTX_=
ID, GFP_KERNEL);
> +       if (ret < 0) {
> +               mutex_unlock(&client->hwctx_lock);
> +               XDNA_ERR(xdna, "Allocate hwctx ID failed, ret %d", ret);
> +               goto free_hwctx;
> +       }
> +       hwctx->id =3D ret;
> +       mutex_unlock(&client->hwctx_lock);
> +
> +       hwctx->name =3D kasprintf(GFP_KERNEL, "hwctx.%d.%d", client->pid,=
 hwctx->id);
> +       if (!hwctx->name) {
> +               ret =3D -ENOMEM;
> +               goto rm_id;
> +       }
> +
> +       mutex_lock(&xdna->dev_lock);
> +       ret =3D xdna->dev_info->ops->hwctx_init(hwctx);
> +       if (ret) {
> +               mutex_unlock(&xdna->dev_lock);
> +               XDNA_ERR(xdna, "Init hwctx failed, ret %d", ret);
> +               goto free_name;
> +       }
> +       args->handle =3D hwctx->id;
> +       mutex_unlock(&xdna->dev_lock);
> +
> +       XDNA_DBG(xdna, "PID %d create HW context %d, ret %d", client->pid=
, args->handle, ret);
> +       drm_dev_exit(idx);
> +       return 0;
> +
> +free_name:
> +       kfree(hwctx->name);
> +rm_id:
> +       mutex_lock(&client->hwctx_lock);
> +       idr_remove(&client->hwctx_idr, hwctx->id);
> +       mutex_unlock(&client->hwctx_lock);
> +free_hwctx:
> +       kfree(hwctx);
> +exit:
> +       drm_dev_exit(idx);
> +       return ret;
> +}
> +
> +int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, =
struct drm_file *filp)
> +{
> +       struct amdxdna_client *client =3D filp->driver_priv;
> +       struct amdxdna_drm_destroy_hwctx *args =3D data;
> +       struct amdxdna_dev *xdna =3D to_xdna_dev(dev);
> +       struct amdxdna_hwctx *hwctx;
> +       int ret =3D 0, idx;
> +
> +       if (!drm_dev_enter(dev, &idx))
> +               return -ENODEV;
> +
> +       mutex_lock(&client->hwctx_lock);
> +       hwctx =3D idr_find(&client->hwctx_idr, args->handle);
> +       if (!hwctx) {
> +               mutex_unlock(&client->hwctx_lock);
> +               ret =3D -EINVAL;
> +               XDNA_DBG(xdna, "PID %d HW context %d not exist",
> +                        client->pid, args->handle);
> +               goto out;
> +       }
> +       idr_remove(&client->hwctx_idr, hwctx->id);
> +       mutex_unlock(&client->hwctx_lock);
> +
> +       amdxdna_hwctx_destroy(hwctx);
> +
> +       XDNA_DBG(xdna, "PID %d destroyed HW context %d", client->pid, arg=
s->handle);
> +out:
> +       drm_dev_exit(idx);
> +       return ret;
> +}
> +
> +int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, s=
truct drm_file *filp)
> +{
> +       struct amdxdna_client *client =3D filp->driver_priv;
> +       struct amdxdna_drm_config_hwctx *args =3D data;
> +       struct amdxdna_dev *xdna =3D to_xdna_dev(dev);
> +       struct amdxdna_hwctx *hwctx;
> +       u32 buf_size;
> +       void *buf;
> +       u64 val;
> +       int ret;
> +
> +       if (!xdna->dev_info->ops->hwctx_config)
> +               return -EOPNOTSUPP;
> +
> +       val =3D args->param_val;
> +       buf_size =3D args->param_val_size;
> +
> +       switch (args->param_type) {
> +       case DRM_AMDXDNA_HWCTX_CONFIG_CU:
> +               /* For those types that param_val is pointer */
> +               if (buf_size > PAGE_SIZE) {
> +                       XDNA_ERR(xdna, "Config CU param buffer too large"=
);
> +                       return -E2BIG;
> +               }
> +
> +               /* Hwctx needs to keep buf */
> +               buf =3D kzalloc(PAGE_SIZE, GFP_KERNEL);
> +               if (!buf)
> +                       return -ENOMEM;
> +
> +               if (copy_from_user(buf, u64_to_user_ptr(val), buf_size)) =
{
> +                       kfree(buf);
> +                       return -EFAULT;
> +               }
> +
> +               break;
> +       case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
> +       case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
> +               /* For those types that param_val is a value */
> +               buf =3D NULL;
> +               buf_size =3D 0;
> +               break;
> +       default:
> +               XDNA_DBG(xdna, "Unknown HW context config type %d", args-=
>param_type);
> +               return -EINVAL;
> +       }
> +
> +       mutex_lock(&xdna->dev_lock);
> +       hwctx =3D idr_find(&client->hwctx_idr, args->handle);
> +       if (!hwctx) {
> +               XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->p=
id, args->handle);
> +               ret =3D -EINVAL;
> +               goto unlock;
> +       }
> +
> +       ret =3D xdna->dev_info->ops->hwctx_config(hwctx, args->param_type=
, val, buf, buf_size);
> +
> +unlock:
> +       mutex_unlock(&xdna->dev_lock);
> +       kfree(buf);
> +       return ret;
> +}
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/=
amdxdna_ctx.h
> new file mode 100644
> index 000000000000..ceaebe3daa03
> --- /dev/null
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _AMDXDNA_CTX_H_
> +#define _AMDXDNA_CTX_H_
> +
> +#include <drm/drm_drv.h>
> +#include <linux/kref.h>
> +
> +struct amdxdna_hwctx {
> +       struct amdxdna_client           *client;
> +       struct amdxdna_hwctx_priv       *priv;
> +       char                            *name;
> +
> +       u32                             id;
> +       u32                             max_opc;
> +       u32                             num_tiles;
> +       u32                             mem_size;
> +       u32                             fw_ctx_id;
> +       u32                             col_list_len;
> +       u32                             *col_list;
> +       u32                             start_col;
> +       u32                             num_col;
> +#define HWCTX_STAT_INIT  0
> +#define HWCTX_STAT_READY 1
> +#define HWCTX_STAT_STOP  2
> +       u32                             status;
> +       u32                             old_status;
> +
> +       struct amdxdna_qos_info              qos;
> +       struct amdxdna_hwctx_param_config_cu *cus;
> +};
> +
> +void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
> +int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, s=
truct drm_file *filp);
> +int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, s=
truct drm_file *filp);
> +int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, =
struct drm_file *filp);
> +
> +#endif /* _AMDXDNA_CTX_H_ */
> diff --git a/drivers/accel/amdxdna/amdxdna_drm.c b/drivers/accel/amdxdna/=
amdxdna_drm.c
> index 91e4f9c9dac9..2365c064bad6 100644
> --- a/drivers/accel/amdxdna/amdxdna_drm.c
> +++ b/drivers/accel/amdxdna/amdxdna_drm.c
> @@ -3,12 +3,113 @@
>   * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>   */
>
> +#include <linux/iommu.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_accel.h>
>
>  #include "amdxdna_drm.h"
>
> -DEFINE_DRM_ACCEL_FOPS(amdxdna_fops);
> +static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *fi=
lp)
> +{
> +       struct amdxdna_dev *xdna =3D to_xdna_dev(ddev);
> +       struct amdxdna_client *client;
> +       int ret;
> +
> +       client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> +       if (!client)
> +               return -ENOMEM;
> +
> +       client->pid =3D pid_nr(filp->pid);
> +       client->xdna =3D xdna;
> +
> +       client->sva =3D iommu_sva_bind_device(xdna->ddev.dev, current->mm=
);
> +       if (IS_ERR(client->sva)) {
> +               ret =3D PTR_ERR(client->sva);
> +               XDNA_ERR(xdna, "SVA bind device failed, ret %d", ret);
> +               goto failed;
> +       }
> +       client->pasid =3D iommu_sva_get_pasid(client->sva);
> +       if (client->pasid =3D=3D IOMMU_PASID_INVALID) {
> +               XDNA_ERR(xdna, "SVA get pasid failed");
> +               ret =3D -ENODEV;
> +               goto unbind_sva;
> +       }
> +       mutex_init(&client->hwctx_lock);
> +       idr_init_base(&client->hwctx_idr, AMDXDNA_INVALID_CTX_HANDLE + 1)=
;
> +
> +       mutex_lock(&xdna->dev_lock);
> +       list_add_tail(&client->node, &xdna->client_list);
> +       mutex_unlock(&xdna->dev_lock);
> +
> +       filp->driver_priv =3D client;
> +       client->filp =3D filp;
> +
> +       XDNA_DBG(xdna, "pid %d opened", client->pid);
> +       return 0;
> +
> +unbind_sva:
> +       iommu_sva_unbind_device(client->sva);
> +failed:
> +       kfree(client);
> +
> +       return ret;
> +}
> +
> +static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *=
filp)
> +{
> +       struct amdxdna_client *client =3D filp->driver_priv;
> +       struct amdxdna_dev *xdna =3D to_xdna_dev(ddev);
> +
> +       XDNA_DBG(xdna, "closing pid %d", client->pid);
> +
> +       idr_destroy(&client->hwctx_idr);
> +       mutex_destroy(&client->hwctx_lock);
> +
> +       iommu_sva_unbind_device(client->sva);
> +
> +       XDNA_DBG(xdna, "pid %d closed", client->pid);
> +       kfree(client);
> +}
> +
> +static int amdxdna_flush(struct file *f, fl_owner_t id)
> +{
> +       struct drm_file *filp =3D f->private_data;
> +       struct amdxdna_client *client =3D filp->driver_priv;
> +       struct amdxdna_dev *xdna =3D client->xdna;
> +       int idx;
> +
> +       XDNA_DBG(xdna, "PID %d flushing...", client->pid);
> +       if (!drm_dev_enter(&xdna->ddev, &idx))
> +               return 0;
> +
> +       mutex_lock(&xdna->dev_lock);
> +       list_del_init(&client->node);
> +       mutex_unlock(&xdna->dev_lock);
> +       amdxdna_hwctx_remove_all(client);
> +
> +       drm_dev_exit(idx);
> +       return 0;
> +}
> +
> +static const struct drm_ioctl_desc amdxdna_drm_ioctls[] =3D {
> +       /* Context */
> +       DRM_IOCTL_DEF_DRV(AMDXDNA_CREATE_HWCTX, amdxdna_drm_create_hwctx_=
ioctl, 0),
> +       DRM_IOCTL_DEF_DRV(AMDXDNA_DESTROY_HWCTX, amdxdna_drm_destroy_hwct=
x_ioctl, 0),
> +       DRM_IOCTL_DEF_DRV(AMDXDNA_CONFIG_HWCTX, amdxdna_drm_config_hwctx_=
ioctl, 0),
> +};
> +
> +static const struct file_operations amdxdna_fops =3D {
> +       .owner          =3D THIS_MODULE,
> +       .open           =3D accel_open,
> +       .release        =3D drm_release,
> +       .flush          =3D amdxdna_flush,
> +       .unlocked_ioctl =3D drm_ioctl,
> +       .compat_ioctl   =3D drm_compat_ioctl,
> +       .poll           =3D drm_poll,
> +       .read           =3D drm_read,
> +       .llseek         =3D noop_llseek,
> +       .mmap           =3D drm_gem_mmap,
> +};
>
>  const struct drm_driver amdxdna_drm_drv =3D {
>         .driver_features =3D DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> @@ -17,4 +118,8 @@ const struct drm_driver amdxdna_drm_drv =3D {
>         .desc =3D "AMD XDNA DRM implementation",
>         .major =3D AMDXDNA_DRIVER_MAJOR,
>         .minor =3D AMDXDNA_DRIVER_MINOR,
> +       .open =3D amdxdna_drm_open,
> +       .postclose =3D amdxdna_drm_close,
> +       .ioctls =3D amdxdna_drm_ioctls,
> +       .num_ioctls =3D ARRAY_SIZE(amdxdna_drm_ioctls),
>  };
> diff --git a/drivers/accel/amdxdna/amdxdna_drm.h b/drivers/accel/amdxdna/=
amdxdna_drm.h
> index bf4b0b786606..08331c51a130 100644
> --- a/drivers/accel/amdxdna/amdxdna_drm.h
> +++ b/drivers/accel/amdxdna/amdxdna_drm.h
> @@ -13,6 +13,8 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_file.h>
>
> +#include "amdxdna_ctx.h"
> +
>  #define XDNA_INFO(xdna, fmt, args...)  drm_info(&(xdna)->ddev, fmt, ##ar=
gs)
>  #define XDNA_WARN(xdna, fmt, args...)  drm_warn(&(xdna)->ddev, "%s: "fmt=
, __func__, ##args)
>  #define XDNA_ERR(xdna, fmt, args...)   drm_err(&(xdna)->ddev, "%s: "fmt,=
 __func__, ##args)
> @@ -32,6 +34,9 @@ struct amdxdna_dev;
>  struct amdxdna_dev_ops {
>         int (*init)(struct amdxdna_dev *xdna);
>         void (*fini)(struct amdxdna_dev *xdna);
> +       int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
> +       void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
> +       int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 va=
lue, void *buf, u32 size);
>  };
>
>  /*
> @@ -68,7 +73,23 @@ struct amdxdna_dev {
>         void                            *xrs_hdl;
>
>         struct mutex                    dev_lock; /* per device lock */
> +       struct list_head                client_list;
>         struct amdxdna_fw_ver           fw_ver;
>  };
>
> +/*
> + * struct amdxdna_client - amdxdna client
> + * A per fd data structure for managing context and other user process s=
tuffs.
> + */
> +struct amdxdna_client {
> +       struct list_head                node;
> +       pid_t                           pid;
> +       struct mutex                    hwctx_lock; /* protect hwctx */
> +       struct idr                      hwctx_idr;
> +       struct amdxdna_dev              *xdna;
> +       struct drm_file                 *filp;
> +       struct iommu_sva                *sva;
> +       int                             pasid;
> +};
> +
>  #endif /* _AMDXDNA_DRM_H_ */
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdx=
dna/amdxdna_pci_drv.c
> index 7d0cfd918b0e..924ee8b96ebb 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -58,6 +58,7 @@ static int amdxdna_probe(struct pci_dev *pdev, const st=
ruct pci_device_id *id)
>                 return -ENODEV;
>
>         drmm_mutex_init(&xdna->ddev, &xdna->dev_lock);
> +       INIT_LIST_HEAD(&xdna->client_list);
>         pci_set_drvdata(pdev, xdna);
>
>         mutex_lock(&xdna->dev_lock);
> @@ -94,11 +95,25 @@ static int amdxdna_probe(struct pci_dev *pdev, const =
struct pci_device_id *id)
>  static void amdxdna_remove(struct pci_dev *pdev)
>  {
>         struct amdxdna_dev *xdna =3D pci_get_drvdata(pdev);
> +       struct amdxdna_client *client;
>
>         drm_dev_unplug(&xdna->ddev);
>         amdxdna_sysfs_fini(xdna);
>
>         mutex_lock(&xdna->dev_lock);
> +       client =3D list_first_entry_or_null(&xdna->client_list,
> +                                         struct amdxdna_client, node);
> +       while (client) {
> +               list_del_init(&client->node);
> +               mutex_unlock(&xdna->dev_lock);
> +
> +               amdxdna_hwctx_remove_all(client);
> +
> +               mutex_lock(&xdna->dev_lock);
> +               client =3D list_first_entry_or_null(&xdna->client_list,
> +                                                 struct amdxdna_client, =
node);
> +       }
> +
>         xdna->dev_info->ops->fini(xdna);
>         mutex_unlock(&xdna->dev_lock);
>  }
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_=
accel.h
> index 1b699464150e..5c1d9707d6da 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -6,6 +6,7 @@
>  #ifndef _UAPI_AMDXDNA_ACCEL_H_
>  #define _UAPI_AMDXDNA_ACCEL_H_
>
> +#include <linux/stddef.h>
>  #include "drm.h"
>
>  #if defined(__cplusplus)
> @@ -15,11 +16,138 @@ extern "C" {
>  #define AMDXDNA_DRIVER_MAJOR   1
>  #define AMDXDNA_DRIVER_MINOR   0
>
> +#define AMDXDNA_INVALID_CTX_HANDLE     0
> +
>  enum amdxdna_device_type {
>         AMDXDNA_DEV_TYPE_UNKNOWN =3D -1,
>         AMDXDNA_DEV_TYPE_KMQ,
>  };
>
> +enum amdxdna_drm_ioctl_id {
> +       DRM_AMDXDNA_CREATE_HWCTX,
> +       DRM_AMDXDNA_DESTROY_HWCTX,
> +       DRM_AMDXDNA_CONFIG_HWCTX,
> +};
> +
> +/**
> + * struct qos_info - QoS information for driver.
> + * @gops: Giga operations per second.
> + * @fps: Frames per second.
> + * @dma_bandwidth: DMA bandwidtha.
> + * @latency: Frame response latency.
> + * @frame_exec_time: Frame execution time.
> + * @priority: Request priority.
> + *
> + * User program can provide QoS hints to driver.
> + */
> +struct amdxdna_qos_info {
> +       __u32 gops;
> +       __u32 fps;
> +       __u32 dma_bandwidth;
> +       __u32 latency;
> +       __u32 frame_exec_time;
> +       __u32 priority;
> +};
> +
> +/**
> + * struct amdxdna_drm_create_hwctx - Create hardware context.
> + * @ext: MBZ.
> + * @ext_flags: MBZ.
> + * @qos_p: Address of QoS info.
> + * @umq_bo: BO handle for user mode queue(UMQ).
> + * @log_buf_bo: BO handle for log buffer.
> + * @max_opc: Maximum operations per cycle.
> + * @num_tiles: Number of AIE tiles.
> + * @mem_size: Size of AIE tile memory.
> + * @umq_doorbell: Returned offset of doorbell associated with UMQ.
> + * @handle: Returned hardware context handle.
> + */
> +struct amdxdna_drm_create_hwctx {
> +       __u64 ext;
> +       __u64 ext_flags;
> +       __u64 qos_p;
> +       __u32 umq_bo;
> +       __u32 log_buf_bo;
> +       __u32 max_opc;
> +       __u32 num_tiles;
> +       __u32 mem_size;
> +       __u32 umq_doorbell;
> +       __u32 handle;

You should align this structure to 64 bits for 32 bit compatibility.
I.e., add a __u32 pad;

Alex

> +};
> +
> +/**
> + * struct amdxdna_drm_destroy_hwctx - Destroy hardware context.
> + * @handle: Hardware context handle.
> + * @pad: MBZ.
> + */
> +struct amdxdna_drm_destroy_hwctx {
> +       __u32 handle;
> +       __u32 pad;
> +};
> +
> +/**
> + * struct amdxdna_cu_config - configuration for one CU
> + * @cu_bo: CU configuration buffer bo handle
> + * @cu_func: Functional of a CU
> + * @pad: MBZ
> + */
> +struct amdxdna_cu_config {
> +       __u32 cu_bo;
> +       __u8  cu_func;
> +       __u8  pad[3];
> +};
> +
> +/**
> + * struct amdxdna_hwctx_param_config_cu - configuration for CUs in hardw=
are context
> + * @num_cus: Number of CUs to configure
> + * @pad: MBZ
> + * @cu_configs: Array of CU configurations of struct amdxdna_cu_config
> + */
> +struct amdxdna_hwctx_param_config_cu {
> +       __u16 num_cus;
> +       __u16 pad[3];
> +       struct amdxdna_cu_config cu_configs[] __counted_by(num_cus);
> +};
> +
> +enum amdxdna_drm_config_hwctx_param {
> +       DRM_AMDXDNA_HWCTX_CONFIG_CU,
> +       DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF,
> +       DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF,
> +       DRM_AMDXDNA_HWCTX_CONFIG_NUM
> +};
> +
> +/**
> + * struct amdxdna_drm_config_hwctx - Configure hardware context.
> + * @handle: hardware context handle.
> + * @param_type: Value in enum amdxdna_drm_config_hwctx_param. Specifies =
the
> + *              structure passed in via param_val.
> + * @param_val: A structure specified by the param_type struct member.
> + * @param_val_size: Size of the parameter buffer pointed to by the param=
_val.
> + *                 If param_val is not a pointer, driver can ignore this=
.
> + *
> + * Note: if the param_val is a pointer pointing to a buffer, the maximum=
 size
> + * of the buffer is 4KiB(PAGE_SIZE).
> + */
> +struct amdxdna_drm_config_hwctx {
> +       __u32 handle;
> +       __u32 param_type;
> +       __u64 param_val;
> +       __u32 param_val_size;
> +       __u32 pad;
> +};
> +
> +#define DRM_IOCTL_AMDXDNA_CREATE_HWCTX \
> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CREATE_HWCTX, \
> +                struct amdxdna_drm_create_hwctx)
> +
> +#define DRM_IOCTL_AMDXDNA_DESTROY_HWCTX \
> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_DESTROY_HWCTX, \
> +                struct amdxdna_drm_destroy_hwctx)
> +
> +#define DRM_IOCTL_AMDXDNA_CONFIG_HWCTX \
> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CONFIG_HWCTX, \
> +                struct amdxdna_drm_config_hwctx)
> +
>  #if defined(__cplusplus)
>  } /* extern c end */
>  #endif
> --
> 2.34.1
>
