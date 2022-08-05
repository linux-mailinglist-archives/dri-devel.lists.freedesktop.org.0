Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8869858AFBA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 20:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E2A98EE5;
	Fri,  5 Aug 2022 18:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C929641D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 18:27:10 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id c24so2473997qkm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Aug 2022 11:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=26mmpA/lCkcLUVvvO0k6flZRB05qHu/s/16fZ8GvOAI=;
 b=Rj387xL6Hq0zuAt3+j8G8hyb07lH9UP2dtOYh9QCci+MTfbn6WpQ+5SRGl6Z3A5Foa
 GNsLArp7ClnjpA69SWEQUYzAqTWQdRDslOwFJjNzZ6Y4w2OlQ1vCZyYsrsQJFf6yMbmQ
 t9231dg23tu3PjyZOiJIHSb5ufoTXTIJ4p7VTDQwvp9gs4mOWP18t1Q2EmQvUS5Mfwmx
 /IM1TwzBG99Tp4alsnKxbg/oXsdiI0Q1h1lGfm9oAo+n1MQeOCMRD/cpglAjkHE4cIAn
 5goD9Jqbt5fqxuLGzAXzunKg93rv0R7BeUKc8KpLJGn6sURJdziHM8coFHiZgKDqe861
 KKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=26mmpA/lCkcLUVvvO0k6flZRB05qHu/s/16fZ8GvOAI=;
 b=B/RHWwD/gzUBcFIjDgc0IRAO6dmcFU5A0zq5PBLV2/+Cn2jpVOQR146LY6uhtztKIo
 8yHlrP1RT/x/6VS33BriUem/v0hUi32taUQ4M5+i0K8iyaPt8QULBUWRSV5OREsYbGIC
 aXjeO1DfgDBa3SkMY8+vJDXXebWWLzGw4glJI6Ivh2wrPa7j4I1K7lKW+1z+xR8oWhOJ
 KQG3l5woP0c0UkrD/dV3xmp6QpLo3iZRtGPQhVjvAC1hJEvgp/uEmaajHIw5SMslg8eE
 m8kjeNaiYHPcCfKl1C6xV5U05xgxtCvEeAL+MiskylQ7oHUTzfwuwgANXlV21TKscGkM
 sUTQ==
X-Gm-Message-State: ACgBeo3oiiHtBePZYU4XvlNwONP34bjVpJgzG2IrXGq5/ky1PMxP1YbH
 W6aZUBzT0nrgL3TRToaaNqNDXg==
X-Google-Smtp-Source: AA6agR4IwHnQg8qSeA0etaDqlgS6AjMeL3e1f+JQegj5RfKbIyjo0NGcEEr4lIw5dwwMEJazxJvswQ==
X-Received: by 2002:a05:620a:2011:b0:6b8:fe5d:b561 with SMTP id
 c17-20020a05620a201100b006b8fe5db561mr6205777qka.221.1659724028910; 
 Fri, 05 Aug 2022 11:27:08 -0700 (PDT)
Received: from localhost (48.230.85.34.bc.googleusercontent.com.
 [34.85.230.48]) by smtp.gmail.com with ESMTPSA id
 ay34-20020a05620a17a200b006b8e7afe20bsm3609508qkb.123.2022.08.05.11.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 11:27:08 -0700 (PDT)
Date: Fri, 5 Aug 2022 18:27:08 +0000
From: Sean Paul <sean@poorly.run>
To: Jim Shargo <jshargo@chromium.org>
Subject: Re: [PATCH 3/5] drm/vkms: Support multiple objects (crtcs, etc.) per
 card
Message-ID: <Yu1g/PLuU559SIm7@art_vandelay>
References: <20220722213214.1377835-1-jshargo@chromium.org>
 <20220722213214.1377835-4-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722213214.1377835-4-jshargo@chromium.org>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 jshargo@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 05:32:10PM -0400, Jim Shargo wrote:
