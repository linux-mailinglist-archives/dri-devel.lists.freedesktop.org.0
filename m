Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DB36127D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 20:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29726EAB5;
	Thu, 15 Apr 2021 18:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D276EAB3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 18:49:44 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 c12-20020a4ae24c0000b02901bad05f40e4so5605819oot.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 11:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dHUZDaDJHc8ZRBApA4oScreyjUAwvt8fmT8kn+CBHg8=;
 b=jsgmTDee+D6b4cJQpiqGg6Hv3PZUdrTe5wOXmC82/cwTHS4lbhUvcK8gvmO4A3PwjV
 Y7SBN4jiN2wjqhvJYCasuytek3rUkdc38/7dtISYCZTtyI5R2d5W9S2EGotEk9qVyOzB
 byCNcgF0iikipPgjfduG46NKzfRyCYoZDJGDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dHUZDaDJHc8ZRBApA4oScreyjUAwvt8fmT8kn+CBHg8=;
 b=CjF/Klww9RsBZ251QpvGbvM3utYE0oBQ0mEu8uTUK8FwrmybQHQlv8RsBKISPcK47h
 UuPASf7rq04Bjr3f19p8t5jbsw2LwhGYl7kp1+AkGp6WjnEDdbyPoKEBh2lttQcfOoCz
 3V1OgUdZ7tf9oMTvziBa1/JYAcl6ozmb5au4I6ZUCgWpp7pUk5XlW9HRKQzTAEg0zvqH
 lWy9VZfzA01qa/GW794ANYFZrN68OapfMA4TLE7CoRLRiLSLReHAwpgE1hFQc1KUXZab
 G82vjBsJBI5wLcggPiliy88YkgdmyIf7Ewyodw/bf62DdA9c54prxOOxyvuw4uF2lHUp
 EK1g==
X-Gm-Message-State: AOAM530BRfl9K27ErJA6snxDJVR+ru2chE+H+cKKk3bWuZgC/DugqcP8
 XJBcfwHwdIFAHUrM5ksnzBEPGvCjh4sGwRLjjMbhcQ==
X-Google-Smtp-Source: ABdhPJw06pHsUygTqiPpvctnnXg4FAvPuwOX8IEuJGHvNLjvoc8x0RatofZlJntS+O8P6Tjn6xoErlnnWmqWS/5N/J4=
X-Received: by 2002:a4a:e749:: with SMTP id n9mr426525oov.89.1618512583539;
 Thu, 15 Apr 2021 11:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210415110040.23525-1-tzimmermann@suse.de>
 <20210415110040.23525-2-tzimmermann@suse.de>
 <af143092-edd3-91eb-025d-836de1e4a104@vmware.com>
In-Reply-To: <af143092-edd3-91eb-025d-836de1e4a104@vmware.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Apr 2021 20:49:32 +0200
Message-ID: <CAKMK7uGVuw_ViUL3do=VD6o1Xj-6Wd3a4uuF=yTc5oDhtu77Jg@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/vmwgfx: Make console emulation depend on
 DRM_FBDEV_EMULATION
