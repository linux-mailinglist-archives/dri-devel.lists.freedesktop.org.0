Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EFF132ABF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 17:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C922F6E0F6;
	Tue,  7 Jan 2020 16:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EBA6E0F6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 16:08:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so82377wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 08:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BXvWgkuj/NNYdBMLphidsp54Cn9l4cFWpBrKJFZ3lBw=;
 b=YeIgv7PA97JsNHQN7Uus31ErlX8KtynioGQUBeY0aG5s+XWwIYG/RZVuwDLnyocgWj
 XbxsYyGwV3Wq39TpNqzLO8r19mU70UP6XNKKfa5+AGGvWxVpeaAM4+G8SeufuGRBinkB
 C5watg4E92PomkgYg+nyQ7S0ZkFsLldK6uaqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BXvWgkuj/NNYdBMLphidsp54Cn9l4cFWpBrKJFZ3lBw=;
 b=VvAaC7A+Cl8JQCXbmmwbjWXzSukRoO+TiCu4AeDHi4VOv6oAggqxb2Y62TlYgQ1Wro
 VNHI/d+FTLkfKW0XiVQZxpzUvsF4Jkenh1jYgfuvjnzuqr34NmdgH2lkzcM9omdTtRVA
 7NU5NK/MB0A5tcznhYLJj9Q4I5U4g0pPt+4LJz51ZP7lzEuFJ5HCQM6j2636SfeVTlou
 LB4RIR1i5/1tOZsU9YmnLjm8ea1Nnx8oAfQry5E+ID33HI4l/ncQa4BXvwtpOiDsY08o
 teiBy1vCOcFIFSIX72BqMGSLO3dmxzCZI4LaGsrCPdhuZNG2qvinoa1XMcvwh81iPvRW
 LjdQ==
X-Gm-Message-State: APjAAAUc25yX2LWpgoVKa8TI+Cfcg9dPMqhsbgHqUsHZUtpQakuAQaWN
 ca44uFo22ACGxZHJSOLNH0bhUw==
X-Google-Smtp-Source: APXvYqyK7Bn2bQ6P/pDVqtmijK918pZ/4WMn5nvck5EJUvk7jJ288GGy0Usar+I6z6+5M6eYUtURXQ==
X-Received: by 2002:a05:600c:1103:: with SMTP id
 b3mr39001505wma.141.1578413335545; 
 Tue, 07 Jan 2020 08:08:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id n14sm87985wmi.26.2020.01.07.08.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 08:08:54 -0800 (PST)
Date: Tue, 7 Jan 2020 17:08:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 2/2] drm/print: document DRM_ logging functions
Message-ID: <20200107160852.GD43062@phenom.ffwll.local>
References: <20200102221519.31037-1-sam@ravnborg.org>
 <20200102221519.31037-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102221519.31037-3-sam@ravnborg.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 02, 2020 at 11:15:19PM +0100, Sam Ravnborg wrote:
> Document the remaining DRM_ logging functions.
> As the logging functions are now all properly
> listed drop the few specific kernel-doc markers
> so we keep the relevant parts in the documentation.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/drm/drm_print.h | 84 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 80 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 89e75eea65d2..abe247199bf7 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -335,6 +335,82 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>   *
>   * See enum &drm_debug_category for a description of the categories.
>   *
> + * Logging when a &device * is available, but no &drm_device *
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> + *
> + * DRM/Drivers can use the following functions for logging when there is a
> + * struct device * available.
> + * The logging functions share the same prototype:

I'd replace the entire block with a "This stuff is deprecated" warning. We
have at least a corresponding todo.rst entry.
-Daniel

