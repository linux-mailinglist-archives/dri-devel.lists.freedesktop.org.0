Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCABD15FE54
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 13:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AF16E211;
	Sat, 15 Feb 2020 12:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588A96E211
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 12:23:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a6so13731480wme.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 04:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=twMZzL2TC1CoRlCRo2zfH0+zID2DF84OKfkXAsBJ6/g=;
 b=lOAWXDGMjofyAdZFu71FSuq8XqHEoAl0PuGTYHuKJAJ3hj0fCGkuiyfZFopVkgxZbx
 JNKWb0WA+6+TQZ6zjb8klh7gtp9tvCBtphvWzsT2KVz/0FA6Wne1dKQfq6UhKCNW6176
 LN3pyHCfuWGJv8f+OoToN5bAUcfoXWMdTTbxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=twMZzL2TC1CoRlCRo2zfH0+zID2DF84OKfkXAsBJ6/g=;
 b=rZGEkXQHCGeD8OaSw3eB+lBlDdM5ZrfvqCAAuCypPB8PyLGiUyq0cJnwfTtOgtiBS8
 VEHkdb3pSLk7o8kD47UCG2jDsPzEwIGFFVK59NsnhGJyWD3C4KJE/C2kkVWnP9J+kcMo
 in7dNeAcRO5xos90LB9GG3VgIH1PtOPhvusm31tpc7LEAR+UmjuqDRQ5Auy5NYl9fC1w
 CZ/AVvn8xZLsaoLX+9h9Ptba5hTD5rK0/8gMzfjj969Nf9VZxiV8t2tax5AxbTVX/qfr
 occHZxeil4877p9i8FGv2oZiLYkLWpSe8gHwMoDR68hD//1wv+hcW4dsSz9JMCURvs7O
 3BjA==
X-Gm-Message-State: APjAAAVVf1mTOKt2UCAIjfy5bo9BxMBb8sgxjpzQoeXiDT2nB2IsFMWR
 Cg1SdhwiejkNdFtgxcuq2PmZpA==
X-Google-Smtp-Source: APXvYqzKprT47wY72IAe/AV/eb2Wcc8IOAmHGXJpZmz/pI361HiP9u4u1lJoJR0XEqJ41oF9cXYTKA==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr10540475wme.28.1581769392926; 
 Sat, 15 Feb 2020 04:23:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g7sm11360723wrq.21.2020.02.15.04.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 04:23:12 -0800 (PST)
Date: Sat, 15 Feb 2020 13:23:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: drm/print: clean up RATELIMITED macros
Message-ID: <20200215122310.GB2363188@phenom.ffwll.local>
References: <20200214175919.GA14492@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214175919.GA14492@ravnborg.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 06:59:19PM +0100, Sam Ravnborg wrote:
> From 6fdc9c030ba88e6d0d8abc319f3dfe83751d5900 Mon Sep 17 00:00:00 2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Fri, 14 Feb 2020 18:54:42 +0100
> Subject: [PATCH v1 1/1] drm/print: clean up RATELIMITED macros
> 
> Drop a few indirections, making the code simpler.
> This also drops a RATELIMITED variant that is not in use.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>

Lots of turtles here :-)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/drm/drm_print.h | 27 +++++++--------------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index fd6ba2532f50..ca7cee8e728a 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -383,25 +383,6 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
>  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
>  
> -#define _DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, category, fmt, ...)	\
> -({									\
> -	static DEFINE_RATELIMIT_STATE(_rs,				\
> -				      DEFAULT_RATELIMIT_INTERVAL,	\
> -				      DEFAULT_RATELIMIT_BURST);		\
> -	if (__ratelimit(&_rs))						\
> -		drm_dev_dbg(dev, category, fmt, ##__VA_ARGS__);		\
> -})
> -
> -/**
> - * Rate limited debug output. Like DRM_DEBUG() but won't flood the log.
> - *
> - * @dev: device pointer
> - * @fmt: printf() like format string.
> - */
> -#define DRM_DEV_DEBUG_KMS_RATELIMITED(dev, fmt, ...)			\
> -	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_KMS,		\
> -					  fmt, ##__VA_ARGS__)
> -
>  /*
>   * struct drm_device based logging
>   *
> @@ -525,7 +506,13 @@ void __drm_err(const char *format, ...);
>  
>  
>  #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)				\
> -	DRM_DEV_DEBUG_KMS_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
> +({									\
> +	static DEFINE_RATELIMIT_STATE(_rs,				\
> +				      DEFAULT_RATELIMIT_INTERVAL,       \
> +				      DEFAULT_RATELIMIT_BURST);         \
> +	if (__ratelimit(&_rs))						\
> +		drm_dev_dbg(NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__);	\
> +})
>  
>  /*
>   * struct drm_device based WARNs
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
