Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0B1A1D7BB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9CC10E529;
	Mon, 27 Jan 2025 14:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="f5aYxZi8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A9B10E529
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:06:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737986798; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UqC+YuTnDdMspnAY9QtXZSMljXzmaC8rdaVVdqsDANxS3+TKSu8QZ+PErbr4twUK4wZ3njEsJcDkYgrYwzjuqzELsN/QhlgukvOxsGUF4V7MVITlx4AMY9YtmAXWM+VJHSpZwKmM1pJ3wQKFX6lLxScnJTqosjLnl9qVb35Me+E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737986798;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=edFuHZhRYMEhHL0TZy0kmM+Q/6nzbl4nwU8KM/Phlp8=; 
 b=TTdHGDlRuUoofC0mZLNB9eWpWqctcwZYg/zODWzJl6bcZBbu4a5LK9hjTkIV3EwiLLrnb8aEQFXppUA/1N741EuoGPhIbHh6m9u12+wJXSbyw9IJHYBpcTpbndtWoQ+I8kpRjXwLVV2ITtBfgN1S6RTXcxk9tAmArCKIIul+f0M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737986798; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=edFuHZhRYMEhHL0TZy0kmM+Q/6nzbl4nwU8KM/Phlp8=;
 b=f5aYxZi84xSZg00Mxo0orHKKMM5I0lLhhMJvrK/O0EhF8I1sPb0pqwp7etB9CAJx
 lVfCXUOnqjzjgT1Xz/bnCUqBkdYvn4F8I5TaarqPawQQm1GHzRv6dgYAc1mUJGzXNo7
 LWHLPuN1oAsEL+8uOr4ErUb52QBExTw+xQzBUgg4=
Received: by mx.zohomail.com with SMTPS id 1737986791344122.34844599780763;
 Mon, 27 Jan 2025 06:06:31 -0800 (PST)
Date: Mon, 27 Jan 2025 14:06:27 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
Subject: Re: [RFC v2 4/8] drm/panthor: Add panthor perf ioctls
Message-ID: <eqt4prsabmlacdbdepk47ef4nojjdlzrv3djqinfsphrfwgvp5@54d6ritzd2gu>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-5-lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211165024.490748-5-lukas.zapolskas@arm.com>
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

