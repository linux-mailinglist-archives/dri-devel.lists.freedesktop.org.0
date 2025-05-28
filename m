Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A83AC65EC
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCAD10E2FC;
	Wed, 28 May 2025 09:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RxskasgX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C059A10E5CD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:26:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ad88d77314bso331884666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748424383; x=1749029183; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d65lf9hRZUyJOHWiiUqWASEii91lhlBo8USW5MV7cnM=;
 b=RxskasgXQO1flud+EqkPIhyo3HWhEMikbp8/fzpVEGDJ4Aft9kEXM/hV2zhiW7FmpE
 nMDFr+TegC4hlAzOPSroV4vc2Cl7+EVQiiX4rV3InfEBS9CCeLLfoTYHwx6HFSeMX8uz
 RWPSX5zPYjvMvTdmmrhAQmEOwuwcwnDD9as9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748424383; x=1749029183;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d65lf9hRZUyJOHWiiUqWASEii91lhlBo8USW5MV7cnM=;
 b=w2Z29MchYe4D6qRdMj8Z2rPIUiecjyrFuWz3eIXSFFMAQw4LRofpRjcHSqAOK2WUG9
 YPoeHv2GFzBbj45vFPg96iotaykECUXhORBh3rZW0pOmrYF2vbuUUFjBmClFGIsPHAim
 xULSUYDdzwzHd/6D4TWT7TcFfOy7yLwpPFUFEm0EO0lxR6VBqPj7RiCmiu0kH9V+IQ7e
 djYOjZwTmlhFhczJ8U8dY91wn6UltOzAtxyvuLmQMr0geJxDpJejJ5OCc0v3UyDGimBm
 mRnTaI7Z+bb4bmqvS7qeq+0NJ6fAcUC9750G9u5fWtJGH87wtZrvjHTfZrhbMiQLm8KH
 IU2g==
X-Gm-Message-State: AOJu0YxbrtvAKVp6CAwTukd9scBNcnK3GhZShdIzQvXsAO0x1sI+yg9w
 RFRzAygQRFwPaz53mtNUIH0ab5DcsNOTTZYxn+EYJLDlDF/F9I1YtgZ+gHukIzCekz39UNgQKZI
 1JhPy
X-Gm-Gg: ASbGncsgOdy4ZpX9CaVEnsLzADBE7qbiUDKS+fVBfWWN1IzWul3Y/rWYPGmBDxzCEnO
 sepreGNSWurmQgDX4TrwKqKwqtA+aPoyyT/7GzqR0ydsOavathVGkkgBRtVjHEpTI8HFWNXPe1o
 VimK+rOtDIqbE5MAza4k53sIkZyY2MudDgqFuCtcmCnkK4wIRh0F7yWLDDC5zSurPU0gLJRYnfF
 mwfaKBW40/k6ggEXplY+czHUOk+HuO0PHznwCwQftQy9IBwbbLONU+y2/Xag3P1Nysa+Pp5xKNR
 JZsTCrOT7IHThGYRUNgBmkXdXFkIRRz0T5tOkvwISMdIw6CV8B8wX80QCSf7ARFaqGXvLuwGSg=
 =
X-Google-Smtp-Source: AGHT+IEePMLFnQYEO4JCakhnU3NsJmB8ND9y2kTKvj7yd61KID345YtB5KSXRXhvfvsFSdBX4kG2PQ==
X-Received: by 2002:a17:907:72c1:b0:ad5:2260:e018 with SMTP id
 a640c23a62f3a-ad85b2b5dd5mr1432202866b.44.1748424383156; 
 Wed, 28 May 2025 02:26:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8a1a13c90sm75897366b.77.2025.05.28.02.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:26:22 -0700 (PDT)
