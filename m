Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078C6C39CEC
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603F310E85A;
	Thu,  6 Nov 2025 09:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Kpe+YGm/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA7910E858;
 Thu,  6 Nov 2025 09:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762421122;
 bh=oqVaYwcMef8Ehbk6Q/A1JYqWRs1nfi9kGhlZRZcdr/Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kpe+YGm/jeMvVnSTsX7P/8o9HRsa3hbZW6JWT7p1nxUNU8UbBy/+1QTOBzL6TXHVo
 pywSin/0Rl7l9GHtqwrH7ErN+Qs3zvze8BggoPHx+q1B6lne2uq8Tj7Zx2fF1MAXN3
 r9MF0Xim9Ujj3xgp8VAd+CWOucECPoxMOAQoy+Sdq/ExyvlzHsX3I81NoCf8Z7P59j
 wGCIrNI4LKIAu5Udd5puaBGgWySiTKnu1BB/5COQUNxn+IGBy9YFWOLQYzVrUzRIsk
 UXlvZ9gSjMZawD/eY4vSEmIqwhQpOnDJCSk4JCcb/JT8NcbvGMVOyEFWO/Krhn6+ug
 j2g3xPgjMDXOg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EE51C17E12C4;
 Thu,  6 Nov 2025 10:25:21 +0100 (CET)
Date: Thu, 6 Nov 2025 10:25:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com, liviu.dudau@arm.com,
 steven.price@arm.com, aliceryhl@google.com, jeffv@google.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 2/3] panthor: add initial infrastructure
Message-ID: <20251106102518.3252b745@fedora>
In-Reply-To: <20251104202845.2879460-3-daniel.almeida@collabora.com>
References: <20251104202845.2879460-1-daniel.almeida@collabora.com>
 <20251104202845.2879460-3-daniel.almeida@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue,  4 Nov 2025 17:28:42 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> Add the necessary code needed to compile panthor tests as well as the
