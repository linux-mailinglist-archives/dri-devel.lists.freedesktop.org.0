Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38783462ABA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 03:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510DE6E218;
	Tue, 30 Nov 2021 02:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99E76E218
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 02:52:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7870D2FD;
 Tue, 30 Nov 2021 03:52:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638240755;
 bh=4u9kNKPRXz4Ni6t34lnHUeQWyG9lt3eOK7bwlAgLNFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MV4KJgr9gz+6xYe3v+oo7mLDOKtEvDxFDaw+VcT93P4E67cBKmCrJfs8707eyd2Qh
 IlMczvF2Y1f4KXgjIYrBmdKYSQtHcsnW5kwum6CycHkaDEL9od7aiOS0c4uG7RORp5
 0BLgBomsNVyku/pJU/fLcsJELe191v7IG89O+FCM=
Date: Tue, 30 Nov 2021 04:52:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/4] drm: rcar-du: Select DRM_MIPI_DSI with
 DRM_RCAR_MIPI_DSI
Message-ID: <YaWR23+2FoNsAH64@pendragon.ideasonboard.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
 <20211126101518.938783-3-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211126101518.938783-3-kieran.bingham+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Fri, Nov 26, 2021 at 10:15:16AM +0000, Kieran Bingham wrote:
> The RCAR_MIPI_DSI uses the DRM_MIPI_DSI interface.
> 
> Ensure that it is selected when the option is enabled.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll squash it with the appropriate patch.

> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 8cb94fe90639..8145c6d4cbc8 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -41,6 +41,7 @@ config DRM_RCAR_LVDS
>  config DRM_RCAR_MIPI_DSI
>  	tristate "R-Car DU MIPI DSI Encoder Support"
>  	depends on DRM && DRM_BRIDGE && OF
> +	select DRM_MIPI_DSI
>  	help
>  	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
>  

-- 
Regards,

Laurent Pinchart
