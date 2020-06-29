Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E69620CD76
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 11:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489C089D79;
	Mon, 29 Jun 2020 09:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB4D89D79
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 09:11:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l2so13869029wmf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fAiO1rFgpOm/I6YijU55QQd3dlYPh9BQxP+XXDSf6w8=;
 b=jVfXo+Bq23OCHyTQ3xEQE2g3migBIli0NqkXzMwBSn8IdovOjzXp6wZplzCSLjgsAj
 H18nB/MT+67CDA7FAXeAF862wgTA99pOUSOZGnk2zcn3bkDuiE7+bwenfgCRm9PO50PT
 QiORnrjFRJp9HTN0ofNn7kBXRyNz1m6QlaLfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fAiO1rFgpOm/I6YijU55QQd3dlYPh9BQxP+XXDSf6w8=;
 b=Vsf024+ZT9dy5BXn0KTZnh7JkhtaABxpATpGXmlFnimEAqa6npoTw+o/dBiR5HXH41
 bVgcf83zeRIxU9UERcQ7VxOex1hSNxZIvKTYy/XvIv3/ZegBLEX/PxFQbrrxazpUGegY
 9VEKjP8RuUq/kf1a5iKVS5bHm8JYOUXTBDHGzMAOc0HvweJCQ31Najdnsxdw0Y9fk6cH
 H9ZOv0kruTF+RO330dVXZwheaYr2b6Idd/EghsKGVxhzraa+AXlSUHhgIJEFJMMsw+xv
 hCEWw7J++oNrmq5TZ+zlbgcaUA2yg7+qNLgcUeWpPBNn1EH/NRVq28ieS3Ud//T8tgxl
 xERg==
X-Gm-Message-State: AOAM533VcGAnpwU+hIrSSl3pbm1rzEksHtUBrecxj+IqpTs4Rjv6elDb
 3LNVTQVDUfYT+C1HUlhjX0hA8g==
X-Google-Smtp-Source: ABdhPJzGxM3QDzwZh82Zc1G2uWTt6P/T65JO4byCTa9p9K6WlF78IK5WVBiZpmuSGhEPqbZPII3Aqg==
X-Received: by 2002:a1c:e303:: with SMTP id a3mr15379719wmh.26.1593421892570; 
 Mon, 29 Jun 2020 02:11:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c18sm21580188wmk.18.2020.06.29.02.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 02:11:31 -0700 (PDT)
Date: Mon, 29 Jun 2020 11:11:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/9] drm/simplekms: Add fbdev emulation
Message-ID: <20200629091129.GP3278063@phenom.ffwll.local>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625120011.16168-5-tzimmermann@suse.de>
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 02:00:06PM +0200, Thomas Zimmermann wrote:
> This displays a console on the simplefb framebuffer. The default
> framebuffer format is being used.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/simplekms.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/simplekms.c b/drivers/gpu/drm/tiny/simplekms.c
> index dc7cf3983945..ac2ebfcedd22 100644
> --- a/drivers/gpu/drm/tiny/simplekms.c
> +++ b/drivers/gpu/drm/tiny/simplekms.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_shmem_helper.h>
> @@ -469,6 +470,8 @@ static int simplekms_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	drm_fbdev_generic_setup(dev, 0);

I think for the fastboot stuff what we could do is improve the generic
fbdev code with essentially what intel_fbdev_init_bios does. Well actually
just shovel that code into the helpers maybe, the other code to pick
initial configs for fastboot has been moved already too.

Otherwise lgtm ofc.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	return 0;
>  }
>  
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
