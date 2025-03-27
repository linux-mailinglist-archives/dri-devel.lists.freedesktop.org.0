Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC84A7416C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 00:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A4110E1BB;
	Thu, 27 Mar 2025 23:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D2E10E8BF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:17:49 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so142986566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 06:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743081468; x=1743686268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MxqyHAkreNiCf90LkbxvpMqU4kz++Hi9F50PZQIt+XM=;
 b=kIHEi4tAGwjg2KhXRB6zHBSHFqNpYoAkUlFCZ2GYfPPoNp2TLHW75375/y1tKP2DMG
 itLCz5eaK8eHjH3WVKd+EyeqEm4qYc2tC6qsRnkL8uE7CycQaIqrAG5IpMd8ZvjFi9LY
 VVvxgb6DDleJPfQwlmL9r7oDDGz8mCS4jXKWtBIWRcjeDMVLONp+BXSVy9l7O4JfQXxN
 reOtG6EIxE7N4svDDxMyeZ1L3LwV3rMViAx1iw3BLkEk7L7mD6AxJkzZY/TE2rpC06wq
 260JgdGch0jqQbMwKNn5YbquikSf7p/TAH9igXaXICBpeP3PEwFvRbTi12KpZ1WlbRll
 0QXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUwPwwJeietCVyT0434PhBnHzeqPUGaNRSUKsPBj1CuYMTIejVTMugrWI/fN6TrT51qhwyl3CI510=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRBrkdLqimpFpvkHBqGs8NQgXxSDpMmtP9dU5e5qH3F0DqZSYe
 Dkp0v7xOQeQxgcM0VuBm+Mx9RVdvFLsNYZiuEdCdhMVmmqwy6mWoGTpTsIbXQnU=
X-Gm-Gg: ASbGnctGjub87+4J3lylf1fBMKmqDEnF+85zvsfSqfAwTYPoF+2JRp5BmuzsUxiVH9v
 h0AmATyHykR+4DyZk5DmHJNDOxII6z4eA++n+vW/LY06iCt2nVXBmaXtdJCfGTKJsnLMymmR4ky
 /uzy7xtDn5jEA1NLHb0RoMf88/nfnRBiZuUQmlVbwz/qP10tdpkqL7PLPk/5OkV9J7wlcH0HMxQ
 tEeoR1xd+NHHSgWF7lw8whsFVg3UpA/c0mZmxfhWpAKgRHruLHmVCy1+JF9UkML6vYEcGDA316K
 CdqzeCT4Kczng7QQVZWVqgDiyPQx4jiTl1sSLqsgvXE9PsZBSJ3K8W6Est8b0xa0lO3dvq/Npyc
 =
X-Google-Smtp-Source: AGHT+IGz0bFXXcYjFFcGWnd8cROfhtxHG8aSyDTvhQSgbN6cEVuqTgL39oJNKN7QGw6KlPEMjcPLfA==
X-Received: by 2002:a17:907:9485:b0:ac2:87b0:e4a5 with SMTP id
 a640c23a62f3a-ac6faeaf925mr314665266b.2.1743081467276; 
 Thu, 27 Mar 2025 06:17:47 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efbde51dsm1223035466b.136.2025.03.27.06.17.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 06:17:46 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ac34257295dso182963766b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 06:17:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU5LUIkCrjGtOECFwcdmdAlUulO4GcspxfktFmxo4vaWC/y5LlXWqpHPxryVM9322bt+HN8tBZu/j8=@lists.freedesktop.org
X-Received: by 2002:a17:906:5aca:b0:ac7:1608:53df with SMTP id
 a640c23a62f3a-ac7160855bamr27458066b.57.1743081465447; Thu, 27 Mar 2025
 06:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-agx-uapi-v5-1-04fccfc9e631@rosenzweig.io>
In-Reply-To: <20250326-agx-uapi-v5-1-04fccfc9e631@rosenzweig.io>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 27 Mar 2025 09:17:08 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9G23mXWTHbnuozsrRY8+03tfq7uT=St+KgLvq1RggzmA@mail.gmail.com>
X-Gm-Features: AQ5f1JrnbvtkEyGYfOw-hm-6quRzEDvlZT8NOJYzSSb27E3qHCruhtL_J54qdFA
Message-ID: <CAEg-Je9G23mXWTHbnuozsrRY8+03tfq7uT=St+KgLvq1RggzmA@mail.gmail.com>
Subject: Re: [PATCH v5] drm: Add UAPI for the Asahi driver
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Sergio Lopez Pascual <slp@sinrega.org>, Ryan Houdek <sonicadvance1@gmail.com>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 27 Mar 2025 23:14:04 +0000
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

On Wed, Mar 26, 2025 at 2:16=E2=80=AFPM Alyssa Rosenzweig <alyssa@rosenzwei=
g.io> wrote:
>
> This adds the UAPI for the Asahi driver targeting the GPU in the Apple
> M1 and M2 series systems on chip. The UAPI design is based on other
> modern Vulkan-capable drivers, including Xe and Panthor. Memory
> management is based on explicit VM management. Synchronization is
> exclusively explicit sync.
>
> This UAPI is validated against our open source Mesa stack, which is
> fully conformant to the OpenGL 4.6, OpenGL ES 3.2, OpenCL 3.0, and
> Vulkan 1.4 standards. The Vulkan driver supports sparse, exercising the
> VM_BIND mechanism.
>
> This patch adds the standalone UAPI header. It is implemented by an open
> source DRM driver written in Rust. We fully intend to upstream this
> driver when possible. However, as a production graphics driver, it
> depends on a significant number of Rust abstractions that will take a
> long time to upstream. In the mean time, our userspace is upstream in
> Mesa but is not allowed to probe with upstream Mesa as the UAPI is not
> yet reviewed and merged in the upstream kernel. Although we ship a
> patched Mesa in Fedora Asahi Remix, any containers shipping upstream
> Mesa builds are broken for our users, including upstream Flatpak and
> Waydroid runtimes. Additionally, it forces us to maintain forks of Mesa
> and virglrenderer, which complicates bisects.
>
> The intention in sending out this patch is for this UAPI to be
> thoroughly reviewed. Once we as the DRM community are satisfied with the
> UAPI, this header lands signifying that the UAPI is stable and must only
> be evolved in backwards-compatible ways; it will be the UAPI implemented
> in the DRM driver that eventually lands upstream. That promise lets us
> enable upstream Mesa, solving all these issues while the upstream Rust
> abstractions are developed.
>
> https://github.com/alyssarosenzweig/linux/commits/agx-uapi-v5 contains
> the DRM driver implementing this proposed UAPI.
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33984 contains
> the Mesa patches to implement this proposed UAPI.
>
> That Linux and Mesa branch together give a complete graphics/compute
> stack on top of this UAPI.

Do we want these links to be present in the commit message? I doubt
they'll stick around permanently...

