Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F05817802CC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 02:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5CD10E259;
	Fri, 18 Aug 2023 00:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3134510E259
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 00:43:51 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99c47ef365cso43976166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 17:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1692319430; x=1692924230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e1cLTaKjoRbqM6OeM690E+HZaK6xtbH5gI4qDjf9R+g=;
 b=KEAnanZykqJCeXUoVDEy3d+76F9f69AKU73CO/Sq5kV1cuoKb8M7+RUEqmYuuKUj2n
 i+7+h7f9QQ/XozMb+YDTMv7tQJY0b8hEzziRu3q+4TT020d8t2TY2qK65tp+lSLtD56j
 Me6fJk7RzAMv0HU5Whvkc/WXGCR6hCHwOp/lnRKcIMARY+SXkTbm/Vg0Nup2jb+dr7S5
 YbK3U8SgBXFL9iqOHV9araE28UB8w9pwsgalMFKy+nCeLTd4h1XKRQthNZoVpmu8kuO3
 /IGqSuzw6PIdEVh9BGHK3ove2zX0tDmDK5h6iu8c8r8mF+zRjj1qAYL1YY1eqhlwAA+s
 /A5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692319430; x=1692924230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1cLTaKjoRbqM6OeM690E+HZaK6xtbH5gI4qDjf9R+g=;
 b=aAAcB/GteRS4zs85LOmFa3gpwMt32RdIMYJVSsDuzk6coo0R4CRVOXBihNemrqYLtW
 SrI4mRgeu2dgHXGpEyO+5F3D6rjzO4Og4iuaCzNHufybvQTbAx7zVue3GDoowQM7/+3Y
 uJAkzKSCEfxWlI3vmO3NHdOtVmHhVpLnbV12bUUfBAow/wx8/8b98JwFHbwMky42Uo/K
 8FD+HIUFEjuwOz7RvWny6G8TzrY5PQVYo+/cjD+i+BpVFURZXO97S2VBLgZZ79TIOsxS
 uyXFgU+cgl4TmzNj/X2W2qMZw8wfjQxhEj3B1dT5de3MaqmeqDj5a8MZAXEnHN2PkNXe
 KJBA==
X-Gm-Message-State: AOJu0YzIM5yBaXkLsCtXbVzSZYofTPBQNojv9T/DSFM9LD8+HWG+dP6S
 sWYTmI128R8jXSQgC4JYn7OdxDGhbG+0L4zsjWLIPA==
X-Google-Smtp-Source: AGHT+IFhOUltWsR6cl0p0nRFnmoeZD9iRowyYoG8OTxifW068ouGw9UkIVUQwwvPDtrhzd/cQ2AL7RMehLRE8VHrKEE=
X-Received: by 2002:a17:906:37cd:b0:99c:55a9:3925 with SMTP id
 o13-20020a17090637cd00b0099c55a93925mr675592ejc.24.1692319429473; Thu, 17 Aug
 2023 17:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-4-sarah.walker@imgtec.com>
In-Reply-To: <20230816082531.164695-4-sarah.walker@imgtec.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Thu, 17 Aug 2023 19:43:37 -0500
Message-ID: <CAOFGe94OtnfKY+ZWzWOGz8kjKQhihzSOrLKrB_M=JE-i4cEMVg@mail.gmail.com>
Subject: Re: [PATCH v5 03/17] drm/imagination/uapi: Add PowerVR driver UAPI
To: Sarah Walker <sarah.walker@imgtec.com>
Content-Type: multipart/alternative; boundary="00000000000070c759060327d293"
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
Cc: matthew.brost@intel.com, hns@goldelico.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, Matt Coster <matt.coster@imgtec.com>,
 luben.tuikov@amd.com, dakr@redhat.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000070c759060327d293
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 3:26=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.c=
om>
wrote:

