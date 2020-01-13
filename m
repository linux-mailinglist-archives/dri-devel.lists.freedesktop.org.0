Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72430139811
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 18:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D8C6E12A;
	Mon, 13 Jan 2020 17:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3FC6E120
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 17:51:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1578937918; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ombH+SYwC37lMpgEuedoKs2/ILJEt2p/GnXt9vDnvJA=;
 b=cYapeeOMD5AUMgk+OQS6+iB90EkHmcE2O6Q+QfAUuzeYI+kxMHTf4mTONcx1o+TAeHl0pTFx
 RjrReH7FbwpBr4p3tVdk1N9O8O06Km971wG6UcQijLGzNPzNXQsefJ0+iiOkukjlywYyn+k5
 k0XClvBedCFOFKHSwYR44AkeVSo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1cae39.7f2d3ae86378-smtp-out-n01;
 Mon, 13 Jan 2020 17:51:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EE7ECC4479C; Mon, 13 Jan 2020 17:51:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E3E8AC433CB;
 Mon, 13 Jan 2020 17:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3E8AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 13 Jan 2020 10:51:49 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Brian Ho <brian@brkho.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
Message-ID: <20200113175148.GC26711@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Brian Ho <brian@brkho.com>,
 freedreno@lists.freedesktop.org, robdclark@chromium.org,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 hoegsberg@chromium.org, Sean Paul <sean@poorly.run>
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-3-brian@brkho.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113153605.52350-3-brian@brkho.com>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 13, 2020 at 10:36:05AM -0500, Brian Ho wrote:
> Implements an ioctl to wait until a value at a given iova is greater
> than or equal to a supplied value.
> 
> This will initially be used by turnip (open-source Vulkan driver for
> QC in mesa) for occlusion queries where the userspace driver can
> block on a query becoming available before continuing via
> vkGetQueryPoolResults.
> 
> Signed-off-by: Brian Ho <brian@brkho.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++++++--
>  include/uapi/drm/msm_drm.h    | 13 ++++++++
>  2 files changed, 74 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index c84f0a8b3f2c..dcc46874a5a2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -36,10 +36,11 @@
>   *           MSM_GEM_INFO ioctl.
>   * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
>   *           GEM object's debug name
> - * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
> + * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl
> + * - 1.6.0 - Add WAIT_IOVA ioctl
>   */
>  #define MSM_VERSION_MAJOR	1
> -#define MSM_VERSION_MINOR	5
> +#define MSM_VERSION_MINOR	6
>  #define MSM_VERSION_PATCHLEVEL	0
>  
>  static const struct drm_mode_config_funcs mode_config_funcs = {
> @@ -952,6 +953,63 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
>  	return msm_submitqueue_remove(file->driver_priv, id);
>  }
>  
> +static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,
> +		struct drm_file *file)
> +{
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct drm_gem_object *obj;
> +	struct drm_msm_wait_iova *args = data;
> +	ktime_t timeout = to_ktime(args->timeout);
> +	unsigned long remaining_jiffies = timeout_to_jiffies(&timeout);
> +	struct msm_gpu *gpu = priv->gpu;
> +	void *base_vaddr;
> +	uint64_t *vaddr;
> +	int ret;
> +
> +	if (args->pad)
> +		return -EINVAL;
> +
> +	if (!gpu)
> +		return 0;

If the GPU isn't up, it should be an error since this macro is specifically
designed for just the GPU (though, I suppose the display *COULD* use it to watch
a memory mapped register or something).

> +
> +	obj = drm_gem_object_lookup(file, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	base_vaddr = msm_gem_get_vaddr(obj);
> +	if (IS_ERR(base_vaddr)) {
> +		ret = PTR_ERR(base_vaddr);
> +		goto err_put_gem_object;
> +	}
> +	if (args->offset + sizeof(*vaddr) > obj->size) {

There is a chance to trigger a u64 overflow here resulting in an arbitrary (ish)
vaddr two lines below.


> +		ret = -EINVAL;
> +		goto err_put_vaddr;
> +	}

You can check this before getting the vaddr which would save you a clean up
step.

> +
> +	vaddr = base_vaddr + args->offset;
> +
> +	/* Assumes WC mapping */
> +	ret = wait_event_interruptible_timeout(
> +			gpu->event, *vaddr >= args->value, remaining_jiffies);

I feel like a barrier might be needed before checking *vaddr just in case you
get the interrupt and wake up the queue before the write posts from the
hardware.

> +

> +	if (ret == 0) {
> +		ret = -ETIMEDOUT;
> +		goto err_put_vaddr;
> +	} else if (ret == -ERESTARTSYS) {
> +		goto err_put_vaddr;
> +	}

You don't need either goto here because both paths execute the following cleanup
steps. I'm also not sure you need to worry about explicitly checking the
ERESTARTSYS value, I think that this would be sufficient:

 if (ret == 0)
     ret = -ETIMEDOUT;
 else if (ret > 0)
     ret = 0;

> +

Put your err_put_vaddr: label here, but looking up, if you move the bounds check
before the msm_gem_get_vaddr, I don't think you need a label.

> +	msm_gem_put_vaddr(obj);

Put the err_put_gem_object: label here.

> +	drm_gem_object_put_unlocked(obj);
> +	return 0;

return ret;

> +
> +err_put_vaddr:
> +	msm_gem_put_vaddr(obj);
> +err_put_gem_object:
> +	drm_gem_object_put_unlocked(obj);
> +	return ret;
> +}

And then these guys aren't needed.

> +
>  static const struct drm_ioctl_desc msm_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
> @@ -964,6 +1022,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova, DRM_RENDER_ALLOW),
>  };
>  
>  static const struct vm_operations_struct vm_ops = {
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 0b85ed6a3710..8477f28a4ee1 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -298,6 +298,17 @@ struct drm_msm_submitqueue_query {
>  	__u32 pad;
>  };
>  
> +/* This ioctl blocks until the u64 value at bo + offset is greater than or
> + * equal to the reference value.
> + */
> +struct drm_msm_wait_iova {
> +	__u32 handle;          /* in, GEM handle */
> +	__u32 pad;
> +	struct drm_msm_timespec timeout;   /* in */
> +	__u64 offset;          /* offset into bo */
> +	__u64 value;           /* reference value */

Any specific reason why we wouldn't just put the offset and value first and save
ourselves the padding?

> +};
> +
>  #define DRM_MSM_GET_PARAM              0x00
>  /* placeholder:
>  #define DRM_MSM_SET_PARAM              0x01
> @@ -315,6 +326,7 @@ struct drm_msm_submitqueue_query {
>  #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
>  #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
>  #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
> +#define DRM_MSM_WAIT_IOVA      0x0D
>  
>  #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
>  #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
> @@ -327,6 +339,7 @@ struct drm_msm_submitqueue_query {
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
> +#define DRM_IOCTL_MSM_WAIT_IOVA        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_WAIT_IOVA, struct drm_msm_wait_iova)
>  
>  #if defined(__cplusplus)
>  }
> -- 
> 2.25.0.rc1.283.g88dfdc4193-goog
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
