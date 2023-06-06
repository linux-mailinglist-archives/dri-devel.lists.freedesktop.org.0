Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6444B724697
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819DA10E111;
	Tue,  6 Jun 2023 14:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182ED10E111
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:44:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp
 [126.253.223.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 729A7AB;
 Tue,  6 Jun 2023 16:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686062670;
 bh=zxMYLVSGVXF7vKQ7nEnA+ce0pCgp+dwGdjrJKJaK0P4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AzUkV3+mwikKX2D1MDbQmziSFZ5y8l2njLSTvHh54kwwiTxe89aP2ZWmJcuDKdTrA
 /xxJBMl9pQqLlaTia0I/c5ZIhEPJr5PvhNB/zbpW+h7WMtw+L37V5V3nkhK+nSyHKA
 h84uQ1o/jKSmk9kr+OGsv/4yTd66tnjDAO6p9QPw=
Date: Tue, 6 Jun 2023 17:44:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v9 5/8] drm: Remove usage of deprecated DRM_ERROR
Message-ID: <20230606144452.GE5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <247297c1171bc0ddbde0e90d33961fd5636caf0f.1686047727.git.code@siddh.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <247297c1171bc0ddbde0e90d33961fd5636caf0f.1686047727.git.code@siddh.me>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Siddh,

Thank you for the patch.

