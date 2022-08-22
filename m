Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F07EC59B9A2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 08:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D9D9A1E4;
	Mon, 22 Aug 2022 06:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295429A1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 06:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1661150077; x=1692686077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bY+q1zLDmz0N9xyYX4JsB1Jqsm+1Dm5+35CyCTse8kE=;
 b=K8wFdkOKeVvZRu2XG0u/3afxbdcFwMh7NgpzpxvuASkHFzeEtpz1q3/Q
 JZiGNeM0IeTsmfNSAObqhCO3lZhKKAKOXwHbR8POJp4V3Y4OVE307WFSA
 n5tTB+7Z/dkql/mXKpw6Y73zXUu0mudAXmGwf+zQXEjYGBmYPVBm8jIYd
 JDZMLfvO/sUOWPX9MNnNx2gkjUGpUnBVXBHALmVy80xeJKXgHAJYaEZYI
 5doKpkavVk9dL20Hpru6sGSwIQJ0I1rxRsofmY3dqN52EoBhR/1nTWs3O
 yY7Ycuq6t4a8c4PuG01K+ogwJq0iCoXsms05MZiH9fbAATyESo5YdeJsv A==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654552800"; d="scan'208";a="25717638"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 22 Aug 2022 08:34:35 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 22 Aug 2022 08:34:35 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 22 Aug 2022 08:34:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1661150075; x=1692686075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bY+q1zLDmz0N9xyYX4JsB1Jqsm+1Dm5+35CyCTse8kE=;
 b=eD1m5sdc0HTHXi7UgmDI7zv4dVoTIaIVNXLKyQu9NKjp/lIcKCzCSsls
 gl74lCmK9Vs3AKxzZRPzCAiJcPvCRs6WOOt3c64+HwWBTHtb+LQKl6m+n
 ZjcF0Tdnox3hJ0XsnYU/ST0AxltxKIXwLyOrP7YdC2d1+ZIbYtwuqp8ig
 OPpwqekA8X3X0dmtg8zepGCgiRvMGu1RuXWIAeNHeedcXFUZI8aqzMmmG
 q0f75twhqKdVPKw1qUmdFQQvYoIwWggeXYqe0CwhY2bYn8LOa+HCxvaem
 38AF9TfUOYPMFgniWU/2T+e6ciV4yLplzokdnfZtH0W5829+h5mOqfUJj A==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654552800"; d="scan'208";a="25717637"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 22 Aug 2022 08:34:35 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 03DE4280056;
 Mon, 22 Aug 2022 08:34:35 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v5 4/4] drm/lcdif: switch to devm_drm_of_get_bridge
Date: Mon, 22 Aug 2022 08:34:32 +0200
Message-ID: <1829829.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220819140852.255187-4-marex@denx.de>
References: <20220819140852.255187-1-marex@denx.de>
 <20220819140852.255187-4-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, robert.foss@linaro.org,
 Liu Ying <victor.liu@oss.nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Marek,

Am Freitag, 19. August 2022, 16:08:52 CEST schrieb Marek Vasut:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
> 
> Switch to the new function and reduce boilerplate.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Reported-by: Liu Ying <victor.liu@oss.nxp.com>
> Tested-by: Martyn Welch <martyn.welch@collabora.com>
> Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martyn Welch <martyn.welch@collabora.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: Add RB from Liu
> V3: Add TB from Martyn from V1
> V4: Add AB from Sam from V2
> V5: Rebase on current drm-misc-next
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c index 4f16947212b60..075002ed6fb09
> 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -42,23 +42,11 @@ static int lcdif_attach_bridge(struct lcdif_drm_private
> *lcdif) {
>  	struct drm_device *drm = lcdif->drm;
>  	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
>  	int ret;
> 
> -	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
> -					  &bridge);
> -	if (ret)
> -		return ret;
> -
> -	if (panel) {
> -		bridge = devm_drm_panel_bridge_add_typed(drm->dev, 
panel,
> -							 
DRM_MODE_CONNECTOR_DPI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> -	}
> -
> -	if (!bridge)
> -		return -ENODEV;
> +	bridge = devm_drm_of_get_bridge(drm->dev, drm->dev->of_node, 0, 0);
> +	if (IS_ERR(bridge))
> +		return PTR_ERR(bridge);
> 
>  	ret = drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
>  	if (ret)


Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



