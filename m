Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C8EA5A5C7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 22:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7563310E31E;
	Mon, 10 Mar 2025 21:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="djmQBqnc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF96910E2C1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 21:12:53 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3cda56e1dffso18119235ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 14:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741641173; x=1742245973; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpPnYvsqQNnbvPXbqnG75tISIt1oeNAGMK9n6uBWS3U=;
 b=djmQBqncWmBcrBaqLH8PXBB7fJjHaDoeUNoO7+rfNtxu/x1AGlIL4xsA5ZpDa67cjc
 rvPTbnxRsrKAxMjTSb2Sfly2nOrjdbxnq+H5WjVVyTZKgpVsMxGb3clB1AJIDnU/NLzK
 Ux9Bg0I2GgWZ/wCovgt3+oqXNHRy9ZHeVz2wU/RHNdnAh1RzP1EsajTDrrzwE/B6Tyx3
 vaKbIpa6G6Hyz2rzol46XAMwM62zRDYJu60Fus287tXl85Uvc3zF222bmorN9IDw/XdT
 1vkeK/gNcut3L3m6h7O1oJrbWZUG5ICAcqtKKG9a6ZHVQeBSyGJFRrNmuPM1lmaVBxdp
 ws+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741641173; x=1742245973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpPnYvsqQNnbvPXbqnG75tISIt1oeNAGMK9n6uBWS3U=;
 b=GjwTqUZH/1ytGKeFQDYZflvPFDl9wOJFq1B5PdBkMVAu8cK+KR/EGjJEIPA3qR5nOp
 w1n4pxtUPYFfEeg+blg/J8m/YvWOdlpqfD8ysDHA2doDsi3Mm0dBD/BRwP1rEFavELt6
 mad97zWSx2aISUROIUNfT9FhIIkXoAiQcuVvFi64J0exXxWq5dyYI/nQmW790W8YyPZO
 4uXUE3f7byIXJqI9I43Tv21IFHaDlDSsRe/omczc/ZWjvQO+ECRRNNlao0sd1OX+9lJu
 H7WjGo0PJKI2qPuezPJqezsMRA+N9IAoswreissjwU1LvYWSCoF4Tvvu6xaAkGQYdl8T
 vCvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4csNmqZe9kKH1zB076UZLsng1412Lczp1iEo72ul4qJmAhuyE0BL7ueHlroXBnn8beOWwMdb8MEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4WoKbpAq7cvyhgrEcSlai/Zh1KjC62I4D07pmlY/cnTbLL5GK
 3LX1+eMjZrexhH2udotlcSu3Mdx2anSzuAl+bZPhtPNYqP7TVm8rdgMbNklgLHVyPfhVZ53KG5m
 FlAEKtUqfu66sVUDOznnT6X//wBA=
X-Gm-Gg: ASbGnctvx+cDGwsimPidJ6r1ZDfGBoE4yS+JN/9GoyPX/+d5bpNzOzPrM5LW682Wgvc
 bXwpSYxNnY8qzTb14X+E8S+F2KaBfo5ErZF3iwPiPpjKKDYwDHwakv0xeaR8eucV46q2ZTYfbcX
 K4EY3EJT9tVuoWIu182yerAtwxYPuHVBQYpcBGLOlgtj7hGfnMFkhtQurNooGeSl18d6s=
X-Google-Smtp-Source: AGHT+IHP8Mcc7UR3bS7vXQKShKiUBHGhxhJV30JaPTXGV2ld2tBexMdsYwjW7iwJCWr4bMlM9pe7xk3KD+rYm3f0wHw=
X-Received: by 2002:a05:6e02:1848:b0:3d1:a34b:4d01 with SMTP id
 e9e14a558f8ab-3d44194369cmr162481035ab.8.1741641172310; Mon, 10 Mar 2025
 14:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-agx-uapi-v1-1-86c80905004e@rosenzweig.io>
