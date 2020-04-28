Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A451BC0D6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 16:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AFF6E50B;
	Tue, 28 Apr 2020 14:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9C06E500
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:12:25 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y24so3035596wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YsD7GjwZh2xdJ3wMaC19FB+yUQls1ObZL8q+/TqZPaI=;
 b=K5fJIDkt6Nm8nqxpnj2sj9apyTV1p/vWTeB4os0Sv3i6GExhsJCwJqdvEh7yjJ0KT1
 ieHVuuujb8rPee1NzLN1x/mbJ8mJ0Kv+LjXXmT34crv1Oaez2A8mQVAMMXFHv9ehZtYu
 Z/QVYtYFtRbA7o5XyBCK4NNUPMpQ5ZBTA1j0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YsD7GjwZh2xdJ3wMaC19FB+yUQls1ObZL8q+/TqZPaI=;
 b=KihcdKgyZMoeLrFY02BBRIhZ3UF5pGBr1uYKligdkb38c1yn0f/pdYdBEO3cfTCW/I
 w1JjUSLcWLTSGuLbqkVvKsY9iekv4rfHDkgZd4iiNEax0lAnfDv/01vdSK3brIKmSg5U
 gC4FSmBVL4v7VacvXK0hNxbL06BMEC8lVjkBnJsW3OYGgzrf7+tEtCGWe1pTFNGFC0lN
 xfDRBk+VNNw8nAgoDI2ge0gkXEZwnQRXfX19SB53QpQKsj1Z/fL4LRbpKPifGSMvjtq9
 MOBB8xjJwKUHfZuKnEjbDcm99Z8tjV/xIQ9kCFYj6w7itwQDWZFVMf5oaRTKHdP1EL0c
 2FZg==
X-Gm-Message-State: AGi0PuYem5+LODUPlGWYzkl2k0IO2Mr2f6N0ju7XfKROjEUcoEtZWPHO
 vkxN1s0C17C3oc8ILxOC01DsNQ==
X-Google-Smtp-Source: APiQypKEM1Oo8wUtGkwt4tUTGbBDhF4duM1wEmCSJuoJRgt815cei21omhnSwJlWEA3iCo1wmfevbQ==
X-Received: by 2002:a1c:1d92:: with SMTP id d140mr4758593wmd.67.1588083144107; 
 Tue, 28 Apr 2020 07:12:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 185sm4020627wmc.32.2020.04.28.07.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 07:12:23 -0700 (PDT)
Date: Tue, 28 Apr 2020 16:12:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 56/59] drm/aspeed: Use managed drmm_mode_config_cleanup
Message-ID: <20200428141221.GM3456981@phenom.ffwll.local>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-57-daniel.vetter@ffwll.ch>
 <20200424181002.GL7074@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424181002.GL7074@ravnborg.org>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Joel Stanley <joel@jms.id.au>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 08:10:02PM +0200, Sam Ravnborg wrote:
> On Wed, Apr 15, 2020 at 09:40:31AM +0200, Daniel Vetter wrote:
> > Since aspeed doesn't use devm_kzalloc anymore we can use the managed
> > mode config cleanup.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: linux-aspeed@lists.ozlabs.org
> > Cc: linux-arm-kernel@lists.infradead.org
> 
> Hmm, the helper function makes no sense, maybe embed it?
> 
> One Q below. Whith Q addressed:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> > ---
> >  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> > index 6b27242b9ee3..6e464b84a256 100644
> > --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> > +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> > @@ -63,15 +63,15 @@ static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
> >  	.atomic_commit		= drm_atomic_helper_commit,
> >  };
> >  
> > -static void aspeed_gfx_setup_mode_config(struct drm_device *drm)
> > +static int aspeed_gfx_setup_mode_config(struct drm_device *drm)
> >  {
> > -	drm_mode_config_init(drm);
> > -
> >  	drm->mode_config.min_width = 0;
> >  	drm->mode_config.min_height = 0;
> >  	drm->mode_config.max_width = 800;
> >  	drm->mode_config.max_height = 600;
> >  	drm->mode_config.funcs = &aspeed_gfx_mode_config_funcs;
> > +
> > +	return drmm_mode_config_init(drm);
> 
> I do not see anything that documents that it is OK to init min/max
> width/heigh not funcs before drmm_mode_config_init() is called.
> Maybe drmm_mode_config_init() gain an memset(drm->mode_config),
> and we loose all the assingments from before the call to init().
> 
> Also most (all?) other users of drmm_mode_config_init()
> set them after the call to drmm_mode_config_init().
> So re-order here and then embed while you are touching the code again.

Only reason I've done it like this is that it saves a few lines of diff
compared to other options.

Wrt calling stuff the wrong way round: We pretty much assume throughout
that structures are allocated with kzalloc, none of our _init() functions
in drm have a memset. We'd break the world if we start doing memset() in
random _init() functions I think.

Also the main aspeed_gfx_load() function is quite long already, smashing
more random stuff in there won't help it's readability.

Anyway I don't care, if you insist I'm happy to repaint this in whatever
color choice you deem best :-)

Cheers, Daniel

> 
> 	Sam
> 
> >  }
> >  
> >  static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
> > @@ -144,7 +144,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
> >  	writel(0, priv->base + CRT_CTRL1);
> >  	writel(0, priv->base + CRT_CTRL2);
> >  
> > -	aspeed_gfx_setup_mode_config(drm);
> > +	ret = aspeed_gfx_setup_mode_config(drm);
> > +	if (ret < 0)
> > +		return ret;
> >  
> >  	ret = drm_vblank_init(drm, 1);
> >  	if (ret < 0) {
> > @@ -181,7 +183,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
> >  static void aspeed_gfx_unload(struct drm_device *drm)
> >  {
> >  	drm_kms_helper_poll_fini(drm);
> > -	drm_mode_config_cleanup(drm);
> >  }
> >  
> >  DEFINE_DRM_GEM_CMA_FOPS(fops);
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
