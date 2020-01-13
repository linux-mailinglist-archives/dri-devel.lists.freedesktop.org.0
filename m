Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2388F139D88
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 00:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7EE6E19B;
	Mon, 13 Jan 2020 23:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2D56E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 23:41:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1578958881; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=sVNd3drz68zOJH/B6rbCVYqvirgc5j67XFPFikKsziA=;
 b=KUOQ4ttL3U02JUxl14RiA6lNQG3HF8n4UWOWNha6p8VRM8IULi0auvCKevHJSYLdQcbbQvjC
 MyMDAgcFn/rFV+TJI5gMj2LvC2SdUr45vxDM5fiq9g4Bse3Q4exs8M0TIQGUd2y8ugZqzNDH
 EfTWNvNbBU306vydZVf7mcI78Ik=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1d001c.7f9d94d9af80-smtp-out-n03;
 Mon, 13 Jan 2020 23:41:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 669C9C433A2; Mon, 13 Jan 2020 23:41:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 10A47C433CB;
 Mon, 13 Jan 2020 23:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10A47C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 13 Jan 2020 16:41:13 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: [Freedreno] [PATCH] drm/msm: Add syncobj support.
Message-ID: <20200113234113.GE26711@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 freedreno@lists.freedesktop.org, robdclark@chromium.org,
 dri-devel@lists.freedesktop.org