> Add the UAPI implementation for the PowerVR driver.
>
> Changes from v4 :
> - Remove CREATE_ZEROED flag for BO creation (all buffers are now zeroed)
>
> Co-developed-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Frank Binns <frank.binns@imgtec.com>
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Matt Coster <matt.coster@imgtec.com>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> Co-developed-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
>  MAINTAINERS                |    1 +
>  include/uapi/drm/pvr_drm.h | 1303 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 1304 insertions(+)
>  create mode 100644 include/uapi/drm/pvr_drm.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f84390bb6cfe..55e17f8aea91 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10144,6 +10144,7 @@ M:      Sarah Walker <sarah.walker@imgtec.com>
>  M:     Donald Robson <donald.robson@imgtec.com>
>  S:     Supported
>  F:     Documentation/devicetree/bindings/gpu/img,powervr.yaml
> +F:     include/uapi/drm/pvr_drm.h
>
>  IMON SOUNDGRAPH USB IR RECEIVER
>  M:     Sean Young <sean@mess.org>
> diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h
> new file mode 100644
> index 000000000000..c0aac8b135ca
> --- /dev/null
> +++ b/include/uapi/drm/pvr_drm.h
> @@ -0,0 +1,1303 @@
> +/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT */
> +/* Copyright (c) 2023 Imagination Technologies Ltd. */
> +
> +#ifndef PVR_DRM_UAPI_H
> +#define PVR_DRM_UAPI_H
> +
> +#include "drm.h"
> +
> +#include <linux/const.h>
> +#include <linux/types.h>
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * DOC: PowerVR UAPI
> + *
> + * The PowerVR IOCTL argument structs have a few limitations in place, i=
n
> + * addition to the standard kernel restrictions:
> + *
> + *  - All members must be type-aligned.
> + *  - The overall struct must be padded to 64-bit alignment.
> + *  - Explicit padding is almost always required. This takes the form of
> + *    ``_padding_[x]`` members of sufficient size to pad to the next
> power-of-two
> + *    alignment, where [x] is the offset into the struct in hexadecimal.
> Arrays
> + *    are never used for alignment. Padding fields must be zeroed; this =
is
> + *    always checked.
> + *  - Unions may only appear as the last member of a struct.
> + *  - Individual union members may grow in the future. The space between
> the
> + *    end of a union member and the end of its containing union is
> considered
> + *    "implicit padding" and must be zeroed. This is always checked.
> + *
> + * In addition to the IOCTL argument structs, the PowerVR UAPI makes use
> of
> + * DEV_QUERY argument structs. These are used to fetch information about
> the
> + * device and runtime. These structs are subject to the same rules set o=
ut
> + * above.
> + */
> +
> +/**
> + * struct drm_pvr_obj_array - Container used to pass arrays of objects
> + *
> + * It is not unusual to have to extend objects to pass new parameters,
> and the DRM
> + * ioctl infrastructure is supporting that by padding ioctl arguments
> with zeros
> + * when the data passed by userspace is smaller than the struct defined
> in the
> + * drm_ioctl_desc, thus keeping things backward compatible. This type is
> just
> + * applying the same concepts to indirect objects passed through arrays
> referenced
> + * from the main ioctl arguments structure: the stride basically defines
> the size
> + * of the object passed by userspace, which allows the kernel driver to
> pad with
> + * zeros when it's smaller than the size of the object it expects.
> + *
> + * Use ``DRM_PVR_OBJ_ARRAY()`` to fill object array fields, unless you
> + * have a very good reason not to.
> + */
> +struct drm_pvr_obj_array {
> +       /** @stride: Stride of object struct. Used for versioning. */
> +       __u32 stride;
> +
> +       /** @count: Number of objects in the array. */
> +       __u32 count;
> +
> +       /** @array: User pointer to an array of objects. */
> +       __u64 array;
> +};
> +
> +/**
> + * DRM_PVR_OBJ_ARRAY() - Helper macro for filling &struct
> drm_pvr_obj_array.
> + * @cnt: Number of elements pointed to py @ptr.
> + * @ptr: Pointer to start of a C array.
> + *
> + * Return: Literal of type &struct drm_pvr_obj_array.
> + */
> +#define DRM_PVR_OBJ_ARRAY(cnt, ptr) \
> +       { .stride =3D sizeof((ptr)[0]), .count =3D (cnt), .array =3D
> (__u64)(uintptr_t)(ptr) }
> +
> +/**
> + * DOC: PowerVR IOCTL interface
> + */
> +
> +/**
> + * PVR_IOCTL() - Build a PowerVR IOCTL number
> + * @_ioctl: An incrementing id for this IOCTL. Added to %DRM_COMMAND_BAS=
E.
> + * @_mode: Must be one of %DRM_IOR, %DRM_IOW or %DRM_IOWR.
> + * @_data: The type of the args struct passed by this IOCTL.
> + *
> + * The struct referred to by @_data must have a ``drm_pvr_ioctl_`` prefi=
x
> and an
> + * ``_args suffix``. They are therefore omitted from @_data.
> + *
> + * This should only be used to build the constants described below; it
> should
> + * never be used to call an IOCTL directly.
> + *
> + * Return: An IOCTL number to be passed to ioctl() from userspace.
> + */
> +#define PVR_IOCTL(_ioctl, _mode, _data) \
> +       _mode(DRM_COMMAND_BASE + (_ioctl), struct
> drm_pvr_ioctl_##_data##_args)
> +
> +#define DRM_IOCTL_PVR_DEV_QUERY PVR_IOCTL(0x00, DRM_IOWR, dev_query)
> +#define DRM_IOCTL_PVR_CREATE_BO PVR_IOCTL(0x01, DRM_IOWR, create_bo)
> +#define DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET PVR_IOCTL(0x02, DRM_IOWR,
> get_bo_mmap_offset)
> +#define DRM_IOCTL_PVR_CREATE_VM_CONTEXT PVR_IOCTL(0x03, DRM_IOWR,
> create_vm_context)
> +#define DRM_IOCTL_PVR_DESTROY_VM_CONTEXT PVR_IOCTL(0x04, DRM_IOW,
> destroy_vm_context)
> +#define DRM_IOCTL_PVR_VM_MAP PVR_IOCTL(0x05, DRM_IOW, vm_map)
> +#define DRM_IOCTL_PVR_VM_UNMAP PVR_IOCTL(0x06, DRM_IOW, vm_unmap)
> +#define DRM_IOCTL_PVR_CREATE_CONTEXT PVR_IOCTL(0x07, DRM_IOWR,
> create_context)
> +#define DRM_IOCTL_PVR_DESTROY_CONTEXT PVR_IOCTL(0x08, DRM_IOW,
> destroy_context)
> +#define DRM_IOCTL_PVR_CREATE_FREE_LIST PVR_IOCTL(0x09, DRM_IOWR,
> create_free_list)
> +#define DRM_IOCTL_PVR_DESTROY_FREE_LIST PVR_IOCTL(0x0a, DRM_IOW,
> destroy_free_list)
> +#define DRM_IOCTL_PVR_CREATE_HWRT_DATASET PVR_IOCTL(0x0b, DRM_IOWR,
> create_hwrt_dataset)
> +#define DRM_IOCTL_PVR_DESTROY_HWRT_DATASET PVR_IOCTL(0x0c, DRM_IOW,
> destroy_hwrt_dataset)
> +#define DRM_IOCTL_PVR_SUBMIT_JOBS PVR_IOCTL(0x0d, DRM_IOW, submit_jobs)
> +
> +/**
> + * DOC: PowerVR IOCTL DEV_QUERY interface
> + */
> +
> +/**
> + * struct drm_pvr_dev_query_gpu_info - Container used to fetch
> information about
> + * the graphics processor.
> + *
> + * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type mus=
t
> be set
> + * to %DRM_PVR_DEV_QUERY_GPU_INFO_GET.
> + */
> +struct drm_pvr_dev_query_gpu_info {
> +       /**
> +        * @gpu_id: GPU identifier.
> +        *
> +        * For all currently supported GPUs this is the BVNC encoded as a
> 64-bit
> +        * value as follows:
> +        *
> +        *    +--------+--------+--------+-------+
> +        *    | 63..48 | 47..32 | 31..16 | 15..0 |
> +        *    +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+
> +        *    | B      | V      | N      | C     |
> +        *    +--------+--------+--------+-------+
> +        */
> +       __u64 gpu_id;
> +
> +       /**
> +        * @num_phantoms: Number of Phantoms present.
> +        */
> +       __u32 num_phantoms;
> +};
> +
> +/**
> + * struct drm_pvr_dev_query_runtime_info - Container used to fetch
> information
> + * about the graphics runtime.
> + *
> + * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type mus=
t
> be set
> + * to %DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET.
> + */
> +struct drm_pvr_dev_query_runtime_info {
> +       /**
> +        * @free_list_min_pages: Minimum allowed free list size,
> +        * in PM physical pages.
> +        */
> +       __u64 free_list_min_pages;
> +
> +       /**
> +        * @free_list_max_pages: Maximum allowed free list size,
> +        * in PM physical pages.
> +        */
> +       __u64 free_list_max_pages;
> +
> +       /**
> +        * @common_store_alloc_region_size: Size of the Allocation
> +        * Region within the Common Store used for coefficient and shared
> +        * registers, in dwords.
> +        */
> +       __u32 common_store_alloc_region_size;
>

Any reason why this is in dwords?  It's not really my place to have an
opinion but that seems like kind-of a funny unit for the size of an
allocation region. Why not just bytes?


> +
> +       /**
> +        * @common_store_partition_space_size: Size of the
> +        * Partition Space within the Common Store for output buffers, in
> +        * dwords.
> +        */
> +       __u32 common_store_partition_space_size;
> +
> +       /**
> +        * @max_coeffs: Maximum coefficients, in dwords.
> +        */
> +       __u32 max_coeffs;
> +
> +       /**
> +        * @cdm_max_local_mem_size_regs: Maximum amount of local
> +        * memory available to a compute kernel, in dwords.
> +        */
> +       __u32 cdm_max_local_mem_size_regs;
> +};
> +
> +/**
> + * struct drm_pvr_dev_query_quirks - Container used to fetch information
> about
> + * hardware fixes for which the device may require support in the user
> mode
> + * driver.
> + *
> + * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type mus=
t
> be set
> + * to %DRM_PVR_DEV_QUERY_QUIRKS_GET.
> + */
> +struct drm_pvr_dev_query_quirks {
> +       /**
> +        * @quirks: A userspace address for the hardware quirks __u32
> array.
> +        *
> +        * The first @musthave_count items in the list are quirks that th=
e
> +        * client must support for this device. If userspace does not
> support
> +        * all these quirks then functionality is not guaranteed and clie=
nt
> +        * initialisation must fail.
> +        * The remaining quirks in the list affect userspace and the
> kernel or
> +        * firmware. They are disabled by default and require userspace t=
o
> +        * opt-in. The opt-in mechanism depends on the quirk.
> +        */
> +       __u64 quirks;
>

Where are these quirk IDs defined and where do they come from? If they're
effectively coming from hardware, possibly via firmware, that's probably
okay.  The important thing is that quirks should only ever get removed for
any given piece of hardware otherwise you risk breaking userspace.


> +
> +       /** @count: Length of @quirks (number of __u32). */
> +       __u16 count;
> +
> +       /**
> +        * @musthave_count: The number of entries in @quirks that are
> +        * mandatory, starting at index 0.
> +        */
> +       __u16 musthave_count;
> +
> +       /** @_padding_c: Reserved. This field must be zeroed. */
> +       __u32 _padding_c;
> +};
> +
> +/**
> + * struct drm_pvr_dev_query_enhancements - Container used to fetch
> information
> + * about optional enhancements supported by the device that require
> support in
> + * the user mode driver.
> + *
> + * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type mus=
t
> be set
> + * to %DRM_PVR_DEV_ENHANCEMENTS_GET.
> + */
> +struct drm_pvr_dev_query_enhancements {
> +       /**
> +        * @enhancements: A userspace address for the hardware enhancemen=
ts
> +        * __u32 array.
> +        *
> +        * These enhancements affect userspace and the kernel or firmware=
.
> They
> +        * are disabled by default and require userspace to opt-in. The
> opt-in
> +        * mechanism depends on the quirk.
> +        */
> +       __u64 enhancements;
>

Can you provide some examples of "enhancements"? Not that you need to put
it in the docs. I'm just trying to understand what this API is doing so I
can better review. Again, where do these come from? Also, how is an
enhancement different from a quirk?

~Faith


> +
> +       /** @count: Length of @enhancements (number of __u32). */
> +       __u16 count;
> +
> +       /** @_padding_a: Reserved. This field must be zeroed. */
> +       __u16 _padding_a;
> +
> +       /** @_padding_c: Reserved. This field must be zeroed. */
> +       __u32 _padding_c;
> +};
> +
> +/**
> + * enum drm_pvr_heap_id - Array index for heap info data returned by
> + * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
> + *
> + * For compatibility reasons all indices will be present in the returned
> array,
> + * however some heaps may not be present. These are indicated where
> + * &struct drm_pvr_heap.size is set to zero.
> + */
> +enum drm_pvr_heap_id {
> +       /** @DRM_PVR_HEAP_GENERAL: General purpose heap. */
> +       DRM_PVR_HEAP_GENERAL =3D 0,
> +       /** @DRM_PVR_HEAP_PDS_CODE_DATA: PDS code and data heap. */
> +       DRM_PVR_HEAP_PDS_CODE_DATA,
> +       /** @DRM_PVR_HEAP_USC_CODE: USC code heap. */
> +       DRM_PVR_HEAP_USC_CODE,
> +       /** @DRM_PVR_HEAP_RGNHDR: Region header heap. Only used if GPU ha=
s
> BRN63142. */
> +       DRM_PVR_HEAP_RGNHDR,
> +       /** @DRM_PVR_HEAP_VIS_TEST: Visibility test heap. */
> +       DRM_PVR_HEAP_VIS_TEST,
> +       /** @DRM_PVR_HEAP_TRANSFER_FRAG: Transfer fragment heap. */
> +       DRM_PVR_HEAP_TRANSFER_FRAG,
> +
> +       /**
> +        * @DRM_PVR_HEAP_COUNT: The number of heaps returned by
> +        * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
> +        *
> +        * More heaps may be added, so this also serves as the copy limit
> when
> +        * sent by the caller.
> +        */
> +       DRM_PVR_HEAP_COUNT
> +       /* Please only add additional heaps above DRM_PVR_HEAP_COUNT! */
> +};
> +
> +/**
> + * DOC: Flags for DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
> + *
> + * .. c:macro:: DRM_PVR_HEAP_FLAG_STATIC_CARVEOUT_AT_END
> + *
> + *    The static data area is at the end of the heap memory area, rather
> than
> + *    at the beginning.
> + *    The base address will be:
> + *        drm_pvr_heap::base +
> + *            (drm_pvr_heap::size -
> drm_pvr_heap::static_data_carveout_size)
> + */
> +#define DRM_PVR_HEAP_FLAG_STATIC_CARVEOUT_AT_END _BITUL(0)
> +
> +/**
> + * struct drm_pvr_heap - Container holding information about a single
> heap.
> + *
> + * This will always be fetched as an array.
> + */
> +struct drm_pvr_heap {
> +       /** @base: Base address of heap. */
> +       __u64 base;
> +
> +       /**
> +        * @size: Size of heap, in bytes. Will be 0 if the heap is not
> present.
> +        */
> +       __u64 size;
> +
> +       /** @flags: Flags for this heap. See &enum drm_pvr_heap_flags. */
> +       __u32 flags;
> +
> +       /** @page_size_log2: Log2 of page size. */
> +       __u32 page_size_log2;
> +};
> +
> +/**
> + * struct drm_pvr_dev_query_heap_info - Container used to fetch
> information
> + * about heaps supported by the device driver.
> + *
> + * Please note all driver-supported heaps will be returned up to
> &heaps.count.
> + * Some heaps will not be present in all devices, which will be indicate=
d
> by
> + * &struct drm_pvr_heap.size being set to zero.
> + *
> + * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type mus=
t
> be set
> + * to %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
> + */
> +struct drm_pvr_dev_query_heap_info {
> +       /**
> +        * @heaps: Array of &struct drm_pvr_heap. If pointer is NULL, the
> count
> +        * and stride will be updated with those known to the driver
> version, to
> +        * facilitate allocation by the caller.
> +        */
> +       struct drm_pvr_obj_array heaps;
> +};
> +
> +/**
> + * enum drm_pvr_static_data_area_usage - Array index for static data are=
a
> info
> + * returned by %DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET.
> + *
> + * For compatibility reasons all indices will be present in the returned
> array,
> + * however some areas may not be present. These are indicated where
> + * &struct drm_pvr_static_data_area.size is set to zero.
> + */
> +enum drm_pvr_static_data_area_usage {
> +       /**
> +        * @DRM_PVR_STATIC_DATA_AREA_EOT: End of Tile USC program.
> +        *
> +        * The End of Tile task runs at completion of a tile, and is
> responsible for emitting the
> +        * tile to the Pixel Back End.
> +        */
> +       DRM_PVR_STATIC_DATA_AREA_EOT =3D 0,
> +
> +       /**
> +        * @DRM_PVR_STATIC_DATA_AREA_FENCE: MCU fence area, used during
> cache flush and
> +        * invalidation.
> +        *
> +        * This must point to valid physical memory but the contents
> otherwise are not used.
> +        */
> +       DRM_PVR_STATIC_DATA_AREA_FENCE,
> +
> +       /**
> +        * @DRM_PVR_STATIC_DATA_AREA_VDM_SYNC: VDM sync program.
> +        *
> +        * The VDM sync program is used to synchronise multiple areas of
> the GPU hardware.
> +        */
> +       DRM_PVR_STATIC_DATA_AREA_VDM_SYNC,
> +
> +       /**
> +        * @DRM_PVR_STATIC_DATA_AREA_YUV_CSC: YUV coefficients.
> +        *
> +        * Area contains up to 16 slots with stride of 64 bytes. Each is =
a
> 3x4 matrix of u16 fixed
> +        * point numbers, with 1 sign bit, 2 integer bits and 13
> fractional bits.
> +        *
> +        * The slots are :
> +        * 0 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR
> +        * 1 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR (fu=
ll
> range)
> +        * 2 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR
> (conformant range)
> +        * 3 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR (full ra=
nge)
> +        * 4 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR (conform=
ant
> range)
> +        * 5 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR (full ra=
nge)
> +        * 6 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR (conform=
ant
> range)
> +        * 7 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR (full
> range)
> +        * 8 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR
> (conformant range)
> +        * 9 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR (conform=
ant
> range, 10 bit)
> +        * 10 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR
> (conformant range, 10 bit)
> +        * 11 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR
> (conformant range, 10 bit)
> +        * 14 =3D Identity (biased)
> +        * 15 =3D Identity
> +        */
> +       DRM_PVR_STATIC_DATA_AREA_YUV_CSC,
> +};
> +
> +/**
> + * struct drm_pvr_static_data_area - Container holding information about=
 a
> + * single static data area.
> + *
> + * This will always be fetched as an array.
> + */
> +struct drm_pvr_static_data_area {
> +       /**
> +        * @area_usage: Usage of static data area.
> +        * See &enum drm_pvr_static_data_area_usage.
> +        */
> +       __u16 area_usage;
> +
> +       /**
> +        * @location_heap_id: Array index of heap where this of static da=
ta
> +        * area is located. This array is fetched using
> +        * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
> +        */
> +       __u16 location_heap_id;
> +
> +       /** @size: Size of static data area. Not present if set to zero. =
*/
> +       __u32 size;
> +
> +       /**
> +        * @offset: Offset of static data area from start of static data
> +        * carveout.
> +        */
> +       __u64 offset;
> +};
> +
> +/**
> + * struct drm_pvr_dev_query_static_data_areas - Container used to fetch
> + * information about the static data areas in heaps supported by the
> device
> + * driver.
> + *
> + * Please note all driver-supported static data areas will be returned u=
p
> to
> + * &static_data_areas.count. Some will not be present for all devices
> which,
> + * will be indicated by &struct drm_pvr_static_data_area.size being set
> to zero.
> + *
> + * Further, some heaps will not be present either. See &struct
> + * drm_pvr_dev_query_heap_info.
> + *
> + * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type mus=
t
> be set
> + * to %DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET.
> + */
> +struct drm_pvr_dev_query_static_data_areas {
> +       /**
> +        * @static_data_areas: Array of &struct drm_pvr_static_data_area.
> If
> +        * pointer is NULL, the count and stride will be updated with tho=
se
> +        * known to the driver version, to facilitate allocation by the
> caller.
> +        */
> +       struct drm_pvr_obj_array static_data_areas;
> +};
> +
> +/**
> + * enum drm_pvr_dev_query - For use with
> &drm_pvr_ioctl_dev_query_args.type to
> + * indicate the type of the receiving container.
> + *
> + * Append only. Do not reorder.
> + */
> +enum drm_pvr_dev_query {
> +       /**
> +        * @DRM_PVR_DEV_QUERY_GPU_INFO_GET: The dev query args contain a
> pointer
> +        * to &struct drm_pvr_dev_query_gpu_info.
> +        */
> +       DRM_PVR_DEV_QUERY_GPU_INFO_GET =3D 0,
> +
> +       /**
> +        * @DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET: The dev query args contai=
n
> a
> +        * pointer to &struct drm_pvr_dev_query_runtime_info.
> +        */
> +       DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET,
> +
> +       /**
> +        * @DRM_PVR_DEV_QUERY_QUIRKS_GET: The dev query args contain a
> pointer
> +        * to &struct drm_pvr_dev_query_quirks.
> +        */
> +       DRM_PVR_DEV_QUERY_QUIRKS_GET,
> +
> +       /**
> +        * @DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET: The dev query args contai=
n
> a
> +        * pointer to &struct drm_pvr_dev_query_enhancements.
> +        */
> +       DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
> +
> +       /**
> +        * @DRM_PVR_DEV_QUERY_HEAP_INFO_GET: The dev query args contain a
> +        * pointer to &struct drm_pvr_dev_query_heap_info.
> +        */
> +       DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
> +
> +       /**
> +        * @DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET: The dev query args
> contain
> +        * a pointer to &struct drm_pvr_dev_query_static_data_areas.
> +        */
> +       DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
> +};
> +
> +/**
> + * struct drm_pvr_ioctl_dev_query_args - Arguments for
> %DRM_IOCTL_PVR_DEV_QUERY.
> + */
> +struct drm_pvr_ioctl_dev_query_args {
> +       /**
> +        * @type: Type of query and output struct. See &enum
> drm_pvr_dev_query.
> +        */
> +       __u32 type;
> +
> +       /**
> +        * @size: Size of the receiving struct, see @type.
> +        *
> +        * After a successful call this will be updated to the written by=
te
> +        * length.
> +        * Can also be used to get the minimum byte length (see @pointer)=
.
> +        * This allows additional fields to be appended to the structs in
> +        * future.
> +        */
> +       __u32 size;
> +
> +       /**
> +        * @pointer: Pointer to struct @type.
> +        *
> +        * Must be large enough to contain @size bytes.
> +        * If pointer is NULL, the expected size will be returned in the
> @size
> +        * field, but no other data will be written.
> +        */
> +       __u64 pointer;
> +};
> +
> +/**
> + * DOC: PowerVR IOCTL CREATE_BO interface
> + */
> +
> +/**
> + * DOC: Flags for CREATE_BO
> + *
> + * The &struct drm_pvr_ioctl_create_bo_args.flags field is 64 bits wide
> and consists
> + * of three groups of flags: creation, device mapping and CPU mapping.
> + *
> + * We use "device" to refer to the GPU here because of the ambiguity
> between
> + * CPU and GPU in some fonts.
> + *
> + * Creation options
> + *    These use the prefix ``DRM_PVR_BO_CREATE_``.
> + *
> + * Device mapping options
> + *    These use the prefix ``DRM_PVR_BO_DEVICE_``.
> + *
> + *    :BYPASS_CACHE: There are very few situations where this flag is
> useful.
> + *       By default, the device flushes its memory caches after every jo=
b.
> + *    :PM_FW_PROTECT: Specify that only the Parameter Manager (PM) and/o=
r
> + *       firmware processor should be allowed to access this memory when
> mapped
> + *       to the device. It is not valid to specify this flag with
> + *       CPU_ALLOW_USERSPACE_ACCESS.
> + *
> + * CPU mapping options
> + *    These use the prefix ``DRM_PVR_BO_CPU_``.
> + *
> + *    :ALLOW_USERSPACE_ACCESS: Allow userspace to map and access the
> contents
> + *       of this memory. It is not valid to specify this flag with
> + *       DEVICE_PM_FW_PROTECT.
> + */
> +#define DRM_PVR_BO_DEVICE_BYPASS_CACHE _BITULL(0)
> +#define DRM_PVR_BO_DEVICE_PM_FW_PROTECT _BITULL(1)
> +#define DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS _BITULL(2)
> +/* Bits 3..63 are reserved. */
> +
> +/**
> + * struct drm_pvr_ioctl_create_bo_args - Arguments for
> %DRM_IOCTL_PVR_CREATE_BO
> + */
> +struct drm_pvr_ioctl_create_bo_args {
> +       /**
> +        * @size: [IN/OUT] Unaligned size of buffer object to create. On
> +        * return, this will be populated with the actual aligned size of
> the
> +        * new buffer.
> +        */
> +       __u64 size;
> +
> +       /**
> +        * @handle: [OUT] GEM handle of the new buffer object for use in
> +        * userspace.
> +        */
> +       __u32 handle;
> +
> +       /** @_padding_c: Reserved. This field must be zeroed. */
> +       __u32 _padding_c;
> +
> +       /**
> +        * @flags: [IN] Options which will affect the behaviour of this
> +        * creation operation and future mapping operations on the create=
d
> +        * object. This field must be a valid combination of
> ``DRM_PVR_BO_*``
> +        * values, with all bits marked as reserved set to zero.
> +        */
> +       __u64 flags;
> +};
> +
> +/**
> + * DOC: PowerVR IOCTL GET_BO_MMAP_OFFSET interface
> + */
> +
> +/**
> + * struct drm_pvr_ioctl_get_bo_mmap_offset_args - Arguments for
> + * %DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET
> + *
> + * Like other DRM drivers, the "mmap" IOCTL doesn't actually map any
> memory.
> + * Instead, it allocates a fake offset which refers to the specified
> buffer
> + * object. This offset can be used with a real mmap call on the DRM devi=
ce
> + * itself.
> + */
> +struct drm_pvr_ioctl_get_bo_mmap_offset_args {
> +       /** @handle: [IN] GEM handle of the buffer object to be mapped. *=
/
> +       __u32 handle;
> +
> +       /** @_padding_4: Reserved. This field must be zeroed. */
> +       __u32 _padding_4;
> +
> +       /** @offset: [OUT] Fake offset to use in the real mmap call. */
> +       __u64 offset;
> +};
> +
> +/**
> + * DOC: PowerVR IOCTL CREATE_VM_CONTEXT and DESTROY_VM_CONTEXT interface=
s
> + */
> +
> +/**
> + * struct drm_pvr_ioctl_create_vm_context_args - Arguments for
> + * %DRM_IOCTL_PVR_CREATE_VM_CONTEXT
> + */
> +struct drm_pvr_ioctl_create_vm_context_args {
> +       /** @handle: [OUT] Handle for new VM context. */
> +       __u32 handle;
> +
> +       /** @_padding_4: Reserved. This field must be zeroed. */
> +       __u32 _padding_4;
> +};
> +
> +/**
> + * struct drm_pvr_ioctl_destroy_vm_context_args - Arguments for
> + * %DRM_IOCTL_PVR_DESTROY_VM_CONTEXT
> + */
> +struct drm_pvr_ioctl_destroy_vm_context_args {
> +       /**
> +        * @handle: [IN] Handle for VM context to be destroyed.
> +        */
> +       __u32 handle;
> +
> +       /** @_padding_4: Reserved. This field must be zeroed. */
> +       __u32 _padding_4;
> +};
> +
> +/**
> + * DOC: PowerVR IOCTL VM_MAP and VM_UNMAP interfaces
> + *
> + * The VM UAPI allows userspace to create buffer object mappings in GPU
> virtual address space.
> + *
> + * The client is responsible for managing GPU address space. It should
> allocate mappings within
> + * the heaps returned by %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
> + *
> + * %DRM_IOCTL_PVR_VM_MAP creates a new mapping. The client provides the
> target virtual address for
> + * the mapping. Size and offset within the mapped buffer object can be
> specified, so the client can
> + * partially map a buffer.
> + *
> + * %DRM_IOCTL_PVR_VM_UNMAP removes a mapping. The entire mapping will be
> removed from GPU address
> + * space. For this reason only the start address is provided by the
> client.
> + */
> +
> +/**
> + * struct drm_pvr_ioctl_vm_map_args - Arguments for %DRM_IOCTL_PVR_VM_MA=
P.
> + */
> +struct drm_pvr_ioctl_vm_map_args {
> +       /**
> +        * @vm_context_handle: [IN] Handle for VM context for this mappin=
g
> to
> +        * exist in.
> +        */
> +       __u32 vm_context_handle;
> +
> +       /** @flags: [IN] Flags which affect this mapping. Currently alway=
s
> 0. */
> +       __u32 flags;
> +
> +       /**
> +        * @device_addr: [IN] Requested device-virtual address for the
> mapping.
> +        * This must be non-zero and aligned to the device page size for
> the
> +        * heap containing the requested address. It is an error to
> specify an
> +        * address which is not contained within one of the heaps returne=
d
> by
> +        * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
> +        */
> +       __u64 device_addr;
> +
> +       /**
> +        * @handle: [IN] Handle of the target buffer object. This must be=
 a
> +        * valid handle returned by %DRM_IOCTL_PVR_CREATE_BO.
> +        */
> +       __u32 handle;
> +
> +       /** @_padding_14: Reserved. This field must be zeroed. */
> +       __u32 _padding_14;
> +
> +       /**
> +        * @offset: [IN] Offset into the target bo from which to begin th=
e
> +        * mapping.
> +        */
> +       __u64 offset;
> +
> +       /**
> +        * @size: [IN] Size of the requested mapping. Must be aligned to
> +        * the device page size for the heap containing the requested
> address,
> +        * as well as the host page size. When added to @device_addr, the
> +        * result must not overflow the heap which contains @device_addr
> (i.e.
> +        * the range specified by @device_addr and @size must be complete=
ly
> +        * contained within a single heap specified by
> +        * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET).
> +        */
> +       __u64 size;
> +};
> +
> +/**
> + * struct drm_pvr_ioctl_vm_unmap_args - Arguments for
> %DRM_IOCTL_PVR_VM_UNMAP.
> + */
> +struct drm_pvr_ioctl_vm_unmap_args {
> +       /**
> +        * @vm_context_handle: [IN] Handle for VM context that this mappi=
ng
> +        * exists in.
> +        */
> +       __u32 vm_context_handle;
> +
> +       /** @_padding_4: Reserved. This field must be zeroed. */
> +       __u32 _padding_4;
> +
> +       /**
> +        * @device_addr: [IN] Device-virtual address at the start of the
> target
> +        * mapping. This must be non-zero.
> +        */
> +       __u64 device_addr;
> +
> +       /**
> +        * @size: Size in bytes of the target mapping. This must be
> non-zero.
> +        */
> +       __u64 size;
> +};
> +
> +/**
> + * DOC: PowerVR IOCTL CREATE_CONTEXT and DESTROY_CONTEXT interfaces
> + */
> +
> +/**
> + * enum drm_pvr_ctx_priority - Arguments for
> + * &drm_pvr_ioctl_create_context_args.priority
> + */
> +enum drm_pvr_ctx_priority {
> +       /** @DRM_PVR_CTX_PRIORITY_LOW: Priority below normal. */
> +       DRM_PVR_CTX_PRIORITY_LOW =3D -512,
> +
> +       /** @DRM_PVR_CTX_PRIORITY_NORMAL: Normal priority. */
> +       DRM_PVR_CTX_PRIORITY_NORMAL =3D 0,
> +
> +       /**
> +        * @DRM_PVR_CTX_PRIORITY_HIGH: Priority above normal.
> +        * Note this requires ``CAP_SYS_NICE`` or ``DRM_MASTER``.
> +        */
> +       DRM_PVR_CTX_PRIORITY_HIGH =3D 512,
> +};
> +
> +/**
> + * enum drm_pvr_ctx_type - Arguments for
> + * &struct drm_pvr_ioctl_create_context_args.type
> + */
> +enum drm_pvr_ctx_type {
> +       /**
> +        * @DRM_PVR_CTX_TYPE_RENDER: Render context. Use &struct
> +        * drm_pvr_ioctl_create_render_context_args for context creation
> arguments.
> +        */
> +       DRM_PVR_CTX_TYPE_RENDER =3D 0,
> +
> +       /**
> +        * @DRM_PVR_CTX_TYPE_COMPUTE: Compute context. Use &struct
> +        * drm_pvr_ioctl_create_compute_context_args for context creation
> arguments.
> +        */
> +       DRM_PVR_CTX_TYPE_COMPUTE,
> +
> +       /**
> +        * @DRM_PVR_CTX_TYPE_TRANSFER_FRAG: Transfer context for fragment
> data masters. Use
> +        * &struct drm_pvr_ioctl_create_transfer_context_args for context
> creation arguments.
> +        */
> +       DRM_PVR_CTX_TYPE_TRANSFER_FRAG,
> +};
> +
> +/**
> + * struct drm_pvr_ioctl_create_context_args - Arguments for
> + * %DRM_IOCTL_PVR_CREATE_CONTEXT
> + */
> +struct drm_pvr_ioctl_create_context_args {
> +       /**
> +        * @type: [IN] Type of context to create.
> +        *
> +        * This must be one of the values defined by &enum
> drm_pvr_ctx_type.
> +        */
> +       __u32 type;
> +
> +       /** @flags: [IN] Flags for context. */
> +       __u32 flags;
> +
> +       /**
> +        * @priority: [IN] Priority of new context.
> +        *
> +        * This must be one of the values defined by &enum
> drm_pvr_ctx_priority.
> +        */
> +       __s32 priority;
> +
> +       /** @handle: [OUT] Handle for new context. */
> +       __u32 handle;
> +
> +       /**
> +        * @static_context_state: [IN] Pointer to static context state
> stream.
> +        */
> +       __u64 static_context_state;
> +
> +       /**
> +        * @static_context_state_len: [IN] Length of static context state=
,
> in bytes.
> +        */
> +       __u32 static_context_state_len;
> +
> +       /**
> +        * @vm_context_handle: [IN] Handle for VM context that this
> context is
> +        * associated with.
> +        */
> +       __u32 vm_context_handle;
> +
> +       /**
> +        * @callstack_addr: [IN] Address for initial call stack pointer.
> Only valid
> +        * if @type is %DRM_PVR_CTX_TYPE_RENDER, otherwise must be 0.
> +        */
> +       __u64 callstack_addr;
> +};
> +
> +/**
> + * struct drm_pvr_ioctl_destroy_context_args - Arguments for
> + * %DRM_IOCTL_PVR_DESTROY_CONTEXT
> + */
> +struct drm_pvr_ioctl_destroy_context_args {
> +       /**
> +        * @handle: [IN] Handle for context to be destroyed.
> +        */
> +       __u32 handle;
> +
> +       /** @_padding_4: Reserved. This field must be zeroed. */
> +       __u32 _padding_4;
> +};
> +
> +/**
> + * DOC: PowerVR IOCTL CREATE_FREE_LIST and DESTROY_FREE_LIST interfaces
> + */
> +
> +/**
> + * struct drm_pvr_ioctl_create_free_list_args - Arguments for
> + * %DRM_IOCTL_PVR_CREATE_FREE_LIST
> + *
> + * Free list arguments have the following constraints :
> + *
> + * - @max_num_pages must be greater than zero.
> + * - @grow_threshold must be between 0 and 100.
> + * - @grow_num_pages must be less than or equal to &max_num_pages.
> + * - @initial_num_pages, @max_num_pages and @grow_num_pages must be
> multiples
> + *   of 4.
> + * - When &grow_num_pages is 0, @initial_num_pages must be equal to
> + *   @max_num_pages.
> + * - When &grow_num_pages is non-zero, @initial_num_pages must be less
> than
> + *   @max_num_pages.
> + */
> +struct drm_pvr_ioctl_create_free_list_args {
> +       /**
> +        * @free_list_gpu_addr: [IN] Address of GPU mapping of buffer
> object
> +        * containing memory to be used by free list.
> +        *
> +        * The mapped region of the buffer object must be at least
> +        * @max_num_pages * ``sizeof(__u32)``.
> +        *
> +        * The buffer object must have been created with
> +        * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT set and
> +        * %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS not set.
> +        */
> +       __u64 free_list_gpu_addr;
> +
> +       /** @initial_num_pages: [IN] Pages initially allocated to free
> list. */
> +       __u32 initial_num_pages;
> +
> +       /** @max_num_pages: [IN] Maximum number of pages in free list. */
> +       __u32 max_num_pages;
> +
> +       /** @grow_num_pages: [IN] Pages to grow free list by per request.
> */
> +       __u32 grow_num_pages;
> +
> +       /**
> +        * @grow_threshold: [IN] Percentage of FL memory used that should
> +        * trigger a new grow request.
> +        */
> +       __u32 grow_threshold;
> +
> +       /**
> +        * @vm_context_handle: [IN] Handle for VM context that the free
> list buffer
> +        * object is mapped in.
> +        */
> +       __u32 vm_context_handle;
> +
> +       /**
> +        * @handle: [OUT] Handle for created free list.
> +        */
> +       __u32 handle;
> +};
> +
> +/**
> + * struct drm_pvr_ioctl_destroy_free_list_args - Arguments for
> + * %DRM_IOCTL_PVR_DESTROY_FREE_LIST
> + */
> +struct drm_pvr_ioctl_destroy_free_list_args {
> +       /**
> +        * @handle: [IN] Handle for free list to be destroyed.
> +        */
> +       __u32 handle;
> +
> +       /** @_padding_4: Reserved. This field must be zeroed. */
> +       __u32 _padding_4;
> +};
> +
> +/**
> + * DOC: PowerVR IOCTL CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET
> interfaces
> + */
> +
> +/**
> + * struct drm_pvr_create_hwrt_geom_data_args - Geometry data arguments
> used for
> + * &struct drm_pvr_ioctl_create_hwrt_dataset_args.geom_data_args.
> + */
> +struct drm_pvr_create_hwrt_geom_data_args {
> +       /** @tpc_dev_addr: [IN] Tail pointer cache GPU virtual address. *=
/
> +       __u64 tpc_dev_addr;
> +
> +       /** @tpc_size: [IN] Size of TPC, in bytes. */
> +       __u32 tpc_size;
> +
> +       /** @tpc_stride: [IN] Stride between layers in TPC, in pages */
> +       __u32 tpc_stride;
> +
> +       /** @vheap_table_dev_addr: [IN] VHEAP table GPU virtual address. =
*/
> +       __u64 vheap_table_dev_addr;
> +
> +       /** @rtc_dev_addr: [IN] Render Target Cache virtual address. */
> +       __u64 rtc_dev_addr;
> +};
> +
> +/**
> + * struct drm_pvr_create_hwrt_rt_data_args - Render target arguments use=
d
> for
> + * &struct drm_pvr_ioctl_create_hwrt_dataset_args.rt_data_args.
> + */
> +struct drm_pvr_create_hwrt_rt_data_args {
> +       /** @pm_mlist_dev_addr: [IN] PM MLIST GPU virtual address. */
> +       __u64 pm_mlist_dev_addr;
> +
> +       /** @macrotile_array_dev_addr: [IN] Macrotile array GPU virtual
> address. */
> +       __u64 macrotile_array_dev_addr;
> +
> +       /** @region_header_dev_addr: [IN] Region header array GPU virtual
> address. */
> +       __u64 region_header_dev_addr;
> +};
> +
> +/**
> + * struct drm_pvr_ioctl_create_hwrt_dataset_args - Arguments for
> + * %DRM_IOCTL_PVR_CREATE_HWRT_DATASET
> + */
> +struct drm_pvr_ioctl_create_hwrt_dataset_args {
> +       /** @geom_data_args: [IN] Geometry data arguments. */
> +       struct drm_pvr_create_hwrt_geom_data_args geom_data_args;
> +
> +       /** @rt_data_args: [IN] Array of render target arguments. */
> +       struct drm_pvr_create_hwrt_rt_data_args rt_data_args[2];
> +
> +       /**
> +        * @free_list_handles: [IN] Array of free list handles.
> +        *
> +        * free_list_handles[0] must have initial size of at least that
> reported
> +        * by &drm_pvr_dev_query_runtime_info.free_list_min_pages.
> +        */
> +       __u32 free_list_handles[2];
> +
> +       /** @width: [IN] Width in pixels. */
> +       __u32 width;
> +
> +       /** @height: [IN] Height in pixels. */
> +       __u32 height;
> +
> +       /** @samples: [IN] Number of samples. */
> +       __u32 samples;
> +
> +       /** @layers: [IN] Number of layers. */
> +       __u32 layers;
> +
> +       /** @isp_merge_lower_x: [IN] Lower X coefficient for triangle
> merging. */
> +       __u32 isp_merge_lower_x;
> +
> +       /** @isp_merge_lower_y: [IN] Lower Y coefficient for triangle
> merging. */
> +       __u32 isp_merge_lower_y;
> +
> +       /** @isp_merge_scale_x: [IN] Scale X coefficient for triangle
> merging. */
> +       __u32 isp_merge_scale_x;
> +
> +       /** @isp_merge_scale_y: [IN] Scale Y coefficient for triangle
> merging. */
> +       __u32 isp_merge_scale_y;
> +
> +       /** @isp_merge_upper_x: [IN] Upper X coefficient for triangle
> merging. */
> +       __u32 isp_merge_upper_x;
> +
> +       /** @isp_merge_upper_y: [IN] Upper Y coefficient for triangle
> merging. */
> +       __u32 isp_merge_upper_y;
> +
> +       /**
> +        * @region_header_size: [IN] Size of region header array. This
> common field is used by
> +        * both render targets in this data set.
> +        *
> +        * The units for this field differ depending on what version of
> the simple internal
> +        * parameter format the device uses. If format 2 is in use then
> this is interpreted as the
> +        * number of region headers. For other formats it is interpreted
> as the size in dwords.
> +        */
> +       __u32 region_header_size;
> +
> +       /**
> +        * @handle: [OUT] Handle for created HWRT dataset.
> +        */
> +       __u32 handle;
> +};
> +
> +/**
> + * struct drm_pvr_ioctl_destroy_hwrt_dataset_args - Arguments for
> + * %DRM_IOCTL_PVR_DESTROY_HWRT_DATASET
> + */
> +struct drm_pvr_ioctl_destroy_hwrt_dataset_args {
> +       /**
> +        * @handle: [IN] Handle for HWRT dataset to be destroyed.
> +        */
> +       __u32 handle;
> +
> +       /** @_padding_4: Reserved. This field must be zeroed. */
> +       __u32 _padding_4;
> +};
> +
> +/**
> + * DOC: PowerVR IOCTL SUBMIT_JOBS interface
> + */
> +
> +/**
> + * DOC: Flags for the drm_pvr_sync_op object.
> + *
> + * .. c:macro:: DRM_PVR_SYNC_OP_HANDLE_TYPE_MASK
> + *
> + *    Handle type mask for the drm_pvr_sync_op::flags field.
> + *
> + * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ
> + *
> + *    Indicates the handle passed in drm_pvr_sync_op::handle is a syncob=
j
> handle.
> + *    This is the default type.
> + *
> + * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_TIMELINE_SYNCOBJ
> + *
> + *    Indicates the handle passed in drm_pvr_sync_op::handle is a
> timeline syncobj handle.
> + *
> + * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_SIGNAL
> + *
> + *    Signal operation requested. The out-fence bound to the job will be
> attached to
> + *    the syncobj whose handle is passed in drm_pvr_sync_op::handle.
> + *
> + * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_WAIT
> + *
> + *    Wait operation requested. The job will wait for this particular
> syncobj or syncobj
> + *    point to be signaled before being started.
> + *    This is the default operation.
> + */
> +#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_MASK 0xf
> +#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ 0
> +#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_TIMELINE_SYNCOBJ 1
> +#define DRM_PVR_SYNC_OP_FLAG_SIGNAL _BITULL(31)
> +#define DRM_PVR_SYNC_OP_FLAG_WAIT 0
> +
> +#define DRM_PVR_SYNC_OP_FLAGS_MASK (DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_MAS=
K
> | \
> +                                   DRM_PVR_SYNC_OP_FLAG_SIGNAL)
> +
> +/**
> + * struct drm_pvr_sync_op - Object describing a sync operation
> + */
> +struct drm_pvr_sync_op {
> +       /** @handle: Handle of sync object. */
> +       __u32 handle;
> +
> +       /** @flags: Combination of ``DRM_PVR_SYNC_OP_FLAG_`` flags. */
> +       __u32 flags;
> +
> +       /** @value: Timeline value for this drm_syncobj. MBZ for a binary
> syncobj. */
> +       __u64 value;
> +};
> +
> +/**
> + * DOC: Flags for SUBMIT_JOB ioctl geometry command.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST
> + *
> + *    Indicates if this the first command to be issued for a render.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST
> + *
> + *    Indicates if this the last command to be issued for a render.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE
> + *
> + *    Forces to use single core in a multi core device.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK
> + *
> + *    Logical OR of all the geometry cmd flags.
> + */
> +#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST _BITULL(0)
> +#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST _BITULL(1)
> +#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE _BITULL(2)
> +#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK
>      \
> +       (DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST |
>      \
> +        DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST |
>     \
> +        DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE)
> +
> +/**
> + * DOC: Flags for SUBMIT_JOB ioctl fragment command.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE
> + *
> + *    Use single core in a multi core setup.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER
> + *
> + *    Indicates whether a depth buffer is present.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER
> + *
> + *    Indicates whether a stencil buffer is present.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP
> + *
> + *    Disallow compute overlapped with this render.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS
> + *
> + *    Indicates whether this render produces visibility results.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER
> + *
> + *    Indicates whether partial renders write to a scratch buffer instea=
d
> of
> + *    the final surface. It also forces the full screen copy expected to
> be
> + *    present on the last render after all partial renders have complete=
d.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK
> + *
> + *    Logical OR of all the fragment cmd flags.
> + */
> +#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE _BITULL(0)
> +#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER _BITULL(1)
> +#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER _BITULL(2)
> +#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP _BITULL(3)
> +#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER _BITULL(4)
> +#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS _BITULL(5)
> +#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_PARTIAL_RENDER _BITULL(6)
> +#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK
>      \
> +       (DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE |
>      \
> +        DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER |
>      \
> +        DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER |
>      \
> +        DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP |
>      \
> +        DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER |
>      \
> +        DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS |
>      \
> +        DRM_PVR_SUBMIT_JOB_FRAG_CMD_PARTIAL_RENDER)
> +
> +/**
> + * DOC: Flags for SUBMIT_JOB ioctl compute command.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP
> + *
> + *    Disallow other jobs overlapped with this compute.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE
> + *
> + *    Forces to use single core in a multi core device.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK
> + *
> + *    Logical OR of all the compute cmd flags.
> + */
> +#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP _BITULL(0)
> +#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE _BITULL(1)
> +#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK         \
> +       (DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP | \
> +        DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE)
> +
> +/**
> + * DOC: Flags for SUBMIT_JOB ioctl transfer command.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE
> + *
> + *    Forces job to use a single core in a multi core device.
> + *
> + * .. c:macro:: DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK
> + *
> + *    Logical OR of all the transfer cmd flags.
> + */
> +#define DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE _BITULL(0)
> +
> +#define DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK \
> +       DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE
> +
> +/**
> + * enum drm_pvr_job_type - Arguments for &struct drm_pvr_job.job_type
> + */
> +enum drm_pvr_job_type {
> +       /** @DRM_PVR_JOB_TYPE_GEOMETRY: Job type is geometry. */
> +       DRM_PVR_JOB_TYPE_GEOMETRY =3D 0,
> +
> +       /** @DRM_PVR_JOB_TYPE_FRAGMENT: Job type is fragment. */
> +       DRM_PVR_JOB_TYPE_FRAGMENT,
> +
> +       /** @DRM_PVR_JOB_TYPE_COMPUTE: Job type is compute. */
> +       DRM_PVR_JOB_TYPE_COMPUTE,
> +
> +       /** @DRM_PVR_JOB_TYPE_TRANSFER_FRAG: Job type is a fragment
> transfer. */
> +       DRM_PVR_JOB_TYPE_TRANSFER_FRAG,
> +};
> +
> +/**
> + * struct drm_pvr_hwrt_data_ref - Reference HWRT data
> + */
> +struct drm_pvr_hwrt_data_ref {
> +       /** @set_handle: HWRT data set handle. */
> +       __u32 set_handle;
> +
> +       /** @data_index: Index of the HWRT data inside the data set. */
> +       __u32 data_index;
> +};
> +
> +/**
> + * struct drm_pvr_job - Job arguments passed to the
> %DRM_IOCTL_PVR_SUBMIT_JOBS ioctl
> + */
> +struct drm_pvr_job {
> +       /**
> +        * @type: [IN] Type of job being submitted
> +        *
> +        * This must be one of the values defined by &enum
> drm_pvr_job_type.
> +        */
> +       __u32 type;
> +
> +       /**
> +        * @context_handle: [IN] Context handle.
> +        *
> +        * When @job_type is %DRM_PVR_JOB_TYPE_RENDER,
> %DRM_PVR_JOB_TYPE_COMPUTE or
> +        * %DRM_PVR_JOB_TYPE_TRANSFER_FRAG, this must be a valid handle
> returned by
> +        * %DRM_IOCTL_PVR_CREATE_CONTEXT. The type of context must be
> compatible
> +        * with the type of job being submitted.
> +        *
> +        * When @job_type is %DRM_PVR_JOB_TYPE_NULL, this must be zero.
> +        */
> +       __u32 context_handle;
> +
> +       /**
> +        * @flags: [IN] Flags for command.
> +        *
> +        * Those are job-dependent. See all ``DRM_PVR_SUBMIT_JOB_*``.
> +        */
> +       __u32 flags;
> +
> +       /**
> +        * @cmd_stream_len: [IN] Length of command stream, in bytes.
> +        */
> +       __u32 cmd_stream_len;
> +
> +       /**
> +        * @cmd_stream: [IN] Pointer to command stream for command.
> +        *
> +        * The command stream must be u64-aligned.
> +        */
> +       __u64 cmd_stream;
> +
> +       /** @sync_ops: [IN] Fragment sync operations. */
> +       struct drm_pvr_obj_array sync_ops;
> +
> +       /**
> +        * @hwrt: [IN] HWRT data used by render jobs (geometry or
> fragment).
> +        *
> +        * Must be zero for non-render jobs.
> +        */
> +       struct drm_pvr_hwrt_data_ref hwrt;
> +};
> +
> +/**
> + * struct drm_pvr_ioctl_submit_jobs_args - Arguments for
> %DRM_IOCTL_PVR_SUBMIT_JOB
> + *
> + * If the syscall returns an error it is important to check the value of
> + * @jobs.count. This indicates the index into @jobs.array where the
> + * error occurred.
> + */
> +struct drm_pvr_ioctl_submit_jobs_args {
> +       /** @jobs: [IN] Array of jobs to submit. */
> +       struct drm_pvr_obj_array jobs;
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* PVR_DRM_UAPI_H */
> --
> 2.41.0
>
>

--00000000000070c759060327d293
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Aug 16, 2023 at 3:26=E2=80=AFAM Sarah Walker &lt;<a href=3D"=
mailto:sarah.walker@imgtec.com">sarah.walker@imgtec.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Add the UAPI impleme=
ntation for the PowerVR driver.<br>
<br>
Changes from v4 :<br>
- Remove CREATE_ZEROED flag for BO creation (all buffers are now zeroed)<br=
>
<br>
Co-developed-by: Frank Binns &lt;<a href=3D"mailto:frank.binns@imgtec.com" =
target=3D"_blank">frank.binns@imgtec.com</a>&gt;<br>
Signed-off-by: Frank Binns &lt;<a href=3D"mailto:frank.binns@imgtec.com" ta=
rget=3D"_blank">frank.binns@imgtec.com</a>&gt;<br>
Co-developed-by: Boris Brezillon &lt;<a href=3D"mailto:boris.brezillon@coll=
abora.com" target=3D"_blank">boris.brezillon@collabora.com</a>&gt;<br>
Signed-off-by: Boris Brezillon &lt;<a href=3D"mailto:boris.brezillon@collab=
ora.com" target=3D"_blank">boris.brezillon@collabora.com</a>&gt;<br>
Co-developed-by: Matt Coster &lt;<a href=3D"mailto:matt.coster@imgtec.com" =
target=3D"_blank">matt.coster@imgtec.com</a>&gt;<br>
Signed-off-by: Matt Coster &lt;<a href=3D"mailto:matt.coster@imgtec.com" ta=
rget=3D"_blank">matt.coster@imgtec.com</a>&gt;<br>
Co-developed-by: Donald Robson &lt;<a href=3D"mailto:donald.robson@imgtec.c=
om" target=3D"_blank">donald.robson@imgtec.com</a>&gt;<br>
Signed-off-by: Donald Robson &lt;<a href=3D"mailto:donald.robson@imgtec.com=
" target=3D"_blank">donald.robson@imgtec.com</a>&gt;<br>
Signed-off-by: Sarah Walker &lt;<a href=3D"mailto:sarah.walker@imgtec.com" =
target=3D"_blank">sarah.walker@imgtec.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 1 +<br>
=C2=A0include/uapi/drm/pvr_drm.h | 1303 +++++++++++++++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 1304 insertions(+)<br>
=C2=A0create mode 100644 include/uapi/drm/pvr_drm.h<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index f84390bb6cfe..55e17f8aea91 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -10144,6 +10144,7 @@ M:=C2=A0 =C2=A0 =C2=A0 Sarah Walker &lt;<a href=3D"=
mailto:sarah.walker@imgtec.com" target=3D"_blank">sarah.walker@imgtec.com</=
a>&gt;<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Donald Robson &lt;<a href=3D"mailto:donald.robs=
on@imgtec.com" target=3D"_blank">donald.robson@imgtec.com</a>&gt;<br>
=C2=A0S:=C2=A0 =C2=A0 =C2=A0Supported<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/bindings/gpu/img,power=
vr.yaml<br>
+F:=C2=A0 =C2=A0 =C2=A0include/uapi/drm/pvr_drm.h<br>
<br>
=C2=A0IMON SOUNDGRAPH USB IR RECEIVER<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Sean Young &lt;<a href=3D"mailto:sean@mess.org"=
 target=3D"_blank">sean@mess.org</a>&gt;<br>
diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h<br>
new file mode 100644<br>
index 000000000000..c0aac8b135ca<br>
--- /dev/null<br>
+++ b/include/uapi/drm/pvr_drm.h<br>
@@ -0,0 +1,1303 @@<br>
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT */<br=
>
+/* Copyright (c) 2023 Imagination Technologies Ltd. */<br>
+<br>
+#ifndef PVR_DRM_UAPI_H<br>
+#define PVR_DRM_UAPI_H<br>
+<br>
+#include &quot;drm.h&quot;<br>
+<br>
+#include &lt;linux/const.h&gt;<br>
+#include &lt;linux/types.h&gt;<br>
+<br>
+#if defined(__cplusplus)<br>
+extern &quot;C&quot; {<br>
+#endif<br>
+<br>
+/**<br>
+ * DOC: PowerVR UAPI<br>
+ *<br>
+ * The PowerVR IOCTL argument structs have a few limitations in place, in<=
br>
+ * addition to the standard kernel restrictions:<br>
+ *<br>
+ *=C2=A0 - All members must be type-aligned.<br>
+ *=C2=A0 - The overall struct must be padded to 64-bit alignment.<br>
+ *=C2=A0 - Explicit padding is almost always required. This takes the form=
 of<br>
+ *=C2=A0 =C2=A0 ``_padding_[x]`` members of sufficient size to pad to the =
next power-of-two<br>
+ *=C2=A0 =C2=A0 alignment, where [x] is the offset into the struct in hexa=
decimal. Arrays<br>
+ *=C2=A0 =C2=A0 are never used for alignment. Padding fields must be zeroe=
d; this is<br>
+ *=C2=A0 =C2=A0 always checked.<br>
+ *=C2=A0 - Unions may only appear as the last member of a struct.<br>
+ *=C2=A0 - Individual union members may grow in the future. The space betw=
een the<br>
+ *=C2=A0 =C2=A0 end of a union member and the end of its containing union =
is considered<br>
+ *=C2=A0 =C2=A0 &quot;implicit padding&quot; and must be zeroed. This is a=
lways checked.<br>
+ *<br>
+ * In addition to the IOCTL argument structs, the PowerVR UAPI makes use o=
f<br>
+ * DEV_QUERY argument structs. These are used to fetch information about t=
he<br>
+ * device and runtime. These structs are subject to the same rules set out=
<br>
+ * above.<br>
+ */<br>
+<br>
+/**<br>
+ * struct drm_pvr_obj_array - Container used to pass arrays of objects<br>
+ *<br>
+ * It is not unusual to have to extend objects to pass new parameters, and=
 the DRM<br>
+ * ioctl infrastructure is supporting that by padding ioctl arguments with=
 zeros<br>
+ * when the data passed by userspace is smaller than the struct defined in=
 the<br>
+ * drm_ioctl_desc, thus keeping things backward compatible. This type is j=
ust<br>
+ * applying the same concepts to indirect objects passed through arrays re=
ferenced<br>
+ * from the main ioctl arguments structure: the stride basically defines t=
he size<br>
+ * of the object passed by userspace, which allows the kernel driver to pa=
d with<br>
+ * zeros when it&#39;s smaller than the size of the object it expects.<br>
+ *<br>
+ * Use ``DRM_PVR_OBJ_ARRAY()`` to fill object array fields, unless you<br>
+ * have a very good reason not to.<br>
+ */<br>
+struct drm_pvr_obj_array {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @stride: Stride of object struct. Used for =
versioning. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 stride;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @count: Number of objects in the array. */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 count;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @array: User pointer to an array of objects=
. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 array;<br>
+};<br>
+<br>
+/**<br>
+ * DRM_PVR_OBJ_ARRAY() - Helper macro for filling &amp;struct drm_pvr_obj_=
array.<br>
+ * @cnt: Number of elements pointed to py @ptr.<br>
+ * @ptr: Pointer to start of a C array.<br>
+ *<br>
+ * Return: Literal of type &amp;struct drm_pvr_obj_array.<br>
+ */<br>
+#define DRM_PVR_OBJ_ARRAY(cnt, ptr) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .stride =3D sizeof((ptr)[0]), .count =3D (cnt=
), .array =3D (__u64)(uintptr_t)(ptr) }<br>
+<br>
+/**<br>
+ * DOC: PowerVR IOCTL interface<br>
+ */<br>
+<br>
+/**<br>
+ * PVR_IOCTL() - Build a PowerVR IOCTL number<br>
+ * @_ioctl: An incrementing id for this IOCTL. Added to %DRM_COMMAND_BASE.=
<br>
+ * @_mode: Must be one of %DRM_IOR, %DRM_IOW or %DRM_IOWR.<br>
+ * @_data: The type of the args struct passed by this IOCTL.<br>
+ *<br>
+ * The struct referred to by @_data must have a ``drm_pvr_ioctl_`` prefix =
and an<br>
+ * ``_args suffix``. They are therefore omitted from @_data.<br>
+ *<br>
+ * This should only be used to build the constants described below; it sho=
uld<br>
+ * never be used to call an IOCTL directly.<br>
+ *<br>
+ * Return: An IOCTL number to be passed to ioctl() from userspace.<br>
+ */<br>
+#define PVR_IOCTL(_ioctl, _mode, _data) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_mode(DRM_COMMAND_BASE + (_ioctl), struct drm_p=
vr_ioctl_##_data##_args)<br>
+<br>
+#define DRM_IOCTL_PVR_DEV_QUERY PVR_IOCTL(0x00, DRM_IOWR, dev_query)<br>
+#define DRM_IOCTL_PVR_CREATE_BO PVR_IOCTL(0x01, DRM_IOWR, create_bo)<br>
+#define DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET PVR_IOCTL(0x02, DRM_IOWR, get_bo_=
mmap_offset)<br>
+#define DRM_IOCTL_PVR_CREATE_VM_CONTEXT PVR_IOCTL(0x03, DRM_IOWR, create_v=
m_context)<br>
+#define DRM_IOCTL_PVR_DESTROY_VM_CONTEXT PVR_IOCTL(0x04, DRM_IOW, destroy_=
vm_context)<br>
+#define DRM_IOCTL_PVR_VM_MAP PVR_IOCTL(0x05, DRM_IOW, vm_map)<br>
+#define DRM_IOCTL_PVR_VM_UNMAP PVR_IOCTL(0x06, DRM_IOW, vm_unmap)<br>
+#define DRM_IOCTL_PVR_CREATE_CONTEXT PVR_IOCTL(0x07, DRM_IOWR, create_cont=
ext)<br>
+#define DRM_IOCTL_PVR_DESTROY_CONTEXT PVR_IOCTL(0x08, DRM_IOW, destroy_con=
text)<br>
+#define DRM_IOCTL_PVR_CREATE_FREE_LIST PVR_IOCTL(0x09, DRM_IOWR, create_fr=
ee_list)<br>
+#define DRM_IOCTL_PVR_DESTROY_FREE_LIST PVR_IOCTL(0x0a, DRM_IOW, destroy_f=
ree_list)<br>
+#define DRM_IOCTL_PVR_CREATE_HWRT_DATASET PVR_IOCTL(0x0b, DRM_IOWR, create=
_hwrt_dataset)<br>
+#define DRM_IOCTL_PVR_DESTROY_HWRT_DATASET PVR_IOCTL(0x0c, DRM_IOW, destro=
y_hwrt_dataset)<br>
+#define DRM_IOCTL_PVR_SUBMIT_JOBS PVR_IOCTL(0x0d, DRM_IOW, submit_jobs)<br=
>
+<br>
+/**<br>
+ * DOC: PowerVR IOCTL DEV_QUERY interface<br>
+ */<br>
+<br>
+/**<br>
+ * struct drm_pvr_dev_query_gpu_info - Container used to fetch information=
 about<br>
+ * the graphics processor.<br>
+ *<br>
+ * When fetching this type &amp;struct drm_pvr_ioctl_dev_query_args.type m=
ust be set<br>
+ * to %DRM_PVR_DEV_QUERY_GPU_INFO_GET.<br>
+ */<br>
+struct drm_pvr_dev_query_gpu_info {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @gpu_id: GPU identifier.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For all currently supported GPUs this is the=
 BVNC encoded as a 64-bit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * value as follows:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 +--------+--------+--------+---=
----+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 | 63..48 | 47..32 | 31..16 | 15=
..0 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 | B=C2=A0 =C2=A0 =C2=A0 | V=C2=
=A0 =C2=A0 =C2=A0 | N=C2=A0 =C2=A0 =C2=A0 | C=C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 +--------+--------+--------+---=
----+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 gpu_id;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @num_phantoms: Number of Phantoms present.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 num_phantoms;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_dev_query_runtime_info - Container used to fetch informa=
tion<br>
+ * about the graphics runtime.<br>
+ *<br>
+ * When fetching this type &amp;struct drm_pvr_ioctl_dev_query_args.type m=
ust be set<br>
+ * to %DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET.<br>
+ */<br>
+struct drm_pvr_dev_query_runtime_info {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @free_list_min_pages: Minimum allowed free l=
ist size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * in PM physical pages.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 free_list_min_pages;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @free_list_max_pages: Maximum allowed free l=
ist size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * in PM physical pages.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 free_list_max_pages;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @common_store_alloc_region_size: Size of the=
 Allocation<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Region within the Common Store used for coef=
ficient and shared<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * registers, in dwords.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 common_store_alloc_region_size;<br></bloc=
kquote><div><br></div><div>Any reason why this is in dwords?=C2=A0 It&#39;s=
 not really my place to have an opinion but that seems like kind-of a funny=
 unit for the size of an allocation region. Why not just bytes?<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @common_store_partition_space_size: Size of =
the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Partition Space within the Common Store for =
output buffers, in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * dwords.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 common_store_partition_space_size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @max_coeffs: Maximum coefficients, in dwords=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 max_coeffs;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @cdm_max_local_mem_size_regs: Maximum amount=
 of local<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * memory available to a compute kernel, in dwo=
rds.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 cdm_max_local_mem_size_regs;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_dev_query_quirks - Container used to fetch information a=
bout<br>
+ * hardware fixes for which the device may require support in the user mod=
e<br>
+ * driver.<br>
+ *<br>
+ * When fetching this type &amp;struct drm_pvr_ioctl_dev_query_args.type m=
ust be set<br>
+ * to %DRM_PVR_DEV_QUERY_QUIRKS_GET.<br>
+ */<br>
+struct drm_pvr_dev_query_quirks {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @quirks: A userspace address for the hardwar=
e quirks __u32 array.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The first @musthave_count items in the list =
are quirks that the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * client must support for this device. If user=
space does not support<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * all these quirks then functionality is not g=
uaranteed and client<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * initialisation must fail.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The remaining quirks in the list affect user=
space and the kernel or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * firmware. They are disabled by default and r=
equire userspace to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * opt-in. The opt-in mechanism depends on the =
quirk.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 quirks;<br></blockquote><div><br></div><d=
iv>Where are these quirk IDs defined and where do they come from? If they&#=
39;re effectively coming from hardware, possibly via firmware, that&#39;s p=
robably okay.=C2=A0 The important thing is that quirks should only ever get=
 removed for any given piece of hardware otherwise you risk breaking usersp=
ace.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @count: Length of @quirks (number of __u32)=
. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u16 count;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @musthave_count: The number of entries in @q=
uirks that are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * mandatory, starting at index 0.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u16 musthave_count;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_c: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_c;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_dev_query_enhancements - Container used to fetch informa=
tion<br>
+ * about optional enhancements supported by the device that require suppor=
t in<br>
+ * the user mode driver.<br>
+ *<br>
+ * When fetching this type &amp;struct drm_pvr_ioctl_dev_query_args.type m=
ust be set<br>
+ * to %DRM_PVR_DEV_ENHANCEMENTS_GET.<br>
+ */<br>
+struct drm_pvr_dev_query_enhancements {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @enhancements: A userspace address for the h=
ardware enhancements<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * __u32 array.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * These enhancements affect userspace and the =
kernel or firmware. They<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * are disabled by default and require userspac=
e to opt-in. The opt-in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * mechanism depends on the quirk.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 enhancements;<br></blockquote><div><br></=
div><div>Can you provide some examples of &quot;enhancements&quot;? Not tha=
t you need to put it in the docs. I&#39;m just trying to understand what th=
is API is doing so I can better review. Again, where do these come from? Al=
so, how is an enhancement different from a quirk?</div><div><br></div><div>=
~Faith<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @count: Length of @enhancements (number of =
__u32). */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u16 count;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_a: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u16 _padding_a;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_c: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_c;<br>
+};<br>
+<br>
+/**<br>
+ * enum drm_pvr_heap_id - Array index for heap info data returned by<br>
+ * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.<br>
+ *<br>
+ * For compatibility reasons all indices will be present in the returned a=
rray,<br>
+ * however some heaps may not be present. These are indicated where<br>
+ * &amp;struct drm_pvr_heap.size is set to zero.<br>
+ */<br>
+enum drm_pvr_heap_id {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_HEAP_GENERAL: General purpose heap=
. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_HEAP_GENERAL =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_HEAP_PDS_CODE_DATA: PDS code and d=
ata heap. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_HEAP_PDS_CODE_DATA,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_HEAP_USC_CODE: USC code heap. */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_HEAP_USC_CODE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_HEAP_RGNHDR: Region header heap. O=
nly used if GPU has BRN63142. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_HEAP_RGNHDR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_HEAP_VIS_TEST: Visibility test hea=
p. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_HEAP_VIS_TEST,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_HEAP_TRANSFER_FRAG: Transfer fragm=
ent heap. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_HEAP_TRANSFER_FRAG,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_HEAP_COUNT: The number of heaps ret=
urned by<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * More heaps may be added, so this also serves=
 as the copy limit when<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * sent by the caller.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_HEAP_COUNT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Please only add additional heaps above DRM_P=
VR_HEAP_COUNT! */<br>
+};<br>
+<br>
+/**<br>
+ * DOC: Flags for DRM_PVR_DEV_QUERY_HEAP_INFO_GET.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_HEAP_FLAG_STATIC_CARVEOUT_AT_END<br>
+ *<br>
+ *=C2=A0 =C2=A0 The static data area is at the end of the heap memory area=
, rather than<br>
+ *=C2=A0 =C2=A0 at the beginning.<br>
+ *=C2=A0 =C2=A0 The base address will be:<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_pvr_heap::base +<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (drm_pvr_heap::size - drm_pvr_=
heap::static_data_carveout_size)<br>
+ */<br>
+#define DRM_PVR_HEAP_FLAG_STATIC_CARVEOUT_AT_END _BITUL(0)<br>
+<br>
+/**<br>
+ * struct drm_pvr_heap - Container holding information about a single heap=
.<br>
+ *<br>
+ * This will always be fetched as an array.<br>
+ */<br>
+struct drm_pvr_heap {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @base: Base address of heap. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 base;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @size: Size of heap, in bytes. Will be 0 if =
the heap is not present.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @flags: Flags for this heap. See &amp;enum =
drm_pvr_heap_flags. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @page_size_log2: Log2 of page size. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 page_size_log2;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_dev_query_heap_info - Container used to fetch informatio=
n<br>
+ * about heaps supported by the device driver.<br>
+ *<br>
+ * Please note all driver-supported heaps will be returned up to &amp;heap=
s.count.<br>
+ * Some heaps will not be present in all devices, which will be indicated =
by<br>
+ * &amp;struct drm_pvr_heap.size being set to zero.<br>
+ *<br>
+ * When fetching this type &amp;struct drm_pvr_ioctl_dev_query_args.type m=
ust be set<br>
+ * to %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.<br>
+ */<br>
+struct drm_pvr_dev_query_heap_info {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @heaps: Array of &amp;struct drm_pvr_heap. I=
f pointer is NULL, the count<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and stride will be updated with those known =
to the driver version, to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * facilitate allocation by the caller.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_pvr_obj_array heaps;<br>
+};<br>
+<br>
+/**<br>
+ * enum drm_pvr_static_data_area_usage - Array index for static data area =
info<br>
+ * returned by %DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET.<br>
+ *<br>
+ * For compatibility reasons all indices will be present in the returned a=
rray,<br>
+ * however some areas may not be present. These are indicated where<br>
+ * &amp;struct drm_pvr_static_data_area.size is set to zero.<br>
+ */<br>
+enum drm_pvr_static_data_area_usage {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_STATIC_DATA_AREA_EOT: End of Tile U=
SC program.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The End of Tile task runs at completion of a=
 tile, and is responsible for emitting the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * tile to the Pixel Back End.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_STATIC_DATA_AREA_EOT =3D 0,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_STATIC_DATA_AREA_FENCE: MCU fence a=
rea, used during cache flush and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * invalidation.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This must point to valid physical memory but=
 the contents otherwise are not used.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_STATIC_DATA_AREA_FENCE,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_STATIC_DATA_AREA_VDM_SYNC: VDM sync=
 program.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The VDM sync program is used to synchronise =
multiple areas of the GPU hardware.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_STATIC_DATA_AREA_VDM_SYNC,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_STATIC_DATA_AREA_YUV_CSC: YUV coeff=
icients.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Area contains up to 16 slots with stride of =
64 bytes. Each is a 3x4 matrix of u16 fixed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * point numbers, with 1 sign bit, 2 integer bi=
ts and 13 fractional bits.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The slots are :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 0 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_=
IDENTITY_KHR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBC=
R_IDENTITY_KHR (full range)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 2 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBC=
R_IDENTITY_KHR (conformant range)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 3 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBC=
R_709_KHR (full range)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 4 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBC=
R_709_KHR (conformant range)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBC=
R_601_KHR (full range)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBC=
R_601_KHR (conformant range)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBC=
R_2020_KHR (full range)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 8 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBC=
R_2020_KHR (conformant range)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 9 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBC=
R_601_KHR (conformant range, 10 bit)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 10 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCB=
CR_709_KHR (conformant range, 10 bit)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 11 =3D VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCB=
CR_2020_KHR (conformant range, 10 bit)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 14 =3D Identity (biased)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 15 =3D Identity<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_STATIC_DATA_AREA_YUV_CSC,<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_static_data_area - Container holding information about a=
<br>
+ * single static data area.<br>
+ *<br>
+ * This will always be fetched as an array.<br>
+ */<br>
+struct drm_pvr_static_data_area {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @area_usage: Usage of static data area.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * See &amp;enum drm_pvr_static_data_area_usage=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u16 area_usage;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @location_heap_id: Array index of heap where=
 this of static data<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * area is located. This array is fetched using=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u16 location_heap_id;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @size: Size of static data area. Not presen=
t if set to zero. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @offset: Offset of static data area from sta=
rt of static data<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * carveout.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 offset;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_dev_query_static_data_areas - Container used to fetch<br=
>
+ * information about the static data areas in heaps supported by the devic=
e<br>
+ * driver.<br>
+ *<br>
+ * Please note all driver-supported static data areas will be returned up =
to<br>
+ * &amp;static_data_areas.count. Some will not be present for all devices =
which,<br>
+ * will be indicated by &amp;struct drm_pvr_static_data_area.size being se=
t to zero.<br>
+ *<br>
+ * Further, some heaps will not be present either. See &amp;struct<br>
+ * drm_pvr_dev_query_heap_info.<br>
+ *<br>
+ * When fetching this type &amp;struct drm_pvr_ioctl_dev_query_args.type m=
ust be set<br>
+ * to %DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET.<br>
+ */<br>
+struct drm_pvr_dev_query_static_data_areas {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @static_data_areas: Array of &amp;struct drm=
_pvr_static_data_area. If<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * pointer is NULL, the count and stride will b=
e updated with those<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * known to the driver version, to facilitate a=
llocation by the caller.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_pvr_obj_array static_data_areas;<br>
+};<br>
+<br>
+/**<br>
+ * enum drm_pvr_dev_query - For use with &amp;drm_pvr_ioctl_dev_query_args=
.type to<br>
+ * indicate the type of the receiving container.<br>
+ *<br>
+ * Append only. Do not reorder.<br>
+ */<br>
+enum drm_pvr_dev_query {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_DEV_QUERY_GPU_INFO_GET: The dev que=
ry args contain a pointer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to &amp;struct drm_pvr_dev_query_gpu_info.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_DEV_QUERY_GPU_INFO_GET =3D 0,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET: The dev=
 query args contain a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * pointer to &amp;struct drm_pvr_dev_query_run=
time_info.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_DEV_QUERY_QUIRKS_GET: The dev query=
 args contain a pointer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to &amp;struct drm_pvr_dev_query_quirks.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_DEV_QUERY_QUIRKS_GET,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET: The dev=
 query args contain a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * pointer to &amp;struct drm_pvr_dev_query_enh=
ancements.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_DEV_QUERY_HEAP_INFO_GET: The dev qu=
ery args contain a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * pointer to &amp;struct drm_pvr_dev_query_hea=
p_info.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_DEV_QUERY_HEAP_INFO_GET,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET: Th=
e dev query args contain<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * a pointer to &amp;struct drm_pvr_dev_query_s=
tatic_data_areas.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_dev_query_args - Arguments for %DRM_IOCTL_PVR_DEV_=
QUERY.<br>
+ */<br>
+struct drm_pvr_ioctl_dev_query_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @type: Type of query and output struct. See =
&amp;enum drm_pvr_dev_query.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 type;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @size: Size of the receiving struct, see @ty=
pe.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * After a successful call this will be updated=
 to the written byte<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * length.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Can also be used to get the minimum byte len=
gth (see @pointer).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This allows additional fields to be appended=
 to the structs in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * future.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @pointer: Pointer to struct @type.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Must be large enough to contain @size bytes.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If pointer is NULL, the expected size will b=
e returned in the @size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * field, but no other data will be written.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 pointer;<br>
+};<br>
+<br>
+/**<br>
+ * DOC: PowerVR IOCTL CREATE_BO interface<br>
+ */<br>
+<br>
+/**<br>
+ * DOC: Flags for CREATE_BO<br>
+ *<br>
+ * The &amp;struct drm_pvr_ioctl_create_bo_args.flags field is 64 bits wid=
e and consists<br>
+ * of three groups of flags: creation, device mapping and CPU mapping.<br>
+ *<br>
+ * We use &quot;device&quot; to refer to the GPU here because of the ambig=
uity between<br>
+ * CPU and GPU in some fonts.<br>
+ *<br>
+ * Creation options<br>
+ *=C2=A0 =C2=A0 These use the prefix ``DRM_PVR_BO_CREATE_``.<br>
+ *<br>
+ * Device mapping options<br>
+ *=C2=A0 =C2=A0 These use the prefix ``DRM_PVR_BO_DEVICE_``.<br>
+ *<br>
+ *=C2=A0 =C2=A0 :BYPASS_CACHE: There are very few situations where this fl=
ag is useful.<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0By default, the device flushes its memory cac=
hes after every job.<br>
+ *=C2=A0 =C2=A0 :PM_FW_PROTECT: Specify that only the Parameter Manager (P=
M) and/or<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0firmware processor should be allowed to acces=
s this memory when mapped<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0to the device. It is not valid to specify thi=
s flag with<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_ALLOW_USERSPACE_ACCESS.<br>
+ *<br>
+ * CPU mapping options<br>
+ *=C2=A0 =C2=A0 These use the prefix ``DRM_PVR_BO_CPU_``.<br>
+ *<br>
+ *=C2=A0 =C2=A0 :ALLOW_USERSPACE_ACCESS: Allow userspace to map and access=
 the contents<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0of this memory. It is not valid to specify th=
is flag with<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0DEVICE_PM_FW_PROTECT.<br>
+ */<br>
+#define DRM_PVR_BO_DEVICE_BYPASS_CACHE _BITULL(0)<br>
+#define DRM_PVR_BO_DEVICE_PM_FW_PROTECT _BITULL(1)<br>
+#define DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS _BITULL(2)<br>
+/* Bits 3..63 are reserved. */<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_create_bo_args - Arguments for %DRM_IOCTL_PVR_CREA=
TE_BO<br>
+ */<br>
+struct drm_pvr_ioctl_create_bo_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @size: [IN/OUT] Unaligned size of buffer obj=
ect to create. On<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * return, this will be populated with the actu=
al aligned size of the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * new buffer.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: [OUT] GEM handle of the new buffer =
object for use in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * userspace.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_c: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_c;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: [IN] Options which will affect the b=
ehaviour of this<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * creation operation and future mapping operat=
ions on the created<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * object. This field must be a valid combinati=
on of ``DRM_PVR_BO_*``<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * values, with all bits marked as reserved set=
 to zero.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 flags;<br>
+};<br>
+<br>
+/**<br>
+ * DOC: PowerVR IOCTL GET_BO_MMAP_OFFSET interface<br>
+ */<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_get_bo_mmap_offset_args - Arguments for<br>
+ * %DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET<br>
+ *<br>
+ * Like other DRM drivers, the &quot;mmap&quot; IOCTL doesn&#39;t actually=
 map any memory.<br>
+ * Instead, it allocates a fake offset which refers to the specified buffe=
r<br>
+ * object. This offset can be used with a real mmap call on the DRM device=
<br>
+ * itself.<br>
+ */<br>
+struct drm_pvr_ioctl_get_bo_mmap_offset_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @handle: [IN] GEM handle of the buffer obje=
ct to be mapped. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_4: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_4;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @offset: [OUT] Fake offset to use in the re=
al mmap call. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 offset;<br>
+};<br>
+<br>
+/**<br>
+ * DOC: PowerVR IOCTL CREATE_VM_CONTEXT and DESTROY_VM_CONTEXT interfaces<=
br>
+ */<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_create_vm_context_args - Arguments for<br>
+ * %DRM_IOCTL_PVR_CREATE_VM_CONTEXT<br>
+ */<br>
+struct drm_pvr_ioctl_create_vm_context_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @handle: [OUT] Handle for new VM context. *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_4: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_4;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_destroy_vm_context_args - Arguments for<br>
+ * %DRM_IOCTL_PVR_DESTROY_VM_CONTEXT<br>
+ */<br>
+struct drm_pvr_ioctl_destroy_vm_context_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: [IN] Handle for VM context to be de=
stroyed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_4: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_4;<br>
+};<br>
+<br>
+/**<br>
+ * DOC: PowerVR IOCTL VM_MAP and VM_UNMAP interfaces<br>
+ *<br>
+ * The VM UAPI allows userspace to create buffer object mappings in GPU vi=
rtual address space.<br>
+ *<br>
+ * The client is responsible for managing GPU address space. It should all=
ocate mappings within<br>
+ * the heaps returned by %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.<br>
+ *<br>
+ * %DRM_IOCTL_PVR_VM_MAP creates a new mapping. The client provides the ta=
rget virtual address for<br>
+ * the mapping. Size and offset within the mapped buffer object can be spe=
cified, so the client can<br>
+ * partially map a buffer.<br>
+ *<br>
+ * %DRM_IOCTL_PVR_VM_UNMAP removes a mapping. The entire mapping will be r=
emoved from GPU address<br>
+ * space. For this reason only the start address is provided by the client=
.<br>
+ */<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_vm_map_args - Arguments for %DRM_IOCTL_PVR_VM_MAP.=
<br>
+ */<br>
+struct drm_pvr_ioctl_vm_map_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @vm_context_handle: [IN] Handle for VM conte=
xt for this mapping to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * exist in.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_context_handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @flags: [IN] Flags which affect this mappin=
g. Currently always 0. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @device_addr: [IN] Requested device-virtual =
address for the mapping.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This must be non-zero and aligned to the dev=
ice page size for the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * heap containing the requested address. It is=
 an error to specify an<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * address which is not contained within one of=
 the heaps returned by<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 device_addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: [IN] Handle of the target buffer ob=
ject. This must be a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * valid handle returned by %DRM_IOCTL_PVR_CREA=
TE_BO.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_14: Reserved. This field must be =
zeroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_14;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @offset: [IN] Offset into the target bo from=
 which to begin the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * mapping.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 offset;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @size: [IN] Size of the requested mapping. M=
ust be aligned to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the device page size for the heap containing=
 the requested address,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * as well as the host page size. When added to=
 @device_addr, the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * result must not overflow the heap which cont=
ains @device_addr (i.e.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the range specified by @device_addr and @siz=
e must be completely<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * contained within a single heap specified by<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 size;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_vm_unmap_args - Arguments for %DRM_IOCTL_PVR_VM_UN=
MAP.<br>
+ */<br>
+struct drm_pvr_ioctl_vm_unmap_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @vm_context_handle: [IN] Handle for VM conte=
xt that this mapping<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * exists in.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_context_handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_4: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_4;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @device_addr: [IN] Device-virtual address at=
 the start of the target<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * mapping. This must be non-zero.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 device_addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @size: Size in bytes of the target mapping. =
This must be non-zero.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 size;<br>
+};<br>
+<br>
+/**<br>
+ * DOC: PowerVR IOCTL CREATE_CONTEXT and DESTROY_CONTEXT interfaces<br>
+ */<br>
+<br>
+/**<br>
+ * enum drm_pvr_ctx_priority - Arguments for<br>
+ * &amp;drm_pvr_ioctl_create_context_args.priority<br>
+ */<br>
+enum drm_pvr_ctx_priority {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_CTX_PRIORITY_LOW: Priority below n=
ormal. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_CTX_PRIORITY_LOW =3D -512,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_CTX_PRIORITY_NORMAL: Normal priori=
ty. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_CTX_PRIORITY_NORMAL =3D 0,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_CTX_PRIORITY_HIGH: Priority above n=
ormal.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Note this requires ``CAP_SYS_NICE`` or ``DRM=
_MASTER``.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_CTX_PRIORITY_HIGH =3D 512,<br>
+};<br>
+<br>
+/**<br>
+ * enum drm_pvr_ctx_type - Arguments for<br>
+ * &amp;struct drm_pvr_ioctl_create_context_args.type<br>
+ */<br>
+enum drm_pvr_ctx_type {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_CTX_TYPE_RENDER: Render context. Us=
e &amp;struct<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * drm_pvr_ioctl_create_render_context_args for=
 context creation arguments.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_CTX_TYPE_RENDER =3D 0,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_CTX_TYPE_COMPUTE: Compute context. =
Use &amp;struct<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * drm_pvr_ioctl_create_compute_context_args fo=
r context creation arguments.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_CTX_TYPE_COMPUTE,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @DRM_PVR_CTX_TYPE_TRANSFER_FRAG: Transfer co=
ntext for fragment data masters. Use<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * &amp;struct drm_pvr_ioctl_create_transfer_co=
ntext_args for context creation arguments.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_CTX_TYPE_TRANSFER_FRAG,<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_create_context_args - Arguments for<br>
+ * %DRM_IOCTL_PVR_CREATE_CONTEXT<br>
+ */<br>
+struct drm_pvr_ioctl_create_context_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @type: [IN] Type of context to create.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This must be one of the values defined by &a=
mp;enum drm_pvr_ctx_type.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 type;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @flags: [IN] Flags for context. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @priority: [IN] Priority of new context.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This must be one of the values defined by &a=
mp;enum drm_pvr_ctx_priority.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__s32 priority;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @handle: [OUT] Handle for new context. */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @static_context_state: [IN] Pointer to stati=
c context state stream.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 static_context_state;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @static_context_state_len: [IN] Length of st=
atic context state, in bytes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 static_context_state_len;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @vm_context_handle: [IN] Handle for VM conte=
xt that this context is<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * associated with.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_context_handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @callstack_addr: [IN] Address for initial ca=
ll stack pointer. Only valid<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * if @type is %DRM_PVR_CTX_TYPE_RENDER, otherw=
ise must be 0.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 callstack_addr;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_destroy_context_args - Arguments for<br>
+ * %DRM_IOCTL_PVR_DESTROY_CONTEXT<br>
+ */<br>
+struct drm_pvr_ioctl_destroy_context_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: [IN] Handle for context to be destr=
oyed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_4: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_4;<br>
+};<br>
+<br>
+/**<br>
+ * DOC: PowerVR IOCTL CREATE_FREE_LIST and DESTROY_FREE_LIST interfaces<br=
>
+ */<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_create_free_list_args - Arguments for<br>
+ * %DRM_IOCTL_PVR_CREATE_FREE_LIST<br>
+ *<br>
+ * Free list arguments have the following constraints :<br>
+ *<br>
+ * - @max_num_pages must be greater than zero.<br>
+ * - @grow_threshold must be between 0 and 100.<br>
+ * - @grow_num_pages must be less than or equal to &amp;max_num_pages.<br>
+ * - @initial_num_pages, @max_num_pages and @grow_num_pages must be multip=
les<br>
+ *=C2=A0 =C2=A0of 4.<br>
+ * - When &amp;grow_num_pages is 0, @initial_num_pages must be equal to<br=
>
+ *=C2=A0 =C2=A0@max_num_pages.<br>
+ * - When &amp;grow_num_pages is non-zero, @initial_num_pages must be less=
 than<br>
+ *=C2=A0 =C2=A0@max_num_pages.<br>
+ */<br>
+struct drm_pvr_ioctl_create_free_list_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @free_list_gpu_addr: [IN] Address of GPU map=
ping of buffer object<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * containing memory to be used by free list.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The mapped region of the buffer object must =
be at least<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @max_num_pages * ``sizeof(__u32)``.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The buffer object must have been created wit=
h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT set and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS not s=
et.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 free_list_gpu_addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @initial_num_pages: [IN] Pages initially al=
located to free list. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 initial_num_pages;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @max_num_pages: [IN] Maximum number of page=
s in free list. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 max_num_pages;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @grow_num_pages: [IN] Pages to grow free li=
st by per request. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 grow_num_pages;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @grow_threshold: [IN] Percentage of FL memor=
y used that should<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * trigger a new grow request.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 grow_threshold;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @vm_context_handle: [IN] Handle for VM conte=
xt that the free list buffer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * object is mapped in.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 vm_context_handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: [OUT] Handle for created free list.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_destroy_free_list_args - Arguments for<br>
+ * %DRM_IOCTL_PVR_DESTROY_FREE_LIST<br>
+ */<br>
+struct drm_pvr_ioctl_destroy_free_list_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: [IN] Handle for free list to be des=
troyed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_4: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_4;<br>
+};<br>
+<br>
+/**<br>
+ * DOC: PowerVR IOCTL CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET interfa=
ces<br>
+ */<br>
+<br>
+/**<br>
+ * struct drm_pvr_create_hwrt_geom_data_args - Geometry data arguments use=
d for<br>
+ * &amp;struct drm_pvr_ioctl_create_hwrt_dataset_args.geom_data_args.<br>
+ */<br>
+struct drm_pvr_create_hwrt_geom_data_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @tpc_dev_addr: [IN] Tail pointer cache GPU =
virtual address. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 tpc_dev_addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @tpc_size: [IN] Size of TPC, in bytes. */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 tpc_size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @tpc_stride: [IN] Stride between layers in =
TPC, in pages */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 tpc_stride;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @vheap_table_dev_addr: [IN] VHEAP table GPU=
 virtual address. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 vheap_table_dev_addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @rtc_dev_addr: [IN] Render Target Cache vir=
tual address. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 rtc_dev_addr;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_create_hwrt_rt_data_args - Render target arguments used =
for<br>
+ * &amp;struct drm_pvr_ioctl_create_hwrt_dataset_args.rt_data_args.<br>
+ */<br>
+struct drm_pvr_create_hwrt_rt_data_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @pm_mlist_dev_addr: [IN] PM MLIST GPU virtu=
al address. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 pm_mlist_dev_addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @macrotile_array_dev_addr: [IN] Macrotile a=
rray GPU virtual address. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 macrotile_array_dev_addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @region_header_dev_addr: [IN] Region header=
 array GPU virtual address. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 region_header_dev_addr;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_create_hwrt_dataset_args - Arguments for<br>
+ * %DRM_IOCTL_PVR_CREATE_HWRT_DATASET<br>
+ */<br>
+struct drm_pvr_ioctl_create_hwrt_dataset_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @geom_data_args: [IN] Geometry data argumen=
ts. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_pvr_create_hwrt_geom_data_args geom_=
data_args;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @rt_data_args: [IN] Array of render target =
arguments. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_pvr_create_hwrt_rt_data_args rt_data=
_args[2];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @free_list_handles: [IN] Array of free list =
handles.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * free_list_handles[0] must have initial size =
of at least that reported<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * by &amp;drm_pvr_dev_query_runtime_info.free_=
list_min_pages.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 free_list_handles[2];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @width: [IN] Width in pixels. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 width;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @height: [IN] Height in pixels. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 height;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @samples: [IN] Number of samples. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 samples;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @layers: [IN] Number of layers. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 layers;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @isp_merge_lower_x: [IN] Lower X coefficien=
t for triangle merging. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 isp_merge_lower_x;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @isp_merge_lower_y: [IN] Lower Y coefficien=
t for triangle merging. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 isp_merge_lower_y;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @isp_merge_scale_x: [IN] Scale X coefficien=
t for triangle merging. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 isp_merge_scale_x;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @isp_merge_scale_y: [IN] Scale Y coefficien=
t for triangle merging. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 isp_merge_scale_y;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @isp_merge_upper_x: [IN] Upper X coefficien=
t for triangle merging. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 isp_merge_upper_x;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @isp_merge_upper_y: [IN] Upper Y coefficien=
t for triangle merging. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 isp_merge_upper_y;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @region_header_size: [IN] Size of region hea=
der array. This common field is used by<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * both render targets in this data set.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The units for this field differ depending on=
 what version of the simple internal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * parameter format the device uses. If format =
2 is in use then this is interpreted as the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * number of region headers. For other formats =
it is interpreted as the size in dwords.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 region_header_size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: [OUT] Handle for created HWRT datas=
et.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_destroy_hwrt_dataset_args - Arguments for<br>
+ * %DRM_IOCTL_PVR_DESTROY_HWRT_DATASET<br>
+ */<br>
+struct drm_pvr_ioctl_destroy_hwrt_dataset_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @handle: [IN] Handle for HWRT dataset to be =
destroyed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @_padding_4: Reserved. This field must be z=
eroed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 _padding_4;<br>
+};<br>
+<br>
+/**<br>
+ * DOC: PowerVR IOCTL SUBMIT_JOBS interface<br>
+ */<br>
+<br>
+/**<br>
+ * DOC: Flags for the drm_pvr_sync_op object.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SYNC_OP_HANDLE_TYPE_MASK<br>
+ *<br>
+ *=C2=A0 =C2=A0 Handle type mask for the drm_pvr_sync_op::flags field.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ<br>
+ *<br>
+ *=C2=A0 =C2=A0 Indicates the handle passed in drm_pvr_sync_op::handle is =
a syncobj handle.<br>
+ *=C2=A0 =C2=A0 This is the default type.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_TIMELINE_SYNCOBJ<br>
+ *<br>
+ *=C2=A0 =C2=A0 Indicates the handle passed in drm_pvr_sync_op::handle is =
a timeline syncobj handle.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_SIGNAL<br>
+ *<br>
+ *=C2=A0 =C2=A0 Signal operation requested. The out-fence bound to the job=
 will be attached to<br>
+ *=C2=A0 =C2=A0 the syncobj whose handle is passed in drm_pvr_sync_op::han=
dle.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_WAIT<br>
+ *<br>
+ *=C2=A0 =C2=A0 Wait operation requested. The job will wait for this parti=
cular syncobj or syncobj<br>
+ *=C2=A0 =C2=A0 point to be signaled before being started.<br>
+ *=C2=A0 =C2=A0 This is the default operation.<br>
+ */<br>
+#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_MASK 0xf<br>
+#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ 0<br>
+#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_TIMELINE_SYNCOBJ 1<br>
+#define DRM_PVR_SYNC_OP_FLAG_SIGNAL _BITULL(31)<br>
+#define DRM_PVR_SYNC_OP_FLAG_WAIT 0<br>
+<br>
+#define DRM_PVR_SYNC_OP_FLAGS_MASK (DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_MASK =
| \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_SYNC_OP_FLAG_SI=
GNAL)<br>
+<br>
+/**<br>
+ * struct drm_pvr_sync_op - Object describing a sync operation<br>
+ */<br>
+struct drm_pvr_sync_op {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @handle: Handle of sync object. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @flags: Combination of ``DRM_PVR_SYNC_OP_FL=
AG_`` flags. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @value: Timeline value for this drm_syncobj=
. MBZ for a binary syncobj. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 value;<br>
+};<br>
+<br>
+/**<br>
+ * DOC: Flags for SUBMIT_JOB ioctl geometry command.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST<br>
+ *<br>
+ *=C2=A0 =C2=A0 Indicates if this the first command to be issued for a ren=
der.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST<br>
+ *<br>
+ *=C2=A0 =C2=A0 Indicates if this the last command to be issued for a rend=
er.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE<br>
+ *<br>
+ *=C2=A0 =C2=A0 Forces to use single core in a multi core device.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK<br>
+ *<br>
+ *=C2=A0 =C2=A0 Logical OR of all the geometry cmd flags.<br>
+ */<br>
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST _BITULL(0)<br>
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST _BITULL(1)<br>
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE _BITULL(2)<br>
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE)<br>
+<br>
+/**<br>
+ * DOC: Flags for SUBMIT_JOB ioctl fragment command.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE<br>
+ *<br>
+ *=C2=A0 =C2=A0 Use single core in a multi core setup.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER<br>
+ *<br>
+ *=C2=A0 =C2=A0 Indicates whether a depth buffer is present.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER<br>
+ *<br>
+ *=C2=A0 =C2=A0 Indicates whether a stencil buffer is present.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP<br>
+ *<br>
+ *=C2=A0 =C2=A0 Disallow compute overlapped with this render.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS<br>
+ *<br>
+ *=C2=A0 =C2=A0 Indicates whether this render produces visibility results.=
<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER<br>
+ *<br>
+ *=C2=A0 =C2=A0 Indicates whether partial renders write to a scratch buffe=
r instead of<br>
+ *=C2=A0 =C2=A0 the final surface. It also forces the full screen copy exp=
ected to be<br>
+ *=C2=A0 =C2=A0 present on the last render after all partial renders have =
completed.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK<br>
+ *<br>
+ *=C2=A0 =C2=A0 Logical OR of all the fragment cmd flags.<br>
+ */<br>
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE _BITULL(0)<br>
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER _BITULL(1)<br>
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER _BITULL(2)<br>
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP _BITULL(3)<br>
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER _BITULL(4)<br>
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS _BITULL(5)<br>
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_PARTIAL_RENDER _BITULL(6)<br>
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLA=
P |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_PVR_SUBMIT_JOB_FRAG_CMD_PARTIAL_RENDER)<br=
>
+<br>
+/**<br>
+ * DOC: Flags for SUBMIT_JOB ioctl compute command.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP<br>
+ *<br>
+ *=C2=A0 =C2=A0 Disallow other jobs overlapped with this compute.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE<br>
+ *<br>
+ *=C2=A0 =C2=A0 Forces to use single core in a multi core device.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK<br>
+ *<br>
+ *=C2=A0 =C2=A0 Logical OR of all the compute cmd flags.<br>
+ */<br>
+#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP _BITULL(0)<br>
+#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE _BITULL(1)<br>
+#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVE=
RLAP | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE)<br=
>
+<br>
+/**<br>
+ * DOC: Flags for SUBMIT_JOB ioctl transfer command.<br>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE<br>
+ *<br>
+ *=C2=A0 =C2=A0 Forces job to use a single core in a multi core device.<br=
>
+ *<br>
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK<br>
+ *<br>
+ *=C2=A0 =C2=A0 Logical OR of all the transfer cmd flags.<br>
+ */<br>
+#define DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE _BITULL(0)<br>
+<br>
+#define DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE<br>
+<br>
+/**<br>
+ * enum drm_pvr_job_type - Arguments for &amp;struct drm_pvr_job.job_type<=
br>
+ */<br>
+enum drm_pvr_job_type {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_JOB_TYPE_GEOMETRY: Job type is geo=
metry. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_JOB_TYPE_GEOMETRY =3D 0,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_JOB_TYPE_FRAGMENT: Job type is fra=
gment. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_JOB_TYPE_FRAGMENT,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_JOB_TYPE_COMPUTE: Job type is comp=
ute. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_JOB_TYPE_COMPUTE,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @DRM_PVR_JOB_TYPE_TRANSFER_FRAG: Job type i=
s a fragment transfer. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_PVR_JOB_TYPE_TRANSFER_FRAG,<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_hwrt_data_ref - Reference HWRT data<br>
+ */<br>
+struct drm_pvr_hwrt_data_ref {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @set_handle: HWRT data set handle. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 set_handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @data_index: Index of the HWRT data inside =
the data set. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 data_index;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_job - Job arguments passed to the %DRM_IOCTL_PVR_SUBMIT_=
JOBS ioctl<br>
+ */<br>
+struct drm_pvr_job {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @type: [IN] Type of job being submitted<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This must be one of the values defined by &a=
mp;enum drm_pvr_job_type.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 type;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @context_handle: [IN] Context handle.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * When @job_type is %DRM_PVR_JOB_TYPE_RENDER, =
%DRM_PVR_JOB_TYPE_COMPUTE or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * %DRM_PVR_JOB_TYPE_TRANSFER_FRAG, this must b=
e a valid handle returned by<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * %DRM_IOCTL_PVR_CREATE_CONTEXT. The type of c=
ontext must be compatible<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * with the type of job being submitted.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * When @job_type is %DRM_PVR_JOB_TYPE_NULL, th=
is must be zero.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 context_handle;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @flags: [IN] Flags for command.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Those are job-dependent. See all ``DRM_PVR_S=
UBMIT_JOB_*``.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @cmd_stream_len: [IN] Length of command stre=
am, in bytes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 cmd_stream_len;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @cmd_stream: [IN] Pointer to command stream =
for command.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The command stream must be u64-aligned.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 cmd_stream;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @sync_ops: [IN] Fragment sync operations. *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_pvr_obj_array sync_ops;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @hwrt: [IN] HWRT data used by render jobs (g=
eometry or fragment).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Must be zero for non-render jobs.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_pvr_hwrt_data_ref hwrt;<br>
+};<br>
+<br>
+/**<br>
+ * struct drm_pvr_ioctl_submit_jobs_args - Arguments for %DRM_IOCTL_PVR_SU=
BMIT_JOB<br>
+ *<br>
+ * If the syscall returns an error it is important to check the value of<b=
r>
+ * @jobs.count. This indicates the index into @jobs.array where the<br>
+ * error occurred.<br>
+ */<br>
+struct drm_pvr_ioctl_submit_jobs_args {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/** @jobs: [IN] Array of jobs to submit. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_pvr_obj_array jobs;<br>
+};<br>
+<br>
+#if defined(__cplusplus)<br>
+}<br>
+#endif<br>
+<br>
+#endif /* PVR_DRM_UAPI_H */<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div></div>

--00000000000070c759060327d293--