On 11.12.2024 16:50, Lukas Zapolskas wrote:
> This patch implements the PANTHOR_PERF_CONTROL ioctl series, and
> a PANTHOR_GET_UOBJ wrapper to deal with the backwards and forwards
> compatibility of the uAPI.
> 
> Stub function definitions are added to ensure the patch builds on its own,
> and will be removed later in the series.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c  | 155 ++++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_perf.c |  34 ++++++
>  drivers/gpu/drm/panthor/panthor_perf.h |  19 +++
>  3 files changed, 206 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index e0ac3107c69e..458175f58b15 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -7,6 +7,7 @@
>  #include <asm/arch_timer.h>
>  #endif
>  
> +#include <linux/cleanup.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> @@ -31,6 +32,7 @@
>  #include "panthor_gpu.h"
>  #include "panthor_heap.h"
>  #include "panthor_mmu.h"
> +#include "panthor_perf.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
>  
> @@ -73,6 +75,39 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
>  	return 0;
>  }
>  
> +/**
> + * panthor_get_uobj() - Copy kernel object to user object.
> + * @usr_ptr: Users pointer.
> + * @usr_size: Size of the user object.
> + * @min_size: Minimum size for this object.
> + *
> + * Helper automating kernel -> user object copies.
> + *
> + * Don't use this function directly, use PANTHOR_UOBJ_GET() instead.
> + *
> + * Return: valid pointer on success, an encoded error code otherwise.
> + */
> +static void*
> +panthor_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size)
> +{
> +	int ret;
> +	void *out_alloc __free(kvfree) = NULL;
> +
> +	/* User size shouldn't be smaller than the minimal object size. */
> +	if (usr_size < min_size)
> +		return ERR_PTR(-EINVAL);
> +
> +	out_alloc = kvmalloc(min_size, GFP_KERNEL);
> +	if (!out_alloc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = copy_struct_from_user(out_alloc, min_size, u64_to_user_ptr(usr_ptr), usr_size);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return_ptr(out_alloc);
> +}
> +
>  /**
>   * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
>   * @in: The object array to copy.
> @@ -176,8 +211,11 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
> -
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_setup, shader_enable_mask), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_start, user_data), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_stop, user_data), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_sample, user_data))
>  
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -192,6 +230,24 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
>  			 sizeof(_src_obj), &(_src_obj))
>  
> +/**
> + * PANTHOR_UOBJ_GET() - Copies a user object from _usr_ptr to a kernel accessible _dest_ptr.
> + * @_dest_ptr: Local varialbe
> + * @_usr_size: Size of the user object.
> + * @_usr_ptr: The pointer of the object in userspace.
> + *
> + * Return: Error code. See panthor_get_uobj().
> + */
> +#define PANTHOR_UOBJ_GET(_dest_ptr, _usr_size, _usr_ptr) \
> +	({ \
> +		typeof(_dest_ptr) _tmp; \
> +		_tmp = panthor_get_uobj(_usr_ptr, _usr_size, \
> +				PANTHOR_UOBJ_MIN_SIZE(_tmp[0])); \
> +		if (!IS_ERR(_tmp)) \
> +			_dest_ptr = _tmp; \
> +		PTR_ERR_OR_ZERO(_tmp); \
> +	})
> +
>  /**
>   * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
>   * object array.
> @@ -1339,6 +1395,99 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
>  	return 0;
>  }
>  
> +static int panthor_ioctl_perf_control(struct drm_device *ddev, void *data,
> +		struct drm_file *file)
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
> +		if (setup_args->pad[0])
> +			return -EINVAL;
> +
> +		ret = panthor_perf_session_setup(ptdev, ptdev->perf, setup_args, pfile);

Shouldn't we return the session id as an output param in setup_args or is the
ioctl's return value enough for this?

> +
> +		return ret;
> +	}
> +	case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
> +	{
> +		return panthor_perf_session_teardown(pfile, ptdev->perf, args->handle);
> +	}
> +	case DRM_PANTHOR_PERF_COMMAND_START:
> +	{
> +		struct drm_panthor_perf_cmd_start *start_args __free(kvfree) = NULL;
> +
> +		ret = PANTHOR_UOBJ_GET(start_args, args->size, args->pointer);
> +		if (ret)
> +			return -EINVAL;
> +
> +		return panthor_perf_session_start(pfile, ptdev->perf, args->handle,
> +				start_args->user_data);
> +	}
> +	case DRM_PANTHOR_PERF_COMMAND_STOP:
> +	{
> +		struct drm_panthor_perf_cmd_stop *stop_args __free(kvfree) = NULL;
> +
> +		ret = PANTHOR_UOBJ_GET(stop_args, args->size, args->pointer);
> +		if (ret)
> +			return -EINVAL;
> +
> +		return panthor_perf_session_stop(pfile, ptdev->perf, args->handle,
> +				stop_args->user_data);
> +	}
> +	case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
> +	{
> +		struct drm_panthor_perf_cmd_sample *sample_args __free(kvfree) = NULL;
> +
> +		ret = PANTHOR_UOBJ_GET(sample_args, args->size, args->pointer);
> +		if (ret)
> +			return -EINVAL;
> +
> +		return panthor_perf_session_sample(pfile, ptdev->perf, args->handle,
> +					sample_args->user_data);
> +	}

For the three cases above, you could define a macro like:

#define perf_cmd(command)							\
	({								\
		struct drm_panthor_perf_cmd_##command * command##_args __free(kvfree) = NULL; \
									\
		ret = PANTHOR_UOBJ_GET(command##_args, args->size, args->pointer); \
		if (ret)						\
			return -EINVAL;					\
		return panthor_perf_session_##command(pfile, ptdev->perf, args->handle, command##_args->user_data); \
	})

	and then do 'perf_cmd(command);' inside each one of them

> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1386,6 +1535,7 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
>  
>  	panthor_group_pool_destroy(pfile);
>  	panthor_vm_pool_destroy(pfile);
> +	panthor_perf_session_destroy(pfile, pfile->ptdev->perf);

I would perhaps do this first because pools are first created during file
opening, just to undo things in the opposite sequence.
>  
>  	kfree(pfile);
>  	module_put(THIS_MODULE);
> @@ -1408,6 +1558,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERF_CONTROL, perf_control, DRM_RENDER_ALLOW),
>  };
>  
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index e0dc6c4b0cf1..6498279ec036 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -63,6 +63,40 @@ void panthor_perf_info_init(struct panthor_device *ptdev)
>  	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
>  }
>  
> +int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
> +		struct drm_panthor_perf_cmd_setup *setup_args,
> +		struct panthor_file *pfile)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data)
> +{
> +		return -EOPNOTSUPP;
> +}
> +
> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data)
> +{
> +	return -EOPNOTSUPP;
> +
> +}
> +
> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf) { }
> +
>  /**
>   * panthor_perf_init - Initialize the performance counter subsystem.
>   * @ptdev: Panthor device
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> index 90af8b18358c..bfef8874068b 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -5,11 +5,30 @@
>  #ifndef __PANTHOR_PERF_H__
>  #define __PANTHOR_PERF_H__
>  
> +#include <linux/types.h>
> +
> +struct drm_gem_object;
> +struct drm_panthor_perf_cmd_setup;
>  struct panthor_device;
> +struct panthor_file;
> +struct panthor_perf;
>  
>  void panthor_perf_info_init(struct panthor_device *ptdev);
>  
>  int panthor_perf_init(struct panthor_device *ptdev);
>  void panthor_perf_unplug(struct panthor_device *ptdev);
>  
> +int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
> +		struct drm_panthor_perf_cmd_setup *setup_args,
> +		struct panthor_file *pfile);
> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid);
> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data);
> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data);
> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
> +		u32 sid, u64 user_data);
> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
> +
>  #endif /* __PANTHOR_PERF_H__ */
> -- 
> 2.25.1


Adrian Larumbe