References: <20200113202557.110095-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113202557.110095-1-bas@basnieuwenhuizen.nl>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: robdclark@chromium.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 13, 2020 at 09:25:57PM +0100, Bas Nieuwenhuizen wrote:
> This
> 
> 1) Enables core DRM syncobj support.
> 2) Adds options to the submission ioctl to wait/signal syncobjs.
> 
> Just like the wait fence fd, this does inline waits. Using the
> scheduler would be nice but I believe it is out of scope for
> this work.
> 
> Support for timeline syncobjs is implemented and the interface
> is ready for it, but I'm not enabling it yet until there is
> some code for turnip to use it.
> 
> The reset is mostly in there because in the presence of waiting
> and signalling the same semaphores, resetting them after
> signalling can become very annoying.
> 
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
> 
> Userspace code in 
> 
> https://gitlab.freedesktop.org/mesa/mesa/merge_requests/2769
> 
>  drivers/gpu/drm/msm/msm_drv.c        |   6 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c | 241 ++++++++++++++++++++++++++-
>  include/uapi/drm/msm_drm.h           |  22 ++-
>  3 files changed, 265 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index c84f0a8b3f2c..ca36d6b21d8f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -37,9 +37,10 @@
>   * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
>   *           GEM object's debug name
>   * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
> + * - 1.6.0 - Syncobj support
>   */
>  #define MSM_VERSION_MAJOR	1
> -#define MSM_VERSION_MINOR	5
> +#define MSM_VERSION_MINOR	6
>  #define MSM_VERSION_PATCHLEVEL	0
>  
>  static const struct drm_mode_config_funcs mode_config_funcs = {
> @@ -988,7 +989,8 @@ static struct drm_driver msm_driver = {
>  	.driver_features    = DRIVER_GEM |
>  				DRIVER_RENDER |
>  				DRIVER_ATOMIC |
> -				DRIVER_MODESET,
> +				DRIVER_MODESET|

A space before the | would be preferred.

> +				DRIVER_SYNCOBJ,
>  	.open               = msm_open,
>  	.postclose           = msm_postclose,
>  	.lastclose          = drm_fb_helper_lastclose,
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index be5327af16fa..9085229f88e0 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -8,7 +8,9 @@
>  #include <linux/sync_file.h>
>  #include <linux/uaccess.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_syncobj.h>
>  
>  #include "msm_drv.h"
>  #include "msm_gpu.h"
> @@ -394,6 +396,196 @@ static void submit_cleanup(struct msm_gem_submit *submit)
>  	ww_acquire_fini(&submit->ticket);
>  }
>  
> +
> +struct msm_submit_post_dep {
> +	struct drm_syncobj *syncobj;
> +	uint64_t point;
> +	struct dma_fence_chain *chain;
> +};
> +
> +static int msm_wait_deps(struct drm_device *dev,
> +                         struct drm_file *file,
> +                         uint64_t in_syncobjs_addr,
> +                         uint32_t nr_in_syncobjs,
> +                         struct msm_ringbuffer *ring,
> +                         struct drm_syncobj ***syncobjs)
> +{
> +	struct drm_msm_gem_submit_syncobj *syncobj_descs;
> +	int ret = 0;
> +	uint32_t i, j;
> +
> +	syncobj_descs = kmalloc_array(nr_in_syncobjs, sizeof(*syncobj_descs),
> +	                              GFP_KERNEL);
> +	if (!syncobj_descs)
> +		return -ENOMEM;
> +
We would want to watch out here for fuzzers and malicious actors that try to
force an enormous memory allocation. It seems like we should be able to
iteratively read each fences in the loop and skip this memory allocation.

> +	*syncobjs = kcalloc(nr_in_syncobjs, sizeof(**syncobjs), GFP_KERNEL);
> +	if (!syncobjs) {
> +		ret = -ENOMEM;
> +		goto out_syncobjs;
> +	}

Alas no good way to skip this one. But it seems that syncobjs should only
contain descriptors with MSM_SUBMIT_SYNCOBJ_RESET set. I'm not very familiar
with how fences work so I'm not sure how common this path is. Would the same
fuzzer or malicious actor be able to double the destruction by forcing a large
allocation that doesn't even end up getting used?

> +	if (copy_from_user(syncobj_descs, u64_to_user_ptr(in_syncobjs_addr),
> +	                   nr_in_syncobjs * sizeof(*syncobj_descs))) {
> +		ret = -EFAULT;
> +		goto out_syncobjs;
> +	}
> +

> +	for (i = 0; i < nr_in_syncobjs; ++i) {
> +		struct dma_fence *fence;
> +
> +		if (syncobj_descs[i].point &&
> +		    !drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE)) {
> +			ret = -EOPNOTSUPP;

You should be able to just break; here.

> +			goto out_syncobjs;
> +		}
> +
> +		if (syncobj_descs[i].flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
> +			ret = -EINVAL;

and here.

> +			goto out_syncobjs;
> +		}
> +
> +		ret = drm_syncobj_find_fence(file, syncobj_descs[i].handle,
> +		                             syncobj_descs[i].point, 0, &fence);
> +		if (ret)
> +			goto out_syncobjs;

and here.

> +
> +		if (!dma_fence_match_context(fence, ring->fctx->context))
> +			ret = dma_fence_wait(fence, true);
> +
> +		dma_fence_put(fence);
> +		if (ret)
> +			goto out_syncobjs;

and here.

> +
> +		if (syncobj_descs[i].flags & MSM_SUBMIT_SYNCOBJ_RESET) {
> +			(*syncobjs)[i] =
> +				drm_syncobj_find(file, syncobj_descs[i].handle);

As I mentioned, I'm not sure how common this path is, but if it is relatively
rare, perhaps a krealloc() would be a more memory friendly way to get the list
you need.

> +			if (!(*syncobjs)[i]) {
> +				ret = -EINVAL;
> +				goto out_syncobjs;

You can use a break here too.
> +			}
> +		}
> +	}
> +
> +out_syncobjs:
> +	if (ret && *syncobjs) {
> +		for (j = 0; j < i; ++j) {
> +			if ((*syncobjs)[j])
> +				drm_syncobj_put((*syncobjs)[j]);

drm_synobj_put isn't NULL aware. Sad face.

> +		}
> +		kfree(*syncobjs);
> +		*syncobjs = NULL;
> +	}
> +	kfree(syncobj_descs);
> +	return ret;
> +}
> +
> +static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
> +                               uint32_t nr_syncobjs)
> +{
> +	uint32_t i;
> +
> +	for (i = 0; i < nr_syncobjs; ++i) {

if you made this for(i = 0; syncobjs && i < nr_syncobjs; i++) then you could
avoid the NULL check in the submit function.

> +		if (syncobjs[i])
> +			drm_syncobj_replace_fence(syncobjs[i], NULL);

drm_syncobj_replace_fence isn't NULL aware for syncobj either. Double sad face.

> +	}
> +}
> +
> +static int msm_parse_post_deps(struct drm_device *dev,
> +                               struct drm_file *file,
> +                               uint64_t out_syncobjs_addr,
> +                               uint32_t nr_out_syncobjs,
> +                               struct msm_submit_post_dep **post_deps)
> +{
> +	struct drm_msm_gem_submit_syncobj *syncobjs;
> +	int ret = 0;
> +	uint32_t i, j;
> +
> +	syncobjs = kmalloc_array(nr_out_syncobjs,
> +	                         sizeof(*syncobjs), GFP_KERNEL);
> +	if (!syncobjs) {
> +		return -ENOMEM;
> +	}

You don't need the brackets here.

> +	if (copy_from_user(syncobjs, u64_to_user_ptr(out_syncobjs_addr),
> +	                   nr_out_syncobjs * sizeof(*syncobjs))) {
> +		ret = -EFAULT;
> +		goto out_syncobjs;
> +	}

Same concern as above - could we end up with a silly number of nr_out_syncobjs
here?

> +	*post_deps = kmalloc_array(nr_out_syncobjs, sizeof(**post_deps),
> +	                           GFP_KERNEL);
> +	if (!*post_deps) {
> +		ret = -ENOMEM;
> +		goto out_syncobjs;
> +	}
> +
> +	for (i = 0; i < nr_out_syncobjs; ++i) {
> +		(*post_deps)[i].point = syncobjs[i].point;
> +		(*post_deps)[i].chain = NULL;
> +
> +		(*post_deps)[i].syncobj =
> +			drm_syncobj_find(file, syncobjs[i].handle);
> +		if (!(*post_deps)[i].syncobj) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		if (syncobjs[i].flags) {
> +			ret = -EINVAL;
> +			break;
> +		}

There might be some
> +
> +		if (syncobjs[i].point) {
> +			if (!drm_core_check_feature(dev,
> +			                            DRIVER_SYNCOBJ_TIMELINE)) {
> +				ret = -EOPNOTSUPP;
> +				break;
> +			}

Could you check this before doing the drm_syncobj_find() call and save a bit of
rewinding, or is it not worth it?

> +
> +			(*post_deps)[i].chain =
> +				kmalloc(sizeof(*(*post_deps)[i].chain),
> +				        GFP_KERNEL);
> +			if (!(*post_deps)[i].chain) {
> +				ret = -ENOMEM;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (ret) {
> +		for (j = 0; j < i; ++j) {
> +			kfree((*post_deps)[j].chain);
> +			drm_syncobj_put((*post_deps)[j].syncobj);

As I pointed out above, drm_syncobj_put is sadly not NULL aware, so you could
get yourself into trouble if you break out of the loop when the drm_syncobj_find
fails. You'll need to check for NULL here.

> +		}
> +
> +		kfree(*post_deps);
> +		*post_deps = NULL;
> +	}
> +
> +out_syncobjs:
> +	kfree(syncobjs);
> +	return ret;
> +}
> +
> +static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
> +                                  uint32_t count, struct dma_fence *fence)
> +{
> +	uint32_t i;
> +
> +	for (i = 0; i < count; ++i) {
> +		if (post_deps[i].chain) {
> +			drm_syncobj_add_point(post_deps[i].syncobj,
> +			                      post_deps[i].chain,
> +			                      fence, post_deps[i].point);
> +			post_deps[i].chain = NULL;
> +		} else {
> +			drm_syncobj_replace_fence(post_deps[i].syncobj,
> +			                          fence);
> +		}
> +	}
> +}
> +
>  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		struct drm_file *file)
>  {
> @@ -406,6 +598,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	struct sync_file *sync_file = NULL;
>  	struct msm_gpu_submitqueue *queue;
>  	struct msm_ringbuffer *ring;
> +	struct msm_submit_post_dep *post_deps = NULL;
> +	struct drm_syncobj **syncobjs_to_reset = NULL;
>  	int out_fence_fd = -1;
>  	struct pid *pid = get_pid(task_pid(current));
>  	unsigned i;
> @@ -460,9 +654,26 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  			return ret;
>  	}
>  
> +	if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
> +		ret = msm_wait_deps(dev, file,
> +		                    args->in_syncobjs, args->nr_in_syncobjs,
> +		                    ring, &syncobjs_to_reset);
> +		if (ret)
> +			goto out_post_unlock;
> +	}
> +
> +	if (args->flags & MSM_SUBMIT_SYNCOBJ_OUT) {
> +		ret = msm_parse_post_deps(dev, file,
> +		                          args->out_syncobjs,
> +		                          args->nr_out_syncobjs,
> +		                          &post_deps);
> +		if (ret)
> +			goto out_post_unlock;
> +	}
> +
>  	ret = mutex_lock_interruptible(&dev->struct_mutex);
>  	if (ret)
> -		return ret;
> +		goto out_post_unlock;
>  
>  	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
>  		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
> @@ -586,6 +797,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		args->fence_fd = out_fence_fd;
>  	}
>  
> +	if (syncobjs_to_reset) {

You could move this check to msm_reset_syncobjs if you wish.

> +		msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
> +	}