> This is a small refactor to make ConfigFS support easier.
> 
> We now store the vkms_device statically, and maintain a list of
> "cards", each representing a different virtual DRM driver.
> 
> We also make it clear when a card is "default", that is created at
> initialization, and not. This is because, due to limitations on what we
> can do with the configfs API, the default card won't be reflected in
> configfs and is initialized in a unique way.
> 
> Since we're only managing a single card, this should be a no-op.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c      |  11 +-
>  drivers/gpu/drm/vkms/vkms_drv.c       | 160 ++++++++++++++++----------
>  drivers/gpu/drm/vkms/vkms_drv.h       |  32 ++++--
>  drivers/gpu/drm/vkms/vkms_output.c    |  25 ++--
>  drivers/gpu/drm/vkms/vkms_plane.c     |   4 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  20 ++--
>  6 files changed, 158 insertions(+), 94 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 57bbd32e9beb..c1b632952532 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -62,9 +62,10 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  static int vkms_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev = crtc->dev;
> +	struct vkms_card *card = drm_device_to_vkms_card(dev);
> +	struct vkms_output *out = &card->output;
>  	unsigned int pipe = drm_crtc_index(crtc);
>  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> -	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>  
>  	drm_calc_timestamping_constants(crtc, &crtc->mode);
>  
> @@ -78,7 +79,9 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
>  
>  static void vkms_disable_vblank(struct drm_crtc *crtc)
>  {
> -	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +	struct drm_device *dev = crtc->dev;
> +	struct vkms_card *card = drm_device_to_vkms_card(dev);
> +	struct vkms_output *out = &card->output;
>  
>  	hrtimer_cancel(&out->vblank_hrtimer);
>  }
> @@ -88,9 +91,9 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>  				      bool in_vblank_irq)
>  {
>  	struct drm_device *dev = crtc->dev;
> +	struct vkms_card *card = drm_device_to_vkms_card(dev);
> +	struct vkms_output *output = &card->output;
>  	unsigned int pipe = crtc->index;
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> -	struct vkms_output *output = &vkmsdev->output;
>  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>  
>  	if (!READ_ONCE(vblank->enabled)) {
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 81ed9417e511..92fbade2199b 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -9,9 +9,9 @@
>   * the GPU in DRM API tests.
>   */
>  
> +#include <linux/kernel.h>

Unless you're using something directly from this header, it's probably best not to include it as it pulls in a _lot_ of stuff.

>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/dma-mapping.h>
>  
>  #include <drm/drm_gem.h>
>  #include <drm/drm_atomic.h>
> @@ -37,7 +37,7 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> -static struct vkms_device *vkms_device;
> +static struct vkms_device vkms_device;
>  
>  static bool enable_cursor = true;
>  module_param_named(enable_cursor, enable_cursor, bool, 0444);
> @@ -55,9 +55,9 @@ DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>  
>  static void vkms_release(struct drm_device *dev)
>  {
> -	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
> +	struct vkms_card *card = drm_device_to_vkms_card(dev);
>  
> -	destroy_workqueue(vkms->output.composer_workq);
> +	destroy_workqueue(card->output.composer_workq);
>  }
>  
>  static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> @@ -91,9 +91,9 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>  
>  static int vkms_config_show(struct seq_file *m, void *data)
>  {
> -	seq_printf(m, "writeback=%d\n", vkms_device->config.writeback);
> -	seq_printf(m, "cursor=%d\n", vkms_device->config.cursor);
> -	seq_printf(m, "overlay=%d\n", vkms_device->config.overlay);
> +	seq_printf(m, "writeback=%d\n", vkms_device.config.writeback);
> +	seq_printf(m, "cursor=%d\n", vkms_device.config.cursor);
> +	seq_printf(m, "overlay=%d\n", vkms_device.config.overlay);
>  
>  	return 0;
>  }
> @@ -133,9 +133,9 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
>  	.atomic_commit_tail = vkms_atomic_commit_tail,
>  };
>  
> -static int vkms_modeset_init(struct vkms_device *vkmsdev)
> +static int vkms_modeset_init(struct vkms_card *card)
>  {
> -	struct drm_device *dev = &vkmsdev->drm;
> +	struct drm_device *dev = &card->drm;
>  
>  	drm_mode_config_init(dev);
>  	dev->mode_config.funcs = &vkms_mode_funcs;
> @@ -151,89 +151,133 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	dev->mode_config.preferred_depth = 0;
>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>  
> -	return vkms_output_init(vkmsdev, 0);
> +	return card->is_default ? vkms_output_init_default(card, 0) : -ENOTSUPP;

AFAICT if card is not default this failure will roll up to vkms_card_init and to vkms_init() which will cause everything to get torn down. So we can probably check at the start of the function and fail early.

Also, minor nit: Ternary operators are usually discouraged.


>  }
>  
> -static int vkms_create(void)
> +static void vkms_device_destroy(void)
>  {
> -	int ret;
> +	struct vkms_card *card, *n;
> +
> +	list_for_each_entry_safe(card, n, &vkms_device.cards, node) {
> +		vkms_card_destroy(card);
> +	}

Nit: no braces

> +
> +	memset(&vkms_device, 0, sizeof(struct vkms_device));

Nit: You could do sizeof(vkms_device) here

That said, this is either unnecessary or not a good idea since it blows away at least the backpointer to platform_device, clears drm_device, and other items which have proper destroy/clean-up functions. So we either don't need this, or we need to clean up everything in vkms_device explicitly.

> +}
> +
> +struct vkms_card *vkms_card_init(const char *name, bool is_default)
> +{
> +	char unique_name[64] = { 0 };
>  	struct platform_device *pdev;
> +	struct vkms_card *card;
> +	void *grp;
> +	int ret;
>  
> -	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> +	ret = snprintf(unique_name, ARRAY_SIZE(unique_name), "%s-%s",
> +		       DRIVER_NAME, name);
> +	if (ARRAY_SIZE(unique_name) <= ret) {
> +		DRM_WARN("Truncated vkms card driver name '%s-%s' to '%s'\n",

Nit: The DRM_* print macros are deprecated in favor of the drm_* print functions. You probably also want to use a categorized message here instead of just warn, perhaps drm_dbg() which defaults to DRIVER category.

You might consider converting the driver to drm_* before this patchset so we're working from a consistent base.

> +			 DRIVER_NAME, name, unique_name);
> +	}
> +
> +	pdev = platform_device_register_simple(unique_name, -1, NULL, 0);
>  	if (IS_ERR(pdev))
> -		return PTR_ERR(pdev);
> +		return ERR_PTR(PTR_ERR(pdev));

return pdev;

>  
> -	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> -		ret = -ENOMEM;
> -		goto out_unregister;
> +	grp = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
> +	if (!grp) {
> +		ret = ENOMEM;
> +		goto out_platform_device;
>  	}
>  
> -	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
> -					 struct vkms_device, drm);
> -	if (IS_ERR(vkms_device)) {
> -		ret = PTR_ERR(vkms_device);
> -		goto out_devres;
> +	card = devm_drm_dev_alloc(&pdev->dev, &vkms_driver, struct vkms_card,
> +				  drm);
> +	if (IS_ERR(card)) {
> +		ret = PTR_ERR(card);
> +		goto out_release_group;
>  	}
> -	
> -	vkms_device->platform = pdev;
> -	vkms_device->config.cursor = enable_cursor;
> -	vkms_device->config.writeback = enable_writeback;
> -	vkms_device->config.overlay = enable_overlay;
>  
> -	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
> -					   DMA_BIT_MASK(64));
> +	strncpy(card->name_buf, unique_name, ARRAY_SIZE(card->name_buf) - 1);
> +	card->platform = pdev;
> +	card->drm.unique = card->name_buf;
> +	card->vkms_device = &vkms_device;
> +	card->is_default = is_default;
> +	card->is_registered = false;
> +	card->resource_group_id = grp;
>  
> +	ret = dma_coerce_mask_and_coherent(card->drm.dev, DMA_BIT_MASK(64));
>  	if (ret) {
>  		DRM_ERROR("Could not initialize DMA support\n");
> -		goto out_devres;
> +		goto out_release_group;
>  	}
>  
> -	ret = drm_vblank_init(&vkms_device->drm, 1);
> +	ret = drm_vblank_init(&card->drm, 1);
>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
> -		goto out_devres;
> +		goto out_release_group;
>  	}
>  
> -	ret = vkms_modeset_init(vkms_device);
> -	if (ret)
> -		goto out_devres;
> -
> -	ret = drm_dev_register(&vkms_device->drm, 0);
> -	if (ret)
> -		goto out_devres;
> +	ret = vkms_modeset_init(card);
> +	if (ret) {
> +		DRM_ERROR("Unable to initialize modesetting");
> +		goto out_release_group;
> +	}
>  
> -	drm_fbdev_generic_setup(&vkms_device->drm, 0);
> +	ret = drm_dev_register(&card->drm, 0);
> +	if (ret) {
> +		DRM_ERROR("Unable to register card");
> +		return ERR_PTR(ret);

No cleanup required if this fails?

> +	}
>  
> -	vkms_device->initialized = true;
> +	drm_fbdev_generic_setup(&card->drm, 0);
> +	card->is_registered = true;

