Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E035280B57
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 01:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ACB8921E;
	Thu,  1 Oct 2020 23:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A2C89178
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 23:29:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601594953; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=RoYeAXC95qI8GRNbmM3wnw4s4VTlEJU6bEldDzPYqsU=;
 b=nJibzaXNvUJsgTETSI/SpisQPLt52u978mb3No6ThmnIMupf4W/vGcAH9wcSd+OeMFXf+2UC
 G9ea/CVN4s/FOefn/SF2FSQmLk7u0btXf+BNqtgrmDczlXOLLq+DJ2w8r16Y0s9CgBET6zdW
 E4QczqUUdPNZTtm8+LF2PY9bQq8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f766648fa28dc78f1c02f44 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Oct 2020 23:29:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4C8B3C433CA; Thu,  1 Oct 2020 23:29:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3382CC433CA;
 Thu,  1 Oct 2020 23:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3382CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 1 Oct 2020 17:29:07 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
Message-ID: <20201001232907.GG29832@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001002709.21361-3-jonathan@marek.ca>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 08:27:05PM -0400, Jonathan Marek wrote:
> This makes it possible to use the non-coherent cached MSM_BO_CACHED mode,
> which otherwise doesn't provide any method for cleaning/invalidating the
> cache to sync with the device.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.h |  2 ++
>  drivers/gpu/drm/msm/msm_gem.c | 15 +++++++++++++++
>  include/uapi/drm/msm_drm.h    | 20 ++++++++++++++++++++
>  4 files changed, 58 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9716210495fc..305db1db1064 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -964,6 +964,26 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
>  	return msm_submitqueue_remove(file->driver_priv, id);
>  }
>  
> +static int msm_ioctl_gem_sync_cache(struct drm_device *dev, void *data,
> +		struct drm_file *file)
> +{
> +	struct drm_msm_gem_sync_cache *args = data;
> +	struct drm_gem_object *obj;
> +
> +	if (args->flags & ~MSM_GEM_SYNC_CACHE_FLAGS)
> +		return -EINVAL;
> +
> +	obj = drm_gem_object_lookup(file, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	msm_gem_sync_cache(obj, args->flags, args->offset, args->end);
> +
> +	drm_gem_object_put(obj);
> +
> +	return 0;
> +}
> +
>  static const struct drm_ioctl_desc msm_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
> @@ -976,6 +996,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(MSM_GEM_SYNC_CACHE,    msm_ioctl_gem_sync_cache,    DRM_RENDER_ALLOW),
>  };
>  
>  static const struct vm_operations_struct vm_ops = {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 6384844b1696..5e932dae453f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -314,6 +314,8 @@ void msm_gem_move_to_active(struct drm_gem_object *obj,
>  void msm_gem_move_to_inactive(struct drm_gem_object *obj);
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
>  int msm_gem_cpu_fini(struct drm_gem_object *obj);
> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> +		size_t range_start, size_t range_end);
>  void msm_gem_free_object(struct drm_gem_object *obj);
>  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>  		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index ad9a627493ae..93da88b3fc50 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -8,6 +8,7 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/dma-buf.h>
>  #include <linux/pfn_t.h>
> +#include <linux/dma-noncoherent.h>
>  
>  #include <drm/drm_prime.h>
>  
> @@ -808,6 +809,20 @@ int msm_gem_cpu_fini(struct drm_gem_object *obj)
>  	return 0;
>  }
>  
> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> +		size_t range_start, size_t range_end)
> +{
> +	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +
> +	/* TODO: sync only the required range, and don't invalidate on clean */
> +
> +	if (flags & MSM_GEM_SYNC_CACHE_CLEAN)

Curious why you would rename these - I feel like the to_device / to_cpu model is
pretty well baked into our thought process. I know from personal experience that
I have to stop and think to remember which direction is which.

Jordan

> +		sync_for_device(msm_obj);
> +
> +	if (flags & MSM_GEM_SYNC_CACHE_INVALIDATE)
> +		sync_for_cpu(msm_obj);
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static void describe_fence(struct dma_fence *fence, const char *type,
>  		struct seq_file *m)
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 474497e8743a..1dfafa71fc94 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -319,6 +319,24 @@ struct drm_msm_submitqueue_query {
>  	__u32 pad;
>  };
>  
> +/*
> + * Host cache maintenance (relevant for MSM_BO_CACHED)
> + * driver may both clean/invalidate (flush) for clean
> + */
> +
> +#define MSM_GEM_SYNC_CACHE_CLEAN	0x1
> +#define MSM_GEM_SYNC_CACHE_INVALIDATE	0x2
> +
> +#define MSM_GEM_SYNC_CACHE_FLAGS	(MSM_GEM_SYNC_CACHE_CLEAN | \
> +					 MSM_GEM_SYNC_CACHE_INVALIDATE)
> +
> +struct drm_msm_gem_sync_cache {
> +	__u32 handle;
> +	__u32 flags;
> +	__u64 offset;
> +	__u64 end;      /* offset + size */
> +};
> +
>  #define DRM_MSM_GET_PARAM              0x00
>  /* placeholder:
>  #define DRM_MSM_SET_PARAM              0x01
> @@ -336,6 +354,7 @@ struct drm_msm_submitqueue_query {
>  #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
>  #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
>  #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
> +#define DRM_MSM_GEM_SYNC_CACHE         0x0D
>  
>  #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
>  #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
> @@ -348,6 +367,7 @@ struct drm_msm_submitqueue_query {
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
> +#define DRM_IOCTL_MSM_GEM_SYNC_CACHE     DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_GEM_SYNC_CACHE, struct drm_msm_gem_sync_cache)
>  
>  #if defined(__cplusplus)
>  }
> -- 
> 2.26.1
> 
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
