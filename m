Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C524F1898
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26A010E717;
	Mon,  4 Apr 2022 15:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9E210E717
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 15:38:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q19so8187212wrc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 08:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+jKTg5j3Sg0FHlal9K2/zKTxx0k59WDPwiUlgcLE2FI=;
 b=Ru2zqmRvjKjAXF1T9xPLplXIUKk39B6k6QfEvsZZ5J2FX87xrH8VtWPckcRAc4S/Zt
 //DsCsq+iL2w69PHyIqCVCGbimVsPI2LrTdT7LkFsHz9q7ZZqf86dk/XWJlpaLF3MLjJ
 XFKN/0CdSWAn2ZXL2wa50oUeUhs8FoDFNuVCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+jKTg5j3Sg0FHlal9K2/zKTxx0k59WDPwiUlgcLE2FI=;
 b=ckEqffAq8wllqIkspSPrIx5c55NNhC9+PubWQCne6bHmqnv00gkhK+aAmqpwRdAe4R
 lEg2wtMzRWdvojLscnZ+yHe2kIhUOzM8b9XEqNyjxPG3IkIdhEy/EVMvVZ6Wtt9CS0Uu
 xIDUtz7nzMIdYvzMMr7UcHndhQ4egIzY7Jwm8hFn/FNTD/z4y5YQDgnpcIKoZBfW5gKc
 /0jPH2H+AJI/RiWBOg7a2EQUeczG4EL69lN/QnP0inlVwi9AEYuGdaaPN74KQSHH+Qcw
 8tY81dgmb5MkEvcqMux/6B1+uuO0n3xVw4TfTVhyZcMMy8c6sJffNLlpKjdbbOfKuwpy
 H+sg==
X-Gm-Message-State: AOAM533hE8ZR5OjN81H/dGdz+mW1yBgeOfxE/PYmS2GC0pgCXHJ9xX4H
 09yzJ7Ggno/LPsw9xZFKTcvXVA==
X-Google-Smtp-Source: ABdhPJyUdNUV3nmgVy03pQRq/TRyMZHHaaGkO4X9jk2AQ0FcSq1RK/EXxox8ZATTJ/zuN7iA0xPpyA==
X-Received: by 2002:a5d:6d0a:0:b0:204:109f:7833 with SMTP id
 e10-20020a5d6d0a000000b00204109f7833mr284685wrq.76.1649086733049; 
 Mon, 04 Apr 2022 08:38:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c4e4d00b0038e44e316c1sm11702918wmq.6.2022.04.04.08.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:38:52 -0700 (PDT)