In-Reply-To: <20250310-agx-uapi-v1-1-86c80905004e@rosenzweig.io>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 10 Mar 2025 14:12:40 -0700
X-Gm-Features: AQ5f1Jpa9H62mvuEi4HVMLgCb1F5tOILb2dnAbN-KUE8TzraibDJqv6vFrHaP9U
Message-ID: <CAF6AEGukrBzwwdDWX5jUXDKqj7+kn7LBRy6NocE4=bw1D9WjcQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Add UAPI for the Asahi driver
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
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>
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

On Mon, Mar 10, 2025 at 7:14=E2=80=AFAM Alyssa Rosenzweig <alyssa@rosenzwei=
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
> https://github.com/alyssarosenzweig/linux/commits/agx/uapi/ contains the
> DRM driver implementing this proposed UAPI.
>
> https://github.com/alyssarosenzweig/mesa/tree/agx-uapi contains the Mesa
> patches to implement this proposed UAPI.
>
> That Linux and Mesa branch together give a complete graphics/compute
> stack on top of this UAPI.
>
> Co-developed-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
>  Documentation/gpu/driver-uapi.rst |    5 +
>  MAINTAINERS                       |    1 +
>  include/uapi/drm/asahi_drm.h      | 1153 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 1159 insertions(+)
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
> index 0000000000000000000000000000000000000000..1491ddbf807d1a26d7d5c5df7=
8a7a988787d15c4
> --- /dev/null
> +++ b/include/uapi/drm/asahi_drm.h
> @@ -0,0 +1,1153 @@
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
> +       /** @DRM_ASAHI_VM_CREATE: Create a GPU VM address space. */
> +       DRM_ASAHI_VM_CREATE,
> +
> +       /** @DRM_ASAHI_VM_DESTROY: Destroy a VM. */
> +       DRM_ASAHI_VM_DESTROY,
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
> +       /** @DRM_ASAHI_GEM_BIND: Bind/unbind memory to a VM. */
> +       DRM_ASAHI_GEM_BIND,
> +
> +       /** @DRM_ASAHI_QUEUE_CREATE: Create a scheduling queue. */
> +       DRM_ASAHI_QUEUE_CREATE,
> +
> +       /** @DRM_ASAHI_QUEUE_DESTROY: Destroy a scheduling queue. */
> +       DRM_ASAHI_QUEUE_DESTROY,
> +
> +       /** @DRM_ASAHI_SUBMIT: Submit an array of commands to a queue. */
> +       DRM_ASAHI_SUBMIT,
> +
> +       /** @DRM_ASAHI_GET_TIME: Query device time. */
> +       DRM_ASAHI_GET_TIME,
> +
> +       /** @DRM_ASAHI_GEM_BIND_OBJECT: Bind memory as a special object *=
/
> +       DRM_ASAHI_GEM_BIND_OBJECT,
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
> +       /** @pad: MBZ */
> +       __u32 pad;
> +
> +       /** @core_masks: Bitmask of present/enabled cores per cluster */
> +       __u64 core_masks[DRM_ASAHI_MAX_CLUSTERS];
> +
> +       /** @timer_frequency_hz: Clock frequency for timestamps */
> +       __u64 timer_frequency_hz;
> +
> +       /** @min_frequency_khz: Minimum GPU core clock frequency */
> +       __u32 min_frequency_khz;
> +
> +       /** @max_frequency_khz: Maximum GPU core clock frequency */
> +       __u32 max_frequency_khz;
> +
> +       /** @max_power_mw: Maximum GPU power consumption */
> +       __u32 max_power_mw;
> +
> +       /** @vm_page_size: GPU VM page size */
> +       __u32 vm_page_size;
> +
> +       /** @vm_user_start: VM user range start VMA */
> +       __u64 vm_user_start;
> +
> +       /** @vm_user_end: VM user range end VMA */
> +       __u64 vm_user_end;
> +
> +       /**
> +        * @vm_kernel_min_size: Minimum kernel VMA window size within use=
r
> +        * range
> +        */
> +       __u64 vm_kernel_min_size;
> +
> +       /**
> +        * @max_commands_per_submission: Maximum number of supported comm=
ands
> +        * per submission
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
> +        * @firmware_version: GPU firmware version, as 4 integers
> +        */
> +       __u32 firmware_version[4];
> +
> +       /**
> +        * @user_timestamp_frequency_hz: Timebase frequency for user time=
stamps
> +        */
> +       __u64 user_timestamp_frequency_hz;
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
> +       /** @kernel_start: Start of the kernel-reserved address range */
> +       __u64 kernel_start;
> +
> +       /** @kernel_end: End of the kernel-reserved address range */
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
> + * define ASAHI_GEM_WRITEBACK - BO should be CPU-mapped as writeback.
> + *
> + * Map as writeback instead of write-combine. This optimizes for CPU rea=
ds.
> + */
> +#define ASAHI_GEM_WRITEBACK (1L << 0)
> +
> +/**
> + * define ASAHI_GEM_VM_PRIVATE - BO is private to this GPU VM (no export=
s)
> + */
> +#define ASAHI_GEM_VM_PRIVATE (1L << 1)
> +
> +/**
> + * struct drm_asahi_gem_create - Arguments passed to DRM_IOCTL_ASAHI_GEM=
_CREATE
> + */
> +struct drm_asahi_gem_create {
> +       /** @size: Size of the BO */
> +       __u64 size;
> +
> +       /** @flags: Combination of ASAHI_GEM_* flags. */
> +       __u32 flags;
> +
> +       /**
> +        * @vm_id: VM ID to assign to the BO, if ASAHI_GEM_VM_PRIVATE is =
set
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
> + * enum drm_asahi_bind_op - Bind operation
> + */
> +enum drm_asahi_bind_op {
> +       /** @ASAHI_BIND_OP_BIND: Bind a BO to a GPU VMA range */
> +       ASAHI_BIND_OP_BIND =3D 0,
> +
> +       /** @ASAHI_BIND_OP_UNBIND: Unbind a GPU VMA range */
> +       ASAHI_BIND_OP_UNBIND =3D 1,
> +
> +       /** @ASAHI_BIND_OP_UNBIND_ALL: Unbind all mappings of a given BO =
*/
> +       ASAHI_BIND_OP_UNBIND_ALL =3D 2,
> +};
> +
> +/**
> + * define ASAHI_BIND_READ - Map BO with GPU read permission
> + */
> +#define ASAHI_BIND_READ                (1L << 0)
> +
> +/**
> + * define ASAHI_BIND_WRITE - Map BO with GPU write permission
> + */
> +#define ASAHI_BIND_WRITE       (1L << 1)
> +
> +/**
> + * define ASAHI_BIND_SINGLE_PAGE - Map a single page of the BO repeatedl=
y across
> + * the VA range.
> + *
> + * This is useful to fill a VA range with scratch pages or zero pages. I=
t is
> + * intended as a mechanism to accelerate sparse.
> + */
> +#define ASAHI_BIND_SINGLE_PAGE (1L << 2)
> +
> +/**
> + * struct drm_asahi_gem_bind - Arguments passed to
> + * DRM_IOCTL_ASAHI_GEM_BIND
> + */
> +struct drm_asahi_gem_bind {
> +       /** @op: Bind operation (enum drm_asahi_bind_op) */
> +       __u32 op;
> +
> +       /** @flags: One or more of ASAHI_BIND_* (BIND only) */
> +       __u32 flags;
> +
> +       /** @handle: GEM object to bind/unbind (BIND or UNBIND_ALL) */
> +       __u32 handle;
> +
> +       /** @vm_id: The ID of the VM to operate on */
> +       __u32 vm_id;
> +
> +       /** @offset: Offset into the object (BIND only) */
> +       __u64 offset;
> +
> +       /**
> +        * @range: Number of bytes to bind/unbind to addr (BIND or UNBIND=
 only)
> +        */
> +       __u64 range;
> +
> +       /** @addr: Address to bind to (BIND or UNBIND only) */
> +       __u64 addr;
> +};

No in/out syncobj/fences?  This seems to diverge from xe/nouveau/panthor..

> +
> +/**
> + * enum drm_asahi_bind_object_op - Special object bind operation
> + */
> +enum drm_asahi_bind_object_op {
> +       /** @ASAHI_BIND_OBJECT_OP_BIND: Bind a BO as a special GPU object=
 */
> +       ASAHI_BIND_OBJECT_OP_BIND =3D 0,
> +
> +       /** @ASAHI_BIND_OBJECT_OP_UNBIND: Unbind a special GPU object */
> +       ASAHI_BIND_OBJECT_OP_UNBIND =3D 1,
> +};
> +
> +/**
> + * define ASAHI_BIND_OBJECT_USAGE_TIMESTAMPS - Map a BO as a timestamp b=
uffer
> + */
> +#define ASAHI_BIND_OBJECT_USAGE_TIMESTAMPS     (1L << 0)
> +
> +/**
> + * struct drm_asahi_gem_bind_object - Arguments passed to
> + * DRM_IOCTL_ASAHI_GEM_BIND_OBJECT
> + */
> +struct drm_asahi_gem_bind_object {
> +       /** @op: Bind operation (enum drm_asahi_bind_object_op) */
> +       __u32 op;
> +
> +       /** @flags: One or more of ASAHI_BIND_OBJECT_* */
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
> +        */
> +       DRM_ASAHI_CMD_RENDER =3D 0,
> +
> +       /** @DRM_ASAHI_CMD_COMPUTE: Compute command on the compute subque=
ue. */
> +       DRM_ASAHI_CMD_COMPUTE =3D 1,
> +};
> +
> +/**
> + * enum drm_asahi_queue_cap - Queue capabilities
> + */
> +enum drm_asahi_queue_cap {
> +       /** @DRM_ASAHI_QUEUE_CAP_RENDER: Supports render commands */
> +       DRM_ASAHI_QUEUE_CAP_RENDER      =3D (1UL << DRM_ASAHI_CMD_RENDER)=
,
> +
> +       /** @DRM_ASAHI_QUEUE_CAP_COMPUTE: Supports compute commands */
> +       DRM_ASAHI_QUEUE_CAP_COMPUTE     =3D (1UL << DRM_ASAHI_CMD_COMPUTE=
),
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
> +       /** @queue_caps: Bitmask of DRM_ASAHI_QUEUE_CAP_* */
> +       __u32 queue_caps;
> +
> +       /** @priority: Queue priority, 0-3 */
> +       __u32 priority;
> +
> +       /** @queue_id: The returned queue ID */
> +       __u32 queue_id;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
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

IMHO it would still be worthwhile to also support fence fd's, since it
would avoid a couple extra ioctls to convert btwn fence fds and
syncobj for virtgpu native context..

BR,
-R

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
> + * enum drm_asahi_subqueue - Subqueue within a queue
> + */
> +enum drm_asahi_subqueue {
> +       /** @DRM_ASAHI_SUBQUEUE_RENDER: Render subqueue */
> +       DRM_ASAHI_SUBQUEUE_RENDER =3D 0,
> +
> +       /** @DRM_ASAHI_SUBQUEUE_COMPUTE: Compute subqueue */
> +       DRM_ASAHI_SUBQUEUE_COMPUTE =3D 1,
> +
> +       /**
> +        * @DRM_ASAHI_SUBQUEUE_COUNT: Queue count, must remain multiple o=
f 2
> +        * for struct alignment
> +        */
> +       DRM_ASAHI_SUBQUEUE_COUNT =3D 2,
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
> +#define DRM_ASAHI_BARRIER_NONE ~(0U)
> +
> +/**
> + * struct drm_asahi_command - Top level command structure
> + */
> +struct drm_asahi_command {
> +       /** @cmd_type: One of drm_asahi_cmd_type */
> +       __u32 cmd_type;
> +
> +       /** @flags: Flags for command submission */
> +       __u32 flags;
> +
> +       /** @cmd_buffer: Pointer to the appropriate command buffer struct=
ure */
> +       __u64 cmd_buffer;
> +
> +       /** @cmd_buffer_size: Size of the command buffer structure */
> +       __u64 cmd_buffer_size;
> +
> +       /** @barriers: Array of command indices per subqueue to wait on *=
/
> +       __u32 barriers[DRM_ASAHI_SUBQUEUE_COUNT];
> +};
> +
> +/**
> + * struct drm_asahi_submit - Arguments passed to DRM_IOCTL_ASAHI_SUBMIT
> + */
> +struct drm_asahi_submit {
> +       /**
> +        * @in_syncs: An optional array of drm_asahi_sync to wait on befo=
re
> +        * starting this job.
> +        */
> +       __u64 in_syncs;
> +
> +       /**
> +        * @out_syncs: An optional array of drm_asahi_sync objects to sig=
nal
> +        * upon completion.
> +        */
> +       __u64 out_syncs;
> +
> +       /**
> +        * @commands: Pointer to the drm_asahi_command array of commands =
to
> +        * submit.
> +        */
> +       __u64 commands;
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
> +       /** @command_count: Number of commands to be submitted */
> +       __u32 command_count;
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
> +/**
> + * define ASAHI_RENDER_VERTEX_SPILLS - Vertex stage shader spills
> + */
> +#define ASAHI_RENDER_VERTEX_SPILLS (1UL << 0)
> +
> +/**
> + * define ASAHI_RENDER_PROCESS_EMPTY_TILES - Process empty tiles through=
 the
> + * fragment load/store
> + */
> +#define ASAHI_RENDER_PROCESS_EMPTY_TILES (1UL << 1)
> +
> +/**
> + * define ASAHI_RENDER_NO_VERTEX_CLUSTERING - Run vertex stage on a sing=
le
> + * cluster (on multicluster GPUs)
> + *
> + * This will harm performance but can workaround certain sync/coherency =
bugs,
> + * and therefore is useful for debugging.
> + */
> +#define ASAHI_RENDER_NO_VERTEX_CLUSTERING (1UL << 2)
> +
> +/**
> + * define ASAHI_RENDER_DBIAS_IS_INT - Use integer depth bias formula.
> + *
> + * Graphics specifications contain two alternate formulas for depth bias=
, a
> + * float formula used with floating-point depth buffers and an integer f=
ormula
> + * using with unorm depth buffers. This flag specifies that the integer =
formula
> + * should be used. If omitted, the float formula is used instead.
> + *
> + * This corresponds to bit 18 of the relevant hardware control register,=
 so we
> + * match that here for efficiency.
> + */
> +#define ASAHI_RENDER_DBIAS_IS_INT (1UL << 18)
> +
> +/**
> + * struct drm_asahi_zls_buffer - Describe a depth or stencil buffer.
> + *
> + * These fields correspond directly to hardware registers in the ZLS (Z
> + * Load/Store) unit. Together, they configure a single depth or stencil =
buffer.
> + * Typically, load/store/partial will all use the same values. However, =
the
> + * hardware does not require this.
> + */
> +struct drm_asahi_zls_buffer {
> +       /** @load: Base address of the buffer to load at the start */
> +       __u64 load;
> +
> +       /** @store: Base address of the buffer to store at the end */
> +       __u64 store;
> +
> +       /**
> +        * @partial: Base address of the buffer to load and store during =
a
> +        * partial render operation.
> +        */
> +       __u64 partial;
> +
> +       /**
> +        * @comp_load: If the load buffer is compressed, address of the
> +        * compression metadata section.
> +        */
> +       __u64 comp_load;
> +
> +       /**
> +        * @comp_store: If the load buffer is compressed, address of the
> +        * compression metadata section.
> +        */
> +       __u64 comp_store;
> +
> +       /**
> +        * @comp_partial: If the partial render buffer is compressed, add=
ress of
> +        * the compression metadata section.
> +        */
> +       __u64 comp_partial;
> +
> +       /**
> +        * @load_stride: If layered rendering is enabled, the number of b=
ytes
> +        * between each layer of the load buffer.
> +        */
> +       __u32 load_stride;
> +
> +       /**
> +        * @store_stride: If layered rendering is enabled, the number of =
bytes
> +        * between each layer of the store buffer.
> +        */
> +       __u32 store_stride;
> +
> +       /**
> +        * @partial_stride: If layered rendering is enabled, the number o=
f bytes
> +        * between each layer of the partial render buffer.
> +        */
> +       __u32 partial_stride;
> +
> +       /**
> +        * @comp_load_stride: If layered rendering is enabled, the number=
 of bytes
> +        * between each layer of the compression metadata for loads.
> +        */
> +       __u32 comp_load_stride;
> +
> +       /**
> +        * @comp_store_stride: If layered rendering is enabled, the numbe=
r of
> +        * bytes between each layer of the compression metadata for store=
s.
> +        */
> +       __u32 comp_store_stride;
> +
> +       /**
> +        * @comp_partial_stride: If layered rendering is enabled, the num=
ber of
> +        * bytes between each layer of the compression metadata for parti=
al
> +        * renders.
> +        */
> +       __u32 comp_partial_stride;
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
> +       /** @flags: Zero or more of ASAHI_RENDER_* */
> +       __u64 flags;
> +
> +       /** @encoder_ptr: GPU base address to the hardware control stream=
 */
> +       __u64 encoder_ptr;
> +
> +       /**
> +        * @usc_base: GPU base address for all USC binaries (shaders) use=
d in
> +        * this command. USC addresses are 32-bit relative to this 64-bit=
 base.
> +        */
> +       __u64 usc_base;
> +
> +       /**
> +        * @vertex_attachments: Pointer to drm_asahi_attachment array use=
d for
> +        * the vertex portion of this command.
> +        */
> +       __u64 vertex_attachments;
> +
> +       /**
> +        * @fragment_attachments: Pointer to drm_asahi_attachment array u=
sed for
> +        * the fragment portion of this command. This includes the end-of=
-tile
> +        * shader, in addition to the fragment shaders themselves.
> +        */
> +       __u64 fragment_attachments;
> +
> +       /**
> +        * @vertex_attachment_count: Number of drm_asahi_attachment's poi=
nted to
> +        * by vertex_attachments
> +        */
> +       __u32 vertex_attachment_count;
> +
> +       /**
> +        * @fragment_attachment_count: Number of drm_asahi_attachment's p=
ointed
> +        * to by fragment_attachmenst
> +        */
> +       __u32 fragment_attachment_count;
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
> +       /** @depth: Physical buffers backing the logical depth buffer */
> +       struct drm_asahi_zls_buffer depth;
> +
> +       /** @stencil: Physical buffers backing the logical stencil buffer=
 */
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
> +       /** @encoder_id: Opaque handle identifying what encoded this comm=
and. */
> +       __u32 encoder_id;
> +
> +       /**
> +        * @cmd_ta_id: Unique identifier for the Tiling Accelerator (TA)
> +        * portion of this command.
> +        */
> +       __u32 cmd_ta_id;
> +
> +       /**
> +        * @cmd_3d_id: Unique identifier for the 3D
> +        * portion of this command.
> +        */
> +       __u32 cmd_3d_id;
> +
> +       /**
> +        * @isp_merge_upper_x: 32-bit float used in the
> +        * hardware triangle merging. Calculate as:
> +        *
> +        *      tan(60 deg) * width
> +        *
> +        * Making these values UAPI avoids requiring floating-point calcu=
lations
> +        * in the kernel in the hot path.
> +        */
> +       __u32 isp_merge_upper_x;
> +
> +       /**
> +        * @isp_merge_upper_y: 32-bit float. Calculate as:
> +        *
> +        *      tan(60 deg) * height
> +        *
> +        * See @isp_merge_upper_x.
> +        */
> +
> +       __u32 isp_merge_upper_y;
> +
> +       /**
> +        * @bg: Background program ran at the start of each tile at the s=
tart of
> +        * the render pass.
> +        */
> +       struct drm_asahi_bg_eot bg;
> +
> +       /**
> +        * @eot: End-of-tile program ran at the end of each tile at the e=
nd of
> +        * the render pass.
> +        */
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
> +        * @isp_zls_pixels: ISP_ZLS_PIXELS register value. This contains =
the
> +        * depth buffer width/height, which is allowed to differ from the
> +        * framebuffer width/height.
> +        */
> +       __u32 isp_zls_pixels;
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
> + * single compute command, although timestamping only occurs at command
> + * granularity.
> + */
> +struct drm_asahi_cmd_compute {
> +       /** @flags: MBZ */
> +       __u64 flags;
> +
> +       /** @encoder_ptr: GPU base address to the hardware control stream=
 */
> +       __u64 encoder_ptr;
> +
> +       /**
> +        * @encoder_end: GPU base address to the end of the hardware cont=
rol
> +        * stream. Note this only considers the first contiguous segment =
of the
> +        * control stream, as the stream might jump elsewhere.
> +        */
> +       __u64 encoder_end;
> +
> +       /**
> +        * @usc_base: GPU Base address for all USC binaries (shaders) use=
d in
> +        * this command. USC addresses are 32-bit relative to this 64-bit=
 base.
> +        */
> +       __u64 usc_base;
> +
> +       /**
> +        * @attachments: Pointer to drm_asahi_attachment array used for
> +        * this command
> +        */
> +       __u64 attachments;
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
> +       /**
> +        * @attachment_count: Number of drm_asahi_attachments pointed to =
by
> +        * @attachments
> +        */
> +       __u32 attachment_count;
> +
> +       /** @sampler_count: Number of samplers in the sampler heap. */
> +       __u32 sampler_count;
> +
> +       /** @helper: Helper program used for this compute shader */
> +       struct drm_asahi_helper_program helper;
> +
> +       /** @encoder_id: Opaque handle identifying what encoded this comm=
and. */
> +       __u32 encoder_id;
> +
> +       /** @cmd_id: Unique identifier for this command. */
> +       __u32 cmd_id;
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
> +       /** @gpu_timestamp: On return, the current GPU timestamp */
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
> +       DRM_IOCTL_ASAHI_VM_CREATE        =3D DRM_IOCTL_ASAHI(WR, VM_CREAT=
E, vm_create),
> +       DRM_IOCTL_ASAHI_VM_DESTROY       =3D DRM_IOCTL_ASAHI(W, VM_DESTRO=
Y, vm_destroy),
> +       DRM_IOCTL_ASAHI_GEM_CREATE       =3D DRM_IOCTL_ASAHI(WR, GEM_CREA=
TE, gem_create),
> +       DRM_IOCTL_ASAHI_GEM_MMAP_OFFSET  =3D DRM_IOCTL_ASAHI(WR, GEM_MMAP=
_OFFSET, gem_mmap_offset),
> +       DRM_IOCTL_ASAHI_GEM_BIND         =3D DRM_IOCTL_ASAHI(W, GEM_BIND,=
 gem_bind),
> +       DRM_IOCTL_ASAHI_QUEUE_CREATE     =3D DRM_IOCTL_ASAHI(WR, QUEUE_CR=
EATE, queue_create),
> +       DRM_IOCTL_ASAHI_QUEUE_DESTROY    =3D DRM_IOCTL_ASAHI(W, QUEUE_DES=
TROY, queue_destroy),
> +       DRM_IOCTL_ASAHI_SUBMIT           =3D DRM_IOCTL_ASAHI(W, SUBMIT, s=
ubmit),
> +       DRM_IOCTL_ASAHI_GET_TIME         =3D DRM_IOCTL_ASAHI(WR, GET_TIME=
, get_time),
> +       DRM_IOCTL_ASAHI_GEM_BIND_OBJECT  =3D DRM_IOCTL_ASAHI(WR, GEM_BIND=
_OBJECT, gem_bind_object),
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
