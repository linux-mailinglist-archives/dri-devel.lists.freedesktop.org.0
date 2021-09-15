Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C23540CFE5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 01:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263AA6EA75;
	Wed, 15 Sep 2021 23:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0527E6EA75
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 23:08:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso5985831wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 16:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BYB8HfH1WUfTrqm0ufcX85MH40us2tmPF/Od1zWrTFA=;
 b=RLmORapuIHOW9SlAbelAXrsmR/bEhWZy9AYuDeN7/QqjjHLRD0JLeFDrEDYdqqVSse
 MUjYOWrXkZnzesb8697xu7hymV/fEBbQc3XoUpMlbol7tviQd2APIPCVdrkR+BmdU1k3
 zx5SVJauce71/tL2OHEGlzx9Sl2KL8AypjQVsnrrhGYe0/wLt+gIVNaOTeXTdyOuNK07
 grbQUQzKU73ojZNSW5NScBPoEtrJRFWjLvyeU132hIcmzJima6uVvOy1QkEnSlzF2DUe
 /IYu+1ny+x+/usck/+9xsM3L0w+X9kQQNeKxY90xdlKvYx8/8U2Ykafv7NC3wyVdmTy6
 TUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BYB8HfH1WUfTrqm0ufcX85MH40us2tmPF/Od1zWrTFA=;
 b=mg7Z4CbTWwp+cCmL/2C8lYP5NfzhUP+mJuSM85jkjYPV08bTXOLiWiyn/FVLUcRLUl
 1E9TX1c/rGO2NtfbGwdWZMOdE730PZyRlgiWI7T/s6KLKhc84CIpWdVtYoG9PyCxsTUu
 rCMv08x6riQieMntXJ6GEk7Fp7f+LeHftFp7x/gj4hManL42S8J7q3mP/v+eIrd9nqmd
 m6XoZCjSApHdMArMdiMEarhlUMQH8l40UrqyuSTrg3ll+UTpeEw1WRn7KC4hsNdKPqcr
 1o/5LzCJYFnhcGAgsOWB+GZRvBePktFJfvqOzVmVW3oFS6SF5zG5oxyJilTNJhHU6LQV
 f+eQ==
X-Gm-Message-State: AOAM530ya7TjhoDbeb09YCh4nfMVaZ1xHvggNG0A5W1J1xARuGiK1PXs
 7iABBXg9Yphva6GTK6OiMBM=
X-Google-Smtp-Source: ABdhPJzb/B8eJKXSYBkh/+4mFZoAYuoEl8U/Bc83lwiYk14bCMzQC83r0HHAkThEIi1CJ+FowjCA/g==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr7081195wmi.10.1631747312389;
 Wed, 15 Sep 2021 16:08:32 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id j14sm1369985wrp.21.2021.09.15.16.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 16:08:31 -0700 (PDT)
Date: Thu, 16 Sep 2021 00:08:25 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 2/2] drm/vkms: Add support for virtual hardware mode
Message-ID: <20210915230801.e2q3rtdkottoh7b5@smtp.gmail.com>
References: <cover.1630512292.git.sylphrenadin@gmail.com>
 <9ba2c2aa6a607b09de5a0f4615550d3ccdbec0fd.1630512292.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ba2c2aa6a607b09de5a0f4615550d3ccdbec0fd.1630512292.git.sylphrenadin@gmail.com>
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

On 09/01, Sumera Priyadarsini wrote:
> Add a virtual hardware or vblank-less mode as a module
> to enable VKMS to emulate virtual hardware drivers. This means
> no vertical blanking events occur and pageflips are completed
> arbitrarily and when required for updating the frame.
> 
> Add a new drm_crtc_funcs struct, vkms_vblankless_crtc_funcs and a
> drm_crtc_helper_funcs struct, vkms_vblankless_crtc_helper_funcs()
> which hold the atomic helpers for virtual hardware mode.
> The existing vkms_crtc_funcs struct and vkms_crtc_helper_funcs
> struct hold atomic helpers for the default vblank mode.
> This makes the code flow clearer and testing
> virtual hardware mode easier.
> 
> Add a function vkms_crtc_composer() which calls the helper function,
> vkms_composer_common() for plane composition in vblank-less mode.
> vkms_crtc_composer() is directly called in the atomic hook in
> vkms_crtc_atomic_begin().
> 
> However, some crc captures still use vblanks which causes the crc-based
> igt tests to crash. So, no CRC functions are called in vblankless mode
> for now and will be implemented in a later patch.

Hi Sumera,

this approach lgtm.

something on the writeback engine needs to be adjusted, as I checked a leak
when unloading the driver (after a kms_writeback testcase).

One fix is pointed below. As far as I checked to the other issue, a wb
job is prepared and enqueued, but never cleaned up. Not sure if wb ops
have any dependency on vblanks (and we should also skip) or something
wrong when getting crtc state during the composer work (wb_pending
condition is not working as expected when in the vhw mode).

