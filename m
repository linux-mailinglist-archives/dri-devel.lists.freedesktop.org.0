Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030F30C370
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 16:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D04C6E1D5;
	Tue,  2 Feb 2021 15:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6686E1D5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 15:18:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 190so2832848wmz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jcuU2XZ6+7nveeSZSHeH7qCej2d9koj9+XGVqebq3sQ=;
 b=MOFW1WFIEsMjyCZJ826+TTfov76++6PlkYwLeyMgd4rlHf+WYMA4M0mTGQdg3tyokK
 muk2ihO3Jy/JTefspB65o3HNF16VxBbYf75daImvndc77mUFwmdKGsaKF3csHxJyEQZx
 uzTOP9hoQSwx5kCg4HTXrmU78LTPH+qcjirpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jcuU2XZ6+7nveeSZSHeH7qCej2d9koj9+XGVqebq3sQ=;
 b=ZFO7fySGpHNNtdfi8hesDWd7+KaBq0HOD8R376XipK4buqRP+2x3MQXXsdUXGRorsF
 Cz9eIAnuMs5hrmjVqj2py2JG+vsxkz63C9nhThMsXC5pMBt0EJYt0Oy7/XJJXOggjlks
 GFhxAhdkRRdz+O/ii8vfs+TQ5nhCfLo7c9GtGyvwZjhlFxxgDeSxoHVj3uSq/eR1gxhf
 twcLWBTHM2ogwdpsLxByJsLn5v4ozRGgYgb7oTsm5t7ok+Bred0CQQLQn8ZxDrZfg4Kl
 1ebx21lyofO7kJLSSpqIDmb7dn3idrDRfP2h4dhUr/5A8hBdv2XaW2+dXC/rnEmwlWs2
 MLvg==
X-Gm-Message-State: AOAM533s+J9D55NqhycV5B7qPMn3TNhE/2jKgM5un7a34mJgh5VYGnJL
 0MfsrfYZJUrs39iCHhoXaVQh9w==
X-Google-Smtp-Source: ABdhPJyXahoGh7cSbhQqSYSGnM1E/3edNSghwoms0O2OVWmAJbFSu24irZl99GK4rl2AYOIehAGy0g==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr4028567wmh.77.1612279124286; 
 Tue, 02 Feb 2021 07:18:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l5sm31745266wrv.44.2021.02.02.07.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:18:43 -0800 (PST)
Date: Tue, 2 Feb 2021 16:18:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Joseph Schulte <joeschulte.js@gmail.com>
Subject: Re: [PATCH] drm: replace drm_modeset_lock_all() in
 drm_client_modeset_dpms_legacy()
Message-ID: <YBltUVYGd+3Y2o5L@phenom.ffwll.local>
References: <20210125144815.8389-1-joeschulte.js@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125144815.8389-1-joeschulte.js@gmail.com>
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
Cc: tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 08:48:15AM -0600, Joseph Schulte wrote:
> This patch helps complete Use  DRM_MODESET_LOCK_ALL* helpers instead of
> boilerplate todo in Documentation/gpu/todo.rst
> 
> Signed-off-by: Joseph Schulte <joeschulte.js@gmail.com>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_client_modeset.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index b7e9e1c2564c..ced09c7c06f9 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -7,6 +7,7 @@
>   * Copyright (c) 2007 Dave Airlie <airlied@linux.ie>
>   */
>  
> +#include "drm/drm_modeset_lock.h"
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> @@ -1181,9 +1182,11 @@ static void drm_client_modeset_dpms_legacy(struct drm_client_dev *client, int dp
>  	struct drm_device *dev = client->dev;
>  	struct drm_connector *connector;
>  	struct drm_mode_set *modeset;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int j;
> +	int ret;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	drm_client_for_each_modeset(modeset, client) {
>  		if (!modeset->crtc->enabled)
>  			continue;
> @@ -1195,7 +1198,7 @@ static void drm_client_modeset_dpms_legacy(struct drm_client_dev *client, int dp
>  				dev->mode_config.dpms_property, dpms_mode);
>  		}
>  	}
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  }
>  
>  /**
> -- 
> 2.30.0
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