> + *
> + * .. code-block:: c
> + *
> + *   void DRM_xxx(struct device *, char * fmt, ...)
> + *
> + * .. code-block:: none
> + *
> + *   # Plain logging
> + *   DRM_DEV_INFO(dev, fmt, ...)
> + *   DRM_DEV_ERROR(dev, fmt, ...)
> + *
> + *   # Log only once
> + *   DRM_DEV_INFO_ONCE(dev, fmt, ...)
> + *
> + *   # Ratelimited - do not flood the logs
> + *   DRM_DEV_DEBUG_RATELIMITED(dev, fmt, ...)
> + *   DRM_DEV_DEBUG_DRIVER_RATELIMITED(dev, fmt, ...)
> + *   DRM_DEV_DEBUG_KMS_RATELIMITED(dev, fmt, ...)
> + *   DRM_DEV_DEBUG_PRIME_RATELIMITED(dev, fmt, ...)
> + *   DRM_DEV_ERROR_RATELIMITED(dev, fmt, ...)
> + *
> + *   # Logging with a specific category
> + *   DRM_DEV_DEBUG(dev, fmt, ...)		# Logged as CORE
> + *   DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)
> + *   DRM_DEV_DEBUG_KMS(dev, fmt, ...)
> + *   DRM_DEV_DEBUG_PRIME(dev, fmt, ...)
> + *   DRM_DEV_DEBUG_ATOMIC(dev, fmt, ...)
> + *   DRM_DEV_DEBUG_VBL(dev, fmt, ...)
> + *   DRM_DEV_DEBUG_DP(dev, fmt, ...)
> + *
> + * Logging when no &device * nor &drm_device * is available
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> + *
> + * DRM/Drivers can use the following functions for logging when there is no
> + * extra info associated to the logging.
> + * The logging functions share the same prototype:
> + *
> + * .. code-block:: c
> + *
> + *   void DRM_xxx(char * fmt, ...)
> + *
> + * .. code-block:: none
> + *
> + *   # Plain logging
> + *   DRM_INFO(fmt, ...)
> + *   DRM_NOTE(fmt, ...)
> + *   DRM_WARN(fmt, ...)
> + *   DRM_ERROR(fmt, ...)
> + *
> + *   # Log only once
> + *   DRM_INFO_ONCE(fmt, ...)
> + *   DRM_NOTE_ONCE(fmt, ...)
> + *   DRM_WARN_ONCE(fmt, ...)
> + *
> + *   # Ratelimited - do not flood the logs
> + *   DRM_DEBUG_RATELIMITED(fmt, ...)
> + *   DRM_DEBUG_DRIVER_RATELIMITED(fmt, ...)
> + *   DRM_DEBUG_KMS_RATELIMITED(fmt, ...)
> + *   DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)
> + *   DRM_ERROR_RATELIMITED(fmt, ...)
> + *
> + *   # Logging with a specific category
> + *   DRM_DEBUG(fmt, ...)		# Logged as CORE
> + *   DRM_DEBUG_DRIVER(fmt, ...)
> + *   DRM_DEBUG_KMS(fmt, ...)
> + *   DRM_DEBUG_PRIME(fmt, ...)
> + *   DRM_DEBUG_ATOMIC(fmt, ...)
> + *   DRM_DEBUG_VBL(fmt, ...)
> + *   DRM_DEBUG_LEASE(fmt, ...)
> + *   DRM_DEBUG_DP(fmt, ...)
>   */
>  
>  /**
> @@ -399,7 +475,7 @@ __printf(3, 4)
>  void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  		 const char *format, ...);
>  
> -/**
> +/*
>   * Error output.
>   *
>   * @dev: device pointer
> @@ -408,7 +484,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  #define DRM_DEV_ERROR(dev, fmt, ...)					\
>  	drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
>  
> -/**
> +/*
>   * Rate limited error output.  Like DRM_ERROR() but won't flood the log.
>   *
>   * @dev: device pointer
> @@ -436,7 +512,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  	}								\
>  })
>  
> -/**
> +/*
>   * Debug output.
>   *
>   * @dev: device pointer
> @@ -466,7 +542,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  		drm_dev_dbg(dev, category, fmt, ##__VA_ARGS__);		\
>  })
>  
> -/**
> +/*
>   * Rate limited debug output. Like DRM_DEBUG() but won't flood the log.
>   *
>   * @dev: device pointer
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
