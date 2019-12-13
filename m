Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E362B11E1EB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BDC6E32E;
	Fri, 13 Dec 2019 10:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD166E32E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:27:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so5990635wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z3MHG14tc2eG/+APF37H02UsB6lju+oFSrZ5rNUU9nM=;
 b=A2UFI+63XItWSVZlkfjloO8NAKSC1FHlpyACVRCN5k1ui7RMYfDbd678lxQLqB7O1m
 ogXo5xk9JtNwT0PwmGBPdnVl5k65TLpFWlU/7duZ8T5/AxEaKKtv5RSJrpewrRJdwkmn
 178wi4zYSR02c8UtX7Wp/6xaJeR9CyQ026ZuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z3MHG14tc2eG/+APF37H02UsB6lju+oFSrZ5rNUU9nM=;
 b=i0+pEa2Ukxr44pqr+dI+AZO1C8a+oPS82apv43HAU8k2BpX2UjPYc8Vpu8sTHZ34NJ
 gooUnIerwdnlQ+chAGEoKSDsq+1Yaija9aJ16WfS/I3GQIFwEYblBJaKkv+8OWfGV9c2
 9RRr7IE7DDb+hEpqe2WqXI+nyHZL4+2z+i64XQADkjz7gHLCDVyvcXelAo41to5OVaiU
 4gfjXan+2e1ZT9SzS9rHTd9szqlCuVGSaB8uH38EeNneUAvUD+lDSkSiMKMLAKHnNzjL
 X8Bfv1w/IGcK+EO1C8usjQke7r47LcA4i9Qq8yOZ311GFF8QgVvzj25568fR2rBSf3+i
 fOng==
X-Gm-Message-State: APjAAAWbZJf1+mcXmFunGnbqa989rimen8tS0M6FP/fDf5lkR8DgElnc
 7Ew0wV15aW8+3NVOZ99BvzuJ3w==
X-Google-Smtp-Source: APXvYqyqC9Hjz1YyB+wh6btA3OaeG/yq8d4lLQECwY6xfMMH9Nq1RZ8JWHNj/fzcxIZhGtusuYAMWQ==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr12348724wmh.82.1576232870875; 
 Fri, 13 Dec 2019 02:27:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id i11sm9694436wrs.10.2019.12.13.02.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:27:50 -0800 (PST)
Date: Fri, 13 Dec 2019 11:27:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/3] drm/vram-helper: Support struct
 drm_driver.gem_create_object
Message-ID: <20191213102748.GG624164@phenom.ffwll.local>
References: <20191212074117.29283-1-tzimmermann@suse.de>
 <20191212074117.29283-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212074117.29283-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 08:41:17AM +0100, Thomas Zimmermann wrote:
> Drivers that what to allocate VRAM GEM objects with additional fields
> can now do this by implementing struct drm_driver.gem_create_object.
> 
> v2:
> 	* only cast to gbo within if branch; set gbo directly
> 	  in else branch
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index b760fd27f3c0..baa49d1e9538 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -2,6 +2,7 @@
>  
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_ttm_helper.h>
> @@ -145,7 +146,13 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  	struct drm_gem_vram_object *gbo;
>  	int ret;
>  
> -	gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
> +	if (dev->driver->gem_create_object) {
> +		struct drm_gem_object *gem =
> +			dev->driver->gem_create_object(dev, size);
> +		gbo = drm_gem_vram_of_gem(gem);
> +	} else {
> +		gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
> +	}
>  	if (!gbo)

See my other mail, I'd move the check too into if/else blocks. ERR_PTR
after an upcast is always a bit scary.
-Daniel

>  		return ERR_PTR(-ENOMEM);
>  
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
