Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8764EFA27
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 20:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DA010E3D1;
	Fri,  1 Apr 2022 18:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3EE10E45F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:50:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CF072F7;
 Fri,  1 Apr 2022 20:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648838998;
 bh=QY1TllLAVyjYuESIhQkEahZ1N+amExQqInuVbGhDYQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6V5J2jdAcj9Q5bYxkybypKGpUpEEExdAJpt9+tqYtTjNrID/OQL743BWhWLnbNNo
 h6TkzypVnwnXhHJkqYnFDtMPVY+rLrSnrXll1kkUjUJqvo/tHCavFMokzqMFwH9MTX
 ArY44XwjWcaYLaT2fv/cvamZoDIew0v3xHPFzxVA=
Date: Fri, 1 Apr 2022 21:49:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH 3/3] drm/panel: lvds: Drop duplicate
 width-mm/height-mm check
Message-ID: <YkdJVMizZ5mvmPSn@pendragon.ideasonboard.com>
References: <20220401163755.302548-1-marex@denx.de>
 <20220401163755.302548-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401163755.302548-3-marex@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Fri, Apr 01, 2022 at 06:37:55PM +0200, Marek Vasut wrote:
> The of_get_drm_panel_display_mode() now does check for
> presence of width-mm/height-mm DT properties, drop the
> duplicate check here.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

assuming patches 1/3 and 2/3 get accepted.

> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index eca067e78579..f11252fb00fe 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -128,18 +128,6 @@ static int panel_lvds_parse_dt(struct panel_lvds *lvds)
>  		return ret;
>  	}
>  
> -	if (lvds->dmode.width_mm == 0) {
> -		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
> -			np, "width-mm");
> -		return -ENODEV;
> -	}
> -
> -	if (lvds->dmode.height_mm == 0) {
> -		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
> -			np, "height-mm");
> -		return -ENODEV;
> -	}
> -
>  	of_property_read_string(np, "label", &lvds->label);
>  
>  	ret = drm_of_lvds_get_data_mapping(np);

-- 
Regards,

Laurent Pinchart