Date: Mon, 4 Apr 2022 17:38:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 1/3] drm/vmwgfx: Add debugfs entries for ttm placements
Message-ID: <YksRCsiQtCp74y/A@phenom.ffwll.local>
References: <20220401205602.1172975-1-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401205602.1172975-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 04:56:00PM -0400, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> Add a few debugfs entries for every used TTM placement that vmwgfx is
> using. This allows basic tracking of memory usage inside vmwgfx, e.g.
> 'cat /sys/kernel/debug/dri/0/mob_ttm' will display mob memory usage.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 97 +++++++++++++++++++++-
>  3 files changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 791f9a5f3868..6d675855f065 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1632,6 +1632,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		goto out_unload;
>  
>  	vmw_debugfs_gem_init(vmw);
> +	vmw_ttm_debugfs_init(vmw);
>  
>  	return 0;
>  out_unload:
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index be19aa6e1f13..eabe3e8e9cf9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1085,6 +1085,7 @@ vmw_bo_sg_table(struct ttm_buffer_object *bo);
>  extern int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
>  				      unsigned long bo_size,
>  				      struct ttm_buffer_object **bo_p);
> +void vmw_ttm_debugfs_init(struct vmw_private *vdev);
>  
>  extern void vmw_piter_start(struct vmw_piter *viter,
>  			    const struct vmw_sg_table *vsgt,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index b84ecc6d6611..355414595e52 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
>  /**************************************************************************
>   *
> - * Copyright 2009-2015 VMware, Inc., Palo Alto, CA., USA
> + * Copyright 2009-2022 VMware, Inc., Palo Alto, CA., USA
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a
>   * copy of this software and associated documentation files (the
> @@ -677,3 +677,98 @@ int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
>  		*bo_p = bo;
>  	return ret;
>  }
> +
> +#if defined(CONFIG_DEBUG_FS)
> +
> +static int vmw_ttm_vram_table_show(struct seq_file *m, void *unused)
> +{
> +	struct vmw_private *vdev = (struct vmw_private *)m->private;
> +	struct ttm_resource_manager *man = ttm_manager_type(&vdev->bdev,
> +							    TTM_PL_VRAM);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	ttm_resource_manager_debug(man, &p);
> +	return 0;
> +}
> +
> +static int vmw_ttm_page_pool_show(struct seq_file *m, void *unused)
> +{
> +	struct vmw_private *vdev = (struct vmw_private *)m->private;
> +
> +	return ttm_pool_debugfs(&vdev->bdev.pool, m);
> +}
> +
> +static int vmw_ttm_mob_table_show(struct seq_file *m, void *unused)
> +{
> +	struct vmw_private *vdev = (struct vmw_private *)m->private;
> +	struct ttm_resource_manager *man = ttm_manager_type(&vdev->bdev,
> +							    VMW_PL_MOB);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	ttm_resource_manager_debug(man, &p);
> +	return 0;
> +}
> +
> +static int vmw_ttm_gmr_table_show(struct seq_file *m, void *unused)
> +{
> +	struct vmw_private *vdev = (struct vmw_private *)m->private;
> +	struct ttm_resource_manager *man = ttm_manager_type(&vdev->bdev,
> +							    VMW_PL_GMR);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	ttm_resource_manager_debug(man, &p);
> +	return 0;
> +}
> +
> +static int vmw_ttm_system_table_show(struct seq_file *m, void *unused)
> +{
> +	struct vmw_private *vdev = (struct vmw_private *)m->private;
> +	struct ttm_resource_manager *man = ttm_manager_type(&vdev->bdev,
> +							    TTM_PL_SYSTEM);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	ttm_resource_manager_debug(man, &p);
> +	return 0;
> +}
> +
> +static int vmw_ttm_system_mob_table_show(struct seq_file *m, void *unused)
> +{
> +	struct vmw_private *vdev = (struct vmw_private *)m->private;
> +	struct ttm_resource_manager *man = ttm_manager_type(&vdev->bdev,
> +							    VMW_PL_SYSTEM);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	ttm_resource_manager_debug(man, &p);
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_vram_table);
> +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_mob_table);
> +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_gmr_table);
> +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_system_table);
> +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_system_mob_table);
> +DEFINE_SHOW_ATTRIBUTE(vmw_ttm_page_pool);
> +
> +#endif
> +
> +void vmw_ttm_debugfs_init(struct vmw_private *vdev)
> +{
> +#if defined(CONFIG_DEBUG_FS)
> +	struct drm_device *drm = &vdev->drm;
> +	struct drm_minor *minor = drm->primary;
> +	struct dentry *root = minor->debugfs_root;
> +
> +	debugfs_create_file("vram_ttm", 0444, root, vdev,
> +			    &vmw_ttm_vram_table_fops);
> +	debugfs_create_file("mob_ttm", 0444, root, vdev,
> +			    &vmw_ttm_mob_table_fops);
> +	debugfs_create_file("gmr_ttm", 0444, root, vdev,
> +			    &vmw_ttm_gmr_table_fops);
> +	debugfs_create_file("system_ttm", 0444, root, vdev,
> +			    &vmw_ttm_system_table_fops);
> +	debugfs_create_file("system_mob_ttm", 0444, root, vdev,
> +			    &vmw_ttm_system_mob_table_fops);
> +	debugfs_create_file("ttm_page_pool", 0444, root, vdev,
> +			    &vmw_ttm_page_pool_fops);
> +#endif

Bit orthogonal, but can't ttm create the debugfs files for all the regions
on its own when we set everything up? Or at least a "create me all the
regions debugfs files" helpers would be useful. It's just rather silly
amounts of boilerplate we're having here, and that in each driver.
-Daniel

> +}
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
