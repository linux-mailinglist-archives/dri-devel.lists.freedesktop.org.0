Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF6C360F1F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 17:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C756EA6D;
	Thu, 15 Apr 2021 15:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FDA6EA6D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 15:39:45 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g9so7735276wrx.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XSCsclVlGcjE/3n2VHF66XJpI7uBMlI8sjreDxm42bQ=;
 b=cBGi61gIsnbTHhD2mXwwYuiXLUzuneTFEMKIfvQPiPJ2hS5WHVmXTF8y5ig/iSGgfJ
 IpMobIWVPLAxYI9btQyAP5/vQ8YaCuWy6eMCJVJBGJ3xrr+1dcie8nQAmWqp8fZbMeHv
 ezmqWpyrwlVczGNX8JADJqyzSYb/VcDTKu06c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XSCsclVlGcjE/3n2VHF66XJpI7uBMlI8sjreDxm42bQ=;
 b=g7sVGJURQ0y1Kvu2aEnRNOZtxri5XRU9WjiQVSwBGZBc65+Z4kftlDJLckrawNmJiG
 n2N4grpoV+79usdURGyo7SbiywobIdhvn4dKsICU5YEY+7NE6dUGUKfyokI31RFk8ntL
 i/GNYV18PfXQUUhhcblKakagALU9reM7nxHuitb7EEPxxaGIL8zX+omOPKkXknj5x9KJ
 WUkKrliz33aRrGyg8nKNWTcfJW969Q4omD0V1sf4u3mDK31fTCuN+1lZPIDZcIvuJusq
 UvCRCfyrqMO9b1njsfP8K1nYJEfFjx4TSLTDXEWtub47J0uSW6WIqYqGrVDorQdrBHS/
 h7Qw==
X-Gm-Message-State: AOAM532RFTTjElicQ1VYswKx3eTTwbIofvPUT1UA8lofX6wKVBWncRs4
 Pkk/qSkNt5WTrFlWyzpjHs64qw==
X-Google-Smtp-Source: ABdhPJxuGJBUrUov6tav3dzBAB0Nmjs31lo2ZDkoMbFv/w3IXmQK1LERgvEtsv0USSugxMC1h1eJHQ==
X-Received: by 2002:a5d:564b:: with SMTP id j11mr4288509wrw.307.1618501183832; 
 Thu, 15 Apr 2021 08:39:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g3sm4063869wrp.46.2021.04.15.08.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 08:39:43 -0700 (PDT)
Date: Thu, 15 Apr 2021 17:39:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/4] drm: Remove DRM_KMS_FB_HELPER Kconfig option
Message-ID: <YHhePNFHkX2cmkwt@phenom.ffwll.local>
References: <20210415110040.23525-1-tzimmermann@suse.de>
 <20210415110040.23525-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415110040.23525-5-tzimmermann@suse.de>
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
Cc: marex@denx.de, kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, s.hauer@pengutronix.de,
 sroland@vmware.com, linux-graphics-maintainer@vmware.com, shawnguo@kernel.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 01:00:40PM +0200, Thomas Zimmermann wrote:
> It's only used by DRM_FBDEV_EMULATION, so inline it there.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I'm not sure on patch 1, I'll leave that to Zack, but I think 2-4 would
work alone too. On those:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/Kconfig | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3c16bd1afd87..d3a9ca4b1cec 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -80,23 +80,6 @@ config DRM_KMS_HELPER
>  	help
>  	  CRTC helpers for KMS drivers.
>  
> -config DRM_KMS_FB_HELPER
> -	bool
> -	depends on DRM_KMS_HELPER
> -	select FB
> -	select FRAMEBUFFER_CONSOLE if !EXPERT
> -	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
> -	select FB_SYS_FOPS
> -	select FB_SYS_FILLRECT
> -	select FB_SYS_COPYAREA
> -	select FB_SYS_IMAGEBLIT
> -	select FB_CFB_FILLRECT
> -	select FB_CFB_COPYAREA
> -	select FB_CFB_IMAGEBLIT
> -	select FB_DEFERRED_IO
> -	help
> -	  FBDEV helpers for KMS drivers.
> -
>  config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>          bool "Enable refcount backtrace history in the DP MST helpers"
>  	depends on STACKTRACE_SUPPORT
> @@ -117,6 +100,17 @@ config DRM_FBDEV_EMULATION
>  	depends on DRM
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_FB_HELPER
> +	select FB
> +	select FB_CFB_FILLRECT
> +	select FB_CFB_COPYAREA
> +	select FB_CFB_IMAGEBLIT
> +	select FB_DEFERRED_IO
> +	select FB_SYS_FOPS
> +	select FB_SYS_FILLRECT
> +	select FB_SYS_COPYAREA
> +	select FB_SYS_IMAGEBLIT
> +	select FRAMEBUFFER_CONSOLE if !EXPERT
> +	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>  	default y
>  	help
>  	  Choose this option if you have a need for the legacy fbdev
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
