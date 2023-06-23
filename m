Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A562173BD39
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8949A10E67E;
	Fri, 23 Jun 2023 16:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5288B10E67E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:53:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4428B440;
 Fri, 23 Jun 2023 18:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687539142;
 bh=YJ3yOXbzBwOA7XqInoA3P8Y2N6ErXUdW7tXjVgzSU1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IlRE08XWEpA/3WiAtLmtr4QhSVqBYLWSFmgG8O8tIu1gA8lbdcqLoEfZYLQUQkuDM
 1FKORhiqQdMEHgUTb97uS8t0makkemU6wWVH687RHzZGiVMn/YQyaMFoIUyGoNZIrE
 dSz3wANBci0ADTqsJzAZWa8ATef1rhUUmZ8Qi8yg=
Date: Fri, 23 Jun 2023 19:52:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 27/39] drm: renesas: shmobile: Rename shmob_drm_plane.plane
Message-ID: <20230623165257.GE2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <ecd392c966c967ac6826e20f8888e10161c9cbf7.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ecd392c966c967ac6826e20f8888e10161c9cbf7.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:39AM +0200, Geert Uytterhoeven wrote:
> Rename the "plane" member of the shmob_drm_plane subclass structure to
> "base", to improve readability.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 63886015baaebfc0..e300e5c0de70a9b1 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -20,7 +20,7 @@
>  #include "shmob_drm_regs.h"
>  
>  struct shmob_drm_plane {
> -	struct drm_plane plane;
> +	struct drm_plane base;
>  	unsigned int index;
>  	unsigned int alpha;
>  
> @@ -37,7 +37,7 @@ struct shmob_drm_plane {
>  
>  static inline struct shmob_drm_plane *to_shmob_plane(struct drm_plane *plane)
>  {
> -	return container_of(plane, struct shmob_drm_plane, plane);
> +	return container_of(plane, struct shmob_drm_plane, base);
>  }
>  
>  static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
> @@ -64,7 +64,7 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
>  static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>  				    struct drm_framebuffer *fb)
>  {
> -	struct shmob_drm_device *sdev = to_shmob_device(splane->plane.dev);
> +	struct shmob_drm_device *sdev = to_shmob_device(splane->base.dev);
>  	unsigned int ovl_idx = splane->index - 1;
>  	u32 format;
>  
> @@ -221,7 +221,7 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
>  	}
>  
>  	splane = drmm_universal_plane_alloc(&sdev->ddev,
> -					    struct shmob_drm_plane, plane, 1,
> +					    struct shmob_drm_plane, base, 1,
>  					    funcs, formats,
>  					    ARRAY_SIZE(formats),  NULL, type,
>  					    NULL);
> @@ -231,5 +231,5 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
>  	splane->index = index;
>  	splane->alpha = 255;
>  
> -	return &splane->plane;
> +	return &splane->base;
>  }

-- 
Regards,

Laurent Pinchart
