Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F025D132AD2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 17:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA206E0FE;
	Tue,  7 Jan 2020 16:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045ED6E0FE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 16:12:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m24so84445wmc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 08:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jhPf2jFZ1H9apzZcZJ/4xr96Ak+DBkspug9tnoMG3c8=;
 b=jNxpXEjJvgnJPjv0w6U/QGAAUNmwyRxmFLZYLincJBWXWp7HPxpgpUtkOGB4Mq7ste
 3uJtUBLk2dPrSvr/V6UuHTfmCR9wmU1GtJw3ijESN3PQzYBhsFJ+irrVNSFbPy+iIOAx
 w7+W9kxPKScJ3Hhl53WRzxEEurkrVQWMXnTN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jhPf2jFZ1H9apzZcZJ/4xr96Ak+DBkspug9tnoMG3c8=;
 b=ee9ECEVkgTQQGi/KJj5K9qHI+4LpkDx/xEH0iIVb9vyqCzc6bSUwrbnZFVDqIQ39UI
 l9zcSVhOlo0L61lDg5hPb1XpTcijqj+NN1QnJLXjFGd3NTX+l5TCDaISTbC8MOxP8x6o
 FqgoxpSrO8sDnkHbB/WRyR+yeyTky/0X3mdKgF1vWW32Hj9d0inbkfV9qwh6Neh1ZyOP
 az8NBr/HVxkQB2Ryhr44G37xZBvl/4/DUU2gkj7qySqYkj0jZ9/VzJb1K0C4gFquVahb
 ekMKIFiZ0z9B68Pex77tv5zpgcHPoyPHlew0gWewD8XjP1WBNoNA07Hlz8We5lTM1uQg
 ElaQ==
X-Gm-Message-State: APjAAAXE8rCGJ0VRTu4OZcFZjLq7lD41ldDDwFbLE+xZEOgls2tiFIjn
 XUGtvi1Xtl4Hq9rv6Vqghjk1YQ==
X-Google-Smtp-Source: APXvYqzaqLsXoDZ8JUNSRJRbhQmDK+LT9LC8LLjVPFqBMYysHdLiLWb2FQylbnJe27/NCwO/FxbJuw==
X-Received: by 2002:a1c:720a:: with SMTP id n10mr9824605wmc.74.1578413572605; 
 Tue, 07 Jan 2020 08:12:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id o4sm320466wrw.97.2020.01.07.08.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 08:12:51 -0800 (PST)
Date: Tue, 7 Jan 2020 17:12:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/2] drm/print: document drm_ logging functions
Message-ID: <20200107161249.GE43062@phenom.ffwll.local>
References: <20200102221519.31037-1-sam@ravnborg.org>
 <20200102221519.31037-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102221519.31037-2-sam@ravnborg.org>
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