To: Zack Rusin <zackr@vmware.com>
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
Cc: Marek Vasut <marex@denx.de>, Sascha Hauer <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Roland Scheidegger <sroland@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 8:21 PM Zack Rusin <zackr@vmware.com> wrote:
>
> On 4/15/21 7:00 AM, Thomas Zimmermann wrote:
> > Respect DRM's kconfig setting for fbdev console emulation. If enabled,
> > it will select all required config options. So remove them from vmwgfx's
> > Kconfig file.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >   drivers/gpu/drm/vmwgfx/Kconfig      |  7 +------
> >   drivers/gpu/drm/vmwgfx/Makefile     |  4 +++-
> >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 19 +++++++++++++++++++
> >   3 files changed, 23 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
> > index 15acdf2a7c0f..b3a34196935b 100644
> > --- a/drivers/gpu/drm/vmwgfx/Kconfig
> > +++ b/drivers/gpu/drm/vmwgfx/Kconfig
> > @@ -2,12 +2,7 @@
> >   config DRM_VMWGFX
> >       tristate "DRM driver for VMware Virtual GPU"
> >       depends on DRM && PCI && X86 && MMU
> > -     select FB_DEFERRED_IO
> > -     select FB_CFB_FILLRECT
> > -     select FB_CFB_COPYAREA
> > -     select FB_CFB_IMAGEBLIT
> >       select DRM_TTM
> > -     select FB
> >       select MAPPING_DIRTY_HELPERS
> >       # Only needed for the transitional use of drm_crtc_init - can be removed
> >       # again once vmwgfx sets up the primary plane itself.
> > @@ -20,7 +15,7 @@ config DRM_VMWGFX
> >         The compiled module will be called "vmwgfx.ko".
> >
> >   config DRM_VMWGFX_FBCON
> > -     depends on DRM_VMWGFX && FB
> > +     depends on DRM_VMWGFX && DRM_FBDEV_EMULATION
> >       bool "Enable framebuffer console under vmwgfx by default"
> >       help
> >          Choose this option if you are shipping a new vmwgfx
> > diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
> > index 8c02fa5852e7..9f5743013cbb 100644
> > --- a/drivers/gpu/drm/vmwgfx/Makefile
> > +++ b/drivers/gpu/drm/vmwgfx/Makefile
> > @@ -1,6 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >   vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
> > -         vmwgfx_fb.o vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
> > +         vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
> >           vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
> >           vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
> >           vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
> > @@ -11,5 +11,7 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
> >           vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
> >           ttm_object.o ttm_lock.o ttm_memory.o
> >
> > +vmwgfx-$(CONFIG_DRM_FBDEV_EMULATION) += vmwgfx_fb.o
> >   vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) += vmwgfx_thp.o
> > +
> >   obj-$(CONFIG_DRM_VMWGFX) := vmwgfx.o
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > index 7e6518709e14..e7836da190c4 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> > @@ -1116,10 +1116,29 @@ extern void vmw_generic_waiter_remove(struct vmw_private *dev_priv,
> >    * Kernel framebuffer - vmwgfx_fb.c
> >    */
> >
> > +#ifdef CONFIG_DRM_FBDEV_EMULATION
> >   int vmw_fb_init(struct vmw_private *vmw_priv);
> >   int vmw_fb_close(struct vmw_private *dev_priv);
> >   int vmw_fb_off(struct vmw_private *vmw_priv);
> >   int vmw_fb_on(struct vmw_private *vmw_priv);
> > +#else
> > +static inline int vmw_fb_init(struct vmw_private *vmw_priv)
> > +{
> > +     return 0;
> > +}
> > +static inline int vmw_fb_close(struct vmw_private *dev_priv)
> > +{
> > +     return 0;
> > +}
> > +static inline int vmw_fb_off(struct vmw_private *vmw_priv)
> > +{
> > +     return 0;
> > +}
> > +static inline int vmw_fb_on(struct vmw_private *vmw_priv)
> > +{
> > +     return 0;
> > +}
> > +#endif
> >
> >   /**
> >    * Kernel modesetting - vmwgfx_kms.c
> >
>
> This changes the behavior a bit, I guess DRM_VMWGFX (or at least DRM_VMWGFX_FBCON) would need to select DRM_FBDEV_EMULATION to preserve the old behavior, but that's largely due to the fact that given how those options were setup we never run without FB set. In general it should be ok and looks more reasonable than the current setup. I'll try it out on Monday just in case, but for now:

The issue is that select in Kconfig is pretty annoying (hard to
disable, and it's not recursive), so there's a bit a push to retire
it. Especially for user-facing config knobs like whether you want
fbdev emulation or not. Hence the change.
-Daniel

> Reviewed-by: Zack Rusin <zackr@vmware.com>
>
> z



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
