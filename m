Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4FE73BB53
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB9488CBF;
	Fri, 23 Jun 2023 15:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B3588CBF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:13:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CAF6D5F;
 Fri, 23 Jun 2023 17:13:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687533182;
 bh=keBSEwXRTk5UtRZ/0fenvLdSAenapjGMYjUaABKjGzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JAvQCvHfEA6T6ZXTTjkgoU3PNPvxOGlACUqaoFD73T6XZIiz+YddRdCuw9Aw+2dhH
 l6Gu5LoOhUv1CCZAe3MiFcdHpxGHMXFM+qfWP3XEKiPtfWBPlV3OOqHL4FPTSrYnt8
 pBM29IBo1roToEb7JYDk5jRAdGreYEBDQmQLahZA=
Date: Fri, 23 Jun 2023 18:13:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 09/39] drm: renesas: shmobile: Add missing YCbCr formats
Message-ID: <20230623151337.GN2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <b7b75a9e1170e1be5e9ecf9db91c6a21197b7df5.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b7b75a9e1170e1be5e9ecf9db91c6a21197b7df5.1687423204.git.geert+renesas@glider.be>
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

On Thu, Jun 22, 2023 at 11:21:21AM +0200, Geert Uytterhoeven wrote:
> The primary plane supports various YCbCr formats, and the CRTC code
> already knows how to handle them.  Enable support for the missing
> formats by adding them to the table of supported modes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 84dbf35025d7be63..cd492806105e5b5d 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -493,6 +493,12 @@ static const uint32_t modeset_formats[] = {
>  	DRM_FORMAT_RGB888,
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_NV21,
> +	DRM_FORMAT_NV16,
> +	DRM_FORMAT_NV61,
> +	DRM_FORMAT_NV24,
> +	DRM_FORMAT_NV42,
>  };
>  
>  static const struct drm_plane_funcs primary_plane_funcs = {

-- 
Regards,

Laurent Pinchart
