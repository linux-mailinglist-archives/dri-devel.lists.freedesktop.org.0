Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9228B01A75
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 13:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE6910E042;
	Fri, 11 Jul 2025 11:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="b/5MZG1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9236310E042
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:22:19 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-453643020bdso15185005e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752232938; x=1752837738; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WSZK2Iixe1rMLHZShReAs/1ul3nsWyDlpH+GAJ+K3sc=;
 b=b/5MZG1i+lcnJRPx3LnEEQkqQBAMYNpEzstNRFhhhbzyDqY0BRyEBJ6+b8B5tS86kH
 eCDHOSihAHTgsMZhB5KQ10dZnVco9+Hd1F01irwCLLjBOdW53u1J4pPUST/kdWmqnEs9
 4y8hQwrxG0BOD6CNGr+stXYpxkQRwg/NvCJ0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752232938; x=1752837738;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WSZK2Iixe1rMLHZShReAs/1ul3nsWyDlpH+GAJ+K3sc=;
 b=lpiXVDwkF6Lfo15/ynIlCUd7otxlAT7kYrZ14bGWPlDBp7bBgz8eiYe9CNn6yGsIQS
 iIaMhVrSZbpVV2WDkgBX4onWnUIG40AmUZadQqYNIGZ0ZOFVLkEGGh1NOXFL8a53mLly
 K4Nagw4SPEejWTaGfhreb+20f7LM1BhC00Q5+TgCA2qJJXkpfFxx+8zkDMQsuBXlPsfa
 Oftx8nD1t7gwmxVj/gpdmZTwfoXhrbWtKNegxD2qnDtgInrRJ6oVCDc3bj63RjwLEKNH
 U7cJ8Ww57TC5fhAXo02eElqlfHBjn42wUcW4XO+eIdbNI5BXgMeE14HOi6+laEPV3JfA
 vEyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0Y3mtL0RKEpK31Z7MDu8D6E5wiV5wmUC2ceugirJzxej+nQFzXCAVpdsqaLk5mMayfBcC5JeQcCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGlosxjxN+iUaeboOXNRHIEW2RhJLQLojudXal1rl9AE+yJvZw
 LwANKO9CFsfH/e3WTK5Kef3a9rgUQL5RIRJnzj/RJbndEcaV7wp0Or9pjropfG1ZWgM=
X-Gm-Gg: ASbGncudIfS4NXZnOjNgqIaqnskSHsL+XBLR19dv2WtIjcRBfgSqRuE2kJlLPHIwu24
 SiUjabGwYHjok7fQevRHnHFuNKqGJUt3K4EjJQ5sLIqLRbVU21y4XuZws7cvnoxhBB2qeKhYAcw
 VBrN6KvuLDpjX7Y+bhIrYDbUoiC/y+3b2wLeNyrSb/40OilrDPMLHFvVohJOF7MfMocvmFORing
 ekJujCPYbfEtMx0wtSTG+jIKnPrjeAolEmgwvK4bueRFqApxbUomaheFbz7qSvnWpYkWbxtjEaX
 bQINFIrp4UURVhSYisf8vYTdj++vkAFaQTNi74ZJJyyWm01HCYfovvo6UBIPhYUsUEiBDr/KzEJ
 1Gfkuez2YA5bV1XW4ZWkwe26m+nZjgYxixQ==
X-Google-Smtp-Source: AGHT+IE5TItSXlf23oGbeyF4FaewGhF6yASU2LBkMEVSD2Q3b8XSKVVW/JglscVyYaFi0JUlwl6z9A==
X-Received: by 2002:a05:600c:3514:b0:442:d9f2:ded8 with SMTP id
 5b1f17b1804b1-454f42873cdmr26738135e9.15.1752232937592; 
 Fri, 11 Jul 2025 04:22:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26f45sm4214889f8f.92.2025.07.11.04.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 04:22:17 -0700 (PDT)
Date: Fri, 11 Jul 2025 13:22:15 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, torvalds@linux-foundation.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/9] Revert "drm/gem: Acquire references on GEM handles
 for framebuffers"
Message-ID: <aHDz59OYxwZzDrsG@phenom.ffwll.local>
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <20250711093744.120962-3-tzimmermann@suse.de>
 <aHDimRgOz3VPMw0I@phenom.ffwll.local>
 <f46837f2-bb04-4113-8d82-1701a4d45ac3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f46837f2-bb04-4113-8d82-1701a4d45ac3@amd.com>
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

