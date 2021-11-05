Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9679844682E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 18:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB376EC5E;
	Fri,  5 Nov 2021 17:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B556EC5E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 17:53:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so10142048wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3qgpnu4+F949fFLt8z7lhntewhGpkCVCzWBi5xlW0s0=;
 b=dmlBo/fkpE9Iw7lZw2Qa6cY2qshJgOqn/esRDkYVWJovgHLAEfPt31IG47x6DF8jVM
 4ER8ljNzvW3nHCpkHveERc8dU94O8eFXdh0pmFSOcFDfUcoBREFZWbP2pQQKb3lMW0Nl
 NG05r2mL1x53BdJjnSZ5Qcs4k3ZemviXqIu88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=3qgpnu4+F949fFLt8z7lhntewhGpkCVCzWBi5xlW0s0=;
 b=FTKxTjomJX+EMrFS0HGYHI1CrLfSYEMdDawFWP+KP2vwN+D0pFs4drFSJZ1mC+W96i
 iStrdEO3VKFbmhkZ+ot+AFYQbdWx7ni9LOXl5CkK6l/rzK2/VUfpWlR16fL18iQn6vqR
 gpVvLBu7dmyLnMME0gTNi2p4386afGVfvRGHrtaVoG9S3wMBaRa3HPV6VxjBOFHjn3HJ
 u5DwtNuFy/Fc32gYRWl0ZgVOkAzsVYWQ66k5K3Lio1WKqr+kLeX3ga+guLqY77MsW6fU
 2OOMG1YjzOaFaAJcrR/FrxQDEQkcPJm30moCG9aKETt2V0QNWfvMRuePp2INyIX5CpTm
 ODwA==
X-Gm-Message-State: AOAM532UNPCT8zBVk7/4F7BfuiP+qxRqM55lcbAt9WjeXpphbEVdGkMb
 z8WQVRgTLSg8GF3jKsXjFuGoUg==
X-Google-Smtp-Source: ABdhPJxj4ymiq7qSLhQiUYJ5j1gU+jqd+d6bDAotiSbE0ZcSDcoiY/LEjRjkGyWD86rZ5EdVzoa5cA==
X-Received: by 2002:a05:600c:1c13:: with SMTP id
 j19mr31954323wms.175.1636134788288; 
 Fri, 05 Nov 2021 10:53:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i15sm11461959wmb.20.2021.11.05.10.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 10:53:07 -0700 (PDT)
Date: Fri, 5 Nov 2021 18:53:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm: fb_helper: improve CONFIG_FB dependency
Message-ID: <YYVvgVNz+py5H4Yz@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 "Acked-by : Jani Nikula" <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211029120307.1407047-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029120307.1407047-1-arnd@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, "Acked-by : Jani Nikula" <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 29, 2021 at 02:02:38PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> My previous patch correctly addressed the possible link failure, but as
> Jani points out, the dependency is now stricter than it needs to be.
> 
> Change it again, to allow DRM_FBDEV_EMULATION to be used when
> DRM_KMS_HELPER and FB are both loadable modules and DRM is linked into
> the kernel.
> 
> As a side-effect, the option is now only visible when at least one DRM
> driver makes use of DRM_KMS_HELPER. This is better, because the option
> has no effect otherwise.
> 
> Fixes: 606b102876e3 ("drm: fb_helper: fix CONFIG_FB dependency")
> Suggested-by: Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Queued up for the merge window, thanks for the patch.
-Daniel

> ---
>  drivers/gpu/drm/Kconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index c08860db2520..d2e6d8ce5000 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -117,9 +117,8 @@ config DRM_DEBUG_MODESET_LOCK
>  
>  config DRM_FBDEV_EMULATION
>  	bool "Enable legacy fbdev support for your modesetting driver"
> -	depends on DRM
> -	depends on FB=y || FB=DRM
> -	select DRM_KMS_HELPER
> +	depends on DRM_KMS_HELPER
> +	depends on FB=y || FB=DRM_KMS_HELPER
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