Date: Wed, 28 May 2025 11:26:20 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH 1/8] drm/gem: Fix race in drm_gem_handle_create_tail()
Message-ID: <aDbWvNUaXCCvvQkc@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-2-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528091307.1894940-2-simona.vetter@ffwll.ch>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, May 28, 2025 at 11:12:59AM +0200, Simona Vetter wrote:
> Object creation is a careful dance where we must guarantee that the
> object is fully constructed before it is visible to other threads, and
> GEM buffer objects are no difference.
> 
> Final publishing happens by calling drm_gem_handle_create(). After
> that the only allowed thing to do is call drm_gem_object_put() because
> a concurrent call to the GEM_CLOSE ioctl with a correctly guessed id
> (which is trivial since we have a linear allocator) can already tear
> down the object again.
> 
> Luckily most drivers get this right, the very few exceptions I've
> pinged the relevant maintainers for. Unfortunately we also need
> drm_gem_handle_create() when creating additional handles for an
> already existing object (e.g. GETFB ioctl or the various bo import
> ioctl), and hence we cannot have a drm_gem_handle_create_and_put() as
> the only exported function to stop these issues from happening.
> 
> Now unfortunately the implementation of drm_gem_handle_create() isn't
> living up to standards: It does correctly finishe object
> initialization at the global level, and hence is safe against a
> concurrent tear down. But it also sets up the file-private aspects of
> the handle, and that part goes wrong: We fully register the object in
> the drm_file.object_idr before calling drm_vma_node_allow() or
> obj->funcs->open, which opens up races against concurrent removal of
> that handle in drm_gem_handle_delete().
> 
> Fix this with the usual two-stage approach of first reserving the
> handle id, and then only registering the object after we've completed
> the file-private setup.
> 
> Jacek reported this with a testcase of concurrently calling GEM_CLOSE
> on a freshly-created object (which also destroys the object), but it
> should be possible to hit this with just additional handles created
> through import or GETFB without completed destroying the underlying
> object with the concurrent GEM_CLOSE ioctl calls.
> 
> Note that the close-side of this race was fixed in f6cd7daecff5 ("drm:
> Release driver references to handle before making it available
> again"), which means a cool 9 years have passed until someone noticed
> that we need to make this symmetry or there's still gaps left :-/
> Without the 2-stage close approach we'd still have a race, therefore
> that's an integral part of this bugfix.
> 
> More importantly, this means we can have NULL pointers behind
> allocated id in our drm_file.object_idr. We need to check for that
> now:
> 
> - drm_gem_handle_delete() checks for ERR_OR_NULL already
> 
> - drm_gem.c:object_lookup() also chekcs for NULL
> 
> - drm_gem_release() should never be called if there's another thread
>   still existing that could call into an IOCTL that creates a new
>   handle, so cannot race. For paranoia I added a NULL check to
>   drm_gem_object_release_handle() though.
> 
> - most drivers (etnaviv, i915, msm) are find because they use
>   idr_find, which maps both ENOENT and NULL to NULL.
> 
> - vmgfx is already broken vmw_debugfs_gem_info_show() because NULL
>   pointers might exist due to drm_gem_handle_delete(). This needs a
>   separate patch. This is because idr_for_each_entry terminates on the
>   first NULL entry and so might not iterate over everything.
> 
> - similar for amd in amdgpu_debugfs_gem_info_show() and
>   amdgpu_gem_force_release(). The latter is really questionable though
>   since it's a best effort hack and there's no way to close all the
>   races. Needs separate patches.
> 
> - xe is really broken because it not uses idr_for_each_entry() but
>   also drops the drm_file.table_lock, which can wreak the idr iterator
>   state if you're unlucky enough. Maybe another reason to look into
>   the drm fdinfo memory stats instead of hand-rolling too much.
> 
> - drm_show_memory_stats() is also broken since it uses
>   idr_for_each_entry. But since that's a preexisting bug I'll follow
>   up with a separate patch.

I've already reworded the commit message locally since I now think
idr_for_each_entry is entirely fine.
-Sima

> 
> Reported-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: stable@vger.kernel.org
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_gem.c | 10 +++++++++-
>  include/drm/drm_file.h    |  3 +++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 1e659d2660f7..e4e20dda47b1 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -279,6 +279,9 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	struct drm_file *file_priv = data;
>  	struct drm_gem_object *obj = ptr;
>  
> +	if (WARN_ON(!data))
> +		return 0;
> +
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> @@ -399,7 +402,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>  	idr_preload(GFP_KERNEL);
>  	spin_lock(&file_priv->table_lock);
>  
> -	ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
> +	ret = idr_alloc(&file_priv->object_idr, NULL, 1, 0, GFP_NOWAIT);
>  
>  	spin_unlock(&file_priv->table_lock);
>  	idr_preload_end();
> @@ -420,6 +423,11 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			goto err_revoke;
>  	}
>  
> +	/* mirrors drm_gem_handle_delete to avoid races */
> +	spin_lock(&file_priv->table_lock);
> +	obj = idr_replace(&file_priv->object_idr, obj, handle);
> +	WARN_ON(obj != NULL);
> +	spin_unlock(&file_priv->table_lock);
>  	*handlep = handle;
>  	return 0;
>  
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 5c3b2aa3e69d..d344d41e6cfe 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -300,6 +300,9 @@ struct drm_file {
>  	 *
>  	 * Mapping of mm object handles to object pointers. Used by the GEM
>  	 * subsystem. Protected by @table_lock.
> +	 *
> +	 * Note that allocated entries might be NULL as a transient state when
> +	 * creating or deleting a handle.
>  	 */
>  	struct idr object_idr;
>  
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