> basic infrastructure that will be used by the Panthor tests themselves.
> 
> To make sure everything is in order, add a basic test in
> panthor_query.c.
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  lib/igt_panthor.c             |  41 ++++++++
>  lib/igt_panthor.h             | 193 ++++++++++++++++++++++++++++++++++
>  lib/meson.build               |   1 +
>  meson.build                   |   8 ++
>  tests/meson.build             |   2 +
>  tests/panthor/meson.build     |  12 +++
>  tests/panthor/panthor_query.c |  29 +++++
>  7 files changed, 286 insertions(+)
>  create mode 100644 lib/igt_panthor.c
>  create mode 100644 lib/igt_panthor.h
>  create mode 100644 tests/panthor/meson.build
>  create mode 100644 tests/panthor/panthor_query.c
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> new file mode 100644
> index 000000000..0b690f796
> --- /dev/null
> +++ b/lib/igt_panthor.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include "drmtest.h"
> +#include "igt_panthor.h"
> +#include "ioctl_wrappers.h"
> +#include "panthor_drm.h"
> +
> +/**
> + * SECTION:igt_panthor
> + * @short_description: Panthor support library
> + * @title: Panthor
> + * @include: igt.h
> + *
> + * This library provides various auxiliary helper functions for writing Panthor
> + * tests.
> + */
> +
> +/**
> + * igt_panthor_query:
> + * @fd: device file descriptor
> + * @type: query type (e.g., DRM_PANTHOR_DEV_QUERY_GPU_INFO)
> + * @data: pointer to a struct to store the query result
> + * @size: size of the result struct
> + * @err: expected error code, or 0 for success
> + *
> + * Query GPU information.
> + */
> +void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
> +{
> +	struct drm_panthor_dev_query query = {
> +		.type = type,
> +		.pointer = (uintptr_t)data,
> +		.size = size,
> +	};
> +
> +	if (err)
> +		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query, err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query);
> +}
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> new file mode 100644
> index 000000000..6f94b8f79
> --- /dev/null
> +++ b/lib/igt_panthor.h
> @@ -0,0 +1,193 @@
> +/* SPDX-License-Identifier: MIT */
> +/* SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd. */
> +
> +#ifndef IGT_PANTHOR_H
> +#define IGT_PANTHOR_H
> +
> +#include <stddef.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +
> +void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
> +
> +enum cs_opcode {
> +	CS_OPCODE_NOP = 0,
> +	CS_OPCODE_MOVE48 = 1,
> +	CS_OPCODE_MOVE32 = 2,
> +	CS_OPCODE_WAIT = 3,
> +	CS_OPCODE_STM = 21,
> +	CS_OPCODE_FLUSH_CACHE = 36,
> +};
> +
> +enum cs_flush_mode {
> +	CS_FLUSH_MODE_NONE = 0,
> +	CS_FLUSH_MODE_CLEAN = 1,
> +	CS_FLUSH_MODE_INVALIDATE = 2,
> +	CS_FLUSH_MODE_CLEAN_AND_INVALIDATE = 3,
> +};
> +
> +/* There's no plan to support big endian in the UMD, so keep
> + * things simple and don't bother supporting it here either.
> + */
> +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> +#error "big endian not supported"
> +#endif
> +
> +struct cs_instr {
> +	union {
> +		struct {
> +			uint64_t data: 56;
> +			uint64_t opcode: 8;
> +		} any;
> +		struct {
> +			uint64_t unused: 56;
> +			uint64_t opcode: 8;
> +		} nop;
> +		struct {
> +			uint64_t immediate: 48;
> +			uint64_t dest: 8;
> +			uint64_t opcode: 8;
> +		} move48;
> +		struct {
> +			uint64_t immediate: 32;
> +			uint64_t unused: 16;
> +			uint64_t dest: 8;
> +			uint64_t opcode: 8;
> +		} move32;
> +		struct {
> +			uint64_t unused0: 16;
> +			uint64_t wait_mask: 16;
> +			uint64_t progress_inc: 1;
> +			uint64_t unused1: 23;
> +			uint64_t opcode: 8;
> +		} wait;
> +		struct {
> +			uint64_t offset: 16;
> +			uint64_t mask: 16;
> +			uint64_t unused: 8;
> +			uint64_t address: 8;
> +			uint64_t src: 8;
> +			uint64_t opcode: 8;
> +		} stm;
> +		struct {
> +			uint64_t l2_mode: 4;
> +			uint64_t lsc_mode: 4;
> +			uint64_t other_mode: 4;
> +			uint64_t unused0: 4;
> +			uint64_t wait_mask: 16;
> +			uint64_t unused1: 8;
> +			uint64_t flush_id: 8;
> +			uint64_t signal_slot: 4;
> +			uint64_t unused2: 4;
> +			uint64_t opcode: 8;
> +		} flush;
> +		uint64_t raw;
> +	};
> +};
> +
> +static inline uint64_t
> +cs_nop(void)
> +{
> +	struct cs_instr instr = {
> +		.nop = {
> +			.opcode = CS_OPCODE_NOP,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
> +static inline uint64_t
> +cs_mov48(uint8_t dst, uint64_t imm)
> +{
> +	struct cs_instr instr = {
> +		.move48 = {
> +			.opcode = CS_OPCODE_MOVE48,
> +			.dest = dst,
> +			.immediate = (uint64_t)imm & 0xffffffffffffull,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
> +static inline uint64_t
> +cs_mov32(uint8_t dst, uint32_t imm)
> +{
> +	struct cs_instr instr = {
> +		.move32 = {
> +			.opcode = CS_OPCODE_MOVE32,
> +			.dest = dst,
> +			.immediate = (uint32_t)imm,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
> +static inline uint64_t
> +cs_wait(uint16_t wait_mask, bool progress_inc)
> +{
> +	struct cs_instr instr = {
> +		.wait = {
> +			.opcode = CS_OPCODE_WAIT,
> +			.wait_mask = wait_mask,
> +			.progress_inc = progress_inc,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
> +static inline uint64_t
> +cs_stm(uint8_t address, uint8_t src, uint16_t mask, int16_t offset)
> +{
> +	struct cs_instr instr = {
> +		.stm = {
> +			.opcode = CS_OPCODE_STM,
> +			.offset = (uint16_t)offset,
> +			.mask = mask,
> +			.src = src,
> +			.address = address,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
> +static inline uint64_t
> +cs_stm32(uint8_t address, uint8_t src, int16_t offset)
> +{
> +	return cs_stm(address, src, 0x1, offset);
> +}
> +
> +static inline uint64_t
> +cs_stm64(uint8_t address, uint8_t src, int16_t offset)
> +{
> +	return cs_stm(address, src, 0x3, offset);
> +}
> +
> +static inline uint64_t
> +cs_flush(enum cs_flush_mode l2_mode,
> +	 enum cs_flush_mode lsc_mode,
> +	 enum cs_flush_mode other_mode,
> +	 uint16_t wait_mask,
> +	 uint8_t flush_id,
> +	 uint8_t signal_slot)
> +{
> +	struct cs_instr instr = {
> +		.flush = {
> +			.l2_mode = l2_mode,
> +			.lsc_mode = lsc_mode,
> +			.other_mode = other_mode,
> +			.wait_mask = wait_mask,
> +			.flush_id = flush_id,
> +			.signal_slot = signal_slot,
> +			.opcode = CS_OPCODE_FLUSH_CACHE,
> +		},
> +	};
> +
> +	return instr.raw;
> +}
> +
> +#endif /* IGT_PANTHOR_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 725a46e98..707ce6ff9 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -106,6 +106,7 @@ lib_sources = [
>  	'igt_kmod.c',
>  	'igt_ktap.c',
>  	'igt_panfrost.c',
> +	'igt_panthor.c',
>  	'igt_v3d.c',
>  	'igt_vc4.c',
>  	'igt_vmwgfx.c',
> diff --git a/meson.build b/meson.build
> index db6e09a94..bfcffbb9a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -288,6 +288,7 @@ libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
>  amdgpudir = join_paths(libexecdir, 'amdgpu')
>  msmdir = join_paths(libexecdir, 'msm')
>  panfrostdir = join_paths(libexecdir, 'panfrost')
> +panthordir = join_paths(libexecdir, 'panthor')
>  v3ddir = join_paths(libexecdir, 'v3d')
>  vc4dir = join_paths(libexecdir, 'vc4')
>  vkmsdir = join_paths(libexecdir, 'vkms')
> @@ -341,6 +342,12 @@ if get_option('use_rpath')
>  	endforeach
>  	panfrost_rpathdir = join_paths(panfrost_rpathdir, libdir)
>  
> +	panthor_rpathdir = '$ORIGIN'
> +	foreach p : panthordir.split('/')
> +		panthor_rpathdir = join_paths(panthor_rpathdir, '..')
> +	endforeach
> +	panthor_rpathdir = join_paths(panthor_rpathdir, libdir)
> +
>  	v3d_rpathdir = '$ORIGIN'
>  	foreach p : v3ddir.split('/')
>  		v3d_rpathdir = join_paths(v3d_rpathdir, '..')
> @@ -370,6 +377,7 @@ else
>  	amdgpudir_rpathdir = ''
>  	msm_rpathdir = ''
>  	panfrost_rpathdir = ''
> +	panthor_rpathdir = ''
>  	v3d_rpathdir = ''
>  	vc4_rpathdir = ''
>  	vkms_rpathdir = ''
> diff --git a/tests/meson.build b/tests/meson.build
> index f2267bc09..e1fdac2cf 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -490,6 +490,8 @@ subdir('msm')
>  
>  subdir('panfrost')
>  
> +subdir('panthor')
> +
>  subdir('v3d')
>  
>  subdir('vc4')
> diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
> new file mode 100644
> index 000000000..ce13aebaa
> --- /dev/null
> +++ b/tests/panthor/meson.build
> @@ -0,0 +1,12 @@
> +panthor_progs = [
> +	'panthor_query'
> +]
> +
> +foreach prog : panthor_progs
> +	test_executables += executable(prog, prog + '.c',
> +				       dependencies : test_deps,
> +				       install_dir : panthordir,
> +				       install_rpath : panthor_rpathdir,
> +				       install : true)
> +	test_list += join_paths('panthor', prog)
> +endforeach
> diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
> new file mode 100644
> index 000000000..81c2ebd23
> --- /dev/null
> +++ b/tests/panthor/panthor_query.c
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +#include "panthor_drm.h"
> +#include <stdint.h>
> +
> +igt_main {
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_PANTHOR);
> +	}
> +
> +	igt_describe("Query GPU information from ROM.");
> +	igt_subtest("query") {
> +		struct drm_panthor_gpu_info gpu = {};
> +
> +		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu, sizeof(gpu), 0);
> +
> +		igt_assert_neq(gpu.gpu_id, 0);
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}

