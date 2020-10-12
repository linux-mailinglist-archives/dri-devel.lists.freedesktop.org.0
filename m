Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF428B55F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 14:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419DE6E41D;
	Mon, 12 Oct 2020 12:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487726E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 12:59:31 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e2so17455983wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PhKbdSFITG4zl/fBs3MTagPx5bnK15x1VxbGWRKTUjM=;
 b=DItlsMbnsqSbnT3hc/v1IUUKLdxUfpUf9IU4IdHcT6/VHuZMI2PN8+llEZorJER9BY
 yzUr4Lp+jcY6R3Rz8i+r8QuvwiGeZ7XBgJtYOBwN83D2ctxYtlyqFRhXyIr0RR6dWcN8
 87IAtcoHPmqXbOYd5NIKcBi2qJN1b4idfjypJcFK5kJee+16k9ttJQML5y4X0I5fdMq+
 FH3kyV9AuD4A5IRaEMEzSaOAJYKiUTBBcj2lGLRC9R4l5ggF21VsmjhLXMmwPMv1CY0w
 LKhKAb4dErrR9iLeNhFohGwQvp71fQmMYeyPdNOQdKdekPoywPeHHWiqdU6eCxkxFmI5
 WKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PhKbdSFITG4zl/fBs3MTagPx5bnK15x1VxbGWRKTUjM=;
 b=M8NQWsoqNQqG6+5E/j6QT1EN906CBrI8W2Pf+FohBDnWlE19Uq/kXe8p3Z9OsNfEFg
 CG5AVLRkgqoNgsoLQlZOD+fRm/YHMyGoGiCZUUdsteuO/vLMBzYL8XGK5zqGs5T/dqF6
 kb7nwuRC+e4S7/ZVE/deHk7vE30hWE4O6vfncPUnHoHTlxAyVbJuky9KOaCeaEYyiQ3D
 6e38Yk8JJXPjx6h8qbJ9+N0oabMNr5LX24ghbalGn5ZGa8/YoK0GypXzvBPcnVLvAHV2
 z1HVc6YK6ElLEmQ0lVsphaGsar9uBBacWtQzXSi8GKoXGE+QwJvnlG+etqExxWMbkEkH
 +fCg==
X-Gm-Message-State: AOAM532Ko4mkMLOZZNVpc9Ibt8tOuo6PiubUHNayuLOpJjX4w0tqWiKW
 5UYDZ7UDAss05d0jnn+U39AE0vZvjs4=
X-Google-Smtp-Source: ABdhPJz/kuHyhLror3jxADfq3T8fXa2BwacEqRl73eUN1NP3nGGV5rgDO8EH0+GFiOd1MlWl4nicGw==
X-Received: by 2002:a7b:c085:: with SMTP id r5mr10569067wmh.17.1602507569967; 
 Mon, 12 Oct 2020 05:59:29 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id i8sm6294395wmd.14.2020.10.12.05.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:59:29 -0700 (PDT)
Date: Mon, 12 Oct 2020 09:59:22 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/vkms: Set preferred depth correctly
Message-ID: <20201012125922.utoehriuovbs66bk@smtp.gmail.com>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10, Daniel Vetter wrote:
> The only thing we support is xrgb8888.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 726801ab44d4..eb4007443706 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -124,7 +124,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	dev->mode_config.max_height = YRES_MAX;
>  	dev->mode_config.cursor_width = 512;
>  	dev->mode_config.cursor_height = 512;
> -	dev->mode_config.preferred_depth = 24;
> +	dev->mode_config.preferred_depth = 32;
nice catch!

>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>  
>  	return vkms_output_init(vkmsdev, 0);
> -- 
> 2.28.0
>
Thanks, 

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
