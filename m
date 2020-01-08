Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2CB134B12
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 19:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B516E321;
	Wed,  8 Jan 2020 18:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5256E321
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 18:58:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a5so57334wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 10:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NYn//EmKDly6maWi30qVPTzKbUb47omFrbFGUll/6qc=;
 b=bjo/exzd2JCuXqWh5dUCvy5W7hu73p0ZVdPTaqK6Ld84p1K9byRveFdDYZflv2hD69
 f6cOdOpfozJnEJxnJI5Sg+bsK5pLDeuQ35fDEmmTNOxNIRR6afbBc26llEj4XuoSlrTO
 3kXXJsAPmCUIwSZkcMOYqu+hQaRMyQJEZcANM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NYn//EmKDly6maWi30qVPTzKbUb47omFrbFGUll/6qc=;
 b=fmp3AzMgLdjkZja8dhsS+mu9be61HPDG2IfMEYi0Anxpm/n3SG3C23rWUBkE0iUwVq
 pNTh3LQIwtKVaAAgOCa+/jjD3+elGpQmkmE01E6L0lehBJgFH/EwmkKmvqxBZhlP7tNd
 BNXtDBPYQ5Gi0okPxgSjzzC97eN1HEiTiH3pZ3DG/KHt2A3MEors2HAD4mC0UHr8BE8l
 AlMQViyBjL2UmT/0O0DMXGWOcf66dEyOiLuERyyW0CNqSPvEzNbXjlDFJZ/w2AEMpUX5
 M92ci0c/31zH5qq9N82pmLBXVUOCUnDVbU7Tz8EwYIpxM/SiPKOYj9BHy9r+X/kmQhiz
 JJEA==
X-Gm-Message-State: APjAAAWnfen20XqpZ6DHMJglDHlFbvY2ayjjX6Eocu8ILyoAN98Gs3GC
 zxhPkS1MkjJ//pOs8MnvE/zwrbEET5g=
X-Google-Smtp-Source: APXvYqykaQ3IydKyTZie4MyatJYooOWlDjNIof4YMAy5rNTlSsCfmuHSy+M1oTg071QCffXh4mM4Xw==
X-Received: by 2002:a1c:7dc4:: with SMTP id y187mr5404348wmc.161.1578509363468; 
 Wed, 08 Jan 2020 10:49:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id p15sm4505634wma.40.2020.01.08.10.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 10:49:22 -0800 (PST)
Date: Wed, 8 Jan 2020 19:49:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 2/2] drm/print: document DRM_ logging functions
Message-ID: <20200108184920.GI43062@phenom.ffwll.local>
References: <20200102221519.31037-1-sam@ravnborg.org>
 <20200102221519.31037-3-sam@ravnborg.org>
 <20200107160852.GD43062@phenom.ffwll.local>
 <20200107181752.GA20555@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107181752.GA20555@ravnborg.org>
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

On Tue, Jan 07, 2020 at 07:17:52PM +0100, Sam Ravnborg wrote:
> Hi Daniel.
> 
> > > + * Logging when a &device * is available, but no &drm_device *
> > > + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > + *
> > > + * DRM/Drivers can use the following functions for logging when there is a
> > > + * struct device * available.
> > > + * The logging functions share the same prototype:
> > 
> > I'd replace the entire block with a "This stuff is deprecated" warning. We
> > have at least a corresponding todo.rst entry.
> 
> We have many situations where no drm_device is available.
> At least when you a buried in drm_panel patches.
> 
> So it is either DRM_DEV_ERROR() or drv_err().
> Which is why I have pushed for nicer drm_ variants of these...

Huh, drm_panel indeed has no drm_device. And I guess we don't have a
convenient excuse to add it ...

> The todo entry only covers the nice new macros that Jani added
> where we have a drm_device.

I wonder whether for those cases we shouldn't just directly use the
various dev_* macros?
-Daniel

