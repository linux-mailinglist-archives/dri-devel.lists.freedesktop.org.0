Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1951ACE96
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 19:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60A36E837;
	Thu, 16 Apr 2020 17:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFFC6E580
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:22:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3145897D;
 Thu, 16 Apr 2020 19:22:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587057775;
 bh=bTfJZ+75ndQOARxqXeuOxJFXyYt8RzIOrx7gvZeGM5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UhIfmKrRUNzc0klYEFAND1I5BO8RI0zq5GjDoZW2tHzP9cxwLQYneLPVCYJ6bl+02
 XVgqihJFaXzbRtD0iNQStH+CzDk+kbln0wVmmiI0D6U496AnHN2pJmiKOEEsagB50g
 PBTy+E/IcEX3vmXwbUlbFLnp1q9O0VQPqx3NMc+I=
Date: Thu, 16 Apr 2020 20:22:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 2/7] drm/bridge_connector: Set default status
 connected for eDP connectors
Message-ID: <20200416172243.GL4796@pendragon.ideasonboard.com>
References: <20200416155720.2360443-1-enric.balletbo@collabora.com>
 <20200416155720.2360443-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416155720.2360443-3-enric.balletbo@collabora.com>
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
Cc: drinkcat@chromium.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Enric,

Thank you for the patch.

On Thu, Apr 16, 2020 at 05:57:14PM +0200, Enric Balletbo i Serra wrote:
> In an eDP application, HPD is not required and on most bridge chips
> useless. If HPD is not used, we need to set initial status as connected,
> otherwise the connector created by the drm_bridge_connector API remains
> in an unknown state.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v2: None
> 
>  drivers/gpu/drm/drm_bridge_connector.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index c6994fe673f3..a58cbde59c34 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -187,6 +187,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
>  		case DRM_MODE_CONNECTOR_DPI:
>  		case DRM_MODE_CONNECTOR_LVDS:
>  		case DRM_MODE_CONNECTOR_DSI:
> +		case DRM_MODE_CONNECTOR_eDP:
>  			status = connector_status_connected;
>  			break;
>  		default:

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