Re-raising the race concern here.

>  
> -	return 0;
> +	devres_close_group(&pdev->dev, grp);
> +	list_add_tail(&card->node, &vkms_device.cards);

I am still unclear why we need to bookkeep the cards ourselves since we're
spawning a new platform_device for each drm_device. It feels like perhaps it
would be easier to spawn a new platform_driver for each new drm device with its
own .probe & .remove function which keeps track of its own instance. This would
avoid the necessity of vkms_card, each platform_driver would have its own
vkms_device containing a drm_device.

I'm assuming that rmmod would invoke .remove on all the sub platform_drivers,
but if not you could keep track of them in the platform device and unregister
each one on unload which would be a lot less statekeeping.

> +	

Nit: Trailing whitespace here

> +	return card;
>  
> -out_devres:
> -	devres_release_group(&pdev->dev, NULL);
> -out_unregister:
> +out_release_group:
> +	devres_release_group(&pdev->dev, grp);
> +out_platform_device:
>  	platform_device_unregister(pdev);
> -	return ret;
> +	return ERR_PTR(ret);
>  }
>  
> -static int __init vkms_init(void)
> +void vkms_card_destroy(struct vkms_card *card)
>  {
> -	return vkms_create();
> +	list_del(&card->node);
> +	if (card->is_registered) {

Nit: You could save yourself some indentation here and exit early.

> +		drm_dev_unregister(&card->drm);
> +		drm_atomic_helper_shutdown(&card->drm);
> +		devres_release_group(&card->platform->dev,
> +				     card->resource_group_id);
> +		platform_device_unregister(card->platform);
> +	}
>  }
>  
> -static void __exit vkms_exit(void)
> +static int __init vkms_init(void)
>  {
> -	struct platform_device *pdev;
> -
> -	if (!vkms_device || !vkms_device->initialized) {
> -		return;
> +	struct vkms_card *card;
> +
> +	vkms_device.config.cursor = enable_cursor;
> +	vkms_device.config.writeback = enable_writeback;
> +	vkms_device.config.overlay = enable_overlay;
> +	INIT_LIST_HEAD(&vkms_device.cards);
> +
> +	card = vkms_card_init("default", /* configfs */ NULL);

This passes NULL for the bool is_default argument. Presumably this should be
true, or perhaps you don't need the second arg at all right now.

> +	if (IS_ERR(card)) {
> +		DRM_ERROR("Unable to init default card");
> +		vkms_device_destroy();
> +		return PTR_ERR(card);
>  	}
>  
> -	pdev = vkms_device->platform;
> +	return 0;
> +}
>  
> -	drm_dev_unregister(&vkms_device->drm);
> -	drm_atomic_helper_shutdown(&vkms_device->drm);
> -	devres_release_group(&pdev->dev, NULL);
> -	platform_device_unregister(pdev);
> +static void __exit vkms_exit(void)
> +{
> +	vkms_device_destroy();
>  }
>  
>  module_init(vkms_init);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index c7ebc4ee6b14..1a98b81d6f22 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -4,6 +4,7 @@
>  #define _VKMS_DRV_H_
>  
>  #include <linux/hrtimer.h>
> +#include <linux/kernel.h>

From kernel.h:
 * This header has combined a lot of unrelated to each other stuff.
 * The process of splitting its content is in progress while keeping
 * backward compatibility. That's why it's highly recommended NOT to
 * include this header inside another header file, especially under
 * generic or architectural include/ directory.

>  
>  #include <drm/drm.h>
>  #include <drm/drm_gem.h>
> @@ -101,19 +102,29 @@ struct vkms_config {
>  	bool overlay;
>  };
>  
> -struct vkms_device {
> -	struct drm_device drm;
> +struct vkms_card {
>  	struct platform_device *platform;
> +	struct drm_device drm;
> +	struct list_head node;

Nit: node is pretty ambiguous

>  	struct vkms_output output;
> +	struct vkms_device *vkms_device;
> +	/* storage for the value of drm->unique, giving this dev a unique busid */

I didn't quite grok this comment, mind expanding?

> +	char name_buf[64];
> +	void *resource_group_id;
> +	bool is_default;
> +	bool is_registered;
> +};
> +
> +struct vkms_device {
> +	struct list_head cards;
>  	struct vkms_config config;
> -	bool initialized;
>  };
>  
>  #define drm_crtc_to_vkms_output(target) \
>  	container_of(target, struct vkms_output, crtc)
>  
> -#define drm_device_to_vkms_device(target) \
> -	container_of(target, struct vkms_device, drm)
> +#define drm_device_to_vkms_card(target)                                        \
> +	container_of(target, struct vkms_card, drm)
>  
>  #define to_vkms_crtc_state(target)\
>  	container_of(target, struct vkms_crtc_state, base)
> @@ -121,13 +132,18 @@ struct vkms_device {
>  #define to_vkms_plane_state(target)\
>  	container_of(target, struct vkms_plane_state, base.base)
>  
> +/* Cards */
> +struct vkms_card *vkms_card_init(const char *name, bool is_default);
> +void vkms_card_destroy(struct vkms_card *card);
> +
>  /* CRTC */
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		   struct drm_plane *primary, struct drm_plane *cursor);
>  
> -int vkms_output_init(struct vkms_device *vkmsdev, int index);
> +int vkms_output_init_default(struct vkms_card *card, int index);
> +int vkms_output_init(struct vkms_card *card, int index);
>  
> -struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> +struct vkms_plane *vkms_plane_init(struct vkms_card *card,
>  				   enum drm_plane_type type, int index);
>  
>  /* CRC Support */
> @@ -142,6 +158,6 @@ void vkms_composer_worker(struct work_struct *work);
>  void vkms_set_composer(struct vkms_output *out, bool enabled);
>  
>  /* Writeback */
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> +int vkms_enable_writeback_connector(struct vkms_card *card);
>  
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index d0061c82003a..dafd47c0a54d 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -32,12 +32,12 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  	.get_modes    = vkms_conn_get_modes,
>  };
>  
> -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> +static int vkms_add_overlay_plane(struct vkms_card *card, int index,
>  				  struct drm_crtc *crtc)
>  {
>  	struct vkms_plane *overlay;
>  
> -	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> +	overlay = vkms_plane_init(card, DRM_PLANE_TYPE_OVERLAY, index);
>  	if (IS_ERR(overlay))
>  		return PTR_ERR(overlay);
>  
> @@ -47,10 +47,11 @@ static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
>  	return 0;
>  }
>  
> -int vkms_output_init(struct vkms_device *vkmsdev, int index)
> +int vkms_output_init_default(struct vkms_card *card, int index)
>  {
> -	struct vkms_output *output = &vkmsdev->output;
> -	struct drm_device *dev = &vkmsdev->drm;
> +	const struct vkms_config *config = &card->vkms_device->config;
> +	struct vkms_output *output = &card->output;
> +	struct drm_device *dev = &card->drm;
>  	struct drm_connector *connector = &output->connector;
>  	struct drm_encoder *encoder = &output->encoder;
>  	struct drm_crtc *crtc = &output->crtc;
> @@ -59,20 +60,20 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	int writeback;
>  	unsigned int n;
>  
> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> +	primary = vkms_plane_init(card, DRM_PLANE_TYPE_PRIMARY, index);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> -	if (vkmsdev->config.overlay) {
> +	if (config->overlay) {
>  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
> +			ret = vkms_add_overlay_plane(card, index, crtc);
>  			if (ret)
>  				return ret;
>  		}
>  	}
>  
> -	if (vkmsdev->config.cursor) {
> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> +	if (config->cursor) {
> +		cursor = vkms_plane_init(card, DRM_PLANE_TYPE_CURSOR, index);
>  		if (IS_ERR(cursor))
>  			return PTR_ERR(cursor);
>  	}
> @@ -103,8 +104,8 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		goto err_attach;
>  	}
>  
> -	if (vkmsdev->config.writeback) {
> -		writeback = vkms_enable_writeback_connector(vkmsdev);
> +	if (config->writeback) {
> +		writeback = vkms_enable_writeback_connector(card);
>  		if (writeback)
>  			DRM_ERROR("Failed to init writeback connector\n");
>  	}
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index d8eb674b49a6..28abd61a0bb9 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -158,10 +158,10 @@ static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
>  	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>  };
>  
> -struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> +struct vkms_plane *vkms_plane_init(struct vkms_card *card,
>  				   enum drm_plane_type type, int index)
>  {
> -	struct drm_device *dev = &vkmsdev->drm;
> +	struct drm_device *dev = &card->drm;
>  	const struct drm_plane_helper_funcs *funcs;
>  	struct vkms_plane *plane;
>  	const u32 *formats;
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index af1604dfbbaf..681e7267d688 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -94,15 +94,15 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>  				struct drm_writeback_job *job)
>  {
>  	struct vkms_writeback_job *vkmsjob = job->priv;
> -	struct vkms_device *vkmsdev;
> +	struct vkms_card *card;
>  
>  	if (!job->fb)
>  		return;
>  
>  	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
>  
> -	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
> -	vkms_set_composer(&vkmsdev->output, false);
> +	card = drm_device_to_vkms_card(job->fb->dev);
> +	vkms_set_composer(&card->output, false);
>  	kfree(vkmsjob);
>  }
>  
> @@ -111,8 +111,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  {
>  	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
>  											 conn);
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
> -	struct vkms_output *output = &vkmsdev->output;
> +	struct vkms_card *card = drm_device_to_vkms_card(conn->dev);
> +	struct vkms_output *output = &card->output;
>  	struct drm_writeback_connector *wb_conn = &output->wb_connector;
>  	struct drm_connector_state *conn_state = wb_conn->base.state;
>  	struct vkms_crtc_state *crtc_state = output->composer_state;
> @@ -120,7 +120,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  	if (!conn_state)
>  		return;
>  
> -	vkms_set_composer(&vkmsdev->output, true);
> +	vkms_set_composer(&card->output, true);
>  
>  	spin_lock_irq(&output->composer_lock);
>  	crtc_state->active_writeback = conn_state->writeback_job->priv;
> @@ -136,14 +136,14 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
>  	.atomic_commit = vkms_wb_atomic_commit,
>  };
>  
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
> +int vkms_enable_writeback_connector(struct vkms_card *card)
>  {
> -	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
> +	struct drm_writeback_connector *wb = &card->output.wb_connector;
>  
> -	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
> +	card->output.wb_connector.encoder.possible_crtcs = 1;
>  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>  
> -	return drm_writeback_connector_init(&vkmsdev->drm, wb,
> +	return drm_writeback_connector_init(&card->drm, wb,
>  					    &vkms_wb_connector_funcs,
>  					    &vkms_wb_encoder_helper_funcs,
>  					    vkms_wb_formats,
> -- 
> 2.37.1.359.gd136c6c3e2-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
