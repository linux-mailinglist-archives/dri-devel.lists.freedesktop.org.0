Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D211EB8B6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 11:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2584289D30;
	Tue,  2 Jun 2020 09:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6CB89C25
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 09:44:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u26so1833475wmn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8V4rZjkqzHFTF/LdSJ1CXEfhWY+0KxmQTLgE0KPDAPk=;
 b=HmiyDfEv9Vosd0Oh13UMtNtQaMWM61T0tuJJXOyayMZV5+dbsQqwW4YOuX4+D82ZLo
 9M0IfhfHzRi3WdG7Kxx8Rwaq6EOKKbzwOGR1p9tY32qfkHq+V99O/zgVmMlRMrWBCkGw
 cSIzg4utAQv6XmknYb31XoPkhNaCIFevqzVSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8V4rZjkqzHFTF/LdSJ1CXEfhWY+0KxmQTLgE0KPDAPk=;
 b=cQyZdDP3Yq75tOH5WZ7xNdK9zPaRISQuqoXcr6n7n7Nn7TTC5rpZIuKEcraQTsAfSx
 D8y5Xtl03hZ/G6qPHk1yRUkCpBuRrLQupg/8IKkfgSjuSYVwhTnCQERvrrBv1lBUhtTc
 MUlg5MrObvFjus7ioDlDhMtLIKJ2O0h++jYtjWXckaDek6jUNWYVuYrH+DP5xDew7KQb
 /outf8599Z2RZMEYzoroYZbcQ/PWsBNX/V3QrH8heJRZV4F2LRJdrU8K/6hISEdGzRIz
 XzdxQd2GVd2IrlbTt9/J5Z0uBWvQFoRz+DCqHnvD5xEm0dq8zW4w1JPR89OImFpgt0XC
 5DoQ==
X-Gm-Message-State: AOAM531HcZqUQ+77gpvYaf2PuOoM8Y6LMC7fThM+HrV1wbqI6lJpJ45D
 iYPXH0RQmeJMwTXmyTC9F0ukkw==
X-Google-Smtp-Source: ABdhPJwhQEsdXlr1T3ABytxbhkw8yhfN1roTCqU8ktSIqGj3glB7A3uYgFR7fqgtSWkTc706ESA+sQ==
X-Received: by 2002:a1c:38c2:: with SMTP id f185mr3512820wma.79.1591091051047; 
 Tue, 02 Jun 2020 02:44:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k17sm2989541wrl.54.2020.06.02.02.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 02:44:10 -0700 (PDT)
Date: Tue, 2 Jun 2020 11:43:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/atomic-helper: reset vblank on crtc reset
Message-ID: <20200602094359.GA20149@phenom.ffwll.local>
References: <20200527094757.1414174-2-daniel.vetter@ffwll.ch>
 <20200527095332.1439425-1-daniel.vetter@ffwll.ch>
 <20200530032258.GD5961@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200530032258.GD5961@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jyri Sarha <jsarha@ti.com>, Sean Paul <seanpaul@chromium.org>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, zhengbin <zhengbin13@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 30, 2020 at 06:22:58AM +0300, Laurent Pinchart wrote:
