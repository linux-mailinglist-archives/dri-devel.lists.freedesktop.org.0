Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFBD93C15B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 14:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285E410E761;
	Thu, 25 Jul 2024 12:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="bACGTPxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A7A10E761
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 12:01:41 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a7aa74d1ab8so2866466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 05:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721908899; x=1722513699; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+9Nd/mlRkfnyYlEn8SnWE7CPsur5peoiPhccqCSrfCE=;
 b=bACGTPxXlb8RZPah2gjFZqBI0I25IzuUW2cGjrQeyXdV8HuR2fPlyFau8si0gQ29tc
 aR1B8xBmhDqO97nZcPDt5z5z4WwW//5axp2d/gUSxVLYBgNUxZwSoF7vNssme2RAnAQk
 GK90ULTnkSsC8OZMeWKBJSx3LaLUrpmaymKEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721908899; x=1722513699;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+9Nd/mlRkfnyYlEn8SnWE7CPsur5peoiPhccqCSrfCE=;
 b=mAUIN8ZoqRxjAJVZtKfkl6h6t1GxgnGdFxIXRxHx+4h2d25kdcUT0lOB691vzZRz08
 jWHrfknLkV0EAt7N+RdKFkojBzTmOx335seN3NNGakYQYgPEIfq1lM8NEPwls7oYqCeH
 T96osv6sQIMEnLw3uryW3H/pw2GIm6oDKvP41OvsnL98qpgW+eHdQoyukCvmW3dwlNzH
 +24meKi79n5Eg6hxF2xamNLDckg51FAyYhcR5iOu43mMihxdqPvVSwTLE1tY4uF87NrN
 DiBK/ejTUkIEp/qC2NMMBtwjEOMbC6etZIOLyL90Sz9rVQJVyJeiqjthK8fQv4JauBn3
 EnWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUawj/kicuJ7y+Iu5YgjtSXeroczMmAdS0/XFeS2+z0J2eGFI6UHYTpmb2nUaM7FmyDiP8F2ibgLz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv6/A34m53Fv16TYV3RJpTMGikU3DH1rMgZRbFJ79w0SmoZ4dG
 2MucBbEKPRB7x93gZKO/Hr10m8ZI3tQiYWWX3qUlZDzwVHvyQgr+wUe7b1Q6KZI=
X-Google-Smtp-Source: AGHT+IE/guvT0Wi1ydapZR9JmAG6k/oPTu1DwBHlDdtSe6FLkhCWGZBvNAumgn5zOWEwFvwe5X0xng==
X-Received: by 2002:a17:907:7211:b0:a74:4f23:14ca with SMTP id
 a640c23a62f3a-a7ac5b788e6mr109719266b.7.1721908899157; 
 Thu, 25 Jul 2024 05:01:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab2311asm66392266b.18.2024.07.25.05.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 05:01:38 -0700 (PDT)
Date: Thu, 25 Jul 2024 14:01:36 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/8] drm/amdgpu: use GEM references instead of TTMs
Message-ID: <ZqI-oMrbSLSybC_p@phenom.ffwll.local>
References: <20240723121750.2086-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240723121750.2086-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Tue, Jul 23, 2024 at 02:17:43PM +0200, Christian König wrote:
> Instead of a TTM reference grab a GEM reference whenever necessary.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: amd-gfx@lists.freedesktop.org

I was worried that changing the refcounting for the mmu_interval_notifier
that this patch does could result in a use-after-free, but the mmu
notifier code already does the required amount of mmgrab/mmdrop, so we're
good.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 8 ++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 7 ++-----
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 67c234bcf89f..6be3d7cd1c51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -87,11 +87,11 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
>  
>  static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>  {
> -	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
> +	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
>  
> -	if (robj) {
> -		amdgpu_hmm_unregister(robj);
> -		amdgpu_bo_unref(&robj);
> +	if (aobj) {
> +		amdgpu_hmm_unregister(aobj);
> +		ttm_bo_put(&aobj->tbo);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 8d8c39be6129..6c187e310034 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -853,7 +853,7 @@ struct amdgpu_bo *amdgpu_bo_ref(struct amdgpu_bo *bo)
>  	if (bo == NULL)
>  		return NULL;
>  
> -	ttm_bo_get(&bo->tbo);
> +	drm_gem_object_get(&bo->tbo.base);
>  	return bo;
>  }
>  
> @@ -865,13 +865,10 @@ struct amdgpu_bo *amdgpu_bo_ref(struct amdgpu_bo *bo)
>   */
>  void amdgpu_bo_unref(struct amdgpu_bo **bo)
>  {
> -	struct ttm_buffer_object *tbo;
> -
>  	if ((*bo) == NULL)
>  		return;
>  
> -	tbo = &((*bo)->tbo);
> -	ttm_bo_put(tbo);
> +	drm_gem_object_get(&(*bo)->tbo.base);
>  	*bo = NULL;
>  }
>  
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
