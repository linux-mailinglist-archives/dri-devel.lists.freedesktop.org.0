Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0DA23C91F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 11:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF3E89F92;
	Wed,  5 Aug 2020 09:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E7C89F73
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 09:26:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c19so3972338wmd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 02:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OehDK90EwyFG7im41dDsNlaUDXwTFsUMR/naXiVdyU4=;
 b=DxYOglURIhpn3Xk68QKv3zylzcvsKTYRE3yFLEp/zCCURXeJDsNPEVhvbKBJng0y5s
 FyU+YRx7tR7+049WSm4BFmClPbYh0rAwICGahuLtGaFTJu6tFhq+u7XjMAu0tJ5Kdi7Q
 Q/P5vfvyh3fKDaoLpFfSvlzQCRrH3iFlXugxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OehDK90EwyFG7im41dDsNlaUDXwTFsUMR/naXiVdyU4=;
 b=PRzhiyZ6qHaDdnW9aI6GEWj85s0Ch72IG0//u3MCtUOVJ8myYQ55WPKL7dsoy0S5Bm
 9PztL6Snr6iDGulNBKXFNDlgCsRab5z5ejmXk9GuYdvvMl4QHwBDj92f2Kz951taN6Jp
 nT+0MobZQ4UBVt83tTVyE//mHW6LxH2LcfM8qFmb/bWgOQlM5f992Pe1Frzp9ubuZyxg
 ljZwdPLrmv78IIFvlg7mvrLzNuTk+y+ttt28/NJ/4K8yqkBL1TeBYddHeJH5DHO3zj+x
 W1mPrhU02CsrmZ+bg02AwE1kK5usOzlMz/KifMoKXMDuWjzM5gQ1fNrL5VBcUPcYWF1D
 JjJA==
X-Gm-Message-State: AOAM531jYlqIsPlg0S9naPy29awBlzqr4wPxrrpevUP8agHdxomTLmD7
 yipoPTxdLURzJlohI2D8Z6L7hQ==
X-Google-Smtp-Source: ABdhPJxV0QCTXCyafnMEFAkmGkfgJqtL6J4+p9V6ffTS+GR9WZJBIL+jjxdIF5tPBb9Q8fT9aH92YA==
X-Received: by 2002:a05:600c:2907:: with SMTP id
 i7mr2297024wmd.182.1596619585353; 
 Wed, 05 Aug 2020 02:26:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b142sm2122487wmd.19.2020.08.05.02.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 02:26:24 -0700 (PDT)
Date: Wed, 5 Aug 2020 11:26:23 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 49/59] drm/vmwgfx/gmrid: convert to driver controlled
 allocation.
Message-ID: <20200805092623.GE6419@phenom.ffwll.local>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-50-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804025632.3868079-50-airlied@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: sroland@vmware.com, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 12:56:22PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 32 +++++++++++--------
>  1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index 54c85a59dd8b..bc51b7773084 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -37,6 +37,7 @@
>  #include <linux/kernel.h>
>  
>  struct vmwgfx_gmrid_man {
> +	struct ttm_mem_type_manager manager;
>  	spinlock_t lock;
>  	struct ida gmr_ida;
>  	uint32_t max_gmr_ids;
> @@ -44,13 +45,17 @@ struct vmwgfx_gmrid_man {
>  	uint32_t used_gmr_pages;
>  };
>  
> +static struct vmwgfx_gmrid_man *to_gmrid_manager(struct ttm_mem_type_manager *man)
> +{
> +	return container_of(man, struct vmwgfx_gmrid_man, manager);
> +}
> +
>  static int vmw_gmrid_man_get_node(struct ttm_mem_type_manager *man,
>  				  struct ttm_buffer_object *bo,
>  				  const struct ttm_place *place,
>  				  struct ttm_mem_reg *mem)
>  {
> -	struct vmwgfx_gmrid_man *gman =
> -		(struct vmwgfx_gmrid_man *)man->priv;
> +	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
>  	int id;
>  
>  	id = ida_alloc_max(&gman->gmr_ida, gman->max_gmr_ids - 1, GFP_KERNEL);
> @@ -82,8 +87,7 @@ static int vmw_gmrid_man_get_node(struct ttm_mem_type_manager *man,
>  static void vmw_gmrid_man_put_node(struct ttm_mem_type_manager *man,
>  				   struct ttm_mem_reg *mem)
>  {
> -	struct vmwgfx_gmrid_man *gman =
> -		(struct vmwgfx_gmrid_man *)man->priv;
> +	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
>  
>  	if (mem->mm_node) {
>  		ida_free(&gman->gmr_ida, mem->start);
> @@ -98,13 +102,15 @@ static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func;
>  
>  int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>  {
> -	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
> +	struct ttm_mem_type_manager *man;
>  	struct vmwgfx_gmrid_man *gman =
>  		kzalloc(sizeof(*gman), GFP_KERNEL);
>  
>  	if (unlikely(!gman))
>  		return -ENOMEM;
>  
> +	man = &gman->manager;
> +
>  	man->func = &vmw_gmrid_manager_func;
>  	man->available_caching = TTM_PL_FLAG_CACHED;
>  	man->default_caching = TTM_PL_FLAG_CACHED;
> @@ -127,8 +133,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>  	default:
>  		BUG();
>  	}
> -	man->priv = (void *) gman;
> -
> +	ttm_set_driver_manager(&dev_priv->bdev, type, &gman->manager);
>  	ttm_mem_type_manager_set_used(man, true);
>  	return 0;
>  }
> @@ -136,19 +141,18 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>  void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type)
>  {
>  	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
> -	struct vmwgfx_gmrid_man *gman =
> -		(struct vmwgfx_gmrid_man *)man->priv;
> +	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
>  
>  	ttm_mem_type_manager_disable(man);
>  
>  	ttm_mem_type_manager_force_list_clean(&dev_priv->bdev, man);
>  
> -	if (gman) {

Ah, here it goes, please disregard my suggestion earlier for adding a
WARN_ON, that's just churn.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -		ida_destroy(&gman->gmr_ida);
> -		kfree(gman);
> -	}
> -
>  	ttm_mem_type_manager_cleanup(man);
> +
> +	ttm_set_driver_manager(&dev_priv->bdev, type, NULL);
> +	ida_destroy(&gman->gmr_ida);
> +	kfree(gman);
> +
>  }
>  
>  static const struct ttm_mem_type_manager_func vmw_gmrid_manager_func = {
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
