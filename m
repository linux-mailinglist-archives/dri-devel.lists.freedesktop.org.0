Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267781BC27E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 17:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657946E826;
	Tue, 28 Apr 2020 15:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D3C6E826
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 15:15:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v4so2607579wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 08:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yn8M6g86OIpdWY0eWe5/lYcoIX+3NTjGSgF/ptBwm/o=;
 b=H6SSYjBwPWWXBB+0KzyoILouyMyDgGP9+FYTr8CMUDXP6C1qvRnD3rAzz7JrynNNb2
 zfQFn2TUJd4H5r/y8X4bJ2P2CdDKq6CuWHM9nLjY7XNYAzBfTAfXyD0D+k1Z2kL80FB8
 VCe6GNM5SqtLRv79fcmUAT4YRYKzewnb+mnKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Yn8M6g86OIpdWY0eWe5/lYcoIX+3NTjGSgF/ptBwm/o=;
 b=mA3Zoj8sO8WT6owTSFCOc0PdUCRqvGz6SNNBXMwQasu+F2wdKOEmUdfvY2In7Qzbvl
 TGdNcPc9NVxzrPD5o+kh4U8nurKNYSA1z3ckBUJu6hbfd4oOEDY2ZrEddasJUMmD5Gq7
 SdMce1g8Xv9djVisCWdk22kCRIB/rLxGTN6AkUt/lJ+HQ0pdZuICMdF3EMLzc+e+NPvq
 9iCJTaEQA53xU+3X9TuAZI4YfSkSRsmVTFPPr5LsrVptdqHQejH4OAiQdZx3qBb9hai6
 8VSRK6wC0pICBk8EpdZC6QlMfipRJz7SCYlX+SRg5dcHgQBNUuBX0Tm/fAMH2mN+WRFh
 /wRw==
X-Gm-Message-State: AGi0PuZV5OYKIMZCQxJkHE9F6CjVmCfqrnYIbM9tlYAnXqGfaOUEZYOg
 G+9h70T2vihF2Lv81gWMB3V2IA==
X-Google-Smtp-Source: APiQypLan+NIXwt1O7aY8prkzguSWZNpvGFzg72miI7QE6xRrwrxztj6bOJextickiVknRj1I2zyYA==
X-Received: by 2002:a7b:c104:: with SMTP id w4mr5112868wmi.8.1588086941313;
 Tue, 28 Apr 2020 08:15:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s12sm3531003wmc.7.2020.04.28.08.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:15:40 -0700 (PDT)
Date: Tue, 28 Apr 2020 17:15:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Orzel <michalorzel.eng@gmail.com>
Subject: Re: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
Message-ID: <20200428151538.GV3456981@phenom.ffwll.local>
Mail-Followup-To: Michal Orzel <michalorzel.eng@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1587895282-2808-1-git-send-email-michalorzel.eng@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587895282-2808-1-git-send-email-michalorzel.eng@gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 26, 2020 at 12:01:22PM +0200, Michal Orzel wrote:
> As suggested by the TODO list for the kernel DRM subsystem, replace
> the deprecated functions that take/drop modeset locks with new helpers.
> 
> Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>

Hm can you pls resubmit with intel-gfx mailing list cc'ed? There's a CI
bot there for checking stuff. Patch looks good, thanks a lot for doing
this.

Thanks, Daniel
> ---
>  drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index 35c2719..901b078 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -402,12 +402,13 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_mode_obj_get_properties *arg = data;
>  	struct drm_mode_object *obj;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int ret = 0;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
>  	obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
>  	if (!obj) {
> @@ -427,7 +428,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
>  out_unref:
>  	drm_mode_object_put(obj);
>  out:
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(ctx, ret);
>  	return ret;
>  }
>  
> @@ -449,12 +450,13 @@ static int set_property_legacy(struct drm_mode_object *obj,
>  {
>  	struct drm_device *dev = prop->dev;
>  	struct drm_mode_object *ref;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int ret = -EINVAL;
>  
>  	if (!drm_property_change_valid_get(prop, prop_value, &ref))
>  		return -EINVAL;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	switch (obj->type) {
>  	case DRM_MODE_OBJECT_CONNECTOR:
>  		ret = drm_connector_set_obj_prop(obj, prop, prop_value);
> @@ -468,7 +470,7 @@ static int set_property_legacy(struct drm_mode_object *obj,
>  		break;
>  	}
>  	drm_property_change_valid_put(prop, ref);
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(ctx, ret);
>  
>  	return ret;
>  }
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