>
> Co-developed-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
> Changes in v5:
> - Rename GEM_BIND to VM_BIND and make it take an array of bind ops. This
>   significantly decreases the # of kernel<-->user roundtrips with Vulkan
>   sparse binding. The uAPI here is lifted directly from Xe.
> - Merge in_syncs and out_syncs arrays, but leave
>   in_sync_count/out_sync_count alone, requiring waits to precede
>   signals. This simplifies both kernel & userspace, compared to either
>   fully merged or fully separate arrays, so it seems like a Good idea.
> - Drop queue caps, make all caps render + compute. Even GLES2 uses
>   compute to accelerate blits, and even compute workloads use render for
>   a few fallback blits. This lets us drop a bunch of crud in both kernel
>   & userspace and should slightly improve submit overhead.
> - Reorder ioctl IDs to group a little more logically (bikeshed...).
> - Improve some comments.
> - Link to v4: https://lore.kernel.org/r/20250323-agx-uapi-v4-1-12ed2db967=
37@rosenzweig.io
>
> Changes in v4:
> - get_time now returns time in nanoseconds, timer_frequency_hz dropped.
>   This hides an extra time domain from userspace for no real downside.
> - Added lots more comments answering questions Faith raised in v3
>   review.
> - Drop firmware_version per discussion.
> - Drop UNBIND_ALL, it is unused.
> - Switch priority to an enum per discussion.
> - Drop drm_asahi_subqueue and instead make barriers separate fields to
>   make obvious the extensability situation resolving discusison on v3.
>
> Changes in v3:
> - Merge load/store/partial fields for depth/stencil as discussed with
>   Faith. This shrinks the submit a lot with little loss of
>   functionality. There's maaaybe a use case for splitting out depth load
>   base (only) later. But it's easier to add uAPI than remove it!
> - Make usc_exec_base per-queue instead of per-command. No use case for
>   doing it finer grained, and this shrinks the submits and simplifies
>   userspace handling.
> - Improve descriptions.
> - Reorder/shrink fields to remove padding.
> - Use full names for vdm/cdm_ctrl_stream_base
> - Link to v2: https://lore.kernel.org/r/20250313-agx-uapi-v2-1-59cc53a59e=
a3@rosenzweig.io
>
> Changes in v2:
> - Flatten submits. Previously, the submit ioctl pointed to an array of
>   command structures, which each pointed to separate payload structures,
>   which pointed to attachment structures. This is a lot of indirection,
>   which complicates greatly virtgpu. In the new approach, the submit
>   ioctl points to a single contiguous blob of plain-old-data, no CPU
>   pointers, copied from userspace in one go and suitable as virtgpu wire
>   protocol.
> - Remove vm_page_size, userspace has to hardcode it anyway.
> - Turn random #defines into enums for better kernel doc, etc.
> - Improve comments, particularly around barriers[].
> - Rename various flags/fields to better match canonical names when known
>   (a lot of the names are pulled from the drivers/gpu/drm/imagination,
>   naturally).
> - Drop unnecessary encoder_id, cmd_id handles.
> - Fix padding in submit ioctl (thanks Ryan).
> - Link to v1: https://lore.kernel.org/r/20250310-agx-uapi-v1-1-86c8090500=
4e@rosenzweig.io
> ---
>  Documentation/gpu/driver-uapi.rst |    5 +
>  MAINTAINERS                       |    1 +
>  include/uapi/drm/asahi_drm.h      | 1211 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 1217 insertions(+)
>
> diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver=
-uapi.rst
> index 971cdb4816fc98d80a64d93637481d10c2e79718..1f15a8ca126516c23bd7374cc=
4aead0dfbbccf67 100644
> --- a/Documentation/gpu/driver-uapi.rst
> +++ b/Documentation/gpu/driver-uapi.rst
> @@ -27,3 +27,8 @@ drm/xe uAPI
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  .. kernel-doc:: include/uapi/drm/xe_drm.h
> +
> +drm/asahi uAPI
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. kernel-doc:: include/uapi/drm/asahi_drm.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1050702f681fbd0e4e2d0457b2ba569a64070d9..7f692a935808d4ec82ee74132=
4f8043302dae491 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2256,6 +2256,7 @@ F:        drivers/watchdog/apple_wdt.c
>  F:     include/dt-bindings/interrupt-controller/apple-aic.h
>  F:     include/dt-bindings/pinctrl/apple.h
>  F:     include/linux/soc/apple/*
> +F:     include/uapi/drm/asahi_drm.h
>
>  ARM/ARTPEC MACHINE SUPPORT
>  M:     Jesper Nilsson <jesper.nilsson@axis.com>
> diff --git a/include/uapi/drm/asahi_drm.h b/include/uapi/drm/asahi_drm.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..a9465cb89ebde6f6768fbd5ba=
0fa4d753e2a7e32
> --- /dev/null
> +++ b/include/uapi/drm/asahi_drm.h
> @@ -0,0 +1,1211 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (C) The Asahi Linux Contributors
> + * Copyright (C) 2018-2023 Collabora Ltd.
> + * Copyright (C) 2014-2018 Broadcom
> + */
> +#ifndef _ASAHI_DRM_H_
> +#define _ASAHI_DRM_H_
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * DOC: Introduction to the Asahi UAPI
> + *
> + * This documentation describes the Asahi IOCTLs.
> + *
> + * Just a few generic rules about the data passed to the Asahi IOCTLs (c=
ribbed
> + * from Panthor):
> + *
> + * - Structures must be aligned on 64-bit/8-byte. If the object is not
> + *   naturally aligned, a padding field must be added.
> + * - Fields must be explicitly aligned to their natural type alignment w=
ith
> + *   pad[0..N] fields.
> + * - All padding fields will be checked by the driver to make sure they =
are
> + *   zeroed.
> + * - Flags can be added, but not removed/replaced.
> + * - New fields can be added to the main structures (the structures
> + *   directly passed to the ioctl). Those fields can be added at the end=
 of
> + *   the structure, or replace existing padding fields. Any new field be=
ing
> + *   added must preserve the behavior that existed before those fields w=
ere
> + *   added when a value of zero is passed.
> + * - New fields can be added to indirect objects (objects pointed by the
> + *   main structure), iff those objects are passed a size to reflect the
> + *   size known by the userspace driver (see
> + *   drm_asahi_command::cmd_buffer_size).
> + * - If the kernel driver is too old to know some fields, those will be
> + *   ignored if zero, and otherwise rejected (and so will be zero on out=
put).
> + * - If userspace is too old to know some fields, those will be zeroed
> + *   (input) before the structure is parsed by the kernel driver.
> + * - Each new flag/field addition must come with a driver version update=
 so