You don't need the brackets here.

> +
> +	if (post_deps) {

You could also push this check to msm_process_post_deps if you wished.

> +		msm_process_post_deps(post_deps, args->nr_out_syncobjs,
> +		                      submit->fence);
> +	}
> +
> +
>  out:
>  	submit_cleanup(submit);
>  	if (ret)
> @@ -594,5 +815,23 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	if (ret && (out_fence_fd >= 0))
>  		put_unused_fd(out_fence_fd);
>  	mutex_unlock(&dev->struct_mutex);
> +
> +out_post_unlock:
> +	if (post_deps) {
> +		for (i = 0; i < args->nr_out_syncobjs; ++i) {
> +			kfree(post_deps[i].chain);
> +			drm_syncobj_put(post_deps[i].syncobj);
> +		}
> +		kfree(post_deps);
> +	}
> +
> +	if (syncobjs_to_reset) {
> +		for (i = 0; i < args->nr_in_syncobjs; ++i) {
> +			if (syncobjs_to_reset[i])
> +				drm_syncobj_put(syncobjs_to_reset[i]);
> +		}
> +		kfree(syncobjs_to_reset);
> +	}
> +
>  	return ret;
>  }
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 0b85ed6a3710..ba9bdcc0016a 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -217,13 +217,28 @@ struct drm_msm_gem_submit_bo {
>  #define MSM_SUBMIT_FENCE_FD_IN   0x40000000 /* enable input fence_fd */
>  #define MSM_SUBMIT_FENCE_FD_OUT  0x20000000 /* enable output fence_fd */
>  #define MSM_SUBMIT_SUDO          0x10000000 /* run submitted cmds from RB */
> +#define MSM_SUBMIT_SYNCOBJ_IN    0x08000000 /* enable input syncobj */
> +#define MSM_SUBMIT_SYNCOBJ_OUT   0x04000000 /* enable output syncobj */
>  #define MSM_SUBMIT_FLAGS                ( \
>  		MSM_SUBMIT_NO_IMPLICIT   | \
>  		MSM_SUBMIT_FENCE_FD_IN   | \
>  		MSM_SUBMIT_FENCE_FD_OUT  | \
>  		MSM_SUBMIT_SUDO          | \
> +		MSM_SUBMIT_SYNCOBJ_IN    | \
> +		MSM_SUBMIT_SYNCOBJ_OUT   | \
>  		0)
>  
> +#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
> +#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
> +		MSM_SUBMIT_SYNCOBJ_RESET | \
> +		0)
> +
> +struct drm_msm_gem_submit_syncobj {
> +	__u32 handle;     /* in, syncobj handle. */
> +	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
> +	__u64 point;      /* in, timepoint for timeline syncobjs. */
> +};
> +
>  /* Each cmdstream submit consists of a table of buffers involved, and
>   * one or more cmdstream buffers.  This allows for conditional execution
>   * (context-restore), and IB buffers needed for per tile/bin draw cmds.
> @@ -236,7 +251,12 @@ struct drm_msm_gem_submit {
>  	__u64 bos;            /* in, ptr to array of submit_bo's */
>  	__u64 cmds;           /* in, ptr to array of submit_cmd's */
>  	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
> -	__u32 queueid;         /* in, submitqueue id */
> +	__u32 queueid;        /* in, submitqueue id */
> +	__u64 in_syncobjs;    /* in, ptr to to array of drm_msm_gem_submit_syncobj */
> +	__u64 out_syncobjs;   /* in, ptr to to array of drm_msm_gem_submit_syncobj */
> +	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
> +	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */

We might want a  sizeof field for drm_msm_gem_submit_syncobj for future
proofing.

Jordan

> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
