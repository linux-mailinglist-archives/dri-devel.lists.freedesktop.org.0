Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFFE699D30
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 20:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B477F10E374;
	Thu, 16 Feb 2023 19:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C6D10E374
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 19:54:22 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 hg24-20020a05600c539800b003e1f5f2a29cso5060569wmb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mqkQ4ERDUNC1JfiMFWuCmHa8nRbTNT/QWab6RQm6510=;
 b=CbcCGW8h5f2uWXux7dr4RldatzF4eeMN3fyp+LepUaaTurdz/Nvf7+A0F4fDKOu16F
 RZkUkesa1RDddUw8jvdMsOnMKpv03geQVBMxaCKg6emBXtxifDZ0a/5dmlHGQXzr1Lx1
 1XHVqiPQFQVPjOKVhtGubHSIZ0EQpEnVaOj9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mqkQ4ERDUNC1JfiMFWuCmHa8nRbTNT/QWab6RQm6510=;
 b=oqz4Gtyh4061/72cMctoRO16Pwe+kB5j2knoYDgaJuwXeHMSlcer+CzkeDr80nazl/
 MYIcOZ5z1lTf7euZLBsmg2h/OsFKDIzbsvntGSOQ0FLY646pl0gINi72Fr1GakyGZBr4
 mxGlnpRsPCXqx2OkjOjqVe6fjWW1Xq9ulVk4AkdFLKQHrpT4D2PiDesJA+wO9I5npnc5
 Bk1VaXV0AQqEmDnSLxNCf58rftK3gD219uDr+qPqtKqeNcihnewNFF9Joc05ZoZAQHC9
 o2CsBMw9iIS8m50l7IE+2Q7QAwL3LipInF31PUO57XtumEqS6dsy8+85XXrho2aBeZZf
 1XxA==
X-Gm-Message-State: AO0yUKXgaoetMvmhZU+DSbw1Vsa4f/0+y690+qnRmSN8C3qc/Egskonu
 jjJKiZ36+iIK29jP2NmxzTBlMZwpcM/66BbL
X-Google-Smtp-Source: AK7set9g6a28hKZJsQdmJO7jX3g7HKEHZLI445kCs+IYV6xvsK89mK547tI/U0cefSrQdwFd4INttg==
X-Received: by 2002:a7b:c3cb:0:b0:3e2:dbb:5627 with SMTP id
 t11-20020a7bc3cb000000b003e20dbb5627mr3166580wmj.3.1676577260434; 
 Thu, 16 Feb 2023 11:54:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bi23-20020a05600c3d9700b003e200d3b2d1sm2758711wmb.38.2023.02.16.11.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 11:54:19 -0800 (PST)