> + *   the userspace driver doesn't have to trial and error to know which
> + *   flags are supported.
> + * - Structures should not contain unions, as this would defeat the
> + *   extensibility of such structures.
> + * - IOCTLs can't be removed or replaced. New IOCTL IDs should be placed
> + *   at the end of the drm_asahi_ioctl_id enum.
> + */
> +
> +/**
> + * enum drm_asahi_ioctl_id - IOCTL IDs
> + *
> + * Place new ioctls at the end, don't re-order, don't replace or remove =
entries.
> + *
> + * These IDs are not meant to be used directly. Use the DRM_IOCTL_ASAHI_=
xxx
> + * definitions instead.
> + */
> +enum drm_asahi_ioctl_id {
> +       /** @DRM_ASAHI_GET_PARAMS: Query device properties. */
> +       DRM_ASAHI_GET_PARAMS =3D 0,
> +
> +       /** @DRM_ASAHI_GET_TIME: Query device time. */
> +       DRM_ASAHI_GET_TIME,
> +
> +       /** @DRM_ASAHI_VM_CREATE: Create a GPU VM address space. */
> +       DRM_ASAHI_VM_CREATE,
> +
> +       /** @DRM_ASAHI_VM_DESTROY: Destroy a VM. */
> +       DRM_ASAHI_VM_DESTROY,
> +
> +       /** @DRM_ASAHI_VM_BIND: Bind/unbind memory to a VM. */
> +       DRM_ASAHI_VM_BIND,
> +
> +       /** @DRM_ASAHI_GEM_CREATE: Create a buffer object. */
> +       DRM_ASAHI_GEM_CREATE,
> +
> +       /**
> +        * @DRM_ASAHI_GEM_MMAP_OFFSET: Get offset to pass to mmap() to ma=
p a
> +        * given GEM handle.
> +        */
> +       DRM_ASAHI_GEM_MMAP_OFFSET,
> +
> +       /** @DRM_ASAHI_GEM_BIND_OBJECT: Bind memory as a special object *=
/
> +       DRM_ASAHI_GEM_BIND_OBJECT,
> +
> +       /** @DRM_ASAHI_QUEUE_CREATE: Create a scheduling queue. */
> +       DRM_ASAHI_QUEUE_CREATE,
> +
> +       /** @DRM_ASAHI_QUEUE_DESTROY: Destroy a scheduling queue. */
> +       DRM_ASAHI_QUEUE_DESTROY,
> +
> +       /** @DRM_ASAHI_SUBMIT: Submit commands to a queue. */
> +       DRM_ASAHI_SUBMIT,
> +};
> +
> +#define DRM_ASAHI_MAX_CLUSTERS 64
> +
> +/**
> + * struct drm_asahi_params_global - Global parameters.
> + *
> + * This struct may be queried by drm_asahi_get_params.
> + */
> +struct drm_asahi_params_global {
> +       /** @features: Feature bits from drm_asahi_feature */
> +       __u64 features;
> +
> +       /** @gpu_generation: GPU generation, e.g. 13 for G13G */
> +       __u32 gpu_generation;
> +
> +       /** @gpu_variant: GPU variant as a character, e.g. 'G' for G13G *=
/
> +       __u32 gpu_variant;
> +
> +       /**
> +        * @gpu_revision: GPU revision in BCD, e.g. 0x00 for 'A0' or
> +        * 0x21 for 'C1'
> +        */
> +       __u32 gpu_revision;
> +
> +       /** @chip_id: Chip ID in BCD, e.g. 0x8103 for T8103 */
> +       __u32 chip_id;
> +
> +       /** @num_dies: Number of dies in the SoC */
> +       __u32 num_dies;
> +
> +       /** @num_clusters_total: Number of GPU clusters (across all dies)=
 */
> +       __u32 num_clusters_total;
> +
> +       /**
> +        * @num_cores_per_cluster: Number of logical cores per cluster
> +        * (including inactive/nonexistent)
> +        */
> +       __u32 num_cores_per_cluster;
> +
> +       /** @num_frags_per_cluster: Number of frags per cluster */
> +       __u32 num_frags_per_cluster;
> +
> +       /** @num_gps_per_cluster: Number of GPs per cluster */
> +       __u32 num_gps_per_cluster;
> +
> +       /** @max_power_mw: Maximum GPU power consumption */
> +       __u32 max_power_mw;
> +
> +       /** @core_masks: Bitmask of present/enabled cores per cluster */
> +       __u64 core_masks[DRM_ASAHI_MAX_CLUSTERS];
> +
> +       /** @min_frequency_khz: Minimum GPU core clock frequency */
> +       __u32 min_frequency_khz;
> +
> +       /** @max_frequency_khz: Maximum GPU core clock frequency */
> +       __u32 max_frequency_khz;
> +
> +       /**
> +        * @vm_user_start: VM user range start VMA. Together with
> +        * @vm_user_end, this defines the window of valid GPU VAs. Usersp=
ace is
> +        * expected to subdivide VAs out of this window.
> +        */
> +       __u64 vm_user_start;
> +
> +       /** @vm_user_end: VM user range end VMA */
> +       __u64 vm_user_end;
> +
> +       /**
> +        * @vm_kernel_min_size: Minimum kernel VMA window size within use=
r
> +        * range.
> +        *
> +        * When creating a VM, userspace is required to carve out a secti=
on of
> +        * virtual addresses (within the range given by @vm_user_start an=
d
> +        * @vm_user_end). The kernel will allocate various internal struc=
tures
> +        * within the specified VA range.
> +        *
> +        * Allowing userspace to choose the VA range for the kernel, rath=
er than
> +        * the kernel reserving VAs and requiring userspace to cope, can =
assist
> +        * in implementing SVM.
> +        */
> +       __u64 vm_kernel_min_size;
> +
> +       /**
> +        * @max_commands_per_submission: Maximum number of supported comm=
ands
> +        * per submission. This mirrors firmware limits. Userspace must s=
plit up
> +        * larger command buffers, which may require inserting additional
> +        * barriers explicitly.
> +        */
> +       __u32 max_commands_per_submission;
> +
> +       /**
> +        * @max_attachments: Maximum number of drm_asahi_attachment's per
> +        * command
> +        */
> +       __u32 max_attachments;
> +
> +       /**
> +        * @command_timestamp_frequency_hz: Timebase frequency for timest=
amps
> +        * written during command exeuction, specified via drm_asahi_time=
stamp
> +        * structures. As this rate is controlled by the firmware, it is =
a
> +        * queryable parameter.
> +        *
> +        * Userspace must divide by this frequency to convert timestamps =
to
> +        * seconds, rather than hardcoding a particular firmware's rate.
> +        */
> +       __u64 command_timestamp_frequency_hz;
> +};
> +
> +/**
> + * enum drm_asahi_feature - Feature bits
> + *
> + * This covers only features that userspace cannot infer from the archit=
ecture
> + * version. Most features don't need to be here.
> + */
> +enum drm_asahi_feature {
> +       /**
> +        * @DRM_ASAHI_FEATURE_SOFT_FAULTS: GPU has "soft fault" enabled. =
Shader
> +        * loads of unmapped memory will return zero. Shader stores to un=
mapped
> +        * memory will be silently discarded. Note that only shader load/=
store
> +        * is affected. Other hardware units are not affected, notably in=
cluding
> +        * texture sampling.
> +        *
> +        * Soft fault is set when initializing the GPU and cannot be runt=
ime
> +        * toggled. Therefore, it is exposed as a feature bit and not a
> +        * userspace-settable flag on the VM. When soft fault is enabled,
> +        * userspace can speculate memory accesses more aggressively.
> +        */
> +       DRM_ASAHI_FEATURE_SOFT_FAULTS =3D (1UL) << 0,
> +};
> +
> +/**
> + * struct drm_asahi_get_params - Arguments passed to DRM_IOCTL_ASAHI_GET=
_PARAMS
> + */
> +struct drm_asahi_get_params {
> +       /** @param_group: Parameter group to fetch (MBZ) */
> +       __u32 param_group;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +
> +       /** @pointer: User pointer to write parameter struct */
> +       __u64 pointer;
> +
> +       /** @size: Size of user buffer, max size supported on return */
> +       __u64 size;
> +};
> +
> +/**
> + * struct drm_asahi_vm_create - Arguments passed to DRM_IOCTL_ASAHI_VM_C=
REATE
> + */
> +struct drm_asahi_vm_create {
> +       /**
> +        * @kernel_start: Start of the kernel-reserved address range. See
> +        * drm_asahi_params_global::vm_kernel_min_size.
> +        *
> +        * Both @kernel_start and @kernel_end must be within the range of
> +        * valid VAs given by drm_asahi_params_global::vm_user_start and
> +        * drm_asahi_params_global::vm_user_end. The size of the kernel r=
ange
> +        * (@kernel_end - @kernel_start) must be at least
> +        * drm_asahi_params_global::vm_kernel_min_size.
> +        *
> +        * Userspace must not bind any memory on this VM into this reserv=
ed
> +        * range, it is for kernel use only.
> +        */
> +       __u64 kernel_start;
> +
> +       /**
> +        * @kernel_end: End of the kernel-reserved address range. See
> +        * @kernel_start.
> +        */
> +       __u64 kernel_end;
> +
> +       /** @vm_id: Returned VM ID */
> +       __u32 vm_id;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +};
> +
> +/**
> + * struct drm_asahi_vm_destroy - Arguments passed to DRM_IOCTL_ASAHI_VM_=
DESTROY
> + */
> +struct drm_asahi_vm_destroy {
> +       /** @vm_id: VM ID to be destroyed */
> +       __u32 vm_id;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +};
> +
> +/**
> + * enum drm_asahi_gem_flags - Flags for GEM creation
> + */
> +enum drm_asahi_gem_flags {
> +       /**
> +        * @DRM_ASAHI_GEM_WRITEBACK: BO should be CPU-mapped as writeback=
.
> +        *
> +        * Map as writeback instead of write-combine. This optimizes for =
CPU
> +        * reads.
> +        */
> +       DRM_ASAHI_GEM_WRITEBACK =3D (1L << 0),
> +
> +       /**
> +        * @DRM_ASAHI_GEM_VM_PRIVATE: BO is private to this GPU VM (no ex=
ports).
> +        */
> +       DRM_ASAHI_GEM_VM_PRIVATE =3D (1L << 1),
> +};
> +
> +/**
> + * struct drm_asahi_gem_create - Arguments passed to DRM_IOCTL_ASAHI_GEM=
_CREATE
> + */
> +struct drm_asahi_gem_create {
> +       /** @size: Size of the BO */
> +       __u64 size;
> +
> +       /** @flags: Combination of drm_asahi_gem_flags flags. */
> +       __u32 flags;
> +
> +       /**
> +        * @vm_id: VM ID to assign to the BO, if DRM_ASAHI_GEM_VM_PRIVATE=
 is set
> +        */
> +       __u32 vm_id;
> +
> +       /** @handle: Returned GEM handle for the BO */
> +       __u32 handle;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +};
> +
> +/**
> + * struct drm_asahi_gem_mmap_offset - Arguments passed to
> + * DRM_IOCTL_ASAHI_GEM_MMAP_OFFSET
> + */
> +struct drm_asahi_gem_mmap_offset {
> +       /** @handle: Handle for the object being mapped. */
> +       __u32 handle;
> +
> +       /** @flags: Must be zero */
> +       __u32 flags;
> +
> +       /** @offset: The fake offset to use for subsequent mmap call */
> +       __u64 offset;
> +};
> +
> +/**
> + * enum drm_asahi_bind_flags - Flags for GEM binding
> + */
> +enum drm_asahi_bind_flags {
> +       /**
> +        * @DRM_ASAHI_BIND_UNBIND: Instead of binding a GEM object to the=
 range,
> +        * simply unbind the GPU VMA range.
> +        */
> +       DRM_ASAHI_BIND_UNBIND =3D (1L << 0),
> +
> +       /** @DRM_ASAHI_BIND_READ: Map BO with GPU read permission */
> +       DRM_ASAHI_BIND_READ =3D (1L << 1),
> +
> +       /** @DRM_ASAHI_BIND_WRITE: Map BO with GPU write permission */
> +       DRM_ASAHI_BIND_WRITE =3D (1L << 2),
> +
> +       /**
> +        * @DRM_ASAHI_BIND_SINGLE_PAGE: Map a single page of the BO repea=
tedly
> +        * across the VA range.
> +        *
> +        * This is useful to fill a VA range with scratch pages or zero p=
ages.
> +        * It is intended as a mechanism to accelerate sparse.
> +        */
> +       DRM_ASAHI_BIND_SINGLE_PAGE =3D (1L << 3),
> +};
> +
> +/**
> + * struct drm_asahi_gem_bind_op - Description of a single GEM bind opera=
tion.
> + */
> +struct drm_asahi_gem_bind_op {
> +       /** @flags: Combination of drm_asahi_bind_flags flags. */
> +       __u32 flags;
> +
> +       /** @handle: GEM object to bind (except for UNBIND) */
> +       __u32 handle;
> +
> +       /**
> +        * @offset: Offset into the object (except for UNBIND).
> +        *
> +        * For a regular bind, this is the beginning of the region of the=
 GEM
> +        * object to bind.
> +        *
> +        * For a single-page bind, this is the offset to the single page =
that
> +        * will be repeatedly bound.
> +        *
> +        * Must be page-size aligned.
> +        */
> +       __u64 offset;
> +
> +       /**
> +        * @range: Number of bytes to bind/unbind to @addr.
> +        *
> +        * Must be page-size aligned.
> +        */
> +       __u64 range;
> +
> +       /**
> +        * @addr: Address to bind to.
> +        *
> +        * Must be page-size aligned.
> +        */
> +       __u64 addr;
> +};
> +
> +/**
> + * struct drm_asahi_vm_bind - Arguments passed to
> + * DRM_IOCTL_ASAHI_VM_BIND
> + */
> +struct drm_asahi_vm_bind {
> +       /** @vm_id: The ID of the VM to bind to */
> +       __u32 vm_id;
> +
> +       /** @num_binds: number of binds in this IOCTL. Must be non-zero. =
*/
> +       __u32 num_binds;
> +
> +       /**
> +        * @stride: If num_binds > 1, stride in bytes between consecutive=
 binds.
> +        * This allows extensibility of drm_asahi_gem_bind_op.
> +        *
> +        * If num_binds =3D=3D 1, MBZ. Extensibility in that case is hand=
led at the
> +        * ioctl level instead.
> +        */
> +       __u32 stride;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +
> +       /**
> +        * @bind: Union holding the bind request.
> +        *
> +        * This union is named to make the Rust bindings nicer to work wi=
th.
> +        */
> +       union {
> +               /** @bind.b: If num_binds =3D=3D 1, the bind */
> +               struct drm_asahi_gem_bind_op b;
> +
> +               /**
> +                * @bind.userptr: If num_binds > 1, user pointer to an ar=
ray of
> +                * @num_binds structures of type @drm_asahi_gem_bind_op a=
nd size
> +                * @stride bytes.
> +                */
> +               __u64 userptr;
> +       } bind;
> +};
> +
> +/**
> + * enum drm_asahi_bind_object_op - Special object bind operation
> + */
> +enum drm_asahi_bind_object_op {
> +       /** @DRM_ASAHI_BIND_OBJECT_OP_BIND: Bind a BO as a special GPU ob=
ject */
> +       DRM_ASAHI_BIND_OBJECT_OP_BIND =3D 0,
> +
> +       /** @DRM_ASAHI_BIND_OBJECT_OP_UNBIND: Unbind a special GPU object=
 */
> +       DRM_ASAHI_BIND_OBJECT_OP_UNBIND =3D 1,
> +};
> +
> +/**
> + * enum drm_asahi_bind_object_flags - Special object bind flags
> + */
> +enum drm_asahi_bind_object_flags {
> +       /**
> +        * @DRM_ASAHI_BIND_OBJECT_USAGE_TIMESTAMPS: Map a BO as a timesta=
mp
> +        * buffer.
> +        */
> +       DRM_ASAHI_BIND_OBJECT_USAGE_TIMESTAMPS =3D (1L << 0),
> +};
> +
> +/**
> + * struct drm_asahi_gem_bind_object - Arguments passed to
> + * DRM_IOCTL_ASAHI_GEM_BIND_OBJECT
> + */
> +struct drm_asahi_gem_bind_object {
> +       /** @op: Bind operation (enum drm_asahi_bind_object_op) */
> +       __u32 op;
> +
> +       /** @flags: Combination of drm_asahi_bind_object_flags flags. */
> +       __u32 flags;
> +
> +       /** @handle: GEM object to bind/unbind (BIND) */
> +       __u32 handle;
> +
> +       /** @vm_id: The ID of the VM to operate on (MBZ currently) */
> +       __u32 vm_id;
> +
> +       /** @offset: Offset into the object (BIND only) */
> +       __u64 offset;
> +
> +       /** @range: Number of bytes to bind/unbind (BIND only) */
> +       __u64 range;
> +
> +       /** @object_handle: Object handle (out for BIND, in for UNBIND) *=
/
> +       __u32 object_handle;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +};
> +
> +/**
> + * enum drm_asahi_cmd_type - Command type
> + */
> +enum drm_asahi_cmd_type {
> +       /**
> +        * @DRM_ASAHI_CMD_RENDER: Render command, executing on the render
> +        * subqueue. Combined vertex and fragment operation.
> +        *
> +        * Followed by a @drm_asahi_cmd_render payload.
> +        */
> +       DRM_ASAHI_CMD_RENDER =3D 0,
> +
> +       /**
> +        * @DRM_ASAHI_CMD_COMPUTE: Compute command on the compute subqueu=
e.
> +        *
> +        * Followed by a @drm_asahi_cmd_compute payload.
> +        */
> +       DRM_ASAHI_CMD_COMPUTE =3D 1,
> +
> +       /**
> +        * @DRM_ASAHI_SET_VERTEX_ATTACHMENTS: Software command to set
> +        * attachments for subsequent vertex shaders in the same submit.
> +        *
> +        * Followed by (possibly multiple) @drm_asahi_attachment payloads=
.
> +        */
> +       DRM_ASAHI_SET_VERTEX_ATTACHMENTS =3D 2,
> +
> +       /**
> +        * @DRM_ASAHI_SET_FRAGMENT_ATTACHMENTS: Software command to set
> +        * attachments for subsequent fragment shaders in the same submit=
.
> +        *
> +        * Followed by (possibly multiple) @drm_asahi_attachment payloads=
.
> +        */
> +       DRM_ASAHI_SET_FRAGMENT_ATTACHMENTS =3D 3,
> +
> +       /**
> +        * @DRM_ASAHI_SET_COMPUTE_ATTACHMENTS: Software command to set
> +        * attachments for subsequent compute shaders in the same submit.
> +        *
> +        * Followed by (possibly multiple) @drm_asahi_attachment payloads=
.
> +        */
> +       DRM_ASAHI_SET_COMPUTE_ATTACHMENTS =3D 4,
> +};
> +
> +/**
> + * enum drm_asahi_priority - Scheduling queue priority.
> + *
> + * These priorities are forwarded to the firmware to influence firmware
> + * scheduling. The exact policy is ultimately decided by firmware, but
> + * these enums allow userspace to communicate the intentions.
> + */
> +enum drm_asahi_priority {
> +       /** @DRM_ASAHI_PRIORITY_LOW: Low priority queue. */
> +       DRM_ASAHI_PRIORITY_LOW =3D 0,
> +
> +       /** @DRM_ASAHI_PRIORITY_MEDIUM: Medium priority queue. */
> +       DRM_ASAHI_PRIORITY_MEDIUM =3D 1,
> +
> +       /**
> +        * @DRM_ASAHI_PRIORITY_HIGH: High priority queue.
> +        *
> +        * Reserved for future extension.
> +        */
> +       DRM_ASAHI_PRIORITY_HIGH =3D 2,
> +
> +       /**
> +        * @DRM_ASAHI_PRIORITY_REALTIME: Real-time priority queue.
> +        *
> +        * Reserved for future extension.
> +        */
> +       DRM_ASAHI_PRIORITY_REALTIME =3D 3,
> +};
> +
> +/**
> + * struct drm_asahi_queue_create - Arguments passed to
> + * DRM_IOCTL_ASAHI_QUEUE_CREATE
> + */
> +struct drm_asahi_queue_create {
> +       /** @flags: MBZ */
> +       __u32 flags;
> +
> +       /** @vm_id: The ID of the VM this queue is bound to */
> +       __u32 vm_id;
> +
> +       /** @priority: One of drm_asahi_priority */
> +       __u32 priority;
> +
> +       /** @queue_id: The returned queue ID */
> +       __u32 queue_id;
> +
> +       /**
> +        * @usc_exec_base: GPU base address for all USC binaries (shaders=
) on
> +        * this queue. USC addresses are 32-bit relative to this 64-bit b=
ase.
> +        *
> +        * This sets the following registers on all queue commands:
> +        *
> +        *      USC_EXEC_BASE_TA  (vertex)
> +        *      USC_EXEC_BASE_ISP (fragment)
> +        *      USC_EXEC_BASE_CP  (compute)
> +        *
> +        * While the hardware lets us configure these independently per c=
ommand,
> +        * we do not have a use case for this. Instead, we expect userspa=
ce to
> +        * fix a 4GiB VA carveout for USC memory and pass its base addres=
s here.
> +        */
> +       __u64 usc_exec_base;
> +};
> +
> +/**
> + * struct drm_asahi_queue_destroy - Arguments passed to
> + * DRM_IOCTL_ASAHI_QUEUE_DESTROY
> + */
> +struct drm_asahi_queue_destroy {
> +       /** @queue_id: The queue ID to be destroyed */
> +       __u32 queue_id;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +};
> +
> +/**
> + * enum drm_asahi_sync_type - Sync item type
> + */
> +enum drm_asahi_sync_type {
> +       /** @DRM_ASAHI_SYNC_SYNCOBJ: Binary sync object */
> +       DRM_ASAHI_SYNC_SYNCOBJ =3D 0,
> +
> +       /** @DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ: Timeline sync object */
> +       DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ =3D 1,
> +};
> +
> +/**
> + * struct drm_asahi_sync - Sync item
> + */
> +struct drm_asahi_sync {
> +       /** @sync_type: One of drm_asahi_sync_type */
> +       __u32 sync_type;
> +
> +       /** @handle: The sync object handle */
> +       __u32 handle;
> +
> +       /** @timeline_value: Timeline value for timeline sync objects */
> +       __u64 timeline_value;
> +};
> +
> +/**
> + * define DRM_ASAHI_BARRIER_NONE - Command index for no barrier
> + *
> + * This special value may be passed in to drm_asahi_command::barriers[] =
to
> + * indicate that the respective subqueue should not wait on any previous=
 work.
> + */
> +#define DRM_ASAHI_BARRIER_NONE (0xFFFFu)
> +
> +/**
> + * struct drm_asahi_cmd_header - Top level command structure
> + *
> + * This struct is core to the command buffer definition and therefore is=
 not
> + * extensible.
> + */
> +struct drm_asahi_cmd_header {
> +       /** @cmd_type: One of drm_asahi_cmd_type */
> +       __u16 cmd_type;
> +
> +       /**
> +        * @size: Size of this command, not including this header.
> +        *
> +        * For hardware commands, this enables extensibility of commands =
without
> +        * requiring extra command types.  Passing a command that is shor=
ter
> +        * than expected is explicitly allowed for backwards-compatibilit=
y.
> +        * Truncated fields will be zeroed.
> +        *
> +        * For the synthetic attachment setting commands, this implicitly
> +        * encodes the number of attachments. These commands take multipl=
e
> +        * fixed-size @drm_asahi_attachment structures as their payload, =
so size
> +        * equals number of attachments * sizeof(struct drm_asahi_attachm=
ent).
> +        */
> +       __u16 size;
> +
> +       /**
> +        * @vdm_barrier: VDM (render) command index to wait on.
> +        *
> +        * Barriers are indices relative to the beginning of a given subm=
it. A
> +        * barrier of 0 waits on commands submitted to the respective sub=
queue
> +        * in previous submit ioctls. A barrier of N waits on N previous
> +        * commands on the subqueue within the current submit ioctl. As a
> +        * special case, passing @DRM_ASAHI_BARRIER_NONE avoids waiting o=
n any
> +        * commands in the subqueue.
> +        *
> +        * Examples:
> +        *
> +        *   0: This waits on all previous work.
> +        *
> +        *   NONE: This does not wait for anything on this subqueue.
> +        *
> +        *   1: This waits on the first render command in the submit.
> +        *   This only makes sense if there are multiple render commands =
in the
> +        *   same submit.
> +        *
> +        * Barriers only make sense for hardware commands. Synthetic soft=
ware
> +        * commands to set attachments must pass NONE here.
> +        */
> +       __u16 vdm_barrier;
> +
> +       /**
> +        * @cdm_barrier: CDM (compute) command index to wait on.
> +        *
> +        * See @vdm_barrier, and substitute VDM/render for CDM/compute.
> +        */
> +       __u16 cdm_barrier;
> +};
> +
> +/**
> + * struct drm_asahi_submit - Arguments passed to DRM_IOCTL_ASAHI_SUBMIT
> + */
> +struct drm_asahi_submit {
> +       /**
> +        * @syncs: An optional array of drm_asahi_sync. First @in_sync_co=
unt
> +        * in-syncs then @out_sync_count out-syncs.
> +        */
> +       __u64 syncs;
> +
> +       /**
> +        * @cmdbuf: Pointer to the command buffer to submit.
> +        *
> +        * This is a flat command buffer. By design, it contains no CPU
> +        * pointers, which makes it suitable for a virtgpu wire protocol =
without
> +        * requiring any serializing/deserializing step.
> +        *
> +        * It consists of a series of commands. Each command begins with =
a
> +        * fixed-size @drm_asahi_cmd_header and is followed by a variable=
-length
> +        * payload according to the type and size in the header.
> +        *
> +        * The combined count of "real" hardware commands must be nonzero=
 and at
> +        * most drm_asahi_params_global::max_commands_per_submission.
> +        */
> +       __u64 cmdbuf;
> +
> +       /** @flags: Flags for command submission (MBZ) */
> +       __u32 flags;
> +
> +       /** @queue_id: The queue ID to be submitted to */
> +       __u32 queue_id;
> +
> +       /**
> +        * @in_sync_count: Number of sync objects to wait on before start=
ing
> +        * this job.
> +        */
> +       __u32 in_sync_count;
> +
> +       /**
> +        * @out_sync_count: Number of sync objects to signal upon complet=
ion of
> +        * this job.
> +        */
> +       __u32 out_sync_count;
> +
> +       /** @cmdbuf_size: Command buffer size in bytes */
> +       __u32 cmdbuf_size;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +};
> +
> +/**
> + * struct drm_asahi_attachment - Describe an "attachment".
> + *
> + * Attachments are any memory written by shaders, notably including rend=
er
> + * target attachments written by the end-of-tile program. This is purely=
 a hint
> + * about the accessed memory regions. It is optional to specify, which i=
s
> + * fortunate as it cannot be specified precisely with bindless access an=
yway.
> + * But where possible, it's probably a good idea for userspace to includ=
e these
> + * hints, forwarded to the firmware.
> + *
> + * This struct is implicitly sized and therefore is not extensible.
> + */
> +struct drm_asahi_attachment {
> +       /** @pointer: Base address of the attachment */
> +       __u64 pointer;
> +
> +       /** @size: Size of the attachment in bytes */
> +       __u64 size;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +
> +       /** @flags: MBZ */
> +       __u32 flags;
> +};
> +
> +enum drm_asahi_render_flags {
> +       /**
> +        * @DRM_ASAHI_RENDER_VERTEX_SCRATCH: A vertex stage shader uses s=
cratch
> +        * memory.
> +        */
> +       DRM_ASAHI_RENDER_VERTEX_SCRATCH =3D (1U << 0),
> +
> +       /**
> +        * @DRM_ASAHI_RENDER_PROCESS_EMPTY_TILES: Process even empty tile=
s.
> +        * This must be set when clearing render targets.
> +        */
> +       DRM_ASAHI_RENDER_PROCESS_EMPTY_TILES =3D (1U << 1),
> +
> +       /**
> +        * @DRM_ASAHI_RENDER_NO_VERTEX_CLUSTERING: Run vertex stage on a =
single
> +        * cluster (on multi-cluster GPUs)
> +        *
> +        * This harms performance but can workaround certain sync/coheren=
cy
> +        * bugs, and therefore is useful for debugging.
> +        */
> +       DRM_ASAHI_RENDER_NO_VERTEX_CLUSTERING =3D (1U << 2),
> +
> +       /**
> +        * @DRM_ASAHI_RENDER_DBIAS_IS_INT: Use integer depth bias formula=
.
> +        *
> +        * Graphics specifications contain two alternate formulas for dep=
th
> +        * bias, a float formula used with floating-point depth buffers a=
nd an
> +        * integer formula using with unorm depth buffers. This flag spec=
ifies
> +        * that the integer formula should be used. If omitted, the float
> +        * formula is used instead.
> +        *
> +        * This corresponds to bit 18 of the relevant hardware control re=
gister,
> +        * so we match that here for efficiency.
> +        */
> +       DRM_ASAHI_RENDER_DBIAS_IS_INT =3D (1U << 18),
> +};
> +
> +/**
> + * struct drm_asahi_zls_buffer - Describe a depth or stencil buffer.
> + *
> + * These fields correspond to hardware registers in the ZLS (Z Load/Stor=
e) unit.
> + * There are three hardware registers for each field respectively for lo=
ads,
> + * stores, and partial renders. In practice, it makes sense to set all t=
o the
> + * same values, except in exceptional cases not yet implemented in users=
pace, so
> + * we do not duplicate here for simplicity/efficiency.
> + *
> + * This struct is embedded in other structs and therefore is not extensi=
ble.
> + */
> +struct drm_asahi_zls_buffer {
> +       /** @base: Base address of the buffer */
> +       __u64 base;
> +
> +       /**
> +        * @comp_base: If the load buffer is compressed, address of the
> +        * compression metadata section.
> +        */
> +       __u64 comp_base;
> +
> +       /**
> +        * @stride: If layered rendering is enabled, the number of bytes
> +        * between each layer of the buffer.
> +        */
> +       __u32 stride;
> +
> +       /**
> +        * @comp_stride: If layered rendering is enabled, the number of b=
ytes
> +        * between each layer of the compression metadata.
> +        */
> +       __u32 comp_stride;
> +};
> +
> +/**
> + * struct drm_asahi_timestamp - Describe a timestamp write.
> + *
> + * The firmware can optionally write the GPU timestamp at render pass
> + * granularities, but it needs to be mapped specially via
> + * DRM_IOCTL_ASAHI_GEM_BIND_OBJECT. This structure therefore describes w=
here to
> + * write as a handle-offset pair, rather than a GPU address like normal.
> + *
> + * This struct is embedded in other structs and therefore is not extensi=
ble.
> + */
> +struct drm_asahi_timestamp {
> +       /**
> +        * @handle: Handle of the timestamp buffer, or 0 to skip this
> +        * timestamp. If nonzero, this must equal the value returned in
> +        * drm_asahi_gem_bind_object::object_handle.
> +        */
> +       __u32 handle;
> +
> +       /** @offset: Offset to write into the timestamp buffer */
> +       __u32 offset;
> +};
> +
> +/**
> + * struct drm_asahi_timestamps - Describe timestamp writes.
> + *
> + * Each operation that can be timestamped, can be timestamped at the sta=
rt and
> + * end. Therefore, drm_asahi_timestamp structs always come in pairs, bun=
dled
> + * together into drm_asahi_timestamps.
> + *
> + * This struct is embedded in other structs and therefore is not extensi=
ble.
> + */
> +struct drm_asahi_timestamps {
> +       /** @start: Timestamp recorded at the start of the operation */
> +       struct drm_asahi_timestamp start;
> +
> +       /** @end: Timestamp recorded at the end of the operation */
> +       struct drm_asahi_timestamp end;
> +};
> +
> +/**
> + * struct drm_asahi_helper_program - Describe helper program configurati=
on.
> + *
> + * The helper program is a compute-like kernel required for various hard=
ware
> + * functionality. Its most important role is dynamically allocating
> + * scratch/stack memory for individual subgroups, by partitioning a stat=
ic
> + * allocation shared for the whole device. It is supplied by userspace v=
ia
> + * drm_asahi_helper_program and internally dispatched by the hardware as=
 needed.
> + *
> + * This struct is embedded in other structs and therefore is not extensi=
ble.
> + */
> +struct drm_asahi_helper_program {
> +       /**
> +        * @binary: USC address to the helper program binary. This is a t=
agged
> +        * pointer with configuration in the bottom bits.
> +        */
> +       __u32 binary;
> +
> +       /** @cfg: Configuration bits for the helper program. */
> +       __u32 cfg;
> +
> +       /**
> +        * @data: Data passed to the helper program. This value is not
> +        * interpreted by the kernel, firmware, or hardware in any way. I=
t is
> +        * simply a sideband for userspace, set with the submit ioctl and=
 read
> +        * via special registers inside the helper program.
> +        *
> +        * In practice, userspace will pass a 64-bit GPU VA here pointing=
 to the
> +        * actual arguments, which presumably don't fit in 64-bits.
> +        */
> +       __u64 data;
> +};
> +
> +/**
> + * struct drm_asahi_bg_eot - Describe a background or end-of-tile progra=
m.
> + *
> + * The background and end-of-tile programs are dispatched by the hardwar=
e at the
> + * beginning and end of rendering. As the hardware "tilebuffer" is simpl=
y local
> + * memory, these programs are necessary to implement API-level render ta=
rgets.
> + * The fragment-like background program is responsible for loading eithe=
r the
> + * clear colour or the existing render target contents, while the comput=
e-like
> + * end-of-tile program stores the tilebuffer contents to memory.
> + *
> + * This struct is embedded in other structs and therefore is not extensi=
ble.
> + */
> +struct drm_asahi_bg_eot {
> +       /**
> +        * @usc: USC address of the hardware USC words binding resources
> +        * (including images and uniforms) and the program itself. Note t=
his is
> +        * an additional layer of indirection compared to the helper prog=
ram,
> +        * avoiding the need for a sideband for data. This is a tagged po=
inter
> +        * with additional configuration in the bottom bits.
> +        */
> +       __u32 usc;
> +
> +       /**
> +        * @rsrc_spec: Resource specifier for the program. This is a pack=
ed
> +        * hardware data structure describing the required number of regi=
sters,
> +        * uniforms, bound textures, and bound samplers.
> +        */
> +       __u32 rsrc_spec;
> +};
> +
> +/**
> + * struct drm_asahi_cmd_render - Command to submit 3D
> + *
> + * This command submits a single render pass. The hardware control strea=
m may
> + * include many draws and subpasses, but within the command, the framebu=
ffer
> + * dimensions and attachments are fixed.
> + *
> + * The hardware requires the firmware to set a large number of Control R=
egisters
> + * setting up state at render pass granularity before each command rende=
ring 3D.
> + * The firmware bundles this state into data structures. Unfortunately, =
we
> + * cannot expose either any of that directly to userspace, because the
> + * kernel-firmware ABI is not stable. Although we can guarantee the firm=
ware
> + * updates in tandem with the kernel, we cannot break old userspace when
> + * upgrading the firmware and kernel. Therefore, we need to abstract wel=
l the
> + * data structures to avoid tying our hands with future firmwares.
> + *
> + * The bulk of drm_asahi_cmd_render therefore consists of values of hard=
ware
> + * control registers, marshalled via the firmware interface.
> + *
> + * The framebuffer/tilebuffer dimensions are also specified here. In add=
ition to
> + * being passed to the firmware/hardware, the kernel requires these dime=
nsions
> + * to calculate various essential tiling-related data structures. It is
> + * unfortunate that our submits are heavier than on vendors with saner
> + * hardware-software interfaces. The upshot is all of this information i=
s
> + * readily available to userspace with all current APIs.
> + *
> + * It looks odd - but it's not overly burdensome and it ensures we can r=
emain
> + * compatible with old userspace.
> + */
> +struct drm_asahi_cmd_render {
> +       /** @flags: Combination of drm_asahi_render_flags flags. */
> +       __u32 flags;
> +
> +       /**
> +        * @isp_zls_pixels: ISP_ZLS_PIXELS register value. This contains =
the
> +        * depth/stencil width/height, which may differ from the framebuf=
fer
> +        * width/height.
> +        */
> +       __u32 isp_zls_pixels;
> +
> +       /**
> +        * @vdm_ctrl_stream_base: VDM_CTRL_STREAM_BASE register value. GP=
U
> +        * address to the beginning of the VDM control stream.
> +        */
> +       __u64 vdm_ctrl_stream_base;
> +
> +       /** @vertex_helper: Helper program used for the vertex shader */
> +       struct drm_asahi_helper_program vertex_helper;
> +
> +       /** @fragment_helper: Helper program used for the fragment shader=
 */
> +       struct drm_asahi_helper_program fragment_helper;
> +
> +       /**
> +        * @isp_scissor_base: ISP_SCISSOR_BASE register value. GPU addres=
s of an
> +        * array of scissor descriptors indexed in the render pass.
> +        */
> +       __u64 isp_scissor_base;
> +
> +       /**
> +        * @isp_dbias_base: ISP_DBIAS_BASE register value. GPU address of=
 an
> +        * array of depth bias values indexed in the render pass.
> +        */
> +       __u64 isp_dbias_base;
> +
> +       /**
> +        * @isp_oclqry_base: ISP_OCLQRY_BASE register value. GPU address =
of an
> +        * array of occlusion query results written by the render pass.
> +        */
> +       __u64 isp_oclqry_base;
> +
> +       /** @depth: Depth buffer */
> +       struct drm_asahi_zls_buffer depth;
> +
> +       /** @stencil: Stencil buffer */
> +       struct drm_asahi_zls_buffer stencil;
> +
> +       /** @zls_ctrl: ZLS_CTRL register value */
> +       __u64 zls_ctrl;
> +
> +       /** @ppp_multisamplectl: PPP_MULTISAMPLECTL register value */
> +       __u64 ppp_multisamplectl;
> +
> +       /**
> +        * @sampler_heap: Base address of the sampler heap. This heap is =
used
> +        * for both vertex shaders and fragment shaders. The registers ar=
e
> +        * per-stage, but there is no known use case for separate heaps.
> +        */
> +       __u64 sampler_heap;
> +
> +       /** @ppp_ctrl: PPP_CTRL register value */
> +       __u32 ppp_ctrl;
> +
> +       /** @width_px: Framebuffer width in pixels */
> +       __u16 width_px;
> +
> +       /** @height_px: Framebuffer height in pixels */
> +       __u16 height_px;
> +
> +       /** @layers: Number of layers in the framebuffer */
> +       __u16 layers;
> +
> +       /** @sampler_count: Number of samplers in the sampler heap. */
> +       __u16 sampler_count;
> +
> +       /** @utile_width_px: Width of a logical tilebuffer tile in pixels=
 */
> +       __u8 utile_width_px;
> +
> +       /** @utile_height_px: Height of a logical tilebuffer tile in pixe=
ls */
> +       __u8 utile_height_px;
> +
> +       /** @samples: # of samples in the framebuffer. Must be 1, 2, or 4=
. */
> +       __u8 samples;
> +
> +       /** @sample_size_B: # of bytes in the tilebuffer required per sam=
ple. */
> +       __u8 sample_size_B;
> +
> +       /**
> +        * @isp_merge_upper_x: 32-bit float used in the hardware triangle
> +        * merging. Calculate as: tan(60 deg) * width.
> +        *
> +        * Making these values UAPI avoids requiring floating-point calcu=
lations
> +        * in the kernel in the hot path.
> +        */
> +       __u32 isp_merge_upper_x;
> +
> +       /**
> +        * @isp_merge_upper_y: 32-bit float. Calculate as: tan(60 deg) * =
height.
> +        * See @isp_merge_upper_x.
> +        */
> +       __u32 isp_merge_upper_y;
> +
> +       /** @bg: Background program run for each tile at the start */
> +       struct drm_asahi_bg_eot bg;
> +
> +       /** @eot: End-of-tile program ran for each tile at the end */
> +       struct drm_asahi_bg_eot eot;
> +
> +       /**
> +        * @partial_bg: Background program ran at the start of each tile =
when
> +        * resuming the render pass during a partial render.
> +        */
> +       struct drm_asahi_bg_eot partial_bg;
> +
> +       /**
> +        * @partial_eot: End-of-tile program ran at the end of each tile =
when
> +        * pausing the render pass during a partial render.
> +        */
> +       struct drm_asahi_bg_eot partial_eot;
> +
> +       /**
> +        * @isp_bgobjdepth: ISP_BGOBJDEPTH register value. This is the de=
pth
> +        * buffer clear value, encoded in the depth buffer's format: eith=
er a
> +        * 32-bit float or a 16-bit unorm (with upper bits zeroed).
> +        */
> +       __u32 isp_bgobjdepth;
> +
> +       /**
> +        * @isp_bgobjvals: ISP_BGOBJVALS register value. The bottom 8-bit=
s
> +        * contain the stencil buffer clear value.
> +        */
> +       __u32 isp_bgobjvals;
> +
> +       /** @ts_vtx: Timestamps for the vertex portion of the render */
> +       struct drm_asahi_timestamps ts_vtx;
> +
> +       /** @ts_frag: Timestamps for the fragment portion of the render *=
/
> +       struct drm_asahi_timestamps ts_frag;
> +};
> +
> +/**
> + * struct drm_asahi_cmd_compute - Command to submit compute
> + *
> + * This command submits a control stream consisting of compute dispatche=
s. There
> + * is essentially no limit on how many compute dispatches may be include=
d in a
> + * single compute command, although timestamps are at command granularit=
y.
> + */
> +struct drm_asahi_cmd_compute {
> +       /** @flags: MBZ */
> +       __u32 flags;
> +
> +       /** @sampler_count: Number of samplers in the sampler heap. */
> +       __u32 sampler_count;
> +
> +       /**
> +        * @cdm_ctrl_stream_base: CDM_CTRL_STREAM_BASE register value. GP=
U
> +        * address to the beginning of the CDM control stream.
> +        */
> +       __u64 cdm_ctrl_stream_base;
> +
> +       /**
> +        * @cdm_ctrl_stream_end: GPU base address to the end of the hardw=
are
> +        * control stream. Note this only considers the first contiguous =
segment
> +        * of the control stream, as the stream might jump elsewhere.
> +        */
> +       __u64 cdm_ctrl_stream_end;
> +
> +       /** @sampler_heap: Base address of the sampler heap. */
> +       __u64 sampler_heap;
> +
> +       /** @helper: Helper program used for this compute command */
> +       struct drm_asahi_helper_program helper;
> +
> +       /** @ts: Timestamps for the compute command */
> +       struct drm_asahi_timestamps ts;
> +};
> +
> +/**
> + * struct drm_asahi_get_time - Arguments passed to DRM_IOCTL_ASAHI_GET_T=
IME
> + */
> +struct drm_asahi_get_time {
> +       /** @flags: MBZ. */
> +       __u64 flags;
> +
> +       /** @gpu_timestamp: On return, the GPU timestamp in nanoseconds. =
*/
> +       __u64 gpu_timestamp;
> +};
> +
> +/**
> + * DRM_IOCTL_ASAHI() - Build an Asahi IOCTL number
> + * @__access: Access type. Must be R, W or RW.
> + * @__id: One of the DRM_ASAHI_xxx id.
> + * @__type: Suffix of the type being passed to the IOCTL.
> + *
> + * Don't use this macro directly, use the DRM_IOCTL_ASAHI_xxx
> + * values instead.
> + *
> + * Return: An IOCTL number to be passed to ioctl() from userspace.
> + */
> +#define DRM_IOCTL_ASAHI(__access, __id, __type) \
> +       DRM_IO ## __access(DRM_COMMAND_BASE + DRM_ASAHI_ ## __id, \
> +                          struct drm_asahi_ ## __type)
> +
> +/* Note: this is an enum so that it can be resolved by Rust bindgen. */
> +enum {
> +       DRM_IOCTL_ASAHI_GET_PARAMS       =3D DRM_IOCTL_ASAHI(WR, GET_PARA=
MS, get_params),
> +       DRM_IOCTL_ASAHI_GET_TIME         =3D DRM_IOCTL_ASAHI(WR, GET_TIME=
, get_time),
> +       DRM_IOCTL_ASAHI_VM_CREATE        =3D DRM_IOCTL_ASAHI(WR, VM_CREAT=
E, vm_create),
> +       DRM_IOCTL_ASAHI_VM_DESTROY       =3D DRM_IOCTL_ASAHI(W, VM_DESTRO=
Y, vm_destroy),
> +       DRM_IOCTL_ASAHI_VM_BIND          =3D DRM_IOCTL_ASAHI(W, VM_BIND, =
vm_bind),
> +       DRM_IOCTL_ASAHI_GEM_CREATE       =3D DRM_IOCTL_ASAHI(WR, GEM_CREA=
TE, gem_create),
> +       DRM_IOCTL_ASAHI_GEM_MMAP_OFFSET  =3D DRM_IOCTL_ASAHI(WR, GEM_MMAP=
_OFFSET, gem_mmap_offset),
> +       DRM_IOCTL_ASAHI_GEM_BIND_OBJECT  =3D DRM_IOCTL_ASAHI(WR, GEM_BIND=
_OBJECT, gem_bind_object),
> +       DRM_IOCTL_ASAHI_QUEUE_CREATE     =3D DRM_IOCTL_ASAHI(WR, QUEUE_CR=
EATE, queue_create),
> +       DRM_IOCTL_ASAHI_QUEUE_DESTROY    =3D DRM_IOCTL_ASAHI(W, QUEUE_DES=
TROY, queue_destroy),
> +       DRM_IOCTL_ASAHI_SUBMIT           =3D DRM_IOCTL_ASAHI(W, SUBMIT, s=
ubmit),
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _ASAHI_DRM_H_ */
>
> ---
> base-commit: 0ed1356af8f629ae807963b7db4e501e3b580bc2
> change-id: 20250307-agx-uapi-930579437f19
>
> Best regards,
> --
> Alyssa Rosenzweig <alyssa@rosenzweig.io>
>
>

This looks good to me, and the referenced integration code also looks good.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
