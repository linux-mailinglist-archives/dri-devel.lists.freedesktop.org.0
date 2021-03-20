Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EFC342965
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 01:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497256EB10;
	Sat, 20 Mar 2021 00:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAEF6EB10
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 00:21:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 236598D3;
 Sat, 20 Mar 2021 01:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616199695;
 bh=YxyYG0rUzewpkZSqO4W7En5pkRKvoNodFD5mlHd1GTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d7IhFfS2Lv6sm+CBEt1QwgBC8BEsPfNz4YumUCf5tRZ8+by6MAIe0sVm92jSPtaNX
 lL2HCvxfBPZ+fz076pYKZ7nBlZfx6R8xUYp/Ec1dXOsS7MCOPuErg0tLU+d50Upz1a
 p8qQWdOpRX8/WbMPUQ31l4x9DadCoxbOo0Ia8c+A=
Date: Sat, 20 Mar 2021 02:20:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/rockchip: Remove unused variable
Message-ID: <YFU/6Hm1CuVL8MlO@pendragon.ideasonboard.com>
References: <20210319152920.262035-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319152920.262035-1-maxime@cerno.tech>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Fri, Mar 19, 2021 at 04:29:20PM +0100, Maxime Ripard wrote:
> Commit 977697e20b3d ("drm/atomic: Pass the full state to planes atomic
> disable and update") added the old_state variable instead of what used
> to be a parameter, but it also removed the sole user of that variable in
> the vop_plane_atomic_update function leading to an usused variable.
> Remove it.
> 
> Fixes: 977697e20b3d ("drm/atomic: Pass the full state to planes atomic disable and update")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 81c70d7a0471..64469439ddf2 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -879,8 +879,6 @@ static void vop_plane_atomic_disable(struct drm_plane *plane,
>  static void vop_plane_atomic_update(struct drm_plane *plane,
>  		struct drm_atomic_state *state)
>  {
> -	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> -									   plane);
>  	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
>  									   plane);
>  	struct drm_crtc *crtc = new_state->crtc;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
