Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A61986728EC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 21:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459DD10E1F9;
	Wed, 18 Jan 2023 20:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B255810E1F9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 20:02:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 153231056;
 Wed, 18 Jan 2023 21:02:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674072158;
 bh=RWOtLYR+RaQRE6WCaZmtVaCwx8zGYVzjxkzcmN+lgac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lt6NHGVLHObdo3Fm/8dXRHGzxT9LdFXIzdDcD+G3BU/SLSfN8PyfhjBQffzRAt86I
 wAsCoDD0WvCe63rRHJBFLgR1MryiQ2d89L0/JiXSBVaPUWeVT6gZv3nv4L5rXmzI1y
 j8JDLGwat2scetT4aR2/52JYDlhjG7s3Q04NtyLw=
Date: Wed, 18 Jan 2023 22:02:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/6] drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
Message-ID: <Y8hQW23gf73rgRhc@pendragon.ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-2-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117135154.387208-2-tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Jan 17, 2023 at 03:51:49PM +0200, Tomi Valkeinen wrote:
> The RCAR DSI driver uses reset controller, so we should select it in the
> Kconfig.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index fd2c2eaee26b..a8f862c68b4f 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -55,6 +55,7 @@ config DRM_RCAR_MIPI_DSI
>  	def_tristate DRM_RCAR_DU
>  	depends on DRM_RCAR_USE_MIPI_DSI
>  	select DRM_MIPI_DSI
> +	select RESET_CONTROLLER
>  
>  config DRM_RCAR_VSP
>  	bool "R-Car DU VSP Compositor Support" if ARM

-- 
Regards,

Laurent Pinchart
