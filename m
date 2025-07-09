Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8CEAFE9E2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78BA10E7E7;
	Wed,  9 Jul 2025 13:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BGLUDw4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5F510E7E7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:17:34 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so63610135e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752067053; x=1752671853; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=41nH3ZYXkmOSwj9fUOzLSTH4G+DxQEbU3aRTRzK139w=;
 b=BGLUDw4fsSH42tp76m6q+602t3/tfr/h48XIAJavDEJSK1RIDYTzsL38ExnKs32p1T
 aJif0o5YnvrUlV52NfIK/stxzt0VETbGrIDZeSn1zyaceeHTOqnWA+z+pYjjY95HTFQ4
 3xqNoxW9MhIpHPiERb9bE8OMsmIWO5X810kRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752067053; x=1752671853;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=41nH3ZYXkmOSwj9fUOzLSTH4G+DxQEbU3aRTRzK139w=;
 b=jYEoYSts0iq8KTd1mZEgEq84xMp7FsqdzjTuDyDBXe/+WibjrsuqRIge1O48VFTQuX
 ZEk+99o8bzoEjXb8Y+zLC3rirsL5PJd353aSn6caD5sNpjgBzcsu1z2aJpKufYZn1MDj
 rVLU1w7HBqUhYykm7Rl428pKa6KT6vro0QfTUFXTfiL9zbDdycYNYMpe5CqcBDqqJDkV
 q0oyTqRPiQHxGDLkAKDgWCzZTFLX8OlLo9EQYcuYpsHgbM/oFOS7wXrpLFstFp8dxcC5
 6RnmofFHZSIlKw9/aYTTvxjxfSLkOGzNrj5/Fr8GxwjvH+YMSY0EZXhlkFz5TlVM50Az
 T2HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjU8gZg937IHP1L6JghVyN2PNiBVF5BtTMDbm3eLm7PiPy1nBPXz/bknKz/zdrbj8zKroc5WikfNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk4TLH5V//J7P1TfzOm2huuXBLRFaREnYxPC0W/ve4y+Hsdg+v
 7ri2+0GmmQjlSgyEotuEXh3Vob8SCRipjuHqCGwGUxnxcSUCbr6aN1ncO3ebx2rQ1y8=
X-Gm-Gg: ASbGncvxV8xS6AgW22H5TbxkuA2D7H4RaCDRFkxIfZmmoelXZcGCREcYFmT+VdFty4F
 zYK/wtmxPvRmHkF773WkYNWGp2whrnw3cJzVF2eLqwyN+i1CkF4mJ9fyOlCSBV4EhOPIu1i6Aeh
 qGw431gjswEVylHieoeJAqjWwHorp722EFllPHt5pONxnlKP9Rv+m6G2gjLUGwQaQOWPX1egAxg
 wo82QfNgL+Vw5+Dx85gi1ngT4jGBnbTNbZD4SKOakxkSZ/Kb/FOdK3GO8HC/7zAXJ7enA+AkpAD
 IIhg3z5qyidOV26/lSCrGflTCe+inqTUeu06GWFLmmlQ4Cpno3TlkexrL6d/0lWSID0uBQG0xw=
 =
X-Google-Smtp-Source: AGHT+IHwzjonsLh25g8atnPod6IqpfYUoVRx2cvbnTNKel16+ulWFujc96KLbYMRqsJV5foy6pEAlg==
X-Received: by 2002:a05:6000:26c3:b0:3a4:e629:6504 with SMTP id
 ffacd0b85a97d-3b5e456013amr2153889f8f.49.1752067052201; 
 Wed, 09 Jul 2025 06:17:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5037f8asm22942425e9.5.2025.07.09.06.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 06:17:31 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:17:29 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Xe Development <intel-xe@lists.freedesktop.org>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH 2/2] drm/panthor: Fix UAF in
 panthor_gem_create_with_handle() debugfs code
Message-ID: <aG5r6UIAzZ6PI1kU@phenom.ffwll.local>
References: <20250707151814.603897-1-simona.vetter@ffwll.ch>
 <20250707151814.603897-2-simona.vetter@ffwll.ch>
 <aGzjA0bunrqwf6Pp@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGzjA0bunrqwf6Pp@e110455-lin.cambridge.arm.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Tue, Jul 08, 2025 at 10:21:07AM +0100, Liviu Dudau wrote:
