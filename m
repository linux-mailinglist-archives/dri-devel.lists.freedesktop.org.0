Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F1B05EB9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923410E5DE;
	Tue, 15 Jul 2025 13:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ETgk8aYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6469E10E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:56:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45619d70c72so14600435e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752587791; x=1753192591; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Hn+WuqRR1t5R9mQwZhl3jtziWMIfUg5J12SJufxMgDI=;
 b=ETgk8aYJG2L1TwBsnIkUYGkYQhYFXTHiKpH61rOfFj3aDHiVJkrzgypeh8a44cCZvH
 cqjvmOdpjcqC/AzIqOvXqiSEd/SKZ8+auelVRP8QT2dO/oPCnAEWa6q1yrZ0IKjfwr7c
 lPkJdRmccOTiSCMjfY9viToqHMKstTB4pBUWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752587791; x=1753192591;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hn+WuqRR1t5R9mQwZhl3jtziWMIfUg5J12SJufxMgDI=;
 b=wfVCYIGxrl1IG7+6q6g57Hd76h017Sz5F6Je+GXeppVlqmX5n5isg5Jp6l910PfQ1y
 CJwG7yXICcOuOkeSnzgs27BZHo6VXUtZ7OCVOskTGcshlDuAAQlr8UPIaqf9N5R7z6xN
 F/CSpCPRmrg1/KeKcgSPSW3WHAaaKmjFaJPIlDxJk0r16blc8Lpw2MuTtRYYW1Nnf2XJ
 LFPf7Nca5DTg2+CoRbSVfU6i9rWqxSkyfFqys+2/NO/akH/r00wp2muqscTrWFt+lSkI
 h1vbCbYUkJBz4seOC1Zf3Me9GRrudrISsGPQTOhQWiS4Z8UglM/PBkdC60ss1VUXVViX
 ho+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNtKhOTz9BeC3jmCjWKBLUUbqtYsHx1Pl0EzFwA4g+5r2CeG1TaFInEfK7Khwr3I4JxwZaO+l+Zto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV/wfILFaOGZ2HjfhxBn1VHJY8+dbSySS3sP82M7hEqf1wOcSW
 LOhDSljoNIN8jM4UP3XjNSj0VKT6bDehbmW/AQ/Eh9aQjXSruBurNouZxnI3CO1ZTRg=
X-Gm-Gg: ASbGncvOHfb4nIjZQ3ufjzv3U4hBHEZag/uDRV29oRyrUInh/p0c0AmLKlwdkwob3Um
 3T6pUWL6hZrJtgwQfTCxeDGawraRQW+nHHJiHQgRyf0qgRcpgSH1x1HMacHFeoFCUox9gRlomID
 kgIVitA0xfamUXXc5nzFJyMmD4oCVByHHOxv+Ja24eriP/CAGNt/w/y6p8fCJbwyPfWh+drZ3dc
 JmClyg3Cmt4xz7vw/uXolpHHMgdML9u14hkOpk/vwnM8UWxOPjQviZXQZ4sCxEA/qSkz45wrz4y
 bDS3fM0H3/YCF+JyS238drDpLWrZUSci6D5jzMKe9LKCZkpK1a1jW2PjtfKQnclJ/BvFdzjS0A3
 xBqbxbytjgtCZZwS5QGlPBM1cTq//EbXxlQ==
X-Google-Smtp-Source: AGHT+IFTv64UdrkysCJ2yuTEiKwcSb+1/4iYjcQ5l+Q8OyQYeLKhaF8jbrFd+PIwKagB43BFmrw6cA==
X-Received: by 2002:a05:600c:4e14:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-45625e1cc84mr37560615e9.3.1752587790620; 
 Tue, 15 Jul 2025 06:56:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4561b25a948sm60727255e9.35.2025.07.15.06.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 06:56:28 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:56:24 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 patches@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 6.15 085/192] drm/gem: Acquire references on GEM handles
 for framebuffers
Message-ID: <aHZeCE249cYEGCc2@phenom.ffwll.local>
References: <20250715130814.854109770@linuxfoundation.org>
 <20250715130818.327986464@linuxfoundation.org>
 <d52b4d04-cb02-48d2-9042-b135a30f8a8e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d52b4d04-cb02-48d2-9042-b135a30f8a8e@amd.com>
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

