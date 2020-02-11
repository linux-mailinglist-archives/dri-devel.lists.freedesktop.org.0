Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E815915929B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 16:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF266E4FB;
	Tue, 11 Feb 2020 15:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC51C6E4FB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:12:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z3so12831448wru.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 07:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/uJKpzXtCeMRKTFbjF4N9P3h61tiXgM4E1mNRx9NkJU=;
 b=N0qlvARNVDnllAYxZkGMN9Xl57rw1iUC0Q48Xa0nhH/kVz2iaPqRwxGV2G+D3v375r
 6Fb1QwjAcH54rBPZoZtpNxqVSpmoZiU2FJB4U0cUG8sXl8o0xfVN+V+4jOG09bCEA8iA
 GreCahaPAvD2lke8EQu3Rzj6mfd0rJLWuh6TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/uJKpzXtCeMRKTFbjF4N9P3h61tiXgM4E1mNRx9NkJU=;
 b=pYgDmYb/bGQQcZIlhhIalyHa4YhzGEOSCsghhgIIfhyqq50OcvcHH1I2HiNondCe+o
 BQQO1YccaX0Rt8OfPPkTJBxpeFHNzwLu1kWAPTKmW2LAL4SPd4t8G7c8r6Hb8+G5DmZb
 NmfcDtcSzmak+weRPKU8Z1MQ0R9uYjorOIE/KNGwKkDX1U4yzYJqVbVaF1eyyiQA1ycB
 bZoLUAs9ElH10DlwdJD1gLS9itBavVsgIfuR27R/lhjtoX06C+mDfp81s/k0OdQ3PTIP
 X+oIdlTqDjZHAdEQXXHlGPuqmPdlWl1KrsG82cuG6wZ9J9FS+ZUdfWfhl5Vhwjiti1EE
 TVSw==
X-Gm-Message-State: APjAAAUSLzLV71XDcvl3NjAJuKo4Gh+wX3SDmhhRTmshwSjNLElxqHcV
 biLugULzUS2P8mdrFqTay0o6Ag==
X-Google-Smtp-Source: APXvYqx4oS2rJPV5BDnPAmdyBa5tMrB6a29mzRQgGlwXVgFJ6s9/9KaoMs2mnTk3V+KLtbHCDGqYWw==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr9483516wrr.73.1581433942491;
 Tue, 11 Feb 2020 07:12:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j5sm5754456wrw.24.2020.02.11.07.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 07:12:21 -0800 (PST)
Date: Tue, 11 Feb 2020 16:12:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/irq: remove check on dev->dev_private
Message-ID: <20200211151219.GF2363188@phenom.ffwll.local>
References: <20200211144753.3175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211144753.3175-1-jani.nikula@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 04:47:53PM +0200, Jani Nikula wrote:
> There is no real reason to require drivers to set and use
> dev->dev_private. Indeed, the current recommendation, as documented in
> drm_device.h, is to embed struct drm_device in the per-device struct
> instead of using dev_private.
> 
> Remove the requirement for dev_private to have been set to indicate
> driver initialization.

Yeah this is nonsense. Also, drm_irq_install is purely optional
semi-midlayer (it's not really a midlayer for the legacy drivers, but
whatever, who cares about those).

Now there might be some hilarious races this papers over, but:

- Proper drivers should only call drm_dev_register once everything is set
  up, including this stuff here. No race possible with anything else
  really.

- Slightly more wobbly drivers, including the legacy ones, all use
  drm_global_mutex. This was the former BKL, which means that it was
  impossible for soeone to go through the load/unload/reload (between
  lastclose and firstopen) paths and also run the ioctl. But the ioctl had
  to be made unlocked because blocking there killed X:

	commit 8f4ff2b06afcd6f151868474a432c603057eaf56
	Author: Ilija Hadzic <ihadzic@research.bell-labs.com>
	Date:   Mon Oct 31 17:46:18 2011 -0400

	    drm: do not sleep on vblank while holding a mutex

  The even more legacy DRM_CONTROL ioctl stayed fully locked. But the file
  open/close paths are still fully locked, and that's the only place
  legacy drivers should call drm_irq_install/uninstall, so should all
  still be fully ordered and protected and happy.

Feel free to quote or not quote the above in the commit message.

> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Any ideas for something else drm_irq_install() could/should check to
> ensure "Driver must have been initialized"?
> 
> There are only a few instances of dev_private uses in i915, also to be
> removed, and we could stop initializing dev_private altogether. We could
> in fact do that without this patch too, as we don't use
> drm_irq_install(). But it would be cleaner to not have any checks for
> driver private stuff outside of drivers.

I hope my review above answers your question here. Patch, as-is:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_irq.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index 03bce566a8c3..588be45abd7a 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -111,10 +111,6 @@ int drm_irq_install(struct drm_device *dev, int irq)
>  	if (irq == 0)
>  		return -EINVAL;
>  
> -	/* Driver must have been initialized */
> -	if (!dev->dev_private)
> -		return -EINVAL;
> -
>  	if (dev->irq_enabled)
>  		return -EBUSY;
>  	dev->irq_enabled = true;
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
