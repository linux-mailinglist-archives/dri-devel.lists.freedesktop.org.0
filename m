Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB6A699326
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63E010ED2E;
	Thu, 16 Feb 2023 11:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA8410ED2E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:33:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id y1so1550792wru.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QCq/69jlv/KLc6spXaEfcope+QwKS3F8HsEDqgH25HA=;
 b=FQiebf6r6ZFuOPGk72p1VQ6OogUrdeUtUsOT2uKDjqxzjDoUtCd7ESDBCYKZ6Tu92O
 lF7v7aeUYPt56sx/XUQuOXWyID9YEdtlpXSOHKXa/FbVo49EYLo9Y78qgimf8b+oM+O5
 YhVsaDztQQmHYJrjGQvtrvmX8mzzqYtclWeGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QCq/69jlv/KLc6spXaEfcope+QwKS3F8HsEDqgH25HA=;
 b=mYmOgrrxvR3za9nt0/tP29GQ46Nye2F9FOpS997U/3WAAILyuivn08blA8WWB/2Mdo
 GFO9QslGwYQG6oNk8KVGTbaHPKuz6IU7uOlnMnhO2GOgRvJzjV0b/MVTgtn7C5lG8AOw
 KBgfnPqKWSrIHvWF4v8F8V+4LZkZQ9qYzF2xrdTLJS25+ChaSuuvpt18fqPw/Gg4grsE
 PyGWPPqiMUZ6fCP/4G7bEhREO2jnSyVMomfY7Gw6P+UNDc6bIIw6FOzSVSKD8ulO5bEg
 wAIPV6RD1Z10yYFlacwdPRQQ1ybZ9DEm8FbPhKnFvluI2PkEwAss0KrFYs6ntT0iSPkl
 rM0A==
X-Gm-Message-State: AO0yUKUYR63B7o4tqGapIy1Gfj121c9ojG8bZHWMP5Hav/X8Jnt1GNLB
 gL2jWEvkUirB+bmkoTKwDEkCXg==
X-Google-Smtp-Source: AK7set/6nrBOvLI94Se3GV2Cx/s3Qosq3UTl+Vw2XjUCqNHqw0v+C4MY4ryxHzcxGRc8MPQW9mN5Mg==
X-Received: by 2002:a5d:4a8e:0:b0:2c5:8d4a:369c with SMTP id
 o14-20020a5d4a8e000000b002c58d4a369cmr781531wrq.1.1676547192654; 
 Thu, 16 Feb 2023 03:33:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b002c5503a8d21sm1271561wrv.70.2023.02.16.03.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 03:33:12 -0800 (PST)
Date: Thu, 16 Feb 2023 12:33:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230209081838.45273-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: daniel.vetter@ffwll.ch, mcanal@igalia.com, dri-devel@lists.freedesktop.org,
 mwen@igalia.com, mairacanal@riseup.net, maxime@cerno.tech,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
> The mutex was completely pointless in the first place since any
> parallel adding of files to this list would result in random
> behavior since the list is filled and consumed multiple times.
> 
> Completely drop that approach and just create the files directly.
> 
> This also re-adds the debugfs files to the render node directory and
> removes drm_debugfs_late_register().
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
>  drivers/gpu/drm/drm_drv.c         |  3 ---
>  drivers/gpu/drm/drm_internal.h    |  5 -----
>  drivers/gpu/drm/drm_mode_config.c |  2 --
>  include/drm/drm_device.h          | 15 ---------------
>  5 files changed, 7 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 558e3a7271a5..a40288e67264 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>  void drm_debugfs_minor_register(struct drm_minor *minor)
>  {
>  	struct drm_device *dev = minor->dev;
> -	struct drm_debugfs_entry *entry, *tmp;
>  
>  	if (dev->driver->debugfs_init)
>  		dev->driver->debugfs_init(minor);
> -
> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> -		debugfs_create_file(entry->file.name, 0444,
> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> -		list_del(&entry->list);
> -	}
> -}
> -
> -void drm_debugfs_late_register(struct drm_device *dev)
> -{
> -	struct drm_minor *minor = dev->primary;
> -	struct drm_debugfs_entry *entry, *tmp;
> -
> -	if (!minor)
> -		return;
> -
> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> -		debugfs_create_file(entry->file.name, 0444,
> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> -		list_del(&entry->list);
> -	}
>  }
>  
>  int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
> @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>  	entry->file.data = data;
>  	entry->dev = dev;
>  
> -	mutex_lock(&dev->debugfs_mutex);
> -	list_add(&entry->list, &dev->debugfs_list);
> -	mutex_unlock(&dev->debugfs_mutex);
> +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
> +			    &drm_debugfs_entry_fops);
> +
> +	/* TODO: This should probably only be a symlink */
> +	if (dev->render)
> +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
> +				    entry, &drm_debugfs_entry_fops);

