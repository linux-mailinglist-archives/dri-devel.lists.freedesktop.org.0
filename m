Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B0A68F6C4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 19:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A8910E05C;
	Wed,  8 Feb 2023 18:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A4D10E05C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:19:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m8so21649556edd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 10:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cLcXf+eD3HBhyMLfz8YM8We2Va91mqTLE5XmnjVXfJI=;
 b=iTeiz8tGuJfOwDrM66L/OVlyj1dRpD7pYxgXHAXg2XvYGmkhM/ThjGgx2DohbfbquX
 ESE9Gebkrg/mQXkEq1Za7O5VGxNjjQRoTaonkHtRz8MA9TGs0PZs0fS0WyAPsejHKEJB
 p3NKz/1ujd4kzw9DLlTRKF6l0sB8EObyHrzwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cLcXf+eD3HBhyMLfz8YM8We2Va91mqTLE5XmnjVXfJI=;
 b=MEZLWqMEjAuTSBmPa9oISCNrZi8CE+Q4FPwpMkOxYm5XoZebbi0PB85TbdejIL6PXw
 QjXlbYA3+PjsjDMvwAdctZ34UkQx03gDdhFV2zEHpcK7p/uIp84tioiogP2zSNqTZ+xu
 A0bN6yTZLgAH0qQVcxmbYAOWj5CIjC5aHrCQVB4Gz++MREsNTBWzQwoB1pFOORKrEVqB
 7ES/ecbwsQR0zZjE4PfQ/nNN++VloakOTTkQMCfuTvRSvhEEKVJ10n7C8rGJSQW3PAys
 EdIH4Ox43IAvJc1DKZDkT1AcZz53Asc5kzczlvMC0qJLd9+Nk401T3cio1C+h/o1ZhxU
 Gj3w==
X-Gm-Message-State: AO0yUKUVjK9G4X47XaaGd2BJAuTDWxIf2GfNoPy8wpDX6ZX+hcXzsk8S
 /oRKqI3RvC4F5ZVLO3dDi9bsXw==
X-Google-Smtp-Source: AK7set/+W6SnJFbwOngjPgNY81AsE+Vs/tvEVTmaAEGnAw1vXwWJV70LRtN8nfOhZQKfJhFN20xZyg==
X-Received: by 2002:a05:6402:5205:b0:4aa:a501:9bce with SMTP id
 s5-20020a056402520500b004aaa5019bcemr10523293edd.0.1675880358138; 
 Wed, 08 Feb 2023 10:19:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h23-20020aa7c957000000b00487fc51c532sm8219032edt.33.2023.02.08.10.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 10:19:17 -0800 (PST)
Date: Wed, 8 Feb 2023 19:19:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3 1/6] drm/debugfs: Introduce wrapper for debugfs list
Message-ID: <Y+Pno+ZG3gv6lwDT@phenom.ffwll.local>
References: <20230131195825.677487-1-mcanal@igalia.com>
 <20230131195825.677487-2-mcanal@igalia.com>
 <Y+Pkm3ORQAipa/iD@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+Pkm3ORQAipa/iD@phenom.ffwll.local>
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 08, 2023 at 07:06:19PM +0100, Daniel Vetter wrote:
> On Tue, Jan 31, 2023 at 04:58:21PM -0300, Maíra Canal wrote:
> > Introduce a struct wrapper for all the debugfs-related stuff: the list
> > of debugfs files and the mutex that protects it. This will make it
> > easier to initialize all the debugfs list in a DRM object and will
> > create a good abstraction for a possible implementation of the debugfs
> > infrastructure for KMS objects.
> > 
> > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > ---
> >  drivers/gpu/drm/drm_debugfs.c  | 18 ++++++++++++++++++
> >  drivers/gpu/drm/drm_internal.h | 12 ++++++++++++
> >  include/drm/drm_debugfs.h      | 16 ++++++++++++++++
> >  3 files changed, 46 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> > index 4f643a490dc3..8658d3929ea5 100644
> > --- a/drivers/gpu/drm/drm_debugfs.c
> > +++ b/drivers/gpu/drm/drm_debugfs.c
> > @@ -218,6 +218,24 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
> >  }
> >  EXPORT_SYMBOL(drm_debugfs_create_files);
> >  
> > +struct drm_debugfs_files *drm_debugfs_files_init(void)
> > +{
> > +	struct drm_debugfs_files *debugfs_files;
> > +
> > +	debugfs_files = kzalloc(sizeof(*debugfs_files), GFP_KERNEL);
> > +
> > +	INIT_LIST_HEAD(&debugfs_files->list);
> > +	mutex_init(&debugfs_files->mutex);
> > +
> > +	return debugfs_files;
> > +}
> > +
> > +void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files)
> > +{
> > +	mutex_destroy(&debugfs_files->mutex);
> > +	kfree(debugfs_files);
> > +}
> > +
> >  int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> >  		     struct dentry *root)
> >  {
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index ed2103ee272c..f1c8766ed828 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -23,6 +23,7 @@
> >  
> >  #include <linux/kthread.h>
> >  
> > +#include <drm/drm_debugfs.h>
> >  #include <drm/drm_ioctl.h>
> >  #include <drm/drm_vblank.h>
> >  
> > @@ -183,6 +184,8 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
> >  
> >  /* drm_debugfs.c drm_debugfs_crc.c */
> >  #if defined(CONFIG_DEBUG_FS)
> > +struct drm_debugfs_files *drm_debugfs_files_init(void);
> > +void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files);
> >  int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> >  		     struct dentry *root);
> >  void drm_debugfs_cleanup(struct drm_minor *minor);
> > @@ -193,6 +196,15 @@ void drm_debugfs_crtc_add(struct drm_crtc *crtc);
> >  void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
> >  void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
> >  #else
> > +static inline struct drm_debugfs_files *drm_debugfs_files_init(void)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static inline void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files)
> > +{
> > +}
> > +
> >  static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> >  				   struct dentry *root)
> >  {
> > diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> > index 7616f457ce70..423aa3de506a 100644
> > --- a/include/drm/drm_debugfs.h
> > +++ b/include/drm/drm_debugfs.h
> > @@ -32,6 +32,8 @@
> >  #ifndef _DRM_DEBUGFS_H_
> >  #define _DRM_DEBUGFS_H_
> >  
> > +#include <linux/list.h>
> > +#include <linux/mutex.h>
> >  #include <linux/types.h>
> >  #include <linux/seq_file.h>
> >  /**
> > @@ -79,6 +81,20 @@ struct drm_info_node {
> >  	struct dentry *dent;
> >  };
> >  
> > +/**
> > + * struct drm_debugfs_files - Encapsulates the debugfs list and its mutex
> > + *
> > + * This structure represents the debugfs list of files and is encapsulated
> > + * with a mutex to protect the access of the list.
> > + */
> > +struct drm_debugfs_files {
> > +	/** @list: List of debugfs files to be created by the DRM object. */
> > +	struct list_head list;
> > +
> > +	/** @mutex: Protects &list access. */
> > +	struct mutex mutex;
> 
> I'm not seeing any use for the mutex here? Also unless you also plan to
> put like the debugfs directory pointers in this struct, I'm not sure we
> need this abstraction since it's purely internal to debugfs code (so also
> should really be in the headers where drivers could perhaps come up with
> funny ideas).

To clarify, I think any struct or code which is potentially type unsafe,
like this one here or the drm_debugfs_entry one, should be moved into
drm_debugfs.c. That way drivers do not ever see the potentially dangerous
pieces, and only have a type-safe interface for everything.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
