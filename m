Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4476E402540
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF67B89DA4;
	Tue,  7 Sep 2021 08:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1633789DA4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:39:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z4so13209459wrr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2Z/Jxh5I58nqAJS74N7U1/ESI0ix562GJVtyAJnxTIM=;
 b=gU2zhI6vtlnAnLEcrdfZ0zfk0ugaj7OJE6l2hRo9n3wubPF0tn9l0fgP0E3oS7+mtY
 w7qhcESnV2snyj8T0qFCklNSggYYjDDUPwaiTV13J1p7D5XfK7mNN11SMW5pXxVZGbE/
 9hYaCN5DRlzYSKfmAnj2Ro1HyRxtiIzKf0ouk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2Z/Jxh5I58nqAJS74N7U1/ESI0ix562GJVtyAJnxTIM=;
 b=eR0/aywuXCqxBqkmr5VNKrvGtZ+s5iPmIJ6FNCUk8xLHb4lqzrMJBBi+XTgEgKmta5
 uCDiKJmddloVe7u5me0qotbmpJBYL/h2ln4lDULfClKhF0Jcgs++dlp4zNuwvYWvvgYx
 G0D3EYuVTTLeicccC/PnVzE0/SrOth9fHY1ROvHxPP38ab2GVQBq0FFOV7r7bHwhCC5I
 2P4goYqxUtadfLABP7nkyAubQvepFeKgiDVG86ZGpN6/TJGnd7HOrdf7n4VzF24g+1LP
 gGS6FGYpcRQdaden67c0m5wmMSWGM34mjuxvuojoVHTNWpsmnY7btyPUjCizsCyHUDyl
 SLeQ==
X-Gm-Message-State: AOAM531qiCTNcRyP5Mf3QAtIkUpLxS2VPR3y7JtQMlfIxFDEhDAwBYBD
 JL4uSrCuuuUb0/5tf5BRx7x+nw==
X-Google-Smtp-Source: ABdhPJwgcmbvWUx6cIR6rIIsUeC/SzvzO26JPvkLm/o/RXVzlPK5ajMKh3KkeSUfaEfB9cI4KkhFwg==
X-Received: by 2002:a05:6000:10:: with SMTP id
 h16mr17986219wrx.24.1631003995631; 
 Tue, 07 Sep 2021 01:39:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v28sm10464146wrv.93.2021.09.07.01.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:39:55 -0700 (PDT)
Date: Tue, 7 Sep 2021 10:39:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, matthew.william.auld@gmail.com
Subject: Re: [PATCH 1/8] drm/ttm: remove the outdated kerneldoc section
Message-ID: <YTclUy9VaU8sSQGZ@phenom.ffwll.local>
References: <20210907080135.101452-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210907080135.101452-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Sep 07, 2021 at 10:01:28AM +0200, Christian König wrote:
> Clean up to start over with new and more accurate documentation.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Burried in mails, but thanks a lot for kicking this can so we can start
the journey!
-Daniel

> ---
>  Documentation/gpu/drm-mm.rst | 49 ------------------------------------
>  1 file changed, 49 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 0198fa43d254..8ca981065e1a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -30,55 +30,6 @@ The Translation Table Manager (TTM)
>  
>  TTM design background and information belongs here.
>  
> -TTM initialization
> -------------------
> -
> -    **Warning**
> -    This section is outdated.
> -
> -Drivers wishing to support TTM must pass a filled :c:type:`ttm_bo_driver
> -<ttm_bo_driver>` structure to ttm_bo_device_init, together with an
> -initialized global reference to the memory manager.  The ttm_bo_driver
> -structure contains several fields with function pointers for
> -initializing the TTM, allocating and freeing memory, waiting for command
> -completion and fence synchronization, and memory migration.
> -
> -The :c:type:`struct drm_global_reference <drm_global_reference>` is made
> -up of several fields:
> -
> -.. code-block:: c
> -
> -              struct drm_global_reference {
> -                      enum ttm_global_types global_type;
> -                      size_t size;
> -                      void *object;
> -                      int (*init) (struct drm_global_reference *);
> -                      void (*release) (struct drm_global_reference *);
> -              };
> -
> -
> -There should be one global reference structure for your memory manager
> -as a whole, and there will be others for each object created by the
> -memory manager at runtime. Your global TTM should have a type of
> -TTM_GLOBAL_TTM_MEM. The size field for the global object should be
> -sizeof(struct ttm_mem_global), and the init and release hooks should
> -point at your driver-specific init and release routines, which probably
> -eventually call ttm_mem_global_init and ttm_mem_global_release,
> -respectively.
> -
> -Once your global TTM accounting structure is set up and initialized by
> -calling ttm_global_item_ref() on it, you need to create a buffer
> -object TTM to provide a pool for buffer object allocation by clients and
> -the kernel itself. The type of this object should be
> -TTM_GLOBAL_TTM_BO, and its size should be sizeof(struct
> -ttm_bo_global). Again, driver-specific init and release functions may
> -be provided, likely eventually calling ttm_bo_global_ref_init() and
> -ttm_bo_global_ref_release(), respectively. Also, like the previous
> -object, ttm_global_item_ref() is used to create an initial reference
> -count for the TTM, which will call your initialization function.
> -
> -See the radeon_ttm.c file for an example of usage.
> -
>  The Graphics Execution Manager (GEM)
>  ====================================
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