Nope. You are fundamentally missing the point of all this, which is:

- drivers create debugfs files whenever they want to, as long as it's
  _before_ drm_dev_register is called.

- drm_dev_register will set them all up.

This is necessary because otherwise you have the potential for some nice
oops and stuff when userspace tries to access these files before the
driver is ready.

Note that with sysfs all this infrastructure already exists, which is why
you can create sysfs files whenever you feel like, and things wont go
boom.

So yeah we need the list.

This also means that we really should not create the debugfs directories
_before_ drm_dev_register is called. That's just fundamentally not how
device interface setup should work:

1. you allocate stucts and stuff
2. you fully init everything
3. you register interfaces so they become userspace visible
-Daniel

>  }
>  EXPORT_SYMBOL(drm_debugfs_add_file);
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 2cbe028e548c..e7b88b65866c 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  	mutex_destroy(&dev->clientlist_mutex);
>  	mutex_destroy(&dev->filelist_mutex);
>  	mutex_destroy(&dev->struct_mutex);
> -	mutex_destroy(&dev->debugfs_mutex);
>  	drm_legacy_destroy_members(dev);
>  }
>  
> @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&dev->filelist_internal);
>  	INIT_LIST_HEAD(&dev->clientlist);
>  	INIT_LIST_HEAD(&dev->vblank_event_list);
> -	INIT_LIST_HEAD(&dev->debugfs_list);
>  
>  	spin_lock_init(&dev->event_lock);
>  	mutex_init(&dev->struct_mutex);
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> -	mutex_init(&dev->debugfs_mutex);
>  
>  	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 5ff7bf88f162..e215d00ba65c 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -188,7 +188,6 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  void drm_debugfs_dev_register(struct drm_device *dev);
>  void drm_debugfs_minor_register(struct drm_minor *minor);
>  void drm_debugfs_cleanup(struct drm_minor *minor);
> -void drm_debugfs_late_register(struct drm_device *dev);
>  void drm_debugfs_connector_add(struct drm_connector *connector);
>  void drm_debugfs_connector_remove(struct drm_connector *connector);
>  void drm_debugfs_crtc_add(struct drm_crtc *crtc);
> @@ -205,10 +204,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
>  {
>  }
>  
> -static inline void drm_debugfs_late_register(struct drm_device *dev)
> -{
> -}
> -
>  static inline void drm_debugfs_connector_add(struct drm_connector *connector)
>  {
>  }
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 87eb591fe9b5..8525ef851540 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
>  	if (ret)
>  		goto err_connector;
>  
> -	drm_debugfs_late_register(dev);
> -
>  	return 0;
>  
>  err_connector:
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 7cf4afae2e79..900ad7478dd8 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -311,21 +311,6 @@ struct drm_device {
>  	 */
>  	struct drm_fb_helper *fb_helper;
>  
> -	/**
> -	 * @debugfs_mutex:
> -	 *
> -	 * Protects &debugfs_list access.
> -	 */
> -	struct mutex debugfs_mutex;
> -
> -	/**
> -	 * @debugfs_list:
> -	 *
> -	 * List of debugfs files to be created by the DRM device. The files
> -	 * must be added during drm_dev_register().
> -	 */
> -	struct list_head debugfs_list;
> -
>  	/* Everything below here is for legacy driver, never use! */
>  	/* private: */
>  #if IS_ENABLED(CONFIG_DRM_LEGACY)
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
