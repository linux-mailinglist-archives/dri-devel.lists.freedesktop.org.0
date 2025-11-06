Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B97C39CF5
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543C110E85D;
	Thu,  6 Nov 2025 09:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b8Qx0BGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E4110E85B;
 Thu,  6 Nov 2025 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762421171;
 bh=nmdU0ge50fq0lHu4BpdYfA8ccSdhIjX9nEHLe1tS8fM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b8Qx0BGxinF49qrZIFoPZhxEnqFTWJ0bcvxxpUpFuDQPgRZkAukediUf0ihlnpV2y
 AGZzUU46f7dUkJzE36T0EcWRmQVj+DF8zGJnw7JXXkRYZ4vVvGSVcLDcSzWOrUTuGm
 CAv414HIW4fw98fL+E0zAS9M4BbPy3RMchUgzqNSQT8qftxdedAL/aVsMFIReASjlo
 EvIsNnAjPEyT9CrQjWgcl7XdrMmRXMQjBB0Ygf/Vl5KbeqHjwsJBgJl7uDejqSvkPb
 MQi1fVw8yOWDycoG2Y8vhKxUr3ivA8cxx10P/sCK+gQSGX2vQu0LI6lTNK2++vNR/3
 nIaZgyFEBAtZQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EC8AD17E0CA1;
 Thu,  6 Nov 2025 10:26:10 +0100 (CET)
Date: Thu, 6 Nov 2025 10:26:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com, liviu.dudau@arm.com,
 steven.price@arm.com, aliceryhl@google.com, jeffv@google.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 3/3] tests/panthor: add panthor tests
Message-ID: <20251106102607.7f1fe3f7@fedora>
In-Reply-To: <20251104202845.2879460-4-daniel.almeida@collabora.com>
References: <20251104202845.2879460-1-daniel.almeida@collabora.com>
 <20251104202845.2879460-4-daniel.almeida@collabora.com>
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

On Tue,  4 Nov 2025 17:28:43 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> Add an initial test suit covering query device properties, allocating
> memory, binding and unbinding VA ranges through VM_BIND and submitting a
> simple piece of work through GROUP_SUBMIT.
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

