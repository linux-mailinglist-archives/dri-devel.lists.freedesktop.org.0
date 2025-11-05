Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA217C35951
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD4510E70E;
	Wed,  5 Nov 2025 12:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="A65U5Qr6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4CE10E710
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 12:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762345056; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CtYpgGFFlQq5hWQByru0uUaDdQsyieyoys6DD3Lsf2AIRPFZj6yuZ/MWRofK+3JOWEnDqU3OxdYZ1MaRbQnY5lmtsvlF6dncXrw7hizIw3xnSXr1L6wX4f1jtkynqlgfBNQsSP5BFsqztVU0gKcrm42J/a1RyNxZ4sctzWT+9zA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762345056;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BIgj4cvHgmzHQnoWYNjkFEq+ULZ85aLtrBrysm9AVUE=; 
 b=N/CwR2/y0uE0OSC3BPmaYFb1m8IBXJaoirrmqFkTLiAScx4IXB7JKPSA2592pECVH8mi64zJUP3xSdNFNWW4MiiBtOBhHhRyAMW1I/FM6F3TWp7Ad4zuKe8w4ON4FMo+ccB7MrkkiDIAkhJbTwstOTk6qS0OfeviKXjeWW/rZjo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762345056; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=BIgj4cvHgmzHQnoWYNjkFEq+ULZ85aLtrBrysm9AVUE=;
 b=A65U5Qr6F/dkgiK3DlPN8IaG/feZXQKfBhWOTnXdW9Q7fDV9niKH3mCtnwqI1SLn
 5HlMJO5K4B6RoycIP33AL0KEQqKqZOp0TsR5qSmCGLMTKegzPsb1r56cJMto5BSixmG
 QF7PfWLTyOXp/LixbgmQ8HeU8YbN606EN7lHni40=
Received: by mx.zohomail.com with SMTPS id 1762345054671933.3853562090325;
 Wed, 5 Nov 2025 04:17:34 -0800 (PST)
Date: Wed, 5 Nov 2025 12:17:28 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 7/7] drm/panthor: Expose the panthor perf ioctls
Message-ID: <iz3qx32cezov2dz24azht3byitp62qzx4kvssxgy2isgmln7pr@conbiuyo3scd>
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
 <727fa1ec673d45abb51a393d4772cb0a861b409d.1753449448.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <727fa1ec673d45abb51a393d4772cb0a861b409d.1753449448.git.lukas.zapolskas@arm.com>
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

