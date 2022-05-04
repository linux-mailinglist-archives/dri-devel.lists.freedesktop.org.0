Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9B1519BAB
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218E8112008;
	Wed,  4 May 2022 09:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44157112006
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:27:23 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id t5so1003649edw.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 02:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ujA9Ei7p7js6ZRLVyhuGMYvuef/eHfjkXNE1xkCGCac=;
 b=a2QDIAsL8PjnNIlU96E9OKFb5JRWo/5cimilEnfUCl42Vwbi50OfKnghbRpmhwTRVy
 6uQ1OGyqHCyuVffyEXeE44qK+++U2SkGWgzhPeMPe9bcDHS+YFs9vRim6dX1DrQDfb3k
 dzSaD0Hcb05rsquh/Edr3uLN7e5BAC+QstFhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ujA9Ei7p7js6ZRLVyhuGMYvuef/eHfjkXNE1xkCGCac=;
 b=ysVxkGK5A12nOsaZ3t2RiZJzpT34R2xEIhbtjfrfuMEPlr72E8GH8fyddGq/1wA35c
 9UlDsbYnVb5xAxcMgGjW5vqxg6CP7NKaYjMg4gIXIJyZFCUkBmhH4smYbVLJKEgFPr7R
 +sUX99wUzy5bPSanp12I4ZCPQCj6uI5ZJtDpdAKrwrAePrTqU+M6Dpj5llZ/Idv7AO7f
 iMRI61I4uQHlg1XJENkJwdMAU+Aqbse/GEgYfwqhrGTtu5QNHhfPA4bEpBE5evPlj9kp
 z55WI7tW3ZwPiHXkpDWCwIQQ+KnV4hzSdKvr7WdheEBt6zBdFVQChlpf5aqfapknN/Fz
 1J6Q==
X-Gm-Message-State: AOAM533hK4Rxmw8GsaiPhhA/FF+rDmyV1EzVwCKOTwnGeoEUdhVNmxun
 2y/tP74lU4oNOfIMTX0s97rihg==
X-Google-Smtp-Source: ABdhPJztK+2f8hOmkj7yIY4OpPJD1pbs3HlTum+Il1H0W7eQxxllCRg40sUx50M/6m9W12KizlDa1g==
X-Received: by 2002:aa7:dcd5:0:b0:425:e49f:db86 with SMTP id
 w21-20020aa7dcd5000000b00425e49fdb86mr22083537edu.202.1651656441895; 
 Wed, 04 May 2022 02:27:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a170906845000b006f3ef214dc7sm5370091ejy.45.2022.05.04.02.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 02:27:21 -0700 (PDT)
Date: Wed, 4 May 2022 11:27:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/4] drm/qxl: add drm_gem_plane_helper_prepare_fb
Message-ID: <YnJG95uJDD6tK8RN@phenom.ffwll.local>
References: <20220429134230.24334-1-christian.koenig@amd.com>
 <20220429134230.24334-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220429134230.24334-4-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 03:42:30PM +0200, Christian König wrote:
> We could need to wait for the pin to complete here.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index 9a9c29b1d3e1..9a64fa4c7530 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -34,6 +34,7 @@
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  
>  #include "qxl_drv.h"
>  #include "qxl_object.h"
> @@ -829,6 +830,7 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
>  	struct qxl_device *qdev = to_qxl(plane->dev);
>  	struct drm_gem_object *obj;
>  	struct qxl_bo *user_bo;
> +	int ret;
>  
>  	if (!new_state->fb)
>  		return 0;
> @@ -852,7 +854,11 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
>  		qxl_free_cursor(old_cursor_bo);
>  	}
>  
> -	return qxl_bo_pin(user_bo);
> +	ret = qxl_bo_pin(user_bo);
> +	if (ret)
> +		return ret;
> +
> +	return drm_gem_plane_helper_prepare_fb(plane, new_state);
>  }
>  
>  static void qxl_plane_cleanup_fb(struct drm_plane *plane,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
