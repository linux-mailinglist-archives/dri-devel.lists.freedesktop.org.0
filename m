Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886D7587B13
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 12:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1FE11B3AB;
	Tue,  2 Aug 2022 10:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DAC10E914
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 10:53:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B200B25B;
 Tue,  2 Aug 2022 12:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1659437614;
 bh=w8AZJHqp+A9fn1ePAye0WrrjbAMpqA/lRUqJ3qO4C9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PLf6T6q508gLjgspDip9CkpueQ+XlYkfgVC55ovdoqaOOc0ELjJLiQW0KsI/HqpNS
 g418Fy6Ajgis4ryKa+ZwH6zWBON4NLY8NWan+1YDmvxwE3XH/yGHeXbOp+pFJzlI35
 eXIujlVMPgsaM9UOPIUexcLunmxP98DgcbskvrdA=
Date: Tue, 2 Aug 2022 13:53:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v7 1/5] drm/fb: remove unused includes of
 drm_fb_cma_helper.h
Message-ID: <YukCKUvNGuLx3JT7@pendragon.ideasonboard.com>
References: <20220802000405.949236-1-dakr@redhat.com>
 <20220802000405.949236-2-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220802000405.949236-2-dakr@redhat.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

Thank you for the patch.

On Tue, Aug 02, 2022 at 02:04:01AM +0200, Danilo Krummrich wrote:
> Quite a lot of drivers include the drm_fb_cma_helper.h header file
> without actually making use of it's provided API, hence remove those
> includes.
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c                 | 1 -
>  drivers/gpu/drm/arm/malidp_drv.c                | 1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         | 1 -
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       | 1 -
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c       | 1 -
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 1 -
>  drivers/gpu/drm/imx/imx-drm-core.c              | 1 -
>  drivers/gpu/drm/imx/ipuv3-crtc.c                | 1 -
>  drivers/gpu/drm/logicvc/logicvc_mode.c          | 1 -
>  drivers/gpu/drm/pl111/pl111_drv.c               | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c          | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c           | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c           | 1 -
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c        | 1 -
>  drivers/gpu/drm/solomon/ssd130x.c               | 1 -
>  drivers/gpu/drm/sti/sti_drv.c                   | 1 -
>  drivers/gpu/drm/sti/sti_plane.c                 | 1 -
>  drivers/gpu/drm/stm/drv.c                       | 1 -
>  drivers/gpu/drm/sun4i/sun4i_drv.c               | 1 -
>  drivers/gpu/drm/sun4i/sun8i_mixer.c             | 1 -
>  drivers/gpu/drm/tidss/tidss_crtc.c              | 1 -
>  drivers/gpu/drm/tidss/tidss_kms.c               | 1 -
>  drivers/gpu/drm/tidss/tidss_plane.c             | 1 -
>  drivers/gpu/drm/tve200/tve200_drv.c             | 1 -
>  drivers/gpu/drm/v3d/v3d_drv.c                   | 1 -
>  drivers/gpu/drm/vc4/vc4_drv.c                   | 1 -
>  26 files changed, 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 350ca4e4eaa6..b32168e3f9ae 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -26,7 +26,6 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index d5aef21426cf..fa6c1a4254dc 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -19,7 +19,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 7780b72de9e8..54aa8af45829 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -16,7 +16,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> index 7a503bf08d0f..4baa4977e473 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -20,7 +20,6 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_modeset_helper.h>
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
> index d763f53f480c..5b47000738e4 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
> @@ -6,7 +6,6 @@
>   */
>  
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_probe_helper.h>
>  
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index 2af51df6dca7..e8b0fe970969 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -19,7 +19,6 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> index 50fd7aac5198..e43345bd1346 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -16,7 +16,6 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
> index f7863d6dea80..d9f832f952c2 100644
> --- a/drivers/gpu/drm/imx/ipuv3-crtc.c
> +++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
> @@ -18,7 +18,6 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
> diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.c b/drivers/gpu/drm/logicvc/logicvc_mode.c
> index 11940704f644..c59da7039dc1 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_mode.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_mode.c
> @@ -10,7 +10,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
> index 19a4324bd356..5b5f3573b619 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -48,7 +48,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 169ca0c8912f..ed887ebd2f6b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -17,7 +17,6 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_vblank.h>
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 70d85610d720..110ec9538b44 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -20,7 +20,6 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_managed.h>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 761451ee5263..7fed5b0c65ce 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -11,7 +11,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> index 68d21be784aa..edb003537530 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> @@ -9,7 +9,6 @@
>  
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 77f80b0d3a5e..973ae2dfb2f8 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -21,7 +21,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_edid.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_framebuffer.h>
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index d858209cf8de..c0fbdb8cf6eb 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -14,7 +14,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
> index c74b524663ab..0a55180be22b 100644
> --- a/drivers/gpu/drm/sti/sti_plane.c
> +++ b/drivers/gpu/drm/sti/sti_plane.c
> @@ -9,7 +9,6 @@
>  #include <linux/types.h>
>  
>  #include <drm/drm_blend.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_cma_helper.h>
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index c63945dc2260..bb269dad30f9 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -18,7 +18,6 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index 6eb1aabdb161..382074ef1394 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -17,7 +17,6 @@
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_module.h>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index 4e9bd9cb6b36..b3d1c0940406 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -16,7 +16,6 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_probe_helper.h>
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> index ad4ce9d06622..92d2c25bb0ff 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -8,7 +8,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_vblank.h>
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index 666e527a0acf..b61db8f279e9 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -10,7 +10,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc_helper.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_of.h>
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index 68a85a94ffcb..42d50ec5526d 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -11,7 +11,6 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  
>  #include "tidss_crtc.h"
> diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
> index 6d9d2921abf4..86ebfe626cd0 100644
> --- a/drivers/gpu/drm/tve200/tve200_drv.c
> +++ b/drivers/gpu/drm/tve200/tve200_drv.c
> @@ -39,7 +39,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 8c7f910daa28..e8c975b81585 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -22,7 +22,6 @@
>  #include <linux/reset.h>
>  
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_managed.h>
>  #include <uapi/drm/v3d_drm.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 89975bdd607e..d33baf2667dd 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -33,7 +33,6 @@
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_vblank.h>
>  

-- 
Regards,

Laurent Pinchart
