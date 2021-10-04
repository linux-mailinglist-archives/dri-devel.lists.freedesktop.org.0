Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4709C42132D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 17:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966BA6EA49;
	Mon,  4 Oct 2021 15:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5898A6EA43
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 15:56:43 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id t2so5211qtx.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=+1s8xcFt52yy248Zz8xic/U2dw69RfIY9HdKDO7ZV6Q=;
 b=B1Np5WmWhg1UMjA/m3ybH4tGdQhZRLV9CJy3StiTL/r9OAu18ABRCvGBtzzZnsXL3s
 Nbt/LoOC881ZQSWx+0lauMi4P9epUr+0zd5b72R9H9eObF58msbTwTkaMVvDzxSaSgN8
 pOXjruE3AqFA6Ad90PqPBWJuhTM+gsSCfFPPfjNatLihzNe19jt3JysW6JAo6IsiD7bK
 9X1IgLnob5Uu39T6HtX4laDj7Ky4DMvxH+5Geo0R/OFQmc7XK0LTZGoxO/pwQtJBZm1n
 h5InGNYoaBEFj8pW3+Q+SK9Q5WxAokKRSNfC3sY1aA48HAPxSMQtOSulX122setlO9XC
 K3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+1s8xcFt52yy248Zz8xic/U2dw69RfIY9HdKDO7ZV6Q=;
 b=o2DVWujzThL7l/bzZqvaNKLOrTA5yfeLm7YPa7OFvve4ArTWQwu4gz3VHmZtjJjqoq
 jWXdxglZdyEeYiX8yGoA2F4apz4o9FNmfbJcvF2iA/TkiRCZXawsmMYKRBaOuI/e3Nh+
 r5Od9NYA41IbE8YCgdw9p8eR+S8EQt4+WSKh2pf4YeyYYC/ub409JoENsOp5ipdawheM
 5P/KuB+Upwg8dEYmmEo254pTqCbV7f/gqGZFNERT+C4VH2hN4F86w222C9i2HvCEeHYU
 HGay+QdS5gCHAfV4rl1hxi+K6TFX940RturfMCjsJ8rNonJobQN+kzJZrJNPY/f1YMmW
 Ofwg==
X-Gm-Message-State: AOAM533DZeh51Dl2QLZ91Wkzp8mU/DrSkZU/wAYEeculSzq8FbYO6fV5
 Ls2tD9+yuOILWc0jtYzx6ZxdKA==
X-Google-Smtp-Source: ABdhPJzwT6kLqUcuNUbghjgNdxuvoUthnPAt+/gIE2rLyWnxVM/HaubzkBvq5//MZ9QtvjcZ5qwBZQ==
X-Received: by 2002:ac8:18c:: with SMTP id x12mr13970971qtf.378.1633363002266; 
 Mon, 04 Oct 2021 08:56:42 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id b65sm7850990qkc.46.2021.10.04.08.56.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Oct 2021 08:56:41 -0700 (PDT)
Date: Mon, 4 Oct 2021 11:56:37 -0400
From: Sean Paul <sean@poorly.run>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Fernando Ramos <greenfoo@u92.eu>
Subject: Re: [PATCH 15/16] Revert "drm/i915: cleanup:
 drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()"
Message-ID: <20211004155637.GC2515@art_vandelay>
References: <20211002154542.15800-1-sean@poorly.run>
 <20211002154542.15800-15-sean@poorly.run>
 <YVrMLNa/oaP2+ZWx@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVrMLNa/oaP2+ZWx@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Mon, Oct 04, 2021 at 12:41:00PM +0300, Ville Syrjälä wrote:
> On Sat, Oct 02, 2021 at 11:45:41AM -0400, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > This reverts commit 399190e70816886e2bca1f3f3bc3d9c544af88e7.
> > 
> > This patchset breaks on intel platforms and was previously NACK'd by
> > Ville.
> > 
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Fernando Ramos <greenfoo@u92.eu>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Yeah, best to try again from the start I think.

Pushed the revert set (and left the TODO item out for now). Thanks for raising
the issue.

@Fernando, hopefully you can revise and post again. Thank you for your patches
and your effort!

Sean

> 
> For the series
> Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 18 +++++++++++++-----
> >  1 file changed, 13 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index 2bf01416d656..134a6acbd8fb 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -43,7 +43,6 @@
> >  #include <drm/drm_plane_helper.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_rect.h>
> > -#include <drm/drm_drv.h>
> >  
> >  #include "display/intel_audio.h"
> >  #include "display/intel_crt.h"
> > @@ -13477,13 +13476,22 @@ void intel_display_resume(struct drm_device *dev)
> >  	if (state)
> >  		state->acquire_ctx = &ctx;
> >  
> > -	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> > +	drm_modeset_acquire_init(&ctx, 0);
> >  
> > -	ret = __intel_display_resume(dev, state, &ctx);
> > +	while (1) {
> > +		ret = drm_modeset_lock_all_ctx(dev, &ctx);
> > +		if (ret != -EDEADLK)
> > +			break;
> >  
> > -	intel_enable_ipc(dev_priv);
> > +		drm_modeset_backoff(&ctx);
> > +	}
> > +
> > +	if (!ret)
> > +		ret = __intel_display_resume(dev, state, &ctx);
> >  
> > -	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> > +	intel_enable_ipc(dev_priv);
> > +	drm_modeset_drop_locks(&ctx);
> > +	drm_modeset_acquire_fini(&ctx);
> >  
> >  	if (ret)
> >  		drm_err(&dev_priv->drm,
> > -- 
> > Sean Paul, Software Engineer, Google / Chromium OS
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