> 
> 	Sam
> 
> 
> 
> > -Daniel
> > 
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *   void DRM_xxx(struct device *, char * fmt, ...)
> > > + *
> > > + * .. code-block:: none
> > > + *
> > > + *   # Plain logging
> > > + *   DRM_DEV_INFO(dev, fmt, ...)
> > > + *   DRM_DEV_ERROR(dev, fmt, ...)
> > > + *
> > > + *   # Log only once
> > > + *   DRM_DEV_INFO_ONCE(dev, fmt, ...)
> > > + *
> > > + *   # Ratelimited - do not flood the logs
> > > + *   DRM_DEV_DEBUG_RATELIMITED(dev, fmt, ...)
> > > + *   DRM_DEV_DEBUG_DRIVER_RATELIMITED(dev, fmt, ...)
> > > + *   DRM_DEV_DEBUG_KMS_RATELIMITED(dev, fmt, ...)
> > > + *   DRM_DEV_DEBUG_PRIME_RATELIMITED(dev, fmt, ...)
> > > + *   DRM_DEV_ERROR_RATELIMITED(dev, fmt, ...)
> > > + *
> > > + *   # Logging with a specific category
> > > + *   DRM_DEV_DEBUG(dev, fmt, ...)		# Logged as CORE
> > > + *   DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)
> > > + *   DRM_DEV_DEBUG_KMS(dev, fmt, ...)
> > > + *   DRM_DEV_DEBUG_PRIME(dev, fmt, ...)
> > > + *   DRM_DEV_DEBUG_ATOMIC(dev, fmt, ...)
> > > + *   DRM_DEV_DEBUG_VBL(dev, fmt, ...)
> > > + *   DRM_DEV_DEBUG_DP(dev, fmt, ...)
> > > + *
> > > + * Logging when no &device * nor &drm_device * is available
> > > + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > + *
> > > + * DRM/Drivers can use the following functions for logging when there is no
> > > + * extra info associated to the logging.
> > > + * The logging functions share the same prototype:
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *   void DRM_xxx(char * fmt, ...)
> > > + *
> > > + * .. code-block:: none
> > > + *
> > > + *   # Plain logging
> > > + *   DRM_INFO(fmt, ...)
> > > + *   DRM_NOTE(fmt, ...)
> > > + *   DRM_WARN(fmt, ...)
> > > + *   DRM_ERROR(fmt, ...)
> > > + *
> > > + *   # Log only once
> > > + *   DRM_INFO_ONCE(fmt, ...)
> > > + *   DRM_NOTE_ONCE(fmt, ...)
> > > + *   DRM_WARN_ONCE(fmt, ...)
> > > + *
> > > + *   # Ratelimited - do not flood the logs
> > > + *   DRM_DEBUG_RATELIMITED(fmt, ...)
> > > + *   DRM_DEBUG_DRIVER_RATELIMITED(fmt, ...)
> > > + *   DRM_DEBUG_KMS_RATELIMITED(fmt, ...)
> > > + *   DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)
> > > + *   DRM_ERROR_RATELIMITED(fmt, ...)
> > > + *
> > > + *   # Logging with a specific category
> > > + *   DRM_DEBUG(fmt, ...)		# Logged as CORE
> > > + *   DRM_DEBUG_DRIVER(fmt, ...)
> > > + *   DRM_DEBUG_KMS(fmt, ...)
> > > + *   DRM_DEBUG_PRIME(fmt, ...)
> > > + *   DRM_DEBUG_ATOMIC(fmt, ...)
> > > + *   DRM_DEBUG_VBL(fmt, ...)
> > > + *   DRM_DEBUG_LEASE(fmt, ...)
> > > + *   DRM_DEBUG_DP(fmt, ...)
> > >   */
> > >  
> > >  /**
> > > @@ -399,7 +475,7 @@ __printf(3, 4)
> > >  void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> > >  		 const char *format, ...);
> > >  
> > > -/**
> > > +/*
> > >   * Error output.
> > >   *
> > >   * @dev: device pointer
> > > @@ -408,7 +484,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> > >  #define DRM_DEV_ERROR(dev, fmt, ...)					\
> > >  	drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
> > >  
> > > -/**
> > > +/*
> > >   * Rate limited error output.  Like DRM_ERROR() but won't flood the log.
> > >   *
> > >   * @dev: device pointer
> > > @@ -436,7 +512,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> > >  	}								\
> > >  })
> > >  
> > > -/**
> > > +/*
> > >   * Debug output.
> > >   *
> > >   * @dev: device pointer
> > > @@ -466,7 +542,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> > >  		drm_dev_dbg(dev, category, fmt, ##__VA_ARGS__);		\
> > >  })
> > >  
> > > -/**
> > > +/*
> > >   * Rate limited debug output. Like DRM_DEBUG() but won't flood the log.
> > >   *
> > >   * @dev: device pointer
> > > -- 
> > > 2.20.1
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