On Fri, Jul 11, 2025 at 01:00:03PM +0200, Christian König wrote:
> On 11.07.25 12:08, Simona Vetter wrote:
> > On Fri, Jul 11, 2025 at 11:35:17AM +0200, Thomas Zimmermann wrote:
> >> This reverts commit 5307dce878d4126e1b375587318955bd019c3741.
> >>
> >> We're going to revert the dma-buf handle back to separating dma_buf
> >> and import_attach->dmabuf in struct drm_gem_object. Hence revert this
> >> fix for it.
> > 
> > I think we should add my reasons from the private thread here why I think
> > this is conceptually wrong:
> > 
> > handle_count is an uapi reference, and should have nothing to do with the
> > lifetime and consistency of the underlying gem_bo.
> 
> The problem is that we tied the lifetime of the DMA-buf reference to the
> handle count and I think that is not 100% clean.
> 
> The reason why that was done is to break the circle dependency GEM obj
> -> DMA-buf -> GEM obj, but what potentially should actually happen is
> that we distinct between a structure reference and an use count.
> 
> E.g. similar to what is done with mm_struct and mmgrab()/mmdrop() vs
> mmget()/mmput().

Yeah, I think I'm following. The issue I see here is that I think we're
free-wheeling, dont' have enough testcases, and break existing stuff way
too much. So back to square one, start over, probably with a lot of
kerneldoc patches first and more igt and kunit tests to hit all these
issues we've (re-)discovered.

> > And for imported bo the
> > link to the dma-buf really should be invariant, and hence
> > drm_gem_object_get/put() enough. The fact that this patch seems to have
> > helped at least in some cases indicates that our assumption that we can
> > replace gem_bo->import_attach.dmabuf with gem_bo->dma_buf was wrong,
> > because pretty obviously the latter can become NULL while the gem_bo is
> > still alive. Which means this was conceptually wrong and at best helped
> > hide a race condition somewhere.
> > 
> > This means that unlike the claim in the reverted commit that 1a148af06000
> > ("drm/gem-shmem: Use dma_buf from GEM object instance") started triggering
> > an existing condition the much more likely explanation is that it
> > introduced the regression itself. And hence we need to revert this entire
> > chain of commits.
> 
> The existing condition is still a problem I think. We ran into issues with that multiple times already.
> 
> Just imagine the following scenario:
> 1. GEM obj is exported, DMA-buf file descriptor created
> 2. GEM obj is used in a FB.
> 3. GEM obj is closed, handle_count goes from 1->0, DMA-buf reference is dropped, but file descriptor remains open, obj->dma_buf set to NULL
> 4. Userspace calls DRM_IOCTL_MODE_GETFB2, handle count goes 0->1 again, but obj->dma_buf is still NULL!
> 5. GEM obj is exported again, second DMA-buf is created.
> 
> The first time I stumbled over that it took me a week to figure out why
> we can have two DMA-bufs for the same GEM obj.  Especially you can
> trigger the "WARN_ON(obj->dma_buf != dma_buf);" in
> drm_gem_prime_fd_to_handle() with this.
> 
> For my particular use case it was just a broken unit test, but it allows
> userspace to mess up the kernel objects quite a bit and that is really
> not good.

Yeah that's not good, but I think something we should sort out with adding
testcases first and figuring out fixes in -next, not in late -rc kernels.
I think the minimal fix for this corner case would be to add a flag to
gem_bo that they've had GETFB/2 called on them, and in that case disable
that WARN_ON and just quietly bail out instead. Userspace gets to keep the
pieces.

I'm not sure whether making the entire lifetime stuff even more
complicated by elevating handle_count to a more general usage count is the
right approach.

Cheers, Sima

