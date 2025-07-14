Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CD4B03EE6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCCD10E48E;
	Mon, 14 Jul 2025 12:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AD7z8Jq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E986510E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:40:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so12349425e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752496831; x=1753101631; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rP8qGmbzg1jKLZErjo0X3K9yWVc1Te/xNd21J+Imr9Y=;
 b=AD7z8Jq5NsE39vJ6F87rkeGVZ0wJQfydBO24oo8x0y+JCziwSWoYvQ5yvk6IgcsNpK
 46YqLkh2g8KESxHVzDZtxjdKYN0WsXZ+WkIDdAmn6uqeult/Hf2mhd2G5Ls+kXV63KdC
 CjxSTBKKINZWqOrdNdpvK7C3jmlZe8jcboURs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752496831; x=1753101631;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rP8qGmbzg1jKLZErjo0X3K9yWVc1Te/xNd21J+Imr9Y=;
 b=rueeQdY0EYMX1APDX4gdykh9NAn4+Rk3BJjYEbSt8nyApOX1oc/t4ksPAEmS0FlbL0
 feurh51ERU5SpcpYJl/WtnS8MJDMPdvq/zV3DyOZk4HBcJhUDdB8JJpZ09+PariXa2uH
 ZVvrseBW/hbfiM6oqYXyLdinfMDFgXlbd44pzD79d1Xmv6qGePPq+A6xrA4etQy438PW
 554l7bgFXH5ON9IL904+qmEPUH1RUp28YAvSQmoTPTitZsoc50BirHDSShm6IBctR3tM
 ytIeMGXCy2EMbljc6ngBr5Bnvt/7PuVOL8tSIAF86kgazKHkPkEFiWrVvAeI37a1lsTu
 3bzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcHRpbS24M8dYwQj36nTx7Jm69fr3l5TZkccObYvmgn1GwM5Rbd9IlBeh2IxFpzdM6de/TcDJmJQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxexS+ZDb8RzmkDi77zMPKC/jGFaSnEsLXuZOiKhpXILKPkaaC
 kpYOAT7/bPnh35bs8KCwwziN2cBpeP5jnUtb2n5REM+3roXbBVqNhZBe93GKoUvNYNqcxwj6O6V
 oGMSFNys=
X-Gm-Gg: ASbGnctwMuKs1su6WY6jdiSFKL9y07LuesYPKIwc9lclS/txaIqFJutjpiATjQ0NLhE
 gI0Y3rs9Tk/8SOYa+6q79qlQluhkHTnFYisRDatQ/qD/bjdJrtMheUiiuHXhN9kiy7RdMSi98Wl
 SvR2isO70FMS9lZqxyYzh6k9AbOGgN7SOuqQbE125Dou/ySS9HLxefcyIeFTDoZ1++LaoxFd+Dw
 sK9aJUkJ1Tg/uwVb0Z8FO//c+V/rKFYrGiXGeVwaxP41vtLUYSMqozVe4QzZLimCkyPxkN3MAh2
 3+ihH5Ntys2Vs51eoPl5MZmEzEdNQ9wCWXBDCG5TdAUJF1V4E1RsXjkIUkCgh7rMlvLpUs0jn07
 MjH6lYxFLW8jNwEjSvUuDfgX1pi6l+b8dwQ==
X-Google-Smtp-Source: AGHT+IHnWjRlHShHz4DWS5W+vOlsGqazES3YQeM+43pB5em+Fbxl+K/hAAf+NPXDTN+yrpt0494SAQ==
X-Received: by 2002:a05:600c:4746:b0:453:7713:476c with SMTP id
 5b1f17b1804b1-455bd8e63aemr98322575e9.2.1752496831208; 
 Mon, 14 Jul 2025 05:40:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd56d936sm115510615e9.0.2025.07.14.05.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 05:40:30 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:40:28 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 David Francis <David.Francis@amd.com>,
 dri-devel@lists.freedesktop.org, tvrtko.ursulin@igalia.com,
 Felix.Kuehling@amd.com, David.YatSin@amd.com,
 Chris.Freehill@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH 2/2] drm: Move drm_gem ioctl kerneldoc to uapi file
Message-ID: <aHT6vC61bEQ6DIRx@phenom.ffwll.local>
References: <20250711145342.89720-1-David.Francis@amd.com>
 <20250711145342.89720-3-David.Francis@amd.com>
 <aHGIQNEuDM-MgmnZ@phenom.ffwll.local>
 <48c0cbcb-c613-4f0b-b922-d6807f2eefec@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48c0cbcb-c613-4f0b-b922-d6807f2eefec@amd.com>
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

On Mon, Jul 14, 2025 at 11:50:32AM +0200, Christian König wrote:
> On 11.07.25 23:55, Simona Vetter wrote:
> > On Fri, Jul 11, 2025 at 10:53:42AM -0400, David Francis wrote:
> >> The drm_gem ioctls were documented in internal file drm_gem.c
> >> instead of uapi header drm.h. Move them there and change to
> >> appropriate kerneldoc formatting.
> >>
> >> Signed-off-by: David Francis <David.Francis@amd.com>
> > 
> > Thanks a lot for taking care of this!
> > 
> > Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > 
> > I'll leave review for the first patch to folks who care about criu, but it
> > looked good to me too.
> 
> I will take that as an Acked-by.
> 
> Are you ok that we push this into drm-misc-next by the end of the week when we have the IGT test ready?