The error log is here: https://paste.debian.net/hidden/54bf7945/

Daniel, do you have any idea from the top of your head?

> 
> This patchset has been tested with the igt tests- kms_writeback, kms_atomic
> , kms_lease, kms_flip, kms_pipe_get_crc and preserves results except for
> subtests related to crc reads and vertical blanking, in which case,
> tests are skipped.
> 
> The patch is based on Rodrigo Siqueira's
> patch(https://patchwork.freedesktop.org/patch/316851/?series=48469&rev=3)
> and the ensuing review.
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
> Changes in V6:
> - Skip CRC functions in vblankless mode
> - Refactor helper function names(Melissa)
> Changes in V5:
> - Move vkms_crtc_composer() to this patch(Melissa)
> - Add more clarification for "vblank-less" mode(Pekka)
> - Replace kzalloc() with kvmalloc() in compose_active_planes()
> to fix memory allocation error for output frame
> - Fix checkpatch warnings (Melissa)
> Changes in V3:
> - Refactor patchset(Melissa)
> Changes in V2:
> - Add atomic helper functions in a separate struct for virtual hardware
> mode (Daniel)
> - Remove spinlock across 'vkms_output->lock' in vkms_crtc.c(Daniel)
> - Add vkms_composer_common() (Daniel)
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  | 21 +++++++++++--
>  drivers/gpu/drm/vkms/vkms_crtc.c      | 43 +++++++++++++++++++++++++--
>  drivers/gpu/drm/vkms/vkms_drv.c       | 16 +++++++---
>  drivers/gpu/drm/vkms/vkms_drv.h       |  2 ++
>  drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
>  5 files changed, 74 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index bca746fb5b53..a009589b2c3a 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -176,11 +176,12 @@ static int compose_active_planes(void **vaddr_out,
>  {
>  	struct drm_framebuffer *fb = &primary_composer->fb;
>  	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
> +
>  	const void *vaddr;
>  	int i;
>  
>  	if (!*vaddr_out) {
> -		*vaddr_out = kzalloc(gem_obj->size, GFP_KERNEL);
> +		*vaddr_out = kvmalloc(gem_obj->size, GFP_KERNEL);
>  		if (!*vaddr_out) {
>  			DRM_ERROR("Cannot allocate memory for output frame.");
>  			return -ENOMEM;
> @@ -229,7 +230,7 @@ int vkms_composer_common(struct vkms_crtc_state *crtc_state,
>  
>  	if (ret) {
>  		if ((ret == -EINVAL || ret == -ENOMEM) && !wb_pending)
> -			kfree(vaddr_out);
> +			kvfree(vaddr_out);
>  		return ret;
>  	}
>  
> @@ -241,7 +242,7 @@ int vkms_composer_common(struct vkms_crtc_state *crtc_state,
>  		crtc_state->wb_pending = false;
>  		spin_unlock_irq(&out->composer_lock);
>  	} else {
> -		kfree(vaddr_out);
> +		kvfree(vaddr_out);
>  	}
>  
>  	return 0;
> @@ -296,6 +297,20 @@ void vkms_composer_worker(struct work_struct *work)
>  		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
>  }
>  
> +void vkms_crtc_composer(struct vkms_crtc_state *crtc_state)
> +{
> +	struct drm_crtc *crtc = crtc_state->base.crtc;
> +	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +	u32 crc32 = 0;
> +	int ret;
> +
> +	ret = vkms_composer_common(crtc_state, out, crtc_state->wb_pending, &crc32);
> +	if (ret == -EINVAL)
> +		return;
> +
> +	drm_crtc_add_crc_entry(crtc, true, 0, &crc32);
> +}
> +
>  static const char * const pipe_crc_sources[] = {"auto"};
>  
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 57bbd32e9beb..4a933553e0e4 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -174,6 +174,15 @@ static const struct drm_crtc_funcs vkms_crtc_funcs = {
>  	.verify_crc_source	= vkms_verify_crc_source,
>  };
>  
> +static const struct drm_crtc_funcs vkms_vblankless_crtc_funcs = {
> +	.set_config             = drm_atomic_helper_set_config,
> +	.destroy                = drm_crtc_cleanup,
> +	.page_flip              = drm_atomic_helper_page_flip,
> +	.reset                  = vkms_atomic_crtc_reset,
> +	.atomic_duplicate_state = vkms_atomic_crtc_duplicate_state,
> +	.atomic_destroy_state   = vkms_atomic_crtc_destroy_state,
> +};
> +
>  static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
>  				  struct drm_atomic_state *state)
>  {
> @@ -268,6 +277,20 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>  	spin_unlock_irq(&vkms_output->lock);
>  }
>  
> +/*
> + * Crtc functions for virtual hardware/vblankless mode
> + */
> +static void vkms_vblankless_crtc_atomic_flush(struct drm_crtc *crtc,
> +					      struct drm_atomic_state *state)
> +{
> +	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(crtc->state);
> +
> +	vkms_crtc_composer(vkms_state);
> +
> +	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
> +}
> +
>  static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>  	.atomic_check	= vkms_crtc_atomic_check,
>  	.atomic_begin	= vkms_crtc_atomic_begin,
> @@ -276,20 +299,34 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>  	.atomic_disable	= vkms_crtc_atomic_disable,
>  };
>  
> +static const struct drm_crtc_helper_funcs vkms_vblankless_crtc_helper_funcs = {
> +	.atomic_check	= vkms_crtc_atomic_check,
> +	.atomic_flush	= vkms_vblankless_crtc_atomic_flush,
> +};
> +
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		   struct drm_plane *primary, struct drm_plane *cursor)
>  {
>  	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>  	int ret;
>  
> -	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> -					&vkms_crtc_funcs, NULL);
> +	if (vkmsdev->config->virtual_hw)
> +		ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> +						&vkms_vblankless_crtc_funcs, NULL);
> +	else
> +		ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> +						&vkms_crtc_funcs, NULL);
> +
>  	if (ret) {
>  		DRM_ERROR("Failed to init CRTC\n");
>  		return ret;
>  	}
>  
> -	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> +	if (vkmsdev->config->virtual_hw)
> +		drm_crtc_helper_add(crtc, &vkms_vblankless_crtc_helper_funcs);
> +	else
> +		drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
>  
>  	spin_lock_init(&vkms_out->lock);
>  	spin_lock_init(&vkms_out->composer_lock);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 0ffe5f0e33f7..ee78f5eef653 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -51,6 +51,10 @@ static bool enable_overlay;
>  module_param_named(enable_overlay, enable_overlay, bool, 0444);
>  MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
>  
> +static bool enable_virtual_hw;
> +module_param_named(enable_virtual_hw, enable_virtual_hw, bool, 0444);
> +MODULE_PARM_DESC(enable_virtual_hw, "Enable/Disable virtual hardware mode(vblank-less mode)");
> +
>  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>  
>  static void vkms_release(struct drm_device *dev)
> @@ -98,6 +102,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
>  	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
>  	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
> +	seq_printf(m, "virtual_hw=%d\n", vkmsdev->config->virtual_hw);
>  
>  	return 0;
>  }
> @@ -191,10 +196,12 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
>  
> -	ret = drm_vblank_init(&vkms_device->drm, 1);
> -	if (ret) {
> -		DRM_ERROR("Failed to vblank\n");
> -		goto out_devres;
> +	if (!vkms_device->config->virtual_hw) {
> +		ret = drm_vblank_init(&vkms_device->drm, 1);
> +		if (ret) {
> +			DRM_ERROR("Failed to vblank\n");
> +			goto out_devres;
> +		}
>  	}
>  
>  	ret = vkms_modeset_init(vkms_device);
> @@ -229,6 +236,7 @@ static int __init vkms_init(void)
>  	config->cursor = enable_cursor;
>  	config->writeback = enable_writeback;
>  	config->overlay = enable_overlay;
> +	config->virtual_hw = enable_virtual_hw;
>  
>  	return vkms_create(config);
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 6f5f63591c20..d64554f21838 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -97,6 +97,7 @@ struct vkms_config {
>  	bool writeback;
>  	bool cursor;
>  	bool overlay;
> +	bool virtual_hw;
>  	/* only set when instantiated */
>  	struct vkms_device *dev;
>  };
> @@ -141,6 +142,7 @@ int vkms_composer_common(struct vkms_crtc_state *crtc_state, struct vkms_output
>  			 bool wb_pending, uint32_t *crcs);
>  void vkms_composer_worker(struct work_struct *work);
>  void vkms_set_composer(struct vkms_output *out, bool enabled);
> +void vkms_crtc_composer(struct vkms_crtc_state *crtc_state);
>  
>  /* Writeback */
>  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 8694227f555f..6082cacbca1e 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -120,7 +120,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  	if (!conn_state)
>  		return;
>  
> -	vkms_set_composer(&vkmsdev->output, true);
> +	if (!vkmsdev->config->virtual_hw)
> +		vkms_set_composer(&vkmsdev->output, true);

For the first issue that I mentioned, you should add this same condition
around set_composer in vkms_wb_cleanup_job. Probably because
wb_cleanup_job is not called (the other issue), you could not see any
error.

Thanks,

Melissa
>  
>  	spin_lock_irq(&output->composer_lock);
>  	crtc_state->active_writeback = conn_state->writeback_job->priv;
> -- 
> 2.31.1
> 