On 25.07.2025 15:57, Lukas Zapolskas wrote:
> This patch implements the PANTHOR_PERF_CONTROL ioctl series, and
> a PANTHOR_GET_UOBJ wrapper to deal with the backwards and forwards
> compatibility of the uAPI.
>
> The minor version is bumped to indicate that the feature is now
> supported.
>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 142 +++++++++++++++++++++++++-
>  1 file changed, 140 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 8b1e3e38b12e..05e3c83b8129 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -31,6 +31,7 @@
>  #include "panthor_gpu.h"
>  #include "panthor_heap.h"
>  #include "panthor_mmu.h"
> +#include "panthor_perf.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
>
> @@ -73,6 +74,40 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
>  	return 0;
>  }
>
> +/**
> + * panthor_get_uobj() - Copy user object to kernel object.
> + * @usr_ptr: Users pointer.
> + * @usr_size: Size of the user object.
> + * @min_size: Minimum size for this object.
> + * @kern_size: Kernel size of the object.
> + *
> + * Helper automating user -> kernel object copies.
> + *
> + * Don't use this function directly, use PANTHOR_UOBJ_GET() instead.
> + *
> + * Return: valid pointer on success, an encoded error code otherwise.
> + */
> +static void*
> +panthor_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size)
> +{
> +	int ret;
> +	void *out_alloc __free(kvfree) = NULL;
> +
> +	/* User size shouldn't be smaller than the minimal object size. */
> +	if (usr_size < min_size)
> +		return ERR_PTR(-EINVAL);
> +
> +	out_alloc = kvmalloc(kern_size, GFP_KERNEL);
> +	if (!out_alloc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = copy_struct_from_user(out_alloc, kern_size, u64_to_user_ptr(usr_ptr), usr_size);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return_ptr(out_alloc);
> +}
> +
>  /**
>   * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
>   * @in: The object array to copy.
> @@ -176,7 +211,11 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_setup, shader_enable_mask), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_start, user_data), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_stop, user_data), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_sample, user_data))
>
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -191,6 +230,25 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
>  			 sizeof(_src_obj), &(_src_obj))
>
> +/**
> + * PANTHOR_UOBJ_GET() - Copies a user object from _usr_ptr to a kernel accessible _dest_ptr.
> + * @_dest_ptr: Local variable
> + * @_usr_size: Size of the user object.
> + * @_usr_ptr: The pointer of the object in userspace.
> + *
> + * Return: Error code. See panthor_get_uobj().
> + */
> +#define PANTHOR_UOBJ_GET(_dest_ptr, _usr_size, _usr_ptr) \
> +	({ \
> +		typeof(_dest_ptr) _tmp; \
> +		_tmp = panthor_get_uobj(_usr_ptr, _usr_size, \
> +				PANTHOR_UOBJ_MIN_SIZE(_tmp[0]), \
> +				sizeof(_tmp[0])); \
> +		if (!IS_ERR(_tmp)) \
> +			_dest_ptr = _tmp; \
> +		PTR_ERR_OR_ZERO(_tmp); \
> +	})
> +
>  /**
>   * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
>   * object array.
> @@ -1402,6 +1460,83 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
>  	return 0;
>  }
>
> +#define perf_cmd(command) \
> +	({ \
> +		struct drm_panthor_perf_cmd_##command *command##_args __free(kvfree) = NULL; \
> +		int _ret = PANTHOR_UOBJ_GET(command##_args, args->size, args->pointer); \
> +		if (_ret) \
> +			return _ret; \
> +		return panthor_perf_session_##command(pfile, ptdev->perf, args->handle, \
> +						      command##_args->user_data); \
> +	})
> +
> +static int panthor_ioctl_perf_control(struct drm_device *ddev, void *data,
> +				      struct drm_file *file)
> +{
> +	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_perf_control *args = data;
> +	int ret;
> +
> +	if (!args->pointer) {
> +		switch (args->cmd) {
> +		case DRM_PANTHOR_PERF_COMMAND_SETUP:
> +			args->size = sizeof(struct drm_panthor_perf_cmd_setup);
> +			return 0;
> +
> +		case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
> +			args->size = 0;
> +			return 0;
> +
> +		case DRM_PANTHOR_PERF_COMMAND_START:
> +			args->size = sizeof(struct drm_panthor_perf_cmd_start);
> +			return 0;
> +
> +		case DRM_PANTHOR_PERF_COMMAND_STOP:
> +			args->size = sizeof(struct drm_panthor_perf_cmd_stop);
> +			return 0;
> +
> +		case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
> +			args->size = sizeof(struct drm_panthor_perf_cmd_sample);
> +			return 0;
> +
> +		default:
> +			return -EINVAL;
> +		}

After a second look at this, now I wonder what the point of passing these command struct values
back to UM from inside the ioctl() is, because they're still part of the uAPI. That means for
as long as the driver uAPI header files are kept in sync between UM and KM, then a client just
has to call sizeof(struct drm_panthor_perf_cmd_*) to compute these values.

> +	}
> +
> +	switch (args->cmd) {
> +	case DRM_PANTHOR_PERF_COMMAND_SETUP:
> +	{
> +		struct drm_panthor_perf_cmd_setup *setup_args __free(kvfree) = NULL;
> +
> +		ret = PANTHOR_UOBJ_GET(setup_args, args->size, args->pointer);
> +		if (ret)
> +			return -EINVAL;
> +
> +		return panthor_perf_session_setup(file, ptdev->perf, setup_args);
> +	}
> +	case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
> +	{
> +		return panthor_perf_session_teardown(pfile, ptdev->perf, args->handle);
> +	}
> +	case DRM_PANTHOR_PERF_COMMAND_START:
> +	{
> +		perf_cmd(start);
> +	}
> +	case DRM_PANTHOR_PERF_COMMAND_STOP:
> +	{
> +		perf_cmd(stop);
> +	}
> +	case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
> +	{
> +		perf_cmd(sample);
> +	}
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1476,6 +1611,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_CONTROL, perf_control, DRM_RENDER_ALLOW),
>  };
>
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> @@ -1609,6 +1745,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
>   * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
>   * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
> + * - 1.6 - adds DEV_QUERY_PERF_INFO query
> + *       - adds PERF_CONTROL ioctl
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1622,7 +1760,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 5,
> +	.minor = 6,
>
>  	.gem_create_object = panthor_gem_create_object,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> --
> 2.33.0.dirty


Adrian Larumbe