Aye, sounds like a plan.
-Sima

> 
> The patches for the CRIU code are ready and IIRC there will be a merge
> request made, but it will take quite a while until they are actually
> merged I think.

> 
> Christian.
> 
> > -Sima
> > 
> >> ---
> >>  drivers/gpu/drm/drm_gem.c | 30 -----------------------------
> >>  include/uapi/drm/drm.h    | 40 +++++++++++++++++++++++++++------------
> >>  2 files changed, 28 insertions(+), 42 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> >> index 3166230d0119..08778a15eefb 100644
> >> --- a/drivers/gpu/drm/drm_gem.c
> >> +++ b/drivers/gpu/drm/drm_gem.c
> >> @@ -820,14 +820,6 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
> >>  }
> >>  EXPORT_SYMBOL(drm_gem_dma_resv_wait);
> >>  
> >> -/**
> >> - * drm_gem_close_ioctl - implementation of the GEM_CLOSE ioctl
> >> - * @dev: drm_device
> >> - * @data: ioctl data
> >> - * @file_priv: drm file-private structure
> >> - *
> >> - * Releases the handle to an mm object.
> >> - */
> >>  int
> >>  drm_gem_close_ioctl(struct drm_device *dev, void *data,
> >>  		    struct drm_file *file_priv)
> >> @@ -843,17 +835,6 @@ drm_gem_close_ioctl(struct drm_device *dev, void *data,
> >>  	return ret;
> >>  }
> >>  
> >> -/**
> >> - * drm_gem_flink_ioctl - implementation of the GEM_FLINK ioctl
> >> - * @dev: drm_device
> >> - * @data: ioctl data
> >> - * @file_priv: drm file-private structure
> >> - *
> >> - * Create a global name for an object, returning the name.
> >> - *
> >> - * Note that the name does not hold a reference; when the object
> >> - * is freed, the name goes away.
> >> - */
> >>  int
> >>  drm_gem_flink_ioctl(struct drm_device *dev, void *data,
> >>  		    struct drm_file *file_priv)
> >> @@ -893,17 +874,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
> >>  	return ret;
> >>  }
> >>  
> >> -/**
> >> - * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
> >> - * @dev: drm_device
> >> - * @data: ioctl data
> >> - * @file_priv: drm file-private structure
> >> - *
> >> - * Open an object using the global name, returning a handle and the size.
> >> - *
> >> - * This handle (of course) holds a reference to the object, so the object
> >> - * will not go away until the handle is deleted.
> >> - */
> >>  int
> >>  drm_gem_open_ioctl(struct drm_device *dev, void *data,
> >>  		   struct drm_file *file_priv)
> >> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> >> index e3940b657e16..e512da8f3baf 100644
> >> --- a/include/uapi/drm/drm.h
> >> +++ b/include/uapi/drm/drm.h
> >> @@ -597,31 +597,47 @@ struct drm_set_version {
> >>  	int drm_dd_minor;
> >>  };
> >>  
> >> -/* DRM_IOCTL_GEM_CLOSE ioctl argument type */
> >> +/**
> >> + * struct drm_gem_close - Argument for &DRM_IOCTL_GEM_CLOSE ioctl.
> >> + * @handle: Handle of the object to be closed.
> >> + * @pad: Padding.
> >> + *
> >> + * Releases the handle to an mm object.
> >> + */
> >>  struct drm_gem_close {
> >> -	/** Handle of the object to be closed. */
> >>  	__u32 handle;
> >>  	__u32 pad;
> >>  };
> >>  
> >> -/* DRM_IOCTL_GEM_FLINK ioctl argument type */
> >> +/**
> >> + * struct drm_gem_flink - Argument for &DRM_IOCTL_GEM_FLINK ioctl.
> >> + * @handle: Handle for the object being named.
> >> + * @name: Returned global name.
> >> + *
> >> + * Create a global name for an object, returning the name.
> >> + *
> >> + * Note that the name does not hold a reference; when the object
> >> + * is freed, the name goes away.
> >> + */
> >>  struct drm_gem_flink {
> >> -	/** Handle for the object being named */
> >>  	__u32 handle;
> >> -
> >> -	/** Returned global name */
> >>  	__u32 name;
> >>  };
> >>  
> >> -/* DRM_IOCTL_GEM_OPEN ioctl argument type */
> >> +/**
> >> + * struct drm_gem_open - Argument for &DRM_IOCTL_GEM_OPEN ioctl.
> >> + * @name: Name of object being opened.
> >> + * @handle: Returned handle for the object.
> >> + * @size: Returned size of the object
> >> + *
> >> + * Open an object using the global name, returning a handle and the size.
> >> + *
> >> + * This handle (of course) holds a reference to the object, so the object
> >> + * will not go away until the handle is deleted.
> >> + */
> >>  struct drm_gem_open {
> >> -	/** Name of object being opened */
> >>  	__u32 name;
> >> -
> >> -	/** Returned handle for the object */
> >>  	__u32 handle;
> >> -
> >> -	/** Returned size of the object */
> >>  	__u64 size;
> >>  };
> >>  
> >> -- 
> >> 2.34.1
> >>
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
