Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8CAA03EC8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 13:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6A810E4C3;
	Tue,  7 Jan 2025 12:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ehJfZtWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E1810E4C1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736251822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKRRC7xdkSdehsjFtG2z/R2lidMg7DrEvSxbP7iFi2I=;
 b=ehJfZtWROXtfvKQvcljQ95L1/mmfy/cIVbWmUK90h2xnc5ixZLQK8U4Ik98gHDk4pk92IX
 a/8aM38PpRhSf31kadt5PlluB9p2bXPOFVHrXSvpFpK7sFxdYXvQ8hcjL98TdRnslrGyhl
 MbSeJvkrdZOfno3NTGjJ5+3XV/SBOs4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-S9OGKkZ3P4CBnFAm9HBB7A-1; Tue, 07 Jan 2025 07:10:19 -0500
X-MC-Unique: S9OGKkZ3P4CBnFAm9HBB7A-1
X-Mimecast-MFC-AGG-ID: S9OGKkZ3P4CBnFAm9HBB7A
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4359206e1e4so118600235e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 04:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736251818; x=1736856618;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bKRRC7xdkSdehsjFtG2z/R2lidMg7DrEvSxbP7iFi2I=;
 b=xTJivOobvhzF+DPBCdpoObA2OU0Uy/5fMdVLxTcAqaA1h6Pyk1ToQQ6H0qWPREPHZ2
 EkZjaX/4GEqQwuJmQZI0LpU9c6WP+SiD/LEGts9J5mz34H92GUN3MDStzZaBtDCtiGyw
 MIOJoOTMVn5NOh9JD7bHhHjvoA8ATIU2L9kYiDP1Udnl69R9jIQwvEoHjYF+rxjSK2Ye
 G+WDezoFFJJFKzzLPtj2bE41pAi7CQVTP/E44aK9tXsEsUMPBOypURTziaZF44ducOYQ
 8GRjL1VhQFm06dC1y0/m7eRd8U5dlAaZsl6cJDkqTqooc1RlQjOLUoExNaIAnHH70Bqp
 Zf9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmFL3j64uwU9ay62G/LcneV00RHuDdPcI3lOlhZs8Az/vCEhiLQh8YpLDYX9Oe85KAqyWI8vvNwQA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ8F3xSYuCWPxaGz0KQZwcD23eIAYWBTy2cOfxta0euyqlNyWZ
 F7r2NKokp9jor7hVl3Im6gzJMVKRH1G9Hkn310J2qQx4tbsxKkxWv+taaqXumApT+d89RnOIUIr
 uZhgYFVBUBP+8yWre7IwkagaBE0F0Nab1kFLv0mrviEGzIyHU1GX4+LogxzAdjEH2t6MjpduktQ
 ==
X-Gm-Gg: ASbGnctLPaSkqOLOi72pkQaTYtan1iKTLrHbJhK1qEQvFVRXizBaixeOA5RC4D8p4HL
 tVhLCURYM63LOtq5BWLSnodVpwwtzPgdPiZ8VS50w+8+joIlKHZJ/BgY5D4DYwJ8OPIChZlCP0A
 GKput4Rbu5+hG9ajhBfwqRTnjyfWdZtmOyKQ6MlMFwdkk9n2J28H4Ia55hhxqUsHGJ+29Luh5pP
 lBFUJPpFYOczlxTPrk8qBSlZt09O+zyWTKAAQ8YarZe++9Jm3A/hcSpIEVvXm3XVJE2mSSBdyG/
 xSdY9B73dLVxNZCEy48n
X-Received: by 2002:a05:600c:1383:b0:434:fddf:5c0c with SMTP id
 5b1f17b1804b1-4366835c41emr532162265e9.4.1736251818177; 
 Tue, 07 Jan 2025 04:10:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaEVKykGayKxjCcnFhLfiFnBT0aIWPfOLkE/TLP3kDUAksggrPgs4KuE0CtMmzWnKAhXVicQ==
X-Received: by 2002:a05:600c:1383:b0:434:fddf:5c0c with SMTP id
 5b1f17b1804b1-4366835c41emr532161965e9.4.1736251817744; 
 Tue, 07 Jan 2025 04:10:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea3e0sm602528715e9.7.2025.01.07.04.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 04:10:17 -0800 (PST)