Date: Thu, 16 Feb 2023 20:54:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <Y+6JyNNkLdDnxaer@phenom.ffwll.local>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <f555bda0-80b6-c0bc-566f-0ef49c96da0a@amd.com>
 <87sff5zhgs.fsf@intel.com>
 <694091b5-dca0-fff5-3dd5-548bfa8733fc@amd.com>
 <87ilg1zgf2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ilg1zgf2.fsf@intel.com>
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 07:08:49PM +0200, Jani Nikula wrote:
> On Thu, 16 Feb 2023, Christian König <christian.koenig@amd.com> wrote:
> > Am 16.02.23 um 17:46 schrieb Jani Nikula:
> >> On Thu, 16 Feb 2023, Christian König <christian.koenig@amd.com> wrote:
> >>> Am 16.02.23 um 12:33 schrieb Daniel Vetter:
> >>>> On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
> >>>>> The mutex was completely pointless in the first place since any
> >>>>> parallel adding of files to this list would result in random
> >>>>> behavior since the list is filled and consumed multiple times.
> >>>>>
> >>>>> Completely drop that approach and just create the files directly.
> >>>>>
> >>>>> This also re-adds the debugfs files to the render node directory and
> >>>>> removes drm_debugfs_late_register().
> >>>>>
> >>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
> >>>>> ---
> >>>>>    drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
> >>>>>    drivers/gpu/drm/drm_drv.c         |  3 ---
> >>>>>    drivers/gpu/drm/drm_internal.h    |  5 -----
> >>>>>    drivers/gpu/drm/drm_mode_config.c |  2 --
> >>>>>    include/drm/drm_device.h          | 15 ---------------
> >>>>>    5 files changed, 7 insertions(+), 50 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> >>>>> index 558e3a7271a5..a40288e67264 100644
> >>>>> --- a/drivers/gpu/drm/drm_debugfs.c
> >>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
> >>>>> @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
> >>>>>    void drm_debugfs_minor_register(struct drm_minor *minor)
> >>>>>    {
> >>>>>    	struct drm_device *dev = minor->dev;
> >>>>> -	struct drm_debugfs_entry *entry, *tmp;
> >>>>>    
> >>>>>    	if (dev->driver->debugfs_init)
> >>>>>    		dev->driver->debugfs_init(minor);
> >>>>> -
> >>>>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> >>>>> -		debugfs_create_file(entry->file.name, 0444,
> >>>>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> >>>>> -		list_del(&entry->list);
> >>>>> -	}
> >>>>> -}
> >>>>> -
> >>>>> -void drm_debugfs_late_register(struct drm_device *dev)
> >>>>> -{
> >>>>> -	struct drm_minor *minor = dev->primary;
> >>>>> -	struct drm_debugfs_entry *entry, *tmp;
> >>>>> -
> >>>>> -	if (!minor)
> >>>>> -		return;
> >>>>> -
> >>>>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> >>>>> -		debugfs_create_file(entry->file.name, 0444,
> >>>>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> >>>>> -		list_del(&entry->list);
> >>>>> -	}
> >>>>>    }
> >>>>>    
> >>>>>    int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
> >>>>> @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> >>>>>    	entry->file.data = data;
> >>>>>    	entry->dev = dev;
> >>>>>    
> >>>>> -	mutex_lock(&dev->debugfs_mutex);
> >>>>> -	list_add(&entry->list, &dev->debugfs_list);
> >>>>> -	mutex_unlock(&dev->debugfs_mutex);
> >>>>> +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
> >>>>> +			    &drm_debugfs_entry_fops);
> >>>>> +
> >>>>> +	/* TODO: This should probably only be a symlink */
> >>>>> +	if (dev->render)
> >>>>> +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
> >>>>> +				    entry, &drm_debugfs_entry_fops);
> >>>> Nope. You are fundamentally missing the point of all this, which is:
> >>>>
> >>>> - drivers create debugfs files whenever they want to, as long as it's
> >>>>     _before_ drm_dev_register is called.
> >>>>
> >>>> - drm_dev_register will set them all up.
> >>>>
> >>>> This is necessary because otherwise you have the potential for some nice
> >>>> oops and stuff when userspace tries to access these files before the
> >>>> driver is ready.
> >>>>
> >>>> Note that with sysfs all this infrastructure already exists, which is why
> >>>> you can create sysfs files whenever you feel like, and things wont go
> >>>> boom.
> >>> Well Yeah I've considered that, I just don't think it's a good idea for
> >>> debugfs.
> >>>
> >>> debugfs is meant to be a helper for debugging things and that especially
> >>> includes the time between drm_dev_init() and drm_dev_register() because
> >>> that's where we probe the hardware and try to get it working.
> >>>
> >>> Not having the debugfs files which allows for things like hardware
> >>> register access and reading internal state during that is a really and I
> >>> mean REALLY bad idea. This is essentially what we have those files for.
> >> So you mean you want to have early debugfs so you can have some script
> >> hammering the debugfs to get info out between init and register during
> >> probe?
> >
> > Well not hammering. What we usually do in bringup is to set firmware 
> > timeout to infinity and the driver then sits and waits for the hw.
> >
> > The tool used to access registers then goes directly through the PCI bar 
> > at the moment, but that's essentially a bad idea for registers which you 
> > grab a lock for to access (like index/data).
> >
> >>
> >> I just think registering debugfs before everything is ready is a recipe
> >> for disaster. All of the debugfs needs to check all the conditions that
> >> they need across all of the probe stages. It'll be difficult to get it
> >> right. And you'll get cargo culted checks copy pasted all over the
> >> place.
> >
> > Yeah, but it's debugfs. That is not supposed to work under all conditions.
> >
> > Just try to read amdgpu_regs on a not existing register index. This will 
> > just hang or reboot your box immediately on APUs.
> 
> I'm firmly in the camp that debugfs does not need to work under all
> conditions, but that it must fail gracefully instead of crashing.

Yeah I mean once we talk bring-up, you can just hand-roll the necessary
bring debugfs things that you need to work before the driver is ready to
do anything.

But bring-up debugfs fun is rather special, same way pre-silicon support
tends to be rather special. Shipping that in distros does not sound like a
good idea at all to me.
-Daniel

