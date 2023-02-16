Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E2699345
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9BD10E16B;
	Thu, 16 Feb 2023 11:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699FC10E16B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:38:00 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r28so1082772wra.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 03:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RppuH7t9CsNPlS7I6axVGf0uTubUGr36ppo0ZJdaFLM=;
 b=CMQiS8cCgdjQt4JWiSl3Nbbi7YckonhLYEAEMG8DDO5FHI+yBXxL7HTxulOHuGqC1r
 ob0o/in+PXwT4wzhZ2Ewxl0jkA9nVBh38eaRY0k8lAc36T0aUS1/xTcsP+tgrvjKowrS
 JkPTRAICunJpRvl73NmwK+olV9AlEzNDgb1kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RppuH7t9CsNPlS7I6axVGf0uTubUGr36ppo0ZJdaFLM=;
 b=7rvzC98n93pkoh1xxVxlZ/LmQb7Kc0DIleuWwRmKRiwPq2ySurDTljWtCgRvrl3zDV
 lx1xyBN4/HyDlB0K5k3wbQejul4UEtlMmjJoluLs76+/bbnjiHPgb01n24+MAhweWWxl
 BOZws3thCCpJI9jA2+KpCJ1fVFCiXLVon4JJwHC42O8AkEAAIm2IcNGa36Ea1RicdGXc
 bstK/wfCYBeHMUIJxC4717J74MKlcH5evLQ5Pee94JiOffcUB9DByMp7tupcH0H7wBhK
 Ujsg2K4xqpJAfYIzfHhzIRIrG40L6wf4BaF2cVZghZgMDrHAIUJ7qhmOaU6NBq82w7JW
 2Vhw==
X-Gm-Message-State: AO0yUKWnKjvYv24kLzptnjJY8qv39zWsKT1/Wq/sWkZ5zhX+j3bppxTm
 kyjyQAR/sSwTDEDZ63POkNHG6MNsY4S9ckvS
X-Google-Smtp-Source: AK7set/FMcH7iFNgpcuo2fyYqDmjDeFyU1XlLL7Nq+A0dDtkeaJ899ODlzmnEjfkTbuL0/QmzA9Q5w==
X-Received: by 2002:adf:cf0c:0:b0:2c5:5fdc:26d2 with SMTP id
 o12-20020adfcf0c000000b002c55fdc26d2mr3125381wrj.6.1676547478862; 
 Thu, 16 Feb 2023 03:37:58 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 x16-20020a5d60d0000000b002c5640f9bf9sm1261198wrt.85.2023.02.16.03.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 03:37:58 -0800 (PST)
Date: Thu, 16 Feb 2023 12:37:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <Y+4Vjn1HRAw4UGp8@phenom.ffwll.local>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
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

On Thu, Feb 16, 2023 at 12:33:08PM +0100, Daniel Vetter wrote:
> On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
> > The mutex was completely pointless in the first place since any
> > parallel adding of files to this list would result in random
> > behavior since the list is filled and consumed multiple times.
> > 
> > Completely drop that approach and just create the files directly.
> > 
> > This also re-adds the debugfs files to the render node directory and
> > removes drm_debugfs_late_register().
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >  drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
> >  drivers/gpu/drm/drm_drv.c         |  3 ---
> >  drivers/gpu/drm/drm_internal.h    |  5 -----
> >  drivers/gpu/drm/drm_mode_config.c |  2 --
> >  include/drm/drm_device.h          | 15 ---------------
> >  5 files changed, 7 insertions(+), 50 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> > index 558e3a7271a5..a40288e67264 100644
> > --- a/drivers/gpu/drm/drm_debugfs.c
> > +++ b/drivers/gpu/drm/drm_debugfs.c
> > @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
> >  void drm_debugfs_minor_register(struct drm_minor *minor)
> >  {
> >  	struct drm_device *dev = minor->dev;
> > -	struct drm_debugfs_entry *entry, *tmp;
> >  
> >  	if (dev->driver->debugfs_init)
> >  		dev->driver->debugfs_init(minor);
> > -
> > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> > -		debugfs_create_file(entry->file.name, 0444,
> > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> > -		list_del(&entry->list);
> > -	}
> > -}
> > -
> > -void drm_debugfs_late_register(struct drm_device *dev)
> > -{
> > -	struct drm_minor *minor = dev->primary;
> > -	struct drm_debugfs_entry *entry, *tmp;
> > -
> > -	if (!minor)
> > -		return;
> > -
> > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> > -		debugfs_create_file(entry->file.name, 0444,
> > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> > -		list_del(&entry->list);
> > -	}
> >  }
> >  
> >  int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
> > @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> >  	entry->file.data = data;
> >  	entry->dev = dev;
> >  
> > -	mutex_lock(&dev->debugfs_mutex);
> > -	list_add(&entry->list, &dev->debugfs_list);
> > -	mutex_unlock(&dev->debugfs_mutex);
> > +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
> > +			    &drm_debugfs_entry_fops);
> > +
> > +	/* TODO: This should probably only be a symlink */
> > +	if (dev->render)
> > +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
> > +				    entry, &drm_debugfs_entry_fops);
> 
> Nope. You are fundamentally missing the point of all this, which is:
> 
> - drivers create debugfs files whenever they want to, as long as it's
>   _before_ drm_dev_register is called.
> 
> - drm_dev_register will set them all up.
> 
> This is necessary because otherwise you have the potential for some nice
> oops and stuff when userspace tries to access these files before the
> driver is ready.
> 
> Note that with sysfs all this infrastructure already exists, which is why
> you can create sysfs files whenever you feel like, and things wont go
> boom.
> 
> So yeah we need the list.
> 
> This also means that we really should not create the debugfs directories
> _before_ drm_dev_register is called. That's just fundamentally not how
> device interface setup should work:
> 
> 1. you allocate stucts and stuff
> 2. you fully init everything
> 3. you register interfaces so they become userspace visible