With the indentation fixed, this is

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  lib/igt_panthor.c             | 331 ++++++++++++++++++++++++++++++++++
>  lib/igt_panthor.h             |  28 +++
>  tests/panthor/meson.build     |   5 +-
>  tests/panthor/panthor_gem.c   |  72 ++++++++
>  tests/panthor/panthor_group.c | 123 +++++++++++++
>  tests/panthor/panthor_vm.c    |  84 +++++++++
>  6 files changed, 642 insertions(+), 1 deletion(-)
>  create mode 100644 tests/panthor/panthor_gem.c
>  create mode 100644 tests/panthor/panthor_group.c
>  create mode 100644 tests/panthor/panthor_vm.c
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 0b690f796..73ada9c59 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -6,6 +6,148 @@
>  #include "ioctl_wrappers.h"
>  #include "panthor_drm.h"
>  
> +/**
> + * igt_panthor_group_create:
> + * @fd: device file descriptor
> + * @group_create: pointer to group creation structure
> + * @err: expected error code, or 0 for success
> + *
> + * Create a group.
> + */
> +void igt_panthor_group_create(int fd, struct drm_panthor_group_create *group_create, int err)
> +{
> +	if (err)
> +		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_GROUP_CREATE, group_create, err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_CREATE, group_create);
> +}
> +
> +/**
> + * igt_panthor_group_destroy:
> + * @fd: device file descriptor
> + * @group_handle: group handle to destroy
> + * @err: expected error code, or 0 for success
> + *
> + * Destroy a group.
> + */
> +void igt_panthor_group_destroy(int fd, uint32_t group_handle, int err)
> +{
> +	struct drm_panthor_group_destroy group_destroy = {
> +		.group_handle = group_handle,
> +	};
> +
> +	if (err)
> +		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_GROUP_DESTROY, &group_destroy, err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_DESTROY, &group_destroy);
> +}
> +
> +/**
> + * igt_panthor_group_submit:
> + * @fd: device file descriptor
> + * @group_submit: pointer to group submission structure
> + * @err: expected error code, or 0 for success
> + *
> + * Submit work to a group.
> + */
> +void igt_panthor_group_submit(int fd, struct drm_panthor_group_submit *group_submit, int err)
> +{
> +	if (err)
> +		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_GROUP_SUBMIT, group_submit, err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_SUBMIT, group_submit);
> +}
> +
> +/**
> + * igt_panthor_get_first_core:
> + * @cores_present: bitmask of available cores
> + *
> + * Get a mask with only the first available core bit set.
> + *
> + * Returns: core mask with first available core, or 0 if no cores available
> + */
> +uint64_t igt_panthor_get_first_core(uint64_t cores_present)
> +{
> +	if (cores_present == 0)
> +		return 0;
> +
> +	return 1ULL << (ffs(cores_present) - 1);
> +}
> +
> +/**
> + * igt_panthor_group_create_simple:
> + * @fd: device file descriptor
> + * @vm_id: VM ID to associate with the group
> + * @err: expected error code, or 0 for success
> + *
> + * Create a group with a single queue and reasonable defaults.
> + *
> + * Returns: group handle on success
> + */
> +uint32_t igt_panthor_group_create_simple(int fd, uint32_t vm_id, int err)
> +{
> +	struct drm_panthor_gpu_info gpu_info = {};
> +	struct drm_panthor_group_create group_create = {};
> +	struct drm_panthor_queue_create queue = {};
> +	struct drm_panthor_obj_array queues = {};
> +
> +	igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu_info, sizeof(gpu_info), 0);
> +
> +	queue.priority = 0;
> +	queue.ringbuf_size = 4096;
> +	queues = (struct drm_panthor_obj_array)DRM_PANTHOR_OBJ_ARRAY(1, &queue);
> +
> +	group_create.queues = queues;
> +	group_create.max_compute_cores = 1;
> +	group_create.max_fragment_cores = 1;
> +	group_create.max_tiler_cores = 1;
> +	group_create.priority = PANTHOR_GROUP_PRIORITY_MEDIUM;
> +	group_create.compute_core_mask = igt_panthor_get_first_core(gpu_info.shader_present);
> +	group_create.fragment_core_mask = igt_panthor_get_first_core(gpu_info.shader_present);
> +	group_create.tiler_core_mask = igt_panthor_get_first_core(gpu_info.tiler_present);
> +	group_create.vm_id = vm_id;
> +
> +	igt_panthor_group_create(fd, &group_create, err);
> +	return group_create.group_handle;
> +}
> +
> +/**
> + * igt_panthor_group_submit_simple:
> + * @fd: device file descriptor
> + * @group_handle: group handle to submit to
> + * @queue_index: queue index within the group
> + * @stream_addr: GPU address of the command stream
> + * @stream_size: size of the command stream
> + * @syncobj_handle: sync object handle for completion signaling
> + * @err: expected error code, or 0 for success
> + *
> + * Submit work to a group queue with a simple interface.
> + */
> +void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
> +				     uint32_t queue_index, uint64_t stream_addr,
> +				     uint32_t stream_size, uint32_t syncobj_handle,
> +				     int err)
> +{
> +	struct drm_panthor_group_submit group_submit = {};
> +	struct drm_panthor_queue_submit queue_submit = {};
> +	struct drm_panthor_sync_op sync_op = {};
> +
> +	sync_op.handle = syncobj_handle;
> +	sync_op.flags = DRM_PANTHOR_SYNC_OP_SIGNAL;
> +
> +	queue_submit.syncs = (struct drm_panthor_obj_array)DRM_PANTHOR_OBJ_ARRAY(1, &sync_op);
> +	queue_submit.queue_index = queue_index;
> +	queue_submit.stream_size = stream_size;
> +	queue_submit.stream_addr = stream_addr;
> +	queue_submit.latest_flush = 0;
> +
> +	group_submit.group_handle = group_handle;
> +	group_submit.queue_submits = (struct drm_panthor_obj_array)
> +		DRM_PANTHOR_OBJ_ARRAY(1, &queue_submit);
> +
> +	igt_panthor_group_submit(fd, &group_submit, err);
> +}
> +
>  /**
>   * SECTION:igt_panthor
>   * @short_description: Panthor support library
> @@ -39,3 +181,192 @@ void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
>  	else
>  		do_ioctl(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query);
>  }
> +
> +/**
> + * igt_panthor_vm_create:
> + * @fd: device file descriptor
> + * @vm_id: pointer to store the created VM ID
> + * @err: expected error code, or 0 for success
> + *
> + * Creates a VM.
> + */
> +void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err)
> +{
> +	struct drm_panthor_vm_create vm_create = {};
> +
> +	if (err) {
> +		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create, err);
> +	} else {
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create);
> +		*vm_id = vm_create.id;
> +	}
> +}
> +
> +/**
> + * igt_panthor_vm_destroy:
> + * @fd: device file descriptor
> + * @vm_id: VM ID to destroy
> + * @err: expected error code, or 0 for success
> + *
> + * Destroys a VM.
> + */
> +void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err)
> +{
> +	struct drm_panthor_vm_destroy vm_destroy = {
> +		.id = vm_id,
> +	};
> +
> +	if (err)
> +		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_VM_DESTROY, &vm_destroy, err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_DESTROY, &vm_destroy);
> +}
> +
> +/**
> + * igt_panthor_vm_bind:
> + * @fd: device file descriptor
> + * @vm_id: VM ID to bind the buffer to
> + * @bo_handle: buffer object handle to bind
> + * @va: virtual address to bind at
> + * @size: size of the binding
> + * @flags: binding flags
> + * @err: expected error code, or 0 for success
> + *
> + * Bind a buffer object to a virtual address in the specified VM.
> + */
> +void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
> +			 uint64_t va, uint64_t size, uint32_t flags, int err)
> +{
> +	struct drm_panthor_vm_bind_op bind_op = {
> +		.flags = flags,
> +		.bo_handle = bo_handle,
> +		.va = va,
> +		.size = size,
> +	};
> +
> +	struct drm_panthor_vm_bind vm_bind = {
> +		.vm_id = vm_id,
> +		.flags = 0,
> +		.ops = DRM_PANTHOR_OBJ_ARRAY(1, &bind_op),
> +	};
> +
> +	if (err)
> +		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_VM_BIND, &vm_bind, err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_BIND, &vm_bind);
> +}
> +
> +/**
> + * igt_panthor_bo_create:
> + * @fd: device file descriptor
> + * @bo: pointer to panthor_bo structure to initialize
> + * @size: requested buffer size in bytes
> + * @flags: buffer object creation flags
> + * @err: expected error code, or 0 for success
> + *
> + * Creates a new buffer object
> + */
> +void igt_panthor_bo_create(int fd, struct panthor_bo *bo,
> +			   uint64_t size, uint32_t flags, int err)
> +{
> +	struct drm_panthor_bo_create bo_create = {
> +		.size = size,
> +		.flags = flags,
> +	};
> +
> +	if (err)
> +		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_BO_CREATE, &bo_create, err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_BO_CREATE, &bo_create);
> +
> +	bo->handle = bo_create.handle;
> +	bo->size = bo_create.size;
> +	bo->offset = 0;
> +	bo->map = NULL;
> +}
> +
> +/**
> + * igt_panthor_bo_mmap_offset:
> + * @fd: device file descriptor
> + * @handle: buffer object handle
> + * @err: expected error code, or 0 for success
> + *
> + * Get the mmap offset for a buffer object.
> + *
> + * Returns: the mmap offset for the buffer object
> + */
> +uint64_t igt_panthor_bo_mmap_offset(int fd, uint32_t handle, int err)
> +{
> +	struct drm_panthor_bo_mmap_offset bo_mmap_offset = {
> +		.handle = handle,
> +	};
> +
> +	if (err)
> +		do_ioctl_err(fd, DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET, &bo_mmap_offset, err);
> +	else
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET, &bo_mmap_offset);
> +
> +	return bo_mmap_offset.offset;
> +}
> +
> +/**
> + * igt_panthor_mmap_bo:
> + * @fd: device file descriptor
> + * @handle: buffer object handle
> + * @size: size of the buffer to map
> + * @prot: memory protection flags (e.g., PROT_READ | PROT_WRITE)
> + * @offset: mmap offset for the buffer object
> + *
> + * Map a buffer object into the process address space.
> + *
> + * Returns: pointer to the mapped memory, or NULL on failure
> + */
> +void *igt_panthor_mmap_bo(int fd, uint32_t handle, uint64_t size,
> +			  unsigned int prot, uint64_t offset)
> +{
> +	void *ptr;
> +
> +	ptr = mmap(0, size, prot, MAP_SHARED, fd, offset);
> +	if (ptr == MAP_FAILED)
> +		return NULL;
> +	else
> +		return ptr;
> +}
> +
> +/**
> + * igt_panthor_bo_create_mapped:
> + * @fd: device file descriptor
> + * @bo: pointer to panthor_bo structure to initialize
> + * @size: requested buffer size in bytes
> + * @flags: buffer object creation flags
> + * @err: expected error code, or 0 for success
> + *
> + * Create a new buffer object on the panthor device and map it into
> + * the process address space.
> + */
> +void igt_panthor_bo_create_mapped(int fd, struct panthor_bo *bo, uint64_t size,
> +				  uint32_t flags, int err)
> +{
> +	igt_panthor_bo_create(fd, bo, size, flags, err);
> +	bo->offset = igt_panthor_bo_mmap_offset(fd, bo->handle, err);
> +	bo->map = igt_panthor_mmap_bo(fd, bo->handle, bo->size,
> +				      PROT_READ | PROT_WRITE, bo->offset);
> +}
> +
> +/**
> + * igt_panthor_free_bo:
> + * @fd: panthor device file descriptor
> + * @bo: pointer to panthor_bo structure to free
> + *
> + * Free a buffer object and unmap it if it was mapped.
> + */
> +void igt_panthor_free_bo(int fd, struct panthor_bo *bo)
> +{
> +	if (!bo)
> +		return;
> +
> +	if (bo->map)
> +		munmap(bo->map, bo->size);
> +
> +	gem_close(fd, bo->handle);
> +}
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index 6f94b8f79..dc90033c0 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -7,8 +7,36 @@
>  #include <stddef.h>
>  #include <stdint.h>
>  #include <stdbool.h>
> +#include "panthor_drm.h"
> +
> +struct panthor_bo {
> +	int handle;
> +	uint64_t offset;
> +	uint64_t size;
> +	void *map;
> +};
>  
>  void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
> +void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err);
> +void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
> +void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
> +			 uint64_t size, uint32_t flags, int err);
> +void igt_panthor_bo_create(int fd, struct panthor_bo *bo, uint64_t size, uint32_t flags, int err);
> +uint64_t igt_panthor_bo_mmap_offset(int fd, uint32_t handle, int err);
> +void igt_panthor_free_bo(int fd, struct panthor_bo *bo);
> +void igt_panthor_bo_create_mapped(int fd, struct panthor_bo *bo, uint64_t size,
> +				  uint32_t flags, int err);
> +void *igt_panthor_mmap_bo(int fd, uint32_t handle, uint64_t size,
> +			  unsigned int prot, uint64_t offset);
> +void igt_panthor_group_create(int fd, struct drm_panthor_group_create *group_create, int err);
> +void igt_panthor_group_destroy(int fd, uint32_t group_handle, int err);
> +void igt_panthor_group_submit(int fd, struct drm_panthor_group_submit *group_submit, int err);
> +uint32_t igt_panthor_group_create_simple(int fd, uint32_t vm_id, int err);
> +void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
> +				     uint32_t queue_index, uint64_t stream_addr,
> +				     uint32_t stream_size, uint32_t syncobj_handle,
> +				     int err);
> +uint64_t igt_panthor_get_first_core(uint64_t cores_present);
>  
>  enum cs_opcode {
>  	CS_OPCODE_NOP = 0,
> diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
> index ce13aebaa..42a46e993 100644
> --- a/tests/panthor/meson.build
> +++ b/tests/panthor/meson.build
> @@ -1,5 +1,8 @@
>  panthor_progs = [
> -	'panthor_query'
> +	'panthor_gem',
> +	'panthor_group',
> +	'panthor_query',
> +	'panthor_vm',
>  ]
>  
>  foreach prog : panthor_progs
> diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
> new file mode 100644
> index 000000000..57cd97e80
> --- /dev/null
> +++ b/tests/panthor/panthor_gem.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +
> +igt_main {
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_PANTHOR);
> +	}
> +
> +	igt_describe("Create a buffer object");
> +	igt_subtest("bo_create") {
> +		struct panthor_bo bo;
> +
> +		igt_panthor_bo_create(fd, &bo, 4096, 0, 0);
> +		igt_assert_neq(bo.handle, 0);
> +
> +		igt_panthor_free_bo(fd, &bo);
> +	}
> +
> +	igt_describe("Create a fake mmap offset for a buffer object");
> +	igt_subtest("bo_mmap_offset") {
> +		struct panthor_bo bo;
> +		uint64_t mmap_offset;
> +
> +		igt_panthor_bo_create(fd, &bo, 4096, 0, 0);
> +		igt_assert_neq(bo.handle, 0);
> +
> +		mmap_offset = igt_panthor_bo_mmap_offset(fd, bo.handle, 0);
> +		igt_assert_neq(mmap_offset, 0);
> +
> +		igt_panthor_free_bo(fd, &bo);
> +	}
> +
> +	igt_describe("Same as bo_mmap_offset but with an invalid handle");
> +	igt_subtest("bo_mmap_offset_invalid_handle") {
> +		struct panthor_bo bo;
> +		uint64_t mmap_offset;
> +
> +		igt_panthor_bo_create(fd, &bo, 4096, 0, 0);
> +		igt_assert_neq(bo.handle, 0);
> +
> +		mmap_offset = igt_panthor_bo_mmap_offset(fd, 0xdeadbeef, ENOENT);
> +		igt_assert_eq(mmap_offset, 0);
> +
> +		igt_panthor_free_bo(fd, &bo);
> +	}
> +
> +	igt_describe_f("Create a buffer object whose size is not page-aligned, and check "
> +		       "that the allocated size is rounded up to the next page size (%" PRIu64 ").",
> +		       (uint64_t)getpagesize() * 2);
> +	igt_subtest("bo_create_round_size") {
> +		struct panthor_bo bo;
> +		uint64_t expected_size = getpagesize() * 2;
> +
> +		igt_panthor_bo_create(fd, &bo, 5000, 0, 0);
> +		igt_assert_neq(bo.handle, 0);
> +		igt_assert_eq(bo.size, expected_size);
> +
> +		igt_panthor_free_bo(fd, &bo);
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/panthor/panthor_group.c b/tests/panthor/panthor_group.c
> new file mode 100644
> index 000000000..18c0fc8cb
> --- /dev/null
> +++ b/tests/panthor/panthor_group.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include <stdint.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_panthor.h"
> +#include "igt_syncobj.h"
> +#include "panthor_drm.h"
> +
> +static size_t
> +issue_store_multiple(uint8_t *cs, uint64_t kernel_va, uint32_t constant)
> +{
> +	const uint8_t kernel_va_reg = 68;
> +	const uint8_t constant_reg = 70;
> +	uint64_t instrs[] = {
> +		/* MOV48: Load the source register ([r68; r69]) with the kernel address */
> +		cs_mov48(kernel_va_reg, kernel_va),
> +		/* MOV32: Load a known constant into r70 */
> +		cs_mov32(constant_reg, constant),
> +		/* STORE_MULTIPLE: Store the first register to the address pointed
> +		 * to by [r68; r69]
> +		 */
> +		cs_stm32(kernel_va_reg, constant_reg, 0),
> +		/* FLUSH all Wait for all cores */
> +		cs_wait(0xff, false),
> +		/* MOV32: Clear r70 to 0 */
> +		cs_mov32(constant_reg, 0),
> +		/* FLUSH_CACHE: Clean and invalidate all caches */
> +		cs_flush(CS_FLUSH_MODE_CLEAN_AND_INVALIDATE,
> +			 CS_FLUSH_MODE_CLEAN_AND_INVALIDATE,
> +			 CS_FLUSH_MODE_INVALIDATE,
> +			 0, constant_reg, 1),
> +		cs_wait(0xff, false),
> +	};
> +
> +	memcpy(cs, instrs, sizeof(instrs));
> +	return sizeof(instrs);
> +}
> +
> +igt_main {
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_PANTHOR);
> +	}
> +
> +	igt_describe("Create and destroy a CSF group.");
> +	igt_subtest("group_create") {
> +		struct drm_panthor_vm_create vm_create = {};
> +		struct drm_panthor_vm_destroy vm_destroy = {};
> +		uint32_t group_handle;
> +
> +		vm_create.flags = 0;
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create);
> +		igt_assert_neq(vm_create.id, 0);
> +
> +		group_handle = igt_panthor_group_create_simple(fd, vm_create.id, 0);
> +		igt_assert_neq(group_handle, 0);
> +
> +		igt_panthor_group_destroy(fd, group_handle, 0);
> +
> +		vm_destroy = (struct drm_panthor_vm_destroy) { .id = vm_create.id };
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_DESTROY, &vm_destroy);
> +	}
> +
> +	igt_describe("Submit a job to a group and wait for completion. "
> +				 "The job writes a known value to a buffer object that is then "
> +				 "mmaped and checked.");
> +	igt_subtest("group_submit") {
> +		uint32_t vm_id;
> +		uint32_t group_handle;
> +		struct panthor_bo cmd_buf_bo = {};
> +		struct panthor_bo result_bo = {};
> +		uint64_t command_stream_gpu_addr;
> +		uint32_t command_stream_size;
> +		uint64_t result_gpu_addr;
> +		uint32_t syncobj_handle;
> +		const int INITIAL_VA = 0x1000000;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +
> +		igt_panthor_bo_create_mapped(fd, &cmd_buf_bo, 4096, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, cmd_buf_bo.handle, INITIAL_VA,
> +				    cmd_buf_bo.size, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +		command_stream_gpu_addr = INITIAL_VA;
> +
> +		/* Create the BO to receive the result of the store. */
> +		igt_panthor_bo_create_mapped(fd, &result_bo, 4096, 0, 0);
> +		/* Also bind the result BO. */
> +		igt_panthor_vm_bind(fd, vm_id, result_bo.handle, INITIAL_VA + 4096,
> +				    result_bo.size, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +		result_gpu_addr = INITIAL_VA + 4096;
> +
> +		command_stream_size = issue_store_multiple(cmd_buf_bo.map, result_gpu_addr, 0xdeadbeef);
> +
> +		group_handle = igt_panthor_group_create_simple(fd, vm_id, 0);
> +		igt_assert_neq(group_handle, 0);
> +
> +		syncobj_handle = syncobj_create(fd, 0);
> +
> +		igt_panthor_group_submit_simple(fd, group_handle, 0, command_stream_gpu_addr, command_stream_size, syncobj_handle, 0);
> +
> +		igt_assert(syncobj_wait(fd, &syncobj_handle, 1, INT64_MAX, 0, NULL));
> +
> +		igt_assert_eq(*(uint32_t *)result_bo.map, 0xdeadbeef);
> +
> +		syncobj_destroy(fd, syncobj_handle);
> +
> +		igt_panthor_group_destroy(fd, group_handle, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +
> +		igt_panthor_free_bo(fd, &cmd_buf_bo);
> +		igt_panthor_free_bo(fd, &result_bo);
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> new file mode 100644
> index 000000000..18a0622c7
> --- /dev/null
> +++ b/tests/panthor/panthor_vm.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +#include "panthor_drm.h"
> +
> +igt_main {
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_PANTHOR);
> +	}
> +
> +	igt_describe("Create and destroy a VM");
> +	igt_subtest("vm_create_destroy") {
> +		uint32_t vm_id;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert_neq(vm_id, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_subtest("vm_destroy_invalid") {
> +		igt_panthor_vm_destroy(fd, 0xdeadbeef, EINVAL);
> +	}
> +
> +	igt_describe("Test the VM_BIND API synchronously");
> +	igt_subtest("vm_bind") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = 0x1000;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert_neq(vm_id, 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle,
> +				    0x1000, 0x1000, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Test unbinding a previously bound range");
> +	igt_subtest("vm_unbind") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = 0x1000;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert_neq(vm_id, 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle,
> +				    0x1000, 0x1000, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +		igt_panthor_vm_bind(fd, vm_id, 0,
> +				    0x1000, 0x1000, DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_describe("Test unbinding an address range that was not previously bound");
> +	igt_subtest("vm_unbind_invalid_address") {
> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = 0x1000;
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +		igt_assert_neq(vm_id, 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +
> +		/* This was not bound previously*/
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle,
> +				    0x1000, 0x1000, DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, EINVAL);
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}

