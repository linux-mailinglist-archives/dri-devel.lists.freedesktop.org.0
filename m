Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89F1D5063
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 16:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAE56ECC5;
	Fri, 15 May 2020 14:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6F46ECC5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 14:26:56 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v12so3734800wrp.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N72W5q5bCYEpSAzB3q9dB6iQqb+9tTdm0OCW+uM5AKA=;
 b=RojEXUQ0JlM2bv2FrxX5JhNgEgiJiIVmF3w0lltr06Ps0BgY0xI9AG/mK86FDSoP+E
 4lz9YXjCoUpzBYOWSFvIGO4He5k3fYXRf+68ohAfZjZ3CzW152nJwDbe7IgNWGK2gtT5
 x0o4vovepfwdAPrSW1wDIIJqfw2tNRXTBcllA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N72W5q5bCYEpSAzB3q9dB6iQqb+9tTdm0OCW+uM5AKA=;
 b=q92wrUawAxVI01ZOrh8PO4xy/pgHGDZ0s06GjZrD+nfbYEzeh6dTRwnGABJxIsmG6Q
 av2kQvLtNnHz/7mkpaKtOF+ts77voqrJeA+jVV0JkimBh0mn4r4XxIBU8hYZyVRH652Y
 ZMjSID77zhk0wO4NOSledn2aJ62HMnMrF7a4b/BeuwxFujnG6dxAmku8j4n0yVloZ1aF
 E5aQD5eFu9tY7Jfz0BnroDrPXP5UbjZwrfSuUv4ceWfAMMxoSvV2nySv766AnHQUFQyP
 NGeVN+YZdouq4JkPA8grL9S8rNO0FZXVOfjWRpNHIApljMXO4CzrGmUu2cfUhZM7twsn
 GJrQ==
X-Gm-Message-State: AOAM533WHErbzwqWUX57yIlcfo9xe4xticBIICFjemh5Tp48E58wK/j/
 DAhuDQDCbJpPgHldTExYN44Ho7WvyQI=
X-Google-Smtp-Source: ABdhPJxsZ8/5kNfwmwUpua568TWAkDniLmaOJ8+tM0sQ7nf80IupP2CFq5DJ4vPDFNq1ldC7811C4Q==
X-Received: by 2002:adf:a1d7:: with SMTP id v23mr4562707wrv.155.1589552815364; 
 Fri, 15 May 2020 07:26:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w13sm3790507wrm.28.2020.05.15.07.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:26:54 -0700 (PDT)
Date: Fri, 15 May 2020 16:26:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 36/38] drm/vkms: remove _unlocked suffix in
 drm_object_put_unlocked
Message-ID: <20200515142653.GM206103@phenom.ffwll.local>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-37-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515095118.2743122-37-emil.l.velikov@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 10:51:16AM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Spelling out _unlocked for each and every driver is a annoying.
> Especially if we consider how many drivers, do not know (or need to)
> about the horror stories involving struct_mutex.
> 
> Just drop the suffix. It makes the API cleaner.
> 
> Done via the following script:
> 
> __from=drm_gem_object_put_unlocked
> __to=drm_gem_object_put
> for __file in $(git grep --name-only $__from); do
>   sed -i  "s/$__from/$__to/g" $__file;
> done
> 
> v2:
>  - Rebase
> 
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org> (v1)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vkms/vkms_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
> index c541fec57566..a017fc59905e 100644
> --- a/drivers/gpu/drm/vkms/vkms_gem.c
> +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> @@ -141,7 +141,7 @@ int vkms_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	args->size = gem_obj->size;
>  	args->pitch = pitch;
>  
> -	drm_gem_object_put_unlocked(gem_obj);
> +	drm_gem_object_put(gem_obj);
>  
>  	DRM_DEBUG_DRIVER("Created object of size %lld\n", size);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