On Tue, Jun 06, 2023 at 04:15:19PM +0530, Siddh Raman Pant wrote:
> drm_print.h says DRM_ERROR is deprecated in favor of drm_err().
> 
> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
>  drivers/gpu/drm/drm_bridge.c         |  8 ++++----
>  drivers/gpu/drm/drm_bufs.c           |  8 ++++----
>  drivers/gpu/drm/drm_client_modeset.c |  4 ++--
>  drivers/gpu/drm/drm_context.c        |  4 ++--
>  drivers/gpu/drm/drm_crtc_helper.c    |  8 ++++----
>  drivers/gpu/drm/drm_debugfs_crc.c    |  3 ++-
>  drivers/gpu/drm/drm_drv.c            | 16 ++++++++--------
>  drivers/gpu/drm/drm_flip_work.c      |  2 +-
>  drivers/gpu/drm/drm_framebuffer.c    |  3 ++-
>  drivers/gpu/drm/drm_gem.c            |  2 +-
>  drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
>  drivers/gpu/drm/drm_hashtab.c        |  4 ++--
>  drivers/gpu/drm/drm_lock.c           | 16 ++++++++--------
>  drivers/gpu/drm/drm_mipi_dbi.c       |  2 +-
>  drivers/gpu/drm/drm_mm.c             |  8 ++++----
>  drivers/gpu/drm/drm_mode_config.c    |  2 +-
>  drivers/gpu/drm/drm_modes.c          | 26 +++++++++++++-------------
>  drivers/gpu/drm/drm_modeset_helper.c |  2 +-
>  drivers/gpu/drm/drm_plane.c          |  2 +-
>  drivers/gpu/drm/drm_scatter.c        |  9 +++++----
>  drivers/gpu/drm/drm_vm.c             |  2 +-
>  21 files changed, 68 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c3d69af02e79..3d27f08db74d 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -351,11 +351,11 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  	list_del(&bridge->chain_node);
>  
>  #ifdef CONFIG_OF
> -	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> -		  bridge->of_node, encoder->name, ret);
> +	drm_err(encoder->dev, "failed to attach bridge %pOF to encoder %s: %d\n",
> +		bridge->of_node, encoder->name, ret);
>  #else
> -	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> -		  encoder->name, ret);
> +	drm_err(encoder->dev, "failed to attach bridge to encoder %s: %d\n",
> +		encoder->name, ret);
>  #endif
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index 86700560fea2..aa66fe16ea6e 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -1470,15 +1470,15 @@ int drm_legacy_freebufs(struct drm_device *dev, void *data,
>  		if (copy_from_user(&idx, &request->list[i], sizeof(idx)))
>  			return -EFAULT;
>  		if (idx < 0 || idx >= dma->buf_count) {
> -			DRM_ERROR("Index %d (of %d max)\n",
> -				  idx, dma->buf_count - 1);
> +			drm_err(dev, "Index %d (of %d max)\n",
> +				idx, dma->buf_count - 1);
>  			return -EINVAL;
>  		}
>  		idx = array_index_nospec(idx, dma->buf_count);
>  		buf = dma->buflist[idx];
>  		if (buf->file_priv != file_priv) {
> -			DRM_ERROR("Process %d freeing buffer not owned\n",
> -				  task_pid_nr(current));
> +			drm_err(dev, "Process %d freeing buffer not owned\n",
> +				task_pid_nr(current));
>  			return -EINVAL;
>  		}
>  		drm_legacy_free_buffer(dev, buf);
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index ae19734974b5..e2403b8c6347 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -808,7 +808,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  	offsets = kcalloc(connector_count, sizeof(*offsets), GFP_KERNEL);
>  	enabled = kcalloc(connector_count, sizeof(bool), GFP_KERNEL);
>  	if (!crtcs || !modes || !enabled || !offsets) {
> -		DRM_ERROR("Memory allocation failed\n");
> +		drm_err(client->dev, "Memory allocation failed\n");

We could probably drop this message as memory allocation functions are
already vocal on failure, but that's a separate fix.

>  		ret = -ENOMEM;
>  		goto out;
>  	}
> @@ -832,7 +832,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  					      offsets, enabled, width, height) &&
>  		    !drm_client_target_preferred(connectors, connector_count, modes,
>  						 offsets, enabled, width, height))
> -			DRM_ERROR("Unable to find initial modes\n");
> +			drm_err(client->dev, "Unable to find initial modes\n");
>  
>  		DRM_DEBUG_KMS("picking CRTCs for %dx%d config\n",
>  			      width, height);
> diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
> index a0fc779e5e1e..bf1fc8bb97de 100644
> --- a/drivers/gpu/drm/drm_context.c
> +++ b/drivers/gpu/drm/drm_context.c
> @@ -270,7 +270,7 @@ int drm_legacy_setsareactx(struct drm_device *dev, void *data,
>  static int drm_context_switch(struct drm_device * dev, int old, int new)
>  {
>  	if (test_and_set_bit(0, &dev->context_flag)) {
> -		DRM_ERROR("Reentering -- FIXME\n");
> +		drm_err(dev, "Reentering -- FIXME\n");
>  		return -EBUSY;
>  	}
>  
> @@ -301,7 +301,7 @@ static int drm_context_switch_complete(struct drm_device *dev,
>  	dev->last_context = new;	/* PRE/POST: This is the _only_ writer. */
>  
>  	if (!_DRM_LOCK_IS_HELD(file_priv->master->lock.hw_lock->lock)) {
> -		DRM_ERROR("Lock isn't held after context switch\n");
> +		drm_err(dev, "Lock isn't held after context switch\n");
>  	}
>  
>  	/* If a context switch is ever initiated
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index a209659a996c..b74b4301a471 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -768,8 +768,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  			if (!drm_crtc_helper_set_mode(set->crtc, set->mode,
>  						      set->x, set->y,
>  						      save_set.fb)) {
> -				DRM_ERROR("failed to set mode on [CRTC:%d:%s]\n",
> -					  set->crtc->base.id, set->crtc->name);
> +				drm_err(dev, "failed to set mode on [CRTC:%d:%s]\n",
> +					set->crtc->base.id, set->crtc->name);
>  				set->crtc->primary->fb = save_set.fb;
>  				ret = -EINVAL;
>  				goto fail;
> @@ -826,7 +826,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  	if (mode_changed &&
>  	    !drm_crtc_helper_set_mode(save_set.crtc, save_set.mode, save_set.x,
>  				      save_set.y, save_set.fb))
> -		DRM_ERROR("failed to restore config after modeset failure\n");
> +		drm_err(dev, "failed to restore config after modeset failure\n");
>  
>  	kfree(save_connector_encoders);
>  	kfree(save_encoder_crtcs);
> @@ -996,7 +996,7 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
>  
>  		/* Restoring the old config should never fail! */
>  		if (ret == false)
> -			DRM_ERROR("failed to set mode on crtc %p\n", crtc);
> +			drm_err(dev, "failed to set mode on crtc %p\n", crtc);
>  
>  		/* Turn off outputs that were already powered off */
>  		if (drm_helper_choose_crtc_dpms(crtc)) {
> diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
> index bbc3bc4ba844..a59ef3f0e4a1 100644
> --- a/drivers/gpu/drm/drm_debugfs_crc.c
> +++ b/drivers/gpu/drm/drm_debugfs_crc.c
> @@ -416,7 +416,8 @@ int drm_crtc_add_crc_entry(struct drm_crtc *crtc, bool has_frame,
>  		spin_unlock_irqrestore(&crc->lock, flags);
>  
>  		if (!was_overflow)
> -			DRM_ERROR("Overflow of CRC buffer, userspace reads too slow.\n");
> +			drm_err(crtc->dev,
> +				"Overflow of CRC buffer, userspace reads too slow.\n");
>  
>  		return -ENOBUFS;
>  	}
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 02eaa4c9344d..04246afc934f 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -177,7 +177,7 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
>  	} else {
>  		ret = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
>  		if (ret) {
> -			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
> +			drm_err(dev, "DRM: Failed to initialize /sys/kernel/debug/dri.\n");
>  			goto err_debugfs;
>  		}
>  	}
> @@ -425,7 +425,7 @@ void drm_put_dev(struct drm_device *dev)
>  	DRM_DEBUG("\n");
>  
>  	if (!dev) {
> -		DRM_ERROR("cleanup called no dev\n");
> +		drm_err(NULL, "cleanup called no dev\n");
>  		return;
>  	}
>  
> @@ -540,7 +540,7 @@ static struct inode *drm_fs_inode_new(void)
>  
>  	r = simple_pin_fs(&drm_fs_type, &drm_fs_mnt, &drm_fs_cnt);
>  	if (r < 0) {
> -		DRM_ERROR("Cannot mount pseudo fs: %d\n", r);
> +		drm_err(NULL, "Cannot mount pseudo fs: %d\n", r);
>  		return ERR_PTR(r);
>  	}
>  
> @@ -610,7 +610,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	int ret;
>  
>  	if (!drm_core_init_complete) {
> -		DRM_ERROR("DRM core is not initialized\n");
> +		drm_err(NULL, "DRM core is not initialized\n");

Could this use dev ?

>  		return -ENODEV;
>  	}
>  
> @@ -630,7 +630,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
>  				(drm_core_check_feature(dev, DRIVER_RENDER) ||
>  				drm_core_check_feature(dev, DRIVER_MODESET))) {
> -		DRM_ERROR("DRM driver can't be both a compute acceleration and graphics driver\n");
> +		drm_err(dev, "DRM driver can't be both a compute acceleration and graphics driver\n");
>  		return -EINVAL;
>  	}
>  
> @@ -655,7 +655,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	inode = drm_fs_inode_new();
>  	if (IS_ERR(inode)) {
>  		ret = PTR_ERR(inode);
> -		DRM_ERROR("Cannot allocate anonymous inode: %d\n", ret);
> +		drm_err(dev, "Cannot allocate anonymous inode: %d\n", ret);
>  		goto err;
>  	}
>  
> @@ -686,7 +686,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	if (drm_core_check_feature(dev, DRIVER_GEM)) {
>  		ret = drm_gem_init(dev);
>  		if (ret) {
> -			DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n");
> +			drm_err(dev, "Cannot initialize graphics execution manager (GEM)\n");
>  			goto err;
>  		}
>  	}
> @@ -1081,7 +1081,7 @@ static int __init drm_core_init(void)
>  
>  	ret = drm_sysfs_init();
>  	if (ret < 0) {
> -		DRM_ERROR("Cannot create DRM class: %d\n", ret);
> +		drm_err(NULL, "Cannot create DRM class: %d\n", ret);
>  		goto error;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_work.c
> index 060b753881a2..8cbf325a0414 100644
> --- a/drivers/gpu/drm/drm_flip_work.c
> +++ b/drivers/gpu/drm/drm_flip_work.c
> @@ -82,7 +82,7 @@ void drm_flip_work_queue(struct drm_flip_work *work, void *val)
>  	if (task) {
>  		drm_flip_work_queue_task(work, task);
>  	} else {
> -		DRM_ERROR("%s could not allocate task!\n", work->name);
> +		drm_err(NULL, "%s could not allocate task!\n", work->name);
>  		work->func(work, val);
>  	}
>  }
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index aff3746dedfb..b21071919644 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -1070,7 +1070,8 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
>  
>  			/* should turn off the crtc */
>  			if (drm_crtc_force_disable(crtc))
> -				DRM_ERROR("failed to reset crtc %p when fb was deleted\n", crtc);
> +				drm_err(dev, "failed to reset crtc %p when fb was deleted\n",
> +					crtc);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 1a5a2cd0d4ec..e0d52e69df15 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -101,7 +101,7 @@ drm_gem_init(struct drm_device *dev)
>  	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
>  					  GFP_KERNEL);
>  	if (!vma_offset_manager) {
> -		DRM_ERROR("out of memory\n");
> +		drm_err(dev, "out of memory\n");

Same here, I think the message could be dropped.

>  		return -ENOMEM;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> index 870b90b78bc4..b3a96fc7b36f 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
>  
>  	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
>  	if (ret) {
> -		DRM_ERROR("Failed to vmap PRIME buffer\n");
> +		drm_err(dev, "Failed to vmap PRIME buffer\n");
>  		return ERR_PTR(ret);
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_hashtab.c b/drivers/gpu/drm/drm_hashtab.c
> index 60afa1865559..a1ebf8e056c7 100644
> --- a/drivers/gpu/drm/drm_hashtab.c
> +++ b/drivers/gpu/drm/drm_hashtab.c
> @@ -53,7 +53,7 @@ int drm_ht_create(struct drm_open_hash *ht, unsigned int order)
>  	else
>  		ht->table = vzalloc(array_size(size, sizeof(*ht->table)));
>  	if (!ht->table) {
> -		DRM_ERROR("Out of memory for hash table\n");
> +		drm_err(NULL, "Out of memory for hash table\n");

Same.

With the commit message fixed as mentioned in the review of an earlier
patch in this series, and the issue in drm_dev_init() addressed if
needed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  		return -ENOMEM;
>  	}
>  	return 0;
> @@ -157,7 +157,7 @@ int drm_ht_just_insert_please(struct drm_open_hash *ht, struct drm_hash_item *it
>  	} while(ret && (unshifted_key != first));
>  
>  	if (ret) {
> -		DRM_ERROR("Available key bit space exhausted\n");
> +		drm_err(NULL, "Available key bit space exhausted\n");
>  		return -EINVAL;
>  	}
>  	return 0;
> diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
> index 1efbd5389d89..411f75a1ee14 100644
> --- a/drivers/gpu/drm/drm_lock.c
> +++ b/drivers/gpu/drm/drm_lock.c
> @@ -79,8 +79,8 @@ int drm_lock_take(struct drm_lock_data *lock_data,
>  	if (_DRM_LOCKING_CONTEXT(old) == context) {
>  		if (old & _DRM_LOCK_HELD) {
>  			if (context != DRM_KERNEL_CONTEXT) {
> -				DRM_ERROR("%d holds heavyweight lock\n",
> -					  context);
> +				drm_err(NULL, "%d holds heavyweight lock\n",
> +					context);
>  			}
>  			return 0;
>  		}
> @@ -142,8 +142,8 @@ static int drm_legacy_lock_free(struct drm_lock_data *lock_data,
>  	} while (prev != old);
>  
>  	if (_DRM_LOCK_IS_HELD(old) && _DRM_LOCKING_CONTEXT(old) != context) {
> -		DRM_ERROR("%d freed heavyweight lock held by %d\n",
> -			  context, _DRM_LOCKING_CONTEXT(old));
> +		drm_err(NULL, "%d freed heavyweight lock held by %d\n",
> +			context, _DRM_LOCKING_CONTEXT(old));
>  		return 1;
>  	}
>  	wake_up_interruptible(&lock_data->lock_queue);
> @@ -175,8 +175,8 @@ int drm_legacy_lock(struct drm_device *dev, void *data,
>  	++file_priv->lock_count;
>  
>  	if (lock->context == DRM_KERNEL_CONTEXT) {
> -		DRM_ERROR("Process %d using kernel context %d\n",
> -			  task_pid_nr(current), lock->context);
> +		drm_err(dev, "Process %d using kernel context %d\n",
> +			task_pid_nr(current), lock->context);
>  		return -EINVAL;
>  	}
>  
> @@ -263,8 +263,8 @@ int drm_legacy_unlock(struct drm_device *dev, void *data, struct drm_file *file_
>  		return -EOPNOTSUPP;
>  
>  	if (lock->context == DRM_KERNEL_CONTEXT) {
> -		DRM_ERROR("Process %d using kernel context %d\n",
> -			  task_pid_nr(current), lock->context);
> +		drm_err(dev, "Process %d using kernel context %d\n",
> +			task_pid_nr(current), lock->context);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index c871d9f096b8..58ff9503a403 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -603,7 +603,7 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
>  	drm_mode_copy(&dbidev->mode, mode);
>  	ret = mipi_dbi_rotate_mode(&dbidev->mode, rotation);
>  	if (ret) {
> -		DRM_ERROR("Illegal rotation value %u\n", rotation);
> +		drm_err(drm, "Illegal rotation value %u\n", rotation);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index 8257f9d4f619..0a8d62c8f359 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -126,14 +126,14 @@ static void show_leaks(struct drm_mm *mm)
>  
>  	list_for_each_entry(node, drm_mm_nodes(mm), node_list) {
>  		if (!node->stack) {
> -			DRM_ERROR("node [%08llx + %08llx]: unknown owner\n",
> -				  node->start, node->size);
> +			drm_err(NULL, "node [%08llx + %08llx]: unknown owner\n",
> +				node->start, node->size);
>  			continue;
>  		}
>  
>  		stack_depot_snprint(node->stack, buf, BUFSZ, 0);
> -		DRM_ERROR("node [%08llx + %08llx]: inserted at\n%s",
> -			  node->start, node->size, buf);
> +		drm_err(NULL, "node [%08llx + %08llx]: inserted at\n%s",
> +			node->start, node->size, buf);
>  	}
>  
>  	kfree(buf);
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 87eb591fe9b5..b86473ab9ff7 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -513,7 +513,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>  	if (WARN_ON(!list_empty(&dev->mode_config.connector_list))) {
>  		drm_connector_list_iter_begin(dev, &conn_iter);
>  		drm_for_each_connector_iter(connector, &conn_iter)
> -			DRM_ERROR("connector %s leaked!\n", connector->name);
> +			drm_err(dev, "connector %s leaked!\n", connector->name);
>  		drm_connector_list_iter_end(&conn_iter);
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index ac9a406250c5..f5171bf91eae 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -373,8 +373,8 @@ static int fill_analog_mode(struct drm_device *dev,
>  	if (!bt601 &&
>  	    (hact_duration_ns < params->hact_ns.min ||
>  	     hact_duration_ns > params->hact_ns.max)) {
> -		DRM_ERROR("Invalid horizontal active area duration: %uns (min: %u, max %u)\n",
> -			  hact_duration_ns, params->hact_ns.min, params->hact_ns.max);
> +		drm_err(dev, "Invalid horizontal active area duration: %uns (min: %u, max %u)\n",
> +			hact_duration_ns, params->hact_ns.min, params->hact_ns.max);
>  		return -EINVAL;
>  	}
>  
> @@ -385,8 +385,8 @@ static int fill_analog_mode(struct drm_device *dev,
>  	if (!bt601 &&
>  	    (hblk_duration_ns < params->hblk_ns.min ||
>  	     hblk_duration_ns > params->hblk_ns.max)) {
> -		DRM_ERROR("Invalid horizontal blanking duration: %uns (min: %u, max %u)\n",
> -			  hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);
> +		drm_err(dev, "Invalid horizontal blanking duration: %uns (min: %u, max %u)\n",
> +			hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);
>  		return -EINVAL;
>  	}
>  
> @@ -397,8 +397,8 @@ static int fill_analog_mode(struct drm_device *dev,
>  	if (!bt601 &&
>  	    (hslen_duration_ns < params->hslen_ns.min ||
>  	     hslen_duration_ns > params->hslen_ns.max)) {
> -		DRM_ERROR("Invalid horizontal sync duration: %uns (min: %u, max %u)\n",
> -			  hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);
> +		drm_err(dev, "Invalid horizontal sync duration: %uns (min: %u, max %u)\n",
> +			hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);
>  		return -EINVAL;
>  	}
>  
> @@ -409,7 +409,7 @@ static int fill_analog_mode(struct drm_device *dev,
>  	if (!bt601 &&
>  	    (porches_duration_ns > (params->hfp_ns.max + params->hbp_ns.max) ||
>  	     porches_duration_ns < (params->hfp_ns.min + params->hbp_ns.min))) {
> -		DRM_ERROR("Invalid horizontal porches duration: %uns\n", porches_duration_ns);
> +		drm_err(dev, "Invalid horizontal porches duration: %uns\n", porches_duration_ns);
>  		return -EINVAL;
>  	}
>  
> @@ -431,8 +431,8 @@ static int fill_analog_mode(struct drm_device *dev,
>  	if (!bt601 &&
>  	    (hfp_duration_ns < params->hfp_ns.min ||
>  	     hfp_duration_ns > params->hfp_ns.max)) {
> -		DRM_ERROR("Invalid horizontal front porch duration: %uns (min: %u, max %u)\n",
> -			  hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);
> +		drm_err(dev, "Invalid horizontal front porch duration: %uns (min: %u, max %u)\n",
> +			hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);
>  		return -EINVAL;
>  	}
>  
> @@ -443,8 +443,8 @@ static int fill_analog_mode(struct drm_device *dev,
>  	if (!bt601 &&
>  	    (hbp_duration_ns < params->hbp_ns.min ||
>  	     hbp_duration_ns > params->hbp_ns.max)) {
> -		DRM_ERROR("Invalid horizontal back porch duration: %uns (min: %u, max %u)\n",
> -			  hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);
> +		drm_err(dev, "Invalid horizontal back porch duration: %uns (min: %u, max %u)\n",
> +			hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);
>  		return -EINVAL;
>  	}
>  
> @@ -495,8 +495,8 @@ static int fill_analog_mode(struct drm_device *dev,
>  
>  	vtotal = vactive + vfp + vslen + vbp;
>  	if (params->num_lines != vtotal) {
> -		DRM_ERROR("Invalid vertical total: %upx (expected %upx)\n",
> -			  vtotal, params->num_lines);
> +		drm_err(dev, "Invalid vertical total: %upx (expected %upx)\n",
> +			vtotal, params->num_lines);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index f858dfedf2cf..e26b0285dde6 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -235,7 +235,7 @@ int drm_mode_config_helper_resume(struct drm_device *dev)
>  
>  	ret = drm_atomic_helper_resume(dev, dev->mode_config.suspend_state);
>  	if (ret)
> -		DRM_ERROR("Failed to resume (%d)\n", ret);
> +		drm_err(dev, "Failed to resume (%d)\n", ret);
>  	dev->mode_config.suspend_state = NULL;
>  
>  	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..fc11efd5e560 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -611,7 +611,7 @@ void drm_plane_force_disable(struct drm_plane *plane)
>  	plane->old_fb = plane->fb;
>  	ret = plane->funcs->disable_plane(plane, NULL);
>  	if (ret) {
> -		DRM_ERROR("failed to disable plane with busy fb\n");
> +		drm_err(plane->dev, "failed to disable plane with busy fb\n");
>  		plane->old_fb = NULL;
>  		return;
>  	}
> diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
> index f4e6184d1877..5b0b2140d535 100644
> --- a/drivers/gpu/drm/drm_scatter.c
> +++ b/drivers/gpu/drm/drm_scatter.c
> @@ -170,9 +170,10 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
>  			     j++, tmp++) {
>  				if (*tmp != 0xcafebabe && error == 0) {
>  					error = 1;
> -					DRM_ERROR("Scatter allocation error, "
> -						  "pagelist does not match "
> -						  "virtual mapping\n");
> +					drm_err(dev,
> +						"Scatter allocation error, "
> +						"pagelist does not match "
> +						"virtual mapping\n");
>  				}
>  			}
>  			tmp = page_address(entry->pagelist[i]);
> @@ -183,7 +184,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
>  			}
>  		}
>  		if (error == 0)
> -			DRM_ERROR("Scatter allocation matches pagelist\n");
> +			drm_err(dev, "Scatter allocation matches pagelist\n");
>  	}
>  #endif
>  
> diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
> index 87c9fe55dec7..03c0a4e6e77b 100644
> --- a/drivers/gpu/drm/drm_vm.c
> +++ b/drivers/gpu/drm/drm_vm.c
> @@ -547,7 +547,7 @@ static int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma)
>  		return drm_mmap_dma(filp, vma);
>  
>  	if (drm_ht_find_item(&dev->map_hash, vma->vm_pgoff, &hash)) {
> -		DRM_ERROR("Could not find map\n");
> +		drm_err(dev, "Could not find map\n");
>  		return -EINVAL;
>  	}
>  

-- 
Regards,

Laurent Pinchart
