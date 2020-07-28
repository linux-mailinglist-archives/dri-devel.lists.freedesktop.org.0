Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF5B23067A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499E189DD3;
	Tue, 28 Jul 2020 09:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B7689DD3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:23:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g8so5457604wmk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eRefaCO+PggZ7KDJmnnuZ/7bN0AuFDskEzpEvyjSny4=;
 b=bc7l+iqrLN4IOTcjAq0ozmN7OPCddanSm6TWwgoRufpDaa726+Og0JNnn7pfiC9X4B
 7X7uhuXwyRSosIHurndYiIPEAyYxS0/bGTNWm1iIHcVEHjcIHImZ9XoXvUM+lZuWmXki
 72ii/DSMvXxXn4c52on387NONzNufcwSJOHQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eRefaCO+PggZ7KDJmnnuZ/7bN0AuFDskEzpEvyjSny4=;
 b=SdkqmVurMaWoovUyv8/12Pu6av5QbTRzPErPS1eGqnJQIH5cKxxNioTukOC6u5nRJO
 N0fgoiGIyOSf0+2zMzXhRgdAl1/zS9LyvNk54vxLz78I/W8Q8W8t0ttemRmU9+t9TS9h
 emu0AoWxygqBUsJDytDnw7x6zR7mvrZvr/sQ1qB4OD+4y9sb/T2+qt6laHmiVgPKZMS4
 tfMtw9jc0OMA7VQbn+rzVHL56tEmfhbC9YHCsxpvYv9llxFf2n21SNl73Gg1z/ou0Dcx
 7c5aMt43SEdvYggvImLnS+KM7I502U08vjst4mwznsk+rcdMtXrkAWlHVvnukK7he1qO
 wzlQ==
X-Gm-Message-State: AOAM533wmqRqiP6JGBmm8pSNosbEcVYypkHP85tmgRRv5/tWPV39GPAy
 lmqnR9M7O6TVCsdaPeYWZvbsjk8Hups=
X-Google-Smtp-Source: ABdhPJylP1/3C6RbLJgow1U1cXTkNZSsfOg6FNktBhiApH7eLB7rIMqa2mgga1hQVcGrEeUi8jp6UQ==
X-Received: by 2002:a7b:cd09:: with SMTP id f9mr2959287wmj.184.1595928219555; 
 Tue, 28 Jul 2020 02:23:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p14sm16872249wrx.90.2020.07.28.02.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 02:23:38 -0700 (PDT)
Date: Tue, 28 Jul 2020 11:23:37 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 04/13] drm/ast: Managed release of I2C adapter
Message-ID: <20200728092337.GD6419@phenom.ffwll.local>
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728074425.2749-5-tzimmermann@suse.de>
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 09:44:16AM +0200, Thomas Zimmermann wrote:
> Managed releases of the device's I2C adapter simplify the connector's
> release.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I think this breaks bisect, since at this point the release callback is
called when the connector is already gone. At the end of the series it's
fine again though.

I've done a very cursory reading of your series to look for high-level
issues, I think overall reasonable. On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But maybe you want to polish a bit more, up to you.
-Daniel

> ---
>  drivers/gpu/drm/ast/ast_mode.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index f421a60d8a96..27eb49bd12b3 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -39,6 +39,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -591,6 +592,14 @@ static void ast_i2c_setsda(void *i2c_priv, int data)
>  	}
>  }
>  
> +static void ast_i2c_release(struct drm_device *dev, void *data)
> +{
> +	struct ast_i2c_chan *i2c = data;
> +
> +	i2c_del_adapter(&i2c->adapter);
> +	i2c->dev = NULL; /* clear to signal absence of I2C support */
> +}
> +
>  static int ast_i2c_init(struct ast_i2c_chan *i2c, struct drm_device *dev)
>  {
>  	int ret;
> @@ -618,7 +627,7 @@ static int ast_i2c_init(struct ast_i2c_chan *i2c, struct drm_device *dev)
>  
>  	i2c->dev = dev; /* signals presence of I2C support */
>  
> -	return 0;
> +	return drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
>  }
>  
>  static bool ast_i2c_is_initialized(struct ast_i2c_chan *i2c)
> @@ -626,14 +635,6 @@ static bool ast_i2c_is_initialized(struct ast_i2c_chan *i2c)
>  	return !!i2c->dev;
>  }
>  
> -static void ast_i2c_fini(struct ast_i2c_chan *i2c)
> -{
> -	if (!ast_i2c_is_initialized(i2c))
> -		return;
> -	i2c_del_adapter(&i2c->adapter);
> -	i2c->dev = NULL; /* clear to signal absence of I2C support */
> -}
> -
>  /*
>   * Primary plane
>   */
> @@ -1139,8 +1140,6 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
>  
>  static void ast_connector_destroy(struct drm_connector *connector)
>  {
> -	struct ast_connector *ast_connector = to_ast_connector(connector);
> -	ast_i2c_fini(&ast_connector->i2c);
>  	drm_connector_cleanup(connector);
>  	kfree(connector);
>  }
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