On Thu, Jan 02, 2020 at 11:15:18PM +0100, Sam Ravnborg wrote:
> This is the documentation I have missed when I looked for help
> how to do proper logging. Hopefully it can help others.
> 
> v2:
>   - Add parameters to the logging functions in the doc
>   - Drop notes on other types of logging
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  Documentation/gpu/drm-internals.rst |  6 +++
>  include/drm/drm_print.h             | 80 ++++++++++++++++++++++++++---
>  2 files changed, 79 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index a73320576ca9..c2093611999c 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -164,6 +164,12 @@ File Operations
>  Misc Utilities
>  ==============
>  
> +Logging
> +-------
> +
> +.. kernel-doc:: include/drm/drm_print.h
> +   :doc: logging
> +
>  Printer
>  -------
>  
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 8f99d389792d..89e75eea65d2 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -250,22 +250,42 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>  }
>  
>  /**
> - * enum drm_debug_category - The DRM debug categories
> + * DOC: logging
> + *
> + * There is a set of functions/macros available used for logging
> + * in the DRM subsystem.
> + * Using the drm logging function enables that the logging is consistently
> + * prefixed with *[drm]* thus the logging is easy to recognize.
> + *
> + * Example of logging with *[drm]* prefix::
>   *
> - * Each of the DRM debug logging macros use a specific category, and the logging
> - * is filtered by the drm.debug module parameter. This enum specifies the values
> - * for the interface.
> + *   [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> + *   [drm] Driver supports precise vblank timestamp query.
>   *
> - * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, except
> - * DRM_DEBUG() logs to DRM_UT_CORE.
> + *
> + * Each of the debug logging macros use a specific category, and the logging
> + * is filtered by the drm.debug module parameter. The &drm_debug_category enum
> + * specifies the values for the interface.
> + *
> + * Each drm_dbg_<category> macro logs to a DRM_UT_<category> category,
> + * except drm_dbg() that logs to DRM_UT_DRIVER.
>   *
>   * Enabling verbose debug messages is done through the drm.debug parameter, each
>   * category being enabled by a bit:
>   *
>   *  - drm.debug=0x1 will enable CORE messages
>   *  - drm.debug=0x2 will enable DRIVER messages
> + *  - drm.debug=0x4 will enable KMS messages
> + *  - drm.debug=0x8 will enable PRIME messages
> + *  - drm.debug=0x10 will enable ATOMIC messages
> + *  - drm.debug=0x20 will enable VBL messages
> + *  - drm.debug=0x40 will enable STATE messages
> + *  - drm.debug=0x80 will enable LEASE messages
> + *  - drm.debug=0x100 will enable DP messages
> + *
> + * To enable more than one category OR the values - examples:
> + *
>   *  - drm.debug=0x3 will enable CORE and DRIVER messages
> - *  - ...
>   *  - drm.debug=0x1ff will enable all messages
>   *
>   * An interesting feature is that it's possible to enable verbose logging at
> @@ -273,6 +293,52 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>   *
>   *   # echo 0xf > /sys/module/drm/parameters/debug
>   *
> + *
> + * When a &drm_device * is available use one of the following logging functions.
> + * The same prototype is shared by all the logging functions
> + * that take a &drm_device * as first argument:
> + *
> + * .. code-block:: c
> + *
> + *   void drm_xxx(struct drm_device *, char * fmt, ...)
> + *
> + * DRM/Drivers can use the following functions for logging.
> + *
> + * .. code-block:: none
> + *
> + *   # Plain logging
> + *   drm_dbg(drm, fmt, ...)
> + *   drm_info(drm, fmt, ...)
> + *   drm_notice(drm, fmt, ...)
> + *   drm_warn(drm, fmt, ...)
> + *   drm_err(drm, fmt, ...)
> + *
> + *   # Log only once
> + *   drm_info_once(drm, fmt, ...)
> + *   drm_notice_once(drm, fmt, ...)
> + *   drm_warn_once(drm, fmt, ...)
> + *   drm_err_once(drm, fmt, ...)
> + *
> + *   # Ratelimited - do not flood the logs
> + *   drm_err_ratelimited(drm, fmt, ...)
> + *
> + *   # Logging with a specific category
> + *   drm_dbg_core(drm, fmt, ...)
> + *   drm_dbg(drm, fmt, ...)		# Uses the DRIVER category
> + *   drm_dbg_kms(drm, fmt, ...)
> + *   drm_dbg_prime(drm, fmt, ...)
> + *   drm_dbg_atomic(drm, fmt, ...)
> + *   drm_dbg_vbl(drm, fmt, ...)
> + *   drm_dbg_state(drm, fmt, ...)
> + *   drm_dbg_lease(drm, fmt, ...)
> + *   drm_dbg_dp(drm, fmt, ...)
> + *
> + * See enum &drm_debug_category for a description of the categories.
> + *
> + */

I kinda can't decide between this and just copypasting fairly repetitive
kerneldoc over all the new functions. I think given the long-term idea is
to favour the above functions over all the screaming macros (because of
multi-gpu stuff), I'd go with full kerneldocs for these, plus comments or
a note in the overview doc that everything else is kinda deprecated.

Jani, thoughts?
-Daniel

> +
> +/**
> + * enum drm_debug_category - The DRM debug categories
>   */
>  enum drm_debug_category {
>  	/**
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
