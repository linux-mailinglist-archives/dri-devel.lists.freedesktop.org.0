Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73B2258AE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620246E02C;
	Mon, 20 Jul 2020 07:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6966E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 07:36:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f139so24108617wmf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 00:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=c0ZDB5Wq9R/JvtsXNF5Wt7Eqi2IUySqHftkrwWUiswg=;
 b=Sw5IEcisrBVJmb4gyxwaCG0cAqNnsc5yffyEHrr0+8UBL3kzg1SE1kRMGSlnDoSxyc
 806TppootrHhX/rF15kUD9CNz9VhxEDkhC/iYXtHASrvbcC16hX823XSYN5lopruVMM3
 KoDgWHHnik2fpBfH31SHOtwqVOrcajQeBV9Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=c0ZDB5Wq9R/JvtsXNF5Wt7Eqi2IUySqHftkrwWUiswg=;
 b=YLTYufI4gHffu8MhigC25/7KPvsCPup6+maTKCE8waqe0ZjePwPTzpmaz0BHCHQDfD
 iMwIfL4GQfQkLKHQ6q2LELjMPvdsMDe4ZFIQt6gjopNvDWHKwg+96/icIFVb0cRANFYk
 X5oj0lgmDrkRHc4ItoJVggPHae8n2z+1L2nB+7yPnBUJ0z2bhBfKnjckUVEM9sIQJjqp
 6J14+BgEvKItDi3hOzXQH/wLiKVb1iVf5euYDMIZI2dA6+e9746lJeDBSiTZTjgNzjc8
 qD3dpH0ay/Kh5J3UQN1EJtfLPDndGCto5JE+d9EdxAHx84iQ3BMVZag/VdW7R8tZ9fT9
 iClQ==
X-Gm-Message-State: AOAM53034robRmOqq2VQHjiPUNeMYbtBJ+FDNndZQJ3F/qKQJqV2egQx
 s6IgM48CiiyPv8rlAJeA1arjkQ==
X-Google-Smtp-Source: ABdhPJzmQ6e/1d88R0TDasxOj7GnF+ar1riWOZ2iimadli/xJPeOijGgXkcxuoFB6lfdwcaowN5kUg==
X-Received: by 2002:a1c:9d0c:: with SMTP id g12mr20981175wme.107.1595230564111; 
 Mon, 20 Jul 2020 00:36:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f197sm32565618wme.33.2020.07.20.00.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 00:36:03 -0700 (PDT)
Date: Mon, 20 Jul 2020 09:36:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Suraj Upadhyay <usuraj35@gmail.com>
Subject: Re: [PATCH v2] drm: core: Convert device logging to drm_* functions.
Message-ID: <20200720073601.GV3278063@phenom.ffwll.local>
Mail-Followup-To: Suraj Upadhyay <usuraj35@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200718150955.GA23103@blackclown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718150955.GA23103@blackclown>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 18, 2020 at 08:39:55PM +0530, Suraj Upadhyay wrote:
> Convert device logging with dev_* functions into drm_* functions.
> 
> The patch has been generated with the coccinelle script below.
> The script focuses on instances of dev_* functions where the drm device
> context is clearly visible in its arguments.
> 
> @@expression E1; expression list E2; @@
> -dev_warn(E1->dev, E2)
> +drm_warn(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_info(E1->dev, E2)
> +drm_info(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_err(E1->dev, E2)
> +drm_err(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_info_once(E1->dev, E2)
> +drm_info_once(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_notice_once(E1->dev, E2)
> +drm_notice_once(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_warn_once(E1->dev, E2)
> +drm_warn_once(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_err_once(E1->dev, E2)
> +drm_err_once(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_err_ratelimited(E1->dev, E2)
> +drm_err_ratelimited(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_dbg(E1->dev, E2)
> +drm_dbg(E1, E2)
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
> Changes:
> 	v2: Fixed error in coccinelle script and diff,
> 	    i.e. removed the underscore.
> 		drv_dbg_ -> drm_dbg

Applied to drm-misc-next, thanks for your patch. Will probably go to 5.10
because drm is already in feature freeze.
-Daniel

> 
>  drivers/gpu/drm/drm_edid.c           | 6 ++----
>  drivers/gpu/drm/drm_gem_cma_helper.c | 4 ++--
>  drivers/gpu/drm/drm_mipi_dbi.c       | 7 +++----
>  3 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 52b357e75c3d..6840f0530a38 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1844,9 +1844,7 @@ static void connector_bad_edid(struct drm_connector *connector,
>  	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
>  		return;
>  
> -	dev_warn(connector->dev->dev,
> -		 "%s: EDID is invalid:\n",
> -		 connector->name);
> +	drm_warn(connector->dev, "%s: EDID is invalid:\n", connector->name);
>  	for (i = 0; i < num_blocks; i++) {
>  		u8 *block = edid + i * EDID_LENGTH;
>  		char prefix[20];
> @@ -5298,7 +5296,7 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>  	}
>  	if (!drm_edid_is_valid(edid)) {
>  		clear_eld(connector);
> -		dev_warn(connector->dev->dev, "%s: EDID invalid.\n",
> +		drm_warn(connector->dev, "%s: EDID invalid.\n",
>  			 connector->name);
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 06a5b9ee1fe0..822edeadbab3 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -105,8 +105,8 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>  	cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
>  				      GFP_KERNEL | __GFP_NOWARN);
>  	if (!cma_obj->vaddr) {
> -		dev_dbg(drm->dev, "failed to allocate buffer with size %zu\n",
> -			size);
> +		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
> +			 size);
>  		ret = -ENOMEM;
>  		goto error;
>  	}
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 0e55d8716e3d..a7a611894243 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -225,9 +225,8 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
>  		break;
>  	default:
> -		dev_err_once(fb->dev->dev, "Format is not supported: %s\n",
> -			     drm_get_format_name(fb->format->format,
> -						 &format_name));
> +		drm_err_once(fb->dev, "Format is not supported: %s\n",
> +			     drm_get_format_name(fb->format->format, &format_name));
>  		return -EINVAL;
>  	}
>  
> @@ -295,7 +294,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
>  				   width * height * 2);
>  err_msg:
>  	if (ret)
> -		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
> +		drm_err_once(fb->dev, "Failed to update display %d\n", ret);
>  
>  	drm_dev_exit(idx);
>  }
> -- 
> 2.17.1
> 



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
