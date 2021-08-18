Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0526F3F03C4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2C36E563;
	Wed, 18 Aug 2021 12:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91366E570
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:33:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id o15so1519438wmr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=/kPkZnxCseyNGFYqNVSGcQsVjtVBqcnkc+52Vw1oueY=;
 b=ei1LAdw3Yo9TtmY7ACcZl7HtyCXVHnxV90OCrfV9+MCQa55nqDukstwBZHdMvn4p6K
 MJjq8LEuiuP/E7p5GwIbln2ShfaFJXz7l4S1V702Hm5QTHpz54omjPKiWyqBI0DfrZR+
 BfQ5laKun9WzFn3RPvWhseDZV3bGHSkTln0iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=/kPkZnxCseyNGFYqNVSGcQsVjtVBqcnkc+52Vw1oueY=;
 b=X1N+AIe4zLV1CasWCLVJuphaC+KEsdG+1n4GXz/pf6gDx/xMuvEv1iIi75xlTW7Fsr
 yPJgnl7i9i76Tva4cURis6soBpurn6JULBUvqmSTdFwBWjnYr3YfHB+sMxVrszamzRn1
 jQKc7+WMcgQnmc4J/oNvYrg/FNjZIqdg70L9GHwhe2pM9xT9b/S6PvHN0pzYgA7KPNk3
 ZZppodv2dgsC+S4A7+H63GTZMOnPMSNkgB/i5Jxu7pc+LBxWscQ1m8mcBV+iscb0oKDl
 tDiyiMJOlW26LAjDJs+WkfZhsW35cUrFuVUe1qwu9NAIoWSRAMDCvQG+KqCbRIU3/ORz
 E9sw==
X-Gm-Message-State: AOAM531gixpJwKvLShlDiq7szXJq2a+fRCchrBIkbkXxTjb/+ZxYECqM
 skg2DNJ1jrc0lxMxktHKU7GmtA==
X-Google-Smtp-Source: ABdhPJy73y4hlWKTsw/rmU3KmuCCnMP+U4B1NZoZBVvFGViLGR2WxoUx2a20UmoD7AtWAFRCZ1xCJw==
X-Received: by 2002:a05:600c:2150:: with SMTP id
 v16mr5229827wml.143.1629290023492; 
 Wed, 18 Aug 2021 05:33:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h6sm5604992wmq.5.2021.08.18.05.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 05:33:42 -0700 (PDT)
Date: Wed, 18 Aug 2021 14:33:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Remove unused code to load the non-existing fbcon.ko
Message-ID: <YRz+JZQqvBRm+L1A@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20210818120948.451896-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818120948.451896-1-javierm@redhat.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 18, 2021 at 02:09:48PM +0200, Javier Martinez Canillas wrote:
> Commit 6104c37094e7 ("fbcon: Make fbcon a built-time depency for fbdev")
> changed the FRAMEBUFFER_CONSOLE Kconfig symbol from tristate to bool.
> 
> But the drm_kms_helper_init() function still attempts to load the fbcon
> module, even when this is always built-in since the mentioned change.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Nice catch. Merged to drm-misc-next for 5.16, thanks.
-Daniel

> ---
> 
>  drivers/gpu/drm/drm_kms_helper_common.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
> index f933da1656eb..47e92400548d 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -64,17 +64,6 @@ MODULE_PARM_DESC(edid_firmware,
>  
>  static int __init drm_kms_helper_init(void)
>  {
> -	/*
> -	 * The Kconfig DRM_KMS_HELPER selects FRAMEBUFFER_CONSOLE (if !EXPERT)
> -	 * but the module doesn't depend on any fb console symbols.  At least
> -	 * attempt to load fbcon to avoid leaving the system without a usable
> -	 * console.
> -	 */
> -	if (IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
> -	    IS_MODULE(CONFIG_FRAMEBUFFER_CONSOLE) &&
> -	    !IS_ENABLED(CONFIG_EXPERT))
> -		request_module_nowait("fbcon");
> -
>  	return drm_dp_aux_dev_init();
>  }
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
