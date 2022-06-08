Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA705438DE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 18:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD299112A05;
	Wed,  8 Jun 2022 16:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19676112A05
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 16:27:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 m125-20020a1ca383000000b0039c63fe5f64so989924wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 09:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oCTC0rJxHGVpZaf9IR/oB1a63JI7pPGY2/lbupmwRWk=;
 b=M26XXSG1Q+UzCYhOkPJGJyQsIyXhYGeqeJkowYtm/eCPuF6kZcibGYLjs8Ow8/f7KE
 kPz0BrfYKVXK4gmY634ktznqcTdLehuCso5JjOFzjTpWn30+yGNTwXsoxNWXpXdKKTRL
 5K0kSjep8bdYHIoaC/vUapQGRqwvlALvsZmW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oCTC0rJxHGVpZaf9IR/oB1a63JI7pPGY2/lbupmwRWk=;
 b=Kw0+ZbcIASRrESS/yVP15cA+fN7JLWTdzfMehqfTcB1lk1EUBwOhWHUfZfCmeuv6/B
 uNH+9lL+AwgyDWssli76dGFah5xztweu1KnL1sZLTV897oPjt0pZZd4s6OSrMx+lZ1HQ
 DxYr57AQ+9ZdHusPoGD33+0fouU8W+xtlgcvEca3enLpUVPgfMWEoe1ZvzFsTAI4yOa+
 +N3Pe45sc0cogT6IUsi3FwvxAF9du+mtbXCbniROcTL3Q4HER8jQ/P7RD2MnvYyazwue
 +YhHz2Oe57gG4/IuJFB0o5p7skxFAZZ6PfTTiD9JAAGmen3VxWy4FenxEKAvnjblNzny
 /tWw==
X-Gm-Message-State: AOAM531QPpUmSJQ7KCyUPBnrJs7+fZnk8nuFj0tqIVozNaMXjUuN0fGQ
 4sb/jA3rAw/+oa6p2PNm47mhaA==
X-Google-Smtp-Source: ABdhPJze8XU9mUV/RUpc0JIRvPBYzOn9hiLjT9YwnJ7PLZRdjb4TIQAWemQOh0BbpbtjQbtUxJNv7A==
X-Received: by 2002:a1c:4d05:0:b0:39c:5932:d9f1 with SMTP id
 o5-20020a1c4d05000000b0039c5932d9f1mr41042wmh.52.1654705672658; 
 Wed, 08 Jun 2022 09:27:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v190-20020a1cacc7000000b003975c7058bfsm24657378wme.12.2022.06.08.09.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:27:52 -0700 (PDT)
Date: Wed, 8 Jun 2022 18:27:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Include <linux/vmalloc.h> for G200 BIOS code
Message-ID: <YqDOBgCtGOMHsVPQ@phenom.ffwll.local>
References: <20220608115122.7448-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608115122.7448-1-tzimmermann@suse.de>
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
Cc: jfalempe@redhat.com, kernel test robot <lkp@intel.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 01:51:22PM +0200, Thomas Zimmermann wrote:
> After moving the vmalloc() call to another file, the rsp include
> statement needs to be moved as well. Resolves a build warning on
> parisc.
> 
>  drivers/gpu/drm/mgag200/mgag200_g200.c: In function
> 	'mgag200_g200_init_refclk':
>  drivers/gpu/drm/mgag200/mgag200_g200.c:120:16: error: implicit
> 	declaration of function 'vmalloc'; did you mean 'kvmalloc'?
> 	[-Werror=implicit-function-declaration]
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 85397f6bc4ff ("drm/mgag200: Initialize each model in separate function")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Link: https://lore.kernel.org/all/202206080734.ztAvDG7O-lkp@intel.com/

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.c  | 1 -
>  drivers/gpu/drm/mgag200/mgag200_g200.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 361eb7dffda1..73e8e4e9e54b 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -8,7 +8,6 @@
>  
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/vmalloc.h>
>  
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
> index 616e11391e02..674385921b7f 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
>  #include <linux/pci.h>
> +#include <linux/vmalloc.h>
>  
>  #include <drm/drm_drv.h>
>  
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
