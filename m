Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F573738F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 20:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE99310E198;
	Tue, 20 Jun 2023 18:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699DC10E198
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 18:13:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EF2A2B3;
 Tue, 20 Jun 2023 20:12:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687284767;
 bh=hgv9+4sA5NwMZaVd8LsfB7EPxDybNMf2znUTXVzj8xc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l2+QBmuf7rp3bOkuCcVNcBSx+/iIaBh8g2DJyncm/RLY2ij/jU4KNqrSeSm6OjONY
 +EsysL8+cjlQiEbrmT8M7tI+Spz9W56ME4vp73DtJzPYlnSw3hfD3oEKLhkTN4dy7w
 YgOXTmrESJjRvj3pBx/zJVXyXSltb1XET383CB1c=
Date: Tue, 20 Jun 2023 21:13:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/bridge_connector: use
 drm_kms_helper_connector_hotplug_event()
Message-ID: <20230620181320.GH26467@pendragon.ideasonboard.com>
References: <20230620175506.263109-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230620175506.263109-1-contact@emersion.fr>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

Thank you for the patch.

On Tue, Jun 20, 2023 at 05:55:09PM +0000, Simon Ser wrote:
> This adds more information to the hotplug uevent and lets user-space
> know that it's about a particular connector only.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 19ae4a177ac3..fc6f16e14f36 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -125,7 +125,7 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
>  
>  	drm_bridge_connector_hpd_notify(connector, status);
>  
> -	drm_kms_helper_hotplug_event(dev);
> +	drm_kms_helper_connector_hotplug_event(connector);
>  }
>  
>  static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)

-- 
Regards,

Laurent Pinchart
