Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3512038CA3E
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081106EE28;
	Fri, 21 May 2021 15:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55A86F3F0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 15:33:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x8so21480298wrq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 08:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=hSIZxyk96SLY1XQc0ujDhUeuMAPOJDJS58v+vou3vqU=;
 b=Sbw/57As09mDpcBGYQp3lkC801L3fY2gN/R6txd/32+cNs0LPsc9ddXDYBbIhaCsvg
 9fulOrU0ivZ8C4UDpYFNvK/sMe3ht6NLXkjpdzFPdPwycNvhvgGpfKVntFngOC4vmZJn
 Rox2+8t2qTDE+tGikX+8G2REPunu79FyIW0rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=hSIZxyk96SLY1XQc0ujDhUeuMAPOJDJS58v+vou3vqU=;
 b=j+sorzTvsAl45tZjV/drQowSXx84zkhE4whwdK1joPhYNeyZc4aG7tmfyjQ1W8hVja
 uRtUbOAhm84+RcFmc3A3GfDTaIKCl90sBjAC3F4WJIHgtbjSGAZ3slZ6ZOmslQg5Zd3i
 X5/EcAGW0vUF2urRs8Jb1ChQYunVJgp7FvhQzfuakuzGoSQwRZnUbJkuTe7ZYog3W571
 5ML2BxUyB48QskH5gHVoSXu4RtgrBEubjKe9lYAtIE5TfooUld2u3Mt20vSnvi3J8IMc
 bVZxSocIclCROUKFCTiRljX3G0XUKCjJBOQ2oLBYSjExUtQI1XTN0HBF2iSJaivv98lI
 FQng==
X-Gm-Message-State: AOAM532CeP2neuTVh+u0E145MCPITWptZ0pWv49Hxx0KdUNKxWJQtj+N
 29g50eDHcocbJpxlQvKwKrUlZw==
X-Google-Smtp-Source: ABdhPJyFAxjYLwd3JRLG1+e5wLLBwZ5a4eoEosj6V0G47O1d5wSUaiR91EvP476eAX0cwRU7w4HuPA==
X-Received: by 2002:a5d:5301:: with SMTP id e1mr10197031wrv.36.1621611226499; 
 Fri, 21 May 2021 08:33:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c6sm2528654wru.50.2021.05.21.08.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 08:33:45 -0700 (PDT)
Date: Fri, 21 May 2021 17:33:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
Message-ID: <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20210521131910.3000689-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521131910.3000689-1-javierm@redhat.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 03:19:10PM +0200, Javier Martinez Canillas wrote:
> Framebuffer devices that are registered by DRM drivers for fbdev emulation
> have a "drmfb" suffix in their name. But makes them to be quite confusing
> if a driver already has "drm" in its name:
> 
> $ cat /proc/fb
> 0 rockchipdrmdrmfb
> 
> $ cat /proc/fb
> 0 simpledrmdrmfb
> 
> Instead, let's just add a "-fb" suffix to denote that are DRM drivers FB:
> 
> $ cat /proc/fb
> 0 rockchipdrm-fb
> 
> $ cat /proc/fb
> 0 simpledrm-fb
> 
> Suggested-by: Peter Robinson <pbrobinson@gmail.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

So what with all the drivers which do _not_ have drm in their name? Also
I'm never sure how much these are uapi or not ...
-Daniel

> ---
> 
>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index f6baa204612..bbaff92c509 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1737,7 +1737,7 @@ void drm_fb_helper_fill_info(struct fb_info *info,
>  			       sizes->fb_width, sizes->fb_height);
>  
>  	info->par = fb_helper;
> -	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
> +	snprintf(info->fix.id, sizeof(info->fix.id), "%s-fb",
>  		 fb_helper->dev->driver->name);
>  
>  }
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