> Hi Daniel,
> 
> Thank you for the patch.
> 
> On Wed, May 27, 2020 at 11:53:32AM +0200, Daniel Vetter wrote:
> > Only when vblanks are supported ofc.
> > 
> > Some drivers do this already, but most unfortunately missed it. This
> > opens up bugs after driver load, before the crtc is enabled for the
> > first time. syzbot spotted this when loading vkms as a secondary
> > output. Given how many drivers are buggy it's best to solve this once
> > and for all in shared helper code.
> > 
> > Aside from moving the few existing calls to drm_crtc_vblank_reset into
> > helpers (i915 doesn't use helpers, so keeps its own) I think the
> > regression risk is minimal: atomic helpers already rely on drivers
> > calling drm_crtc_vblank_on/off correctly in their hooks when they
> > support vblanks. And driver that's failing to handle vblanks after
> > this is missing those calls already, and vblanks could only work by
> > accident when enabling a CRTC for the first time right after boot.
> > 
> > Big thanks to Tetsuo for helping track down what's going wrong here.
> > 
> > There's only a few drivers which already had the necessary call and
> > needed some updating:
> > - komeda, atmel and tidss also needed to be changed to call
> >   __drm_atomic_helper_crtc_reset() intead of open coding it
> > - tegra and msm even had it in the same place already, just code
> >   motion, and malidp already uses __drm_atomic_helper_crtc_reset().
> 
> Have you intentionally not touched drivers that use
> drm_crtc_vblank_off() at init time instead of drm_crtc_vblank_reset() ?
> I'm thinking about omapdrm and rcar-du that both call neither
> drm_crtc_vblank_reset() nor __drm_atomic_helper_crtc_reset() in their
> CRTC reset handler, and call drm_crtc_vblank_off() at init time. Should
> these (and likely other) drivers be updated ?

Good catch, I think we should remove those too with this patch.

I also used that opportunity to review all callers fo drm_crtc_vblank_off,
and I found two bogus callers in malidp and hdlcd. But only in the unload
code, so doesn't matter much.

I'll resend a new version.
-Daniel

> Other than that the patch looks good to me,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > Only call left is in i915, which doesn't use drm_mode_config_reset,
> > but has its own fastboot infrastructure. So that's the only case where
> > we actually want this in the driver still.
> > 
> > I've also reviewed all other drivers which set up vblank support with
> > drm_vblank_init. After the previous patch fixing mxsfb all atomic
> > drivers do call drm_crtc_vblank_on/off as they should, the remaining
> > drivers are either legacy kms or legacy dri1 drivers, so not affected
> > by this change to atomic helpers.
> > 
> > v2: Use the drm_dev_has_vblank() helper.
> > 
> > Link: https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb
> > Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
> > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> > Cc: Brian Starkey <brian.starkey@arm.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: Jyri Sarha <jsarha@ti.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Brian Masney <masneyb@onstation.org>
> > Cc: Emil Velikov <emil.velikov@collabora.com>
> > Cc: zhengbin <zhengbin13@huawei.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: linux-tegra@vger.kernel.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 7 ++-----
> >  drivers/gpu/drm/arm/malidp_drv.c                 | 1 -
> >  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c   | 7 ++-----
> >  drivers/gpu/drm/drm_atomic_state_helper.c        | 4 ++++
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c        | 2 --
> >  drivers/gpu/drm/tegra/dc.c                       | 1 -
> >  drivers/gpu/drm/tidss/tidss_crtc.c               | 3 +--
> >  drivers/gpu/drm/tidss/tidss_kms.c                | 4 ----
> >  8 files changed, 9 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > index 56bd938961ee..f33418d6e1a0 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > @@ -492,10 +492,8 @@ static void komeda_crtc_reset(struct drm_crtc *crtc)
> >  	crtc->state = NULL;
> >  
> >  	state = kzalloc(sizeof(*state), GFP_KERNEL);
> > -	if (state) {
> > -		crtc->state = &state->base;
> > -		crtc->state->crtc = crtc;
> > -	}
> > +	if (state)
> > +		__drm_atomic_helper_crtc_reset(crtc, &state->base);
> >  }
> >  
> >  static struct drm_crtc_state *
> > @@ -616,7 +614,6 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
> >  		return err;
> >  
> >  	drm_crtc_helper_add(crtc, &komeda_crtc_helper_funcs);
> > -	drm_crtc_vblank_reset(crtc);
> >  
> >  	crtc->port = kcrtc->master->of_output_port;
> >  
> > diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> > index c2507b7d8512..02904392e370 100644
> > --- a/drivers/gpu/drm/arm/malidp_drv.c
> > +++ b/drivers/gpu/drm/arm/malidp_drv.c
> > @@ -870,7 +870,6 @@ static int malidp_bind(struct device *dev)
> >  	drm->irq_enabled = true;
> >  
> >  	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> > -	drm_crtc_vblank_reset(&malidp->crtc);
> >  	if (ret < 0) {
> >  		DRM_ERROR("failed to initialise vblank\n");
> >  		goto vblank_fail;
> > diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > index 10985134ce0b..ce246b96330b 100644
> > --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > @@ -411,10 +411,8 @@ static void atmel_hlcdc_crtc_reset(struct drm_crtc *crtc)
> >  	}
> >  
> >  	state = kzalloc(sizeof(*state), GFP_KERNEL);
> > -	if (state) {
> > -		crtc->state = &state->base;
> > -		crtc->state->crtc = crtc;
> > -	}
> > +	if (state)
> > +		__drm_atomic_helper_crtc_reset(crtc, &state->base);
> >  }
> >  
> >  static struct drm_crtc_state *
> > @@ -528,7 +526,6 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
> >  	}
> >  
> >  	drm_crtc_helper_add(&crtc->base, &lcdc_crtc_helper_funcs);
> > -	drm_crtc_vblank_reset(&crtc->base);
> >  
> >  	drm_mode_crtc_set_gamma_size(&crtc->base, ATMEL_HLCDC_CLUT_SIZE);
> >  	drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > index 8fce6a115dfe..9ad74045158e 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -32,6 +32,7 @@
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_plane.h>
> >  #include <drm/drm_print.h>
> > +#include <drm/drm_vblank.h>
> >  #include <drm/drm_writeback.h>
> >  
> >  #include <linux/slab.h>
> > @@ -93,6 +94,9 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
> >  	if (crtc_state)
> >  		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
> >  
> > +	if (drm_dev_has_vblank(crtc->dev))
> > +		drm_crtc_vblank_reset(crtc);
> > +
> >  	crtc->state = crtc_state;
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_reset);
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > index ca3368c828d0..9606185c284b 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > @@ -1117,8 +1117,6 @@ static void mdp5_crtc_reset(struct drm_crtc *crtc)
> >  		mdp5_crtc_destroy_state(crtc, crtc->state);
> >  
> >  	__drm_atomic_helper_crtc_reset(crtc, &mdp5_cstate->base);
> > -
> > -	drm_crtc_vblank_reset(crtc);
> >  }
> >  
> >  static const struct drm_crtc_funcs mdp5_crtc_funcs = {
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 83f31c6e891c..9b308b572eac 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -1168,7 +1168,6 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
> >  		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
> >  
> >  	__drm_atomic_helper_crtc_reset(crtc, &state->base);
> > -	drm_crtc_vblank_reset(crtc);
> >  }
> >  
> >  static struct drm_crtc_state *
> > diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> > index 89a226912de8..4d01c4af61cd 100644
> > --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> > +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> > @@ -352,8 +352,7 @@ static void tidss_crtc_reset(struct drm_crtc *crtc)
> >  		return;
> >  	}
> >  
> > -	crtc->state = &tcrtc->base;
> > -	crtc->state->crtc = crtc;
> > +	__drm_atomic_helper_crtc_reset(crtc, &tcrtc->base);
> >  }
> >  
> >  static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
> > diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> > index 4b99e9fa84a5..e6ab59eed259 100644
> > --- a/drivers/gpu/drm/tidss/tidss_kms.c
> > +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> > @@ -278,10 +278,6 @@ int tidss_modeset_init(struct tidss_device *tidss)
> >  	if (ret)
> >  		return ret;
> >  
> > -	/* Start with vertical blanking interrupt reporting disabled. */
> > -	for (i = 0; i < tidss->num_crtcs; ++i)
> > -		drm_crtc_vblank_reset(tidss->crtcs[i]);
> > -
> >  	drm_mode_config_reset(ddev);
> >  
> >  	dev_dbg(tidss->dev, "%s done\n", __func__);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