Message-ID: <8e175713-2762-4767-86c6-fe0c0b7e8cf2@redhat.com>
Date: Tue, 7 Jan 2025 13:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 10/12] drm/{i915,xe}: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20241212170913.185939-1-tzimmermann@suse.de>
 <20241212170913.185939-11-tzimmermann@suse.de>
In-Reply-To: <20241212170913.185939-11-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6xceL-_DLnCOArdk1Azc8EzSMGyTA2g1tQ8yv7P6DXQ_1736251819
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/12/2024 18:08, Thomas Zimmermann wrote:
> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and remove the old fb_probe callback. Provide an initializer macro
> that sets the callback in struct drm_driver according to the kernel
> configuration. Call drm_client_setup_with_color_mode() to run the
> kernel's default client setup for DRM.
> 
> This commit also prepares support for the kernel's drm_log client
> (or any future client) in i915. Using drm_log will also require vmap
> support in GEM objects.

I've tested this series on an Alderlake laptop, and it effectively 
breaks the boot with drm_log on i915. (I can still see the drm_log on 
simpledrm, but when it switches to i915, I get a blackscreen, and the 
laptop hard freezes).
Can we wait to have the proper vmap support in GEM objects, before 
merging this series?
Or at least prevent drm_log to load on i915, until it is fixed?

Best regards,

-- 