> Hi Simona,
> 
> On Mon, Jul 07, 2025 at 05:18:14PM +0200, Simona Vetter wrote:
> > The object is potentially already gone after the drm_gem_object_put().
> > In general the object should be fully constructed before calling
> > drm_gem_handle_create(), except the debugfs tracking uses a separate
> > lock and list and separate flag to denotate whether the object is
> > actually initilized.
> > 
> > Since I'm touching this all anyway simplify this by only adding the
> > object to the debugfs when it's ready for that, which allows us to
> > delete that separate flag. panthor_gem_debugfs_bo_rm() already checks
> > whether we've actually been added to the list or this is some error
> > path cleanup.
> 
> Thanks for the cleanup, just minor nits.
> 
> > 
> > v2: Fix build issues for !CONFIG_DEBUGFS (Adrián)
> > 
> > Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> > Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> > Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gem.c | 34 ++++++++++++++-------------
> >  drivers/gpu/drm/panthor/panthor_gem.h |  3 ---
> >  2 files changed, 18 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 7c00fd77758b..8232f91f3bf7 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -16,10 +16,14 @@
> >  #include "panthor_mmu.h"
> >  
> >  #ifdef CONFIG_DEBUG_FS
> > -static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> > -				       struct panthor_gem_object *bo)
> > +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
> >  {
> >  	INIT_LIST_HEAD(&bo->debugfs.node);
> > +}
> 
> Would be nice to have an empty line here separating the functions.
> 
> > +static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> > +{
> > +	struct panthor_device *ptdev = container_of(bo->base.base.dev,
> > +						    struct panthor_device, base);
> >  
> >  	bo->debugfs.creator.tgid = current->group_leader->pid;
> >  	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
> > @@ -44,14 +48,13 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
> >  
> >  static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
> >  {
> > -	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> > +	bo->debugfs.flags = usage_flags;
> > +	panthor_gem_debugfs_bo_add(bo);
> >  }
> >  #else
> > -static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> > -				       struct panthor_gem_object *bo)
> > -{}
> >  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> >  static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
> > +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
> >  #endif
> >  
> >  static void panthor_gem_free_object(struct drm_gem_object *obj)
> > @@ -246,7 +249,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
> >  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
> >  	mutex_init(&obj->label.lock);
> >  
> > -	panthor_gem_debugfs_bo_add(ptdev, obj);
> > +	panthor_gem_debugfs_bo_init(obj);
> >  
> >  	return &obj->base.base;
> >  }
> > @@ -285,6 +288,12 @@ panthor_gem_create_with_handle(struct drm_file *file,
> >  		bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
> >  	}
> >  
> > +	/*
> > +	 * No explicit flags are needed in the call below, since the
> > +	 * function internally sets the INITIALIZED bit for us.
> > +	 */
> 
> This comment is no longer needed (or not in this form).
> 
> > +	panthor_gem_debugfs_set_usage_flags(bo, 0);
> > +
> >  	/*
> >  	 * Allocate an id of idr table where the obj is registered
> >  	 * and handle has the id what user can see.
> > @@ -296,12 +305,6 @@ panthor_gem_create_with_handle(struct drm_file *file,
> >  	/* drop reference from allocate - handle holds it now. */
> >  	drm_gem_object_put(&shmem->base);
> >  
> > -	/*
> > -	 * No explicit flags are needed in the call below, since the
> > -	 * function internally sets the INITIALIZED bit for us.
> > -	 */
> > -	panthor_gem_debugfs_set_usage_flags(bo, 0);
> > -
> >  	return ret;
> >  }
> >  
> > @@ -387,7 +390,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
> >  	unsigned int refcount = kref_read(&bo->base.base.refcount);
> >  	char creator_info[32] = {};
> >  	size_t resident_size;
> > -	u32 gem_usage_flags = bo->debugfs.flags & (u32)~PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> > +	u32 gem_usage_flags = bo->debugfs.flags;
> >  	u32 gem_state_flags = 0;
> >  
> >  	/* Skip BOs being destroyed. */
> > @@ -436,8 +439,7 @@ void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
> >  
> >  	scoped_guard(mutex, &ptdev->gems.lock) {
> >  		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
> > -			if (bo->debugfs.flags & PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED)
> > -				panthor_gem_debugfs_bo_print(bo, m, &totals);
> > +			panthor_gem_debugfs_bo_print(bo, m, &totals);
> >  		}
> >  	}
> >  
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> > index 4dd732dcd59f..8fc7215e9b90 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.h
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> > @@ -35,9 +35,6 @@ enum panthor_debugfs_gem_usage_flags {
> >  
> >  	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED: BO is mapped on the FW VM. */
> >  	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED = BIT(PANTHOR_DEBUGFS_GEM_USAGE_FW_MAPPED_BIT),
> > -
> > -	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED: BO is ready for DebugFS display. */
> > -	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED = BIT(31),
> >  };
> >  
> >  /**
> > -- 
> > 2.49.0
> >
> 
> Otherwise, patch looks good to me!
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the review, will resend.
-Sima

> 
> Best regards,
> Liviu
> 
> 
> -- 
> ====================
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     ¯\_(ツ)_/¯

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
