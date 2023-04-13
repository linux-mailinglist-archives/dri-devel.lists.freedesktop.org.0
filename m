Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C426E0F1C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 15:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90AC10EB0C;
	Thu, 13 Apr 2023 13:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD5210EB0A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 13:45:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f0a72c78feso1273385e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681393556; x=1683985556;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dtVxXHnKpM/OnMDDKht+awEPvNb/GbXE8uKmOpu/FfE=;
 b=CCOexn8LqLioJaqaK5aqPYKTo/GOevUtMX/QSc03x7kEU+QuRX8KoLsHpUefgHpg1t
 8boDz5pAcofdSBaxstwYidnmt+bkWxVpZVs1JV2IWfzzgpskgKdci9r2JMjhKMuGA7dB
 o5Ut/pZxgb8opXpjXN2rq9HC2GG/fZfB8KDS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681393556; x=1683985556;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dtVxXHnKpM/OnMDDKht+awEPvNb/GbXE8uKmOpu/FfE=;
 b=cYC4vQ6QlfJsTwxPMWE5ZJDTliwuvIj8OIbaO0CgNxAfo8Fu1TaT/NPxlVt59f/RtC
 XP0nofuAORWKNBWIKRqOgdDptM+N81isF9Mbk0Zh8Z2q3ouXxWc1xJ6CjqDxIxsTkEZ2
 WneMnY5pjHO650RXBdZJmISpZ0n+it4Evu0pdlVKYRKYnqF0f4FdFk0LIx7DPTyqLg+q
 p5JxqGj+sWUGdtnA4r0Dim0Ix2H7obn2uHwfaaM08WodzYL0QOcUqumVX0DQvU4H/BGB
 tBQMMLQmxJ+MWa4vA7a1XGJdB/VtOj+ot/y7tZTh/afJQcQQJ3xwQst8camd0gG2Yhm4
 WkXg==
X-Gm-Message-State: AAQBX9fWLFJ8dSlLO5F7WkGX+6SJ++1/kFhbsJa5AwM+a5F2+/fBmXlA
 GpW5Rj3n8I82eVX9NV9YsJ5MxQ==
X-Google-Smtp-Source: AKy350aVx71m2u02fFWwNBTP33M4cHmUro0NErrgcp6dbD8N15fbG/eiueKACpRDxQwoyYQ/kaP7dA==
X-Received: by 2002:adf:fccd:0:b0:2d2:9c19:f75 with SMTP id
 f13-20020adffccd000000b002d29c190f75mr1257962wrs.1.1681393556474; 
 Thu, 13 Apr 2023 06:45:56 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 k3-20020a5d6e83000000b002ef72575473sm1314473wrz.117.2023.04.13.06.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 06:45:56 -0700 (PDT)
Date: Thu, 13 Apr 2023 15:45:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/5] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex v2
Message-ID: <ZDgHkup7+7T9ZEhc@phenom.ffwll.local>
References: <20230412145206.2483-1-christian.koenig@amd.com>
 <20230412145206.2483-4-christian.koenig@amd.com>
 <ZDbKKq6wlxhhrFyy@phenom.ffwll.local>
 <b9a30452-8f3a-ce58-348c-cef32b27bb8a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9a30452-8f3a-ce58-348c-cef32b27bb8a@gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org, ogabbay@kernel.org,
 mcanal@igalia.com, mwen@igalia.com, stanislaw.gruszka@linux.intel.com,
 maxime@cerno.tech, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 11:34:45AM +0200, Christian König wrote:
> Am 12.04.23 um 17:11 schrieb Daniel Vetter:
> > On Wed, Apr 12, 2023 at 04:52:04PM +0200, Christian König wrote:
> > > The mutex was completely pointless in the first place since any
> > > parallel adding of files to this list would result in random
> > > behavior since the list is filled and consumed multiple times.
> > > 
> > > Completely drop that approach and just create the files directly but
> > > return -ENODEV while opening the file when the minors are not
> > > registered yet.
> > This part seems to be missing?
> 
> I wanted to move this into a separate patch and then forgot to add it. Going
> to fix that.
> 
> > The other issue is that partial driver load cleanup now goes boom I think,
> > you need to both remove them all in _unregister but also in final drm_dev
> > cleanup. Or I'm missing how this works. Maybe you could also use drmm_ for
> > that to make sure it's always done.
> 
> Good point. Should we call the cleanup function from both the unregister and
> the final drm_dev cleanup or just the later?

I think both:
- unregister to make sure userspace can't access the files when the driver
  is unloading, because the _remove() is the only thing that actually
  synchronizes with parallel read/write() and waits for those to finish.
  Really don't want to hand-roll that, it's a lot more tricky than the
  "are we registered already" check :-)

- As cleanup for the case we never registered, and hence
  drm_dev_unregister wont be called.

I guess if you make both the exact same function and that unconditionally
(any checks needed within that function) it hopefully aviods the
not-registered error path from bitrotting.
-Daniel


