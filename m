Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D661ACE52
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 19:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041506E4A5;
	Thu, 16 Apr 2020 17:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACA46E4E6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:04:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADD8D97D;
 Thu, 16 Apr 2020 19:04:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587056668;
 bh=6anfdQG9yggTGdSflvo7pft6sQkL8/h+L8urd2XHqOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X6s4aKYZ0HnypTp4DjT87L+G9p89XiHG75XXhtgoPJlyuqdJe6jG6rxE1UR1BOVlR
 J9FxNgivCQ2sJ0Mg2ZvkNq3WwWsB8rDs7T5aGPdg/tj5VvO1kh/hjKPtfVMu4QV7iM
 VGQI/Wkc0oD8lObB0dgS7lJPXvjmaWPLautl2Qbg=
Date: Thu, 16 Apr 2020 20:04:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH 2/2] drm/bridge: ps8640: Let panel to set the connector
 type
Message-ID: <20200416170416.GH4796@pendragon.ideasonboard.com>
References: <20200416164404.2418426-1-enric.balletbo@collabora.com>
 <20200416164404.2418426-2-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416164404.2418426-2-enric.balletbo@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Enric,

Thank you for the patch.

On Thu, Apr 16, 2020 at 06:44:04PM +0200, Enric Balletbo i Serra wrote:
> The panel connector type should be set by the panel not the bridge, so
> remove the connector_type assignment.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
>  drivers/gpu/drm/bridge/parade-ps8640.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 956b76e0a44d..13755d278db6 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -278,8 +278,6 @@ static int ps8640_probe(struct i2c_client *client)
>  	if (!panel)
>  		return -ENODEV;
>  
> -	panel->connector_type = DRM_MODE_CONNECTOR_eDP;
> -
>  	ps_bridge->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
>  	if (IS_ERR(ps_bridge->panel_bridge))
>  		return PTR_ERR(ps_bridge->panel_bridge);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