What I forgot to add: The mutex seems surplus and could probably be
removed. But we need the mutex once this infra is extracted to other drm
things like connector/crtc debugfs files, because you can hotplug
connectors. But maybe the mutex isn't even need in that case (since for a
single object you still should not multi-thread anything).

So removing the mutex here seems like a reasonable thing to do, but
funamentally the list and the entire delayed debugfs setup must stay.
Otherwise we cannot remove the entire debugfs_init midlayer mess without
creating huge amounts of driver bugs in the init sequencing.
-Daniel


> -Daniel
> 
> >  }
> >  EXPORT_SYMBOL(drm_debugfs_add_file);
> >  
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 2cbe028e548c..e7b88b65866c 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
> >  	mutex_destroy(&dev->clientlist_mutex);
> >  	mutex_destroy(&dev->filelist_mutex);
> >  	mutex_destroy(&dev->struct_mutex);
> > -	mutex_destroy(&dev->debugfs_mutex);
> >  	drm_legacy_destroy_members(dev);
> >  }
> >  
> > @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
> >  	INIT_LIST_HEAD(&dev->filelist_internal);
> >  	INIT_LIST_HEAD(&dev->clientlist);
> >  	INIT_LIST_HEAD(&dev->vblank_event_list);
> > -	INIT_LIST_HEAD(&dev->debugfs_list);
> >  
> >  	spin_lock_init(&dev->event_lock);
> >  	mutex_init(&dev->struct_mutex);
> >  	mutex_init(&dev->filelist_mutex);
> >  	mutex_init(&dev->clientlist_mutex);
> >  	mutex_init(&dev->master_mutex);
> > -	mutex_init(&dev->debugfs_mutex);
> >  
> >  	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
> >  	if (ret)
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index 5ff7bf88f162..e215d00ba65c 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -188,7 +188,6 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> >  void drm_debugfs_dev_register(struct drm_device *dev);
> >  void drm_debugfs_minor_register(struct drm_minor *minor);
> >  void drm_debugfs_cleanup(struct drm_minor *minor);
> > -void drm_debugfs_late_register(struct drm_device *dev);
> >  void drm_debugfs_connector_add(struct drm_connector *connector);
> >  void drm_debugfs_connector_remove(struct drm_connector *connector);
> >  void drm_debugfs_crtc_add(struct drm_crtc *crtc);
> > @@ -205,10 +204,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
> >  {
> >  }
> >  
> > -static inline void drm_debugfs_late_register(struct drm_device *dev)
> > -{
> > -}
> > -
> >  static inline void drm_debugfs_connector_add(struct drm_connector *connector)
> >  {
> >  }
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > index 87eb591fe9b5..8525ef851540 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
> >  	if (ret)
> >  		goto err_connector;
> >  
> > -	drm_debugfs_late_register(dev);
> > -
> >  	return 0;
> >  
> >  err_connector:
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index 7cf4afae2e79..900ad7478dd8 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -311,21 +311,6 @@ struct drm_device {
> >  	 */
> >  	struct drm_fb_helper *fb_helper;
> >  
> > -	/**
> > -	 * @debugfs_mutex:
> > -	 *
> > -	 * Protects &debugfs_list access.
> > -	 */
> > -	struct mutex debugfs_mutex;
> > -
> > -	/**
> > -	 * @debugfs_list:
> > -	 *
> > -	 * List of debugfs files to be created by the DRM device. The files
> > -	 * must be added during drm_dev_register().
> > -	 */
> > -	struct list_head debugfs_list;
> > -
> >  	/* Everything below here is for legacy driver, never use! */
> >  	/* private: */
> >  #if IS_ENABLED(CONFIG_DRM_LEGACY)
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