> 
> Regards,
> Christian.
> 
> > 
> > I'll also add all the Fixes: lines as needed when merging these to
> > drm-fixes, since some of the patches reverted in this series have landed
> > in 6.15 already.
> > 
> > I plan to merge them all to drm-fixes once intel-gfx-ci has approved it
> > all.
> > 
> > Thanks, Sima
> > 
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/drm_gem.c                    | 44 ++------------------
> >>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++---
> >>  drivers/gpu/drm/drm_internal.h               |  2 -
> >>  3 files changed, 11 insertions(+), 51 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> >> index 3a99e4a5d303..db44c40e307f 100644
> >> --- a/drivers/gpu/drm/drm_gem.c
> >> +++ b/drivers/gpu/drm/drm_gem.c
> >> @@ -213,35 +213,6 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
> >>  }
> >>  EXPORT_SYMBOL(drm_gem_private_object_fini);
> >>  
> >> -static void drm_gem_object_handle_get(struct drm_gem_object *obj)
> >> -{
> >> -	struct drm_device *dev = obj->dev;
> >> -
> >> -	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
> >> -
> >> -	if (obj->handle_count++ == 0)
> >> -		drm_gem_object_get(obj);
> >> -}
> >> -
> >> -/**
> >> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> >> - * @obj: GEM object
> >> - *
> >> - * Acquires a reference on the GEM buffer object's handle. Required
> >> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> >> - * to release the reference.
> >> - */
> >> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> >> -{
> >> -	struct drm_device *dev = obj->dev;
> >> -
> >> -	guard(mutex)(&dev->object_name_lock);
> >> -
> >> -	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
> >> -	drm_gem_object_handle_get(obj);
> >> -}
> >> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
> >> -
> >>  /**
> >>   * drm_gem_object_handle_free - release resources bound to userspace handles
> >>   * @obj: GEM object to clean up.
> >> @@ -272,14 +243,8 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
> >>  	}
> >>  }
> >>  
> >> -/**
> >> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> >> - * @obj: GEM object
> >> - *
> >> - * Releases a reference on the GEM buffer object's handle. Possibly releases
> >> - * the GEM buffer object and associated dma-buf objects.
> >> - */
> >> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> >> +static void
> >> +drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> >>  {
> >>  	struct drm_device *dev = obj->dev;
> >>  	bool final = false;
> >> @@ -304,7 +269,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> >>  	if (final)
> >>  		drm_gem_object_put(obj);
> >>  }
> >> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
> >>  
> >>  /*
> >>   * Called at device or object close to release the file's
> >> @@ -429,8 +393,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
> >>  	int ret;
> >>  
> >>  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
> >> -
> >> -	drm_gem_object_handle_get(obj);
> >> +	if (obj->handle_count++ == 0)
> >> +		drm_gem_object_get(obj);
> >>  
> >>  	/*
> >>  	 * Get the user-visible handle using idr.  Preload and perform
> >> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> >> index c60d0044d036..618ce725cd75 100644
> >> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> >> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
> >>  	unsigned int i;
> >>  
> >>  	for (i = 0; i < fb->format->num_planes; i++)
> >> -		drm_gem_object_handle_put_unlocked(fb->obj[i]);
> >> +		drm_gem_object_put(fb->obj[i]);
> >>  
> >>  	drm_framebuffer_cleanup(fb);
> >>  	kfree(fb);
> >> @@ -183,10 +183,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
> >>  		if (!objs[i]) {
> >>  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
> >>  			ret = -ENOENT;
> >> -			goto err_gem_object_handle_put_unlocked;
> >> +			goto err_gem_object_put;
> >>  		}
> >> -		drm_gem_object_handle_get_unlocked(objs[i]);
> >> -		drm_gem_object_put(objs[i]);
> >>  
> >>  		min_size = (height - 1) * mode_cmd->pitches[i]
> >>  			 + drm_format_info_min_pitch(info, i, width)
> >> @@ -196,22 +194,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
> >>  			drm_dbg_kms(dev,
> >>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
> >>  				    objs[i]->size, min_size, i);
> >> -			drm_gem_object_handle_put_unlocked(objs[i]);
> >> +			drm_gem_object_put(objs[i]);
> >>  			ret = -EINVAL;
> >> -			goto err_gem_object_handle_put_unlocked;
> >> +			goto err_gem_object_put;
> >>  		}
> >>  	}
> >>  
> >>  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
> >>  	if (ret)
> >> -		goto err_gem_object_handle_put_unlocked;
> >> +		goto err_gem_object_put;
> >>  
> >>  	return 0;
> >>  
> >> -err_gem_object_handle_put_unlocked:
> >> +err_gem_object_put:
> >>  	while (i > 0) {
> >>  		--i;
> >> -		drm_gem_object_handle_put_unlocked(objs[i]);
> >> +		drm_gem_object_put(objs[i]);
> >>  	}
> >>  	return ret;
> >>  }
> >> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> >> index f921cc73f8b8..9078504e789c 100644
> >> --- a/drivers/gpu/drm/drm_internal.h
> >> +++ b/drivers/gpu/drm/drm_internal.h
> >> @@ -161,8 +161,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
> >>  
> >>  /* drm_gem.c */
> >>  int drm_gem_init(struct drm_device *dev);
> >> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> >> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
> >>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
> >>  			       struct drm_gem_object *obj,
> >>  			       u32 *handlep);
> >> -- 
> >> 2.50.0
> >>
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
