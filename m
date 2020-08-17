Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E452477F1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 22:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F5289F35;
	Mon, 17 Aug 2020 20:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B5389F35
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 20:09:57 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id z3so15662449ilh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fz8YH3ttBAXv+yYDH9yNJDSHeJogw1l1E0t014+9oOw=;
 b=HXj2Fv02MMi+gcm5uA9+0sKex5gNR9z1dB48XSWRAgGGb5roxROgbHSOMFMJRg6CDS
 +XUQ6VW4bbRtBEtovE3wZFU3PrHRghk5LFfn/e1JRRmEdQogyFe3YUP1iXpeV02RSbHr
 cNT+XiHoBINzIIrK4n7hjrihuJ0R3A70kBLjUAChpCWdFL3zmFSVMpPIwF4N1/8oZ9+a
 XGflWJl/LR41THDWGeDcYVptNsxD5xr5CO7yiaM8vYGJSMfzLqcg/W8DhZAhTwEJ5L2/
 I8o+uLGJHNLBjpdgCdESZMMTkpcos9ODt96QRAN1dGyaBAueTV+0DrmD7uwGdKlctwEe
 5B2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fz8YH3ttBAXv+yYDH9yNJDSHeJogw1l1E0t014+9oOw=;
 b=JgxO9wDOkzb1+j//5BlgcmUVl7JxooWr+OzCVTmc/FEiQeDeoxhsweu2k9/gYA45AQ
 WrHSEScrP8DmefrMfHiyNZ6GPZmbVcGfthaztvD92wRifgtm4RogaZpcTPngLvDNwKy/
 1Ga8dUm6+yMp0Q2ScCmj9+KAhv2ikz8/SjBAiwQH9uXUqjE6v1v8vWvHsdJyvDLC6b1E
 aqA+Cgc+YRdbGX4T78CojqOMD9gtEft1CCG0SCFoakMJIf+Vs29iDvasYDz5hmGWI+xm
 BusXdZq1aFlR/ZBIvKWrFk20Q2Q7XAd7b2vSN8BHor6fvWlrb91lvM+2K/miqKZRBa+7
 B57A==
X-Gm-Message-State: AOAM533rJHruuchghBT+exCR7Shss2hVWgkkTXfiAD0pH4YlTcHLGzDo
 bQGotJ39rtBATO4VRNYJQFU10D1s15+gQIM+58Jiqw==
X-Google-Smtp-Source: ABdhPJzvEXvOxwhfHxJx9md8bhgvkfbZ8mKd9h2tSFiLizMv2tQ2E3iK/RcEujijLewWpdMshy0gcidjQ4PQa5Q3AXA=
X-Received: by 2002:a92:db47:: with SMTP id w7mr6760716ilq.264.1597694996988; 
 Mon, 17 Aug 2020 13:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200817195846.14076-1-sean@poorly.run>
 <20200817200521.GA1551172@ravnborg.org>
In-Reply-To: <20200817200521.GA1551172@ravnborg.org>
From: Sean Paul <sean@poorly.run>
Date: Mon, 17 Aug 2020 16:09:20 -0400
Message-ID: <CAMavQKL2=Gx+XCbMYc5p08jRNtH5ju=oadhxBxzgNf+gzo3fnA@mail.gmail.com>
Subject: Re: [PATCH] drm/qxl: Fix build errors
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Sean Paul <seanpaul@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 spice-devel@lists.freedesktop.org, Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 4:05 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Sean.
>
> On Mon, Aug 17, 2020 at 03:58:38PM -0400, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Introduced in the patch below, the END macro was missing 'dev' and BEGIN
> > macro needs drm_drv_uses_atomic_modeset() from drm_drv.h
> >
> > Fixes: bbaac1354cc9 ("drm/qxl: Replace deprecated function in qxl_display")
> We should not use Fixes for local fixes like this, as we do not want the
> robots to pick this commit.
> With the Fixes: dropped (maybe just reference the commit in the
> changelog):
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>

Ok, I'll fix up the Fixes: tag and apply to -misc-next.

Thanks for the quick response!

Sean

>
> > Cc: Sidong Yang <realwakka@gmail.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: virtualization@lists.linux-foundation.org
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  drivers/gpu/drm/qxl/qxl_display.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> > index fa79688013b7..5b4fd6952b53 100644
> > --- a/drivers/gpu/drm/qxl/qxl_display.c
> > +++ b/drivers/gpu/drm/qxl/qxl_display.c
> > @@ -28,6 +28,7 @@
> >
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_drv.h>
> >  #include <drm/drm_gem_framebuffer_helper.h>
> >  #include <drm/drm_plane_helper.h>
> >  #include <drm/drm_probe_helper.h>
> > @@ -186,7 +187,7 @@ void qxl_display_read_client_monitors_config(struct qxl_device *qdev)
> >
> >       DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
> >       qxl_update_offset_props(qdev);
> > -     DRM_MODESET_LOCK_ALL_END(ctx, ret);
> > +     DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> >       if (!drm_helper_hpd_irq_event(dev)) {
> >               /* notify that the monitor configuration changed, to
> >                  adjust at the arbitrary resolution */
> > @@ -431,7 +432,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
> >                         clips, num_clips, inc, 0);
> >
> >  out_lock_end:
> > -     DRM_MODESET_LOCK_ALL_END(ctx, ret);
> > +     DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
> >
> >       return 0;
> >  }
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