On Tue, Jul 15, 2025 at 03:43:08PM +0200, Christian König wrote:
> We are about to revert this patch. Not sure if backporting it makes sense at the moment.

I think it still makes sense, at least as an interim fix.

What I discussed with Thomas is that first we want to revert back from
gem_bo->dma_buf to gem_bo->import_attach.dmabuf everywhere. And those
patches are sprinkled over various branches/trees/releases. So it'll take
a while to catch them all. Meanwhile these two patches at least take care
of the worst fallout, they're already tested and in the pipeline - I don't
think it makes sense to hold them up and wait.

It might take us until 6.17-rc1 until we've caught all the trees and made
sure the backports of those reverts have happened, and I don't think we
should wait that long.

Cheers, Sima

> Regards,
> Christian.
> 
> On 15.07.25 15:13, Greg Kroah-Hartman wrote:
> > 6.15-stable review patch.  If anyone has any objections, please let me know.
> > 
> > ------------------
> > 
> > From: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > commit 5307dce878d4126e1b375587318955bd019c3741 upstream.
> > 
> > A GEM handle can be released while the GEM buffer object is attached
> > to a DRM framebuffer. This leads to the release of the dma-buf backing
> > the buffer object, if any. [1] Trying to use the framebuffer in further
> > mode-setting operations leads to a segmentation fault. Most easily
> > happens with driver that use shadow planes for vmap-ing the dma-buf
> > during a page flip. An example is shown below.
> > 
> > [  156.791968] ------------[ cut here ]------------
> > [  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
> > [...]
> > [  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
> > [  157.043420] Call Trace:
> > [  157.045898]  <TASK>
> > [  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
> > [  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
> > [  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
> > [  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
> > [  157.065567]  ? dma_buf_vmap+0x224/0x430
> > [  157.069446]  ? __warn.cold+0x58/0xe4
> > [  157.073061]  ? dma_buf_vmap+0x224/0x430
> > [  157.077111]  ? report_bug+0x1dd/0x390
> > [  157.080842]  ? handle_bug+0x5e/0xa0
> > [  157.084389]  ? exc_invalid_op+0x14/0x50
> > [  157.088291]  ? asm_exc_invalid_op+0x16/0x20
> > [  157.092548]  ? dma_buf_vmap+0x224/0x430
> > [  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
> > [  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
> > [  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
> > [  157.110697]  drm_gem_shmem_vmap+0x74/0x710
> > [  157.114866]  drm_gem_vmap+0xa9/0x1b0
> > [  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
> > [  157.123086]  drm_gem_fb_vmap+0xab/0x300
> > [  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
> > [  157.133032]  ? lockdep_init_map_type+0x19d/0x880
> > [  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
> > [  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
> > [  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
> > [...]
> > [  157.346424] ---[ end trace 0000000000000000 ]---
> > 
> > Acquiring GEM handles for the framebuffer's GEM buffer objects prevents
> > this from happening. The framebuffer's cleanup later puts the handle
> > references.
> > 
> > Commit 1a148af06000 ("drm/gem-shmem: Use dma_buf from GEM object
> > instance") triggers the segmentation fault easily by using the dma-buf
> > field more widely. The underlying issue with reference counting has
> > been present before.
> > 
> > v2:
> > - acquire the handle instead of the BO (Christian)
> > - fix comment style (Christian)
> > - drop the Fixes tag (Christian)
> > - rename err_ gotos
> > - add missing Link tag
> > 
> > Suggested-by: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/drm_gem.c#L241 # [1]
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Anusha Srivatsa <asrivats@redhat.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: <stable@vger.kernel.org>
> > Reviewed-by: Christian König <christian.koenig@amd.com>
> > Link: https://lore.kernel.org/r/20250630084001.293053-1-tzimmermann@suse.de
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/gpu/drm/drm_gem.c                    |   44 ++++++++++++++++++++++++---
> >  drivers/gpu/drm/drm_gem_framebuffer_helper.c |   16 +++++----
> >  drivers/gpu/drm/drm_internal.h               |    2 +
> >  3 files changed, 51 insertions(+), 11 deletions(-)
> > 
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -212,6 +212,35 @@ void drm_gem_private_object_fini(struct
> >  }
> >  EXPORT_SYMBOL(drm_gem_private_object_fini);
> >  
> > +static void drm_gem_object_handle_get(struct drm_gem_object *obj)
> > +{
> > +	struct drm_device *dev = obj->dev;
> > +
> > +	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
> > +
> > +	if (obj->handle_count++ == 0)
> > +		drm_gem_object_get(obj);
> > +}
> > +
> > +/**
> > + * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> > + * @obj: GEM object
> > + *
> > + * Acquires a reference on the GEM buffer object's handle. Required
> > + * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> > + * to release the reference.
> > + */
> > +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> > +{
> > +	struct drm_device *dev = obj->dev;
> > +
> > +	guard(mutex)(&dev->object_name_lock);
> > +
> > +	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
> > +	drm_gem_object_handle_get(obj);
> > +}
> > +EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
> > +
> >  /**
> >   * drm_gem_object_handle_free - release resources bound to userspace handles
> >   * @obj: GEM object to clean up.
> > @@ -242,8 +271,14 @@ static void drm_gem_object_exported_dma_
> >  	}
> >  }
> >  
> > -static void
> > -drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> > +/**
> > + * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> > + * @obj: GEM object
> > + *
> > + * Releases a reference on the GEM buffer object's handle. Possibly releases
> > + * the GEM buffer object and associated dma-buf objects.
> > + */
> > +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> >  {
> >  	struct drm_device *dev = obj->dev;
> >  	bool final = false;
> > @@ -268,6 +303,7 @@ drm_gem_object_handle_put_unlocked(struc
> >  	if (final)
> >  		drm_gem_object_put(obj);
> >  }
> > +EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
> >  
> >  /*
> >   * Called at device or object close to release the file's
> > @@ -389,8 +425,8 @@ drm_gem_handle_create_tail(struct drm_fi
> >  	int ret;
> >  
> >  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
> > -	if (obj->handle_count++ == 0)
> > -		drm_gem_object_get(obj);
> > +
> > +	drm_gem_object_handle_get(obj);
> >  
> >  	/*
> >  	 * Get the user-visible handle using idr.  Preload and perform
> > --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > @@ -99,7 +99,7 @@ void drm_gem_fb_destroy(struct drm_frame
> >  	unsigned int i;
> >  
> >  	for (i = 0; i < fb->format->num_planes; i++)
> > -		drm_gem_object_put(fb->obj[i]);
> > +		drm_gem_object_handle_put_unlocked(fb->obj[i]);
> >  
> >  	drm_framebuffer_cleanup(fb);
> >  	kfree(fb);
> > @@ -182,8 +182,10 @@ int drm_gem_fb_init_with_funcs(struct dr
> >  		if (!objs[i]) {
> >  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
> >  			ret = -ENOENT;
> > -			goto err_gem_object_put;
> > +			goto err_gem_object_handle_put_unlocked;
> >  		}
> > +		drm_gem_object_handle_get_unlocked(objs[i]);
> > +		drm_gem_object_put(objs[i]);
> >  
> >  		min_size = (height - 1) * mode_cmd->pitches[i]
> >  			 + drm_format_info_min_pitch(info, i, width)
> > @@ -193,22 +195,22 @@ int drm_gem_fb_init_with_funcs(struct dr
> >  			drm_dbg_kms(dev,
> >  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
> >  				    objs[i]->size, min_size, i);
> > -			drm_gem_object_put(objs[i]);
> > +			drm_gem_object_handle_put_unlocked(objs[i]);
> >  			ret = -EINVAL;
> > -			goto err_gem_object_put;
> > +			goto err_gem_object_handle_put_unlocked;
> >  		}
> >  	}
> >  
> >  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
> >  	if (ret)
> > -		goto err_gem_object_put;
> > +		goto err_gem_object_handle_put_unlocked;
> >  
> >  	return 0;
> >  
> > -err_gem_object_put:
> > +err_gem_object_handle_put_unlocked:
> >  	while (i > 0) {
> >  		--i;
> > -		drm_gem_object_put(objs[i]);
> > +		drm_gem_object_handle_put_unlocked(objs[i]);
> >  	}
> >  	return ret;
> >  }
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -161,6 +161,8 @@ void drm_sysfs_lease_event(struct drm_de
> >  
> >  /* drm_gem.c */
> >  int drm_gem_init(struct drm_device *dev);
> > +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> > +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
> >  int drm_gem_handle_create_tail(struct drm_file *file_priv,
> >  			       struct drm_gem_object *obj,
> >  			       u32 *handlep);
> > 
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
