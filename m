Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734464F0CF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 19:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD0C10E617;
	Fri, 16 Dec 2022 18:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B47310E617
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 18:16:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CECBA31;
 Fri, 16 Dec 2022 19:16:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671214577;
 bh=OuefztTKQUALROWv85YCLijIiQmQk5IUdDdU8uFi/tI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nQoCm9L+WoIKJp4FqqFiQT5952wyMP0m94s2rvhMGvDJYs5iwTqoJUvH9A/EVQq98
 C/w2y9TmFwY2sG4QzTpZIZcGBwaAEioT1WunUnNwfXoYvNxiyj1KJS4GHMcy79tdvz
 u4h6JI9PKJRO3cm1LuIqkPvg8lTJ5ipOAotd0lig=
Date: Fri, 16 Dec 2022 20:16:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 2/2] drm/omap: Fix kernel docs
Message-ID: <Y5y17ZNQtpNMbx4w@pendragon.ideasonboard.com>
References: <20220916082206.167427-1-tomi.valkeinen@ideasonboard.com>
 <20220916082206.167427-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220916082206.167427-2-tomi.valkeinen@ideasonboard.com>
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
Cc: linux-omap@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Fri, Sep 16, 2022 at 11:22:06AM +0300, Tomi Valkeinen wrote:
> Fix doc related warnings seen with W=1: the function names have changed
> but the docs have not been changed accordingly.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/omap_gem.c | 2 +-
>  drivers/gpu/drm/omapdrm/omap_irq.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index cf571796fd26..d6b4934fa0fd 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -605,7 +605,7 @@ int omap_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  }
>  
>  /**
> - * omap_gem_dumb_map	-	buffer mapping for dumb interface
> + * omap_gem_dumb_map_offset - create an offset for a dumb buffer
>   * @file: our drm client file
>   * @dev: drm device
>   * @handle: GEM handle to the object (from dumb_create)
> diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
> index 4aca14dab927..a6f0bbc879d2 100644
> --- a/drivers/gpu/drm/omapdrm/omap_irq.c
> +++ b/drivers/gpu/drm/omapdrm/omap_irq.c
> @@ -99,7 +99,7 @@ int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
>  }
>  
>  /**
> - * enable_vblank - enable vblank interrupt events
> + * omap_irq_enable_vblank - enable vblank interrupt events
>   * @crtc: DRM CRTC
>   *
>   * Enable vblank interrupts for @crtc.  If the device doesn't have
> @@ -129,7 +129,7 @@ int omap_irq_enable_vblank(struct drm_crtc *crtc)
>  }
>  
>  /**
> - * disable_vblank - disable vblank interrupt events
> + * omap_irq_disable_vblank - disable vblank interrupt events
>   * @crtc: DRM CRTC
>   *
>   * Disable vblank interrupts for @crtc.  If the device doesn't have

-- 
Regards,

Laurent Pinchart
