Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6D22A24F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 00:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762776E21B;
	Wed, 22 Jul 2020 22:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79366E21B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 22:22:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f18so3433310wml.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 15:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mlhqG597ibB6K569IWzZ9MbP6GAdVglw8M3HYFrkpEQ=;
 b=AyySptGP2R9O58bX9FfVy3uXlHFqeQySApXkmFUmDHaHmkDOXtJFkARhOWH6l4es2m
 avNFVWmf8UYFlikpDt/YeEEtUjdZyCOcvcrpK5JK/90CYAu1mjuzSWGbvM5ajRx+GtB4
 uiqPBSdKEE8fDdoiiNh9yW/H/YatniL9egMWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mlhqG597ibB6K569IWzZ9MbP6GAdVglw8M3HYFrkpEQ=;
 b=cvhfYEAQ56cLKhYnow6FezSOLsbws8iGH/yPowTy4CvPZeKDUviWJMLXd9aq3eJAzW
 +SFZlC6RvjvQYf+Ch73H3GZxN8sEzWva5KWb5cy9cuTcmGmVmLdW/RZn3ZEqbFphl6zn
 sLth8b7slm2fGcvM1fPXL3zMzCEIjnabn05240BBVcOsZl9Nf7e1odntKzGOgAJnivGY
 d5aJtKClf6UxxSDd0dDdztt7JAzIe1d6whKkDjmHpARMg0V9CqnTL6GwUquJinbhp5ox
 5IOE5uI+AwVxYcLqhLhYsdSxzoD4+Ll+QCTn3uYUedl4AyXfBfUDd4sGi2PrAneIi7uq
 wBbA==
X-Gm-Message-State: AOAM532/w7mKfTcOEjQe2cVj2U2Q3Y0oue0SmfK6nY0aDP0TNL/5O+WG
 M4h+yn1D+XGUJH7P0xv82mcOYA==
X-Google-Smtp-Source: ABdhPJxrtR0aJ6+pSTxAZ2nyGRleSz3k2rfel5RhJPrvfRCCUl9yUNGhYjAY3kUbzxC4bXXj6/q+sQ==
X-Received: by 2002:a1c:68c2:: with SMTP id d185mr1429613wmc.24.1595456566117; 
 Wed, 22 Jul 2020 15:22:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 78sm1109093wma.31.2020.07.22.15.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 15:22:45 -0700 (PDT)
Date: Thu, 23 Jul 2020 00:22:43 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
Message-ID: <20200722222243.GM6419@phenom.ffwll.local>
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <34224c32-7c17-4c7e-1ec9-03215ec7ed8a@suse.de>
 <e11f2cc1a3348260d08d13f1d43df4ef534f09f6.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e11f2cc1a3348260d08d13f1d43df4ef534f09f6.camel@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 05:08:03PM +0200, Philipp Zabel wrote:
> Hi Thomas,
> 
> thank you for your comment.
> 
> On Wed, 2020-07-22 at 16:43 +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 22.07.20 um 15:25 schrieb Philipp Zabel:
> > > Add a drm_simple_encoder_init() variant that registers
> > > drm_encoder_cleanup() with drmm_add_action().
> > > 
> > > Now drivers can store encoders in memory allocated with drmm_kmalloc()
> > > after the call to drmm_mode_config_init(), without having to manually
> > > make sure that drm_encoder_cleanup() is called before the memory is
> > > freed.
> > > 
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > >  drivers/gpu/drm/drm_simple_kms_helper.c | 42 +++++++++++++++++++++++++
> > >  include/drm/drm_simple_kms_helper.h     |  4 +++
> > >  2 files changed, 46 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> > > index 74946690aba4..a243f00cf63d 100644
> > > --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> > > +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> > > @@ -9,6 +9,7 @@
> > >  #include <drm/drm_atomic.h>
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_bridge.h>
> > > +#include <drm/drm_managed.h>
> > >  #include <drm/drm_plane_helper.h>
> > >  #include <drm/drm_probe_helper.h>
> > >  #include <drm/drm_simple_kms_helper.h>
> > > @@ -71,6 +72,47 @@ int drm_simple_encoder_init(struct drm_device *dev,
> > >  }
> > >  EXPORT_SYMBOL(drm_simple_encoder_init);
> > >  
> > > +static void drmm_encoder_cleanup(struct drm_device *dev, void *ptr)
> > > +{
> > > +	struct drm_encoder *encoder = ptr;
> > > +
> > > +	drm_encoder_cleanup(encoder);
> > > +}
> > 
> > This doesn't work. DRM cleans up the encoder by invoking the destroy
> > callback from the encoder functions. This additional helper would
> > cleanup the encoder a second time.
> 
> Indeed this would require the encoder destroy callback to be NULL.

Yeah the drmm_ versions of these need to check that the ->cleanup hook is
NULL.

Also there's not actually a double-free, since drm_foo_cleanup removes it
from the lists, which means drm_mode_config_cleanup won't even see it. But
if the driver has some additional code in ->cleanup that won't ever run,
so probably still a bug.

I also think that the drmm_foo_ wrappers should also do the allocation
(and upcasting) kinda like drmm_dev_alloc(). Otherwise we're still stuck
with tons of boilerplate.

For now I think it's ok if drivers that switch to drmm_ just copypaste,
until we're sure this is the right thing to do. And then maybe also roll
these out for all objects that stay for the entire lifetime of drm_device
(plane, crtc, encoder, plus variants). Just to make sure we're consistent
across all of them.
-Daniel

> > You can already embed the encoder in another structure and things should
> > work as expected.
> 
> If the embedding structure is a component allocated with drmm_kmalloc()
> after the call to drmm_mode_config_init(), the structure will already be
> freed before the destroy callback is run from
> drmm_mode_config_init_release().
> 
> regards
> Philipp
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
