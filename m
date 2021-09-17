Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF42440FD2C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 17:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350F76EE42;
	Fri, 17 Sep 2021 15:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1FA6EE3B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 15:48:33 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id g11so6695387qvd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fFmHqRT30Ftkz5ueNOua6XBUxCpE36MdJOvmyZcvj1M=;
 b=e029K0cJq+VUGl0oo533Vh3wYQ5RboKDSDsZYw5syhxipzE3cJO0gpw9BVvJZxGB5z
 hEzdsRz3SWqet3478hB2mRVxjMvTFGjQrwrBgm4h17zfXNtxkDpIxyXz/sjUA3OIRvwn
 GX9BVSg2GMDSk5rgYmriS9w2co2E0VER2S+P00NaSU8W2UA3E/bfMTkoDOcUyHWOuHGm
 FSBp7jvGInB3gLE2lNeArRPhvu9TBuPAkh9/KntKMXH4StkWPD84c7fmmxTpzN+BfMwP
 7EAkD6n8Szo6w61TcAW9Iiday4Wh2Jb5lZrCWvLEbGJy1QQmCVsK733NyUAg5ZSncfMv
 cHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fFmHqRT30Ftkz5ueNOua6XBUxCpE36MdJOvmyZcvj1M=;
 b=EuchajCSfAZWHzB/TQAThaawpT9dAf5Wx4kJFn77EZz66VCdHSRjWZIEc51Xnn7oXb
 2y6AMkY7qj9uDAcXMCMWx2u6JYKwjW2emiyPrTc0i73MkiaU/+CfvKHe1bPp8KU5CdB0
 oY9B6F4jkxxmIlwbYLgfxVxJp3oiFm887tVWB39mswzWLXsfUEQJelRbHWiGQzjTUy6n
 WTWzP0lMS0YSik/ac1zscPnZBxMwavPdbkNTy/CJO3x5Uu3uo4uB0qU/AgDwaC9k1n2L
 2y1kLE44Js0KAeY4BvMh7/WK6noxCK0l2JxYJeHbQrtsBL6xJmvIEwnUL/OldLYcNWi1
 //TA==
X-Gm-Message-State: AOAM533be5+FIYAbVOeDXkkyox1nKg+98hSz2VSDoblGFo0cQ7K+JfBT
 XqQb8YXuuuDPopRPOhGi6RYUmg==
X-Google-Smtp-Source: ABdhPJy2S2Yhny4z8aJOIZz16XR6IIbnqcyQWAtiZRWSIqXBx6ZpN7JeKncqoz+aiUacV3+euzSuqA==
X-Received: by 2002:a0c:f205:: with SMTP id h5mr11954734qvk.56.1631893712053; 
 Fri, 17 Sep 2021 08:48:32 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id u27sm5359132qku.9.2021.09.17.08.48.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:48:31 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:48:30 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 12/15] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917154830.GM2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-13-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-13-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 16, 2021 at 11:15:49PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/i915/display/intel_audio.c    | 12 +++--
