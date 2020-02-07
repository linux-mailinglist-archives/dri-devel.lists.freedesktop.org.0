Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45D2155BFF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 17:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5446EAF7;
	Fri,  7 Feb 2020 16:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857ED6EAF7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 16:41:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k11so3428306wrd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 08:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hXraVBZybctSIz7nAzSlqbrdDzV8mhwLcEOWTzuchK8=;
 b=L716g/LiLX4GAYep8bx9JN2K0zRX+0zdV45FvIzbECwgsb785wVWFDVjXnmKnpnGGg
 al8GYLys4/2LJ6ChNe+bhB9dpIpufJC2FO8iC8tXKNRVm+I00qjeC7y1n7fYEHud5OfG
 AFvflsx38GwyVBDUcAms1AlOEwqrYD97DXsd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hXraVBZybctSIz7nAzSlqbrdDzV8mhwLcEOWTzuchK8=;
 b=GYjVdP8uMDaGRSxa0R8+honq3dPmmjWEONedQWEXvK5B2x018JBqTi/wSJTPwNX5tv
 pQR6X1erT8XIuVcoz8MOcQVfz04GLJMRm3avNXGdKZFNnuPistKTOEziWwUMyWFlradV
 XVk5ahKOtgZYKtWxG1s3uHzEGM647LFbIu6Hd+PYUICi1QDlmnWUvgxw4/C5TRLsdMH5
 T4d9r7fuSQ1s9VtWjLazx0EU3mykYk6f383G+/5xFHUAb+20A9rbNTo8kkBjPdhJZiYW
 mTub6PXLStajpCylTBWX7ofbtz+aFjxTptudzqEgkScoBX0IkdB8klEs6E7/pyPUqy1X
 M4BA==
X-Gm-Message-State: APjAAAWtxYJBLD4uwhC5HzgMi8UEeJGkCDuskIyjd7Rs1Wm1g44YaGKZ
 ZzBNWthDa/Z7Ssm3/9YzNYKJ+A==
X-Google-Smtp-Source: APXvYqzEH8wRgTPCMnHm56a2S+htFw5eE9F9ydeClHJAmvKakIY67ahVGugR61HeAvH0lUkIqCGTcA==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr5598761wrv.108.1581093710223; 
 Fri, 07 Feb 2020 08:41:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l131sm4040027wmf.31.2020.02.07.08.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 08:41:49 -0800 (PST)
Date: Fri, 7 Feb 2020 17:41:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/udl: Clear struct drm_connector_funcs.dpms
Message-ID: <20200207164147.GP43062@phenom.ffwll.local>
References: <20200207141602.4760-1-tzimmermann@suse.de>
 <20200207141602.4760-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207141602.4760-2-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, sam@ravnborg.org, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 03:16:02PM +0100, Thomas Zimmermann wrote:
> Atomic modesetting doesn't use struct drm_connector_funcs.dpms and
> the set function, drm_helper_connector_dpms(), wouldn't support it
> anyway. So keep the pointer to NULL.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

On both patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I just suggested a drm_mode_config_validate() to Ville in his patch
series, which runs in drm_dev_register(). Maybe we could add a check for
that for atomic drivers? It's a bit a game of whack-a-mole otherwise :-)
-Daniel

> ---
>  drivers/gpu/drm/udl/udl_connector.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
> index e9671d38b4a0..0afdfb0d1fe1 100644
> --- a/drivers/gpu/drm/udl/udl_connector.c
> +++ b/drivers/gpu/drm/udl/udl_connector.c
> @@ -109,7 +109,6 @@ static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
>  };
>  
>  static const struct drm_connector_funcs udl_connector_funcs = {
> -	.dpms = drm_helper_connector_dpms,
>  	.reset = drm_atomic_helper_connector_reset,
>  	.detect = udl_detect,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
