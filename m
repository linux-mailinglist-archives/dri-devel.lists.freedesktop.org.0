Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3EC118D94
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 17:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B4C6E14D;
	Tue, 10 Dec 2019 16:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F836E14D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 16:26:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 171B7B85;
 Tue, 10 Dec 2019 17:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1575995215;
 bh=INR/mKkQI/IM3YQhM9P0qlHvkaUK5RnEhhQJIaEZHZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cF1SCOvV+Yi9hh+C6cabPaVN0UqSFawHBYnJTZuU466QMjrST7uN7R8sLgGqIXqHe
 l7tAhnV0TYgKmZ/XOtAEyVn+UTyKRZ1kCvSbzhVKh9yRAhc5pSjnN5XriCu9BxKowN
 2XpDRlx0UxrGHqiqIc9PXH8ExnzxaFlxTvm5fhDM=
Date: Tue, 10 Dec 2019 18:26:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/bridge: panel: export drm_panel_bridge_connector
Message-ID: <20191210162647.GA5211@pendragon.ideasonboard.com>
References: <20191207140353.23967-5-sam@ravnborg.org>
 <20191210144834.27491-1-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210144834.27491-1-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linux Walleij <linux.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, nd <nd@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mihail,

Thank you for the patch.

On Tue, Dec 10, 2019 at 02:48:49PM +0000, Mihail Atanassov wrote:
> The function was unexported and was causing link failures for pl111 (and
> probably the other user tve200) in a module build.
> 
> Fixes: d383fb5f8add ("drm: get drm_bridge_panel connector via helper")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linux Walleij <linux.walleij@linaro.org>
> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/panel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 1443897f999b..f66777e24968 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -306,3 +306,4 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
>  
>  	return &panel_bridge->connector;
>  }
> +EXPORT_SYMBOL(drm_panel_bridge_connector);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