Jocelyn

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   .../gpu/drm/i915/display/intel_display_core.h |   1 -
>   drivers/gpu/drm/i915/display/intel_fbdev.c    | 194 +-----------------
>   drivers/gpu/drm/i915/display/intel_fbdev.h    |  17 +-
>   drivers/gpu/drm/i915/i915_driver.c            |   3 +
>   drivers/gpu/drm/xe/display/xe_display.c       |   5 +
>   5 files changed, 21 insertions(+), 199 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> index 554870d2494b..674913d6c11d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -386,7 +386,6 @@ struct intel_display {
>   	struct {
>   		/* list of fbdev register on this device */
>   		struct intel_fbdev *fbdev;
> -		struct work_struct suspend_work;
>   	} fbdev;
>   
>   	struct {
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index f5dc96a9f86d..de726a9c33c5 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -37,6 +37,7 @@
>   #include <linux/tty.h>
>   #include <linux/vga_switcheroo.h>
>   
> +#include <drm/clients/drm_client_setup.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_crtc_helper.h>
>   #include <drm/drm_fb_helper.h>
> @@ -54,9 +55,6 @@
>   #include "intel_fbdev_fb.h"
>   #include "intel_frontbuffer.h"
>   
> -static int intelfb_create(struct drm_fb_helper *helper,
> -			  struct drm_fb_helper_surface_size *sizes);
> -
>   struct intel_fbdev {
>   	struct intel_framebuffer *fb;
>   	struct i915_vma *vma;
> @@ -201,14 +199,13 @@ static void intelfb_set_suspend(struct drm_fb_helper *fb_helper, bool suspend)
>   }
>   
>   static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
> -	.fb_probe = intelfb_create,
>   	.fb_dirty = intelfb_dirty,
>   	.fb_restore = intelfb_restore,
>   	.fb_set_suspend = intelfb_set_suspend,
>   };
>   
> -static int intelfb_create(struct drm_fb_helper *helper,
> -			  struct drm_fb_helper_surface_size *sizes)
> +int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
> +				   struct drm_fb_helper_surface_size *sizes)
>   {
>   	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
>   	struct intel_framebuffer *fb = ifbdev->fb;
> @@ -272,6 +269,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>   		goto out_unpin;
>   	}
>   
> +	helper->funcs = &intel_fb_helper_funcs;
>   	helper->fb = &fb->base;
>   
>   	info->fbops = &intelfb_ops;
> @@ -480,174 +478,11 @@ static unsigned int intel_fbdev_color_mode(const struct drm_format_info *info)
>   	}
>   }
>   
> -static void intel_fbdev_suspend_worker(struct work_struct *work)
> -{
> -	intel_fbdev_set_suspend(&container_of(work,
> -					      struct drm_i915_private,
> -					      display.fbdev.suspend_work)->drm,
> -				FBINFO_STATE_RUNNING,
> -				true);
> -}
> -
> -void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous)
> -{
> -	struct drm_i915_private *dev_priv = to_i915(dev);
> -	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
> -
> -	if (!ifbdev)
> -		return;
> -
> -	if (drm_WARN_ON(&dev_priv->drm, !HAS_DISPLAY(dev_priv)))
> -		return;
> -
> -	if (!ifbdev->vma)
> -		return;
> -
> -	if (synchronous) {
> -		/* Flush any pending work to turn the console on, and then
> -		 * wait to turn it off. It must be synchronous as we are
> -		 * about to suspend or unload the driver.
> -		 *
> -		 * Note that from within the work-handler, we cannot flush
> -		 * ourselves, so only flush outstanding work upon suspend!
> -		 */
> -		if (state != FBINFO_STATE_RUNNING)
> -			flush_work(&dev_priv->display.fbdev.suspend_work);
> -
> -		console_lock();
> -	} else {
> -		/*
> -		 * The console lock can be pretty contented on resume due
> -		 * to all the printk activity.  Try to keep it out of the hot
> -		 * path of resume if possible.
> -		 */
> -		drm_WARN_ON(dev, state != FBINFO_STATE_RUNNING);
> -		if (!console_trylock()) {
> -			/* Don't block our own workqueue as this can
> -			 * be run in parallel with other i915.ko tasks.
> -			 */
> -			queue_work(dev_priv->unordered_wq,
> -				   &dev_priv->display.fbdev.suspend_work);
> -			return;
> -		}
> -	}
> -
> -	drm_fb_helper_set_suspend(dev->fb_helper, state);
> -	console_unlock();
> -}
> -
> -static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
> -{
> -	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
> -	struct drm_device *dev = &dev_priv->drm;
> -	int ret;
> -
> -	if (!ifbdev)
> -		return -EINVAL;
> -
> -	if (!ifbdev->vma)
> -		return -ENOMEM;
> -
> -	ret = drm_fb_helper_restore_fbdev_mode_unlocked(dev->fb_helper);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -/*
> - * Fbdev client and struct drm_client_funcs
> - */
> -
> -static void intel_fbdev_client_unregister(struct drm_client_dev *client)
> -{
> -	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> -	struct drm_device *dev = fb_helper->dev;
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -
> -	if (fb_helper->info) {
> -		vga_switcheroo_client_fb_set(pdev, NULL);
> -		drm_fb_helper_unregister_info(fb_helper);
> -	} else {
> -		drm_fb_helper_unprepare(fb_helper);
> -		drm_client_release(&fb_helper->client);
> -		kfree(fb_helper);
> -	}
> -}
> -
> -static int intel_fbdev_client_restore(struct drm_client_dev *client)
> -{
> -	struct drm_i915_private *dev_priv = to_i915(client->dev);
> -	int ret;
> -
> -	ret = intel_fbdev_restore_mode(dev_priv);
> -	if (ret)
> -		return ret;
> -
> -	vga_switcheroo_process_delayed_switch();
> -
> -	return 0;
> -}
> -
> -static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
> -{
> -	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> -	struct drm_device *dev = client->dev;
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	int ret;
> -
> -	if (dev->fb_helper)
> -		return drm_fb_helper_hotplug_event(dev->fb_helper);
> -
> -	ret = drm_fb_helper_init(dev, fb_helper);
> -	if (ret)
> -		goto err_drm_err;
> -
> -	ret = drm_fb_helper_initial_config(fb_helper);
> -	if (ret)
> -		goto err_drm_fb_helper_fini;
> -
> -	vga_switcheroo_client_fb_set(pdev, fb_helper->info);
> -
> -	return 0;
> -
> -err_drm_fb_helper_fini:
> -	drm_fb_helper_fini(fb_helper);
> -err_drm_err:
> -	drm_err(dev, "Failed to setup i915 fbdev emulation (ret=%d)\n", ret);
> -	return ret;
> -}
> -
> -static int intel_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
> -{
> -	intel_fbdev_set_suspend(client->dev, FBINFO_STATE_SUSPENDED, true);
> -
> -	return 0;
> -}
> -
> -static int intel_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
> -{
> -	intel_fbdev_set_suspend(client->dev, FBINFO_STATE_RUNNING, false);
> -
> -	return 0;
> -}
> -
> -static const struct drm_client_funcs intel_fbdev_client_funcs = {
> -	.owner		= THIS_MODULE,
> -	.unregister	= intel_fbdev_client_unregister,
> -	.restore	= intel_fbdev_client_restore,
> -	.hotplug	= intel_fbdev_client_hotplug,
> -	.suspend	= intel_fbdev_client_suspend,
> -	.resume		= intel_fbdev_client_resume,
> -};
> -
>   void intel_fbdev_setup(struct drm_i915_private *i915)
>   {
>   	struct drm_device *dev = &i915->drm;
>   	struct intel_fbdev *ifbdev;
> -	struct drm_fb_helper *fb_helper;
>   	unsigned int preferred_bpp = 0;
> -	int ret;
>   
>   	if (!HAS_DISPLAY(i915))
>   		return;
> @@ -657,31 +492,12 @@ void intel_fbdev_setup(struct drm_i915_private *i915)
>   		return;
>   
>   	i915->display.fbdev.fbdev = ifbdev;
> -	INIT_WORK(&i915->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
>   	if (intel_fbdev_init_bios(dev, ifbdev))
>   		preferred_bpp = intel_fbdev_color_mode(ifbdev->fb->base.format);
>   	if (!preferred_bpp)
>   		preferred_bpp = 32;
>   
> -	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> -	if (!fb_helper)
> -		return;
> -	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &intel_fb_helper_funcs);
> -
> -	ret = drm_client_init(dev, &fb_helper->client, "intel-fbdev",
> -			      &intel_fbdev_client_funcs);
> -	if (ret) {
> -		drm_err(dev, "Failed to register client: %d\n", ret);
> -		goto err_drm_fb_helper_unprepare;
> -	}
> -
> -	drm_client_register(&fb_helper->client);
> -
> -	return;
> -
> -err_drm_fb_helper_unprepare:
> -	drm_fb_helper_unprepare(dev->fb_helper);
> -	kfree(fb_helper);
> +	drm_client_setup_with_color_mode(dev, preferred_bpp);
>   }
>   
>   struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
> index 08de2d5b3433..b2ca1fe3c9ae 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.h
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
> @@ -6,26 +6,25 @@
>   #ifndef __INTEL_FBDEV_H__
>   #define __INTEL_FBDEV_H__
>   
> -#include <linux/types.h>
> -
> -struct drm_device;
> +struct drm_fb_helper;
> +struct drm_fb_helper_surface_size;
>   struct drm_i915_private;
>   struct intel_fbdev;
>   struct intel_framebuffer;
>   
>   #ifdef CONFIG_DRM_FBDEV_EMULATION
> +int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
> +				   struct drm_fb_helper_surface_size *sizes);
> +#define INTEL_FBDEV_DRIVER_OPS \
> +	.fbdev_probe = intel_fbdev_driver_fbdev_probe
>   void intel_fbdev_setup(struct drm_i915_private *dev_priv);
> -void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous);
>   struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev);
>   #else
> +#define INTEL_FBDEV_DRIVER_OPS \
> +	.fbdev_probe = NULL
>   static inline void intel_fbdev_setup(struct drm_i915_private *dev_priv)
>   {
>   }
> -
> -static inline void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous)
> -{
> -}
> -
>   static inline struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
>   {
>   	return NULL;
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index e385e4947a91..1029bf8509b7 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -57,6 +57,7 @@
>   #include "display/intel_dp.h"
>   #include "display/intel_dpt.h"
>   #include "display/intel_encoder.h"
> +#include "display/intel_fbdev.h"
>   #include "display/intel_hotplug.h"
>   #include "display/intel_overlay.h"
>   #include "display/intel_pch_refclk.h"
> @@ -1798,6 +1799,8 @@ static const struct drm_driver i915_drm_driver = {
>   	.dumb_create = i915_gem_dumb_create,
>   	.dumb_map_offset = i915_gem_dumb_mmap_offset,
>   
> +	INTEL_FBDEV_DRIVER_OPS,
> +
>   	.ioctls = i915_ioctls,
>   	.num_ioctls = ARRAY_SIZE(i915_ioctls),
>   	.fops = &i915_driver_fops,
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index bc73c9999c57..03554cf4894a 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -27,6 +27,7 @@
>   #include "intel_dmc_wl.h"
>   #include "intel_dp.h"
>   #include "intel_encoder.h"
> +#include "intel_fbdev.h"
>   #include "intel_hdcp.h"
>   #include "intel_hotplug.h"
>   #include "intel_opregion.h"
> @@ -67,6 +68,10 @@ void xe_display_driver_set_hooks(struct drm_driver *driver)
>   	if (!xe_modparam.probe_display)
>   		return;
>   
> +#ifdef CONFIG_DRM_FBDEV_EMULATION
> +	driver->fbdev_probe = intel_fbdev_driver_fbdev_probe;
> +#endif
> +
>   	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
>   }
>   