> 
> 
> BR,
> Jani.
> 
> 
> >
> > Regards,
> > Christian.
> >
> >>
> >>
> >> BR,
> >> Jani.
> >>
> >>
> >>>> So yeah we need the list.
> >>>>
> >>>> This also means that we really should not create the debugfs directories
> >>>> _before_ drm_dev_register is called. That's just fundamentally not how
> >>>> device interface setup should work:
> >>>>
> >>>> 1. you allocate stucts and stuff
> >>>> 2. you fully init everything
> >>>> 3. you register interfaces so they become userspace visible
> >>> How about we create the debugfs directory early and only delay the files
> >>> registered through this drm_debugfs interface until registration time?
> >>>
> >>> This way drivers can still decide if they want the files available
> >>> immediately or only after registration.
> >>>
> >>> What drivers currently do is like radeon setting an accel_working flag
> >>> and registering anyway even if halve the hardware doesn't work.
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>> -Daniel
> >>>>
> >>>>>    }
> >>>>>    EXPORT_SYMBOL(drm_debugfs_add_file);
> >>>>>    
> >>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> >>>>> index 2cbe028e548c..e7b88b65866c 100644
> >>>>> --- a/drivers/gpu/drm/drm_drv.c
> >>>>> +++ b/drivers/gpu/drm/drm_drv.c
> >>>>> @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
> >>>>>    	mutex_destroy(&dev->clientlist_mutex);
> >>>>>    	mutex_destroy(&dev->filelist_mutex);
> >>>>>    	mutex_destroy(&dev->struct_mutex);
> >>>>> -	mutex_destroy(&dev->debugfs_mutex);
> >>>>>    	drm_legacy_destroy_members(dev);
> >>>>>    }
> >>>>>    
> >>>>> @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
> >>>>>    	INIT_LIST_HEAD(&dev->filelist_internal);
> >>>>>    	INIT_LIST_HEAD(&dev->clientlist);
> >>>>>    	INIT_LIST_HEAD(&dev->vblank_event_list);
> >>>>> -	INIT_LIST_HEAD(&dev->debugfs_list);
> >>>>>    
> >>>>>    	spin_lock_init(&dev->event_lock);
> >>>>>    	mutex_init(&dev->struct_mutex);
> >>>>>    	mutex_init(&dev->filelist_mutex);
> >>>>>    	mutex_init(&dev->clientlist_mutex);
> >>>>>    	mutex_init(&dev->master_mutex);
> >>>>> -	mutex_init(&dev->debugfs_mutex);
> >>>>>    
> >>>>>    	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
> >>>>>    	if (ret)
> >>>>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> >>>>> index 5ff7bf88f162..e215d00ba65c 100644
> >>>>> --- a/drivers/gpu/drm/drm_internal.h
> >>>>> +++ b/drivers/gpu/drm/drm_internal.h
> >>>>> @@ -188,7 +188,6 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> >>>>>    void drm_debugfs_dev_register(struct drm_device *dev);
> >>>>>    void drm_debugfs_minor_register(struct drm_minor *minor);
> >>>>>    void drm_debugfs_cleanup(struct drm_minor *minor);
> >>>>> -void drm_debugfs_late_register(struct drm_device *dev);
> >>>>>    void drm_debugfs_connector_add(struct drm_connector *connector);
> >>>>>    void drm_debugfs_connector_remove(struct drm_connector *connector);
> >>>>>    void drm_debugfs_crtc_add(struct drm_crtc *crtc);
> >>>>> @@ -205,10 +204,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
> >>>>>    {
> >>>>>    }
> >>>>>    
> >>>>> -static inline void drm_debugfs_late_register(struct drm_device *dev)
> >>>>> -{
> >>>>> -}
> >>>>> -
> >>>>>    static inline void drm_debugfs_connector_add(struct drm_connector *connector)
> >>>>>    {
> >>>>>    }
> >>>>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> >>>>> index 87eb591fe9b5..8525ef851540 100644
> >>>>> --- a/drivers/gpu/drm/drm_mode_config.c
> >>>>> +++ b/drivers/gpu/drm/drm_mode_config.c
> >>>>> @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
> >>>>>    	if (ret)
> >>>>>    		goto err_connector;
> >>>>>    
> >>>>> -	drm_debugfs_late_register(dev);
> >>>>> -
> >>>>>    	return 0;
> >>>>>    
> >>>>>    err_connector:
> >>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> >>>>> index 7cf4afae2e79..900ad7478dd8 100644
> >>>>> --- a/include/drm/drm_device.h
> >>>>> +++ b/include/drm/drm_device.h
> >>>>> @@ -311,21 +311,6 @@ struct drm_device {
> >>>>>    	 */
> >>>>>    	struct drm_fb_helper *fb_helper;
> >>>>>    
> >>>>> -	/**
> >>>>> -	 * @debugfs_mutex:
> >>>>> -	 *
> >>>>> -	 * Protects &debugfs_list access.
> >>>>> -	 */
> >>>>> -	struct mutex debugfs_mutex;
> >>>>> -
> >>>>> -	/**
> >>>>> -	 * @debugfs_list:
> >>>>> -	 *
> >>>>> -	 * List of debugfs files to be created by the DRM device. The files
> >>>>> -	 * must be added during drm_dev_register().
> >>>>> -	 */
> >>>>> -	struct list_head debugfs_list;
> >>>>> -
> >>>>>    	/* Everything below here is for legacy driver, never use! */
> >>>>>    	/* private: */
> >>>>>    #if IS_ENABLED(CONFIG_DRM_LEGACY)
> >>>>> -- 
> >>>>> 2.34.1
> >>>>>
> >
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
