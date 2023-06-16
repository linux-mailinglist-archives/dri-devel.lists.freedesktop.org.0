Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8247B73392E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 21:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D1710E67F;
	Fri, 16 Jun 2023 19:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CA510E67F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 19:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=mrRDL0lnOOJ6OTZiN7Veg6gj61hPDyTf/iT+Y5Gi/b8=;
 b=KSmlrXDD2vkXYxbEQS5nX2iQCDL55vLIHSHEs2kM5dsfYLkRnrEGFRljVEG+8GTTDqPJ6n0edJ8Ak
 ULe+/ndh6Baf12yTKC4C5S0QgIbtJjOogppaBr2B72GwUiStU2og1nKdZEagB6UK7u7eUpXb292x/o
 d4xqZrjnMZGWFrs+tAe+9bsA/VgnAwXRBQDryd+33spHaJdF0ScxoNLP6+818L8L7B83IAn1atn8Y/
 JRYGKCLSQzQQnac0eqTUS7NB0WOHy5qa3bQ+EKaGXjCjXBuHPaKjdOjuWTcTZZQOYUJ38kvZXb7QKW
 cpBXyQirrgeW+ewArUPylct2LN0CFNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=mrRDL0lnOOJ6OTZiN7Veg6gj61hPDyTf/iT+Y5Gi/b8=;
 b=6/+Bd4w7RU4WoIFaDA3c/b/l3jLkLU7SLaMaOVvMHojxpWgnhYY/MTq7eQecd7hwQFaFqlo2N/Dm9
 /HchE+lDA==
X-HalOne-ID: 81500d17-0c78-11ee-a7d1-55333ba73462
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 81500d17-0c78-11ee-a7d1-55333ba73462;
 Fri, 16 Jun 2023 19:03:41 +0000 (UTC)
Date: Fri, 16 Jun 2023 21:03:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/5] drm/bridge: tc358762: Instruct DSI host to generate
 HSE packets
Message-ID: <20230616190340.GH1697490@ravnborg.org>
References: <20230615201902.566182-1-marex@denx.de>
 <20230615201902.566182-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615201902.566182-3-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 10:19:00PM +0200, Marek Vasut wrote:
> This bridge seems to need the HSE packet, otherwise the image is
> shifted up and corrupted at the bottom. This makes the bridge
> work with Samsung DSIM on i.MX8MM and i.MX8MP.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

(Not that I know the register or such, but the patch looks good).

> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/tc358762.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 5e00c08b99540..77f2ec9de9e59 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -241,7 +241,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
>  	dsi->lanes = 1;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -			  MIPI_DSI_MODE_LPM;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO_HSE;
>  
>  	ret = tc358762_parse_dt(ctx);
>  	if (ret < 0)
> -- 
> 2.39.2
