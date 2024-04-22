Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A91C8ACEF6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81543112B2A;
	Mon, 22 Apr 2024 14:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="ka1jsMQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDEA112B27
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID; bh=+8Sght38akXrLxpc8bIOrp7sk/H8IvN8R0IpAuGFtqg=; b=ka1jsM
 QoDI/leDOzmbaV9BZzCqMrm4r7sNDO7UV5WafQaSmnI59TzSKjAxpUIT1Dd3uwyqI9Yxb/FPFx1TQ
 cxyn7zmfwuIqR7a0HlHzZ6Db50kKVl5paNJ1n+Drnvf0N0cDsxCYHsgcTjMY82o93KNXXur6wU3WY
 nhYqjXSKvQJBvLlW+65d0Nowjg/BMMah78kfDXvJZMnCXzV3h7Moa9jLR//Y083CZtVP/OL79uonI
 Ts3yYDebuxJjC1hcrnkT86KLlOjqi/oB5zXYFfI+AZHlIrn4Y8+sOx3xBdlQIx3mb2yUAal+E1u1b
 zFDSu2lRup1vChyHGg6Dh8aQAfMw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1ryuIX-0000qj-Vk; Mon, 22 Apr 2024 16:05:34 +0200
Received: from [2a06:4004:10df:0:781f:1970:8d00:73ed]
 (helo=Seans-MBP.snzone.dk)
 by sslproxy07.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1ryuIW-000Jz9-2W;
 Mon, 22 Apr 2024 16:05:32 +0200
Date: Mon, 22 Apr 2024 16:05:31 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Robert Foss <rfoss@kernel.org>,
 Antonio Borneo <antonio.borneo@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/stm: dsi: relax mode_valid clock tolerance
Message-ID: <lkrxoqhcitmvjvzslhx6mrdjaa6lpxtpmdjt7wwollm6z4h65q@jk5esjje6ppy>
References: <20240322104732.2327060-1-sean@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240322104732.2327060-1-sean@geanix.com>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27253/Mon Apr 22 10:25:51 2024)
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

On Fri, Mar 22, 2024 at 11:47:31AM +0100, Sean Nyekjaer wrote:
> When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> to reguire the requested and the actual px clock to be within
> 50Hz. A typical LVDS display requires the px clock to be within +-10%.
> 
> In case for HDMI .5% tolerance is required.
> 
> Fixes: e01356d18273 ("drm/stm: dsi: provide the implementation of mode_valid()")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
Any feedback on this?

>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index d5f8c923d7bc..97936b0ef702 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -322,8 +322,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
>  	return 0;
>  }
>  
> -#define CLK_TOLERANCE_HZ 50
> -
>  static enum drm_mode_status
>  dw_mipi_dsi_stm_mode_valid(void *priv_data,
>  			   const struct drm_display_mode *mode,
> @@ -375,9 +373,10 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
>  		/*
>  		 * Filter modes according to the clock value, particularly useful for
>  		 * hdmi modes that require precise pixel clocks.
> +		 * Check that px_clock is within .5% tolerance.
>  		 */
> -		if (px_clock_hz < target_px_clock_hz - CLK_TOLERANCE_HZ ||
> -		    px_clock_hz > target_px_clock_hz + CLK_TOLERANCE_HZ)
> +		if (px_clock_hz < mult_frac(target_px_clock_hz, 995, 1000) ||
> +		    px_clock_hz > mult_frac(target_px_clock_hz, 1005, 1000))
>  			return MODE_CLOCK_RANGE;
>  
>  		/* sync packets are codes as DSI short packets (4 bytes) */
> -- 
> 2.44.0
> 
