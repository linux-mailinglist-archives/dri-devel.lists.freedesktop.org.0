Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07BD2477ED
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 22:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3966089F27;
	Mon, 17 Aug 2020 20:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C870E89F24;
 Mon, 17 Aug 2020 20:05:27 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F098D804AF;
 Mon, 17 Aug 2020 22:05:22 +0200 (CEST)
Date: Mon, 17 Aug 2020 22:05:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/qxl: Fix build errors
Message-ID: <20200817200521.GA1551172@ravnborg.org>
References: <20200817195846.14076-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817195846.14076-1-sean@poorly.run>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8
 a=20KFwNOVAAAA:8 a=Z4Rwk6OoAAAA:8 a=e5mUnYsNAAAA:8 a=Fn0XzTm-E8DT0MMFozsA:9
 a=N3S3ulj5AKuxvIIe:21 a=7IyYmjEE0Ti2w03Z:21 a=CjuIK1q_8ugA:10
 a=-RoEEKskQ1sA:10 a=xmb-EsYY8bH0VWELuYED:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=HkZW87K1Qel5hWWM3VKY:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Sean Paul <seanpaul@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 spice-devel@lists.freedesktop.org, Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sean.

On Mon, Aug 17, 2020 at 03:58:38PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Introduced in the patch below, the END macro was missing 'dev' and BEGIN
> macro needs drm_drv_uses_atomic_modeset() from drm_drv.h
> 
> Fixes: bbaac1354cc9 ("drm/qxl: Replace deprecated function in qxl_display")
We should not use Fixes for local fixes like this, as we do not want the
robots to pick this commit.
With the Fixes: dropped (maybe just reference the commit in the
changelog):
Acked-by: Sam Ravnborg <sam@ravnborg.org>


> Cc: Sidong Yang <realwakka@gmail.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
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
>  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
>  	qxl_update_offset_props(qdev);
> -	DRM_MODESET_LOCK_ALL_END(ctx, ret);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  	if (!drm_helper_hpd_irq_event(dev)) {
>  		/* notify that the monitor configuration changed, to
>  		   adjust at the arbitrary resolution */
> @@ -431,7 +432,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
>  			  clips, num_clips, inc, 0);
>  
>  out_lock_end:
> -	DRM_MODESET_LOCK_ALL_END(ctx, ret);
> +	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
>  
>  	return 0;
>  }
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
