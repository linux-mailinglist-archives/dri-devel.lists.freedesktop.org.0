Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617C42E0D7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B926EB78;
	Thu, 14 Oct 2021 18:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CE66EBA4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:08:28 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id ba8a6343-2d19-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 18:08:26 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3561A194B57;
 Thu, 14 Oct 2021 20:08:34 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:08:24 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 robert.foss@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drm/bridge: synopsys: dw-hdmi: also allow interlace
 on bridge
Message-ID: <YWhyGBlz7JW8NciX@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-5-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-5-narmstrong@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 14, 2021 at 05:26:03PM +0200, Neil Armstrong wrote:
> Since we allow interlace on the encoder, also allow it on the bridge
> so we can allow interlaced modes when using DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index f08d0fded61f..62ae63565d3a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3413,6 +3413,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
>  	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>  			 | DRM_BRIDGE_OP_HPD;
> +	hdmi->bridge.interlace_allowed = true;
>  #ifdef CONFIG_OF
>  	hdmi->bridge.of_node = pdev->dev.of_node;
>  #endif
> -- 
> 2.25.1