> 
> Thanks,
> Christian.
> 
> > 
> > There shouldn't be a race as long as the "are we registered yet" check is
> > there, since in that case the driver never registered. So no problems
> > trying to access the files when they could try to access things which are
> > already cleaned up.
> > 
> > I think with those details ironed out this makes some sense to me,
> > assuming I understood it correctly.
> > 
> > > v2: rebase on debugfs directory rework, limit access before minors are
> > >      registered.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/gpu/drm/drm_debugfs.c     | 27 ++-------------------------
> > >   drivers/gpu/drm/drm_drv.c         |  3 ---
> > >   drivers/gpu/drm/drm_internal.h    |  5 -----
> > >   drivers/gpu/drm/drm_mode_config.c |  2 --
> > >   include/drm/drm_device.h          | 15 ---------------
> > >   5 files changed, 2 insertions(+), 50 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> > > index 59c3d76d28f4..427c5eb4eca0 100644
> > > --- a/drivers/gpu/drm/drm_debugfs.c
> > > +++ b/drivers/gpu/drm/drm_debugfs.c
> > > @@ -245,7 +245,6 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> > >   			 struct dentry *root)
> > >   {
> > >   	struct drm_device *dev = minor->dev;
> > > -	struct drm_debugfs_entry *entry, *tmp;
> > >   	char name[64];
> > >   	INIT_LIST_HEAD(&minor->debugfs_list);
> > > @@ -260,30 +259,9 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> > >   	if (dev->driver->debugfs_init && dev->render != minor)
> > >   		dev->driver->debugfs_init(minor);
> > > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> > > -		debugfs_create_file(entry->file.name, 0444,
> > > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> > > -		list_del(&entry->list);
> > > -	}
> > > -
> > >   	return 0;
> > >   }
> > > -void drm_debugfs_late_register(struct drm_device *dev)
> > > -{
> > > -	struct drm_minor *minor = dev->primary;
> > > -	struct drm_debugfs_entry *entry, *tmp;
> > > -
> > > -	if (!minor)
> > > -		return;
> > > -
> > > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> > > -		debugfs_create_file(entry->file.name, 0444,
> > > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> > > -		list_del(&entry->list);
> > > -	}
> > > -}
> > > -
> > >   int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
> > >   			     struct drm_minor *minor)
> > >   {
> > > @@ -353,9 +331,8 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> > >   	entry->file.data = data;
> > >   	entry->dev = dev;
> > > -	mutex_lock(&dev->debugfs_mutex);
> > > -	list_add(&entry->list, &dev->debugfs_list);
> > > -	mutex_unlock(&dev->debugfs_mutex);
> > > +	debugfs_create_file(name, 0444, dev->debugfs_root, entry,
> > > +			    &drm_debugfs_entry_fops);
> > >   }
> > >   EXPORT_SYMBOL(drm_debugfs_add_file);
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 05b831f9fe71..f928b4490ece 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
> > >   	mutex_destroy(&dev->clientlist_mutex);
> > >   	mutex_destroy(&dev->filelist_mutex);
> > >   	mutex_destroy(&dev->struct_mutex);
> > > -	mutex_destroy(&dev->debugfs_mutex);
> > >   	drm_legacy_destroy_members(dev);
> > >   }
> > > @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
> > >   	INIT_LIST_HEAD(&dev->filelist_internal);
> > >   	INIT_LIST_HEAD(&dev->clientlist);
> > >   	INIT_LIST_HEAD(&dev->vblank_event_list);
> > > -	INIT_LIST_HEAD(&dev->debugfs_list);
> > >   	spin_lock_init(&dev->event_lock);
> > >   	mutex_init(&dev->struct_mutex);
> > >   	mutex_init(&dev->filelist_mutex);
> > >   	mutex_init(&dev->clientlist_mutex);
> > >   	mutex_init(&dev->master_mutex);
> > > -	mutex_init(&dev->debugfs_mutex);
> > >   	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
> > >   	if (ret)
> > > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > > index 5c6e1cadf09b..c5fadbd3fd7d 100644
> > > --- a/drivers/gpu/drm/drm_internal.h
> > > +++ b/drivers/gpu/drm/drm_internal.h
> > > @@ -185,7 +185,6 @@ void drm_debugfs_dev_register(struct drm_device *dev);
> > >   int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> > >   			 struct dentry *root);
> > >   void drm_debugfs_cleanup(struct drm_minor *minor);
> > > -void drm_debugfs_late_register(struct drm_device *dev);
> > >   void drm_debugfs_connector_add(struct drm_connector *connector);
> > >   void drm_debugfs_connector_remove(struct drm_connector *connector);
> > >   void drm_debugfs_crtc_add(struct drm_crtc *crtc);
> > > @@ -206,10 +205,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
> > >   {
> > >   }
> > > -static inline void drm_debugfs_late_register(struct drm_device *dev)
> > > -{
> > > -}
> > > -
> > >   static inline void drm_debugfs_connector_add(struct drm_connector *connector)
> > >   {
> > >   }
> > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > index 87eb591fe9b5..8525ef851540 100644
> > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
> > >   	if (ret)
> > >   		goto err_connector;
> > > -	drm_debugfs_late_register(dev);
> > > -
> > >   	return 0;
> > >   err_connector:
> > > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > > index 3cf12b14232d..c490977ee250 100644
> > > --- a/include/drm/drm_device.h
> > > +++ b/include/drm/drm_device.h
> > > @@ -318,21 +318,6 @@ struct drm_device {
> > >   	 */
> > >   	struct dentry *debugfs_root;
> > > -	/**
> > > -	 * @debugfs_mutex:
> > > -	 *
> > > -	 * Protects &debugfs_list access.
> > > -	 */
> > > -	struct mutex debugfs_mutex;
> > > -
> > > -	/**
> > > -	 * @debugfs_list:
> > > -	 *
> > > -	 * List of debugfs files to be created by the DRM device. The files
> > > -	 * must be added during drm_dev_register().
> > > -	 */
> > > -	struct list_head debugfs_list;
> > > -
> > >   	/* Everything below here is for legacy driver, never use! */
> > >   	/* private: */
> > >   #if IS_ENABLED(CONFIG_DRM_LEGACY)
> > > -- 
> > > 2.34.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
