Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17042477EE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 22:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC85989F06;
	Mon, 17 Aug 2020 20:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7637289F06
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 20:06:55 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id u126so18807372iod.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 13:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TrRzqqfEakGnzgIpwCYx1lJRJPqunUyxC4YgLxEx8lo=;
 b=Fpvko7Mz554p7PeLlau7248FfQogy9ySuEbqDj6am1C8BzxVJNs7N+XLVqXVmpow2f
 IDMqINlWe8rZSaTIYP/DGOn99faNRd63hI5h53xbdQD3FTUqW3LDghXOXzPjGXG/d3L/
 7xVv3Bw6DK2lqS8RV7GTrIXBloGdL4RIx8RYKKQnxzhgWYKlJL7JyXS951grawLRNBCg
 JorJsbMqtCNFqHf4wcl+jJ5DgFP3odl/YlAKeUGaZ2NfI6tWWqWGdjZtIxzgFl9sBDsY
 hyVFkPEQZAXmIGPWlIzAupZDb2cG7DOS3yo4lrXB1iZxaIWtp4GEaHGKFYylmZeTLhPc
 5lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TrRzqqfEakGnzgIpwCYx1lJRJPqunUyxC4YgLxEx8lo=;
 b=YIZVn2Rd6UR9mqjFAKETmFwjl7bvGZLzbv2a/ZZoUrgcwKWJFTRBsBA2s9jkdBYi//
 9qoUqoDZz//2H2qzfWBqfLJWgOXBfnqqHloKXrjan1DMEARY8tZ+DaXozQ8Fqlqu3b/I
 KgvY05n4o1OfizyTfnXgubIeN5/+7bqGwwOFjYBolThCWLHJI2gAM10qoNiC7o6ReFbM
 HnuZNY8/AZgv66fEcNB4Q/3VaGlVu8NEEoWUbaHT4feXdwRryxECqDBveYBRCUrPX8U2
 ZhcXzoWgRX0jQy8gEx27zxAfNcfvESWAFGL9j0mjam28GeOBQcHNAknfHzXGZiuSGPG3
 K0yg==
X-Gm-Message-State: AOAM532FChacOoA9+OkgovuNZTfL+JNujdQ2ePdb1r2wA5v6Dyl7592z
 Fv4UekQzq49XYbwV11S78ZVvM9wWik/wKDgr/Yk2+ATn/ZvwRA==
X-Google-Smtp-Source: ABdhPJyAzOOKqhUi24WHghjcg1ZKWxyHKeTAhY+WfVnPcoqucW2k1YinUztsAH53hkQWNWZv7VCtj1Lui925HvVLpEg=
X-Received: by 2002:a02:cf26:: with SMTP id s6mr16131322jar.44.1597694814526; 
 Mon, 17 Aug 2020 13:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200817195846.14076-1-sean@poorly.run>
In-Reply-To: <20200817195846.14076-1-sean@poorly.run>
From: Sean Paul <sean@poorly.run>
Date: Mon, 17 Aug 2020 16:06:18 -0400
Message-ID: <CAMavQKK+zJ8aeQ3kz9AOwjHOG12QkRua=hBjfNHhhtuhxmLacQ@mail.gmail.com>
Subject: Re: [PATCH] drm/qxl: Fix build errors
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: David Airlie <airlied@linux.ie>, virtualization@lists.linux-foundation.org,
 Sean Paul <seanpaul@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 3:58 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Introduced in the patch below, the END macro was missing 'dev' and BEGIN
> macro needs drm_drv_uses_atomic_modeset() from drm_drv.h
>
> Fixes: bbaac1354cc9 ("drm/qxl: Replace deprecated function in qxl_display")
> Cc: Sidong Yang <realwakka@gmail.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: virtualization@lists.linux-foundation.org

Apologies, this should be:

Fixes: 77ef38574beb ("drm/modeset-lock: Take the modeset BKL for
legacy drivers")
Cc: Alex Deucher <alexdeucher@gmail.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.8+
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>


> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index fa79688013b7..5b4fd6952b53 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -28,6 +28,7 @@
>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> @@ -186,7 +187,7 @@ void qxl_display_read_client_monitors_config(struct qxl_device *qdev)
>
>         DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
>         qxl_update_offset_props(qdev);
> -       DRM_MODESET_LOCK_ALL_END(ctx, ret);
> +       DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>         if (!drm_helper_hpd_irq_event(dev)) {
>                 /* notify that the monitor configuration changed, to
>                    adjust at the arbitrary resolution */
> @@ -431,7 +432,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
>                           clips, num_clips, inc, 0);
>
>  out_lock_end:
> -       DRM_MODESET_LOCK_ALL_END(ctx, ret);
> +       DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
>
>         return 0;
>  }
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