>  drivers/gpu/drm/i915/display/intel_display.c  |  5 ++-
>  .../drm/i915/display/intel_display_debugfs.c  | 35 ++++++++++-----
>  drivers/gpu/drm/i915/display/intel_overlay.c  | 45 +++++++++----------
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c |  5 ++-
>  drivers/gpu/drm/i915/i915_drv.c               | 12 +++--
>  6 files changed, 67 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index 532237588511..ab6a5a734b95 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -1214,7 +1214,9 @@ static int i915_audio_component_bind(struct device *i915_kdev,
>  {
>  	struct i915_audio_component *acomp = data;
>  	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
> +	struct drm_modeset_acquire_ctx ctx;
>  	int i;
> +	int ret;

Please move up with i

>  
>  	if (drm_WARN_ON(&dev_priv->drm, acomp->base.ops || acomp->base.dev))
>  		return -EEXIST;
> @@ -1224,14 +1226,14 @@ static int i915_audio_component_bind(struct device *i915_kdev,
>  					 DL_FLAG_STATELESS)))
>  		return -ENOMEM;
>  
> -	drm_modeset_lock_all(&dev_priv->drm);
> +	DRM_MODESET_LOCK_ALL_BEGIN((&dev_priv->drm), ctx, 0, ret);
>  	acomp->base.ops = &i915_audio_component_ops;
>  	acomp->base.dev = i915_kdev;
>  	BUILD_BUG_ON(MAX_PORTS != I915_MAX_PORTS);
>  	for (i = 0; i < ARRAY_SIZE(acomp->aud_sample_rate); i++)
>  		acomp->aud_sample_rate[i] = 0;
>  	dev_priv->audio_component = acomp;
> -	drm_modeset_unlock_all(&dev_priv->drm);
> +	DRM_MODESET_LOCK_ALL_END((&dev_priv->drm), ctx, ret);
>  
>  	return 0;

Return ret here

