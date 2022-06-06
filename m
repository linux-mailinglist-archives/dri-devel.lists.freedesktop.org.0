Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A164253EEA1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 21:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13DD11BAD2;
	Mon,  6 Jun 2022 19:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0662611BAE1
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 19:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=wCRPXxH3TgL7AtKRIM4kQGYE5THJ1u4cAVHFfmnp23I=;
 b=SF0ovNOODl+ysB/CTvSKPbEriSHX/CRcfHRXG7MwzpxRCOlXVl2RHxnESjLDrzS2aGC2EVVbE3rvy
 XZ/tqcXYkX+0ZVagpfEWkXAhjQLKX8wOsJsVUOPk8s9aRpUr/97pTCnpXLo4fpiRYe0foBikXx/6wv
 NN2t48g57sOU2tYk0V2FI5M27BHRrdYwE5HBqO6qkmvjy8q+Gayyf2Lk8HpdH42OjJfPyAYX3E1nd4
 H5k3a4/An1fRWJW31BA/jmYggXs4eD1ATWFbX9xTE1B/L4LYiEvY2T/pkQAvuCk82vqt3nEMKQKix0
 tXx+TGTXm7eOjCZVneJFXhXkl5L7gLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=wCRPXxH3TgL7AtKRIM4kQGYE5THJ1u4cAVHFfmnp23I=;
 b=1F+wwMxDLCppDOU47omnaGMHoNwunuSPx33O8NmEVcVnFC/y171hv+XSeRzP12e3EInOVRzuZeNRm
 1Dgt8V3Cg==
X-HalOne-Cookie: 2bafee458b238af5551c965e6954a36589d2a2e0
X-HalOne-ID: 45c8e030-e5cf-11ec-a911-d0431ea8a290
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 45c8e030-e5cf-11ec-a911-d0431ea8a290;
 Mon, 06 Jun 2022 19:31:33 +0000 (UTC)
Date: Mon, 6 Jun 2022 21:31:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v4 8/8] drm/mediatek: Config orientation property if
 panel provides it
Message-ID: <Yp5WFA2H52nHVP3d@ravnborg.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-9-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606152431.1889185-9-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

On Mon, Jun 06, 2022 at 11:24:31PM +0800, Hsin-Yi Wang wrote:
> Panel orientation property should be set before drm_dev_register().
> Mediatek drm driver calls drm_dev_register() in .bind(). However, most
> panels sets orientation property relatively late, mostly in .get_modes()
> callback, since this is when they are able to get the connector and
> binds the orientation property to it, though the value should be known
> when the panel is probed.
> 
> Let the drm driver check if the remote end point is a panel and if it
> contains the orientation property. If it does, set it before
> drm_dev_register() is called.

I do not know the best way to do what you need to do here.
But it seems wrong to introduce a deprecated function
(drm_of_find_panel_or_bridge), to set the rotation property early.

I think you need to find a way to do this utilising the panel_bridge or
something.

	Sam

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d9f10a33e6fa..c56282412bfa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -185,6 +185,7 @@ struct mtk_dsi {
>  	struct drm_encoder encoder;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next_bridge;
> +	struct drm_panel *panel;
>  	struct drm_connector *connector;
>  	struct phy *phy;
>  
> @@ -822,6 +823,12 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>  		ret = PTR_ERR(dsi->connector);
>  		goto err_cleanup_encoder;
>  	}
> +
> +	/* Read panel orientation */
> +	if (dsi->panel)
> +		drm_connector_set_panel_orientation(dsi->connector,
> +				drm_panel_get_orientation(dsi->panel));
> +
>  	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>  
>  	return 0;
> @@ -837,6 +844,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>  	struct drm_device *drm = data;
>  	struct mtk_dsi *dsi = dev_get_drvdata(dev);
>  
> +	/* Get panel if existed */
> +	drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
> +
>  	ret = mtk_dsi_encoder_init(drm, dsi);
>  	if (ret)
>  		return ret;
> -- 
> 2.36.1.255.ge46751e96f-goog
