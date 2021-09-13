Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F94409728
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 17:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85206E1D3;
	Mon, 13 Sep 2021 15:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B29B6E170;
 Mon, 13 Sep 2021 15:22:02 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id r26so14507606oij.2;
 Mon, 13 Sep 2021 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6eQSoz6yFLZ6gxGqJMurl+Xlad2UAwgEC7CkEHzCac=;
 b=lXctDf305Ip+pYggDlg5Vg5i8iEr7dvleXV0dM+pXM66wOIug25YyQhVLIleGRXCKP
 SHsZ+L8rhilQM9QYScIAnR1tX2VBdODsB6eMlaZ3RcGn/fyuZ71redQOyuU1zxskqiJu
 fuoYQENJ1Y5k0eU4IyP8jMVPJfbui9fATfqmxGNAkwwapAOYEQJy/r4/H3ftP3UL14Ui
 ytRF9ufzTMvDWh2HDcmiB/FwmJvlyAcQfKuFA8ls0hFQ4crCztSe9nhCJpWO4ba1sYGg
 jF4xuvC2Zg+YvQEe9xRDtXDpTym41QGndymvtSqTod/fXL4teSuTo0vAmsfoVWtDqMPr
 vnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6eQSoz6yFLZ6gxGqJMurl+Xlad2UAwgEC7CkEHzCac=;
 b=RGFsxlzZH8Jjlxslsqn0yrUf8V7UdIo1TwXD9e3Yppl4duumHuZLkzwVVRNVNBxaZM
 dnIzZXWFs/WbJcQMJmXXS9uOWBGxbpMQsnxwtyua5o5ZmtyQjZJBEpf43pxTx885f/UQ
 AvGFNANv4sJmC7pStpEB2wki67lZMO4kU3wt0VMSOrLaqXR5ZXoQxGUOPIpeU97Cu2AP
 krcuaoxrJG0WqBh/emwQwLsQgAPqllxIQzvpOit/wpT8qnubHjcD6wM6F9xMfNXQNk8q
 VtvHQ9vZHFDTFdW0U+UEm2l1hA80l3Lp2E57ztztiuZ8Y1DM/9G5q4KPHsKNH4PlINmC
 sjBQ==
X-Gm-Message-State: AOAM531Y8SFsDM7VErAKk0Cvlqh/7a8KpxHP97N4+tL8k5hSOnoKCwVu
 uRC0tGAFfDOQN+ZQmI1k9g0SNIBhHWpDeZiEnaw=
X-Google-Smtp-Source: ABdhPJxUkyTrOPUfKL+ohm9UbApEqnjglpMV3TCrvYC8TOsMQVs8QIOICPAyqsAy8r6woPULPehcT0Vl9DaXakfbLNQ=
X-Received: by 2002:aca:706:: with SMTP id 6mr7087007oih.5.1631546521564; Mon,
 13 Sep 2021 08:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210910195347.2352884-1-Felix.Kuehling@amd.com>
In-Reply-To: <20210910195347.2352884-1-Felix.Kuehling@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Sep 2021 11:21:50 -0400
Message-ID: <CADnq5_PGOL2hK4h2CFDmXSL+KJ7HSmBCdGhND_3D=F9Rn9CsDQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Add sysfs bitfields and enums to uAPI
To: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Sep 10, 2021 at 3:54 PM Felix Kuehling <Felix.Kuehling@amd.com> wrote:
>
> These bits are de-facto part of the uAPI, so declare them in a uAPI header.
>

Please include a link to the userspace that uses this in the commit message.

Alex

> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>  MAINTAINERS                               |   1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h |  46 +--------
>  include/uapi/linux/kfd_sysfs.h            | 108 ++++++++++++++++++++++
>  3 files changed, 110 insertions(+), 45 deletions(-)
>  create mode 100644 include/uapi/linux/kfd_sysfs.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 84cd16694640..7554ec928ee2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -930,6 +930,7 @@ F:  drivers/gpu/drm/amd/include/kgd_kfd_interface.h
>  F:     drivers/gpu/drm/amd/include/v9_structs.h
>  F:     drivers/gpu/drm/amd/include/vi_structs.h
>  F:     include/uapi/linux/kfd_ioctl.h
> +F:     include/uapi/linux/kfd_sysfs.h
>
>  AMD SPI DRIVER
>  M:     Sanjay R Mehta <sanju.mehta@amd.com>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> index a8db017c9b8e..f0cc59d2fd5d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> @@ -25,38 +25,11 @@
>
>  #include <linux/types.h>
>  #include <linux/list.h>
> +#include <linux/kfd_sysfs.h>
>  #include "kfd_crat.h"
>
>  #define KFD_TOPOLOGY_PUBLIC_NAME_SIZE 32
>
> -#define HSA_CAP_HOT_PLUGGABLE                  0x00000001
> -#define HSA_CAP_ATS_PRESENT                    0x00000002
> -#define HSA_CAP_SHARED_WITH_GRAPHICS           0x00000004
> -#define HSA_CAP_QUEUE_SIZE_POW2                        0x00000008
> -#define HSA_CAP_QUEUE_SIZE_32BIT               0x00000010
> -#define HSA_CAP_QUEUE_IDLE_EVENT               0x00000020
> -#define HSA_CAP_VA_LIMIT                       0x00000040
> -#define HSA_CAP_WATCH_POINTS_SUPPORTED         0x00000080
> -#define HSA_CAP_WATCH_POINTS_TOTALBITS_MASK    0x00000f00
> -#define HSA_CAP_WATCH_POINTS_TOTALBITS_SHIFT   8
> -#define HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK   0x00003000
> -#define HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT  12
> -
> -#define HSA_CAP_DOORBELL_TYPE_PRE_1_0          0x0
> -#define HSA_CAP_DOORBELL_TYPE_1_0              0x1
> -#define HSA_CAP_DOORBELL_TYPE_2_0              0x2
> -#define HSA_CAP_AQL_QUEUE_DOUBLE_MAP           0x00004000
> -
> -#define HSA_CAP_RESERVED_WAS_SRAM_EDCSUPPORTED 0x00080000 /* Old buggy user mode depends on this being 0 */
> -#define HSA_CAP_MEM_EDCSUPPORTED               0x00100000
> -#define HSA_CAP_RASEVENTNOTIFY                 0x00200000
> -#define HSA_CAP_ASIC_REVISION_MASK             0x03c00000
> -#define HSA_CAP_ASIC_REVISION_SHIFT            22
> -#define HSA_CAP_SRAM_EDCSUPPORTED              0x04000000
> -#define HSA_CAP_SVMAPI_SUPPORTED               0x08000000
> -#define HSA_CAP_FLAGS_COHERENTHOSTACCESS       0x10000000
> -#define HSA_CAP_RESERVED                       0xe00f8000
> -
>  struct kfd_node_properties {
>         uint64_t hive_id;
>         uint32_t cpu_cores_count;
> @@ -93,17 +66,6 @@ struct kfd_node_properties {
>         char name[KFD_TOPOLOGY_PUBLIC_NAME_SIZE];
>  };
>
> -#define HSA_MEM_HEAP_TYPE_SYSTEM       0
> -#define HSA_MEM_HEAP_TYPE_FB_PUBLIC    1
> -#define HSA_MEM_HEAP_TYPE_FB_PRIVATE   2
> -#define HSA_MEM_HEAP_TYPE_GPU_GDS      3
> -#define HSA_MEM_HEAP_TYPE_GPU_LDS      4
> -#define HSA_MEM_HEAP_TYPE_GPU_SCRATCH  5
> -
> -#define HSA_MEM_FLAGS_HOT_PLUGGABLE            0x00000001
> -#define HSA_MEM_FLAGS_NON_VOLATILE             0x00000002
> -#define HSA_MEM_FLAGS_RESERVED                 0xfffffffc
> -
>  struct kfd_mem_properties {
>         struct list_head        list;
>         uint32_t                heap_type;
> @@ -116,12 +78,6 @@ struct kfd_mem_properties {
>         struct attribute        attr;
>  };
>
> -#define HSA_CACHE_TYPE_DATA            0x00000001
> -#define HSA_CACHE_TYPE_INSTRUCTION     0x00000002
> -#define HSA_CACHE_TYPE_CPU             0x00000004
> -#define HSA_CACHE_TYPE_HSACU           0x00000008
> -#define HSA_CACHE_TYPE_RESERVED                0xfffffff0
> -
>  struct kfd_cache_properties {
>         struct list_head        list;
>         uint32_t                processor_id_low;
> diff --git a/include/uapi/linux/kfd_sysfs.h b/include/uapi/linux/kfd_sysfs.h
> new file mode 100644
> index 000000000000..e1fb78b4bf09
> --- /dev/null
> +++ b/include/uapi/linux/kfd_sysfs.h
> @@ -0,0 +1,108 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT WITH Linux-syscall-note */
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef KFD_SYSFS_H_INCLUDED
> +#define KFD_SYSFS_H_INCLUDED
> +
> +/* Capability bits in node properties */
> +#define HSA_CAP_HOT_PLUGGABLE                  0x00000001
> +#define HSA_CAP_ATS_PRESENT                    0x00000002
> +#define HSA_CAP_SHARED_WITH_GRAPHICS           0x00000004
> +#define HSA_CAP_QUEUE_SIZE_POW2                        0x00000008
> +#define HSA_CAP_QUEUE_SIZE_32BIT               0x00000010
> +#define HSA_CAP_QUEUE_IDLE_EVENT               0x00000020
> +#define HSA_CAP_VA_LIMIT                       0x00000040
> +#define HSA_CAP_WATCH_POINTS_SUPPORTED         0x00000080
> +#define HSA_CAP_WATCH_POINTS_TOTALBITS_MASK    0x00000f00
> +#define HSA_CAP_WATCH_POINTS_TOTALBITS_SHIFT   8
> +#define HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK   0x00003000
> +#define HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT  12
> +
> +#define HSA_CAP_DOORBELL_TYPE_PRE_1_0          0x0
> +#define HSA_CAP_DOORBELL_TYPE_1_0              0x1
> +#define HSA_CAP_DOORBELL_TYPE_2_0              0x2
> +#define HSA_CAP_AQL_QUEUE_DOUBLE_MAP           0x00004000
> +
> +/* Old buggy user mode depends on this being 0 */
> +#define HSA_CAP_RESERVED_WAS_SRAM_EDCSUPPORTED 0x00080000
> +
> +#define HSA_CAP_MEM_EDCSUPPORTED               0x00100000
> +#define HSA_CAP_RASEVENTNOTIFY                 0x00200000
> +#define HSA_CAP_ASIC_REVISION_MASK             0x03c00000
> +#define HSA_CAP_ASIC_REVISION_SHIFT            22
> +#define HSA_CAP_SRAM_EDCSUPPORTED              0x04000000
> +#define HSA_CAP_SVMAPI_SUPPORTED               0x08000000
> +#define HSA_CAP_FLAGS_COHERENTHOSTACCESS       0x10000000
> +#define HSA_CAP_RESERVED                       0xe00f8000
> +
> +/* Heap types in memory properties */
> +#define HSA_MEM_HEAP_TYPE_SYSTEM       0
> +#define HSA_MEM_HEAP_TYPE_FB_PUBLIC    1
> +#define HSA_MEM_HEAP_TYPE_FB_PRIVATE   2
> +#define HSA_MEM_HEAP_TYPE_GPU_GDS      3
> +#define HSA_MEM_HEAP_TYPE_GPU_LDS      4
> +#define HSA_MEM_HEAP_TYPE_GPU_SCRATCH  5
> +
> +/* Flag bits in memory properties */
> +#define HSA_MEM_FLAGS_HOT_PLUGGABLE            0x00000001
> +#define HSA_MEM_FLAGS_NON_VOLATILE             0x00000002
> +#define HSA_MEM_FLAGS_RESERVED                 0xfffffffc
> +
> +/* Cache types in cache properties */
> +#define HSA_CACHE_TYPE_DATA            0x00000001
> +#define HSA_CACHE_TYPE_INSTRUCTION     0x00000002
> +#define HSA_CACHE_TYPE_CPU             0x00000004
> +#define HSA_CACHE_TYPE_HSACU           0x00000008
> +#define HSA_CACHE_TYPE_RESERVED                0xfffffff0
> +
> +/* Link types in IO link properties (matches CRAT link types) */
> +#define HSA_IOLINK_TYPE_UNDEFINED      0
> +#define HSA_IOLINK_TYPE_HYPERTRANSPORT 1
> +#define HSA_IOLINK_TYPE_PCIEXPRESS     2
> +#define HSA_IOLINK_TYPE_AMBA           3
> +#define HSA_IOLINK_TYPE_MIPI           4
> +#define HSA_IOLINK_TYPE_QPI_1_1        5
> +#define HSA_IOLINK_TYPE_RESERVED1      6
> +#define HSA_IOLINK_TYPE_RESERVED2      7
> +#define HSA_IOLINK_TYPE_RAPID_IO       8
> +#define HSA_IOLINK_TYPE_INFINIBAND     9
> +#define HSA_IOLINK_TYPE_RESERVED3      10
> +#define HSA_IOLINK_TYPE_XGMI           11
> +#define HSA_IOLINK_TYPE_XGOP           12
> +#define HSA_IOLINK_TYPE_GZ             13
> +#define HSA_IOLINK_TYPE_ETHERNET_RDMA  14
> +#define HSA_IOLINK_TYPE_RDMA_OTHER     15
> +#define HSA_IOLINK_TYPE_OTHER          16
> +
> +/* Flag bits in IO link properties (matches CRAT flags, excluding the
> + * bi-directional flag, which is not offially part of the CRAT spec, and
> + * only used internally in KFD)
> + */
> +#define HSA_IOLINK_FLAGS_ENABLED               (1 << 0)
> +#define HSA_IOLINK_FLAGS_NON_COHERENT          (1 << 1)
> +#define HSA_IOLINK_FLAGS_NO_ATOMICS_32_BIT     (1 << 2)
> +#define HSA_IOLINK_FLAGS_NO_ATOMICS_64_BIT     (1 << 3)
> +#define HSA_IOLINK_FLAGS_NO_PEER_TO_PEER_DMA   (1 << 4)
> +#define HSA_IOLINK_FLAGS_RESERVED              0xffffffe0
> +
> +#endif
> --
> 2.32.0
>