>  }
> @@ -1241,12 +1243,14 @@ static void i915_audio_component_unbind(struct device *i915_kdev,
>  {
>  	struct i915_audio_component *acomp = data;
>  	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(&dev_priv->drm);
> +	DRM_MODESET_LOCK_ALL_BEGIN((&dev_priv->drm), ctx, 0, ret);
>  	acomp->base.ops = NULL;
>  	acomp->base.dev = NULL;
>  	dev_priv->audio_component = NULL;
> -	drm_modeset_unlock_all(&dev_priv->drm);
> +	DRM_MODESET_LOCK_ALL_END((&dev_priv->drm), ctx, ret);
>  
>  	device_link_remove(hda_kdev, i915_kdev);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 997a16e85c85..dc2e4d89e5aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -12511,6 +12511,7 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
>  int intel_modeset_init_nogem(struct drm_i915_private *i915)
>  {
>  	struct drm_device *dev = &i915->drm;
> +	struct drm_modeset_acquire_ctx ctx;
>  	enum pipe pipe;
>  	struct intel_crtc *crtc;
>  	int ret;
> @@ -12562,9 +12563,9 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
>  	intel_vga_disable(i915);
>  	intel_setup_outputs(i915);
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  
>  	for_each_intel_crtc(dev, crtc) {
>  		struct intel_initial_plane_config plane_config = {};
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 8fdacb252bb1..d73af228862e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -1057,11 +1057,13 @@ static int i915_display_info(struct seq_file *m, void *unused)
>  	struct intel_crtc *crtc;
>  	struct drm_connector *connector;
>  	struct drm_connector_list_iter conn_iter;
> +	struct drm_modeset_acquire_ctx ctx;
>  	intel_wakeref_t wakeref;
> +	int ret;
>  
>  	wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
>  	seq_printf(m, "CRTC info\n");
>  	seq_printf(m, "---------\n");
> @@ -1076,7 +1078,7 @@ static int i915_display_info(struct seq_file *m, void *unused)
>  		intel_connector_info(m, connector);
>  	drm_connector_list_iter_end(&conn_iter);
>  
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  
>  	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
>  
> @@ -1087,9 +1089,11 @@ static int i915_shared_dplls_info(struct seq_file *m, void *unused)
>  {
>  	struct drm_i915_private *dev_priv = node_to_i915(m->private);
>  	struct drm_device *dev = &dev_priv->drm;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int i;
> +	int ret;

Please move up with i

>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
>  	seq_printf(m, "PLL refclks: non-SSC: %d kHz, SSC: %d kHz\n",
>  		   dev_priv->dpll.ref_clks.nssc,
> @@ -1132,7 +1136,7 @@ static int i915_shared_dplls_info(struct seq_file *m, void *unused)
>  		seq_printf(m, " mg_pll_tdc_coldst_bias: 0x%08x\n",
>  			   pll->state.hw_state.mg_pll_tdc_coldst_bias);
>  	}
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  
>  	return 0;

Return ret

>  }
> @@ -1193,13 +1197,15 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
>  {
>  	struct drm_i915_private *dev_priv = node_to_i915(m->private);
>  	struct drm_device *dev = &dev_priv->drm;
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct skl_ddb_entry *entry;
>  	struct intel_crtc *crtc;
> +	int ret;
>  
>  	if (DISPLAY_VER(dev_priv) < 9)
>  		return -ENODEV;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
>  	seq_printf(m, "%-15s%8s%8s%8s\n", "", "Start", "End", "Size");
>  
> @@ -1223,7 +1229,7 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
>  			   entry->end, skl_ddb_entry_size(entry));
>  	}
>  
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  
>  	return 0;

Return ret

>  }
> @@ -1303,10 +1309,12 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
>  {
>  	struct drm_i915_private *dev_priv = node_to_i915(m->private);
>  	struct drm_device *dev = &dev_priv->drm;
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct intel_crtc *crtc;
>  	int active_crtc_cnt = 0;
> +	int ret;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	for_each_intel_crtc(dev, crtc) {
>  		if (crtc->base.state->active) {
>  			active_crtc_cnt++;
> @@ -1315,7 +1323,7 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
>  			drrs_status_per_crtc(m, dev, crtc);
>  		}
>  	}
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  
>  	if (!active_crtc_cnt)
>  		seq_puts(m, "No active crtc found\n");
> @@ -1607,8 +1615,10 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
>  {
>  	struct drm_i915_private *dev_priv = m->private;
>  	struct drm_device *dev = &dev_priv->drm;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int level;
>  	int num_levels;
> +	int ret;
>  
>  	if (IS_CHERRYVIEW(dev_priv))
>  		num_levels = 3;
> @@ -1619,7 +1629,7 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
>  	else
>  		num_levels = ilk_wm_max_level(dev_priv) + 1;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
>  	for (level = 0; level < num_levels; level++) {
>  		unsigned int latency = wm[level];
> @@ -1640,7 +1650,7 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
>  			   level, wm[level], latency / 10, latency % 10);
>  	}
>  
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  }
>  
>  static int pri_wm_latency_show(struct seq_file *m, void *data)
> @@ -1724,6 +1734,7 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
>  	struct seq_file *m = file->private_data;
>  	struct drm_i915_private *dev_priv = m->private;
>  	struct drm_device *dev = &dev_priv->drm;
> +	struct drm_modeset_acquire_ctx ctx;
>  	u16 new[8] = { 0 };
>  	int num_levels;
>  	int level;
> @@ -1753,12 +1764,12 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
>  	if (ret != num_levels)
>  		return -EINVAL;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
>  	for (level = 0; level < num_levels; level++)
>  		wm[level] = new[level];
>  
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  

Check ret here and return an error if it's != 0

>  	return len;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index 7e3f5c6ca484..79c6940807a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -1104,6 +1104,7 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
>  	struct drm_crtc *drmmode_crtc;
>  	struct intel_crtc *crtc;
>  	struct drm_i915_gem_object *new_bo;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int ret;
>  
>  	overlay = dev_priv->overlay;
> @@ -1112,24 +1113,24 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
>  		return -ENODEV;
>  	}
>  
> -	if (!(params->flags & I915_OVERLAY_ENABLE)) {
> -		drm_modeset_lock_all(dev);
> -		ret = intel_overlay_switch_off(overlay);
> -		drm_modeset_unlock_all(dev);
> +	if (params->flags & I915_OVERLAY_ENABLE) {
>  
> -		return ret;
> -	}
> +		drmmode_crtc = drm_crtc_find(dev, file_priv, params->crtc_id);
> +		if (!drmmode_crtc)
> +			return -ENOENT;
> +		crtc = to_intel_crtc(drmmode_crtc);
>  
> -	drmmode_crtc = drm_crtc_find(dev, file_priv, params->crtc_id);
> -	if (!drmmode_crtc)
> -		return -ENOENT;
> -	crtc = to_intel_crtc(drmmode_crtc);
> +		new_bo = i915_gem_object_lookup(file_priv, params->bo_handle);
> +		if (!new_bo)
> +			return -ENOENT;
> +	}
>  
> -	new_bo = i915_gem_object_lookup(file_priv, params->bo_handle);
> -	if (!new_bo)
> -		return -ENOENT;
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
> -	drm_modeset_lock_all(dev);
> +	if (!(params->flags & I915_OVERLAY_ENABLE)) {
> +		ret = intel_overlay_switch_off(overlay);
> +		goto out_unlock;
> +	}
>  
>  	if (i915_gem_object_is_tiled(new_bo)) {
>  		drm_dbg_kms(&dev_priv->drm,
> @@ -1194,14 +1195,11 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
>  	if (ret != 0)
>  		goto out_unlock;
>  
> -	drm_modeset_unlock_all(dev);
> -	i915_gem_object_put(new_bo);
> -
> -	return 0;
> -
>  out_unlock:
> -	drm_modeset_unlock_all(dev);
> -	i915_gem_object_put(new_bo);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> +
> +	if (params->flags & I915_OVERLAY_ENABLE)
> +		i915_gem_object_put(new_bo);

This function refactor is a bit more involved than the
s/drm_modeset_lock_all/DRM_MODESET_LOCK_ALL_*/ changes in the rest of the patch.
Could you split it out into a separate patch so it's not hidden away?

>  
>  	return ret;
>  }
> @@ -1263,6 +1261,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_intel_overlay_attrs *attrs = data;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct intel_overlay *overlay;
>  	int ret;
>  
> @@ -1272,7 +1271,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
>  		return -ENODEV;
>  	}
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
>  	ret = -EINVAL;
>  	if (!(attrs->flags & I915_OVERLAY_UPDATE_ATTRS)) {
> @@ -1329,7 +1328,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
>  
>  	ret = 0;
>  out_unlock:
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> index 8ac263f471be..e50e514e4897 100644
> --- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> +++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> @@ -76,6 +76,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
>  				     enum intel_pipe_crc_source *source)
>  {
>  	struct drm_device *dev = &dev_priv->drm;
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct intel_encoder *encoder;
>  	struct intel_crtc *crtc;
>  	struct intel_digital_port *dig_port;
> @@ -83,7 +84,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
>  
>  	*source = INTEL_PIPE_CRC_SOURCE_PIPE;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	for_each_intel_encoder(dev, encoder) {
>  		if (!encoder->base.crtc)
>  			continue;
> @@ -120,7 +121,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
>  			break;
>  		}
>  	}
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 59fb4c710c8c..7a30e2ff2fed 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1009,31 +1009,35 @@ static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
>  static void intel_suspend_encoders(struct drm_i915_private *dev_priv)
>  {
>  	struct drm_device *dev = &dev_priv->drm;
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct intel_encoder *encoder;
> +	int ret;
>  
>  	if (!HAS_DISPLAY(dev_priv))
>  		return;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	for_each_intel_encoder(dev, encoder)
>  		if (encoder->suspend)
>  			encoder->suspend(encoder);
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  }
>  
>  static void intel_shutdown_encoders(struct drm_i915_private *dev_priv)
>  {
>  	struct drm_device *dev = &dev_priv->drm;
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct intel_encoder *encoder;
> +	int ret;
>  
>  	if (!HAS_DISPLAY(dev_priv))
>  		return;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	for_each_intel_encoder(dev, encoder)
>  		if (encoder->shutdown)
>  			encoder->shutdown(encoder);
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  }
>  
>  void i915_driver_shutdown(struct drm_i915_private *i915)
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
